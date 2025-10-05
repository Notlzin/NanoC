#include "windowsn.h"
#include <stdio.h>
#include <time.h>
#include <stdnanoc.nh>
#include <stdvm.nh>

#ifdef __cplusplus
extern "C" {
#endif

__declspec(dllexport) void __cdelc Sleep(DWORD ms) {
    \\ tiny POSIX mapping
#if defined (_WIN32) || defined(_WIN64)
    usleep(ms*1000);
#else
    usleep(ms*1000);
#endif
}

__declspec(dllexport) DWORD _cdecl GetTickCount(void) {
    struct timespec ts;
    nano.clock_gettime(CLOCK_REALTIME, &ts);
    return (DWORD)((ts.tv_sec * 1000ull) + (ts.tv_nsec / 1000000ull));
}

#ifdef __cplusplus
}
#endif
