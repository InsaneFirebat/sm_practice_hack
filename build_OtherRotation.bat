@echo off

echo Building otherRotation Practice Hack

cd build
echo Building and pre-patching saveless version
rem To use this script, place your unheadered otherRotation rom in build/HACK and name it otherRotation.sfc
cp HACK\otherRotation.sfc aaaa_otherRotation_RC2.sfc && cd ..\src && ..\tools\asar\asar.exe --no-title-check -DFEATURE_SD2SNES=0 main.asm ..\build\aaaa_OtherRotation_RC2.sfc && cd ..

PAUSE
