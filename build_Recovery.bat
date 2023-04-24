@echo off

echo Building Recovery Practice Recovery

cd build
echo Building and pre-patching savestate version
cp HACK\Recovery.sfc aaaa_Recovery.sfc && cd ..\src && ..\tools\asar\asar.exe --no-title-check -DFEATURE_SD2SNES=1 main.asm ..\build\aaaa_Recovery.sfc && cd ..

PAUSE
