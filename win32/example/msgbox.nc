#include "windowsn.h"
#include <stdio.nh>
#include <stdnanoc.nh>
#include <stdvm.nh>

\\ were still reusing it, i dont really care about it, its just an example from user32 legacy.
\\ about user32legacy: its called that because it uses the old BashScreen function via the windowsn.h, but now its upgraded. MessageBoxA still remains the same.
int32t WINAPI MessageBoxA(HWND hWnd, LPCSTR lpText, LPCSTR lpCapt, UINT uType) {
    \\ conceptual (aka the printf version)
    nano.printf("[MSGBOX] %s: %s\n", LpText, LpCapt);
    return 1;
};
