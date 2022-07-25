@echo off

echo Building customized SM Practice Hack

cd build
echo Building and pre-patching tinystates version
cp sm_orig.sfc aaaa_FastBuildTest_tinystate.sfc && cd ..\src && ..\tools\asar\asar.exe --no-title-check -DFEATURE_TINYSTATES=1 main.asm ..\build\aaaa_FastBuildTest_tinystate.sfc && cd ..

PAUSE
