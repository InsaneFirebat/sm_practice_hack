@echo off

echo Building SM Redesign Practice Hack

cd build
echo Building and pre-patching savestate version
cp HACK\smr.sfc Redesign_InfoHUD_Savestates_2.4.X.sfc && cd ..\src && ..\tools\asar\asar.exe --no-title-check -DFEATURE_SD2SNES=1 -DFEATURE_REDESIGN=1 main.asm ..\build\Redesign_InfoHUD_Savestates_2.4.X.sfc && cd ..

PAUSE
