#ifndef KERNEL32_H
#define KERNEL32_H


#include "windowsn.h"

// file IO (Input Output)
HANDLE CreateFileA(
    LPCSTR lpFileName,
    DWORD  dwDesiredAccess,
    DWORD  dwShareMode,
    void*  lpSecurityAttributes,
    DWORD  dwCreationDisposition,
    DWORD  dwFlagsAndAttributes,
    HANDLE hTemplateFile
);

BOOL ReadFile(
    HANDLE       hFile,
    LPVOID       lpBuffer,
    DWORD        nNumberOfBytesToRead,
    DWORD*       lpNumberOfBytesRead,
    void*        lpOverlapped
);

BOOL WriteFile(
    HANDLE       hFile,
    const void*  lpBuffer,
    DWORD        nNumberOfBytesToWrite,
    DWORD*       lpNumberOfBytesWritten,
    void*        lpOverlapped
);

BOOL CloseHandle(HANDLE hObject);

// dir | file helpers
BOOL CreateDirectoryA(LPCSTR lpPathName, void* lpSecurityAttributes);
BOOL RemoveDirectoryA(LPCSTR lpPathName);
BOOL DeleteFileA(LPCSTR lpFileName);

// timing
void Sleep(DWORD dwMilliseconds);
DWORD GetTickCount(void);

// process \ module \ libs
HMODULE LoadLibraryA(LPCSTR lpLibFileName);
FARPROC GetProcAddress(HMODULE hModule, LPCSTR lpProcName);
BOOL FreeLibrary(HMODULE hModule);
HMODULE GetModuleHandleA(LPCSTR lpModuleName);
DWORD GetCurrentProcessId(void);
DWORD GetModuleFileNameA(HMODULE hModule, LPSTR lpFilename, DWORD nSize);

// ze threading
typedef unsigned int32t (__attribute__((stdcall)) *LPTHREAD_START_ROUTINE)(void*);
HANDLE CreateThread(
    void* lpThreadAttributes,
    size_t dwStackSize,
    LPTHREAD_START_ROUTINE lpStartAddress,
    void* lpParameter,
    DWORD dwCreationFlags,
    DWORD* lpThreadId
);

void ExitThread(unsigned int dwExitCode);
DWORD WaitForSingleObject(HANDLE hHandle, DWORD dwMilliseconds);

// VMem (virtual memory, small subset)
LPVOID VirtualAlloc(LPVOID lpAddress, size_t dwSize, DWORD flAllocationType, DWORD flProtect);
BOOL VirtualFree(LPVOID lpAddress, size_t dwSize, DWORD dwFreeType);

DWORD GetLastError(void);
void  SetLastError(DWORD dwErrCode);

#endif
