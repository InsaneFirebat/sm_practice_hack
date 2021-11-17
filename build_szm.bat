@echo off

echo Building SZM Practice Hack

cd build
echo Building and pre-patching saveless version
cp HACK\SZM.sfc aaaa_SZM.sfc && cd ..\src && ..\tools\asar\asar.exe --no-title-check -DFEATURE_SD2SNES=0 main.asm ..\build\aaaa_SZM.sfc && cd ..

PAUSE
