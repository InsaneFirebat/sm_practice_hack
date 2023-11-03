@echo off

echo Building The Blue Plague Practice Hack

cd build
echo Building and pre-patching savestate version
cp HACK\BluePlague.sfc aaaa_BluePlague.sfc && cd ..\src && ..\tools\asar\asar.exe --no-title-check -DFEATURE_SD2SNES=1 main.asm ..\build\aaaa_BluePlague.sfc && cd ..

PAUSE
