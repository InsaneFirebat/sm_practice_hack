lorom

!FEATURE_SD2SNES ?= 0
!FEATURE_TINYSTATES ?= 0
!FEATURE_PAL ?= 0
!FEATURE_EXTRAS ?= 0
!FEATURE_VANILLAHUD ?= 0
!FEATURE_DEV ?= 1 ; default on for now
!ORIGINAL_MESSAGE_TEXT ?= 0
!PRESERVE_WRAM_DURING_SPACETIME ?= 1
!RAW_TILE_GRAPHICS ?= 1

table ../resources/tables/normal.tbl

incsrc macros.asm
incsrc defines.asm
if !FEATURE_DEV
incsrc symbols.asm
endif

incsrc printdebug.asm

incsrc init.asm
incsrc gamemode.asm
incsrc minimap.asm
incsrc menu.asm
incsrc infohud.asm
incsrc IFBhijacks.asm
incsrc rng.asm
incsrc presets.asm
incsrc custompresets.asm
incsrc misc.asm
incsrc layout.asm
incsrc cutscenes.asm
incsrc fanfare.asm
incsrc spriteprio.asm
incsrc spritefeat.asm
if !RAW_TILE_GRAPHICS
incsrc tilegraphics.asm
endif

; Make sure the ROM expands to 4MB
org $FFFFFF : db $FF

print "Assembly complete. Total bytes written: ", bytes
