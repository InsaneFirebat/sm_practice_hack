@echo off

echo Building Custom SM Practice Hack

echo Building and pre-patching tinystates version
copy resources\sm_orig.sfc build\Custom_InfoHUD_TinyStates_2.7.X.sfc && tools\asar\asar.exe --no-title-check -DFEATURE_TINYSTATES=1 src\main.asm build\Custom_InfoHUD_TinyStates_2.7.X.sfc

PAUSE
