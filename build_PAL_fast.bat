@echo off

echo Building InsaneFirebat's SM Practice Hack

cd build
echo Building and pre-patching saveless extras version
copy smpal_orig.sfc FastPALBuildTest.sfc && cd ..\src && ..\tools\asar\asar.exe --no-title-check -DFEATURE_TINYSTATES=0 -DFEATURE_PAL=1 main.asm ..\build\FastPALBuildTest.sfc && cd ..

PAUSE