@echo off

echo Building InsaneFirebat's SM Practice Hack

cd build
echo Building and pre-patching saveless extras version
cp sm_orig.sfc FastBuildTest.sfc && cd ..\src && ..\tools\asar\asar.exe --no-title-check -DFEATURE_SD2SNES=0 -DFEATURE_PAL=0 -DFEATURE_EXTRAS=1 -DNEW_PHANTOON_RNG=1 -DFEATURE_DEV=1 main.asm ..\build\FastBuildTest.sfc && cd ..

PAUSE