@echo off

echo Building Kero Practice Hack

cd build
echo Building and pre-patching savestate version
cp HACK\Kero.sfc aaaa_Kero.sfc && cd ..\src && ..\tools\asar\asar.exe --no-title-check -DFEATURE_SD2SNES=1 main.asm ..\build\aaaa_Kero.sfc && cd ..

PAUSE
