@echo off

echo Building Life Practice Hack

cd build
echo Building and pre-patching saveless version
cp HACK\Life.sfc aaaa_Life.sfc && cd ..\src && ..\tools\asar\asar.exe --no-title-check -DFEATURE_SD2SNES=0 main.asm ..\build\aaaa_Life.sfc && cd ..

PAUSE
