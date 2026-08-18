@echo off

echo Building InsaneFirebat's SM Practice Hack

cd build
echo Building and pre-patching saveless extras version
copy resources\smpal_orig.sfc buildFastPALBuildTest.sfc && tools\asar\asar.exe --no-title-check -DFEATURE_TINYSTATES=0 -DFEATURE_PAL=1 src\main.asm build\FastPALBuildTest.sfc && cd ..

PAUSE