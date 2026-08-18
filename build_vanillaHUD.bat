@echo off

echo Building InsaneFirebat's SM Practice Hack

echo Building and pre-patching tinystates VanillaHUD version
copy resources\sm_orig.sfc build\Custom_VanillaHUD_2.7.X.sfc && tools\asar\asar.exe --no-title-check -DFEATURE_SD2SNES=0 -DFEATURE_TINYSTATES=1 -DFEATURE_VANILLAHUD=1 src\main.asm build\Custom_VanillaHUD_2.7.X.sfc

PAUSE
