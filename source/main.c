#include <nds.h>
#include <stdio.h>

int main(void)
{
    // Enable 2D graphics on both screens
    videoSetMode(MODE_0_2D);
    videoSetModeSub(MODE_0_2D);

    // Initialize console (for text output)
    consoleDemoInit();

    iprintf("SpotifiPod\n");
    iprintf("Spotify for Nintendo DS\n\n");

    iprintf("Initializing...\n");
    iprintf("Assets loaded from /data\n");

    while (1)
    {
        swiWaitForVBlank();
    }

    return 0;
}
