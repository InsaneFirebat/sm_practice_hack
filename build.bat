@echo off

echo Building Unhundred Practice Hack
cd resources
python create_dummies.py 00.sfc ff.sfc

echo Building saveless version
copy 00.sfc ..\build
copy ff.sfc ..\build
..\tools\asar\asar.exe --no-title-check -DFEATURE_SD2SNES=0 ..\src\main.asm ..\build\00.sfc
..\tools\asar\asar.exe --no-title-check -DFEATURE_SD2SNES=0 ..\src\main.asm ..\build\ff.sfc
python create_ips.py ..\build\00.sfc ..\build\ff.sfc ..\build\Unhundred_InfoHUD_2.5.X.ips

echo Building savestate version
copy 00.sfc ..\build
copy ff.sfc ..\build
..\tools\asar\asar.exe --no-title-check -DFEATURE_SD2SNES=1 ..\src\main.asm ..\build\00.sfc
..\tools\asar\asar.exe --no-title-check -DFEATURE_SD2SNES=1 ..\src\main.asm ..\build\ff.sfc
python create_ips.py ..\build\00.sfc ..\build\ff.sfc ..\build\Unhundred_InfoHUD_Savestates_2.5.X.ips

echo Building tinystates version
copy 00.sfc ..\build
copy ff.sfc ..\build
..\tools\asar\asar.exe --no-title-check -DFEATURE_SD2SNES=0 -DFEATURE_TINYSTATES=1 ..\src\main.asm ..\build\00.sfc
..\tools\asar\asar.exe --no-title-check -DFEATURE_SD2SNES=0 -DFEATURE_TINYSTATES=1 ..\src\main.asm ..\build\ff.sfc
python create_ips.py ..\build\00.sfc ..\build\ff.sfc ..\build\Unhundred_InfoHUD_TinyStates_2.5.X.ips

del 00.sfc ff.sfc ..\build\00.sfc ..\build\ff.sfc
cd ..
PAUSE
