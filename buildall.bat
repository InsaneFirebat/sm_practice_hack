@echo off

echo Building all distributed patches
python tools\python\create_dummies.py ..\..\resources\00.sfc ..\..\resources\ff.sfc

echo Building NTSC saveless version
copy resources\00.sfc build
copy resources\ff.sfc build
tools\asar\asar.exe --no-title-check --fix-checksum=off src\main.asm build\00.sfc
tools\asar\asar.exe --no-title-check --fix-checksum=off src\main.asm build\ff.sfc
python tools\python\create_ips.py ..\..\build\00.sfc ..\..\build\ff.sfc ..\..\build\Custom_InfoHUD_2.7.X.ips

echo Building NTSC SD2SNES version
copy resources\00.sfc build
copy resources\ff.sfc build
tools\asar\asar.exe --no-title-check --fix-checksum=off -DFEATURE_SD2SNES=1 src\main.asm build\00.sfc
tools\asar\asar.exe --no-title-check --fix-checksum=off -DFEATURE_SD2SNES=1 src\main.asm build\ff.sfc
python tools\python\create_ips.py ..\..\build\00.sfc ..\..\build\ff.sfc ..\..\build\Custom_InfoHUD_Savestates_2.7.X.ips

echo Building NTSC TinyStates version
copy resources\00.sfc build
copy resources\ff.sfc build
tools\asar\asar.exe --no-title-check --fix-checksum=off -DFEATURE_TINYSTATES=1 src\main.asm build\00.sfc
tools\asar\asar.exe --no-title-check --fix-checksum=off -DFEATURE_TINYSTATES=1 src\main.asm build\ff.sfc
python tools\python\create_ips.py ..\..\build\00.sfc ..\..\build\ff.sfc ..\..\build\Custom_InfoHUD_TinyStates_2.7.X.ips

echo Building PAL saveless version
copy resources\00.sfc build
copy resources\ff.sfc build
tools\asar\asar.exe --no-title-check --fix-checksum=off -DFEATURE_PAL=1 src\main.asm build\00.sfc
tools\asar\asar.exe --no-title-check --fix-checksum=off -DFEATURE_PAL=1 src\main.asm build\ff.sfc
python tools\python\create_ips.py ..\..\build\00.sfc ..\..\build\ff.sfc ..\..\build\PAL_InfoHUD_2.7.X.ips

echo Building PAL SD2SNES version
copy resources\00.sfc build
copy resources\ff.sfc build
tools\asar\asar.exe --no-title-check --fix-checksum=off -DFEATURE_PAL=1 -DFEATURE_SD2SNES=1 src\main.asm build\00.sfc
tools\asar\asar.exe --no-title-check --fix-checksum=off -DFEATURE_PAL=1 -DFEATURE_SD2SNES=1 src\main.asm build\ff.sfc
python tools\python\create_ips.py ..\..\build\00.sfc ..\..\build\ff.sfc ..\..\build\PAL_InfoHUD_Savestates_2.7.X.ips

echo Building PAL TinyStates version
copy resources\00.sfc build
copy resources\ff.sfc build
tools\asar\asar.exe --no-title-check --fix-checksum=off -DFEATURE_PAL=1 -DFEATURE_TINYSTATES=1 src\main.asm build\00.sfc
tools\asar\asar.exe --no-title-check --fix-checksum=off -DFEATURE_PAL=1 -DFEATURE_TINYSTATES=1 src\main.asm build\ff.sfc
python tools\python\create_ips.py ..\..\build\00.sfc ..\..\build\ff.sfc ..\..\build\PAL_InfoHUD_TinyStates_2.7.X.ips

del resources\00.sfc resources\ff.sfc build\00.sfc build\ff.sfc

PAUSE
