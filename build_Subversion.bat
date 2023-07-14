@echo off

echo Building Subversion Practice Hack

cd build
echo Building and pre-patching savestate version
cp HACK\Subversion.sfc aaaa_Subversion.sfc && cd ..\src && ..\tools\asar\asar.exe --no-title-check --symbols=wla --symbols-path=..\build\Subversion_Symbols.sym -DFEATURE_SD2SNES=1 main.asm ..\build\aaaa_Subversion.sfc > ..\build\print_pc.log 2>&1
type ..\build\print_pc.log

PAUSE
