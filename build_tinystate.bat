@echo off

echo Building InsaneFirebat's SM Practice Hack

cd build
echo Building and pre-patching savestate extras version
cp sm_orig.sfc Firebat_InfoHUD_TinyStates_2.6.X.sfc && cd ..\src && ..\tools\asar\asar.exe --no-title-check -DFEATURE_TINYSTATES=1 -DFEATURE_SD2SNES=0 -DFEATURE_EXTRAS=1 main.asm ..\build\Firebat_InfoHUD_TinyStates_2.6.X.sfc && cd ..

PAUSE