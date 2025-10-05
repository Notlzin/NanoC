// were finally using a real .h file... because yes
#ifndef _WINDOWS_H
#define _WINDOWS_H
#include "windef.h"
#include "kernel32.h"
#include "hbash.h"
#include "wingdi.h"
#include "winuser.h"

// also a plus: GPT created LOL

#define INFINITE           0xFFFFFFFFu
#define WAIT_OBJECT_0      0x00000000u
#define WAIT_TIMEOUT       0x00000102u

#define GENERIC_READ       0x80000000u
#define GENERIC_WRITE      0x40000000u
#define FILE_SHARE_READ    0x00000001u
#define FILE_SHARE_WRITE   0x00000002u
#define CREATE_ALWAYS      2
#define OPEN_EXISTING      3
#define FILE_ATTRIBUTE_NORMAL 0x00000080u
#define FILE_FLAG_OVERLAPPED 0x40000000u

#define MEM_COMMIT         0x1000
#define MEM_RESERVE        0x2000
#define PAGE_READWRITE     0x04

#define SW_SHOW            5
#define SW_HIDE            0
#define WINAPI
#define HWND int32t
#define HINSTANCE int32t
#define LPCSTR char*
#define UINT unsigned int32t
#define HBASH int32t, int32t // screen width + height
#define HTEXT int32t, int32t // font size + text pos
#define HBASH_BACK_COLOR char*
#define HBASH_TEXT_COLOR char*

// MessageBoxA prototype
int32t WINAPI MessageBoxA(HWND hWnd, LPCSTR lpText, LPCSTR lpCapt, UINT uType);
int32t WINAPI BashScreen(HWND hWnd, LPCSTR lpText, LPCSTR lpCapt, UINT uType, HBASH 400, 300, HTEXT 0, 0, HBASH_BACK_COLOR black, HBASH_TEXT_COLOR white);

// end of the line
#endif
