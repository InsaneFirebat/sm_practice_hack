@echo off

echo Building all distributed patches
cd resources
python create_dummies.py 00.sfc ff.sfc

echo Building NTSC saveless version
copy *.sfc ..\build
..\tools\asar\asar.exe --no-title-check ..\src\main.asm ..\build\00.sfc
..\tools\asar\asar.exe --no-title-check ..\src\main.asm ..\build\ff.sfc
python create_ips.py ..\build\00.sfc ..\build\ff.sfc ..\build\Custom_InfoHUD_2.4.X.ips

echo Building NTSC SD2SNES version
copy *.sfc ..\build
..\tools\asar\asar.exe  --no-title-check -DFEATURE_SD2SNES=1 ..\src\main.asm ..\build\00.sfc
..\tools\asar\asar.exe  --no-title-check -DFEATURE_SD2SNES=1 ..\src\main.asm ..\build\ff.sfc
python create_ips.py ..\build\00.sfc ..\build\ff.sfc ..\build\Custom_InfoHUD_Savestates_2.4.X.ips

echo Building NTSC TinyStates version
copy *.sfc ..\build
..\tools\asar\asar.exe  --no-title-check -DFEATURE_TINYSTATES=1 ..\src\main.asm ..\build\00.sfc
..\tools\asar\asar.exe  --no-title-check -DFEATURE_TINYSTATES=1 ..\src\main.asm ..\build\ff.sfc
python create_ips.py ..\build\00.sfc ..\build\ff.sfc ..\build\Custom_InfoHUD_TinyStates_2.4.X.ips

echo Building PAL saveless version
copy *.sfc ..\build
..\tools\asar\asar.exe  --no-title-check -DFEATURE_PAL=1 ..\src\main.asm ..\build\00.sfc
..\tools\asar\asar.exe  --no-title-check -DFEATURE_PAL=1 ..\src\main.asm ..\build\ff.sfc
python create_ips.py ..\build\00.sfc ..\build\ff.sfc ..\build\PAL_InfoHUD_2.4.X.ips

echo Building PAL SD2SNES version
copy *.sfc ..\build
..\tools\asar\asar.exe  --no-title-check -DFEATURE_PAL=1 -DFEATURE_SD2SNES=1 ..\src\main.asm ..\build\00.sfc
..\tools\asar\asar.exe  --no-title-check -DFEATURE_PAL=1 -DFEATURE_SD2SNES=1 ..\src\main.asm ..\build\ff.sfc
python create_ips.py ..\build\00.sfc ..\build\ff.sfc ..\build\PAL_InfoHUD_Savestates_2.4.X.ips

echo Building PAL TinyStates version
copy *.sfc ..\build
..\tools\asar\asar.exe  --no-title-check -DFEATURE_PAL=1 -DFEATURE_TINYSTATES=1 ..\src\main.asm ..\build\00.sfc
..\tools\asar\asar.exe  --no-title-check -DFEATURE_PAL=1 -DFEATURE_TINYSTATES=1 ..\src\main.asm ..\build\ff.sfc
python create_ips.py ..\build\00.sfc ..\build\ff.sfc ..\build\PAL_InfoHUD_TinyStates_2.4.X.ips

del 00.sfc ff.sfc ..\build\00.sfc ..\build\ff.sfc
cd ..
PAUSE
