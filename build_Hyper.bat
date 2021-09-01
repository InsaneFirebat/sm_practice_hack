@echo off

echo Building SM Practice Hack

cd build
echo Building and pre-patching saveless extras version
cp Hyper.sfc aaaa_Hyper.sfc && cd ..\src && ..\tools\asar\asar.exe --no-title-check -DFEATURE_SD2SNES=0 main.asm ..\build\aaaa_Hyper.sfc && cd ..

PAUSE
