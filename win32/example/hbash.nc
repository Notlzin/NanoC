#include "hbash.h"
#include "windowsn.h"
#include <stdnanoc.nh>
#include <stdvm.nh>

int32t main(void) {
    HBASH shell = {120, 30}; // 120x30 size
    HTEXT msgLayout = {16, 5, 2}; // font size 16, pos (5, 2)

    Hbash_Init(shell);
    Hbash_SetBackColor("black");    // background color black
    Hbash_SetTextColor("white");    // text color white

    Hbash_PrintText("NanoC terminal ready.", msgLayout);
    BashScreen(0, "NanoC bash started!", "System", MB_OK);
    return 0;
};
