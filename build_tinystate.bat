@echo off

echo Building Custom SM Practice Hack

cd build
echo Building and pre-patching tinystates version
cp sm_orig.sfc Custom_InfoHUD_TinyStates_2.6.X.sfc && cd ..\src && ..\tools\asar\asar.exe --no-title-check -DFEATURE_TINYSTATES=1 main.asm ..\build\Custom_InfoHUD_TinyStates_2.6.X.sfc && cd ..

PAUSE
