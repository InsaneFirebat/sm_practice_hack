lorom

table ../resources/normal.tbl

incsrc macros.asm
incsrc defines.asm

print ""

if !FEATURE_SD2SNES
print "SAVESTATES ENABLED"
incsrc save.asm
!FEATURE_TINYSTATES = 0
elseif !FEATURE_TINYSTATES
print "TINYSTATES ENABLED"
incsrc tinystates.asm
!FEATURE_SD2SNES = 1       ; Set this to enable savestate features
else
print "SAVESTATES AND TINYSTATES DISABLED"
endif

incsrc gamemode.asm
incsrc minimap.asm
incsrc menu.asm
incsrc infohud.asm
incsrc rng.asm
incsrc custompresets.asm
incsrc presets.asm
;incsrc damage.asm
;incsrc physics.asm
incsrc misc.asm
;incsrc layout.asm
;incsrc cutscenes.asm
incsrc init.asm
incsrc fanfare.asm
incsrc spriteprio.asm
incsrc spritefeat.asm
if !RAW_TILE_GRAPHICS
    incsrc tilegraphics.asm
endif

incsrc symbols.asm

; Make sure the ROM expands to 4MB
org $FFFFFF : db $FF

