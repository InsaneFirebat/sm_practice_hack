@echo off

echo Testing all builds of InsaneFirebat's custom SM Practice Hack
copy resources\sm_orig.sfc build\FastBuildDevTest.sfc

echo First up is savestates on NTSC
tools\asar\asar.exe --no-title-check -DFEATURE_DEV=0 -DFEATURE_SD2SNES=1 -DFEATURE_TINYSTATES=0 -DFEATURE_PAL=0 -DFEATURE_EXTRAS=1 src\main.asm build\FastBuildDevTest.sfc
echo ]==============================================================================[
echo Progress: 1/11

echo Next up is tinystates on NTSC
tools\asar\asar.exe --no-title-check -DFEATURE_DEV=0 -DFEATURE_SD2SNES=0 -DFEATURE_TINYSTATES=1 -DFEATURE_PAL=0 -DFEATURE_EXTRAS=1 src\main.asm build\FastBuildDevTest.sfc
echo ]==============================================================================[
echo Progress: 2/11

echo Next up is no savestates on NTSC
tools\asar\asar.exe --no-title-check -DFEATURE_DEV=0 -DFEATURE_SD2SNES=0 -DFEATURE_TINYSTATES=0 -DFEATURE_PAL=0 -DFEATURE_EXTRAS=1 src\main.asm build\FastBuildDevTest.sfc
echo ]==============================================================================[
echo Progress: 3/11

echo Next up is savestates with vanilla HUD on NTSC
tools\asar\asar.exe --no-title-check -DFEATURE_DEV=1 -DFEATURE_SD2SNES=1 -DFEATURE_TINYSTATES=0 -DFEATURE_PAL=0 -DFEATURE_EXTRAS=1 -DFEATURE_VANILLAHUD=1 src\main.asm build\FastBuildDevTest.sfc
echo ]==============================================================================[
echo Progress: 4/11

echo Next up is tinystates with vanilla HUD on NTSC
tools\asar\asar.exe --no-title-check -DFEATURE_DEV=1 -DFEATURE_SD2SNES=0 -DFEATURE_TINYSTATES=1 -DFEATURE_PAL=0 -DFEATURE_EXTRAS=1 -DFEATURE_VANILLAHUD=1 src\main.asm build\FastBuildDevTest.sfc
echo ]==============================================================================[
echo Progress: 5/11  (NTSC completed)

echo Next up is savestates on PAL
tools\asar\asar.exe --no-title-check -DFEATURE_DEV=0 -DFEATURE_SD2SNES=1 -DFEATURE_TINYSTATES=0 -DFEATURE_PAL=1 -DFEATURE_EXTRAS=1 src\main.asm build\FastBuildDevTest.sfc
echo ]==============================================================================[
echo Progress: 6/11

echo Next up is tinystates on PAL
tools\asar\asar.exe --no-title-check -DFEATURE_DEV=0 -DFEATURE_SD2SNES=0 -DFEATURE_TINYSTATES=1 -DFEATURE_PAL=1 -DFEATURE_EXTRAS=1 src\main.asm build\FastBuildDevTest.sfc
echo ]==============================================================================[
echo Progress: 7/11

echo Next up is no savestates on PAL
tools\asar\asar.exe --no-title-check -DFEATURE_DEV=0 -DFEATURE_SD2SNES=0 -DFEATURE_TINYSTATES=0 -DFEATURE_PAL=1 -DFEATURE_EXTRAS=1 src\main.asm build\FastBuildDevTest.sfc
echo ]==============================================================================[
echo Progress: 8/11

echo Next up is savestates with vanilla HUD on PAL
tools\asar\asar.exe --no-title-check -DFEATURE_DEV=1 -DFEATURE_SD2SNES=1 -DFEATURE_TINYSTATES=0 -DFEATURE_PAL=1 -DFEATURE_EXTRAS=1 -DFEATURE_VANILLAHUD=1 src\main.asm build\FastBuildDevTest.sfc
echo ]==============================================================================[
echo Progress: 9/11

echo Next up is tinystates with vanilla HUD on PAL
tools\asar\asar.exe --no-title-check -DFEATURE_DEV=1 -DFEATURE_SD2SNES=0 -DFEATURE_TINYSTATES=1 -DFEATURE_PAL=1 -DFEATURE_EXTRAS=1 -DFEATURE_VANILLAHUD=1 src\main.asm build\FastBuildDevTest.sfc
echo ]==============================================================================[
echo Progress: 10/11  (PAL completed)

echo Final build is savestates extras developer version
tools\asar\asar.exe --no-title-check --symbols=wla --symbols-path=build\Custom_InfoHUD.sym -DFEATURE_DEV=1 -DFEATURE_SD2SNES=1 -DFEATURE_TINYSTATES=0 -DFEATURE_PAL=0 -DFEATURE_EXTRAS=1 src\main.asm build\FastBuildDevTest.sfc > build\print_pc.log 2>&1
type build\print_pc.log

echo All builds completed

PAUSE
