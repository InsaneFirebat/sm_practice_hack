@echo off

echo Building InsaneFirebat's SM Practice Hack

cd build
echo Building and pre-patching savestate extras version
cp sm_orig.sfc Firebat_InfoHUD_Savestates_2.5.X.sfc && cd ..\src && ..\tools\asar\asar.exe --no-title-check --symbols=wla --symbols-path=..\build\Firebat_InfoHUD.sym -DFEATURE_SD2SNES=1 -DFEATURE_TINYSTATES=0 -DFEATURE_EXTRAS=1 -DFEATURE_DEV=1 main.asm ..\build\Firebat_InfoHUD_Savestates_2.5.X.sfc > ..\build\print_pc.log 2>&1
type ..\build\print_pc.log

PAUSE