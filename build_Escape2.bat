@echo off

echo Building Escape II Practice Hack

cd build
echo Building and pre-patching saveless version
cp Escape2.sfc aaaa_Escape2.sfc && cd ..\src && ..\tools\asar\asar.exe --no-title-check -DFEATURE_SD2SNES=0 main.asm ..\build\aaaa_Escape2.sfc && cd ..

PAUSE
