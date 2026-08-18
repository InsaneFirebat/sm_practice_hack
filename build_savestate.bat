@echo off

echo Building Custom SM Practice Hack

echo Building and pre-patching savestate version
copy resources\sm_orig.sfc build\Custom_InfoHUD_Savestates_2.7.X.sfc && tools\asar\asar.exe --no-title-check -DFEATURE_SD2SNES=1 src\main.asm build\Custom_InfoHUD_Savestates_2.7.X.sfc

PAUSE
