@echo off

echo Building Ancient Chozo Practice Hack

cd build
echo Building and pre-patching Ancient Chozo saveless version
cp Ancient_Chozo.sfc aaaa_AncientChozo.sfc && cd ..\src && ..\tools\asar\asar.exe --no-title-check -DFEATURE_SD2SNES=0 main.asm ..\build\aaaa_AncientChozo.sfc && cd ..

PAUSE
