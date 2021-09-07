@echo off

echo Building SM Redesign Practice Hack

cd build
echo Building and pre-patching saveless version
cp smr.sfc aaaa_FastBuildRedesign.sfc && cd ..\src && ..\tools\asar\asar.exe --no-title-check -DFEATURE_SD2SNES=0 -DFEATURE_REDESIGN=1 main.asm ..\build\aaaa_FastBuildRedesign.sfc && cd ..

PAUSE
