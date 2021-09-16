@echo off

echo Building Containment Chamber Practice Hack

cd build
echo Building and pre-patching saveless version
cp HACK\ContainmentChamber.sfc aaaa_ContainmentChamber.sfc && cd ..\src && ..\tools\asar\asar.exe --no-title-check -DFEATURE_SD2SNES=0 main.asm ..\build\aaaa_ContainmentChamber.sfc && cd ..

PAUSE
