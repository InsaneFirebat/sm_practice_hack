@echo off

echo Building Ice Metal Uninstall Practice Hack

cd build
echo Building and pre-patching saveless version
cp IceMetalUninstall.sfc aaaa_IceMetalUninstall.sfc && cd ..\src && ..\tools\asar\asar.exe --no-title-check -DFEATURE_SD2SNES=0 main.asm ..\build\aaaa_IceMetalUninstall.sfc && cd ..

PAUSE
