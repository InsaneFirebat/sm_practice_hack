@echo off

echo Building InsaneFirebat's SM Practice Hack

cd build
echo Building and pre-patching tinystates VanillaHUD version
cp sm_orig.sfc Custom_VanillaHUD_2.4.X.sfc && cd ..\src && ..\tools\asar\asar.exe --no-title-check -DFEATURE_SD2SNES=0 -DFEATURE_TINYSTATES=1 -DFEATURE_VANILLAHUD=1 main.asm ..\build\Custom_VanillaHUD_2.4.X.sfc && cd ..

PAUSE
