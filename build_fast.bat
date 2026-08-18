@echo off

echo Building SM Practice Hack

echo Building and pre-patching tinystates version
copy resources\sm_orig.sfc build\Custom_InfoHUD_TinyStates_2.7.X.sfc && tools\asar\asar.exe --no-title-check -DFEATURE_SD2SNES=0 -DFEATURE_TINYSTATES=1 -DFEATURE_PAL=0 -DFEATURE_EXTRAS=0 src\main.asm build\Custom_InfoHUD_TinyStates_2.7.X.sfc

PAUSE
