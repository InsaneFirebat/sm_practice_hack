#!/bin/bash

echo "Building SM NTSC Practice Hack"
cd resources
python3 create_dummies.py 00.sfc ff.sfc

echo "Building saveless version"
cp *.sfc ../build
../tools/asar/asar.exe --no-title-check ../src/main.asm ../build/00.sfc
../tools/asar/asar.exe --no-title-check ../src/main.asm ../build/ff.sfc
python3 create_ips.py ../build/00.sfc ../build/ff.sfc ../build/Custom_InfoHUD_2.4.X.ips

echo "Building savestate version"
cp *.sfc ../build
../tools/asar/asar.exe --no-title-check -DFEATURE_SD2SNES=1 ../src/main.asm ../build/00.sfc
../tools/asar/asar.exe --no-title-check -DFEATURE_SD2SNES=1 ../src/main.asm ../build/ff.sfc
python3 create_ips.py ../build/00.sfc ../build/ff.sfc ../build/Custom_InfoHUD_Savestates_2.4.X.ips

echo "Building TinyStates version"
cp *.sfc ../build
../tools/asar/asar.exe --no-title-check -DFEATURE_TINYSTATES=1 ../src/main.asm ../build/00.sfc
../tools/asar/asar.exe --no-title-check -DFEATURE_TINYSTATES=1 ../src/main.asm ../build/ff.sfc
python3 create_ips.py ../build/00.sfc ../build/ff.sfc ../build/Custom_InfoHUD_TinyStates_2.4.X.ips

rm 00.sfc ff.sfc ../build/00.sfc ../build/ff.sfc
cd ..
