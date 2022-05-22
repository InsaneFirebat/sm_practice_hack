@echo off

echo Building InsaneFirebat's SM Practice Hack

cd build
echo Building and pre-patching saveless extras version
cp sm_orig.sfc aaaa_FastBuildTest.sfc && cd ..\src && ..\tools\asar\asar.exe --no-title-check --symbols=wla --symbols-path=..\build\Firebat_InfoHUD.sym -DFEATURE_TINYSTATES=1 -DFEATURE_EXTRAS=1 -DFEATURE_DEV=1 main.asm ..\build\aaaa_FastBuildTest.sfc && cd ..

PAUSE