asar 1.81
lorom

table ../resources/normal.tbl
print ""

if !FEATURE_SD2SNES
    print "SD2SNES ENABLED"
    !FEATURE_TINYSTATES = 0
    incsrc macros.asm
    incsrc defines.asm
    incsrc save.asm
else
if !FEATURE_TINYSTATES
    print "TINYSTATES ENABLED"
    !FEATURE_SD2SNES = 1       ; Set this to enable savestate features
    incsrc macros.asm
    incsrc defines.asm
    incsrc tinystates.asm
else
    print "SD2SNES AND TINYSTATES DISABLED"
    incsrc macros.asm
    incsrc defines.asm
endif
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
