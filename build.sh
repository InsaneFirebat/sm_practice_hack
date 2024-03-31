#!/bin/bash

set HACK_NAME=Cliffhanger
set HACK_NAME2=CliffhangerRedux
set HACK_BUILD_VERSION=2.6.0

# Return an error if any command fails
success=0
trap success=1 ERR

echo "Building ${HACK_NAME} Practice Hack"
mkdir -p build
python3 enemies/create_clear_enemies_data.py ../src/clearenemies.asm clear_enemies.txt
python3 names/create_names.py ../src/roomnames.asm default_names.txt custom_names.txt
cd resources
python3 create_ram_symbols.py ../src/defines.asm ../src/symbols.asm
python3 create_dummies.py 00.sfc ff.sfc

echo "Building saveless version"
rm -f ../build/${HACK_NAME}_InfoHUD_${HACK_BUILD_VERSION}.ips
copy 00.sfc ../build
copy ff.sfc ../build
../tools/asar/asar --no-title-check --symbols=wla --symbols-path=../build/symbols.sym -DFEATURE_SD2SNES=0 -DFEATURE_TINYSTATES=0 ../src/main.asm ../build/00.sfc
../tools/asar/asar --no-title-check -DFEATURE_SD2SNES=0 -DFEATURE_TINYSTATES=0 ../src/main.asm ../build/ff.sfc
python3 sort_debug_symbols.py ../build/symbols.sym x ../build/${HACK_NAME}_combined.sym
python3 create_ips.py ../build/00.sfc ../build/ff.sfc ../build/${HACK_NAME}_InfoHUD_${HACK_BUILD_VERSION}.ips

echo "Building savestate version"
rm -f ../build/${HACK_NAME}_InfoHUD_Savestates_${HACK_BUILD_VERSION}.ips
copy 00.sfc ../build
copy ff.sfc ../build
../tools/asar/asar --no-title-check --symbols=wla --symbols-path=../build/symbols.sym -DFEATURE_SD2SNES=1 -DFEATURE_TINYSTATES=0 ../src/main.asm ../build/00.sfc
../tools/asar/asar --no-title-check -DFEATURE_SD2SNES=1 -DFEATURE_TINYSTATES=0 ../src/main.asm ../build/ff.sfc
python3 sort_debug_symbols.py ../build/symbols.sym x ../build/${HACK_NAME}_Savestates_combined.sym
python3 create_ips.py ../build/00.sfc ../build/ff.sfc ../build/${HACK_NAME}_InfoHUD_Savestates_${HACK_BUILD_VERSION}.ips

echo "Building TinyStates version"
rm -f ../build/${HACK_NAME}_InfoHUD_TinyStates_${HACK_BUILD_VERSION}.ips
copy 00.sfc ../build
copy ff.sfc ../build
../tools/asar/asar --no-title-check --symbols=wla --symbols-path=../build/symbols.sym -DFEATURE_SD2SNES=0 -DFEATURE_TINYSTATES=1 ../src/main.asm ../build/00.sfc
../tools/asar/asar --no-title-check -DFEATURE_SD2SNES=0 -DFEATURE_TINYSTATES=1 ../src/main.asm ../build/ff.sfc
python3 sort_debug_symbols.py ../build/symbols.sym x ../build/${HACK_NAME}_TinyStates_combined.sym
python3 create_ips.py ../build/00.sfc ../build/ff.sfc ../build/${HACK_NAME}_InfoHUD_TinyStates_${HACK_BUILD_VERSION}.ips

echo "Building saveless version"
rm -f ../build/${HACK_NAME2}_InfoHUD_${HACK_BUILD_VERSION}.ips
copy 00.sfc ../build
copy ff.sfc ../build
../tools/asar/asar --no-title-check --symbols=wla --symbols-path=../build/symbols.sym -DFEATURE_SD2SNES=0 -DFEATURE_TINYSTATES=0 ../src/main.asm ../build/00.sfc
../tools/asar/asar --no-title-check -DFEATURE_SD2SNES=0 -DFEATURE_TINYSTATES=0 ../src/main.asm ../build/ff.sfc
python3 sort_debug_symbols.py ../build/symbols.sym x ../build/${HACK_NAME2}_combined.sym
python3 create_ips.py ../build/00.sfc ../build/ff.sfc ../build/${HACK_NAME2}_InfoHUD_${HACK_BUILD_VERSION}.ips

echo "Building savestate version"
rm -f ../build/${HACK_NAME2}_InfoHUD_Savestates_${HACK_BUILD_VERSION}.ips
copy 00.sfc ../build
copy ff.sfc ../build
../tools/asar/asar --no-title-check --symbols=wla --symbols-path=../build/symbols.sym -DFEATURE_SD2SNES=1 -DFEATURE_TINYSTATES=0 ../src/main.asm ../build/00.sfc
../tools/asar/asar --no-title-check -DFEATURE_SD2SNES=1 -DFEATURE_TINYSTATES=0 ../src/main.asm ../build/ff.sfc
python3 sort_debug_symbols.py ../build/symbols.sym x ../build/${HACK_NAME2}_Savestates_combined.sym
python3 create_ips.py ../build/00.sfc ../build/ff.sfc ../build/${HACK_NAME2}_InfoHUD_Savestates_${HACK_BUILD_VERSION}.ips

echo "Building TinyStates version"
rm -f ../build/${HACK_NAME2}_InfoHUD_TinyStates_${HACK_BUILD_VERSION}.ips
copy 00.sfc ../build
copy ff.sfc ../build
../tools/asar/asar --no-title-check --symbols=wla --symbols-path=../build/symbols.sym -DFEATURE_SD2SNES=0 -DFEATURE_TINYSTATES=1 ../src/main.asm ../build/00.sfc
../tools/asar/asar --no-title-check -DFEATURE_SD2SNES=0 -DFEATURE_TINYSTATES=1 ../src/main.asm ../build/ff.sfc
python3 sort_debug_symbols.py ../build/symbols.sym x ../build/${HACK_NAME2}_TinyStates_combined.sym
python3 create_ips.py ../build/00.sfc ../build/ff.sfc ../build/${HACK_NAME2}_InfoHUD_TinyStates_${HACK_BUILD_VERSION}.ips

rm 00.sfc ff.sfc ../build/00.sfc ../build/ff.sfc ../build/symbols.sym
cd ..

exit $success
