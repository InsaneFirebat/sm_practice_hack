@echo off

echo Building Exertion Practice Hack

cd build
echo Building and pre-patching savestate version
cp HACK\Exertion.sfc aaaa_Exertion.sfc && cd ..\src && ..\tools\asar\asar.exe --no-title-check -DFEATURE_SD2SNES=1 main.asm ..\build\aaaa_Exertion.sfc && cd ..

PAUSE
