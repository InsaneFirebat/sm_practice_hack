@echo off

echo Building Axeil and Redesign Practice Hacks
cd resources
python create_dummies.py 00.sfc ff.sfc

echo Building saveless Axeil version
copy *.sfc ..\build
..\tools\asar\asar.exe --no-title-check -DFEATURE_SD2SNES=0 ..\src\main.asm ..\build\00.sfc
..\tools\asar\asar.exe --no-title-check -DFEATURE_SD2SNES=0 ..\src\main.asm ..\build\ff.sfc
python create_ips.py ..\build\00.sfc ..\build\ff.sfc ..\build\Axeil_InfoHUD_2.3.X.ips

echo Building savestate Axeil version
copy *.sfc ..\build
..\tools\asar\asar.exe --no-title-check -DFEATURE_SD2SNES=1 ..\src\main.asm ..\build\00.sfc
..\tools\asar\asar.exe --no-title-check -DFEATURE_SD2SNES=1 ..\src\main.asm ..\build\ff.sfc
python create_ips.py ..\build\00.sfc ..\build\ff.sfc ..\build\Axeil_InfoHUD_Savestates_2.3.X.ips

echo Building saveless Redesign version
copy *.sfc ..\build
..\tools\asar\asar.exe --no-title-check -DFEATURE_SD2SNES=0 -DFEATURE_REDESIGN=1 ..\src\main.asm ..\build\00.sfc
..\tools\asar\asar.exe --no-title-check -DFEATURE_SD2SNES=0 -DFEATURE_REDESIGN=1 ..\src\main.asm ..\build\ff.sfc
python create_ips.py ..\build\00.sfc ..\build\ff.sfc ..\build\Redesign_InfoHUD_2.3.X.ips

echo Building savestate Redesign version
copy *.sfc ..\build
..\tools\asar\asar.exe --no-title-check -DFEATURE_SD2SNES=1 -DFEATURE_REDESIGN=1 ..\src\main.asm ..\build\00.sfc
..\tools\asar\asar.exe --no-title-check -DFEATURE_SD2SNES=1 -DFEATURE_REDESIGN=1 ..\src\main.asm ..\build\ff.sfc
python create_ips.py ..\build\00.sfc ..\build\ff.sfc ..\build\Redesign_InfoHUD_Savestates_2.3.X.ips

del 00.sfc ff.sfc ..\build\00.sfc ..\build\ff.sfc
cd ..
PAUSE
