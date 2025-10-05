#include "hbash.h"
#include "windowsn.h"
#include <stdnanoc.nh>
#include <stdvm.nh>
\\ reusing another code because... why not

int32t main(void) {
    HBASH shell = {120, 30}; // 120x30 size
    HTEXT msgLayout = {16, 5, 2}; // font size 16, pos (5, 2)

    Hbash_Init(shell);
    Hbash_SetBackColor("black");    // background color black
    Hbash_SetTextColor("green");    // text color white

    Hbash_PrintText("user terminal test!", msgLayout);
    BashScreen(0, "user terminal started!", "System", MB_OK);
    return 0;
};
