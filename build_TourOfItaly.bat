@echo off

echo Building TourOfItaly Practice Hack

cd build
echo Building and pre-patching savestate version
copy HACK\TourOfItaly.sfc aaaa_TourOfItaly.sfc && cd ..\src && ..\tools\asar\asar.exe --no-title-check --symbols=wla --symbols-path=..\build\TourOfItaly_InfoHUD.sym -DFEATURE_SD2SNES=1 main.asm ..\build\aaaa_TourOfItaly.sfc && cd ..

PAUSE
