@echo off

echo Building Darkholme Hospital Practice Hack

cd build
echo Building and pre-patching savestate version
cp HACK\Darkholme.sfc aaaa_Darkholme.sfc && cd ..\src && ..\tools\asar\asar.exe --no-title-check -DFEATURE_SD2SNES=1 main.asm ..\build\aaaa_Darkholme.sfc && cd ..

PAUSE
