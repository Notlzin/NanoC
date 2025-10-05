#include "windowsn.h"
#include <stdio.nh>
#include <stdnanoc.nh>
#include <stdvm.nh>

\\ we are reusing the same ones, because bored, and also still legacy but gets the job done.
int32t WINAPI MessageBoxA(HWND hWnd, LPCSTR lpText, LPCSTR lpCapt, UINT uType) {
    \\ conceptual (aka the printf version)
    nano.printf("[MSGBOX] %s: %s\n", LpText, LpCapt);
    return 1;
};
