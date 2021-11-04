@echo off

echo Building Y-Faster 2 Furious Practice Hack

cd build
echo Building and pre-patching saveless version
cp HACK\Yfaster2f.sfc aaaa_Yfaster2f.sfc && cd ..\src && ..\tools\asar\asar.exe --no-title-check -DFEATURE_SD2SNES=0 main.asm ..\build\aaaa_Yfaster2f.sfc && cd ..

PAUSE
