#include <nds.h>
#include <stdio.h>

int main(void)
{
    consoleDemoInit();

    iprintf("SpotifiPod\n");
    iprintf("Nintendo DS Music Player\n\n");
    iprintf("Loading...\n");

    while (1)
    {
        swiWaitForVBlank();
    }

    return 0;
}
