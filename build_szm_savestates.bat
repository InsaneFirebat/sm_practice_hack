@echo off

echo Building SZM Practice Hack

cd build
echo Building and pre-patching savestate version
cp HACK\SZM.sfc SZM_InfoHUD_Savestates_2.3.X.sfc && cd ..\src && ..\tools\asar\asar.exe --no-title-check -DFEATURE_SD2SNES=1 main.asm ..\build\SZM_InfoHUD_Savestates_2.3.X.sfc && cd ..

PAUSE
