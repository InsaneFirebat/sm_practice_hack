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

macro palettemenu(header, mix, hi, lo)
    dw #custompalettes_hex_red
    dw #custompalettes_hex_green
    dw #custompalettes_hex_blue
    dw #ifb_notext
    dw #<mix>
    dw #ifb_notext
    dw #custompalettes_dec_red
    dw #custompalettes_dec_green
    dw #custompalettes_dec_blue
    dw #ifb_notext
    dw #<hi>
    dw #<lo>
    %examplemenu()
    dw #$0000
    %cm_header("<header>")
endmacro

macro cm_mixcolor(addr, addr_hi, addr_lo)
    %cm_jsr("Mix Colors", #.mix, #$0000)
  .mix
    LDA !sram_custompalette_blue : XBA : ASL #2 : STA $12
    LDA !sram_custompalette_green : ASL #5 : ORA $12 : STA $12
    LDA !sram_custompalette_red : ORA $12

    STA <addr>
    %a8()
    STA <addr_lo> : XBA : STA <addr_hi>
    %a16()
    JSR action_custompalettes_refresh
    RTS
endmacro

macro setRGB(addr)
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
    %cm_jsr_nosound("Copy Palette to Custom", action_copy_palette, #$0000)

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
    %cm_submenu("Text", #CustomPalettesMenu_menutext)

CustomPalettesMenu_menutext:
    %palettemenu("TEXT", custompalettes_mix_text, custompalettes_menutext_hi, custompalettes_menutext_lo)

custompalettes_mix_text:
    %cm_mixcolor(!sram_custompalette_menutext, !sram_custompalette_menutext_hi, !sram_custompalette_menutext_lo)


custompalettes_menuseltext:
    %cm_submenu("Selected Text", #CustomPalettesMenu_menuseltext)

CustomPalettesMenu_menuseltext:
    %palettemenu("SELECTED TEXT", custompalettes_mix_seltext, custompalettes_menuseltext_hi, custompalettes_menuseltext_lo)

custompalettes_mix_seltext:
    %cm_mixcolor(!sram_custompalette_menuseltext, !sram_custompalette_menuseltext_hi, !sram_custompalette_menuseltext_lo)


custompalettes_menuseltextbg:
    %cm_submenu("Selected Text Background", #CustomPalettesMenu_menuseltextbg)

CustomPalettesMenu_menuseltextbg:
    %palettemenu("SELECTED TEXT BACKGROUND", custompalettes_mix_seltextbg, custompalettes_menuseltextbg_hi, custompalettes_menuseltextbg_lo)

custompalettes_mix_seltextbg:
    %cm_mixcolor(!sram_custompalette_menuseltextbg, !sram_custompalette_menuseltextbg_hi, !sram_custompalette_menuseltextbg_lo)


custompalettes_menuheaderoutline:
    %cm_submenu("Header Outline", #CustomPalettesMenu_menuheaderoutline)

CustomPalettesMenu_menuheaderoutline:
    %palettemenu("HEADER OUTLINE", custompalettes_mix_headeroutline, custompalettes_menuheaderoutline_hi, custompalettes_menuheaderoutline_lo)

custompalettes_mix_headeroutline:
    %cm_mixcolor(!sram_custompalette_menuheaderoutline, !sram_custompalette_menuheaderoutline_hi, !sram_custompalette_menuheaderoutline_lo)


custompalettes_menunumfill:
    %cm_submenu("Number Field Text", #CustomPalettesMenu_menunumfill)

CustomPalettesMenu_menunumfill:
    %palettemenu("NUMBER FIELD TEXT", custompalettes_mix_numfill, custompalettes_menunumfill_hi, custompalettes_menunumfill_lo)

custompalettes_mix_numfill:
    %cm_mixcolor(!sram_custompalette_menunumfill, !sram_custompalette_menunumfill_hi, !sram_custompalette_menunumfill_lo)


custompalettes_menunumoutline:
    %cm_submenu("Number Field Outline", #CustomPalettesMenu_menunumoutline)

CustomPalettesMenu_menunumoutline:
    %palettemenu("NUMBER FIELD OUTLINE", custompalettes_mix_numoutline, custompalettes_menunumoutline_hi, custompalettes_menunumoutline_lo)

custompalettes_mix_numoutline:
    %cm_mixcolor(!sram_custompalette_menunumoutline, !sram_custompalette_menunumoutline_hi, !sram_custompalette_menunumoutline_lo)


custompalettes_menunumsel:
    %cm_submenu("Selected Num-Field Text", #CustomPalettesMenu_menunumsel)

CustomPalettesMenu_menunumsel:
    %palettemenu("SELECTED NUM-FIELD TEXT", custompalettes_mix_numsel, custompalettes_menunumsel_hi, custompalettes_menunumsel_lo)

custompalettes_mix_numsel:
    %cm_mixcolor(!sram_custompalette_menunumsel, !sram_custompalette_menunumsel_hi, !sram_custompalette_menunumsel_lo)


custompalettes_menunumseloutline:
    %cm_submenu("Selected Num-Field Outline", #CustomPalettesMenu_menunumseloutline)

CustomPalettesMenu_menunumseloutline:
    %palettemenu("SELECTED NUM-FIELD OUTLINE", custompalettes_mix_numseloutline, custompalettes_menunumseloutline_hi, custompalettes_menunumseloutline_lo)

custompalettes_mix_numseloutline:
    %cm_mixcolor(!sram_custompalette_menunumseloutline, !sram_custompalette_menunumseloutline_hi, !sram_custompalette_menunumseloutline_lo)


custompalettes_menutoggleon:
    %cm_submenu("Toggle ON", #CustomPalettesMenu_menutoggleon)

CustomPalettesMenu_menutoggleon:
    %palettemenu("TOGGLE ON", custompalettes_mix_toggleon, custompalettes_menutoggleon_hi, custompalettes_menutoggleon_lo)

custompalettes_mix_toggleon:
    %cm_mixcolor(!sram_custompalette_menutoggleon, !sram_custompalette_menutoggleon_hi, !sram_custompalette_menutoggleon_lo)


custompalettes_menuborder:
    %cm_submenu("Toggle OFF + Border", #CustomPalettesMenu_menuborder)

CustomPalettesMenu_menuborder:
    %palettemenu("TOGGLE OFF AND BORDER", custompalettes_mix_border, custompalettes_menuborder_hi, custompalettes_menuborder_lo)

custompalettes_mix_border:
    %cm_mixcolor(!sram_custompalette_menuborder, !sram_custompalette_menuborder_hi, !sram_custompalette_menuborder_lo)


custompalettes_menubackground:
    %cm_submenu("Background", #CustomPalettesMenu_menubackground)

CustomPalettesMenu_menubackground:
    %palettemenu("BACKGROUND", custompalettes_mix_background, custompalettes_menubackground_hi, custompalettes_menubackground_lo)

custompalettes_mix_background:
    %cm_mixcolor(!sram_custompalette_menubackground, !sram_custompalette_menubackground_hi, !sram_custompalette_menubackground_lo)


custompalettes_hex_red:
    %cm_numfield_color("Hexadecimal Red", !sram_custompalette_red, #0)

custompalettes_hex_green:
    %cm_numfield_color("Hexadecimal Green", !sram_custompalette_green, #0)

custompalettes_hex_blue:
    %cm_numfield_color("Hexadecimal Blue", !sram_custompalette_blue, #0)

custompalettes_dec_red:
    %cm_numfield("Decimal Red", !sram_custompalette_red, 0, 31, 1, #0)

custompalettes_dec_green:
    %cm_numfield("Decimal Green", !sram_custompalette_green, 0, 31, 1, #0)

custompalettes_dec_blue:
    %cm_numfield("Decimal Blue", !sram_custompalette_blue, 0, 31, 1, #0)


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
    %setRGB(!sram_custompalette_menutext)

ColorMenuTable_seltext:
    %setRGB(!sram_custompalette_menuseltext)

ColorMenuTable_seltextbg:
    %setRGB(!sram_custompalette_menuseltextbg)

ColorMenuTable_headeroutline:
    %setRGB(!sram_custompalette_menuheaderoutline)

ColorMenuTable_numfill:
    %setRGB(!sram_custompalette_menunumfill)

ColorMenuTable_numoutline:
    %setRGB(!sram_custompalette_menunumoutline)

ColorMenuTable_numsel:
    %setRGB(!sram_custompalette_menunumsel)

ColorMenuTable_numseloutline:
    %setRGB(!sram_custompalette_menunumseloutline)

ColorMenuTable_toggleon:
    %setRGB(!sram_custompalette_menutoggleon)

ColorMenuTable_border:
    %setRGB(!sram_custompalette_menuborder)

ColorMenuTable_background:
    %setRGB(!sram_custompalette_menubackground)


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
