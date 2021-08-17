@echo off

echo Building SM Practice Hack

cd build
echo Building and pre-patching saveless extras version
cp smr.sfc aaaa_FastBuildRedesign.sfc && cd ..\src && ..\tools\asar --no-title-check -DFEATURE_SD2SNES=0 -DFEATURE_EXTRAS=0 -DFEATURE_PAL=0 main.asm ..\build\aaaa_FastBuildRedesign.sfc && cd ..

PAUSE