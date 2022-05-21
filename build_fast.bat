@echo off

echo Building SM Practice Hack

cd build
echo Building and pre-patching saveless version
cp sm_orig.sfc Custom_InfoHUD_2.4.X.sfc && cd ..\src && ..\tools\asar\asar.exe --no-title-check -DFEATURE_SD2SNES=0 -DFEATURE_TINYSTATES=1 -DFEATURE_PAL=0 -DFEATURE_EXTRAS=0 main.asm ..\build\Custom_InfoHUD_2.4.X.sfc && cd ..

PAUSE
