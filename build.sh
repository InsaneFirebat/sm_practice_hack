#!/bin/bash

echo "Building SM NTSC Practice Hack"
cd resources
python3 create_dummies.py 00.sfc ff.sfc

echo "Building saveless version"
cp *.sfc ../build
../tools/asar/asar.exe --no-title-check -DFEATURE_SD2SNES=0 -DFEATURE_PAL=0 -DFEATURE_EXTRAS=0 ../src/main.asm ../build/00.sfc
../tools/asar/asar.exe --no-title-check -DFEATURE_SD2SNES=0 -DFEATURE_PAL=0 -DFEATURE_EXTRAS=0 ../src/main.asm ../build/ff.sfc
python3 create_ips.py ../build/00.sfc ../build/ff.sfc ../build/Custom_InfoHUD_2.3.X.ips

echo "Building SD2SNES version"
cp *.sfc ../build
../tools/asar/asar.exe --no-title-check -DFEATURE_SD2SNES=1 -DFEATURE_PAL=0 -DFEATURE_EXTRAS=0 ../src/main.asm ../build/00.sfc
../tools/asar/asar.exe --no-title-check -DFEATURE_SD2SNES=1 -DFEATURE_PAL=0 -DFEATURE_EXTRAS=0 ../src/main.asm ../build/ff.sfc
python3 create_ips.py ../build/00.sfc ../build/ff.sfc ../build/Custom_InfoHUD_Savestates_2.3.X.ips

rm 00.sfc ff.sfc ../build/00.sfc ../build/ff.sfc
cd ..
