@echo off

echo Building Ascent Practice Hack

cd build
echo Building and pre-patching savestate version
cp HACK\Ascent.sfc aaaa_Ascent.sfc && cd ..\src && ..\tools\asar\asar.exe --no-title-check -DFEATURE_SD2SNES=1 main.asm ..\build\aaaa_Ascent.sfc && cd ..

PAUSE
