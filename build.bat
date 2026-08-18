
@echo off

echo Building InsaneFirebat's SM Practice Hack

echo Building and pre-patching tinystates version
copy resources\sm_orig.sfc build\Firebat_InfoHUD_Tinystates_2.7.X.sfc && tools\asar\asar.exe --no-title-check -DFEATURE_SD2SNES=0 -DFEATURE_TINYSTATES=1 -DFEATURE_PAL=0 -DFEATURE_EXTRAS=1 -DFEATURE_DEV=1 --symbols=wla --symbols-path="C:\Users\InsaneFirebat\Emulation\SNES\ROMS\Debugging Labels\Firebat_Tinystates.sym" src\main.asm build\Firebat_InfoHUD_Tinystates_2.7.X.sfc

echo Building and pre-patching savestate extras version
copy resources\sm_orig.sfc build\Firebat_InfoHUD_Savestates_2.7.X.sfc && tools\asar\asar.exe --no-title-check -DFEATURE_SD2SNES=1 -DFEATURE_TINYSTATES=0 -DFEATURE_PAL=0 -DFEATURE_EXTRAS=1 -DFEATURE_DEV=1 --symbols=wla --symbols-path="C:\Users\InsaneFirebat\Emulation\SNES\ROMS\Debugging Labels\Firebat_Savestates.sym" src\main.asm build\Firebat_InfoHUD_Savestates_2.7.X.sfc > build\print_pc.log 2>&1
type build\print_pc.log

PAUSE
