@echo off

echo Building SMBIHY Practice Hack

cd build
echo Building and pre-patching savestate version
copy HACK\SMBIHY.sfc aaaa_SMBIHY.sfc && cd ..\src && ..\tools\asar\asar.exe --no-title-check --symbols=wla --symbols-path=..\build\SMBIHY_InfoHUD.sym -DFEATURE_SD2SNES=1 main.asm ..\build\aaaa_SMBIHY.sfc && cd ..

PAUSE
