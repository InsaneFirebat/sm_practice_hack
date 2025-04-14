asar 1.81
lorom

table ../resources/normal.tbl
print ""

incsrc macros.asm
incsrc defines.asm

if !FEATURE_SD2SNES
print "SD2SNES ENABLED"
incsrc save.asm
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
if !RAW_TILE_GRAPHICS
incsrc tilegraphics.asm
endif

incsrc symbols.asm

; Make sure the ROM expands to 4MB
;org $FFFFFF : db $FF
; Axeil is already 4MB
