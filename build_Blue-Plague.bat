@echo off

echo Building Metroid: The Blue Plague Practice Hack

cd build
echo Building and pre-patching saveless version
cp HACK\Blue-Plague.sfc aaaa_Blue-Plague.sfc && cd ..\src && ..\tools\asar\asar.exe --no-title-check -DFEATURE_SD2SNES=0 main.asm ..\build\aaaa_Blue-Plague.sfc && cd ..

PAUSE
