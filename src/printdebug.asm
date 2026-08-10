
; print debug output

print ""
if !FEATURE_PAL
print "NTSC / [PAL] REGION"
else
print "[NTSC] / PAL REGION"
endif

if !FEATURE_TINYSTATES
print "SAVESTATES / [TINYSTATES] / NO SAVES"
elseif !FEATURE_SD2SNES
print "[SAVESTATES] / TINYSTATES / NO SAVES"
else
print "SAVESTATES / TINYSTATES / [NO SAVES]"
endif

if !FEATURE_VANILLAHUD
print "INFOHUD / [VANILLA HUD]"
else
print "[INFOHUD] / VANILLA HUD"
endif

if !FEATURE_EXTRAS
print "EXTRAS FEATURES ENABLED"
endif

if !ORIGINAL_MESSAGE_TEXT
print "PRESERVE FANFARE MESSAGES"
endif

if !RAW_TILE_GRAPHICS
else
print "FAST PRESETS DISABLED"
endif

if !PRESERVE_WRAM_DURING_SPACETIME == 0
print "SPACETIME PROTECTION DISABLED"
endif

if !FEATURE_DEV
print "DEVELOPER MODE ENABLED"
endif


macro tickfreespace(bank)
; make %printfreespace() print each bank with valid freespace, without altering the macro
%startfree(<bank>)
%endfree(<bank>)
endmacro

%tickfreespace(80)
%tickfreespace(81)
%tickfreespace(82)
%tickfreespace(83)
;%tickfreespace(84) ; forbidden
%tickfreespace(85)
%tickfreespace(86)
%tickfreespace(87)
%tickfreespace(88)
%tickfreespace(89)
%tickfreespace(8A)
%tickfreespace(8B)
%tickfreespace(8C)
%tickfreespace(8D)
%tickfreespace(8E)
%tickfreespace(8F)
%tickfreespace(90)
%tickfreespace(91)
%tickfreespace(92)
%tickfreespace(93)
%tickfreespace(94)
%tickfreespace(99)
%tickfreespace(9A)
%tickfreespace(9B)
%tickfreespace(9C)
%tickfreespace(9D)
%tickfreespace(9E)
%tickfreespace(9F)
%tickfreespace(A0)
%tickfreespace(A1)
%tickfreespace(A2)
%tickfreespace(A3)
%tickfreespace(A4)
%tickfreespace(A5)
%tickfreespace(A6)
%tickfreespace(A7)
%tickfreespace(A8)
%tickfreespace(A9)
%tickfreespace(AA)
%tickfreespace(AB)
%tickfreespace(AC)
%tickfreespace(AD)
%tickfreespace(AE)
%tickfreespace(AF)
%tickfreespace(B0)
%tickfreespace(B2)
%tickfreespace(B3)
%tickfreespace(B4)
%tickfreespace(B5)
%tickfreespace(B6)
%tickfreespace(B7)
%tickfreespace(B8)
%tickfreespace(CE)
%tickfreespace(DE)
%tickfreespace(DF)
%tickfreespace(E0)
%tickfreespace(E1)
%tickfreespace(E2)
%tickfreespace(E3)
%tickfreespace(E4)
;%tickfreespace(E5) ; reserved for roomnames.asm
;%tickfreespace(E6)
;%tickfreespace(E7)
;%tickfreespace(E8)
;%tickfreespace(E9)
;%tickfreespace(EA)
;%tickfreespace(EB)
;%tickfreespace(EC)
;%tickfreespace(ED)
;%tickfreespace(EE)
;%tickfreespace(EF)
%tickfreespace(F0)
%tickfreespace(F1)
%tickfreespace(F2)
%tickfreespace(F3)
;%tickfreespace(F4)
;%tickfreespace(F5)
;%tickfreespace(F6)
;%tickfreespace(F7)
;%tickfreespace(F8)
;%tickfreespace(F9)
;%tickfreespace(FA)
;%tickfreespace(FB)
;%tickfreespace(FC)
;%tickfreespace(FD)
;%tickfreespace(FE)
;%tickfreespace(FF)
