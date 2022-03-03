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
incsrc IFBhijacks.asm
incsrc rng.asm
incsrc presets.asm
incsrc custompresets.asm
incsrc misc.asm
incsrc crash.asm
incsrc layout.asm
incsrc cutscenes.asm
incsrc init.asm
incsrc fanfare.asm
incsrc spriteprio.asm
incsrc spritefeat.asm
if !RAW_TILE_GRAPHICS
incsrc tilegraphics.asm
endif

; Make sure the ROM expands to 4MB
org $FFFFFF : db $FF
