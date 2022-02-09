@echo off

echo Building Decision Practice Hack

cd build
echo Building and pre-patching saveless version
cp HACK\Decision.sfc aaaa_Decision.sfc && cd ..\src && ..\tools\asar\asar.exe --no-title-check -DFEATURE_SD2SNES=0 main.asm ..\build\aaaa_Decision.sfc && cd ..

PAUSE
