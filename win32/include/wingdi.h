// the wingdi.h
#ifndef _WINGDI_H
#define _WINGDI_H
#include "windef.h"
#define RGB(r,g,b) ((DWORD)(((BYTE)(r)|((WORD)((BYTE)(g))<<8))|(((DWORD)(BYTE)(b))<<16)))

HDC GetDC(HWND hWnd);
int ReleaseDC(HWND hWnd, HDC, hDC);
void Rectangle(HDC hDC, int left, int right, int top, int bottom);

#endif // _WINGDI_H
