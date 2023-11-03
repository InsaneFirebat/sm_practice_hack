#!/bin/bash

# Return an error if any command fails
success=0
trap success=1 ERR

echo "Building SM NTSC Practice Hack"
cd resources
python3 create_ram_symbols.py ../src/defines.asm ../src/symbols.asm
python3 create_dummies.py 00.sfc ff.sfc

echo "Building saveless version"
cp *.sfc ../build
../tools/asar --no-title-check --symbols=wla --symbols-path=../build/symbols.sym -DFEATURE_SD2SNES=0 -DFEATURE_PAL=0 -DFEATURE_TINYSTATES=0 "$@" ../src/main.asm ../build/00.sfc
../tools/asar --no-title-check --symbols=wla --symbols-path=../build/symbols.sym -DFEATURE_SD2SNES=0 -DFEATURE_PAL=0 -DFEATURE_TINYSTATES=0 "$@" ../src/main.asm ../build/ff.sfc
python3 sort_debug_symbols.py ../build/symbols.sym x x
python3 create_ips.py ../build/00.sfc ../build/ff.sfc ../build/BluePlague.ips

echo "Building SD2SNES version"
cp *.sfc ../build
../tools/asar --no-title-check --symbols=wla --symbols-path=../build/symbols.sym -DFEATURE_SD2SNES=1 -DFEATURE_PAL=0 -DFEATURE_TINYSTATES=0 "$@" ../src/main.asm ../build/00.sfc
../tools/asar --no-title-check --symbols=wla --symbols-path=../build/symbols.sym -DFEATURE_SD2SNES=1 -DFEATURE_PAL=0 -DFEATURE_TINYSTATES=0 "$@" ../src/main.asm ../build/ff.sfc
python3 sort_debug_symbols.py ../build/symbols.sym x x
python3 create_ips.py ../build/00.sfc ../build/ff.sfc ../build/BluePlague_sd2snes.ips

echo "Building TinyStates version"
cp *.sfc ../build
../tools/asar --no-title-check --symbols=wla --symbols-path=../build/symbols.sym -DFEATURE_SD2SNES=0 -DFEATURE_PAL=0 -DFEATURE_TINYSTATES=1 "$@" ../src/main.asm ../build/00.sfc
../tools/asar --no-title-check --symbols=wla --symbols-path=../build/symbols.sym -DFEATURE_SD2SNES=0 -DFEATURE_PAL=0 -DFEATURE_TINYSTATES=1 "$@" ../src/main.asm ../build/ff.sfc
python3 sort_debug_symbols.py ../build/symbols.sym x x
python3 create_ips.py ../build/00.sfc ../build/ff.sfc ../build/BluePlague_tinystates.ips

rm 00.sfc ff.sfc ../build/00.sfc ../build/ff.sfc ../build/symbols.sym
cd ..

exit $success
