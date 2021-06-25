@echo off

echo Building SM Practice Hack

cd build
echo Building and pre-patching saveless extras version
cp sm_orig.sfc FastBuildTest.sfc && cd ..\src && ..\tools\asar --no-title-check -DFEATURE_SD2SNES=0 -DFEATURE_EXTRAS=1 main.asm ..\build\FastBuildTest.sfc && cd ..

PAUSE