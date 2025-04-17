@echo off

echo Building Redesign Practice Hack

cd build
echo Building and pre-patching savestate version
copy HACK\smr.sfc aaaa_Redesign.sfc && cd ..\src && ..\tools\asar\asar.exe --no-title-check --symbols=wla --symbols-path=..\build\Redesign_InfoHUD.sym -DFEATURE_SD2SNES=1 main.asm ..\build\aaaa_Redesign.sfc && cd ..

PAUSE
