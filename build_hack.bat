@echo off

echo Building Kaizo Possible Practice Hack

cd build
echo Building and pre-patching saveless version
cp HACK\KaizoP.sfc aaaa_KaizoP.sfc && cd ..\src && ..\tools\asar\asar.exe --no-title-check --symbols=wla --symbols-path=..\build\KaizoP_InfoHUD.sym -DFEATURE_DEV=1 -DFEATURE_SD2SNES=1 main.asm ..\build\aaaa_KaizoP.sfc && cd ..

PAUSE
