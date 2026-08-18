
@echo off

cd tools\python

echo Executing create_ram_symbols.py
python create_ram_symbols.py ..\..\src\defines.asm ..\..\src\symbols.asm
echo Generated 'src\symbols.asm' from 'src\defines.asm'

PAUSE
