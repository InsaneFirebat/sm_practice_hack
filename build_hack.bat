@echo off

echo Building Z-Factor Practice Hack

cd build
echo Building and pre-patching savestate version
cp HACK\Z-Factor.sfc aaaa_Z-Factor.sfc && cd ..\src && ..\tools\asar\asar.exe --no-title-check -DFEATURE_SD2SNES=1 main.asm ..\build\aaaa_Z-Factor.sfc && cd ..

PAUSE
