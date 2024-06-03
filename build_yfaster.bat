@echo off

echo Building Yfaster Practice Hack

cd build
echo Building and pre-patching savestate version
cp HACK\Yfaster.sfc aaaa_Yfaster.sfc && cd ..\src && ..\tools\asar\asar.exe --no-title-check -DFEATURE_SD2SNES=1 main.asm ..\build\aaaa_Yfaster.sfc && cd ..

PAUSE
