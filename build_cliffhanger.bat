@echo off

echo Building Cliffhanger Practice Hacks

cd build
echo Building and pre-patching savestate versions
cp HACK\Cliffhanger.sfc aaaa_Cliffhanger.sfc && cd ..\src && ..\tools\asar\asar.exe --symbols=wla --symbols-path=..\build\Cliffhangar_Symbols.sym --no-title-check -DFEATURE_SD2SNES=1 -DFEATURE_DEV=1 main.asm ..\build\aaaa_Cliffhanger.sfc && cd ..

PAUSE
