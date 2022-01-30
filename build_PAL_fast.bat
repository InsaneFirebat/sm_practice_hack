@echo off

echo Building InsaneFirebat's SM Practice Hack

cd build
echo Building and pre-patching saveless extras version
cp smpal_orig.sfc FastPALBuildTest.sfc && cd ..\src && ..\tools\asar\asar.exe --no-title-check -DFEATURE_SD2SNES=0 -DFEATURE_PAL=1 -DFEATURE_EXTRAS=0 -DNEW_PHANTOON_RNG=0 main.asm ..\build\FastPALBuildTest.sfc && cd ..

PAUSE