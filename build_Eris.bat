@echo off

echo Building Eris Practice Hack

cd build
echo Building and pre-patching savestate version
cp HACK\Eris.sfc aaaa_Eris.sfc && cd ..\src && ..\tools\asar\asar.exe --no-title-check -DFEATURE_SD2SNES=1 main.asm ..\build\aaaa_Eris.sfc && cd ..

PAUSE
