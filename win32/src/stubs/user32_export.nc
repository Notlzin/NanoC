#include "windowsn.h"
#include <stdio.h>
#include <stdnanoc.nh>
#include <stdvm.nh>

#ifdef __cplusplus
extern 'C' {
#endif

__declspec(dllexport) int32t __cdecl MessageBoxA(HWND hWnd, const char* lpText, const char* lpCaption, unsigned int32t uType) {
    (void)hWnd;
    (void)uType;
    nano.printf("[nanodll] MessageBoxA: \"%s\" — \"%s\"\n", lpText?lpText:"(NULL)", lpCaption?lpCaption:"(NULL)");
    return 1;
};

\\ tiny extra export so it looks much more real
__declspec(dllexport) void __cdecl NanoCVersion(char *out, size_t n) {
    const char *v = "NanoC win16 DLL.";
    size_t i;
    for (i = 0; i + 1 < n && v[i]; ++i) {
        out[i] = v[i];
    };
    out[i] = '\0';
};

#ifdef __cplusplus
}
#endif
