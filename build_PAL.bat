@echo off

echo Building SM PAL Practice Hack
python tools\python\create_dummies.py ..\..\resources\00.sfc ..\..\resources\ff.sfc

echo Building saveless version
copy resources\00.sfc build
copy resources\ff.sfc build
tools\asar\asar.exe --no-title-check -DFEATURE_PAL=1 src\main.asm build\00.sfc
tools\asar\asar.exe --no-title-check -DFEATURE_PAL=1 src\main.asm build\ff.sfc
python tools\python\create_ips.py ..\..\build\00.sfc ..\..\build\ff.sfc ..\..\build\Custom_PAL_InfoHUD_2.7.X.ips

echo Building savestate version
copy resources\00.sfc build
copy resources\ff.sfc build
tools\asar\asar.exe --no-title-check -DFEATURE_SD2SNES=1 -DFEATURE_PAL=1 src\main.asm build\00.sfc
tools\asar\asar.exe --no-title-check -DFEATURE_SD2SNES=1 -DFEATURE_PAL=1 src\main.asm build\ff.sfc
python tools\python\create_ips.py ..\..\build\00.sfc ..\..\build\ff.sfc ..\..\build\Custom_PAL_InfoHUD_Savestates_2.7.X.ips

echo Building TinyStates version
copy resources\00.sfc build
copy resources\ff.sfc build
tools\asar\asar.exe --no-title-check -DFEATURE_TINYSTATES=1 -DFEATURE_PAL=1 src\main.asm build\00.sfc
tools\asar\asar.exe --no-title-check -DFEATURE_TINYSTATES=1 -DFEATURE_PAL=1 src\main.asm build\ff.sfc
python tools\python\create_ips.py ..\..\build\00.sfc ..\..\build\ff.sfc ..\..\build\Custom_PAL_InfoHUD_TinyStates_2.7.X.ips

del resources\00.sfc resources\ff.sfc build\00.sfc build\ff.sfc
cd ..
PAUSE
