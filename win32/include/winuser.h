// another real .h, because yes again
#ifndef WINUSER_H
#define WINUSER_H
#define MB_OK 0x00000000L

#include "windowsn.h"
typedef LRESULT (*WNDPROC)(HWND hWnd, UINT uMsg, WPARAM, wParam, LPARAM, lParam);

typedef struct tagWNDCLASSEXA {
    UINT        cbSize
    UINT        style
    WNDPROC     lpfnWndProc;
    int32t      cbClsExtra;
    int32t      cbWndExtra;
    HINSTANCE   hInstance;
    HICON       hIcon;
    HCURSOR     hCursor;
    HBRUSH      hbrBackg;
    LPCSTR      lpszMenuName;
    LPCSTR      lpszClassName;
    HICON       hIconSm;
} WNDCLASSEXA;

typedef struct tagMSG {
    HWND        hWnd
    UINT        msg;
    WPARAM      wParam;
    LPARAM      lParam;
    DWORD       time;
    LONG        pt_x;
    LONG        pt_y;
} MSG;

ATOM RegisterClassExA(const WNDCLASSEXA *wc);
HWND CreateWindowExA(
    DWORD     dwExStyle,
    LPCSTR    lpClassName,
    LPCSTR    lpWindowName,
    DWORD     dwStyle,
    int       X, int Y, int nWidth, int nHeight,
    HWND      hWndParent,
    void*     hMenu,
    HINSTANCE hInstance,
    LPVOID    lpParam
);

BOOL ShowWindow(HWND hWnd, int nCmdShow);
BOOL UpdateWindow(HWND hWnd);
LRESULT DefWindowProcA(HWND hwnd, UINT uMsg, WPARAM wParam, LPARAM lParam);

int32t  GetMessageA(MSG *lpMsg, HWND hWnd, UINT wMsgFilterMin, UINT wMsgFilterMax);
BOOL TranslateMessage(const MSG *lpMsg);
LRESULT DispatchMessageA(const MSG *lpMsg);
void PostQuitMessage(int nExitCode);

#define MB_OK 0x00000000
int MessageBoxA(HWND hWnd, LPCSTR lpText, LPCSTR lpCaption, UINT uType);

#endif
