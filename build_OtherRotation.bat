@echo off

echo Building Other Rotatio Practice Hack

cd build
echo Building and pre-patching saveless version
cp HACK\OtherRotation_RC2.sfc aaaa_OtherRotation_RC2.sfc && cd ..\src && ..\tools\asar\asar.exe --no-title-check -DFEATURE_SD2SNES=0 main.asm ..\build\aaaa_OtherRotation_RC2.sfc && cd ..

PAUSE
