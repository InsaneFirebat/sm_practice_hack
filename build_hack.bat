@echo off

echo Building HACK Practice Hack

cd build
echo Building and pre-patching savestate version
copy HACK\HACK.sfc aaaa_HACK.sfc && cd ..\src && ..\tools\asar\asar.exe --no-title-check --symbols=wla --symbols-path=..\build\HACK_InfoHUD.sym -DFEATURE_SD2SNES=1 main.asm ..\build\aaaa_HACK.sfc && cd ..

PAUSE
