@echo off

echo Building Oxide Practice Hack

cd build
echo Building and pre-patching saveless version
cp HACK\Oxide.sfc aaaa_Oxide.sfc && cd ..\src && ..\tools\asar\asar.exe --no-title-check -DFEATURE_SD2SNES=0 main.asm ..\build\aaaa_Oxide.sfc && cd ..

PAUSE
