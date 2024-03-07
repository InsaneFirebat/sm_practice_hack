@echo off

echo Building SM PAL Practice Hack
cd resources
python create_dummies.py 00.sfc ff.sfc

echo Building saveless version
copy *.sfc ..\build
..\tools\asar\asar.exe --no-title-check -DFEATURE_PAL=1 ..\src\main.asm ..\build\00.sfc
..\tools\asar\asar.exe --no-title-check -DFEATURE_PAL=1 ..\src\main.asm ..\build\ff.sfc
python create_ips.py ..\build\00.sfc ..\build\ff.sfc ..\build\Custom_PAL_InfoHUD_2.6.X.ips

echo Building savestate version
copy *.sfc ..\build
..\tools\asar\asar.exe --no-title-check -DFEATURE_SD2SNES=1 -DFEATURE_PAL=1 ..\src\main.asm ..\build\00.sfc
..\tools\asar\asar.exe --no-title-check -DFEATURE_SD2SNES=1 -DFEATURE_PAL=1 ..\src\main.asm ..\build\ff.sfc
python create_ips.py ..\build\00.sfc ..\build\ff.sfc ..\build\Custom_PAL_InfoHUD_Savestates_2.6.X.ips

echo Building TinyStates version
copy *.sfc ..\build
..\tools\asar\asar.exe --no-title-check -DFEATURE_TINYSTATES=1 -DFEATURE_PAL=1 ..\src\main.asm ..\build\00.sfc
..\tools\asar\asar.exe --no-title-check -DFEATURE_TINYSTATES=1 -DFEATURE_PAL=1 ..\src\main.asm ..\build\ff.sfc
python create_ips.py ..\build\00.sfc ..\build\ff.sfc ..\build\Custom_PAL_InfoHUD_TinyStates_2.6.X.ips

del 00.sfc ff.sfc ..\build\00.sfc ..\build\ff.sfc
cd ..
PAUSE
