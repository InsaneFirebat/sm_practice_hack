#!/bin/bash

echo "Building SM PAL Practice Hack"
python3 tools/python/create_dummies.py ../../resources/00.sfc ../../resources/ff.sfc

echo "Building saveless version"
cp resources/00.sfc build
cp resources/ff.sfc build
tools/asar/asar --no-title-check -DFEATURE_SD2SNES=0 -DFEATURE_PAL=1 -DFEATURE_EXTRAS=0 src/main.asm build/00.sfc
tools/asar/asar --no-title-check -DFEATURE_SD2SNES=0 -DFEATURE_PAL=1 -DFEATURE_EXTRAS=0 src/main.asm build/ff.sfc
python3 tools/python/create_ips.py build/00.sfc build/ff.sfc build/Custom_InfoHUD_2.7.X.ips

echo "Building savestate version"
cp resources/00.sfc build
cp resources/ff.sfc build
tools/asar/asar --no-title-check -DFEATURE_SD2SNES=1 -DFEATURE_PAL=1 -DFEATURE_EXTRAS=0 src/main.asm build/00.sfc
tools/asar/asar --no-title-check -DFEATURE_SD2SNES=1 -DFEATURE_PAL=1 -DFEATURE_EXTRAS=0 src/main.asm build/ff.sfc
python3 tools/python/create_ips.py build/00.sfc build/ff.sfc build/Custom_InfoHUD_Savestates_2.7.X.ips

echo "Building TinyStates version"
cp resources/00.sfc build
cp resources/ff.sfc build
tools/asar/asar.exe --no-title-check -DFEATURE_TINYSTATES=1 -DFEATURE_PAL=1 -DFEATURE_EXTRAS=0 src/main.asm build/00.sfc
tools/asar/asar.exe --no-title-check -DFEATURE_TINYSTATES=1 -DFEATURE_PAL=1 -DFEATURE_EXTRAS=0 src/main.asm build/ff.sfc
python3 tools/python/create_ips.py build/00.sfc build/ff.sfc build/Custom_InfoHUD_TinyStates_2.7.X.ips

rm resources/00.sfc resources/ff.sfc build/00.sfc build/ff.sfc
