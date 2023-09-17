@echo off

echo Building Unhundred Practice Hack

cd build
echo Building and pre-patching savestate version
cp HACK\Unhundred.sfc aaaa_Unhundred.sfc && cd ..\src && ..\tools\asar\asar.exe --no-title-check -DFEATURE_SD2SNES=1 main.asm ..\build\aaaa_Unhundred.sfc && cd ..

PAUSE
