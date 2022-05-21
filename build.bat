@echo off

echo Building SM NTSC Practice Hack
cd resources
python create_dummies.py 00.sfc ff.sfc

echo Building saveless version
copy *.sfc ..\build
..\tools\asar\asar.exe --no-title-check -DFEATURE_SD2SNES=0 -DFEATURE_PAL=0 -DFEATURE_EXTRAS=0 ..\src\main.asm ..\build\00.sfc
..\tools\asar\asar.exe --no-title-check -DFEATURE_SD2SNES=0 -DFEATURE_PAL=0 -DFEATURE_EXTRAS=0 ..\src\main.asm ..\build\ff.sfc
python create_ips.py ..\build\00.sfc ..\build\ff.sfc ..\build\Custom_InfoHUD_2.4.X.ips

echo Building savestate version
copy *.sfc ..\build
..\tools\asar\asar.exe --no-title-check -DFEATURE_SD2SNES=1 -DFEATURE_PAL=0 -DFEATURE_EXTRAS=0 ..\src\main.asm ..\build\00.sfc
..\tools\asar\asar.exe --no-title-check -DFEATURE_SD2SNES=1 -DFEATURE_PAL=0 -DFEATURE_EXTRAS=0 ..\src\main.asm ..\build\ff.sfc
python create_ips.py ..\build\00.sfc ..\build\ff.sfc ..\build\Custom_InfoHUD_Savestates_2.4.X.ips

echo Building TinyStates version
copy *.sfc ..\build
..\tools\asar --no-title-check -DFEATURE_TINYSTATES=1 ..\src\main.asm ..\build\00.sfc
..\tools\asar --no-title-check -DFEATURE_TINYSTATES=1 ..\src\main.asm ..\build\ff.sfc
python create_ips.py ..\build\00.sfc ..\build\ff.sfc ..\build\Custom_InfoHUD_TinyStates_2.4.X.ips

del 00.sfc ff.sfc ..\build\00.sfc ..\build\ff.sfc
cd ..
PAUSE