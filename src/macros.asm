
; ---------------
; General Purpose
; ---------------

macro a8() ; A = 8-bit
    SEP #$20
endmacro

macro a16() ; A = 16-bit
    REP #$20
endmacro

macro i8() ; X/Y = 8-bit
    SEP #$10
endmacro

macro i16() ; X/Y = 16-bit
    REP #$10
endmacro

macro ai8() ; A + X/Y = 8-bit
    SEP #$30
endmacro

macro ai16() ; A + X/Y = 16-bit
    REP #$30
endmacro


; -------------
; Practice Menu
; -------------

macro item_index_to_vram_index()
    ; Find screen position from Y (item number)
    TYA : ASL #5
    CLC : ADC #$0146 : TAX
endmacro

macro cm_header(title)
; outlined text to be drawn above the menu items
    table ../resources/header.tbl
    db #$28, "<title>", #$FF
    table ../resources/normal.tbl
endmacro

macro cm_footer(title)
; optional outlined text below the menu items
    table ../resources/header.tbl
    dw #$F007 : db #$28, "<title>", #$FF
    table ../resources/normal.tbl
endmacro

macro cm_version_header(title, major, minor, build, rev_1, rev_2)
; header text with automatic version number appended
    table ../resources/header.tbl
if !VERSION_REV_1
    db #$28, "<title> v<major>.<minor>.<build>.<rev_1><rev_2>", #$FF
else
if !VERSION_REV_2
    db #$28, "<title> v<major>.<minor>.<build>.<rev_2>", #$FF
else
    db #$28, "<title> v<major>.<minor>.<build>", #$FF
endif
endif
    table ../resources/normal.tbl
endmacro

macro cm_numfield(title, addr, start, end, increment, heldincrement, jsltarget)
; Allows editing an 8-bit value at the specified address
    dw !ACTION_NUMFIELD
    dl <addr> ; 24bit RAM address to display/manipulate
    db <start>, <end> ; minimum and maximum values allowed
    db <increment> ; inc/dec amount when pressed
;    db <heldincrement> ; inc/dec amount when direction is held (scroll faster)
    dw <jsltarget> ; 16bit address to code in the same bank as current menu/submenu
    db #$28, "<title>", #$FF
endmacro

macro cm_numfield_word(title, addr, start, end, increment, heldincrement, jsltarget)
; Allows editing a 16-bit value at the specified address
    dw !ACTION_NUMFIELD_WORD
    dl <addr> ; 24bit RAM address to display/manipulate
    dw <start>, <end> ; minimum and maximum values allowed
    dw <increment> ; inc/dec amount when pressed
;    dw <heldincrement> ; inc/dec amount when direction is held (scroll faster)
    dw <jsltarget> ; 16bit address to code in the same bank as current menu/submenu
    db #$28, "<title>", #$FF
endmacro

macro cm_numfield_hex(title, addr, start, end, increment, heldincrement, jsltarget)
; Allows editing an 8-bit value displayed in hexadecimal
    dw !ACTION_NUMFIELD_HEX
    dl <addr> ; 24bit RAM address to display/manipulate
    db <start>, <end> ; minimum and maximum values allowed
    db <increment> ; inc/dec amount when pressed
;    db <heldincrement> ; inc/dec amount when direction is held (scroll faster)
    dw <jsltarget> ; 16bit address to code in the same bank as current menu/submenu
    db #$28, "<title>", #$FF
endmacro

macro cm_numfield_hex_word(title, addr)
    dw !ACTION_NUMFIELD_HEX_WORD
    dl <addr> ; 24bit RAM address to display/manipulate
    db #$28, "<title>", #$FF
endmacro

macro cm_numfield_color(title, addr, jsltarget)
; Allows editing an 8-bit value in increments consistent with SNES color values
    dw !ACTION_NUMFIELD_COLOR
    dl <addr> ; 24bit RAM address to display/manipulate
    dw <jsltarget> ; 16bit address to code in the same bank as current menu/submenu
    db #$28, "<title>", #$FF
endmacro

macro cm_numfield_sound(title, addr, start, end, increment, jsltarget)
; Allows editing an 8-bit value and playing a sound when pressing Y
    dw !ACTION_NUMFIELD_SOUND
    dl <addr> ; 24bit RAM address to display/manipulate
    db <start>, <end> ; minimum and maximum values allowed
    db <increment> ; inc/dec amount when pressed
    dw <jsltarget> ; 16bit address to code in the same bank as current menu/submenu
    db #$28, "<title>", #$FF
endmacro

macro cm_toggle(title, addr, value, jsltarget)
; toggle between zero (OFF) and value (ON)
    dw !ACTION_TOGGLE
    dl <addr> ; 24bit RAM address to display/manipulate
    db <value> ; value to write when toggled on
    dw <jsltarget> ; 16bit address to code in the same bank as current menu/submenu
    db #$28, "<title>", #$FF
endmacro

macro cm_toggle_inverted(title, addr, value, jsltarget)
; for toggles where zero = ON
    dw !ACTION_TOGGLE_INVERTED
    dl <addr> ; 24bit RAM address to display/manipulate
    db <value> ; value to write when toggled off
    dw <jsltarget> ; 16bit address to code in the same bank as current menu/submenu
    db #$28, "<title>", #$FF
endmacro

macro cm_toggle_bit(title, addr, mask, jsltarget)
; toggle specific bits, draw OFF if bits cleared
    dw !ACTION_TOGGLE_BIT
    dl <addr> ; 24bit RAM address to display/manipulate
    dw <mask> ; which bits to flip
    dw <jsltarget> ; 16bit address to code in the same bank as current menu/submenu
    db #$28, "<title>", #$FF
endmacro

macro cm_toggle_bit_inverted(title, addr, mask, jsltarget)
; toggle specific bits, draw ON if bits cleared
    dw !ACTION_TOGGLE_BIT_INVERTED
    dl <addr> ; 24bit RAM address to display/manipulate
    dw <mask> ; which bits to flip
    dw <jsltarget> ; 16bit address to code in the same bank as current menu/submenu
    db #$28, "<title>", #$FF
endmacro

macro cm_jsl(title, routine, argument)
; run code when menu item executed
    dw !ACTION_JSL
    dw <routine> ; 16bit address to code in the same bank as current menu/submenu
    dw <argument> ; value passed to routine in Y
    db #$28, "<title>", #$FF
endmacro

macro cm_jsl_submenu(title, routine, argument)
; only used within submenu and mainmenu macros
    dw !ACTION_JSL_SUBMENU
    dw <routine> ; 16bit address to code in the same bank as current menu/submenu
    dw <argument> ; value passed to routine in Y
    db #$28, "<title>", #$FF
endmacro

macro cm_mainmenu(title, target)
; runs action_mainmenu to set the bank of the next menu and continue into action_submenu
; can only used for submenus listed on the mainmenu
    %cm_jsl("<title>", #action_mainmenu, <target>)
endmacro

macro cm_submenu(title, target)
; run action_submenu to load the next menu from the same bank
    %cm_jsl_submenu("<title>", #action_submenu, <target>)
endmacro

macro cm_preset(title, target)
; runs action_load_preset to set the bank of the preset menu that matches the current category
    %cm_jsl_submenu("<title>", #action_load_preset, <target>)
endmacro

macro cm_ctrl_shortcut(title, addr)
; configure controller shortcuts
    dw !ACTION_CTRL_SHORTCUT
    dl <addr> ; 24bit RAM address to display/manipulate
    db #$28, "<title>", #$FF
endmacro

macro cm_ctrl_input(title, addr, routine, argument)
    dw !ACTION_CTRL_INPUT
    dl <addr> ; 24bit RAM address to display/manipulate
    dw <routine> ; 16bit address to code in the same bank as current menu/submenu
    dw <argument> ; value passed to routine in Y
    db #$28, "<title>", #$FF
endmacro

macro examplemenu()
    dw #$FFFF
    dw #$FFFF
    dw #$FFFF
    dw #$FFFF
    dw #$FFFF
    dw #$FFFF
    dw #ifb_dummy_on
    dw #ifb_dummy_off
    dw #ifb_dummy_hexnum
    dw #ifb_dummy_num
endmacro

macro palettemenu(title, pointer, addr)
    %cm_submenu("<title>", <pointer>)

<pointer>:
    dw #custompalettes_hex_red
    dw #custompalettes_hex_green
    dw #custompalettes_hex_blue
    dw #$FFFF
    dw #custompalettes_dec_red
    dw #custompalettes_dec_green
    dw #custompalettes_dec_blue
    dw #$FFFF
    dw <pointer>_hex_hi
    dw <pointer>_hex_lo
    %examplemenu()
    dw #$0000
    %cm_header("<title>")
    %cm_footer("THREE WAYS TO EDIT COLORS")

<pointer>_hex_hi:
    %cm_numfield_hex("SNES BGR - HI BYTE", !sram_custompalette_hi, 0, 255, 1, 8, .routine_hi)
  .routine_hi
    %a8() ; sram_custompalette_hi already in A
    XBA : LDA !sram_custompalette_lo
    %a16()
    STA <addr>
    JSL cm_colors
    JML MixRGB

<pointer>_hex_lo:
    %cm_numfield_hex("SNES BGR - LO BYTE", !sram_custompalette_lo, 0, 255, 1, 8, .routine_lo)
  .routine_lo
    %a8() ; sram_custompalette_lo already in A
    XBA : LDA !sram_custompalette_hi : XBA
    %a16()
    STA <addr>
    JSL cm_colors
    JML MixRGB
}
endmacro

macro setupRGB(addr)
    LDA.w #<addr>>>16 : STA $C3
    LDA.w #<addr> : STA $C1
    JSL cm_setup_RGB
    RTS
endmacro

macro cm_equipment_item(name, addr, bitmask, inverse)
; Allows three-way toggling of items:  ON/OFF/UNOBTAINED
    dw !ACTION_CHOICE
    dl <addr>
    dw #.routine
    db #$28, "<name>", #$FF
    db #$28, " UNOBTAINED", #$FF
    db #$28, "         ON", #$FF
    db #$28, "        OFF", #$FF
    db #$FF
  .routine
    LDA.w <addr> : STA !DP_Address
    LDA.w <addr>>>16 : STA !DP_Address+2
    LDA <bitmask> : STA !DP_ToggleValue
    LDA <inverse> : STA !DP_Increment
    JMP equipment_toggle_items
endmacro

macro cm_equipment_beam(name, addr, bitmask, inverse, and)
; Allows three-way toggling of beams:  ON/OFF/UNOBTAINED
    dw !ACTION_CHOICE
    dl <addr>
    dw #.routine
    db #$28, "<name>", #$FF
    db #$28, " UNOBTAINED", #$FF
    db #$28, "         ON", #$FF
    db #$28, "        OFF", #$FF
    db #$FF
  .routine
    LDA.w #<addr> : STA !DP_Address
    LDA.w #<addr>>>16 : STA !DP_Address+2
    LDA <bitmask> : STA !DP_ToggleValue
    LDA <inverse> : STA !DP_Increment
    LDA <and> : STA !DP_Temp
    JMP equipment_toggle_beams
endmacro


; -------------
; Sound Effects
; -------------

macro sfxmove() ; Move Cursor
    LDA !sram_customsfx_move : JSL !SFX_LIB1
endmacro

macro sfxconfirm() ; Confirm Selection
    LDA !sram_customsfx_confirm : JSL !SFX_LIB1
endmacro

macro sfxtoggle() ; Toggle
    LDA !sram_customsfx_toggle : JSL !SFX_LIB1
endmacro

macro sfxnumber() ; Number Selection
    LDA !sram_customsfx_number : JSL !SFX_LIB1
endmacro

macro sfxgoback() ; Go Back
    LDA !sram_customsfx_goback : JSL !SFX_LIB1
endmacro

macro sfxclick() ; play click sound lib1
    LDA #$0037 : JSL !SFX_LIB1
endmacro

macro sfxtype() ; play typing sound lib2
    LDA #$0045 : JSL !SFX_LIB2
endmacro

macro sfxpause() ; play pause menu sound lib1
    LDA #$0038 : JSL !SFX_LIB1
endmacro

macro sfxstatue() ; play statue break sound lib2
    LDA #$0019 : JSL !SFX_LIB2
endmacro

macro sfxbubble() ; play bubble sound lib2
    LDA #$0011 : JSL !SFX_LIB2
endmacro

macro sfxquake() ; play earthquake sound lib3
    LDA #$001E : JSL !SFX_LIB3
endmacro

macro sfxenergy() ; play energy drop sound lib2
    LDA #$0002 : JSL !SFX_LIB2
endmacro

macro sfxgrapple() ; play grapple sound lib1
    LDA #$0005 : JSL !SFX_LIB1
endmacro

macro sfxdoor() ; play door close sound lib3
    LDA #$0008 : JSL !SFX_LIB3
endmacro

macro sfxship() ; play ship close sound lib3
    LDA #$0015 : JSL !SFX_LIB3
endmacro

macro sfxmissile() ; play missile sound lib2
    LDA #$0003 : JSL !SFX_LIB2
endmacro

macro sfxshot() ; play credits shot sound lib1
    LDA #$0022 : JSL !SFX_LIB1
endmacro

macro sfxdisengage() ; play refill disengage sound lib2
    LDA #$0038 : JSL !SFX_LIB2
endmacro

macro sfxdachora() ; play dachora cry sound lib2
    LDA #$001D : JSL !SFX_LIB2
endmacro

macro sfxdamage() ; play damage boost sound lib1
    LDA #$0035 : JSL !SFX_LIB1
endmacro

macro sfxbeep() ; play minimap movement beep sound lib1
    LDA #$0036 : JSL !SFX_LIB1
endmacro

macro sfxsave() ; play save station sound lib1
    LDA #$002E : JSL !SFX_LIB1
endmacro

macro sfxfail() ; play grapple end sound lib1
    LDA #$0007 : JSL !SFX_LIB1
endmacro
