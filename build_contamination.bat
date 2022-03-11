@echo off

echo Building Contamination Practice Hack

cd build
echo Building and pre-patching saveless version
cp HACK\Contamination.sfc aaaa_Contamination.sfc && cd ..\src && ..\tools\asar\asar.exe --no-title-check -DFEATURE_SD2SNES=0 main.asm ..\build\aaaa_Contamination.sfc && cd ..

PAUSE
