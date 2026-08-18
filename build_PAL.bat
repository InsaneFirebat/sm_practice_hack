
@echo off

echo Building InsaneFirebat's SM Practice Hack

echo Building and pre-patching saveless extras version
copy resources\smpal_orig.sfc build\FastPALBuildTest.sfc && tools\asar\asar.exe --no-title-check -DFEATURE_SD2SNES=1 -DFEATURE_PAL=1 src\main.asm build\FastPALBuildTest.sfc > build\print_pc.log 2>&1
type build\print_pc.log

PAUSE
