@echo off

echo Building Hydellius Practice Hack

cd build
echo Building and pre-patching savestate version
cp HACK\Hydellius.sfc aaaa_Hydellius.sfc && cd ..\src && ..\tools\asar\asar.exe --no-title-check -DFEATURE_SD2SNES=1 main.asm ..\build\aaaa_Hydellius.sfc && cd ..

PAUSE
