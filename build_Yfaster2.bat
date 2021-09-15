@echo off

echo Building Yfaster2 Practice Hack

cd build
echo Building and pre-patching saveless version
cp Yfaster2.sfc aaaa_Yfaster2.sfc && cd ..\src && ..\tools\asar\asar.exe --no-title-check -DFEATURE_SD2SNES=0 main.asm ..\build\aaaa_Yfaster2.sfc && cd ..

PAUSE
