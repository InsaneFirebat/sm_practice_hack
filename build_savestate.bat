@echo off

echo Building InsaneFirebat's SM Practice Hack

cd build
echo Building and pre-patching savestate extras version
cp sm_orig.sfc FastBuildTest_saving.sfc && cd ..\src && ..\tools\asar\asar.exe --no-title-check -DFEATURE_SD2SNES=1 -DFEATURE_PAL=0 -DFEATURE_EXTRAS=1 main.asm ..\build\FastBuildTest_saving.sfc && cd ..

PAUSE