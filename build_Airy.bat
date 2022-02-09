@echo off

echo Building Airy Practice Hack

cd build
echo Building and pre-patching saveless version
cp HACK\Airy.sfc aaaa_Airy.sfc && cd ..\src && ..\tools\asar\asar.exe --no-title-check -DFEATURE_SD2SNES=0 main.asm ..\build\aaaa_Airy.sfc && cd ..

PAUSE
