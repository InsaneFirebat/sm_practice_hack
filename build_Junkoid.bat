@echo off

echo Building Super Junkoid Practice Hack

cd build
echo Building and pre-patching savestate version
cp HACK\Junkoid.sfc aaaa_Junkoid.sfc && cd ..\src && ..\tools\asar\asar.exe --no-title-check --symbols=wla --symbols-path=..\build\Debugging_Symbols.sym -DFEATURE_SD2SNES=1 main.asm ..\build\aaaa_Junkoid.sfc && cd ..

PAUSE
