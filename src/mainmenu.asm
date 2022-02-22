; --------
; Helpers
; --------

macro cm_header(title)
    table ../resources/header.tbl
    db #$28, "<title>", #$FF
    table ../resources/normal.tbl
endmacro

macro cm_footer(title)
    table ../resources/header.tbl
    dw #$F007 : db #$28, "<title>", #$FF
    table ../resources/normal.tbl
endmacro

macro cm_version_header(title, major, minor, build, rev_1, rev_2)
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

macro cm_numfield(title, addr, start, end, increment, heldincrement, jsrtarget)
    dw !ACTION_NUMFIELD
    dl <addr>
    db <start>, <end>, <increment>;, <heldincrement>
    dw <jsrtarget>
    db #$28, "<title>", #$FF
endmacro

macro cm_numfield_word(title, addr, start, end, increment, heldincrement, jsrtarget)
    dw !ACTION_NUMFIELD_WORD
    dl <addr>
    dw <start>, <end>, <increment>;, <heldincrement>
    dw <jsrtarget>
    db #$28, "<title>", #$FF
endmacro

macro cm_numfield_hex(title, addr, start, end, increment, heldincrement, jsrtarget)
    dw !ACTION_NUMFIELD_HEX
    dl <addr>
    db <start>, <end>, <increment>;, <heldincrement>
    dw <jsrtarget>
    db #$28, "<title>", #$FF
endmacro

macro cm_numfield_hex_word(title, addr)
    dw !ACTION_NUMFIELD_HEX_WORD
    dl <addr>
    db #$28, "<title>", #$FF
endmacro

macro cm_numfield_color(title, addr, jsrtarget)
    dw !ACTION_NUMFIELD_COLOR
    dl <addr>
    dw <jsrtarget>
    db #$28, "<title>", #$FF
endmacro

macro cm_numfield_sound(title, addr, start, end, increment, jsrtarget)
    dw !ACTION_NUMFIELD_SOUND
    dl <addr>
    db <start>, <end>, <increment>
    dw <jsrtarget>
    db #$28, "<title>", #$FF
endmacro

macro cm_toggle(title, addr, value, jsrtarget)
    dw !ACTION_TOGGLE
    dl <addr>
    db <value>
    dw <jsrtarget>
    db #$28, "<title>", #$FF
endmacro

macro cm_toggle_inverted(title, addr, value, jsrtarget)
    dw !ACTION_TOGGLE_INVERTED
    dl <addr>
    db <value>
    dw <jsrtarget>
    db #$28, "<title>", #$FF
endmacro

macro cm_toggle_bit(title, addr, mask, jsrtarget)
    dw !ACTION_TOGGLE_BIT
    dl <addr>
    dw <mask>
    dw <jsrtarget>
    db #$28, "<title>", #$FF
endmacro

macro cm_toggle_bit_inverted(title, addr, mask, jsrtarget)
    dw !ACTION_TOGGLE_BIT_INVERTED
    dl <addr>
    dw <mask>
    dw <jsrtarget>
    db #$28, "<title>", #$FF
endmacro

macro cm_jsr(title, routine, argument)
    dw !ACTION_JSR
    dw <routine>
    dw <argument>
    db #$28, "<title>", #$FF
endmacro

macro cm_submenu(title, target)
    %cm_jsr("<title>", #action_submenu, <target>)
endmacro

macro cm_preset(title, target)
    %cm_jsr("<title>", #action_load_preset, <target>)
endmacro

macro cm_ctrl_shortcut(title, addr)
    dw !ACTION_CTRL_SHORTCUT
    dl <addr>
    db #$28, "<title>", #$FF
endmacro

macro cm_ctrl_input(title, addr, routine, argument)
    dw !ACTION_CTRL_INPUT
    dl <addr>
    dw <routine>
    dw <argument>
    db #$28, "<title>", #$FF
endmacro

MainMenuJSR:
{
  .toggle
  .toggle_bit
    JSR ($000A,X)
    RTL

  .jsr
  .controller_input
    JSR ($0004,X)
    RTL

  .numfield
  .numfield_sound
  .numfield_word
  .numfield_color
    JSR ($0020,X)
    RTL

  .choice
    JSR ($0008,X)
    RTL
}

action_submenu:
{
    ; Increment stack pointer by 2, then store current menu
    LDA !ram_cm_stack_index : INC #2 : STA !ram_cm_stack_index : TAX
    TYA : STA !ram_cm_menu_stack,X
    LDA #$0000 : STA !ram_cm_cursor_stack,X

    %sfxconfirm()
    JSL cm_calculate_max
    JSL cm_draw

    JSL cm_colors

    RTS
}

action_presets_submenu:
{
    PHB
    PHK : PLB

    ; Increment stack pointer by 2, then store current menu    
    LDA !ram_cm_stack_index : INC #2 : STA !ram_cm_stack_index : TAX
    LDA !sram_preset_category : ASL : TAY
    
    LDA.w preset_category_submenus,Y : STA !ram_cm_menu_stack,X
    LDA.w preset_category_banks,Y : STA !ram_cm_menu_bank
    
    LDA #$0000 : STA !ram_cm_cursor_stack,X

    %sfxconfirm()
    JSL cm_calculate_max
    JSL cm_draw

    PLB
    RTS
}

preset_category_submenus:
{
    dw #PresetsMenuKpdr21
    dw #PresetsMenuKpdr22
    dw #PresetsMenuPrkd15
    dw #PresetsMenuPrkd
    dw #PresetsMenuPkrd
    dw #PresetsMenuSpazer
    dw #PresetsMenuKpdr25
    dw #PresetsMenuGtclassic
    dw #PresetsMenuGtmax
    dw #PresetsMenu14ice
    dw #PresetsMenu14speed
    dw #PresetsMenu100early
    dw #PresetsMenuHundo
    dw #PresetsMenu100map
    dw #PresetsMenuRbo
    dw #PresetsMenuNgplasma
    dw #PresetsMenuNghyper
    dw #PresetsMenuNintendopower
    dw #PresetsMenuAllbosskpdr
    dw #PresetsMenuAllbosspkdr
    dw #PresetsMenuAllbossprkd
    dw #$0000
}

preset_category_banks:
{
    dw #PresetsMenuKpdr21>>16
    dw #PresetsMenuKpdr22>>16
    dw #PresetsMenuPrkd15>>16
    dw #PresetsMenuPrkd>>16
    dw #PresetsMenuPkrd>>16
    dw #PresetsMenuSpazer>>16
    dw #PresetsMenuKpdr25>>16
    dw #PresetsMenuGtclassic>>16
    dw #PresetsMenuGtmax>>16
    dw #PresetsMenu14ice>>16
    dw #PresetsMenu14speed>>16
    dw #PresetsMenu100early>>16
    dw #PresetsMenuHundo>>16
    dw #PresetsMenu100map>>16
    dw #PresetsMenuRbo>>16
    dw #PresetsMenuNgplasma>>16
    dw #PresetsMenuNghyper>>16
    dw #PresetsMenuNintendopower>>16
    dw #PresetsMenuAllbosskpdr>>16
    dw #PresetsMenuAllbosspkdr>>16
    dw #PresetsMenuAllbossprkd>>16
    dw #$0000

}

; -----------
; Main menu
; -----------

MainMenu:
    dw #mm_goto_equipment
    dw #mm_goto_presets
    dw #mm_goto_presets_menu
    dw #mm_goto_teleport
    dw #mm_goto_events
    dw #mm_goto_misc
    dw #mm_goto_sprites
    dw #mm_goto_layout
    dw #mm_goto_infohud
    dw #mm_goto_gamemenu
    dw #mm_goto_rngmenu
    dw #mm_goto_ctrlsmenu
    dw #mm_goto_IFBmenu
    dw #$0000
if !FEATURE_PAL
    %cm_version_header("PAL INFOHUD", !VERSION_MAJOR, !VERSION_MINOR, !VERSION_BUILD, !VERSION_REV_1, !VERSION_REV_2)
else
    %cm_version_header("FIREBAT INFOHUD", !VERSION_MAJOR, !VERSION_MINOR, !VERSION_BUILD, !VERSION_REV_1, !VERSION_REV_2)
endif

mm_goto_equipment:
    %cm_submenu("Equipment", #EquipmentMenu)

mm_goto_presets:
    %cm_jsr("Category Presets", #action_presets_submenu, #$0000)

mm_goto_presets_menu:
    %cm_submenu("Presets Menu", #PresetsMenu)

mm_goto_teleport:
    %cm_submenu("Save Stations", #TeleportMenu)

mm_goto_events:
    %cm_submenu("Event Flags", #EventsMenu)

mm_goto_misc:
    %cm_submenu("Misc Options", #MiscMenu)

mm_goto_sprites:
    %cm_submenu("Sprite Features", #SpritesMenu)

mm_goto_layout:
    %cm_submenu("Room Layouts", #LayoutMenu)

mm_goto_infohud:
    %cm_submenu("InfoHUD", #InfoHudMenu)

mm_goto_gamemenu:
    %cm_submenu("Game Settings", #GameMenu)

mm_goto_rngmenu:
    %cm_submenu("RNG Control", #RngMenu)

mm_goto_ctrlsmenu:
    %cm_submenu("Controller Shortcuts", #CtrlMenu)

mm_goto_IFBmenu:
    %cm_submenu("Firebat Menu", #IFBMenu)


; -------------
; Presets menu
; -------------

PresetsMenu:
    dw #presets_goto_select_preset_category
    dw #presets_current
    dw #$FFFF
    dw #presets_custom_preset_slot
    dw #presets_save_custom_preset
    dw #presets_load_custom_preset
    dw #$FFFF
    dw #presets_open_doors
    dw #presets_enemies
;    dw #presets_ship_landing
if !RAW_TILE_GRAPHICS
    dw #$FFFF
    dw #presets_compressed_graphics
    dw #presets_compressed_palettes
    dw #presets_compressed_tables
endif
if !FEATURE_DEV
    dw #$FFFF
    dw #presets_random_preset_rng
endif
    dw #$0000
    %cm_header("PRESET OPTIONS MENU")
if !RAW_TILE_GRAPHICS
    %cm_footer("COMPRESSED OFF IS FASTER")
endif

presets_goto_select_preset_category:
    %cm_submenu("Select Preset Category", #SelectPresetCategoryMenu)

presets_custom_preset_slot:
    %cm_numfield("Custom Preset Slot", !sram_custom_preset_slot, 0, 39, 1, 2, #0) ; update total slots in gamemode.asm

presets_save_custom_preset:
    %cm_jsr("Save Custom Preset", .routine, #$0000)
  .routine
    JSL custom_preset_save
    LDA #$0001 : STA !ram_cm_leave
    %sfxconfirm()
    RTS

presets_load_custom_preset:
    %cm_jsr("Load Custom Preset", .routine, #$0000)
  .routine
    ; check if slot is populated first
    LDA !sram_custom_preset_slot
    ASL : XBA : TAX
    LDA !PRESET_SLOTS,X : CMP #$5AFE : BEQ .safe
    %sfxgoback()
    RTS

  .safe
    STA !ram_custom_preset
    LDA #$0001 : STA !ram_cm_leave
    RTS

presets_open_doors:
    %cm_toggle("Auto-Open Blue Doors", !sram_preset_open_doors, #$0001, #0)

presets_enemies:
    %cm_toggle("Load with Enemies", !sram_preset_enemies, #$0001, #0)

presets_ship_landing:
    %cm_toggle("Ship Landing Sequence", !sram_preset_ship_landing, #$0001, #0)

if !RAW_TILE_GRAPHICS
!PRESETS_COMPRESSED_GRAPHICS = #$0001
presets_compressed_graphics:
    %cm_toggle_bit("Compressed Graphics", !sram_compressed_graphics, !PRESETS_COMPRESSED_GRAPHICS, #0)

!PRESETS_COMPRESSED_PALETTES = #$0002
!PRESETS_COMPRESSED_PALETTES_8BIT = #$02
presets_compressed_palettes:
    %cm_toggle_bit("Compressed Palettes", !sram_compressed_graphics, !PRESETS_COMPRESSED_PALETTES, #0)

!PRESETS_COMPRESSED_TABLES = #$0004
presets_compressed_tables:
    %cm_toggle_bit("Compressed Tables", !sram_compressed_graphics, !PRESETS_COMPRESSED_TABLES, #0)
endif

if !FEATURE_DEV
presets_random_preset_rng:
    %cm_toggle("Preset Debugger", !ram_random_preset_rng, #$0001, #0)
endif

SelectPresetCategoryMenu:
    dw #presets_current
    dw #$FFFF
    dw #precat_kpdr21
    dw #precat_kpdr22
    dw #precat_prkd15
    dw #precat_prkd
    dw #precat_pkrd
    dw #precat_spazer
    dw #precat_kpdr25
    dw #precat_gtclassic
    dw #precat_gtmax
    dw #precat_14ice
    dw #precat_14speed
    dw #precat_100early
    dw #precat_hundo
    dw #precat_100map
    dw #precat_rbo
    dw #precat_ngplasma
    dw #precat_nghyper
    dw #precat_nintendopower
    dw #precat_allbosskpdr
    dw #precat_allbosspkdr
    dw #precat_allbossprkd
    dw #$0000
    %cm_header("SELECT PRESET CATEGORY")

presets_current:
    dw !ACTION_CHOICE
    dl #!sram_preset_category
    dw #.routine
    db #$28, "CURRENT PRESET", #$FF
        db #$28, "   KPDR 21%", #$FF
        db #$28, "   KPDR 22%", #$FF
        db #$28, "   PRKD 19%", #$FF
        db #$28, "   PRKD 20%", #$FF
        db #$28, "  ANY% PKRD", #$FF
        db #$28, "     SPAZER", #$FF
        db #$28, "   KPDR ICE", #$FF
        db #$28, " GT CLASSIC", #$FF
        db #$28, "    GT MAX%", #$FF
        db #$28, "    14% ICE", #$FF
        db #$28, "  14% SPEED", #$FF
        db #$28, " 100% EARLY", #$FF
        db #$28, "  100% LATE", #$FF
        db #$28, "   100% MAP", #$FF
        db #$28, "        RBO", #$FF
        db #$28, " NG+ PLASMA", #$FF
        db #$28, "  NG+ HYPER", #$FF
        db #$28, " NIN POWER%", #$FF
        db #$28, "  BOSS KPDR", #$FF
        db #$28, "  BOSS PKDR", #$FF
        db #$28, "  BOSS PRKD", #$FF
    db #$FF
  .routine
    LDA #$0000 : STA !sram_last_preset
    RTS

precat_kpdr21:
    %cm_jsr("Any% KPDR 3 E-Tanks", #action_select_preset_category, #$0000)

precat_kpdr22:
    %cm_jsr("Any% KPDR 4 E-Tanks", #action_select_preset_category, #$0001)

precat_prkd15:
    %cm_jsr("Any% PRKD 15 Missiles", #action_select_preset_category, #$0002)

precat_prkd:
    %cm_jsr("Any% PRKD 20 Missiles", #action_select_preset_category, #$0003)

precat_pkrd:
    %cm_jsr("Any% PKRD", #action_select_preset_category, #$0004)

precat_spazer:
    %cm_jsr("Spazer Any%", #action_select_preset_category, #$0005)

precat_kpdr25:
    %cm_jsr("Any% KPDR Early Ice", #action_select_preset_category, #$0006)

precat_gtclassic:
    %cm_jsr("GT Classic", #action_select_preset_category, #$0007)

precat_gtmax:
    %cm_jsr("GT Max%", #action_select_preset_category, #$0008)

precat_14ice:
    %cm_jsr("Low% Ice", #action_select_preset_category, #$0009)

precat_14speed:
    %cm_jsr("Low% Speed", #action_select_preset_category, #$000A)

precat_100early:
    %cm_jsr("100% Early Crocomire", #action_select_preset_category, #$000B)

precat_hundo:
    %cm_jsr("100% Late Crocomire", #action_select_preset_category, #$000C)

precat_100map:
    %cm_jsr("100% Map Completion", #action_select_preset_category, #$000D)

precat_rbo:
    %cm_jsr("Reverse Boss Order", #action_select_preset_category, #$000E)

precat_ngplasma:
    %cm_jsr("NewGamePlus Plasma", #action_select_preset_category, #$000F)

precat_nghyper:
    %cm_jsr("NewGamePlus Hyper", #action_select_preset_category, #$0010)

precat_nintendopower:
    %cm_jsr("Nintendo Power%", #action_select_preset_category, #$0011)

precat_allbosskpdr:
    %cm_jsr("All Bosses KPDR", #action_select_preset_category, #$0012)

precat_allbosspkdr:
    %cm_jsr("All Bosses PKDR", #action_select_preset_category, #$0013)

precat_allbossprkd:
    %cm_jsr("All Bosses PRKD", #action_select_preset_category, #$0014)

action_select_preset_category:
{
    TYA : STA !sram_preset_category
    LDA #$0000 : STA !sram_last_preset
    JSL cm_previous_menu
    RTS
}

action_load_preset:
{
    PHB
    PHK : PLB

    TYA : STA !ram_load_preset
    LDA #$0001 : STA !ram_cm_leave

    PLB
    RTS
}


; ----------------
; Equipment menu
; ----------------

EquipmentMenu:
    dw #eq_refill
    dw #eq_toggle_category
    dw #eq_goto_toggleitems
    dw #eq_goto_togglebeams
    dw #$FFFF
    dw #eq_currentenergy
    dw #eq_setetanks
    dw #$FFFF
    dw #eq_currentreserves
    dw #eq_setreserves
    dw #$FFFF
    dw #eq_currentmissiles
    dw #eq_setmissiles
    dw #$FFFF
    dw #eq_currentsupers
    dw #eq_setsupers
    dw #$FFFF
    dw #eq_currentpbs
    dw #eq_setpbs
    dw #$0000
    %cm_header("EQUIPMENT")
    %cm_footer("HOLD Y FOR FAST SCROLL")

eq_refill:
    %cm_jsr("Refill", .refill, #$0000)

  .refill
    LDA $7E09C4 : STA $7E09C2 ; health
    LDA $7E09C8 : CMP $7E09C6 : BCC + : STA $7E09C6 ; missiles
+   LDA $7E09CC : CMP $7E09CA : BCC + : STA $7E09CA ; supers
+   LDA $7E09D0 : CMP $7E09CE : BCC + : STA $7E09CE ; pbs
+   LDA $7E09D4 : STA $7E09D6 ; reserves
    STZ $0CD2  ; bomb counter
    %sfxenergy()
    RTS

eq_toggle_category:
    %cm_submenu("Category Loadouts", #ToggleCategoryMenu)

eq_goto_toggleitems:
    %cm_submenu("Toggle Items", #ToggleItemsMenu)

eq_goto_togglebeams:
    %cm_submenu("Toggle Beams", #ToggleBeamsMenu)

eq_currentenergy:
    %cm_numfield_word("Current Energy", $7E09C2, 0, 2100, 1, 20, #0)

eq_setetanks:
    %cm_numfield("Energy Tanks", !ram_cm_etanks, 0, 21, 1, 1, .routine)
    .routine
        TAX
        LDA #$0000
        CPX #$000F : BPL .loop
        LDA #$0063
      .loop
        DEX : BMI .endloop
        CLC : ADC #$0064
        BRA .loop
      .endloop
        STA !SAMUS_HP_MAX : STA !SAMUS_HP
        RTS

eq_currentreserves:
    %cm_numfield_word("Current Reserves", $7E09D6, 0, 700, 1, 20, #0)

eq_setreserves:
    %cm_numfield("Reserve Tanks", !ram_cm_reserve, 0, 7, 1, 1, .routine)
    .routine
        TAX
        LDA #$0000
      .loop
        DEX : BMI .endloop
        CLC : ADC #$0064
        BRA .loop
      .endloop
        STA !SAMUS_RESERVE_ENERGY : STA !SAMUS_RESERVE_MAX
        RTS

eq_currentmissiles:
    %cm_numfield_word("Current Missiles", $7E09C6, 0, 325, 1, 20, #0)

eq_setmissiles:
    %cm_numfield_word("Missiles", $7E09C8, 0, 325, 5, 20, .routine)
    .routine
        LDA !SAMUS_MISSILES_MAX : STA !SAMUS_MISSILES ; missiles
        RTS

eq_currentsupers:
    %cm_numfield("Current Super Missiles", $7E09CA, 0, 65, 1, 5, #0)

eq_setsupers:
    %cm_numfield("Super Missiles", $7E09CC, 0, 65, 5, 5, .routine)
    .routine
        LDA !SAMUS_SUPERS_MAX : STA !SAMUS_SUPERS ; supers
        RTS

eq_currentpbs:
if !FEATURE_PAL
    %cm_numfield("Current Power Bombs", $7E09CE, 0, 70, 1, 5, #0)
else
    %cm_numfield("Current Power Bombs", $7E09CE, 0, 65, 1, 5, #0)
endif

eq_setpbs:
if !FEATURE_PAL
    %cm_numfield("Power Bombs", $7E09D0, 0, 70, 5, 5, .routine)
else
    %cm_numfield("Power Bombs", $7E09D0, 0, 65, 5, 5, .routine)
endif
    .routine
        LDA !SAMUS_PBS_MAX : STA !SAMUS_PBS ; pbs
        RTS


; ---------------------
; Toggle Category menu
; ---------------------

ToggleCategoryMenu:
    dw #cat_100
    dw #cat_any_new
    dw #cat_any_old
    dw #cat_14ice
    dw #cat_14speed
if !FEATURE_PAL
    dw #cat_14xice
    dw #cat_14iceboots
    dw #cat_14speedboots
endif
    dw #cat_gt_code
    dw #cat_rbo
    dw #cat_any_glitched
    dw #cat_inf_cf
    dw #cat_nothing
    dw #$0000
    %cm_header("CATEGORY PRESETS")

cat_100:
    %cm_jsr("100%", action_category, #$0000)

cat_any_new:
    %cm_jsr("Any% PRKD", action_category, #$0001)

cat_any_old:
    %cm_jsr("Any% KPDR", action_category, #$0002)

cat_14ice:
    %cm_jsr("14% Ice", action_category, #$0003)

cat_14speed:
    %cm_jsr("14% Speed", action_category, #$0004)

cat_gt_code:
    %cm_jsr("GT Code", action_category, #$0005)

cat_gt_135:
    %cm_jsr("GT Max%", action_category, #$0006)

cat_rbo:
    %cm_jsr("RBO", action_category, #$0007)

cat_any_glitched:
    %cm_jsr("Any% Glitched", action_category, #$0008)

cat_inf_cf:
    %cm_jsr("Infinite Crystal Flashes", action_category, #$0009)

cat_nothing:
    %cm_jsr("Nothing", action_category, #$000A)

if !FEATURE_PAL
cat_14xice:
    %cm_jsr("14% X-Ice", action_category, #$000B)

cat_14iceboots:
    %cm_jsr("14% Ice Boots", action_category, #$000C)

cat_14speedboots:
    %cm_jsr("14% Speed Boots", action_category, #$000D)
endif

action_category:
{
    JSL set_category_loadout
    RTS
}


; ------------------
; Toggle Items menu
; ------------------

ToggleItemsMenu:
    dw #ti_variasuit
    dw #ti_gravitysuit
    dw #$FFFF
    dw #ti_morphball
    dw #ti_bomb
    dw #ti_springball
    dw #ti_screwattack
    dw #$FFFF
    dw #ti_hijumpboots
    dw #ti_spacejump
    dw #ti_speedbooster
    dw #$FFFF
    dw #ti_grapple
    dw #ti_xray
    dw #$0000
    %cm_header("TOGGLE ITEMS")

ti_variasuit:
    %cm_toggle_bit("Varia Suit", $7E09A4, #$0001, #0)

ti_gravitysuit:
    %cm_toggle_bit("Gravity Suit", $7E09A4, #$0020, #0)

ti_morphball:
    %cm_toggle_bit("Morphing Ball", $7E09A4, #$0004, #0)

ti_bomb:
    %cm_toggle_bit("Bombs", $7E09A4, #$1000, #0)

ti_springball:
    %cm_toggle_bit("Spring Ball", $7E09A4, #$0002, #0)

ti_screwattack:
    %cm_toggle_bit("Screw Attack", $7E09A4, #$0008, #0)

ti_hijumpboots:
    %cm_toggle_bit("Hi Jump Boots", $7E09A4, #$0100, #0)

ti_spacejump:
    %cm_toggle_bit("Space Jump", $7E09A4, #$0200, #0)

ti_speedbooster:
    %cm_toggle_bit("Speed Booster", $7E09A4, #$2000, #0)

ti_grapple:
    %cm_toggle_bit("Grapple", $7E09A2, #$4000, .routine)
    .routine
        LDA !SAMUS_ITEMS_COLLECTED : EOR #$4000 : STA !SAMUS_ITEMS_COLLECTED
        RTS

ti_xray:
    %cm_toggle_bit("X-Ray", $7E09A2, #$8000, .routine)
    .routine
        LDA !SAMUS_ITEMS_COLLECTED : EOR #$8000 : STA !SAMUS_ITEMS_COLLECTED
        RTS


; -----------------
; Toggle Beams menu
; -----------------

ToggleBeamsMenu:
    dw tb_chargebeam
    dw tb_icebeam
    dw tb_wavebeam
    dw tb_spazerbeam
    dw tb_plasmabeam
    dw #$FFFF
    dw tb_glitchedbeams
    dw #$0000
    %cm_header("TOGGLE BEAMS")

tb_chargebeam:
    %cm_toggle_bit("Charge", $7E09A8, #$1000, #action_equip_safe_beams)

tb_icebeam:
    %cm_toggle_bit("Ice", $7E09A8, #$0002, #action_equip_safe_beams)

tb_wavebeam:
    %cm_toggle_bit("Wave", $7E09A8, #$0001, #action_equip_safe_beams)

tb_spazerbeam:
    %cm_toggle_bit("Spazer", $7E09A8, #$0004, #.routine)
  .routine
    AND #$1007 : STA !SAMUS_BEAMS_EQUIPPED
    RTS

tb_plasmabeam:
    %cm_toggle_bit("Plasma", $7E09A8, #$0008, #.routine)
  .routine
    AND #$100B : STA !SAMUS_BEAMS_EQUIPPED
    RTS

tb_glitchedbeams:
    %cm_submenu("Glitched Beams", #GlitchedBeamsMenu)

action_equip_safe_beams:
{
    STA !SAMUS_BEAMS_EQUIPPED
    RTS
}


; -------------------
; Glitched Beams menu
; -------------------

GlitchedBeamsMenu:
    dw #gb_murder
    dw #gb_spacetime
    dw #gb_chainsaw
    dw #gb_unnamed
    dw #$0000
    %cm_header("GL1TC#ED %E4MS")
    %cm_footer("BEWARE OF CRASHES")

gb_murder:
    %cm_jsr("Murder Beam", action_glitched_beam, #$100F)

gb_spacetime:
    %cm_jsr("Spacetime Beam", action_glitched_beam, #$100E)

gb_chainsaw:
    %cm_jsr("Chainsaw Beam", action_glitched_beam, #$100D)

gb_unnamed:
    %cm_jsr("Unnamed Glitched Beam", action_glitched_beam, #$100C)

action_glitched_beam:
{
    TYA
    STA !SAMUS_BEAMS_EQUIPPED : STA !SAMUS_BEAMS_COLLECTED
    LDA #$0042 : JSL !SFX_LIB1 ; unlabled, song dependent sound
    RTS
}
    

; -------------
; Teleport menu
; -------------

TeleportMenu:
    dw #tel_crateriaship
    dw #tel_crateriaparlor
    dw #tel_brinstarpink
    dw #tel_brinstargreenshaft
    dw #tel_brinstargreenetecoons
    dw #tel_brinstarkraid
    dw #tel_brinstarredtower
    dw #tel_norfairgrapple
    dw #tel_norfairbubble
    dw #tel_norfairtunnel
    dw #tel_norfaircrocomire
    dw #tel_norfairlnelevator
    dw #tel_norfairridley
    dw #tel_wreckedship
    dw #tel_maridiatube
    dw #tel_maridiaelevator
    dw #tel_maridiaaqueduct
    dw #tel_maridiadraygon
    dw #tel_tourianentrance
    dw #tel_tourianbbyskip
    dw #tel_tourianmb
    dw #$0000
    %cm_header("SAVE STATIONS")

tel_crateriaship:
    %cm_jsr("Crateria Ship", #action_teleport, #$0000)

tel_crateriaparlor:
    %cm_jsr("Crateria Parlor", #action_teleport, #$0001)

tel_brinstarpink:
    %cm_jsr("Brinstar Pink Spospo", #action_teleport, #$0100)

tel_brinstargreenshaft:
    %cm_jsr("Brinstar Green Shaft", #action_teleport, #$0101)

tel_brinstargreenetecoons:
    %cm_jsr("Brinstar Green Etecoons", #action_teleport, #$0102)

tel_brinstarkraid:
    %cm_jsr("Brinstar Kraid", #action_teleport, #$0103)

tel_brinstarredtower:
    %cm_jsr("Brinstar Red Tower", #action_teleport, #$0104)

tel_norfairgrapple:
    %cm_jsr("Norfair Grapple", #action_teleport, #$0200)

tel_norfairbubble:
    %cm_jsr("Norfair Bubble Mountain", #action_teleport, #$0201)

tel_norfairtunnel:
    %cm_jsr("Norfair Tunnel", #action_teleport, #$0202)

tel_norfaircrocomire:
    %cm_jsr("Norfair Crocomire", #action_teleport, #$0203)

tel_norfairlnelevator:
    %cm_jsr("Norfair LN Elevator", #action_teleport, #$0204)

tel_norfairridley:
    %cm_jsr("Norfair Ridley", #action_teleport, #$0205)

tel_wreckedship:
    %cm_jsr("Wrecked Ship", #action_teleport, #$0300)

tel_maridiatube:
    %cm_jsr("Maridia Tube", #action_teleport, #$0400)

tel_maridiaelevator:
    %cm_jsr("Maridia Elevator", #action_teleport, #$0401)

tel_maridiaaqueduct:
    %cm_jsr("Maridia Aqueduct", #action_teleport, #$0402)

tel_maridiadraygon:
    %cm_jsr("Maridia Draygon", #action_teleport, #$0403)

tel_tourianentrance:
    %cm_jsr("Tourian Entrance", #action_teleport, #$0501)

tel_tourianbbyskip:
    %cm_jsr("Tourian Baby Skip", #action_teleport, #$0511)

tel_tourianmb:
    %cm_jsr("Tourian MB", #action_teleport, #$0500)

action_teleport:
{
    ; teleport destination in Y when called
    TYA : AND #$FF00 : XBA : STA !AREA_ID
    TYA : AND #$00FF : STA !LOAD_STATION_INDEX
    LDA #$0006 : STA !GAMEMODE

    ; Make sure we can teleport to Zebes from Ceres
    %a8()
    LDA #$05 : STA $7ED914
    %a16()

    STZ $0727 ; Clear pause menu index
    STZ $1C1F ; Clear message box index

    JSL reset_all_counters
    JSL stop_all_sounds

    LDA #$0001 : STA !ram_cm_leave

    RTS
}


; -----------
; Misc menu
; -----------

MiscMenu:
    dw #misc_bluesuit
    dw #misc_flashsuit
    dw #misc_hyperbeam
    dw #$FFFF
    dw #misc_invincibility
    dw #misc_infiniteammo
    dw #misc_slowdownrate
    dw #misc_suit_properties
    dw #$FFFF
    dw #misc_magicpants
    dw #misc_spacepants
    dw #misc_loudpants
    dw #$FFFF
    dw #misc_metronome
    dw #misc_metronome_tickrate
    dw #misc_metronome_sfx
    dw #$FFFF
    dw #misc_killenemies
    dw #misc_forcestand
    dw #misc_elevatorfix
    dw #$0000
    %cm_header("MISC OPTIONS")

misc_bluesuit:
    %cm_toggle("Blue Suit", $7E0B3F, #$0004, #0)

misc_flashsuit:
    %cm_toggle("Flash Suit", $7E0A68, #$0001, #0)

misc_hyperbeam:
    %cm_toggle_bit("Hyper Beam", $7E0A76, #$8000, #0)

misc_slowdownrate:
    %cm_numfield("Samus Slowdown Rate", $7E0A66, 0, 4, 1, 1, #0)

misc_magicpants:
    %cm_toggle_bit("Magic Pants", !ram_magic_pants_enabled, #$0001, GameLoopExtras)

misc_spacepants:
    %cm_toggle_bit("Space Pants", !ram_magic_pants_enabled, #$0002, GameLoopExtras)

misc_loudpants:
    %cm_toggle_bit("Loud Pants", !ram_magic_pants_enabled, #$0004, GameLoopExtras)

misc_suit_properties:
    dw !ACTION_CHOICE
    dl #!sram_suit_properties
    dw init_suit_properties_ram
    db #$28, "Suit Properties", #$FF
    db #$28, "    VANILLA", #$FF
    db #$28, "   BALANCED", #$FF
    db #$28, "   PROGRESS", #$FF
    db #$FF

init_suit_properties_ram:
{
    LDA #$0021 : STA !ram_suits_enemy_damage_check : STA !ram_suits_periodic_damage_check

    LDA !sram_suit_properties : CMP #$0002 : BNE .init_periodic_damage
    LDA #$0001 : STA !ram_suits_enemy_damage_check

  .init_periodic_damage
    LDA !sram_suit_properties : BEQ .end
    LDA #$0001 : STA !ram_suits_periodic_damage_check

  .end
    RTS
}

misc_invincibility:
    %cm_toggle_bit("Invincibility", $7E0DE0, #$0007, #0)

misc_infiniteammo:
    %cm_toggle_bit("Infinite Ammo", !ram_infinite_ammo, #$0001, #GameLoopExtras)

misc_metronome:
    %cm_toggle("Metronome", !ram_metronome, #$0001, GameLoopExtras)

misc_metronome_tickrate:
    %cm_numfield("Metronome Tickrate", !sram_metronome_tickrate, 1, 255, 1, 8, #.routine)
  .routine
    LDA #$0000 : STA !ram_metronome_counter
    RTS

misc_metronome_sfx:
    dw !ACTION_CHOICE
    dl #!sram_metronome_sfx
    dw #$0000
    db #$28, "Metronome SFX", #$FF
        db #$28, "    MISSILE", #$FF
        db #$28, "      CLICK", #$FF
        db #$28, "       BEEP", #$FF
        db #$28, " POWER BEAM", #$FF
        db #$28, "     SPAZER", #$FF
    db #$FF

misc_killenemies:
    %cm_jsr("Kill Enemies", .kill_loop, #0)
  .kill_loop
    ; 8000 = solid to Samus, 0400 = Ignore Samus projectiles
    TAX : LDA $0F86,X : BIT #$8400 : BNE +
    ORA #$0200 : STA $0F86,X
+   TXA : CLC : ADC #$0040 : CMP #$0400 : BNE .kill_loop
    %sfxconfirm()
    RTS

misc_forcestand:
    %cm_jsr("Force Samus to Stand Up", .routine, #0)
  .routine
    JSL $90E2D4
    %sfxconfirm()
    RTS

misc_elevatorfix:
    %cm_jsr("OoB Elevator Tile Fix", .routine, #0)
  .routine
    LDA #$0000 : STA $7E0E16
    %sfxconfirm()
    RTS


; ---------------
; Sprite Features
; ---------------

SpritesMenu:
    dw #sprites_samus_prio
    dw #sprites_show_samus_hitbox
    dw #sprites_show_enemy_hitbox
    dw #sprites_show_extended_spritemap_hitbox
    dw #sprites_show_enemyproj_hitbox
    dw #sprites_show_samusproj_hitbox
    dw #sprites_oob_viewer
    dw #$0000
    %cm_header("SPRITE FEATURES")

sprites_samus_prio:
    %cm_toggle_bit("Samus on Top", !sram_sprite_prio_flag, #$3000, #0)

sprites_show_samus_hitbox:
    %cm_toggle("Show Samus Hitbox", !ram_sprite_samus_hitbox_active, #1, #action_sprite_features)

sprites_show_enemy_hitbox:
    %cm_toggle("Show Enemy Hitboxes", !ram_sprite_enemy_hitbox_active, #1, #action_sprite_features)

sprites_show_extended_spritemap_hitbox:
    %cm_toggle("Ext. Spritemap Hitboxes", !ram_sprite_extended_hitbox_active, #1, #action_sprite_features)

sprites_show_enemyproj_hitbox:
    %cm_toggle("Enemy Projectile Hitbox", !ram_sprite_enemyproj_hitbox_active, #1, #action_sprite_features)

sprites_show_samusproj_hitbox:
    %cm_toggle("Samus Projectile Hitbox", !ram_sprite_samusproj_hitbox_active, #1, #action_sprite_features)

sprites_oob_viewer:
    %cm_toggle("OoB Tile Viewer", !ram_oob_watch_active, #1, .routine)
  .routine
    LDA !ram_oob_watch_active : BEQ +
    JSL upload_sprite_oob_tiles
    STA !ram_sprite_features_active
+   RTS

action_sprite_features:
{
    LDA !ram_sprite_samus_hitbox_active : BNE .enabled
    LDA !ram_sprite_enemy_hitbox_active : BNE .enabled
    LDA !ram_sprite_extended_hitbox_active : BNE .enabled
    LDA !ram_sprite_enemyproj_hitbox_active : BNE .enabled
    LDA !ram_sprite_samusproj_hitbox_active : BNE .enabled
    LDA !ram_oob_watch_active

  .enabled
    STA !ram_sprite_features_active
    RTS
}


; ----------------
; Room Layout Menu
; ----------------

LayoutMenu:
    dw #layout_magnetstairs
    dw #$FFFF
    dw #layout_arearando
    dw #layout_antisoftlock
    dw #$0000
    %cm_header("ROOM LAYOUTS")
    %cm_footer("APPLIED WHEN ROOM RELOADED")

!ROOM_LAYOUT_MAGNET_STAIRS = #$0001
layout_magnetstairs:
    %cm_toggle_bit("Magnet Stairs Fix", !sram_room_layout, !ROOM_LAYOUT_MAGNET_STAIRS, #.routine)
  .routine
    LDA !ROOM_ID : CMP #$DFD7 : BNE .done
    LDA !sram_room_layout : AND !ROOM_LAYOUT_MAGNET_STAIRS : BEQ .broken

    ; change tile type and BTS
    PHP : %a8()
    LDA #$10 : STA $7F01F9 : STA $7F02EB
    LDA #$53 : STA $7F64FD : STA $7F6576
    PLP
    RTS

  .broken
    ; change tile type and BTS
    PHP : %a8()
    LDA #$80 : STA $7F01F9 : STA $7F02EB
    LDA #$00 : STA $7F64FD : STA $7F6576
    PLP

  .done
    RTS

!ROOM_LAYOUT_AREA_RANDO = #$0002
layout_arearando:
    %cm_toggle_bit("Area Rando Patches", !sram_room_layout, !ROOM_LAYOUT_AREA_RANDO, #0)

!ROOM_LAYOUT_ANTISOFTLOCK = #$0004
layout_antisoftlock:
    %cm_toggle_bit("Anti-Softlock Patches", !sram_room_layout, !ROOM_LAYOUT_ANTISOFTLOCK, #0)


; -----------
; Events menu
; -----------

EventsMenu:
    dw #events_resetevents
    dw #events_resetdoors
    dw #events_resetitems
    dw #$FFFF
    dw #events_goto_bosses
    dw #$FFFF
    dw #events_zebesawake
    dw #events_maridiatubebroken
    dw #events_chozoacid
    dw #events_shaktool
    dw #events_tourian
    dw #events_metroid1
    dw #events_metroid2
    dw #events_metroid3
    dw #events_metroid4
    dw #events_zeb1
    dw #events_zeb2
    dw #events_zeb3
    dw #events_mb1glass
    dw #events_zebesexploding
    dw #events_animals
    dw #$0000
    %cm_header("EVENT FLAGS")

events_resetevents:
    %cm_jsr("Reset All Events", .routine, #$0000)
  .routine
    LDA #$0000
    STA $7ED820 : STA $7ED822
    %sfxquake()
    RTS

events_resetdoors:
    %cm_jsr("Reset All Doors", .routine, #$0000)
  .routine
    %ai8()
    LDA #$00 : LDX #$B0
-   STA $7ED800,X
    INX : CPX #$D0 : BNE -
    %ai16()
    %sfxquake()
    RTS

events_resetitems:
    %cm_jsr("Reset All Items", .routine, #$0000)
  .routine
    %ai8()
    LDA #$00 : LDX #$70
-   STA $7ED800,X
    INX : CPX #$90 : BNE -
    %ai16()
    %sfxquake()
    RTS

events_goto_bosses:
    %cm_submenu("Bosses", #BossesMenu)

events_zebesawake:
    %cm_toggle_bit("Zebes Awake", $7ED820, #$0001, #0)

events_maridiatubebroken:
    %cm_toggle_bit("Maridia Tube Broken", $7ED820, #$0800, #0)

events_shaktool:
    %cm_toggle_bit("Shaktool Done Digging", $7ED820, #$2000, #0)

events_chozoacid:
    %cm_toggle_bit("Chozo Lowered Acid", $7ED821, #$0010, #0)

events_tourian:
    %cm_toggle_bit("Tourian Open", $7ED820, #$0400, #0)

events_metroid1:
    %cm_toggle_bit("1st Metroids Cleared", $7ED822, #$0001, #0)

events_metroid2:
    %cm_toggle_bit("2nd Metroids Cleared", $7ED822, #$0002, #0)

events_metroid3:
    %cm_toggle_bit("3rd Metroids Cleared", $7ED822, #$0004, #0)

events_metroid4:
    %cm_toggle_bit("4th Metroids Cleared", $7ED822, #$0008, #0)

events_zeb1:
    %cm_toggle_bit("Zebetite Bit 08", $7ED820, #$0008, #0)

events_zeb2:
    %cm_toggle_bit("Zebetite Bit 10", $7ED820, #$0010, #0)

events_zeb3:
    %cm_toggle_bit("Zebetite Bit 20", $7ED820, #$0020, #0)

events_mb1glass:
    %cm_toggle_bit("MB1 Glass Broken", $7ED820, #$0004, #0)

events_zebesexploding:
    %cm_toggle_bit("Zebes Set Ablaze", $7ED820, #$4000, #0)

events_animals:
    %cm_toggle_bit("Animals Saved", $7ED820, #$8000, #0)


; ------------
; Bosses menu
; ------------

BossesMenu:
    dw #boss_ceresridley
    dw #boss_bombtorizo
    dw #boss_spospo
    dw #boss_kraid
    dw #boss_phantoon
    dw #boss_botwoon
    dw #boss_draygon
    dw #boss_crocomire
    dw #boss_gt
    dw #boss_ridley
    dw #boss_mb
    dw #$0000
    %cm_header("BOSSES")

boss_ceresridley:
    %cm_toggle_bit("Ceres Ridley", #$7ED82E, #$0001, #0)

boss_bombtorizo:
    %cm_toggle_bit("Bomb Torizo", #$7ED828, #$0004, #0)

boss_spospo:
    %cm_toggle_bit("Spore Spawn", #$7ED828, #$0200, #0)

boss_kraid:
    %cm_toggle_bit("Kraid", #$7ED828, #$0100, #0)

boss_phantoon:
    %cm_toggle_bit("Phantoon", #$7ED82A, #$0100, #0)

boss_botwoon:
    %cm_toggle_bit("Botwoon", #$7ED82C, #$0002, #0)

boss_draygon:
    %cm_toggle_bit("Draygon", #$7ED82C, #$0001, #0)

boss_crocomire:
    %cm_toggle_bit("Crocomire", #$7ED82A, #$0002, #0)

boss_gt:
    %cm_toggle_bit("Golden Torizo", #$7ED82A, #$0004, #0)

boss_ridley:
    %cm_toggle_bit("Ridley", #$7ED82A, #$0001, #0)

boss_mb:
    %cm_toggle_bit("Mother Brain", #$7ED82C, #$0200, #0)


; --------------
; Infohud menu
; --------------

InfoHudMenu:
    dw #ih_goto_display_mode
    dw #ih_display_mode
    dw #$FFFF
    dw #ih_goto_room_strat
    dw #ih_room_strat
    dw #$FFFF
    dw #ih_superhud
    dw #$FFFF
    dw #ih_room_counter
    dw #ih_lag_counter
    dw #ih_reset_seg_later
    dw #ih_lag
    dw #ih_top_HUD_mode
    dw #ih_status_icons
    dw #$FFFF
    dw #ih_ram_watch
    dw #$0000
    %cm_header("INFOHUD")

ih_goto_display_mode:
    %cm_submenu("Select InfoHUD Mode", #DisplayModeMenu)

DisplayModeMenu:
    dw ihmode_enemyhp
    dw ihmode_roomstrat
    dw ihmode_chargetimer
    dw ihmode_xfactor
    dw ihmode_cooldowncounter
    dw ihmode_shinetimer
    dw ihmode_dashcounter
    dw ihmode_shinetune
    dw ihmode_iframecounter
    dw ihmode_spikesuit
    dw ihmode_lagcounter
    dw ihmode_cpuusage
    dw ihmode_xpos
    dw ihmode_ypos
    dw ihmode_hspeed
    dw ihmode_vspeed
    dw ihmode_quickdrop
    dw ihmode_walljump
    dw ihmode_shottimer
    dw ihmode_countdamage
    dw ihmode_ridleygrab
    dw ihmode_ramwatch
;    dw ihmode_dboost (unfinished)
;    dw ihmode_GOTO_PAGE_TWO
    dw #$0000
    %cm_header("INFOHUD DISPLAY MODE")

DisplayModeMenu2:
;    dw ihmode_GOTO_PAGE_ONE
;    dw #$0000
;    %cm_header("INFOHUD DISPLAY MODE")

ihmode_enemyhp:
    %cm_jsr("Enemy HP", #action_select_infohud_mode, #$0000)

ihmode_roomstrat:
!IH_MODE_ROOMSTRAT_INDEX = #$0001
    %cm_jsr("Room Strat", #action_select_infohud_mode, #$0001)

ihmode_chargetimer:
    %cm_jsr("Charge Timer", #action_select_infohud_mode, #$0002)

ihmode_xfactor:
    %cm_jsr("X-Factor Timer", #action_select_infohud_mode, #$0003)

ihmode_cooldowncounter:
    %cm_jsr("Cooldown Timer", #action_select_infohud_mode, #$0004)

ihmode_shinetimer:
    %cm_jsr("Shinespark Timer", #action_select_infohud_mode, #$0005)

ihmode_dashcounter:
    %cm_jsr("Dash Counter", #action_select_infohud_mode, #$0006)

ihmode_shinetune:
!IH_MODE_SHINETUNE_INDEX = #$0007
    %cm_jsr("Shine Tune", #action_select_infohud_mode, #$0007)

ihmode_iframecounter:
    %cm_jsr("I-Frame Counter", #action_select_infohud_mode, #$0008)

ihmode_spikesuit:
    %cm_jsr("Spikesuit Trainer", #action_select_infohud_mode, #$0009)

ihmode_lagcounter:
    %cm_jsr("Lag Counter", #action_select_infohud_mode, #$000A)

ihmode_cpuusage:
    %cm_jsr("CPU Usage", #action_select_infohud_mode, #$000B)

ihmode_xpos:
    %cm_jsr("X Position", #action_select_infohud_mode, #$000C)

ihmode_ypos:
    %cm_jsr("Y Position", #action_select_infohud_mode, #$000D)

ihmode_hspeed:
    %cm_jsr("Horizontal Speed", #action_select_infohud_mode, #$000E)

!IH_MODE_VSPEED_INDEX = #$000F
ihmode_vspeed:
    %cm_jsr("Vertical Speed", #action_select_infohud_mode, #$000F)

ihmode_quickdrop:
    %cm_jsr("Quickdrop Trainer", #action_select_infohud_mode, #$0010)

ihmode_walljump:
    %cm_jsr("Walljump Trainer", #action_select_infohud_mode, #$0011)

ihmode_shottimer:
    %cm_jsr("Shot Timer", #action_select_infohud_mode, #$0012)

ihmode_countdamage:
    %cm_jsr("Boss Damage Counter", #action_select_infohud_mode, #$0013)

ihmode_ridleygrab:
    %cm_jsr("Ridley Death Grab Attempts", #action_select_infohud_mode, #$0014)

!IH_MODE_RAMWATCH_INDEX = #$0015
ihmode_ramwatch:
    %cm_jsr("Custom RAM Watch", #action_select_infohud_mode, #$0015)

;ihmode_dboost:
;    %cm_jsr("WIP - Damage Boost Trainer", #action_select_infohud_mode, #$0016)

;ihmode_GOTO_PAGE_ONE:
;    %cm_submenu("GOTO PAGE ONE", #DisplayModeMenu)

;ihmode_GOTO_PAGE_TWO:
;    %cm_submenu("GOTO PAGE TWO", #DisplayModeMenu2)
    

action_select_infohud_mode:
{
    TYA : STA !sram_display_mode
    JSL cm_previous_menu
    RTS
}

ih_display_mode:
    dw !ACTION_CHOICE
    dl #!sram_display_mode
    dw #$0000
    db #$28, "Current Mode", #$FF
    db #$28, "   ENEMY HP", #$FF
    db #$28, " ROOM STRAT", #$FF
    db #$28, "     CHARGE", #$FF
    db #$28, "   X FACTOR", #$FF
    db #$28, "   COOLDOWN", #$FF
    db #$28, " SHINESPARK", #$FF
    db #$28, "       DASH", #$FF
    db #$28, " SHINE TUNE", #$FF
    db #$28, "   I FRAMES", #$FF
    db #$28, "  SPIKESUIT", #$FF
    db #$28, "LAG COUNTER", #$FF
    db #$28, "  CPU USAGE", #$FF
    db #$28, " X POSITION", #$FF
    db #$28, " Y POSITION", #$FF
    db #$28, "HORIZ SPEED", #$FF
    db #$28, " VERT SPEED", #$FF
    db #$28, " QUICK DROP", #$FF
    db #$28, "  WALL JUMP", #$FF
    db #$28, " SHOT TIMER", #$FF
    db #$28, "DMG COUNTER", #$FF
    db #$28, "RIDLEY GRAB", #$FF
    db #$28, "  RAM WATCH", #$FF
;    db #$28, "WIP D-BOOST", #$FF
    db #$FF

ih_goto_room_strat:
    %cm_submenu("Select Room Strat", #RoomStratMenu)

RoomStratMenu:
    dw ihstrat_superhud
    dw ihstrat_mbhp
    dw ihstrat_moatcwj
    dw ihstrat_gateglitch
    dw ihstrat_tacotank
    dw ihstrat_robotflush
    dw ihstrat_shinetopb
    dw ihstrat_elevatorcf
    dw ihstrat_botwooncf
    dw ihstrat_doorskip
    dw ihstrat_snailclip
    dw ihstrat_threejumpskip
    dw ihstrat_kihuntermanip
    dw ihstrat_kraidradar
    dw #$0000
    %cm_header("INFOHUD ROOM STRAT")
    %cm_footer("ROOM STRAT MUST BE ACTIVE")

ihstrat_superhud:
    %cm_jsr("Super HUD", #action_select_room_strat, #$0000)

ihstrat_mbhp:
!IH_STRAT_MBHP_INDEX = #$0001
    %cm_jsr("Mother Brain HP", #action_select_room_strat, #$0001)

ihstrat_moatcwj:
    %cm_jsr("Moat CWJ", #action_select_room_strat, #$0002)

ihstrat_gateglitch:
    %cm_jsr("Gate Glitch", #action_select_room_strat, #$0003)

ihstrat_tacotank:
    %cm_jsr("Taco Tank", #action_select_room_strat, #$0004)

ihstrat_robotflush:
    %cm_jsr("Robot Flush", #action_select_room_strat, #$0005)

ihstrat_shinetopb:
    %cm_jsr("Shine to PB", #action_select_room_strat, #$0006)

ihstrat_elevatorcf:
    %cm_jsr("Elevator Crystal Flash", #action_select_room_strat, #$0007)

ihstrat_botwooncf:
    %cm_jsr("Botwoon Crystal Flash", #action_select_room_strat, #$0008)

ihstrat_doorskip:
    %cm_jsr("Parlor Door Skip", #action_select_room_strat, #$0009)

ihstrat_snailclip:
    %cm_jsr("Aqueduct Snail Clip", #action_select_room_strat, #$000A)

ihstrat_threejumpskip:
    %cm_jsr("Three Jump Baby Skip", #action_select_room_strat, #$000B)

ihstrat_kihuntermanip:
    %cm_jsr("Kihunter Manipulation", #action_select_room_strat, #$000C)

ihstrat_kraidradar:
    %cm_jsr("Kraid Nail Radar", #action_select_room_strat, #$000D)

action_select_room_strat:
{
    TYA : STA !sram_room_strat
    LDA !IH_MODE_ROOMSTRAT_INDEX : STA !sram_display_mode
    JSL cm_previous_menu
    RTS
}

ih_room_strat:
    dw !ACTION_CHOICE
    dl #!sram_room_strat
    dw #.routine
    db #$28, "Current Strat", #$FF
    db #$28, "  SUPER HUD", #$FF
    db #$28, "      MB HP", #$FF
    db #$28, "   MOAT CWJ", #$FF
    db #$28, "GATE GLITCH", #$FF
    db #$28, "  TACO TANK", #$FF
    db #$28, "ROBOT FLUSH", #$FF
    db #$28, "SHINE TO PB", #$FF
    db #$28, "ELEVATOR CF", #$FF
    db #$28, " BOTWOON CF", #$FF
    db #$28, "  DOOR SKIP", #$FF
    db #$28, " SNAIL CLIP", #$FF
    db #$28, "3J BABYSKIP", #$FF
    db #$28, "   KIHUNTER", #$FF
    db #$28, "KRAID RADAR", #$FF
    db #$FF
    .routine
        LDA #$0001 : STA !sram_display_mode
        RTS

print pc, " superhud menu end"
ih_superhud:
    %cm_submenu("Configure Super HUD", #SuperHUDMenu)

SuperHUDMenu:
    dw #ih_superhud_bottom_selector
    dw #ih_superhud_bottom_submenu
    dw #$FFFF
    dw #ih_superhud_middle_selector
    dw #ih_superhud_middle_submenu
    dw #$FFFF
    dw #ih_superhud_top_selector
    dw #ih_superhud_top_submenu
    dw #$FFFF
    dw #ih_superhud_enable
    dw #$0000
    %cm_header("CONFIGURE SUPER HUD")

ih_superhud_bottom_selector:
    dw !ACTION_CHOICE
    dl #!sram_superhud_bottom
    dw #$0000
    db #$28, "Current Bottom", #$FF
    db #$28, "   ENEMY HP", #$FF
    db #$28, "     CHARGE", #$FF
    db #$28, "   X FACTOR", #$FF
    db #$28, "   COOLDOWN", #$FF
    db #$28, " SHINESPARK", #$FF
    db #$28, "   I FRAMES", #$FF
    db #$28, "  SPIKESUIT", #$FF
    db #$28, " X POSITION", #$FF
    db #$28, " Y POSITION", #$FF
    db #$28, "HORIZ SPEED", #$FF
    db #$28, " QUICK DROP", #$FF
    db #$28, "  WALL JUMP", #$FF
    db #$28, " SHOT TIMER", #$FF
    db #$28, "DMG COUNTER", #$FF
    db #$28, "RIDLEY GRAB", #$FF
    db #$28, "  RAM WATCH", #$FF
    db #$28, "   MOAT CWJ", #$FF
    db #$28, "GATE GLITCH", #$FF
    db #$28, "  TACO TANK", #$FF
    db #$28, "ROBOT FLUSH", #$FF
    db #$28, "ELEVATOR CF", #$FF
    db #$28, " BOTWOON CF", #$FF
    db #$28, "  DOOR SKIP", #$FF
    db #$FF

ih_superhud_bottom_submenu:
        %cm_submenu("Bottom HUD List", #SuperHUDBottomMenu)

SuperHUDBottomMenu:
    dw ih_superhud_enemyhp
    dw ih_superhud_chargetimer
    dw ih_superhud_xfactor
    dw ih_superhud_cooldowncounter
    dw ih_superhud_shinetimer
    dw ih_superhud_iframecounter
    dw ih_superhud_spikesuit
    dw ih_superhud_xpos
    dw ih_superhud_ypos
    dw ih_superhud_hspeed
    dw ih_superhud_quickdrop
    dw ih_superhud_walljump
    dw ih_superhud_shottimer
    dw ih_superhud_countdamage
    dw ih_superhud_ridleygrab
    dw ih_superhud_ramwatch
    dw ih_superhud_moatcwj
    dw ih_superhud_gateglitch
    dw ih_superhud_tacotank
    dw ih_superhud_robotflush
    dw ih_superhud_elevatorcf
    dw ih_superhud_botwooncf
    dw ih_superhud_doorskip
    dw #$0000
    %cm_header("SUPERHUD MODE")

ih_superhud_enemyhp:
    %cm_jsr("Enemy HP", #action_select_superhud_bottom, #$0000)

ih_superhud_chargetimer:
    %cm_jsr("Charge Timer", #action_select_superhud_bottom, #$0001)

ih_superhud_xfactor:
    %cm_jsr("X-Factor Timer", #action_select_superhud_bottom, #$0002)

ih_superhud_cooldowncounter:
    %cm_jsr("Cooldown Timer", #action_select_superhud_bottom, #$0003)

ih_superhud_shinetimer:
    %cm_jsr("Shinespark Timer", #action_select_superhud_bottom, #$0004)

ih_superhud_iframecounter:
    %cm_jsr("I-Frame Counter", #action_select_superhud_bottom, #$0005)

ih_superhud_spikesuit:
    %cm_jsr("Spikesuit Trainer", #action_select_superhud_bottom, #$0006)

ih_superhud_xpos:
    %cm_jsr("X Position", #action_select_superhud_bottom, #$0007)

ih_superhud_ypos:
    %cm_jsr("Y Position", #action_select_superhud_bottom, #$0008)

ih_superhud_hspeed:
    %cm_jsr("Horizontal Speed", #action_select_superhud_bottom, #$0009)

ih_superhud_quickdrop:
    %cm_jsr("Quickdrop Trainer", #action_select_superhud_bottom, #$000A)

ih_superhud_walljump:
    %cm_jsr("Walljump Trainer", #action_select_superhud_bottom, #$000B)

ih_superhud_shottimer:
    %cm_jsr("Shot Timer", #action_select_superhud_bottom, #$000C)

ih_superhud_countdamage:
    %cm_jsr("Boss Damage Counter", #action_select_superhud_bottom, #$000D)

ih_superhud_ridleygrab:
    %cm_jsr("Ridley Death Grab Attempts", #action_select_superhud_bottom, #$000E)

ih_superhud_ramwatch:
    %cm_jsr("Custom RAM Watch", #action_select_superhud_bottom, #$000F)

ih_superhud_moatcwj:
    %cm_jsr("Moat CWJ", #action_select_superhud_bottom, #$0010)

ih_superhud_gateglitch:
    %cm_jsr("Gate Glitch", #action_select_superhud_bottom, #$0011)

ih_superhud_tacotank:
    %cm_jsr("Taco Tank", #action_select_superhud_bottom, #$0012)

ih_superhud_robotflush:
    %cm_jsr("Robot Flush", #action_select_superhud_bottom, #$0013)

ih_superhud_elevatorcf:
    %cm_jsr("Elevator Crystal Flash", #action_select_superhud_bottom, #$0014)

ih_superhud_botwooncf:
    %cm_jsr("Botwoon Crystal Flash", #action_select_superhud_bottom, #$0015)

ih_superhud_doorskip:
    %cm_jsr("Parlor Door Skip", #action_select_superhud_bottom, #$0016)

action_select_superhud_bottom:
{
    TYA : STA !sram_superhud_bottom
    JSL cm_previous_menu
    RTS
}

ih_superhud_middle_selector:
    dw !ACTION_CHOICE
    dl #!sram_superhud_middle
    dw #$0000
    db #$28, "Current Middle", #$FF
    db #$28, "        OFF", #$FF
    db #$28, "   X FACTOR", #$FF
    db #$28, " SHINESPARK", #$FF
    db #$28, "   I FRAMES", #$FF
    db #$28, "LAG COUNTER", #$FF
    db #$28, " CPU USAGE%", #$FF
    db #$28, " SHOT TIMER", #$FF
    db #$28, "     CHARGE", #$FF
    db #$28, "       DASH", #$FF
    db #$28, "   COOLDOWN", #$FF
    db #$28, "RIDLEY GRAB", #$FF
    db #$FF

ih_superhud_middle_submenu:
    %cm_submenu("Middle HUD List", #SuperHUDMiddleMenu)

SuperHUDMiddleMenu:
    dw ih_superhud_middle_off
    dw ih_superhud_middle_xfactor
    dw ih_superhud_middle_shinetimer
    dw ih_superhud_middle_iframecounter
    dw ih_superhud_middle_lagcounter
    dw ih_superhud_middle_cpuusage
    dw ih_superhud_middle_shottimer
    dw ih_superhud_middle_chargetimer
    dw ih_superhud_middle_dashcounter
    dw ih_superhud_middle_cooldowncounter
    dw ih_superhud_middle_ridleygrab
    dw #$0000
    %cm_header("MIDDLE DISPLAY MODE")

ih_superhud_middle_off:
    %cm_jsr("Disabled", #action_select_superhud_middle, #$0000)

ih_superhud_middle_xfactor:
    %cm_jsr("X-Factor Timer", #action_select_superhud_middle, #$0001)

ih_superhud_middle_shinetimer:
    %cm_jsr("Shinespark Timer", #action_select_superhud_middle, #$0002)

ih_superhud_middle_iframecounter:
    %cm_jsr("I-Frame Counter", #action_select_superhud_middle, #$0003)

ih_superhud_middle_lagcounter:
    %cm_jsr("Lag Counter", #action_select_superhud_middle, #$0004)

ih_superhud_middle_cpuusage:
    %cm_jsr("CPU Usage", #action_select_superhud_middle, #$0005)

ih_superhud_middle_shottimer:
    %cm_jsr("Shot Timer", #action_select_superhud_middle, #$0006)

ih_superhud_middle_chargetimer:
    %cm_jsr("Charge Timer", #action_select_superhud_middle, #$0007)

ih_superhud_middle_dashcounter:
    %cm_jsr("Dash Counter", #action_select_superhud_middle, #$0008)

ih_superhud_middle_cooldowncounter:
    %cm_jsr("Cooldown Timer", #action_select_superhud_middle, #$0009)

ih_superhud_middle_ridleygrab:
    %cm_jsr("Ridley Death Grab Attempts", #action_select_superhud_middle, #$000A)
    
action_select_superhud_middle:
{
    TYA : STA !sram_superhud_middle
    JSL cm_previous_menu
    RTS
}

ih_superhud_top_selector:
    dw !ACTION_CHOICE
    dl #!sram_superhud_top
    dw #$0000
    db #$28, "Current TopHUD", #$FF
    db #$28, "        OFF", #$FF
    db #$28, "   X FACTOR", #$FF
    db #$28, " SHINESPARK", #$FF
    db #$28, "   I FRAMES", #$FF
    db #$28, "LAG COUNTER", #$FF
    db #$28, " CPU USAGE%", #$FF
    db #$28, " SHOT TIMER", #$FF
    db #$28, "     CHARGE", #$FF
    db #$28, "       DASH", #$FF
    db #$28, "   COOLDOWN", #$FF
    db #$28, "RIDLEY GRAB", #$FF
    db #$FF

ih_superhud_top_submenu:
    %cm_submenu("Top HUD List", #SuperHUDTopMenu)

SuperHUDTopMenu:
    dw ih_superhud_top_off
    dw ih_superhud_top_xfactor
    dw ih_superhud_top_shinetimer
    dw ih_superhud_top_iframecounter
    dw ih_superhud_top_lagcounter
    dw ih_superhud_top_cpuusage
    dw ih_superhud_top_shottimer
    dw ih_superhud_top_chargetimer
    dw ih_superhud_top_dashcounter
    dw ih_superhud_top_cooldowncounter
    dw ih_superhud_top_ridleygrab
    dw #$0000
    %cm_header("TOP DISPLAY MODE")

ih_superhud_top_off:
    %cm_jsr("Disabled", #action_select_superhud_top, #$0000)

ih_superhud_top_xfactor:
    %cm_jsr("X-Factor Timer", #action_select_superhud_top, #$0001)

ih_superhud_top_shinetimer:
    %cm_jsr("Shinespark Timer", #action_select_superhud_top, #$0002)

ih_superhud_top_iframecounter:
    %cm_jsr("I-Frame Counter", #action_select_superhud_top, #$0003)

ih_superhud_top_lagcounter:
    %cm_jsr("Lag Counter", #action_select_superhud_top, #$0004)

ih_superhud_top_cpuusage:
    %cm_jsr("CPU Usage", #action_select_superhud_top, #$0005)

ih_superhud_top_shottimer:
    %cm_jsr("Shot Timer", #action_select_superhud_top, #$0006)

ih_superhud_top_chargetimer:
    %cm_jsr("Charge Timer", #action_select_superhud_top, #$0007)

ih_superhud_top_dashcounter:
    %cm_jsr("Dash Counter", #action_select_superhud_top, #$0008)

ih_superhud_top_cooldowncounter:
    %cm_jsr("Cooldown Timer", #action_select_superhud_top, #$0009)

ih_superhud_top_ridleygrab:
    %cm_jsr("Ridley Death Grab Attempts", #action_select_superhud_top, #$000A)

ih_superhud_enable:
    %cm_jsr("Enable Super HUD", .routine, #$0001)
  .routine
    TYA : STA !sram_display_mode
    DEC : STA !sram_room_strat
    %sfxconfirm()
    RTS
    
action_select_superhud_top:
{
    TYA : STA !sram_superhud_top
    JSL cm_previous_menu
    RTS
}
print pc, " superhud menu end"

ih_ram_watch:
    %cm_jsr("Customize RAM Watch", #ih_prepare_ram_watch_menu, #RAMWatchMenu)

print pc, " ramwatchmenu.asm start"
incsrc ramwatchmenu.asm
print pc, " ramwatchmenu.asm end"

ih_room_counter:
    dw !ACTION_CHOICE
    dl #!sram_frame_counter_mode
    dw #$0000
    db #$28, "Frame Counters", #$FF
    db #$28, "   REALTIME", #$FF
    db #$28, "     INGAME", #$FF
    db #$FF

ih_lag_counter:
    dw !ACTION_CHOICE
    dl #!sram_lag_counter_mode
    dw #$0000
    db #$28, "Transition Lag", #$FF
    db #$28, "       DOOR", #$FF
    db #$28, "       FULL", #$FF
    db #$FF

ih_status_icons:
    %cm_toggle("Status Icons", !sram_status_icons, #$0001, #.routine)
  .routine
    LDA !IH_BLANK
    STA $7EC654 : STA $7EC656 : STA $7EC658
    RTS

ih_lag:
    %cm_numfield("Artificial Lag", !sram_artificial_lag, 0, 64, 1, 4, #0)

ih_reset_seg_later:
    %cm_jsr("Reset Segment in Next Room", #.routine, #$FFFF)
  .routine
    TYA : STA !ram_reset_segment_later
    %sfxquake()
    RTS

ih_top_HUD_mode:
    dw !ACTION_CHOICE
    dl #!sram_top_display_mode
    dw #$0000
    db #$28, "Top-Left Displa", #$FF
    db #$28, "y    ITEM %", #$FF
    db #$28, "y  RESERVES", #$FF
    db #$28, "y   VANILLA", #$FF
    db #$FF

!TOP_HUD_RESERVES_INDEX = #$0001
!TOP_HUD_VANILLA_INDEX = #$0002


; ----------
; Game menu
; ----------

GameMenu:
    dw #game_alternatetext
    dw #game_moonwalk
    dw #game_iconcancel
    dw #game_goto_controls
    dw #$FFFF
    dw #game_fanfare_toggle
    dw #game_music_toggle
    dw #game_healthalarm
    dw #$FFFF
    dw #game_debugmode
    dw #game_debugbrightness
if !FEATURE_PAL
    dw #game_paldebug
endif
    dw #game_nodamage
    dw #game_debugprojectiles
    dw #game_debugfixscrolloffsets
    dw #$FFFF
    dw #game_minimap
    dw #game_clear_minimap
    dw #$FFFF
    dw #game_cutscenes
    dw #$0000
    %cm_header("GAME OPTIONS")

game_alternatetext:
if !FEATURE_PAL
    %cm_toggle("French Text", $7E09E2, #$0001, #0)
else
    %cm_toggle("Japanese Text", $7E09E2, #$0001, #0)
endif

game_moonwalk:
    %cm_toggle("Moon Walk", $7E09E4, #$0001, #0)

game_iconcancel:
    %cm_toggle("Icon Cancel", $7E09EA, #$0001, #0)

game_goto_controls:
    %cm_submenu("Controller Setting Mode", #ControllerSettingMenu)

game_fanfare_toggle:
    %cm_toggle("Fanfare", !sram_fanfare_toggle, #$0001, #0)

game_music_toggle:
    dw !ACTION_CHOICE
    dl #!sram_music_toggle
    dw .routine
    db #$28, "Music", #$FF
    db #$28, "        OFF", #$FF
    db #$28, "         ON", #$FF
    db #$28, "   FAST OFF", #$FF
    db #$28, " PRESET OFF", #$FF
    db #$FF
  .routine
    ; Clear music queue
    STZ $0629 : STZ $062B : STZ $062D : STZ $062F
    STZ $0631 : STZ $0633 : STZ $0635 : STZ $0637
    STZ $0639 : STZ $063B : STZ $063D : STZ $063F
    CMP #$0001 : BEQ .resume_music
    STZ $2140
    RTS
  .resume_music
    LDA !MUSIC_DATA : CLC : ADC #$FF00 : PHA : STZ !MUSIC_DATA : PLA : JSL !MUSIC_ROUTINE
    LDA !MUSIC_TRACK : PHA : STZ !MUSIC_TRACK : PLA : JSL !MUSIC_ROUTINE
    RTS

game_healthalarm:
    dw !ACTION_CHOICE
    dl #!sram_healthalarm
    dw #$0000
    db #$28, "Low Health Alar", #$FF
    db #$28, "m     NEVER", #$FF
    db #$28, "m   VANILLA", #$FF
    db #$28, "m    PB FIX", #$FF
    db #$28, "m  IMPROVED", #$FF
    db #$FF

game_debugmode:
    %cm_toggle("Debug Mode", $7E05D1, #$0001, #0)

game_debugbrightness:
    %cm_toggle("Debug CPU Brightness", $7E0DF4, #$0001, #0)

if !FEATURE_PAL
game_paldebug:
    %cm_toggle_inverted("PAL Debug Movement", $7E09E6, #$0001, #0)
endif

game_nodamage:
    %cm_toggle_inverted("Disable Samus Damage", !ram_nodamage, #$0001, #0)

game_debugprojectiles:
    %cm_toggle_bit("Enable Projectiles", $7E198D, #$8000, #0)

game_debugfixscrolloffsets:
    %cm_toggle_bit("Fix Scroll Offsets", !ram_fix_scroll_offsets, #$0001, #0)

game_minimap:
    %cm_toggle("Minimap", !ram_minimap, #$0001, #0)

game_clear_minimap:
    %cm_jsr("Clear Minimap", .clear_minimap, #$0000)

  .clear_minimap
    LDA #$0000 : STA !ram_map_counter : STA $7E0789
    STA $7ED908 : STA $7ED90A : STA $7ED90C : STA $7ED90E
    LDX #$00FE
  .clear_minimap_loop
    STA $7ECD52,X : STA $7ECE52,X
    STA $7ECF52,X : STA $7ED052,X
    STA $7ED152,X : STA $7ED252,X
    STA $7ED352,X : STA $7ED452,X
    STA $7ED91C,X : STA $7EDA1C,X
    STA $7EDB1C,X : STA $7EDC1C,X
    STA $7EDD1C,X : STA $7E07F7,X
    DEX : DEX : BPL .clear_minimap_loop
    %sfxquake()
    RTS

game_cutscenes:
    %cm_submenu("Cutscenes", #CutscenesMenu)

GameLoopExtras:
{
    LDA !ram_magic_pants_enabled : BNE .enabled
    LDA !ram_metronome : BNE .enabled
    LDA !ram_infinite_ammo : BNE .enabled
    LDA #$0000 : STA !ram_game_loop_extras
    RTS
  .enabled
    LDA #$0001 : STA !ram_game_loop_extras
    RTS
}

GameLoopExtras_long:
{
    JSR GameLoopExtras
    RTL
}


; ---------------
; Cutscenes menu
; ---------------

CutscenesMenu:
    dw #cutscenes_skip_intro
    dw #cutscenes_skip_ceres_arrival
    dw #$FFFF
    dw #kraid_skip_intro
    dw #phan_skip_intro
    dw #$FFFF
    dw #cutscenes_g4_skip
    dw #cutscenes_fast_mb
    dw #$0000
    %cm_header("CUTSCENES")

!CUTSCENE_SKIP_INTRO = #$0001
cutscenes_skip_intro:
    %cm_toggle_bit("Skip Intro", !sram_cutscenes, !CUTSCENE_SKIP_INTRO, #0)

!CUTSCENE_SKIP_CERES_ARRIVAL = #$0002
cutscenes_skip_ceres_arrival:
    %cm_toggle_bit("Skip Ceres Arrival", !sram_cutscenes, !CUTSCENE_SKIP_CERES_ARRIVAL, #0)

kraid_skip_intro:
    %cm_toggle("Skip Kraid Intro", !sram_kraid_intro, #$0001, #0)

!CUTSCENE_SKIP_G4 = #$0080
cutscenes_g4_skip:
    %cm_toggle_bit("Skip G4", !sram_cutscenes, !CUTSCENE_SKIP_G4, #0)

!CUTSCENE_FAST_MB = #$0100
cutscenes_fast_mb:
    %cm_toggle_bit("Fast Mother Brain", !sram_cutscenes, !CUTSCENE_FAST_MB, #0)


; -------------------
; Controller Settings
; -------------------

ControllerSettingMenu:
    dw #controls_common_layouts
    dw #controls_save_to_file
    dw #$FFFF
    dw #controls_shot
    dw #controls_jump
    dw #controls_dash
    dw #controls_item_select
    dw #controls_item_cancel
    dw #controls_angle_up
    dw #controls_angle_down
    dw #$0000
    %cm_header("CONTROLLER SETTING MODE")

controls_common_layouts:
    %cm_submenu("Common Controller Layouts", #ControllerCommonMenu)

controls_shot:
    %cm_ctrl_input("        SHOT", !IH_INPUT_SHOT, action_submenu, #AssignControlsMenu)

controls_jump:
    %cm_ctrl_input("        JUMP", !IH_INPUT_JUMP, action_submenu, #AssignControlsMenu)

controls_dash:
    %cm_ctrl_input("        DASH", !IH_INPUT_RUN, action_submenu, #AssignControlsMenu)

controls_item_select:
    %cm_ctrl_input(" ITEM SELECT", !IH_INPUT_ITEM_SELECT, action_submenu, #AssignControlsMenu)

controls_item_cancel:
    %cm_ctrl_input(" ITEM CANCEL", !IH_INPUT_ITEM_CANCEL, action_submenu, #AssignControlsMenu)

controls_angle_up:
    %cm_ctrl_input("    ANGLE UP", !IH_INPUT_ANGLE_UP, action_submenu, #AssignAngleControlsMenu)

controls_angle_down:
    %cm_ctrl_input("  ANGLE DOWN", !IH_INPUT_ANGLE_DOWN, action_submenu, #AssignAngleControlsMenu)

controls_save_to_file:
    %cm_jsr("Save to File", .routine, #0)
  .routine
    LDA $0998 : CMP #$0002 : BEQ .fail
    LDA $0952 : BEQ .fileA
    CMP #$0001 : BEQ .fileB
    CMP #$0002 : BEQ .fileC

  .fail
    %sfxgrapple()
    RTS

  .fileA
    LDX #$0020 : BRA .save

  .fileB
    LDX #$067C : BRA .save

  .fileC
    LDX #$0CD8

  .save
    LDA $09B2 : STA $F00000,X : INX #2
    LDA $09B4 : STA $F00000,X : INX #2
    LDA $09B6 : STA $F00000,X : INX #2
    LDA $09B8 : STA $F00000,X : INX #2
    LDA $09BA : STA $F00000,X : INX #2
    LDA $09BC : STA $F00000,X : INX #2
    LDA $09BE : STA $F00000,X
    %sfxsave()
    RTS

AssignControlsMenu:
    dw controls_assign_A
    dw controls_assign_B
    dw controls_assign_X
    dw controls_assign_Y
    dw controls_assign_Select
    dw controls_assign_L
    dw controls_assign_R
    dw #$0000
    %cm_header("ASSIGN AN INPUT")

controls_assign_A:
    %cm_jsr("A", action_assign_input, !CTRL_A)

controls_assign_B:
    %cm_jsr("B", action_assign_input, !CTRL_B)

controls_assign_X:
    %cm_jsr("X", action_assign_input, !CTRL_X)

controls_assign_Y:
    %cm_jsr("Y", action_assign_input, !CTRL_Y)

controls_assign_Select:
    %cm_jsr("Select", action_assign_input, !CTRL_SELECT)

controls_assign_L:
    %cm_jsr("L", action_assign_input, !CTRL_L)

controls_assign_R:
    %cm_jsr("R", action_assign_input, !CTRL_R)

AssignAngleControlsMenu:
    dw #controls_assign_L
    dw #controls_assign_R
    dw #$0000
    %cm_header("ASSIGN AN INPUT")
    %cm_footer("ONLY L OR R ALLOWED")

action_assign_input:
{
    LDA !ram_cm_ctrl_assign : STA $C2 : TAX  ; input address in $C2 and X
    LDA $7E0000,X : STA !ram_cm_ctrl_swap    ; save old input for later
    TYA : STA $7E0000,X                      ; store new input
    STY $C4                                  ; saved new input for later

    JSL check_duplicate_inputs

    ; determine which sfx to play
    INC : BEQ .undetected
    %sfxstatue()
    BRA +

  .undetected
    %sfxgoback()

+   JSL cm_previous_menu
    RTS
}

ControllerCommonMenu:
    dw #controls_common_default
    dw #controls_common_d2
    dw #controls_common_d3
    dw #controls_common_d4
    dw #controls_common_d5
    dw #$0000
    %cm_header("COMMON CONTROLLER LAYOUTS")
    %cm_footer("CONTROLS.SPAZER.LINK")

controls_common_default:
    %cm_jsr("Default (D1)", #action_set_common_controls, #$0000)

controls_common_d2:
    %cm_jsr("Select+Cancel Swap (D2)", #action_set_common_controls, #$000E)

controls_common_d3:
    %cm_jsr("D2 + Shot+Select Swap (D3)", #action_set_common_controls, #$001C)

controls_common_d4:
    %cm_jsr("MMX Style (D4)", #action_set_common_controls, #$002A)

controls_common_d5:
    %cm_jsr("SMW Style (D5)", #action_set_common_controls, #$0038)

action_set_common_controls:
{
    TYX
    LDA.l ControllerLayoutTable,X : STA !IH_INPUT_SHOT
    LDA.l ControllerLayoutTable+2,X : STA !IH_INPUT_JUMP
    LDA.l ControllerLayoutTable+4,X : STA !IH_INPUT_RUN
    LDA.l ControllerLayoutTable+6,X : STA !IH_INPUT_ITEM_CANCEL
    LDA.l ControllerLayoutTable+8,X : STA !IH_INPUT_ITEM_SELECT
    LDA.l ControllerLayoutTable+10,X : STA !IH_INPUT_ANGLE_UP
    LDA.l ControllerLayoutTable+12,X : STA !IH_INPUT_ANGLE_DOWN
    %sfxconfirm()
    JSL cm_previous_menu
    RTS
}


; ----------
; RNG menu
; ----------

RngMenu:
if !FEATURE_SD2SNES
    dw #rng_rerandomize
    dw #$FFFF
endif
    dw #rng_goto_phanmenu
    dw #$FFFF
    dw #rng_botwoon_rng
    dw #$FFFF
    dw #rng_draygon_rng_right
    dw #rng_draygon_rng_left
    dw #$FFFF
    dw #rng_crocomire_rng
    dw #$FFFF
    dw #rng_kraid_rng
    dw #$0000
    %cm_header("BOSS RNG CONTROL")

rng_rerandomize:
    %cm_toggle("Rerandomize", !sram_rerandomize, #$0001, #0)

rng_goto_phanmenu:
    %cm_jsr("Phantoon", ih_prepare_phantoon_menu, #PhantoonMenu)

ih_prepare_phantoon_menu:
{
    LDA !ram_phantoon_rng_inverted : PHA
    JSR phan_set_phan_first_phase
    JSR phan_set_phan_second_phase
    PLA : STA !ram_phantoon_rng_inverted
    JMP action_submenu
}

PhantoonMenu:
    dw #phan_first_phase
    dw #phan_fast_left_1
    dw #phan_mid_left_1
    dw #phan_slow_left_1
    dw #phan_fast_right_1
    dw #phan_mid_right_1
    dw #phan_slow_right_1
    dw #$FFFF
    dw #phan_second_phase
    dw #phan_fast_left_2
    dw #phan_mid_left_2
    dw #phan_slow_left_2
    dw #phan_fast_right_2
    dw #phan_mid_right_2
    dw #phan_slow_right_2
    dw #phan_second_phase_inverted
    dw #$FFFF
    dw #phan_eyeclose
    dw #$FFFF
    dw #phan_flamepattern
    dw #phan_next_flamepattern
    dw #$0000
    %cm_header("PHANTOON RNG CONTROL")

phan_first_phase:
    dw !ACTION_CHOICE
    dl #!ram_cm_phan_first_phase
    dw .routine
    db #$28, "Phan 1st Phase", #$FF
    db #$28, "     RANDOM", #$FF
    db #$28, "  FAST LEFT", #$FF
    db #$28, "   MID LEFT", #$FF
    db #$28, "  SLOW LEFT", #$FF
    db #$28, " FAST RIGHT", #$FF
    db #$28, "  MID RIGHT", #$FF
    db #$28, " SLOW RIGHT", #$FF
    db #$28, "       FAST", #$FF
    db #$28, "        MID", #$FF
    db #$28, "       SLOW", #$FF
    db #$28, "       LEFT", #$FF
    db #$28, "      RIGHT", #$FF
    db #$28, "     CUSTOM", #$FF
    db #$FF
  .routine
    ASL : TAX
    LDA PhantoonPhaseTable,X : STA !ram_phantoon_rng_round_1
    RTS

phan_second_phase:
    dw !ACTION_CHOICE
    dl #!ram_cm_phan_second_phase
    dw .routine
    db #$28, "Phan 2nd Phase", #$FF
    db #$28, "     RANDOM", #$FF
    db #$28, "  FAST LEFT", #$FF
    db #$28, "   MID LEFT", #$FF
    db #$28, "  SLOW LEFT", #$FF
    db #$28, " FAST RIGHT", #$FF
    db #$28, "  MID RIGHT", #$FF
    db #$28, " SLOW RIGHT", #$FF
    db #$28, "       FAST", #$FF
    db #$28, "        MID", #$FF
    db #$28, "       SLOW", #$FF
    db #$28, "       LEFT", #$FF
    db #$28, "      RIGHT", #$FF
    db #$28, "     CUSTOM", #$FF
    db #$FF
  .routine
    ASL : TAX
    LDA PhantoonPhaseTable,X : STA !ram_phantoon_rng_round_2 : BEQ +
    TXA : BEQ +
    LDA #$0002
+   STA !ram_phantoon_rng_inverted
    RTS

PhantoonPhaseTable:
    dw #$003F, #$0020, #$0008, #$0002, #$0010, #$0004, #$0001
    dw #$0030, #$000C, #$0003, #$002A, #$0015, #$0000 ; 0 = Term

phan_set_phan_first_phase:
{
    LDX #$0000
    LDA !ram_phantoon_rng_round_1 : BEQ +

-   CMP PhantoonPhaseTable,X : BEQ +
    INX : INX : CPX #$0018 : BNE -

+   TXA : LSR : STA !ram_cm_phan_first_phase
    RTS
}

phan_set_phan_second_phase:
{
    LDX #$0000
    LDA !ram_phantoon_rng_round_2 : BEQ +

-   CMP PhantoonPhaseTable,X : BEQ +
    INX : INX : CPX #$0018 : BNE -

+   TXA : LSR : STA !ram_cm_phan_second_phase
    BEQ +
    TXA : BEQ +
    LDA #$0002
+   STA !ram_phantoon_rng_inverted
    RTS
}

phan_fast_left_1:
    %cm_toggle_bit("#1 Fast Left", !ram_phantoon_rng_round_1, #$0020, phan_set_phan_first_phase)

phan_mid_left_1:
    %cm_toggle_bit("#1 Mid  Left", !ram_phantoon_rng_round_1, #$0008, phan_set_phan_first_phase)

phan_slow_left_1:
    %cm_toggle_bit("#1 Slow Left", !ram_phantoon_rng_round_1, #$0002, phan_set_phan_first_phase)

phan_fast_right_1:
    %cm_toggle_bit("#1 Fast Right", !ram_phantoon_rng_round_1, #$0010, phan_set_phan_first_phase)

phan_mid_right_1:
    %cm_toggle_bit("#1 Mid  Right", !ram_phantoon_rng_round_1, #$0004, phan_set_phan_first_phase)

phan_slow_right_1:
    %cm_toggle_bit("#1 Slow Right", !ram_phantoon_rng_round_1, #$0001, phan_set_phan_first_phase)

phan_fast_left_2:
    %cm_toggle_bit("#2 Fast Left", !ram_phantoon_rng_round_2, #$0020, phan_set_phan_second_phase)

phan_mid_left_2:
    %cm_toggle_bit("#2 Mid  Left", !ram_phantoon_rng_round_2, #$0008, phan_set_phan_second_phase)

phan_slow_left_2:
    %cm_toggle_bit("#2 Slow Left", !ram_phantoon_rng_round_2, #$0002, phan_set_phan_second_phase)

phan_fast_right_2:
    %cm_toggle_bit("#2 Fast Right", !ram_phantoon_rng_round_2, #$0010, phan_set_phan_second_phase)

phan_mid_right_2:
    %cm_toggle_bit("#2 Mid  Right", !ram_phantoon_rng_round_2, #$0004, phan_set_phan_second_phase)

phan_slow_right_2:
    %cm_toggle_bit("#2 Slow Right", !ram_phantoon_rng_round_2, #$0001, phan_set_phan_second_phase)

phan_second_phase_inverted:
    dw !ACTION_CHOICE
    dl #!ram_phantoon_rng_inverted
    dw #$0000
    db #$28, "2nd Phase Inver", #$FF
    db #$28, "t   VANILLA", #$FF
    db #$28, "t        ON", #$FF
    db #$28, "t       OFF", #$FF
    db #$28, "t    RANDOM", #$FF
    db #$FF

phan_eyeclose:
    dw !ACTION_CHOICE
    dl #!ram_phantoon_rng_eyeclose
    dw #$0000
    db #$28, "Phan Eye Close", #$FF
    db #$28, "     RANDOM", #$FF
    db #$28, "       SLOW", #$FF
    db #$28, "        MID", #$FF
    db #$28, "       FAST", #$FF
    db #$FF

phan_flamepattern:
    dw !ACTION_CHOICE
    dl #!ram_phantoon_rng_flames
    dw #$0000
    db #$28, "Phantoon Flames", #$FF
    db #$28, "     RANDOM", #$FF
    db #$28, "      22222", #$FF
    db #$28, "        111", #$FF
    db #$28, "    3333333", #$FF
    db #$28, "    1424212", #$FF
    db #$FF

phan_next_flamepattern:
    dw !ACTION_CHOICE
    dl #!ram_phantoon_rng_next_flames
    dw #$0000
    db #$28, "Next Flames", #$FF
    db #$28, "     RANDOM", #$FF
    db #$28, "      22222", #$FF
    db #$28, "        111", #$FF
    db #$28, "    3333333", #$FF
    db #$28, "    1424212", #$FF
    db #$FF

phan_skip_intro:
    %cm_toggle_bit("Skip Phantoon Intro", !sram_phantoon_intro, #$0001, 0)

rng_botwoon_rng:
    dw !ACTION_CHOICE
    dl #!ram_cm_botwoon_rng
    dw #.routine
    db #$28, "Botwoon RNG", #$FF
    db #$28, "     RANDOM", #$FF
    db #$28, "       DOWN", #$FF
    db #$28, "         UP", #$FF
    db #$28, "      RIGHT", #$FF
    db #$28, "       LEFT", #$FF
    db #$FF
  .routine
    LDA !ram_cm_botwoon_rng : BEQ +
    DEC : ASL #3 : INC
+   STA !ram_botwoon_rng
    RTS

rng_draygon_rng_right:
    dw !ACTION_CHOICE
    dl #!ram_draygon_rng_right
    dw #$0000
    db #$28, "Draygon from Ri", #$FF
    db #$28, "ght  RANDOM", #$FF
    db #$28, "ght    GOOP", #$FF
    db #$28, "ght   SWOOP", #$FF
    db #$FF

rng_draygon_rng_left:
    dw !ACTION_CHOICE
    dl #!ram_draygon_rng_left
    dw #$0000
    db #$28, "Draygon from Le", #$FF
    db #$28, "ft   RANDOM", #$FF
    db #$28, "ft     GOOP", #$FF
    db #$28, "ft    SWOOP", #$FF
    db #$FF

rng_crocomire_rng:
    dw !ACTION_CHOICE
    dl #!ram_crocomire_rng
    dw #$0000
    db #$28, "Crocomire RNG", #$FF
    db #$28, "     RANDOM", #$FF
    db #$28, "       STEP", #$FF
    db #$28, "      SWIPE", #$FF
    db #$FF

rng_kraid_rng:
    dw !ACTION_CHOICE
    dl #!ram_kraid_rng
    dw #$0000
    db #$28, "Kraid Claw RNG", #$FF
    db #$28, "     RANDOM", #$FF
    db #$28, "      LAGGY", #$FF
    db #$28, "    LAGGIER", #$FF
    db #$FF


; ----------
; Ctrl Menu
; ----------

CtrlMenu:
    dw #ctrl_menu
if !FEATURE_SD2SNES
    dw #ctrl_save_state
    dw #ctrl_load_state
endif
    dw #ctrl_load_last_preset
    dw #ctrl_random_preset
    dw #ctrl_save_custom_preset
    dw #ctrl_load_custom_preset
    dw #ctrl_inc_custom_preset
    dw #ctrl_dec_custom_preset
    dw #ctrl_reset_segment_timer
    dw #ctrl_reset_segment_later
    dw #ctrl_full_equipment
    dw #ctrl_kill_enemies
    dw #ctrl_toggle_tileviewer
    dw #ctrl_reveal_damage
    dw #ctrl_force_stand
if !FEATURE_SD2SNES
else
    dw #ctrl_randomize_rng
endif
    dw #ctrl_update_timers
    dw #$FFFF
    dw #ctrl_clear_shortcuts
    dw #ctrl_reset_defaults
    dw #$0000
    %cm_header("CONTROLLER SHORTCUTS")
    %cm_footer("PRESS AND HOLD FOR 2 SEC")

ctrl_menu:
    %cm_ctrl_shortcut("Main menu", !sram_ctrl_menu)

ctrl_load_last_preset:
    %cm_ctrl_shortcut("Reload Preset", !sram_ctrl_load_last_preset)

ctrl_save_state:
    %cm_ctrl_shortcut("Save State", !sram_ctrl_save_state)

ctrl_load_state:
    %cm_ctrl_shortcut("Load State", !sram_ctrl_load_state)

ctrl_reset_segment_timer:
    %cm_ctrl_shortcut("Reset Seg Timer", !sram_ctrl_reset_segment_timer)

ctrl_reset_segment_later:
    %cm_ctrl_shortcut("Reset Seg Later", !sram_ctrl_reset_segment_later)

ctrl_full_equipment:
    %cm_ctrl_shortcut("Full Equipment", !sram_ctrl_full_equipment)

ctrl_kill_enemies:
    %cm_ctrl_shortcut("Kill Enemies", !sram_ctrl_kill_enemies)

ctrl_reveal_damage:
    %cm_ctrl_shortcut("Toggle Boss Dmg", !sram_ctrl_reveal_damage)

ctrl_random_preset:
    %cm_ctrl_shortcut("Random Preset", !sram_ctrl_random_preset)

ctrl_randomize_rng:
    %cm_ctrl_shortcut("Randomize RNG", !sram_ctrl_randomize_rng)

ctrl_save_custom_preset:
    %cm_ctrl_shortcut("Save Cust Preset", !sram_ctrl_save_custom_preset)

ctrl_load_custom_preset:
    %cm_ctrl_shortcut("Load Cust Preset", !sram_ctrl_load_custom_preset)

ctrl_inc_custom_preset:
    %cm_ctrl_shortcut("Next Preset Slot", !sram_ctrl_inc_custom_preset)

ctrl_dec_custom_preset:
    %cm_ctrl_shortcut("Prev Preset Slot", !sram_ctrl_dec_custom_preset)

ctrl_toggle_tileviewer:
    %cm_ctrl_shortcut("Toggle Tile View", !sram_ctrl_toggle_tileviewer)

ctrl_force_stand:
    %cm_ctrl_shortcut("Force Stand", !sram_ctrl_force_stand)

ctrl_update_timers:
    %cm_ctrl_shortcut("Update Timers", !sram_ctrl_update_timers)

ctrl_clear_shortcuts:
    %cm_jsr("Clear Shortcuts", .routine, #$0000)
  .routine
    TYA
    STA !ram_game_mode_extras
    STA !sram_ctrl_save_state
    STA !sram_ctrl_load_state
    STA !sram_ctrl_load_last_preset
    STA !sram_ctrl_full_equipment
    STA !sram_ctrl_kill_enemies
    STA !sram_ctrl_random_preset
    STA !sram_ctrl_save_custom_preset
    STA !sram_ctrl_load_custom_preset
    STA !sram_ctrl_inc_custom_preset
    STA !sram_ctrl_dec_custom_preset
    STA !sram_ctrl_reset_segment_timer
    STA !sram_ctrl_reset_segment_later
    STA !sram_ctrl_reveal_damage
    STA !sram_ctrl_randomize_rng
    STA !sram_ctrl_toggle_tileviewer
    STA !sram_ctrl_force_stand
    STA !sram_ctrl_update_timers
    ; menu to default, Start + Select
    LDA #$3000 : STA !sram_ctrl_menu
    %sfxquake()
    RTS

ctrl_reset_defaults:
    %cm_jsr("Reset to Defaults", .routine, #$0000)
  .routine
    LDA #$3000 : STA !sram_ctrl_menu                   ; Start + Select
    LDA #$6010 : STA !sram_ctrl_save_state             ; Select + Y + R
    LDA #$6020 : STA !sram_ctrl_load_state             ; Select + Y + L
    LDA #$06F0 : STA !sram_ctrl_load_last_preset       ; Down + Left + L + R + A + X
    LDA #$0000 : STA !sram_ctrl_full_equipment
    LDA #$0000 : STA !sram_ctrl_kill_enemies
    LDA #$0000 : STA !sram_ctrl_reset_segment_timer
    LDA #$0000 : STA !sram_ctrl_reset_segment_later
    LDA #$0000 : STA !sram_ctrl_reveal_damage
    LDA #$C930 : STA !sram_ctrl_random_preset          ; Up + Right + L + R + Y + B
    LDA #$0000 : STA !sram_ctrl_randomize_rng
    LDA #$0000 : STA !sram_ctrl_save_custom_preset
    LDA #$0000 : STA !sram_ctrl_load_custom_preset
    LDA #$0000 : STA !sram_ctrl_inc_custom_preset
    LDA #$0000 : STA !sram_ctrl_dec_custom_preset
    LDA #$0000 : STA !sram_ctrl_toggle_tileviewer
    LDA #$0000 : STA !sram_ctrl_force_stand
    LDA #$0000 : STA !sram_ctrl_update_timers
    %sfxquake()
    RTS

init_wram_based_on_sram:
{
    JSR init_suit_properties_ram
    RTL
}


; ----------
; Firebat Menu   IFBMenu:
; ----------

print pc, " IFBmenu start"
incsrc IFBmenu.asm
print pc, " IFBmenu end"

