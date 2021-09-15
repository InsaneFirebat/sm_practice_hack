@echo off

echo Building Redesign Axeil Edition Practice Hack

cd build
echo Building and pre-patching saveless version
cp Redesign-Axeil_orig.sfc aaaa_FastBuildAxeil.sfc && cd ..\src && ..\tools\asar\asar.exe --no-title-check -DFEATURE_SD2SNES=0 main.asm ..\build\aaaa_FastBuildAxeil.sfc && cd ..

PAUSE
