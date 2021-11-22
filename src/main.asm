lorom

table ../resources/normal.tbl

incsrc macros.asm
incsrc defines.asm

incsrc gamemode.asm
if !FEATURE_SD2SNES
    print "SAVESTATES ENABLED"
    incsrc save.asm
endif
incsrc minimap.asm
incsrc menu.asm
incsrc infohud.asm
;incsrc rng.asm
incsrc presets.asm
incsrc misc.asm
incsrc init.asm
incsrc fanfare.asm
incsrc spriteprio.asm
incsrc spritefeat.asm

; Make sure the ROM expands to 4MB
;org $ffffff : db $ff
; Axeil is already 4MB
