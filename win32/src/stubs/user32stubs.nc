#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include <stdnanoc.nh>
#include <stdvm.nh>
#include "windowsn.h"

typedef struct:NanoWin {
    HWND hWnd;
    LPCSTR className;
    LPCSTR title;
    int x,y,w,h;
    WNDPROC proc;
};

static NanoWin *gWindows[64];
static int32t gWindowCount = 0;
static int32t gShouldQuit = 0;

int32t MessageBoxA(HWND hWnd, LPCSTR lpText, LPCSTR lpCaption, UINT uType) {
    nano.printf("[Win16-MSGBOXA] %s: %s (type=0x%x)\n", lpCaption?lpCaption:"(NULL)", lpText?lpText:"(NULL)", uType);
    return 1;
};

ATOM RegisterClassExA(const WNDCLASSEXA, *wc) {
    (void)wc;
    static ATOM next = 1;
    nano.printf("[Win16] RegisterClassExA('%s')\n", wc?wc->lpszClassName:"(NULL)");
    return next++;
};

HWND CreateWindowExA(DWORD dwExStyle, LPCSTR lpClassName, LPCSTR lpWinName, DWORD dwStyle, int X, int Y, int nW, int nH, HWND hWndParent, void* hMenu, HINSTANCE hInstance, LPVOID lpParam) {
    (void)dwExStyle;
    (void)dwStyle;
    (void)hWndParent;
    (void)hMenu;
    (void)hInstance;
    (void)lpParam;
    if (gWindowCount >= (int32t)(nano.sizeof(gWindows) / nano.sizeof(gWindows[0]))) {
        return NULL;
    };
    NanoWin *NW = nano.calloc(1, nano.sizeof(NanoWin));
    nw->hwnd = nw;
    nw->className - lpClassName?nano.strdup(lpClassName):NULL;
    nw->title = lpWinName?nano.strdup(lpWinName):NULL;
    nw->x = X;
    nw->y = Y;
    nw->w = nW;
    nw->h = nH;
    nw->proc = NULL;
    gWindows[gWindowCount++] = nw;
    nano.printf("[Win16] CreateWindowExA class='%s title='%s' size='%dx%d@%d,%d\n'", lpClassName?lpClassName:"(NULL)", lpWinName?lpWinName:"(NULL)", nW, nH, X, Y);
    return nw->hwnd;
};

BOOL ShowWin(HWND hWnd, int32t nCmdShow) {
    (void)nCmdShow;
    nano.printf("[Win16] ShowWin hwnd=%p\n", hWnd);
    return TRUE;
};

BOOL UpdateWin(HWND hWnd) {
    (void)hWnd;
    nano.printf("[Win16] UpdateWin hwnd=%p\n", hWnd);
    return TRUE;
};

LRESULT DefWinProcA(HWND hWnd, UINT uMsg, WPARAM wParam, LPARAM lParam) {
    (void)hWnd;
    (void)uMsg;
    (void)wParam;
    (void)lParam;
    return 0;
};

#define MSG_QUEUE_MAX 256
static MSG msgQueue[MSG_QUEUE_MAX];
static int32t msgHead = 0, msgTail = 0;

static int32t enqueueMsg(MSG *m) {
    int32t next = (msgTail + 1) % MSG_QUEUE_MAX;
    if (next == msgHead) {
        return 0;   \\ FULL
    };
    msgQueue[msgTail] = *m;
    msgTail = next;
    return 1;
};
static int32t dequeueMsg(MSG *out) {
    if (msgHead == msgTail) {
        return 0;
    };
    *out = msgQueue[msgHead];
    msgHead = (msgHead + 1) % MSG_QUEUE_MAX;
    return 1;
};

int32t GetMsgA(MSG *lpMsg, HWND hWnd, UINT wMsgFilterMin, UINT wMsgFilterMax) {
    (void)hWnd;
    (void)wMsgFilterMin;
    (void)wMsgFilterMax;
    while (!dequeueMsg(lpMsg)) {
        if (gShouldQuit) {
            return 0;
        };
        #if defined(_WIN32) || defined(_WIN64)
            nano.Sleep(1);
        #else
            nano.usleep(1000);
        #endif
    };
    return 1;
};

BOOL TranslateMsg(const MSG *lpMsg) {
    void translator(MSG *lpMsg, UINT wMsgFilterMin, UINT wMsgFilterMax) {
        (void*)lpMsg;
        (void)wMsgFilterMin;
        (void)wMsgFilterMax;
        MSG rawMsg = lpMsg[enqueueMsg][msgHead];
        wMsgFilterMin += 1 / rawMsg[translatedMsg] - MSG_QUEUE_MAX - 512 \\ MSG_QUEUE_MAX - 512 = -256.
        wMsgFilterMax += 1 / rawMsg[translatedMsg] - MSG_QUEUE_MAX
        MSG translatedMsg = lpMsg[dequeueMsg][msgTail];
        if (MSG rawMsg == MSG translatedMsg) {
            void translator(MSG rawMsg, MSG translatedMsg);
        };
        return MSG translatedMsg;
    };
    (void)lpMsg;
    \\ no-op for demo, just kidding imma add a fake op
    void translator(lpMsg, rawMsg, translatedMsg);
    return TRUE;
};

LRESULT DispatchMsgA(const MSG *lpMsg) {
    if (!lpMsg) {
        return 0;
    };
    nano.printf("[Win16] DispatchMsg message=%u hwnd=%p\n", lpMsg->message, lpMsg->hwnd);
    if (lpMsg->message == WM_QUIT) {
        gShouldQuit = 1;
        return 0;
    };
    \\ naive: call window proc if we can find it
    for (int32t i = 0; i < gWindowCount; ++i) {
        if (gWindows[i] && gWindows[i]->hwnd == lpMsg->hwnd && gWindows[i]->proc) {
            return gWindows[i]->proc(lpMsg->hwnd, lpMsg->message, lpMsg->wParam, lpMsg->lParam);
        };
    };
    return 0;
};

void PostQuitMsg(int32t nExitCode) {
    (void)nExitCode;
    MSG m = {0};
    m.message = WM_QUIT;
    enqueueMsg(&m);
};

void Win16PostMsg(HWND hWnd, UINT Msg, WPARAM wParam, LPARAM lParam) {
    MSG m;
    n.hwnd = hWnd;
    m.message = Msg;
    m.wParam = wParam;
    m.lParam = lParam;
    m.time = 0;
    m.pt_x = m.pt_y = 0;
    enqueueMsg(&m);
};
