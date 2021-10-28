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

macro palettemenu(title, pointer)
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
    dw #ifb_notext
    dw #ifb_notext
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
    dw #ifb_custompalettes_display_menu
    dw #$0000
    %cm_header("CUSTOMIZE MENU PALETTE")

custompalettes_menutext:
    %palettemenu("Text", #CustomPalettesMenu_menutext)

custompalettes_menuseltext:
    %palettemenu("Selected Text", #CustomPalettesMenu_menuseltext)

custompalettes_menuseltextbg:
    %palettemenu("Selected Text Background", #CustomPalettesMenu_menuseltextbg)

custompalettes_menuheaderoutline:
    %palettemenu("Header Outline", #CustomPalettesMenu_menuheaderoutline)

custompalettes_menunumfill:
    %palettemenu("Number Field Text", #CustomPalettesMenu_menunumfill)

custompalettes_menunumoutline:
    %palettemenu("Number Field Outline", #CustomPalettesMenu_menunumoutline)

custompalettes_menunumsel:
    %palettemenu("Selected Num-Field Text", #CustomPalettesMenu_menunumsel)

custompalettes_menunumseloutline:
    %palettemenu("Selected Num-Field Outline", #CustomPalettesMenu_menunumseloutline)

custompalettes_menutoggleon:
    %palettemenu("Toggle ON", #CustomPalettesMenu_menutoggleon)

custompalettes_menuborder:
    %palettemenu("Toggle OFF + Border", #CustomPalettesMenu_menuborder)

custompalettes_menubackground:
    %palettemenu("Background", #CustomPalettesMenu_menubackground)


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
