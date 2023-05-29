
; print debug output

print ""
if !FEATURE_PAL
print "PAL REGION"
else
print "NTSC REGION"
endif

if !FEATURE_SD2SNES
print "SAVESTATES ENABLED"
incsrc save.asm
else
print "SAVESTATES DISABLED"
endif

if !FEATURE_TINYSTATES
print "TINYSTATES ENABLED"
incsrc tinystates.asm
; Set to enable savestate features
!FEATURE_SD2SNES = 1
else
print "TINYSTATES DISABLED"
endif

if !FEATURE_EXTRAS
print "EXTRAS ENABLED"
endif

if !FEATURE_VANILLAHUD
print "VANILLA HUD"
else
print "INFOHUD"
endif

if !ORIGINAL_MESSAGE_TEXT
print "PRESERVE FANFARE MESSAGES"
endif

if !RAW_TILE_GRAPHICS
else
print "FAST PRESETS DISABLED"
endif