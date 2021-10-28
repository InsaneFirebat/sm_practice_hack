; ------
; Macros
; ------

macro examplemenu()
    dw #ifb_notext
    dw #ifb_notext
    dw #ifb_notext
    dw #ifb_notext
    dw #ifb_notext
    dw #ifb_notext
    dw #ifb_dummy_on
    dw #ifb_dummy_off
    dw #ifb_dummy_hexnum
    dw #ifb_dummy_num
endmacro

macro palettemenu(title, hi, lo, pointer)
    %cm_submenu("<title>", <pointer>)
    
<pointer>:
    dw #custompalettes_hex_red
    dw #custompalettes_hex_green
    dw #custompalettes_hex_blue
    dw #ifb_notext
    dw #custompalettes_dec_red
    dw #custompalettes_dec_green
    dw #custompalettes_dec_blue
    dw #ifb_notext
    dw #<hi>
    dw #<lo>
    dw #ifb_notext
    dw #ifb_notext
    %examplemenu()
    dw #$0000
    %cm_header("<title>")
endmacro

macro setupRGB(addr)
    LDA <addr> : AND #$7C00 : XBA : LSR #2 : STA !sram_custompalette_blue
    LDA <addr> : AND #$03E0 : LSR #5 : STA !sram_custompalette_green
    LDA <addr> : AND #$001F : STA !sram_custompalette_red
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
    dw #ifb_customsfx
    dw #$0000
    %cm_header("CUSTOMIZE PRACTICE MENU")

ifb_customizemenu:
    %cm_submenu("Customize Practice Menu", #CustomizeMenu)

ifb_menubackground:
    %cm_toggle("Menu Background", !sram_menu_background, #$0001, #0)

ifb_custompalettes_menu_old:
    %cm_submenu("Screenshot To Share Colors", #CustomPalettesMenuOld)

ifb_custompalettes_menu:
    %cm_submenu("Customize Menu Palette", #CustomPalettesMenu)

ifb_paletteprofile:
    dw !ACTION_CHOICE
    dl #!sram_custompalette_profile
    dw #$0000
    db #$28, "Menu Palette", #$FF
        db #$28, "     CUSTOM", #$FF ; CUSTOM should always be first
        db #$28, "    DEFAULT", #$FF
        db #$28, "        HUD", #$FF
        db #$28, "    FIREBAT", #$FF
        db #$28, " WARDRINKER", #$FF
        db #$28, "        MM2", #$FF
        db #$28, "      PTOIL", #$FF
        db #$28, "     ZOHDIN", #$FF
        db #$28, "    DARKXOA", #$FF
        db #$28, "    MELONAX", #$FF
        db #$28, "     TWITCH", #$FF
        db #$28, "       GREY", #$FF
        db #$28, "        RED", #$FF
        db #$28, "     PURPLE", #$FF
    db #$FF

ifb_palette2custom:
    %cm_jsr("Copy Palette to Custom", action_copy_palette, #$0000)

ifb_customsfx:
    %cm_submenu("Customize Menu Sounds", #CustomMenuSFXMenu)


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
    dw #ifb_custompalettes_menu_old
    dw #$0000
    %cm_header("CUSTOMIZE MENU PALETTE")

custompalettes_menutext:
    %palettemenu("Text", custompalettes_menutext_hi, custompalettes_menutext_lo, #CustomPalettesMenu_menutext)

custompalettes_menuseltext:
    %palettemenu("Selected Text", custompalettes_menuseltext_hi, custompalettes_menuseltext_lo, #CustomPalettesMenu_menuseltext)

custompalettes_menuseltextbg:
    %palettemenu("Selected Text Background", custompalettes_menuseltextbg_hi, custompalettes_menuseltextbg_lo, #CustomPalettesMenu_menuseltextbg)

custompalettes_menuheaderoutline:
    %palettemenu("Header Outline", custompalettes_menuheaderoutline_hi, custompalettes_menuheaderoutline_lo, #CustomPalettesMenu_menuheaderoutline)

custompalettes_menunumfill:
    %palettemenu("Number Field Text", custompalettes_menunumfill_hi, custompalettes_menunumfill_lo, #CustomPalettesMenu_menunumfill)

custompalettes_menunumoutline:
    %palettemenu("Number Field Outline", custompalettes_menunumoutline_hi, custompalettes_menunumoutline_lo, #CustomPalettesMenu_menunumoutline)

custompalettes_menunumsel:
    %palettemenu("Selected Num-Field Text", custompalettes_menunumsel_hi, custompalettes_menunumsel_lo, #CustomPalettesMenu_menunumsel)

custompalettes_menunumseloutline:
    %palettemenu("Selected Num-Field Outline", custompalettes_menunumseloutline_hi, custompalettes_menunumseloutline_lo, #CustomPalettesMenu_menunumseloutline)

custompalettes_menutoggleon:
    %palettemenu("Toggle ON", custompalettes_menutoggleon_hi, custompalettes_menutoggleon_lo, #CustomPalettesMenu_menutoggleon)

custompalettes_menuborder:
    %palettemenu("Toggle OFF + Border", custompalettes_menuborder_hi, custompalettes_menuborder_lo, #CustomPalettesMenu_menuborder)

custompalettes_menubackground:
    %palettemenu("Background", custompalettes_menubackground_hi, custompalettes_menubackground_lo, #CustomPalettesMenu_menubackground)


custompalettes_hex_red:
    %cm_numfield_color("Hexadecimal Red", !sram_custompalette_red, #MixRGB)

custompalettes_hex_green:
    %cm_numfield_color("Hexadecimal Green", !sram_custompalette_green, #MixRGB)

custompalettes_hex_blue:
    %cm_numfield_color("Hexadecimal Blue", !sram_custompalette_blue, #MixRGB)

custompalettes_dec_red:
    %cm_numfield("Decimal Red", !sram_custompalette_red, 0, 31, 1, #MixRGB)

custompalettes_dec_green:
    %cm_numfield("Decimal Green", !sram_custompalette_green, 0, 31, 1, #MixRGB)

custompalettes_dec_blue:
    %cm_numfield("Decimal Blue", !sram_custompalette_blue, 0, 31, 1, #MixRGB)

MixRGB:
{
    ; figure out which menu element is being edited
    LDA !ram_cm_cursor_stack+6 : TAX
    LDA.w MenuPaletteTable,X : STA $12 ; store indirect address
    LDA #$0070 : STA $14 ; store indirect bank

    ; mix RGB values
    LDA !sram_custompalette_blue : XBA : ASL #2 : STA $16
    LDA !sram_custompalette_green : ASL #5 : ORA $16 : STA $16
    LDA !sram_custompalette_red : ORA $16

    STA [$12] ; store combined color value
    %a8()
    LDY #$0004 : STA [$12],Y ; store lo byte
    XBA : DEY #2 : STA [$12],Y ; store hi byte
    %a16()
    JSR action_custompalettes_refresh
    RTS

MenuPaletteTable:
    dw #!sram_custompalette_menutext
    dw #!sram_custompalette_menuseltext
    dw #!sram_custompalette_menuseltextbg
    dw #!sram_custompalette_menuheaderoutline
    dw #!sram_custompalette_menunumfill
    dw #!sram_custompalette_menunumoutline
    dw #!sram_custompalette_menunumsel
    dw #!sram_custompalette_menunumseloutline
    dw #!sram_custompalette_menutoggleon
    dw #!sram_custompalette_menuborder
    dw #!sram_custompalette_menubackground
}


CustomPalettesMenuOld:
    dw #custompalettes_menuborder_hi
    dw #custompalettes_menuborder_lo
    dw #custompalettes_menuheaderoutline_hi
    dw #custompalettes_menuheaderoutline_lo
    dw #custompalettes_menutext_hi
    dw #custompalettes_menutext_lo
    dw #custompalettes_menubackground_hi
    dw #custompalettes_menubackground_lo
    dw #custompalettes_menunumoutline_hi
    dw #custompalettes_menunumoutline_lo
    dw #custompalettes_menunumfill_hi
    dw #custompalettes_menunumfill_lo
    dw #custompalettes_menutoggleon_hi
    dw #custompalettes_menutoggleon_lo
    dw #custompalettes_menuseltext_hi
    dw #custompalettes_menuseltext_lo
    dw #custompalettes_menuseltextbg_hi
    dw #custompalettes_menuseltextbg_lo
    dw #custompalettes_menunumseloutline_hi
    dw #custompalettes_menunumseloutline_lo
    dw #custompalettes_menunumsel_hi
    dw #custompalettes_menunumsel_lo
    dw #$0000
    %cm_header("SHARE YOUR COLORS")

custompalettes_menutext_hi:
    %cm_numfield_hex("Text Hi", !sram_custompalette_menutext_hi, 0, 255, 1, #.routine)
    .routine
        XBA
        ORA !sram_custompalette_menutext_lo
        STA !sram_custompalette_menutext
        RTS

custompalettes_menutext_lo:
    %cm_numfield_hex("Text Lo", !sram_custompalette_menutext_lo, 0, 255, 1, #.routine)
    .routine
        XBA
        ORA !sram_custompalette_menutext_hi
        XBA
        STA !sram_custompalette_menutext
        RTS

custompalettes_menuseltext_hi:
    %cm_numfield_hex("Selected Text Hi", !sram_custompalette_menuseltext_hi, 0, 255, 1, #.routine)
    .routine
        XBA
        ORA !sram_custompalette_menuseltext_lo
        STA !sram_custompalette_menuseltext
        RTS

custompalettes_menuseltext_lo:
    %cm_numfield_hex("Selected Text Lo", !sram_custompalette_menuseltext_lo, 0, 255, 1, #.routine)
    .routine
        XBA
        ORA !sram_custompalette_menuseltext_hi
        XBA
        STA !sram_custompalette_menuseltext
        RTS

custompalettes_menuseltextbg_hi:
    %cm_numfield_hex("Selected Text + ON BG Hi", !sram_custompalette_menuseltextbg_hi, 0, 255, 1, #.routine)
    .routine
        XBA
        ORA !sram_custompalette_menuseltextbg_lo
        STA !sram_custompalette_menuseltextbg
        RTS

custompalettes_menuseltextbg_lo:
    %cm_numfield_hex("Selected Text + ON BG Lo", !sram_custompalette_menuseltextbg_lo, 0, 255, 1, #.routine)
    .routine
        XBA
        ORA !sram_custompalette_menuseltextbg_hi
        XBA
        STA !sram_custompalette_menuseltextbg
        RTS

custompalettes_menuborder_hi:
    %cm_numfield_hex("Toggle OFF + Border Hi", !sram_custompalette_menuborder_hi, 0, 255, 1, #.routine)
    .routine
        XBA
        ORA !sram_custompalette_menuborder_lo
        STA !sram_custompalette_menuborder
        RTS

custompalettes_menuborder_lo:
    %cm_numfield_hex("Toggle OFF + Border Lo", !sram_custompalette_menuborder_lo, 0, 255, 1, #.routine)
    .routine
        XBA
        ORA !sram_custompalette_menuborder_hi
        XBA
        STA !sram_custompalette_menuborder
        RTS

custompalettes_menuheaderoutline_hi:
    %cm_numfield_hex("Header Text Outline Hi", !sram_custompalette_menuheaderoutline_hi, 0, 255, 1, #.routine)
    .routine
        XBA
        ORA !sram_custompalette_menuheaderoutline_lo
        STA !sram_custompalette_menuheaderoutline
        RTS

custompalettes_menuheaderoutline_lo:
    %cm_numfield_hex("Header Text Outline Lo", !sram_custompalette_menuheaderoutline_lo, 0, 255, 1, #.routine)
    .routine
        XBA
        ORA !sram_custompalette_menuheaderoutline_hi
        XBA
        STA !sram_custompalette_menuheaderoutline
        RTS

custompalettes_menunumfill_hi:
    %cm_numfield_hex("NumField Text Hi", !sram_custompalette_menunumfill_hi, 0, 255, 1, #.routine)
    .routine
        XBA
        ORA !sram_custompalette_menunumfill_lo
        STA !sram_custompalette_menunumfill
        RTS

custompalettes_menunumfill_lo:
    %cm_numfield_hex("NumField Text Lo", !sram_custompalette_menunumfill_lo, 0, 255, 1, #.routine)
    .routine
        XBA
        ORA !sram_custompalette_menunumfill_hi
        XBA
        STA !sram_custompalette_menunumfill
        RTS

custompalettes_menunumoutline_hi:
    %cm_numfield_hex("NumField Outline Hi", !sram_custompalette_menunumoutline_hi, 0, 255, 1, #.routine)
    .routine
        XBA
        ORA !sram_custompalette_menunumoutline_lo
        STA !sram_custompalette_menunumoutline
        RTS

custompalettes_menunumoutline_lo:
    %cm_numfield_hex("NumField Outline Lo", !sram_custompalette_menunumoutline_lo, 0, 255, 1, #.routine)
    .routine
        XBA
        ORA !sram_custompalette_menunumoutline_hi
        XBA
        STA !sram_custompalette_menunumoutline
        RTS

custompalettes_menunumsel_hi:
    %cm_numfield_hex("Selected NumField Hi", !sram_custompalette_menunumsel_hi, 0, 255, 1, #.routine)
    .routine
        XBA
        ORA !sram_custompalette_menunumsel_lo
        STA !sram_custompalette_menunumsel
        RTS

custompalettes_menunumsel_lo:
    %cm_numfield_hex("Selected NumField Lo", !sram_custompalette_menunumsel_lo, 0, 255, 1, #.routine)
    .routine
        XBA
        ORA !sram_custompalette_menunumsel_hi
        XBA
        STA !sram_custompalette_menunumsel
        RTS

custompalettes_menunumseloutline_hi:
    %cm_numfield_hex("Selected NumField OL Hi", !sram_custompalette_menunumseloutline_hi, 0, 255, 1, #.routine)
    .routine
        XBA
        ORA !sram_custompalette_menunumseloutline_lo
        STA !sram_custompalette_menunumseloutline
        RTS

custompalettes_menunumseloutline_lo:
    %cm_numfield_hex("Selected NumField OL Lo", !sram_custompalette_menunumseloutline_lo, 0, 255, 1, #.routine)
    .routine
        XBA
        ORA !sram_custompalette_menunumseloutline_hi
        XBA
        STA !sram_custompalette_menunumseloutline
        RTS

custompalettes_menutoggleon_hi:
    %cm_numfield_hex("Toggle ON Hi", !sram_custompalette_menutoggleon_hi, 0, 255, 1, #.routine)
    .routine
        XBA
        ORA !sram_custompalette_menutoggleon_lo
        STA !sram_custompalette_menutoggleon
        RTS

custompalettes_menutoggleon_lo:
    %cm_numfield_hex("Toggle ON Lo", !sram_custompalette_menutoggleon_lo, 0, 255, 1, #.routine)
    .routine
        XBA
        ORA !sram_custompalette_menutoggleon_hi
        XBA
        STA !sram_custompalette_menutoggleon
        RTS

custompalettes_menubackground_hi:
    %cm_numfield_hex("Background Hi", !sram_custompalette_menubackground_hi, 0, 255, 1, #.routine)
    .routine
        XBA
        ORA !sram_custompalette_menubackground_lo
        STA !sram_custompalette_menubackground
        RTS

custompalettes_menubackground_lo:
    %cm_numfield_hex("Background Lo", !sram_custompalette_menubackground_lo, 0, 255, 1, #.routine)
    .routine
        XBA
        ORA !sram_custompalette_menubackground_hi
        XBA
        STA !sram_custompalette_menubackground
        RTS

action_custompalettes_refresh:
{
    PHP
    %ai16()
    JSR cm_transfer_original_cgram
    JSR cm_transfer_custom_cgram
    LDA #$0000 : STA !sram_custompalette_profile
    PLP
    RTS
}

action_copy_palette:
{
    PHP
    %ai16()
    LDA !sram_custompalette_profile : BNE + : BRL .fail
+   ASL : TAX : LDA PaletteProfileTables,X : STA $16

    ; copy table to SRAM, Y is already zero from JSR menu macro
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

    ; split hi and lo bytes into separate addresses
    %ai8()
    LDX #$00

  .loop
    ; load lo, then hi
    LDA !sram_custompalette_menuborder,X : XBA
    INX : LDA !sram_custompalette_menuborder,X
    ; store hi, then lo
    INX : STA !sram_custompalette_menuborder,X
    INX #2 : XBA : STA !sram_custompalette_menuborder,X
    ; next word
    INX #2 : CPX #$42 : BNE .loop

    ; play a happy sound and refresh current profile
    %ai16()
    JSR action_custompalettes_refresh
    %sfxbubble()
    BRA .done

  .fail
    ; make the animals cry cause we couldn't do anything
    %sfxetecoon()

  .done
    PLP
    RTS
}

cm_colors:
{
    LDA !ram_cm_cursor_stack+4 : CMP #$0002 : BNE .done ; exit if not in color menu
    LDA !ram_cm_cursor_stack+6 : CMP #$0016 : BPL .done ; exit if beyond table boundaries
    TAX : JSR (ColorMenuTable,X)

  .done
    RTS

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
}

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


; ---------------
; Custom Sound FX
; ---------------

CustomMenuSFXMenu:
    dw #ifb_sfx_move
    dw #ifb_sfx_toggle
    dw #ifb_sfx_number
    dw #ifb_sfx_confirm
    dw #ifb_sfx_goback
    dw #ifb_notext
    dw #ifb_soundtest_lib1_sound
    dw #ifb_soundtest_lib1_playsound
    dw #$0000
    %cm_header("CHOOSE SFX FROM LIB 1")

ifb_sfx_move:
    %cm_numfield_hex("Move Cursor", !sram_customsfx_move, 1, 63, 1, #0)

ifb_sfx_toggle:
    %cm_numfield_hex("Toggle", !sram_customsfx_toggle, 1, 63, 1, #0)

ifb_sfx_number:
    %cm_numfield_hex("Number Select", !sram_customsfx_number, 1, 63, 1, #0)

ifb_sfx_goback:
    %cm_numfield_hex("Go Back", !sram_customsfx_goback, 1, 63, 1, #0)

ifb_sfx_confirm:
    %cm_numfield_hex("Confirm Selection", !sram_customsfx_confirm, 1, 63, 1, #0)
