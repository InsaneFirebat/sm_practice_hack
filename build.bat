@echo off

set HACK_NAME=KaizoPossible
set HACK_BUILD_VERSION=2.6.2

echo Building %HACK_NAME% Practice Hack
if not exist build mkdir build
python enemies\create_clear_enemies_data.py ..\src\clearenemies.asm clear_enemies.txt
python names\create_names.py ..\src\roomnames.asm default_names.txt custom_names.txt
cd resources
python create_ram_symbols.py ..\src\defines.asm ..\src\symbols.asm
python create_dummies.py 00.sfc ff.sfc

echo Building saveless version
if exist ..\build\%HACK_NAME%_InfoHUD_%HACK_BUILD_VERSION%.ips del ..\build\%HACK_NAME%_InfoHUD_%HACK_BUILD_VERSION%.ips
copy 00.sfc ..\build
copy ff.sfc ..\build
..\tools\asar\asar.exe --no-title-check --symbols=wla --symbols-path=..\build\symbols.sym -DFEATURE_SD2SNES=0 -DFEATURE_TINYSTATES=0 ..\src\main.asm ..\build\00.sfc
if ERRORLEVEL 1 goto end_build_saveless
..\tools\asar\asar.exe --no-title-check -DFEATURE_SD2SNES=0 -DFEATURE_TINYSTATES=0 ..\src\main.asm ..\build\ff.sfc
python sort_debug_symbols.py ..\build\symbols.sym x ..\build\%HACK_NAME%_combined.sym
python create_ips.py ..\build\00.sfc ..\build\ff.sfc ..\build\%HACK_NAME%_InfoHUD_%HACK_BUILD_VERSION%.ips
:end_build_saveless

echo Building savestate version
if exist ..\build\%HACK_NAME%_InfoHUD_Savestates_%HACK_BUILD_VERSION%.ips del ..\build\%HACK_NAME%_InfoHUD_Savestates_%HACK_BUILD_VERSION%.ips
copy 00.sfc ..\build
copy ff.sfc ..\build
..\tools\asar\asar.exe --no-title-check --symbols=wla --symbols-path=..\build\symbols.sym -DFEATURE_SD2SNES=1 -DFEATURE_TINYSTATES=0 ..\src\main.asm ..\build\00.sfc
if ERRORLEVEL 1 goto end_build_savestate
..\tools\asar\asar.exe --no-title-check -DFEATURE_SD2SNES=1 -DFEATURE_TINYSTATES=0 ..\src\main.asm ..\build\ff.sfc
python sort_debug_symbols.py ..\build\symbols.sym x ..\build\%HACK_NAME%_Savestates_combined.sym
python create_ips.py ..\build\00.sfc ..\build\ff.sfc ..\build\%HACK_NAME%_InfoHUD_Savestates_%HACK_BUILD_VERSION%.ips
:end_build_savestate

echo Building TinyStates version
if exist ..\build\%HACK_NAME%_InfoHUD_TinyStates_%HACK_BUILD_VERSION%.ips del ..\build\%HACK_NAME%_InfoHUD_TinyStates_%HACK_BUILD_VERSION%.ips
copy 00.sfc ..\build
copy ff.sfc ..\build
..\tools\asar\asar.exe --no-title-check --symbols=wla --symbols-path=..\build\symbols.sym -DFEATURE_SD2SNES=0 -DFEATURE_TINYSTATES=1 ..\src\main.asm ..\build\00.sfc
if ERRORLEVEL 1 goto end_build_tinystates
..\tools\asar\asar.exe --no-title-check -DFEATURE_SD2SNES=0 -DFEATURE_TINYSTATES=1 ..\src\main.asm ..\build\ff.sfc
python sort_debug_symbols.py ..\build\symbols.sym x ..\build\%HACK_NAME%_TinyStates_combined.sym
python create_ips.py ..\build\00.sfc ..\build\ff.sfc ..\build\%HACK_NAME%_InfoHUD_TinyStates_%HACK_BUILD_VERSION%.ips
:end_build_tinystates

del 00.sfc ff.sfc ..\build\00.sfc ..\build\ff.sfc ..\build\symbols.sym
cd ..

