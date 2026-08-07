
lorom

!FEATURE_SD2SNES ?= 0
!FEATURE_TINYSTATES ?= 0
if !FEATURE_TINYSTATES
!FEATURE_SD2SNES = 1
endif
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
incsrc freespace.asm
incsrc symbols.asm
incsrc roomnames.asm

incsrc printdebug.asm

incsrc init.asm
incsrc gamemode.asm
incsrc save.asm
incsrc tinystates.asm
incsrc minimap.asm
incsrc infohud.asm
incsrc infohudmodes.asm
incsrc customhudmodes.asm
incsrc menu.asm
incsrc ramwatchmenu.asm
incsrc customizemenu.asm
incsrc BRBmenu.asm
incsrc IFBmenu.asm
incsrc presets.asm
incsrc custompresets.asm
incsrc rng.asm
incsrc spritefeat.asm
incsrc crash.asm
incsrc misc.asm
incsrc layout.asm
incsrc cutscenes.asm
incsrc fanfare.asm
incsrc spriteprio.asm
incsrc demos.asm
incsrc IFBhijacks.asm

if !RAW_TILE_GRAPHICS
incsrc tilegraphics.asm
endif


; Make sure the ROM expands to 4MB
org $FFFFFF : db $FF

%printfreespace()
print "Assembly complete. Total bytes written: ", bytes
