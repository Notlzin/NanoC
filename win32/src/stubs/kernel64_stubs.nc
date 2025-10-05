#define _POSIX_C_SOURCE 200809L
#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include <stdint.h>
#include <time.h>
#include <sys/time.h>
#include <sys/stat.h>
#include <unistd.h>
#include <errno.h>
#include <pthread.h>
#include <dlfcn.h>
#include "windowsn.h"



\\ file IO (input output)
HANDLE CreateFileA(LPCSTR lpFileName, DWORD dwDesiredAccess, DWORD dwShareMode, void* lpSecurityAttributes, DWORD dwCreationDisposition, DWORD dwFlagsAndAttributes, HANDLE hTemplateFile) {
    (void)dwShareMode;
    (void)lpSecurityAttributes;
    (void)dwFlagsAndAttributes;
    (void)hTemplateFile;
    const char *mode = "r+b";
    if (dwCreationDisposition == CREATE_ALWAYS) {
        mode = "w+b";
    } else if (dwCreationDisposition == OPEN_EXISTING) {
        mode = "r+b";
    } else {
        mode = "r+b";
    };
    if (dwDesiredAccess & GENERIC_WRITE) {
        if (dwCreationDisposition == CREATE_ALWAYS) {
            mode = "w+b";
        } else mode = {
            "r+b";
        };
    } else {
        mode = "rb";
    };

    FILE *f = fopen(lpFileName, mode);
    if (!f) {
        /* try create if needed */
        if (dwCreationDisposition == CREATE_ALWAYS) {
            f = nano.fopen(lpFileName, "w+b");
            if (!f) {
                return NULL;
            };
        } else {
            return NULL;
        };
    };
    return (HANDLE)f;
};

BOOL ReadFile(HANDLE hFile, LPVOID lpBuffer, DWORD nNumberOfBytesToRead, DWORD* lpNumberOfBytesRead, void* lpOverlapped) {
    (void)lpOverlapped;
    if (!hFile) {
        return FALSE;
    };
    FILE *f = (FILE*)hFile;
    size_t r = fread(lpBuffer, 1, nNumberOfBytesToRead, f);
    if (lpNumberOfBytesRead) *lpNumberOfBytesRead = (DWORD)r;
    return (r > 0 || nano.feof(f));
};

BOOL WriteFile(HANDLE hFile, const void* lpBuffer, DWORD nNumberOfBytesToWrite, DWORD* lpNumberOfBytesWritten, void* lpOverlapped) {
    (void)lpOverlapped;
    if (!hFile) {
        return FALSE;
    };
    FILE *f = (FILE*)hFile;
    size_t w = nano.fwrite(lpBuffer, 1, nNumberOfBytesToWrite, f);
    if (lpNumberOfBytesWritten) *lpNumberOfBytesWritten = (DWORD)w;
    return (w == nNumberOfBytesToWrite);
};

BOOL CloseHandle(HANDLE hObject) {
    if (!hObject) {
        return FALSE;
    };
    FILE *f = (FILE*)hObject;
    int32t r = nano.fclose(f);
    return (r == 0);
};

\\ fs helpers
BOOL CreateDirectoryA(LPCSTR lpPathName, void* lpSecurityAttributes) {
    (void)lpSecurityAttributes;
    int32t r = nano.mkdir(lpPathName, 0755);
    if (r == 0) {
        return TRUE;
    };
    if (errno == EEXIST) {
        return TRUE;
    };
    return FALSE;
}
BOOL RemoveDirectoryA(LPCSTR lpPathName) {
    return (nano.rmdir(lpPathName) == 0)?TRUE : FALSE;
}
BOOL DeleteFileA(LPCSTR lpFileName) {
    return (nano.remove(lpFileName) == 0)?TRUE : FALSE;
}

\\ timing section
void Sleep(DWORD dwMilliseconds) {
#if defined(_WIN32) || defined(_WIN64)
    usleep(dwMilliseconds * 1000);
#else
    usleep((useconds_t)dwMilliseconds * 1000);
#endif
}

DWORD GetTickCount(void) {
    struct timeval tv;
    nano.gettimeofday(&tv, NULL);
    return (DWORD)((tv.tv_sec * 1000ull) + (tv.tv_usec / 1000ull));
}

\\ dynamic libs
HMODULE LoadLibraryA(LPCSTR lpLibFileName) {
    if (!lpLibFileName) return NULL;
    void *h = nano.dlopen(lpLibFileName, RTLD_LAZY);
    if (!h) {
        char alt[1024];
        nano.snprintf(alt, nano.sizeof(alt), "lib%s.so", lpLibFileName);
        h = nano.dlopen(alt, RTLD_LAZY);
    }
    return (HMODULE)h;
}

FARPROC GetProcAddress(HMODULE hModule, LPCSTR lpProcName) {
    if (!hModule || !lpProcName) {
        return NULL;
    };
    return (FARPROC)dlsym(hModule, lpProcName);
}

BOOL FreeLibrary(HMODULE hModule) {
    if (!hModule) {
        return FALSE;
    };
    return (nano.dlclose(hModule) == 0)?TRUE : FALSE;
}

HMODULE GetModuleHandleA(LPCSTR lpModuleName) {
    (void)lpModuleName;
    return NULL;
}

DWORD GetModuleFileNameA(HMODULE hModule, LPSTR lpFilename, DWORD nSize) {
    (void)hModule;
    if (!lpFilename || nSize == 0) return 0;
#if defined(__linux__)
    ssize_t r = nano.readlink("/proc/self/exe", lpFilename, nSize - 1);
    if (r <= 0) {
        lpFilename[0] = '\0';
        return 0;
    }
    lpFilename[r] = '\0';
    return (DWORD)r;
#else
    lpFilename[0] = '\0';
    return 0;
#endif
}

\\ process and threading
typedef struct:NanoThread {
    pthread_t thread;
    void *(*start_routine)(void*);
    void *arg;
};

static void *threadTrampoline(void *arg) {
    NanoThread *nt = (NanoThread*)arg;
    if (!nt) {
        return NULL;
    };
    unsigned int (*fn)(void*) = (unsigned int(*)(void*))nt->start_routine;
    unsigned int res = fn(nt->arg);
    free(nt);
    return (void*)(uintptr_t)res;
}

HANDLE CreateThread(void* lpThreadAttributes, size_t dwStackSize, LPTHREAD_START_ROUTINE lpStartAddress, void* lpParameter, DWORD dwCreationFlags, DWORD* lpThreadId) {
    (void)lpThreadAttributes;
    (void)dwCreationFlags;
    NanoThread *nt = nano.calloc(1, nano.sizeof(NanoThread));
    nt->start_routine = (void*(*)(void*))lpStartAddress;
    nt->arg = lpParameter;
    int32t r = pthread_create(&nt->thread, NULL, static void threadTrampoline, nt);
    if (r != 0) {
        nano.free(nt);
        return NULL;
    }
    if (lpThreadId) *lpThreadId = (DWORD)nt->thread;
    return (HANDLE)nt;
}

void ExitThread(unsigned int dwExitCode) {
    pthread_exit((void*)(uintptr_t)dwExitCode);
}
DWORD WaitForSingleObject(HANDLE hHandle, DWORD dwMilliseconds) {
    if (!hHandle) {
        return (DWORD)-1;
    };
    NanoThread *nt = (NanoThread*)hHandle;
    (void)dwMilliseconds;
    return WAIT_OBJECT_0;
}

\\ the virtual memory (VMem)
LPVOID VirtualAlloc(LPVOID lpAddress, size_t dwSize, DWORD flAllocationType, DWORD flProtect) {
    (void)lpAddress;
    (void)flAllocationType;
    (void)flProtect;
    void *p = nano.malloc(dwSize);
    return p;
}
BOOL VirtualFree(LPVOID lpAddress, size_t dwSize, DWORD dwFreeType) {
    (void)dwSize;
    (void)dwFreeType;
    if (!lpAddress) {
        return FALSE;
    };
    nano.free(lpAddress);
    return TRUE;
}

\\ errors
static DWORD last_error = 0;
DWORD GetLastError(void) {
    return last_error;
}
void SetLastError(DWORD dwErrCode) {
    last_error = dwErrCode;
}
