@echo off

echo Building InsaneFirebat's custom SM Practice Hack

echo Generating symbols.asm
python tools\python\create_ram_symbols.py ..\..\src\defines.asm ..\..\src\symbols.asm

echo Building and pre-patching savestates extras developer version
copy resources\sm_orig.sfc build\FastBuildDevTest.sfc && tools\asar\asar.exe --no-title-check --symbols=wla --symbols-path=build\Custom_InfoHUD.sym -DFEATURE_DEV=1 -DFEATURE_SD2SNES=1 -DFEATURE_TINYSTATES=0 -DFEATURE_PAL=0 -DFEATURE_EXTRAS=1 src\main.asm build\FastBuildDevTest.sfc > build\print_pc.log 2>&1
type build\print_pc.log

PAUSE
