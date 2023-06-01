@echo off

echo Building Nature Practice Hack

cd build
echo Building and pre-patching savestate version
cp HACK\Nature.sfc aaaa_Nature.sfc && cd ..\src && ..\tools\asar\asar.exe --no-title-check -DFEATURE_SD2SNES=1 main.asm ..\build\aaaa_Nature.sfc && cd ..

PAUSE
