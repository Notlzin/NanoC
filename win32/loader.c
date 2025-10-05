// loader.c LOL

#include <windows.h>
#include <stdio.h>

typedef int (__cdecl *MSGBOX_A)(void*, const char*, const char*, unsigned int);
typedef void (__cdecl *NANOV)(char*, size_t);

int main(void) {
    HMODULE h = LoadLibraryA("nanodll.dll");
    if (!h) {
        printf("LoadLibrary failed (can't find nanodll.dll)\n"); return 1;
    }

    MSGBOX_A m = (MSGBOX_A)GetProcAddress(h, "MessageBoxA");
    NANOV v = (NANOV)GetProcAddress(h, "NanoC_Version");

    if (!m) {
        printf("GetProcAddress(MessageBoxA) failed\n");
    } else {
        m(NULL, "Hello from loader.exe", "NanoDLL Test", 0);
    }
    if (v) {
        char buf[128];
        v(buf, sizeof(buf));
        printf("NanoDLL reports: %s\n", buf);
    }
    FreeLibrary(h);
    return 0;
}
