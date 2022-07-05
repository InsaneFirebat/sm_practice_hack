@echo off

echo Building all NTSC SM Practice Hack versions
cd resources
python create_dummies.py 00.sfc ff.sfc

echo Building saveless version
copy *.sfc ..\build
..\tools\asar\asar.exe --no-title-check -DFEATURE_EXTRAS=0 ..\src\main.asm ..\build\00.sfc
..\tools\asar\asar.exe --no-title-check -DFEATURE_EXTRAS=0 ..\src\main.asm ..\build\ff.sfc
python create_ips.py ..\build\00.sfc ..\build\ff.sfc ..\build\Custom_InfoHUD_2.4.X.ips

echo Building SD2SNES version
copy *.sfc ..\build
..\tools\asar\asar.exe  --no-title-check -DFEATURE_SD2SNES=1 ..\src\main.asm ..\build\00.sfc
..\tools\asar\asar.exe  --no-title-check -DFEATURE_SD2SNES=1 ..\src\main.asm ..\build\ff.sfc
python create_ips.py ..\build\00.sfc ..\build\ff.sfc ..\build\Custom_InfoHUD_Savestates_2.4.X.ips

echo Building TinyStates version
copy *.sfc ..\build
..\tools\asar\asar.exe  --no-title-check -DFEATURE_SD2SNES=1 -DFEATURE_EXTRAS=1 ..\src\main.asm ..\build\00.sfc
..\tools\asar\asar.exe  --no-title-check -DFEATURE_SD2SNES=1 -DFEATURE_EXTRAS=1 ..\src\main.asm ..\build\ff.sfc
python create_ips.py ..\build\00.sfc ..\build\ff.sfc ..\build\Custom_InfoHUD_TinyStates_2.4.X.ips

echo Building saveless extras version
copy *.sfc ..\build
..\tools\asar\asar.exe  --no-title-check -DFEATURE_SD2SNES=0 -DFEATURE_EXTRAS=1 ..\src\main.asm ..\build\00.sfc
..\tools\asar\asar.exe  --no-title-check -DFEATURE_SD2SNES=0 -DFEATURE_EXTRAS=1 ..\src\main.asm ..\build\ff.sfc
python create_ips.py ..\build\00.sfc ..\build\ff.sfc ..\build\Custom_InfoHUD+_2.4.X.ips

echo Building SD2SNES extras version
copy *.sfc ..\build
..\tools\asar\asar.exe  --no-title-check -DFEATURE_SD2SNES=1 -DFEATURE_EXTRAS=1 ..\src\main.asm ..\build\00.sfc
..\tools\asar\asar.exe  --no-title-check -DFEATURE_SD2SNES=1 -DFEATURE_EXTRAS=1 ..\src\main.asm ..\build\ff.sfc
python create_ips.py ..\build\00.sfc ..\build\ff.sfc ..\build\Custom_InfoHUD+_Savestates_2.4.X.ips

echo Building TinyStates extras version
copy *.sfc ..\build
..\tools\asar\asar.exe  --no-title-check -DFEATURE_SD2SNES=1 -DFEATURE_EXTRAS=1 ..\src\main.asm ..\build\00.sfc
..\tools\asar\asar.exe  --no-title-check -DFEATURE_SD2SNES=1 -DFEATURE_EXTRAS=1 ..\src\main.asm ..\build\ff.sfc
python create_ips.py ..\build\00.sfc ..\build\ff.sfc ..\build\Custom_InfoHUD+_TinyStates_2.4.X.ips

del 00.sfc ff.sfc ..\build\00.sfc ..\build\ff.sfc
cd ..
PAUSE
