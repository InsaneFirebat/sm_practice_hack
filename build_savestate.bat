@echo off

echo Building InsaneFirebat's SM Practice Hack

cd build
echo Building and pre-patching savestate extras version
cp sm_orig.sfc Firebat_InfoHUD_Savestates_2.5.X.sfc && cd ..\src && ..\tools\asar\asar.exe --no-title-check -DFEATURE_SD2SNES=1 -DFEATURE_EXTRAS=1 main.asm ..\build\Firebat_InfoHUD_Savestates_2.5.X.sfc && cd ..

PAUSE