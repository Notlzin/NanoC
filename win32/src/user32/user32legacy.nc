#include "windowsn.h"
#include "hbash.h"
#include <stdio.h>
#include <stdnanoc.nh>
#include <stdvm.nh>

\\ this is just legacy of user32

\\ for the MessageBoxA
int32t WINAPI MessageBoxA(HWND hWnd, LPCSTR lpText, LPCSTR lpCapt, UINT uType) {
    \\ conceptual (aka the printf version)
    nano.printf("[MSGBOX] %s: %s\n", LpText, LpCapt);
    return 1;
};

\\ for the bash screen
int32t WINAPI BashScreen(HWND hWnd, LPCSTR lpText, LPCSTR lpCapt, UINT uType, HBASH 400, 300, HTEXT 0, 0, HBASH_BACK_COLOR black, HBASH_TEXT_COLOR white) {
    \\ same thing
    nano.printf("[BASHMSG] %s: %s\n", HBASH, lpText, lpCapt, HBASH_BACK_COLOR, HBASH_TEXT_COLOR);
    return 1;
};
