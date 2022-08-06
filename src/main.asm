lorom

table ../resources/normal.tbl

incsrc macros.asm
incsrc defines.asm

if !FEATURE_SD2SNES
    print "SAVESTATES ENABLED"
    incsrc save.asm
else
    print "SD2SNES DISABLED"
endif
incsrc gamemode.asm
incsrc minimap.asm
incsrc menu.asm
incsrc infohud.asm
incsrc rng.asm
incsrc custompresets.asm
incsrc presets.asm
incsrc misc.asm
incsrc init.asm
incsrc fanfare.asm
incsrc spriteprio.asm
incsrc spritefeat.asm
;incsrc tilegraphics.asm

; Make sure the ROM expands to 4MB
org $FFFFFF : db $FF

