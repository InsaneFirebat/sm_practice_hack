@echo off

echo Building Rotation Practice Hack

cd build
echo Building and pre-patching saveless version
cp HACK\Rotation.sfc aaaa_Rotation.sfc && cd ..\src && ..\tools\asar\asar.exe --no-title-check -DFEATURE_SD2SNES=0 main.asm ..\build\aaaa_Rotation.sfc && cd ..

PAUSE
