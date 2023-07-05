@echo off

echo Building Subpar Practice Hack

cd build
echo Building and pre-patching savestate version
cp HACK\Subpar.sfc aaaa_Subpar.sfc && cd ..\src && ..\tools\asar\asar.exe --symbols=wla --symbols-path=..\build\Hack_Symbols.sym --no-title-check -DFEATURE_SD2SNES=0 -DFEATURE_TINYSTATES=1 main.asm ..\build\aaaa_Subpar.sfc && cd ..

PAUSE
