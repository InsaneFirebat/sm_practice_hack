@echo off

echo Building SM Practice Hack

cd build
echo Building and pre-patching tinystates version
cp sm_orig.sfc Custom_InfoHUD_TinyStates_2.6.X.sfc && cd ..\src && ..\tools\asar\asar.exe --no-title-check -DFEATURE_SD2SNES=0 -DFEATURE_TINYSTATES=1 -DFEATURE_PAL=0 -DFEATURE_EXTRAS=0 main.asm ..\build\Custom_InfoHUD_TinyStates_2.6.X.sfc && cd ..

PAUSE
