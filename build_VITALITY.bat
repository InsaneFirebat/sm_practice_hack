@echo off

echo Building VITALITY Practice Hack

cd build
echo Building and pre-patching savestate version
cp HACK\VITALITY.sfc aaaa_VITALITY.sfc && cd ..\src && ..\tools\asar\asar.exe --symbols=wla --symbols-path=..\build\VITALITY_Symbols.sym --no-title-check -DFEATURE_SD2SNES=1 main.asm ..\build\aaaa_VITALITY.sfc && cd ..

PAUSE
