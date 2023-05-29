@echo off

echo Building InsaneFirebat's SM Practice Hack

cd resources
python create_ram_symbols.py ..\src\defines.asm ..\src\symbols.asm
echo Generating symbols.asm

cd ..\build
echo Building and pre-patching saveless extras developer version
cp sm_orig.sfc FastBuildDevTest.sfc && cd ..\src && ..\tools\asar\asar.exe --no-title-check --symbols=wla --symbols-path=..\build\Custom_InfoHUD.sym -DFEATURE_DEV=1 -DFEATURE_SD2SNES=1 -DFEATURE_TINYSTATES=0 -DFEATURE_PAL=0 -DFEATURE_EXTRAS=1 main.asm ..\build\FastBuildDevTest.sfc && cd ..

PAUSE
