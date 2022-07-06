; ------
; Macros
; ------

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


; -----------------------
; Customize Practice Menu
; -----------------------

CustomizeMenu:
    dw #ifb_menubackground
    dw #ifb_custompalettes_menu
    dw #ifb_paletteprofile
    dw #ifb_palette2custom
    dw #ifb_paletterando
    dw #$FFFF
    dw #ifb_customsfx
    dw #$FFFF
    dw #ifb_customfont
    dw #$FFFF
    dw #ifb_menuscroll_button
    dw #ifb_menuscroll_delay
    dw #$0000
    %cm_header("CUSTOMIZE PRACTICE MENU")

ifb_menubackground:
    %cm_toggle("Menu Background", !sram_menu_background, #$0001, #0)

ifb_custompalettes_menu:
    %cm_submenu("Customize Menu Palette", #CustomPalettesMenu)

ifb_paletteprofile:
    dw !ACTION_CHOICE
    dl #!sram_custompalette_profile
    dw .routine
    db #$28, "Menu Palette", #$FF
        db #$28, "     CUSTOM", #$FF ; CUSTOM should always be first
        db #$28, "     TWITCH", #$FF
        db #$28, "    DEFAULT", #$FF
        db #$28, "    FIREBAT", #$FF
        db #$28, " WARDRINKER", #$FF
        db #$28, "        MM2", #$FF
        db #$28, "      PTOIL", #$FF
        db #$28, "     ZOHDIN", #$FF
        db #$28, "    DARKXOA", #$FF
        db #$28, "    MELONAX", #$FF
        db #$28, " TOPSYTURVE", #$FF
        db #$28, "        OST", #$FF
        db #$28, "        JRP", #$FF
        db #$28, "       GREY", #$FF
        db #$28, "        RED", #$FF
        db #$28, "     PURPLE", #$FF
        db #$28, "        HUD", #$FF
    db #$FF
  .routine
    JSL cm_refresh_cgram_long
    RTL

ifb_palette2custom:
    %cm_jsl("Copy Palette to Custom", .routine, #$0000)
  .routine
    JSL copy_menu_palette
    RTL

ifb_paletterando:
    %cm_submenu("Randomize Custom Palette", #PaletteRandoConfirm)

PaletteRandoConfirm:
    dw #paletterando_abort
    dw #$FFFF
    dw #paletterando_confirm
    dw #$FFFF
    dw #$FFFF
    dw #$FFFF
    dw #$FFFF
    dw #$FFFF
    dw #$FFFF
    dw #$FFFF
    %examplemenu()
    dw #$0000
    %cm_header("CONFIRM PALETTE RANDO")
    %cm_footer("YOU WILL LOSE SAVED COLORS")

paletterando_abort:
    %cm_jsl("ABORT", #.routine, #$0000)
  .routine
    %sfxgoback()
    JSL cm_previous_menu
    RTL

paletterando_confirm:
    %cm_jsl("RANDOMIZE!", #.routine, #$0000)
  .routine
    LDA !ram_seed_Y : AND #$7FFF : STA !sram_custompalette_menuborder
    JSL MenuRNG : AND #$7FFF : STA !sram_custompalette_menuheaderoutline
    LDA !ram_seed_X : AND #$7FFF : STA !sram_custompalette_menutext
    JSL MenuRNG2 : AND #$7FFF : STA !sram_custompalette_menubackground
    JSL MenuRNG : AND #$7FFF : STA !sram_custompalette_menunumoutline
    JSL MenuRNG : AND #$7FFF : STA !sram_custompalette_menunumfill
    LDA !ram_seed_X : AND #$7FFF : STA !sram_custompalette_menutoggleon
    JSL MenuRNG2 : AND #$7FFF : STA !sram_custompalette_menuseltext
    JSL MenuRNG : AND #$7FFF : STA !sram_custompalette_menuseltextbg
    JSL MenuRNG2 : AND #$7FFF : STA !sram_custompalette_menunumseloutline
    JSL MenuRNG : AND #$7FFF : STA !sram_custompalette_menunumsel

    ; play a happy sound and refresh current profile
    %ai16()
    JSL PrepMenuPalette_customPalette ; points to a branch within PrepMenuPalette
    JSL refresh_custom_palettes
    %sfxbubble()
    RTL

ifb_customsfx:
    %cm_submenu("Customize Menu Sounds", #CustomMenuSFXMenu)

ifb_customfont:
    %cm_numfield("Select Font", !sram_cm_font, 0, 1, 1, 1, .routine)
  .routine
    JML cm_transfer_custom_tileset

CustomPalettesMenu:
    dw #custompalettes_menutext
    dw #custompalettes_menuseltext
    dw #custompalettes_menuseltextbg
    dw #custompalettes_menuheaderoutline
    dw #custompalettes_menunumfill
    dw #custompalettes_menunumoutline
    dw #custompalettes_menunumsel
    dw #custompalettes_menunumseloutline
    dw #custompalettes_menutoggleon
    dw #custompalettes_menuborder
    dw #custompalettes_menubackground
    %examplemenu()
    dw #ifb_custompalettes_display_menu
    dw #$0000
    %cm_header("CUSTOMIZE MENU PALETTE")

custompalettes_menutext:
    %palettemenu("Text", CustomPalettesMenu_menutext, !sram_custompalette_menutext)

custompalettes_menuseltext:
    %palettemenu("Selected Text", CustomPalettesMenu_menuseltext, !sram_custompalette_menuseltext)

custompalettes_menuseltextbg:
    %palettemenu("Selected Text Background", CustomPalettesMenu_menuseltextbg, !sram_custompalette_menuseltextbg)

custompalettes_menuheaderoutline:
    %palettemenu("Header Outline", CustomPalettesMenu_menuheaderoutline, !sram_custompalette_menuheaderoutline)

custompalettes_menunumfill:
    %palettemenu("Number Field Text", CustomPalettesMenu_menunumfill, !sram_custompalette_menunumfill)

custompalettes_menunumoutline:
    %palettemenu("Number Field Outline", CustomPalettesMenu_menunumoutline, !sram_custompalette_menunumoutline)

custompalettes_menunumsel:
    %palettemenu("Selected Num-Field Text", CustomPalettesMenu_menunumsel, !sram_custompalette_menunumsel)

custompalettes_menunumseloutline:
    %palettemenu("Selected Num-Field Outline", CustomPalettesMenu_menunumseloutline, !sram_custompalette_menunumseloutline)

custompalettes_menutoggleon:
    %palettemenu("Toggle ON", CustomPalettesMenu_menutoggleon, !sram_custompalette_menutoggleon)

custompalettes_menuborder:
    %palettemenu("Toggle OFF + Border", CustomPalettesMenu_menuborder, !sram_custompalette_menuborder)

custompalettes_menubackground:
    %palettemenu("Background", CustomPalettesMenu_menubackground, !sram_custompalette_menubackground)

custompalettes_hex_red:
    %cm_numfield_color("Hexadecimal Red", !sram_custompalette_red, #MixRGB_long)

custompalettes_hex_green:
    %cm_numfield_color("Hexadecimal Green", !sram_custompalette_green, #MixRGB_long)

custompalettes_hex_blue:
    %cm_numfield_color("Hexadecimal Blue", !sram_custompalette_blue, #MixRGB_long)

custompalettes_dec_red:
    %cm_numfield("Decimal Red", !sram_custompalette_red, 0, 31, 1, 2, #MixRGB_long)

custompalettes_dec_green:
    %cm_numfield("Decimal Green", !sram_custompalette_green, 0, 31, 1, 2, #MixRGB_long)

custompalettes_dec_blue:
    %cm_numfield("Decimal Blue", !sram_custompalette_blue, 0, 31, 1, 2, #MixRGB_long)

ifb_dummy_on:
    %cm_toggle("Example Toggle", !sram_dummy_on, #$0001, #0)

ifb_dummy_off:
    %cm_toggle("Example Toggle", !sram_dummy_off, #$0001, #0)

ifb_dummy_hexnum:
    %cm_numfield_hex("Example Hex Number", !sram_dummy_num, 0, 255, 1, 8, #0)

ifb_dummy_num:
    %cm_numfield("Example Number", !sram_dummy_num, 0, 255, 1, 8, #0)

MixRGB_long:
{
    JSL MixRGB
    RTL
}


ifb_custompalettes_display_menu:
    %cm_submenu("Screenshot To Share Colors", #CustomPalettesDisplayMenu)

CustomPalettesDisplayMenu:
    dw #custompalettes_menuborder_display
    dw #custompalettes_menuheaderoutline_display
    dw #custompalettes_menutext_display
    dw #custompalettes_menubackground_display
    dw #custompalettes_menunumoutline_display
    dw #custompalettes_menunumfill_display
    dw #custompalettes_menutoggleon_display
    dw #custompalettes_menuseltext_display
    dw #custompalettes_menuseltextbg_display
    dw #custompalettes_menunumseloutline_display
    dw #custompalettes_menunumsel_display
    dw #$0000
    %cm_header("SHARE YOUR COLORS")
    %cm_footer("SEND A SCREENSHOT TO IFB")

custompalettes_menutext_display:
    %cm_numfield_hex_word("Text", !sram_custompalette_menutext)

custompalettes_menuseltext_display:
    %cm_numfield_hex_word("Selected Text", !sram_custompalette_menuseltext)

custompalettes_menuseltextbg_display:
    %cm_numfield_hex_word("Selected Text BG", !sram_custompalette_menuseltextbg)

custompalettes_menuborder_display:
    %cm_numfield_hex_word("Toggle OFF + Border", !sram_custompalette_menuborder)

custompalettes_menuheaderoutline_display:
    %cm_numfield_hex_word("Header Text Outline", !sram_custompalette_menuheaderoutline)

custompalettes_menunumfill_display:
    %cm_numfield_hex_word("NumField Text", !sram_custompalette_menunumfill)

custompalettes_menunumoutline_display:
    %cm_numfield_hex_word("NumField Outline", !sram_custompalette_menunumoutline)

custompalettes_menunumsel_display:
    %cm_numfield_hex_word("Selected NumField", !sram_custompalette_menunumsel)

custompalettes_menunumseloutline_display:
    %cm_numfield_hex_word("Selected NumField OL", !sram_custompalette_menunumseloutline)

custompalettes_menutoggleon_display:
    %cm_numfield_hex_word("Toggle ON", !sram_custompalette_menutoggleon)

custompalettes_menubackground_display:
    %cm_numfield_hex_word("Background", !sram_custompalette_menubackground)


; ---------------
; Custom Sound FX
; ---------------

CustomMenuSFXMenu:
    dw #ifb_sfx_move
    dw #ifb_sfx_toggle
    dw #ifb_sfx_number
    dw #ifb_sfx_confirm
    dw #ifb_sfx_goback
    dw #$FFFF
    dw #ifb_sfx_reset
    dw #$0000
    %cm_header("CUSTOMIZE MENU SOUND FX")
    %cm_footer("PRESS Y TO PLAY SOUNDS")

ifb_sfx_move:
    %cm_numfield_sound("Move Cursor", !sram_customsfx_move, 1, 63, 1, #action_test_sfx)

ifb_sfx_toggle:
    %cm_numfield_sound("Toggle", !sram_customsfx_toggle, 1, 63, 1, #action_test_sfx)

ifb_sfx_number:
    %cm_numfield_sound("Number Select", !sram_customsfx_number, 1, 63, 1, #action_test_sfx)

ifb_sfx_goback:
    %cm_numfield_sound("Go Back", !sram_customsfx_goback, 1, 63, 1, #action_test_sfx)

ifb_sfx_confirm:
    %cm_numfield_sound("Confirm Selection", !sram_customsfx_confirm, 1, 63, 1, #action_test_sfx)

ifb_sfx_reset:
    %cm_jsl("Reset to Defaults", .routine, #$0000)
  .routine
    LDA #$0037 : STA !sram_customsfx_move    ; these are customized
    LDA #$002A : STA !sram_customsfx_toggle
    LDA #$0037 : STA !sram_customsfx_number
    LDA #$0038 : STA !sram_customsfx_confirm
    LDA #$0007 : STA !sram_customsfx_goback
    %sfxquake()
    RTL

action_test_sfx:
{
    JSL !SFX_LIB1
    RTL
}


; -----------
; Menu Config
; -----------

ifb_menuscroll_button:
    dw !ACTION_CHOICE
    dl #!sram_scroll_button
    dw .routine
    db #$28, "Fast-Scroll But", #$FF
        db #$28, "ton       X", #$FF
        db #$28, "ton       Y", #$FF
    db #$FF
  .routine
    LDA !sram_scroll_button : BEQ +
    LDA #$4000 : STA !sram_cm_scroll_button
    RTL
+   LDA #$0040 : STA !sram_cm_scroll_button
    RTL

ifb_menuscroll_delay:
    %cm_numfield("Menu Scroll Delay", !sram_cm_scroll_delay, 1, 10, 1, 2, .routine)
  .routine
    LDA !sram_cm_scroll_delay : BNE +
    LDA #$000A : STA !sram_cm_scroll_delay
+   RTL


; ---------
; Menu Code
; ---------

pushpc
org $B5F000
print pc, " menu customization bankB5 start"
PrepMenuPalette:
{
    LDA !sram_custompalette_profile : ASL : TAX
    BEQ .customPalette

    PHB
    PHK : PLB
    LDA.l PaletteProfileTables,X : STA $12
    LDY #$0000 : LDA ($12),Y : STA !ram_custompalette_menuborder
    LDY #$0002 : LDA ($12),Y : STA !ram_custompalette_menuheaderoutline
    LDY #$0004 : LDA ($12),Y : STA !ram_custompalette_menutext
    LDY #$0006 : LDA ($12),Y : STA !ram_custompalette_menubackground
    LDY #$0008 : LDA ($12),Y : STA !ram_custompalette_menunumoutline
    LDY #$000A : LDA ($12),Y : STA !ram_custompalette_menunumfill
    LDY #$000C : LDA ($12),Y : STA !ram_custompalette_menutoggleon
    LDY #$000E : LDA ($12),Y : STA !ram_custompalette_menuseltext
    LDY #$0010 : LDA ($12),Y : STA !ram_custompalette_menuseltextbg
    LDY #$0012 : LDA ($12),Y : STA !ram_custompalette_menunumseloutline
    LDY #$0014 : LDA ($12),Y : STA !ram_custompalette_menunumsel
    PLB
    RTL

  .customPalette
    LDA !sram_custompalette_menuborder : STA !ram_custompalette_menuborder
    LDA !sram_custompalette_menuheaderoutline : STA !ram_custompalette_menuheaderoutline
    LDA !sram_custompalette_menutext : STA !ram_custompalette_menutext
    LDA !sram_custompalette_menubackground : STA !ram_custompalette_menubackground
    LDA !sram_custompalette_menunumoutline : STA !ram_custompalette_menunumoutline
    LDA !sram_custompalette_menunumfill : STA !ram_custompalette_menunumfill
    LDA !sram_custompalette_menutoggleon : STA !ram_custompalette_menutoggleon
    LDA !sram_custompalette_menuseltext : STA !ram_custompalette_menuseltext
    LDA !sram_custompalette_menuseltextbg : STA !ram_custompalette_menuseltextbg
    LDA !sram_custompalette_menunumseloutline : STA !ram_custompalette_menunumseloutline
    LDA !sram_custompalette_menunumsel : STA !ram_custompalette_menunumsel
    RTL
}

copy_menu_palette:
{
    PHB
    PHK : PLB
    LDA !sram_custompalette_profile : BNE + : BRL .fail
+   ASL : TAX : LDA.l PaletteProfileTables,X : STA $16

    ; copy table to SRAM, Y is already zero from JSL menu macro
    LDA ($16),Y : STA !sram_custompalette_menuborder : INY #2
    LDA ($16),Y : STA !sram_custompalette_menuheaderoutline : INY #2
    LDA ($16),Y : STA !sram_custompalette_menutext : INY #2
    LDA ($16),Y : STA !sram_custompalette_menubackground : INY #2
    LDA ($16),Y : STA !sram_custompalette_menunumoutline : INY #2
    LDA ($16),Y : STA !sram_custompalette_menunumfill : INY #2
    LDA ($16),Y : STA !sram_custompalette_menutoggleon : INY #2
    LDA ($16),Y : STA !sram_custompalette_menuseltext : INY #2
    LDA ($16),Y : STA !sram_custompalette_menuseltextbg : INY #2
    LDA ($16),Y : STA !sram_custompalette_menunumseloutline : INY #2
    LDA ($16),Y : STA !sram_custompalette_menunumsel : INY #2

    ; play a happy sound and refresh current profile
    JSL refresh_custom_palettes
    %sfxbubble()
    PLB
    RTL

  .fail
    ; make the animals cry cause we couldn't do anything
    %sfxdachora()
    PLB
    RTL
}

refresh_custom_palettes:
{
    PHP
    %ai16()
    JSL cm_refresh_cgram_long
    LDA #$0000 : STA !sram_custompalette_profile
    PLP
    RTL
}

PaletteProfileTables:
{
    dw #CustomProfileTable        ; 0
    dw #TwitchProfileTable        ; 1
    dw #DefaultProfileTable       ; 2
    dw #FirebatProfileTable       ; 3
    dw #wardrinkerProfileTable    ; 4
    dw #mm2ProfileTable           ; 5
    dw #ptoilProfileTable         ; 6
    dw #ZohdinProfileTable        ; 7
    dw #DarkXoaProfileTable       ; 8
    dw #MelonaxProfileTable       ; 9
    dw #TopsyTurveProfileTable    ; A
    dw #OSTProfileTable           ; B
    dw #JRPProfileTable           ; C
    dw #GreyProfileTable          ; D
    dw #RedProfileTable           ; E
    dw #PurpleProfileTable        ; F
    dw #HUDProfileTable           ; 10
    dw #$0000

!PROFILE_CUSTOM       = #$0000
!PROFILE_Twitch       = #$0001
!PROFILE_Default      = #$0002
!PROFILE_Firebat      = #$0003
!PROFILE_wardrinker   = #$0004
!PROFILE_mm2          = #$0005
!PROFILE_ptoil        = #$0006
!PROFILE_Zohdin       = #$0007
!PROFILE_DarkXoa      = #$0008
!PROFILE_Melonax      = #$0009
!PROFILE_TopsyTurvy   = #$000A
!PROFILE_OST          = #$000B
!PROFILE_JRP          = #$000C
!PROFILE_Grey         = #$000D
!PROFILE_Red          = #$000E
!PROFILE_Purple       = #$000F
!PROFILE_HUD          = #$0010

; border, headeroutline, text, background, numoutline, numfill, toggleon, seltext, seltextbg, numseloutline, numsel
CustomProfileTable: ; custom always first
    dw $0000, $0000, $0000, $0000, $0000, $0000, $0000, $0000, $0000, $0000, $0000

TwitchProfileTable:
    dw $550D, $550D, $7FFF, $0000, $0000, $7FFF, $550D, $550D, $0000, $550D, $7FFF

DefaultProfileTable:
    dw $7277, $48F3, $7FFF, $0000, $0000, $7FFF, $4376, $761F, $0000, $0000, $761F

FirebatProfileTable:
    dw $000E, $000E, $0A20, $0000, $0A20, $0002, $0680, $000F, $0005, $0A20, $000F

wardrinkerProfileTable:
    dw $7277, $7FFF, $7A02, $0000, $0000, $9200, $7277, $7F29, $0000, $0000, $7F29

mm2ProfileTable:
    dw $5C12, $7F44, $7C80, $0000, $5442, $7FFF, $03E0, $7F44, $0000, $5442, $7F44

ptoilProfileTable:
    dw $5CAA, $14A5, $01EF, $0000, $0000, $5294, $4376, $03FF, $0000, $0000, $7FFF

ZohdinProfileTable:
    dw $7BFF, $0402, $0300, $0060, $0100, $9700, $7B64, $7BFF, $94A6, $2051, $09BF

DarkXoaProfileTable:
    dw $24C4, $45A8, $24C4, $0000, $0000, $24C4, $45A8, $45A8, $0000, $1505, $45A8

MelonaxProfileTable:
    dw $7FFF, $0000, $3DEF, $0C63, $0000, $7FFF, $266B, $3DFE, $0C63, $0000, $266B

TopsyTurveProfileTable:
    dw $7264, $7264, $7FFF, $0000, $0000, $7FFF, $7264, $7264, $0000, $0000, $7264

OSTProfileTable:
    dw $7FFF, $7FFF, $0010, $0000, $0010, $7FFF, $001F, $001E, $0000, $7FFF, $001E

JRPProfileTable:
    dw $7976, $384B, $66D1, $484A, $E54F, $7B97, $7B7B, $6B5E, $70F0, $654F, $7B97

GreyProfileTable:
    dw $0012, $1CE7, $3DEF, $0C63, $1CE7, $3DEF, $0EE3, $0012, $0C63, $1CE7, $3DEF

RedProfileTable:
    dw $0010, $0000, $0010, $0000, $0010, $0000, $001F, $001F, $0000, $001F, $0010

PurpleProfileTable:
    dw $602F, $0000, $602F, $0000, $0000, $602F, $0338, $0338, $0000, $602F, $0338

HUDProfileTable:
    dw $3D46, $48FB, $7FFF, $0000, $44E5, $7FFF, $4A52, $318C, $0000, $02DF, $001F
}


cm_colors:
{
    PHB
    PHK : PLB
    ; exit if not in color menu
    LDA !ram_cm_stack_index : DEC #2 : TAX
    LDA !ram_cm_menu_stack,X : CMP #CustomPalettesMenu : BNE .done
    ; exit if beyond table boundaries
    LDA !ram_cm_cursor_stack,X : CMP #$0016 : BPL .done

    TAX : JSR (ColorMenuTable,X)

  .done
    PLB
    RTL
}

cm_setup_RGB:
{
    LDA [$C1] : AND #$7C00 : XBA : LSR #2 : STA !sram_custompalette_blue
    LDA [$C1] : AND #$03E0 : LSR #5 : STA !sram_custompalette_green
    LDA [$C1] : AND #$001F : STA !sram_custompalette_red
    LDA [$C1] : AND #$7FFF
    %a8()
    STA !sram_custompalette_lo : XBA : STA !sram_custompalette_hi
    %a16()
    RTL
}

MixRGB:
{
    ; figure out which menu element is being edited
    LDA !ram_cm_stack_index : DEC #2 : TAX
    LDA !ram_cm_cursor_stack,X : TAX
    LDA.l MenuPaletteTable,X : STA $12 ; store indirect address
    LDA.w #!SRAM_START>>16 : STA $14 ; store indirect bank

    ; mix RGB values
    LDA !sram_custompalette_blue : XBA : ASL #2 : STA $16
    LDA !sram_custompalette_green : ASL #5 : ORA $16 : STA $16
    LDA !sram_custompalette_red : ORA $16

    ; store combined color value
    STA [$12]
    %a8()
    STA !sram_custompalette_lo : XBA : STA !sram_custompalette_hi
    %a16()

    JSL refresh_custom_palettes
    RTL

MenuPaletteTable:
    dw !sram_custompalette_menutext
    dw !sram_custompalette_menuseltext
    dw !sram_custompalette_menuseltextbg
    dw !sram_custompalette_menuheaderoutline
    dw !sram_custompalette_menunumfill
    dw !sram_custompalette_menunumoutline
    dw !sram_custompalette_menunumsel
    dw !sram_custompalette_menunumseloutline
    dw !sram_custompalette_menutoggleon
    dw !sram_custompalette_menuborder
    dw !sram_custompalette_menubackground
}

ColorMenuTable:
    dw ColorMenuTable_text
    dw ColorMenuTable_seltext
    dw ColorMenuTable_seltextbg
    dw ColorMenuTable_headeroutline
    dw ColorMenuTable_numfill
    dw ColorMenuTable_numoutline
    dw ColorMenuTable_numsel
    dw ColorMenuTable_numseloutline
    dw ColorMenuTable_toggleon
    dw ColorMenuTable_border
    dw ColorMenuTable_background

ColorMenuTable_text:
    %setupRGB(!sram_custompalette_menutext)

ColorMenuTable_seltext:
    %setupRGB(!sram_custompalette_menuseltext)

ColorMenuTable_seltextbg:
    %setupRGB(!sram_custompalette_menuseltextbg)

ColorMenuTable_headeroutline:
    %setupRGB(!sram_custompalette_menuheaderoutline)

ColorMenuTable_numfill:
    %setupRGB(!sram_custompalette_menunumfill)

ColorMenuTable_numoutline:
    %setupRGB(!sram_custompalette_menunumoutline)

ColorMenuTable_numsel:
    %setupRGB(!sram_custompalette_menunumsel)

ColorMenuTable_numseloutline:
    %setupRGB(!sram_custompalette_menunumseloutline)

ColorMenuTable_toggleon:
    %setupRGB(!sram_custompalette_menutoggleon)

ColorMenuTable_border:
    %setupRGB(!sram_custompalette_menuborder)

ColorMenuTable_background:
    %setupRGB(!sram_custompalette_menubackground)

print pc, " menu customization bankB5 end"
pullpc
