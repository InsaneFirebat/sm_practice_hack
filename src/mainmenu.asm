
; ------------
; Menu Helpers
; ------------

action_mainmenu:
{
    ; Set bank of new menu
    LDA !ram_cm_cursor_stack : TAX
    LDA.l MainMenuBanks,X : STA !ram_cm_menu_bank
    STA !DP_MenuIndices+2 : STA !DP_CurrentMenu+2

    ; continue into action_submenu
}

action_submenu:
{
    ; Increment stack pointer by 2, then store current menu
    LDA !ram_cm_stack_index : INC #2 : STA !ram_cm_stack_index : TAX
    TYA : STA !ram_cm_menu_stack,X

    BRA action_submenu_jump
}

action_presets_submenu:
{

    ; Increment stack pointer by 2, then store current menu
    LDA !ram_cm_stack_index : INC #2 : STA !ram_cm_stack_index : TAX
    LDA !sram_preset_category : ASL : TAY

    PHB : PHK : PLB
    LDA.w preset_category_submenus,Y : STA !ram_cm_menu_stack,X
    LDA.w preset_category_banks,Y : STA !ram_cm_menu_bank
    PLB

    ; Continue into action_submenu_jump

action_submenu_jump:
{
    LDA #$0000 : STA !ram_cm_cursor_stack,X

    %sfxconfirm()
    JSL cm_calculate_max
    JSL cm_colors
    JSL cm_draw
    RTL
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
    dw #PresetsMenu100early
    dw #PresetsMenuHundo
    dw #PresetsMenu100map
    dw #PresetsMenu14ice
    dw #PresetsMenu14speed
    dw #PresetsMenuRbo
    dw #PresetsMenuSuitless
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
    dw #PresetsMenu100early>>16
    dw #PresetsMenuHundo>>16
    dw #PresetsMenu100map>>16
    dw #PresetsMenu14ice>>16
    dw #PresetsMenu14speed>>16
    dw #PresetsMenuRbo>>16
    dw #PresetsMenuSuitless>>16
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

; MainMenu must live in the same bank as the core menu code
; From here, submenus can branch off into any bank

MainMenu:
    dw #mm_goto_equipment
    dw #mm_goto_presets
    dw #mm_goto_presets_menu
    dw #mm_goto_teleport
    dw #mm_goto_events
    dw #mm_goto_misc
    dw #mm_goto_sprites
if !FEATURE_VANILLAHUD
else
    dw #mm_goto_infohud
endif
    dw #mm_goto_gamemenu
    dw #mm_goto_rngmenu
if !FEATURE_SD2SNES
    dw #mm_goto_savestate
endif
    dw #mm_goto_timecontrol
    dw #mm_goto_ctrlsmenu
    dw #mm_goto_customize
    dw #mm_goto_IFBmenu
    dw #$0000
if !FEATURE_PAL
    %cm_version_header("PAL INFOHUD")
else
    %cm_version_header("FIREBAT INFOHUD")
endif

MainMenuBanks:
; this list must match the main menu order
    dw #EquipmentMenu>>16
    dw #preset_category_banks>>16 ; dummy
    dw #PresetsMenu>>16
    dw #TeleportMenu>>16
    dw #EventsMenu>>16
    dw #MiscMenu>>16
    dw #SpritesMenu>>16
if !FEATURE_VANILLAHUD
else
    dw #InfoHudMenu>>16
endif
    dw #GameMenu>>16
    dw #RngMenu>>16
if !FEATURE_SD2SNES
    dw #SavestateMenu>>16
endif
    dw #SlowdownMenu>>16
    dw #CtrlMenu>>16
    dw #CustomizeMenu>>16
    dw #IFBMenu>>16

mm_goto_equipment:
    %cm_mainmenu(">Equipment", #EquipmentMenu)

mm_goto_presets:
    %cm_jsl(">Category Presets", #action_presets_submenu, #$0000)

mm_goto_presets_menu:
    %cm_mainmenu(">Presets Menu", #PresetsMenu)

mm_goto_teleport:
    %cm_mainmenu(">Save Stations", #TeleportMenu)

mm_goto_events:
    %cm_mainmenu(">Event Flags", #EventsMenu)

mm_goto_misc:
    %cm_mainmenu(">Misc Options", #MiscMenu)

mm_goto_sprites:
    %cm_mainmenu(">Sprite Features", #SpritesMenu)

mm_goto_infohud:
    %cm_jsl(">InfoHUD", #.routine, #InfoHudMenu)
  .routine
    LDA !sram_top_display_mode : CMP #$0003 : BCC +
    LDA #$0000 : STA !sram_top_display_mode
+   JML action_mainmenu

mm_goto_gamemenu:
    %cm_mainmenu(">Game Options", #GameMenu)

mm_goto_rngmenu:
    %cm_mainmenu(">RNG Control", #RngMenu)

mm_goto_savestate:
    %cm_mainmenu(">Savestate Settings", #SavestateMenu)

mm_goto_timecontrol:
    %cm_mainmenu(">Slowdown Mode", #SlowdownMenu)

mm_goto_ctrlsmenu:
    %cm_mainmenu(">Controller Shortcuts", #CtrlMenu)

mm_goto_customize:
    %cm_mainmenu(">Customize Practice Menu", #CustomizeMenu)

mm_goto_IFBmenu:
    %cm_mainmenu(">Firebat Menu", #IFBMenu)


; -------------
; Presets menu
; -------------

PresetsMenu:
    dw #presets_goto_select_preset_category
    dw #presets_current
    dw #$FFFF
    dw #presets_reload
    dw #presets_random
    dw #$FFFF
    dw #presets_custom_preset_slot
    dw #presets_save_custom_preset
    dw #presets_load_custom_preset
    dw #$FFFF
    dw #presets_open_doors
    dw #presets_enemies
    dw #presets_map_tiles
    dw #presets_auto_segment
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
    %cm_submenu(">Select Preset Category", #SelectPresetCategoryMenu)

presets_reload:
    %cm_jsl("Reload Last Preset", .routine, #$0000)
  .routine
    LDA !sram_last_preset : STA !ram_load_preset
    LDA #$0001 : STA !ram_cm_leave
    RTL

presets_random:
    %cm_jsl("Load Random Preset", .routine, #$0000)
  .routine
    LDA #$0001 : STA !ram_cm_leave
    JML LoadRandomPreset

presets_custom_preset_slot:
    %cm_numfield(">Custom Preset Slot", !sram_custom_preset_slot, 0, !TOTAL_PRESET_SLOTS, 1, 2, #.routine)
  .routine
    ; ignore if not A, X, or Y
    LDA !IH_CONTROLLER_PRI_NEW : BIT #$40C0 : BNE .submenu
    LDA !sram_last_preset : BMI +
    LDA #$0000 : STA !sram_last_preset
+   RTL
  .submenu
    ; undo increment from execute_numfield
    LDA !sram_custom_preset_slot : BEQ .zero
    DEC : BRA +
  .zero
    LDA !TOTAL_PRESET_SLOTS
+   STA !sram_custom_preset_slot
    ; determine which page to load
    CMP #$0010 : BPL .page2
    LDY.w #CustomPresetsMenu : BRA .done
  .page2
    CMP #$0020 : BPL .page3
    LDY.w #CustomPresetsMenu2 : BRA .done
  .page3
    LDY.w #CustomPresetsMenu3
  .done
    %submenu_jump()

presets_save_custom_preset:
    %cm_jsl("Save Custom Preset", .routine, #$0000)
  .routine
    JSL custom_preset_save
    LDA #$0001 : STA !ram_cm_leave
    %sfxconfirm()
    RTL

presets_load_custom_preset:
    %cm_jsl("Load Custom Preset", .routine, #$0000)
  .routine
    ; check if slot is populated first
    LDA !sram_custom_preset_slot
    %presetslotsize()
    LDA !PRESET_SLOTS,X : CMP #$5AFE : BEQ .safe
    %sfxfail()
    RTL

  .safe
    STA !ram_custom_preset
    LDA #$0001 : STA !ram_cm_leave
    RTL

presets_open_doors:
    %cm_toggle("Auto-Open Blue Doors", !sram_preset_open_doors, #$0001, #0)

presets_auto_segment:
    %cm_toggle("Auto Segment Reset", !sram_preset_auto_segment, #$0001, #0)

presets_enemies:
    %cm_toggle("Load with Enemies", !sram_preset_enemies, #$0001, #0)

presets_map_tiles:
    %cm_toggle("Clear Map Tiles", !sram_preset_map_tiles, #$0001, #0)

presets_ship_landing:
    %cm_toggle("Ship Landing Sequence", !sram_preset_ship_landing, #$0001, #0)

if !RAW_TILE_GRAPHICS
!PRESETS_COMPRESSED_GRAPHICS = #$0001
presets_compressed_graphics:
    %cm_toggle_bit("Compressed Graphics", !sram_compressed_graphics, !PRESETS_COMPRESSED_GRAPHICS, #0)

!PRESETS_COMPRESSED_PALETTES = #$0002
presets_compressed_palettes:
    %cm_toggle_bit("Compressed Palettes", !sram_compressed_graphics, !PRESETS_COMPRESSED_PALETTES, #0)

!PRESETS_COMPRESSED_TABLES = #$0004
presets_compressed_tables:
    %cm_toggle_bit("Compressed Tables", !sram_compressed_graphics, !PRESETS_COMPRESSED_TABLES, #0)
endif

if !FEATURE_DEV
presets_random_preset_rng:
    %cm_toggle("Presets in Order", !ram_random_preset_rng, #$0001, #0)
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
    dw #precat_suitless
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
    db #$28, " 100% EARLY", #$FF
    db #$28, "  100% LATE", #$FF
    db #$28, "   100% MAP", #$FF
    db #$28, "    14% ICE", #$FF
    db #$28, "  14% SPEED", #$FF
    db #$28, "        RBO", #$FF
    db #$28, " 98SUITLESS", #$FF
    db #$28, " NG+ PLASMA", #$FF
    db #$28, "  NG+ HYPER", #$FF
    db #$28, " NIN POWER%", #$FF
    db #$28, "  BOSS KPDR", #$FF
    db #$28, "  BOSS PKDR", #$FF
    db #$28, "  BOSS PRKD", #$FF
    db #$FF
  .routine
    LDA #$0000 : STA !sram_last_preset
    RTL

precat_kpdr21:
    %cm_jsl("Any% KPDR 3 E-Tanks", #action_select_preset_category, #$0000)

precat_kpdr22:
    %cm_jsl("Any% KPDR 4 E-Tanks", #action_select_preset_category, #$0001)

precat_prkd15:
    %cm_jsl("Any% PRKD 15 Missiles", #action_select_preset_category, #$0002)

precat_prkd:
    %cm_jsl("Any% PRKD 20 Missiles", #action_select_preset_category, #$0003)

precat_pkrd:
    %cm_jsl("Any% PKRD", #action_select_preset_category, #$0004)

precat_spazer:
    %cm_jsl("Spazer Any%", #action_select_preset_category, #$0005)

precat_kpdr25:
    %cm_jsl("Any% KPDR Early Ice", #action_select_preset_category, #$0006)

precat_gtclassic:
    %cm_jsl("GT Classic", #action_select_preset_category, #$0007)

precat_gtmax:
    %cm_jsl("GT Max%", #action_select_preset_category, #$0008)

precat_100early:
    %cm_jsl("100% Early Crocomire", #action_select_preset_category, #$0009)

precat_hundo:
    %cm_jsl("100% Late Crocomire", #action_select_preset_category, #$000A)

precat_100map:
    %cm_jsl("100% Map Completion", #action_select_preset_category, #$000B)

precat_14ice:
    %cm_jsl("14% Ice", #action_select_preset_category, #$000C)

precat_14speed:
    %cm_jsl("14% Speed", #action_select_preset_category, #$000D)

precat_rbo:
    %cm_jsl("Reverse Boss Order", #action_select_preset_category, #$000E)

precat_suitless:
    %cm_jsl("Max% Suitless", #action_select_preset_category, #$000F)

precat_ngplasma:
    %cm_jsl("NewGame+ Plasma", #action_select_preset_category, #$0010)

precat_nghyper:
    %cm_jsl("NewGame+ Hyper", #action_select_preset_category, #$0011)

precat_nintendopower:
    %cm_jsl("Nintendo Power%", #action_select_preset_category, #$0012)

precat_allbosskpdr:
    %cm_jsl("All Bosses KPDR", #action_select_preset_category, #$0013)

precat_allbosspkdr:
    %cm_jsl("All Bosses PKDR", #action_select_preset_category, #$0014)

precat_allbossprkd:
    %cm_jsl("All Bosses PRKD", #action_select_preset_category, #$0015)

action_select_preset_category:
{
    ; category index in Y
    TYA : STA !sram_preset_category
    ; clear stale preset
    LDA #$0000 : STA !sram_last_preset
    JML cm_previous_menu
}

action_load_preset:
{
    TYA : STA !ram_load_preset
    LDA #$0001 : STA !ram_cm_leave
    RTL
}


; -------------------
; Custom Preset Slots
; -------------------

CustomPresetsMenu:
    dw #custompreset_00
    dw #custompreset_01
    dw #custompreset_02
    dw #custompreset_03
    dw #custompreset_04
    dw #custompreset_05
    dw #custompreset_06
    dw #custompreset_07
    dw #custompreset_08
    dw #custompreset_09
    dw #custompreset_10
    dw #custompreset_11
    dw #custompreset_12
    dw #custompreset_13
    dw #custompreset_14
    dw #custompreset_15
if !FEATURE_TINYSTATES
; Tinystates only has slots $00-15
else
    dw #$FFFF
    dw #custompreset_manage
    dw #custompreset_goto_page2
    dw #custompreset_goto_page3
endif
    dw #$0000
    %cm_header("PRESS X TO NAME PRESETS")
    %cm_footer("PRESS Y TO TOGGLE DISPLAY")

CustomPresetsMenu2:
    dw #custompreset_16
    dw #custompreset_17
    dw #custompreset_18
    dw #custompreset_19
    dw #custompreset_20
    dw #custompreset_21
    dw #custompreset_22
    dw #custompreset_23
    dw #custompreset_24
    dw #custompreset_25
    dw #custompreset_26
    dw #custompreset_27
    dw #custompreset_28
    dw #custompreset_29
    dw #custompreset_30
    dw #custompreset_31
    dw #$FFFF
    dw #custompreset_manage
    dw #custompreset_goto_page1
    dw #custompreset_goto_page3
    dw #$0000
    %cm_header("PRESS X TO NAME PRESETS")
    %cm_footer("PRESS Y TO TOGGLE DISPLAY")

CustomPresetsMenu3:
    dw #custompreset_32
    dw #custompreset_33
    dw #custompreset_34
    dw #custompreset_35
    dw #custompreset_36
    dw #custompreset_37
    dw #custompreset_38
    dw #custompreset_39
    dw #$FFFF
    dw #$FFFF
    dw #$FFFF
    dw #$FFFF
    dw #$FFFF
    dw #$FFFF
    dw #$FFFF
    dw #$FFFF
    dw #$FFFF
    dw #custompreset_manage
    dw #custompreset_goto_page1
    dw #custompreset_goto_page2
    dw #$0000
    %cm_header("PRESS X TO NAME PRESETS")
    %cm_footer("PRESS Y TO TOGGLE DISPLAY")

    %cm_custompreset(00)
    %cm_custompreset(01)
    %cm_custompreset(02)
    %cm_custompreset(03)
    %cm_custompreset(04)
    %cm_custompreset(05)
    %cm_custompreset(06)
    %cm_custompreset(07)
    %cm_custompreset(08)
    %cm_custompreset(09)
    %cm_custompreset(10)
    %cm_custompreset(11)
    %cm_custompreset(12)
    %cm_custompreset(13)
    %cm_custompreset(14)
    %cm_custompreset(15)
    %cm_custompreset(16)
    %cm_custompreset(17)
    %cm_custompreset(18)
    %cm_custompreset(19)
    %cm_custompreset(20)
    %cm_custompreset(21)
    %cm_custompreset(22)
    %cm_custompreset(23)
    %cm_custompreset(24)
    %cm_custompreset(25)
    %cm_custompreset(26)
    %cm_custompreset(27)
    %cm_custompreset(28)
    %cm_custompreset(29)
    %cm_custompreset(30)
    %cm_custompreset(31)
    %cm_custompreset(32)
    %cm_custompreset(33)
    %cm_custompreset(34)
    %cm_custompreset(35)
    %cm_custompreset(36)
    %cm_custompreset(37)
    %cm_custompreset(38)
    %cm_custompreset(39)

custompreset_manage:
    %cm_jsl("Manage Preset Slots", .routine, #$0000)
  .routine
    LDA #$0000 : STA !ram_cm_manage_slots
if !FEATURE_TINYSTATES
    LDY.w #ManagePresetsMenu
else
    ; determine which page is currently loaded
    LDA !ram_cm_stack_index : DEC #2 : TAX
    ; exit if not in a color menu
    LDA !ram_cm_menu_stack,X : CMP.w #CustomPresetsMenu : BPL .page2
    LDY.w #ManagePresetsMenu : BRA .done
  .page2
    CMP.w #CustomPresetsMenu2 : BPL .page3
    LDY.w #ManagePresetsMenu2 : BRA .done
  .page3
    LDY.w #ManagePresetsMenu3
  .done
endif
    %submenu_jump()

ManagePresetsMenu:
    dw #managepreset_00
    dw #managepreset_01
    dw #managepreset_02
    dw #managepreset_03
    dw #managepreset_04
    dw #managepreset_05
    dw #managepreset_06
    dw #managepreset_07
    dw #managepreset_08
    dw #managepreset_09
    dw #managepreset_10
    dw #managepreset_11
    dw #managepreset_12
    dw #managepreset_13
    dw #managepreset_14
    dw #managepreset_15
if !FEATURE_TINYSTATES
; Tinystates only has slots $00-15
else
    dw #$FFFF
    dw #$FFFF
    dw #managepreset_goto_page2
    dw #managepreset_goto_page3
endif
    dw #$0000
    %cm_header("PRESS A TO SWAP PRESETS")
    %cm_footer("PRESS X TO DELETE PRESET")

ManagePresetsMenu2:
    dw #managepreset_16
    dw #managepreset_17
    dw #managepreset_18
    dw #managepreset_19
    dw #managepreset_20
    dw #managepreset_21
    dw #managepreset_22
    dw #managepreset_23
    dw #managepreset_24
    dw #managepreset_25
    dw #managepreset_26
    dw #managepreset_27
    dw #managepreset_28
    dw #managepreset_29
    dw #managepreset_30
    dw #managepreset_31
    dw #$FFFF
    dw #$FFFF
    dw #managepreset_goto_page1
    dw #managepreset_goto_page3
    dw #$0000
    %cm_header("PRESS A TO SWAP PRESETS")
    %cm_footer("PRESS X TO DELETE PRESET")

ManagePresetsMenu3:
    dw #managepreset_32
    dw #managepreset_33
    dw #managepreset_34
    dw #managepreset_35
    dw #managepreset_36
    dw #managepreset_37
    dw #managepreset_38
    dw #managepreset_39
    dw #$FFFF
    dw #$FFFF
    dw #$FFFF
    dw #$FFFF
    dw #$FFFF
    dw #$FFFF
    dw #$FFFF
    dw #$FFFF
    dw #$FFFF
    dw #$FFFF
    dw #managepreset_goto_page1
    dw #managepreset_goto_page2
    dw #$0000
    %cm_header("PRESS A TO SWAP PRESETS")
    %cm_footer("PRESS X TO DELETE PRESET")

    %cm_managepreset(00)
    %cm_managepreset(01)
    %cm_managepreset(02)
    %cm_managepreset(03)
    %cm_managepreset(04)
    %cm_managepreset(05)
    %cm_managepreset(06)
    %cm_managepreset(07)
    %cm_managepreset(08)
    %cm_managepreset(09)
    %cm_managepreset(10)
    %cm_managepreset(11)
    %cm_managepreset(12)
    %cm_managepreset(13)
    %cm_managepreset(14)
    %cm_managepreset(15)
    %cm_managepreset(16)
    %cm_managepreset(17)
    %cm_managepreset(18)
    %cm_managepreset(19)
    %cm_managepreset(20)
    %cm_managepreset(21)
    %cm_managepreset(22)
    %cm_managepreset(23)
    %cm_managepreset(24)
    %cm_managepreset(25)
    %cm_managepreset(26)
    %cm_managepreset(27)
    %cm_managepreset(28)
    %cm_managepreset(29)
    %cm_managepreset(30)
    %cm_managepreset(31)
    %cm_managepreset(32)
    %cm_managepreset(33)
    %cm_managepreset(34)
    %cm_managepreset(35)
    %cm_managepreset(36)
    %cm_managepreset(37)
    %cm_managepreset(38)
    %cm_managepreset(39)

custompreset_goto_page1:
    %cm_jsl(">GOTO PAGE ONE", .routine, #CustomPresetsMenu)
  .routine
    JSL cm_go_back
    %submenu_jump()

custompreset_goto_page2:
    %cm_jsl(">GOTO PAGE TWO", custompreset_goto_page1_routine, #CustomPresetsMenu2)

custompreset_goto_page3:
    %cm_jsl(">GOTO PAGE THREE", custompreset_goto_page1_routine, #CustomPresetsMenu3)

managepreset_goto_page1:
    %cm_jsl(">GOTO PAGE ONE", .routine, #ManagePresetsMenu)
  .routine
    JSL cm_go_back
    %submenu_jump()

managepreset_goto_page2:
    %cm_jsl(">GOTO PAGE TWO", managepreset_goto_page1_routine, #ManagePresetsMenu2)

managepreset_goto_page3:
    %cm_jsl(">GOTO PAGE THREE", managepreset_goto_page1_routine, #ManagePresetsMenu3)

ManagePresetsConfirm:
    dw #managepreset_abort
    dw #$FFFF
    dw #managepreset_confirm
    dw #$0000
    %cm_header("DELETE SELECTED PRESET?")

managepreset_abort:
    %cm_jsl("ABORT", .routine, #$0000)
  .routine
    JML cm_previous_menu

managepreset_confirm:
    %cm_jsl("Confirm Delete Preset", .routine, #$0000)
  .routine
    LDA !ram_cm_selected_slot : %presetslotsize()
    LDA #$DEAD : STA !PRESET_SLOTS,X
    LDA !ram_cm_selected_slot : ASL : TAX
    LDA #$DEAD : STA !sram_custom_preset_safewords,X
    JML cm_previous_menu


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
    dw #eq_reservemode
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
    %cm_jsl("Refill", .refill, #$0000)
  .refill
    LDA !SAMUS_HP_MAX : STA !SAMUS_HP
    ; don't fix underflow, make the player fix them with numfields
    LDA !SAMUS_MISSILES_MAX : CMP !SAMUS_MISSILES : BCC + : STA !SAMUS_MISSILES
+   LDA !SAMUS_SUPERS_MAX : CMP !SAMUS_SUPERS : BCC + : STA !SAMUS_SUPERS
+   LDA !SAMUS_PBS_MAX : CMP !SAMUS_PBS : BCC + : STA !SAMUS_PBS
+   LDA !SAMUS_RESERVE_MAX : STA !SAMUS_RESERVE_ENERGY
    STZ $0CD2  ; bomb counter
    %sfxenergy()
    RTL

eq_toggle_category:
    %cm_submenu(">Category Loadouts", #ToggleCategoryMenu)

eq_goto_toggleitems:
    %cm_jsl(">Toggle Items", #eq_prepare_items_menu, #ToggleItemsMenu)

eq_goto_togglebeams:
    %cm_jsl(">Toggle Beams", #eq_prepare_beams_menu, #ToggleBeamsMenu)

eq_currentenergy:
    %cm_numfield_word("Current Energy", !SAMUS_HP, 0, 2100, 1, 20, #0)

eq_setetanks:
    %cm_numfield("Energy Tanks", !ram_cm_etanks, 0, 21, 1, 1, .routine)
  .routine
    TAX : BEQ .zero
    ; > 14 etanks implies max%
    LDA #$0000 ; xx00 energy
    CPX #$000F : BPL .loop
    LDA #$0063 ; xx99 energy
  .loop
    ; add 100 per etank
    DEX : BMI .endloop
    CLC : ADC #$0064
    BRA .loop
  .zero
    LDA #$0063 ; 99 energy
  .endloop
    STA !SAMUS_HP : STA !SAMUS_HP_MAX
    RTL

eq_currentreserves:
    %cm_numfield_word("Current Reserves", !SAMUS_RESERVE_ENERGY, 0, 700, 1, 20, #0)

eq_setreserves:
    %cm_numfield("Reserve Tanks", !ram_cm_reserve, 0, 7, 1, 1, .routine)
  .routine
    TAX : BEQ .zero
    LDA #$0000
  .loop
    ; add 100 per reserve
    DEX : BMI .endloop
    CLC : ADC #$0064
    BRA .loop
  .zero
    STA !SAMUS_RESERVE_MODE
  .endloop
    STA !SAMUS_RESERVE_ENERGY : STA !SAMUS_RESERVE_MAX
    RTL

eq_reservemode:
    dw !ACTION_CHOICE
    dl #!SAMUS_RESERVE_MODE
    dw #.routine
    db #$28, "Reserve Mode", #$FF
    db #$28, " UNOBTAINED", #$FF
    db #$28, "       AUTO", #$FF
    db #$28, "     MANUAL", #$FF
    db #$FF
  .routine
    LDA !SAMUS_RESERVE_MAX : BNE +
    ; lock at UNOBTAINED if max = 0
    STA !SAMUS_RESERVE_MODE
    %sfxdamage()
+   RTL

eq_currentmissiles:
    %cm_numfield_word("Current Missiles", !SAMUS_MISSILES, 0, 325, 1, 20, #0)

eq_setmissiles:
    %cm_numfield_word("Missiles", !SAMUS_MISSILES_MAX, 0, 325, 5, 20, .routine)
  .routine
    LDA !SAMUS_MISSILES_MAX : STA !SAMUS_MISSILES
    RTL

eq_currentsupers:
    %cm_numfield("Current Super Missiles", !SAMUS_SUPERS, 0, 65, 1, 5, #0)

eq_setsupers:
    %cm_numfield("Super Missiles", !SAMUS_SUPERS_MAX, 0, 65, 5, 5, .routine)
  .routine
    LDA !SAMUS_SUPERS_MAX : STA !SAMUS_SUPERS
    RTL

eq_currentpbs:
    %cm_numfield("Current Power Bombs", !SAMUS_PBS, 0, 70, 1, 5, #0)

eq_setpbs:
    %cm_numfield("Power Bombs", !SAMUS_PBS_MAX, 0, 70, 5, 5, .routine)
  .routine
    LDA !SAMUS_PBS_MAX : STA !SAMUS_PBS
    RTL


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
    %cm_jsl("100%", action_category, #$0000)

cat_any_new:
    %cm_jsl("Any% PRKD", action_category, #$0001)

cat_any_old:
    %cm_jsl("Any% KPDR", action_category, #$0002)

cat_14ice:
    %cm_jsl("14% Ice", action_category, #$0003)

cat_14speed:
    %cm_jsl("14% Speed", action_category, #$0004)

cat_gt_code:
    %cm_jsl("GT Code", action_category, #$0005)

cat_gt_135:
    %cm_jsl("GT Max%", action_category, #$0006)

cat_rbo:
    %cm_jsl("RBO", action_category, #$0007)

cat_any_glitched:
    %cm_jsl("Any% Glitched", action_category, #$0008)

cat_inf_cf:
    %cm_jsl("Infinite Crystal Flashes", action_category, #$0009)

cat_nothing:
    %cm_jsl("Nothing", action_category, #$000A)

if !FEATURE_PAL
cat_14xice:
    %cm_jsl("14% X-Ice", action_category, #$000B)

cat_14iceboots:
    %cm_jsl("14% Ice Boots", action_category, #$000C)

cat_14speedboots:
    %cm_jsl("14% Speed Boots", action_category, #$000D)
endif

action_category:
{
    ; table index in Y
    ; dummy column allows for easy math
    TYA : ASL #4 : TAX

    LDA.l EquipmentTable,X : STA !SAMUS_ITEMS_COLLECTED : STA !SAMUS_ITEMS_EQUIPPED : INX #2

    LDA.l EquipmentTable,X : STA !SAMUS_BEAMS_COLLECTED : TAY
    ; check if Spazer+Plasma
    AND #$000C : CMP #$000C : BEQ .murderBeam
    TYA : STA !SAMUS_BEAMS_EQUIPPED : INX #2 : BRA +

  .murderBeam
    ; choose Plasma over Spazer
    TYA : AND #$100B : STA !SAMUS_BEAMS_EQUIPPED : INX #2

+   LDA.l EquipmentTable,X : STA !SAMUS_HP : STA !SAMUS_HP_MAX : INX #2
    LDA.l EquipmentTable,X : STA !SAMUS_MISSILES : STA !SAMUS_MISSILES_MAX : INX #2
    LDA.l EquipmentTable,X : STA !SAMUS_SUPERS : STA !SAMUS_SUPERS_MAX : INX #2
    LDA.l EquipmentTable,X : STA !SAMUS_PBS : STA !SAMUS_PBS_MAX : INX #2
    LDA.l EquipmentTable,X : STA !SAMUS_RESERVE_MAX : STA !SAMUS_RESERVE_ENERGY : INX #2

    JSL cm_set_etanks_and_reserve
    %sfxmissile()
    JML $90AC8D ; update beam gfx
}

EquipmentTable:
    ;  Items,  Beams,  Health, Miss,   Supers, PBs,    Reserv, Dummy
    dw #$F32F, #$100F, #$05DB, #$00E6, #$0032, #$0032, #$0190, #$0000        ; 100%
    dw #$3125, #$1007, #$018F, #$000F, #$000A, #$0005, #$0000, #$0000        ; any% new
    dw #$3325, #$100B, #$018F, #$000F, #$000A, #$0005, #$0000, #$0000        ; any% old
    dw #$1025, #$1002, #$018F, #$000A, #$000A, #$0005, #$0000, #$0000        ; 14% ice
    dw #$3025, #$1000, #$018F, #$000A, #$000A, #$0005, #$0000, #$0000        ; 14% speed
    dw #$F33F, #$100F, #$02BC, #$0064, #$0014, #$0014, #$012C, #$0000        ; gt code
    dw #$F33F, #$100F, #$0834, #$0145, #$0041, #$0041, #$02BC, #$0000        ; 135%
    dw #$710C, #$1001, #$031F, #$001E, #$0019, #$0014, #$0064, #$0000        ; rbo
    dw #$9004, #$0000, #$00C7, #$0005, #$0005, #$0005, #$0000, #$0000        ; any% glitched
    dw #$F32F, #$100F, #$0031, #$01A4, #$005A, #$0063, #$0000, #$0000        ; crystal flash
    dw #$0000, #$0000, #$0063, #$0000, #$0000, #$0000, #$0000, #$0000        ; nothing
if !FEATURE_PAL
    dw #$9005, #$1002, #$012B, #$000A, #$000A, #$0005, #$0064, #$0000        ; 14% x-ice
    dw #$1105, #$1002, #$018F, #$000A, #$000A, #$0005, #$0000, #$0000        ; 14% iceboots
    dw #$3105, #$1000, #$018F, #$000A, #$000A, #$0005, #$0000, #$0000        ; 14% speedboots
endif


; ------------------
; Toggle Items menu
; ------------------

eq_prepare_items_menu:
{
    LDA !SAMUS_ITEMS_COLLECTED : BIT #$0001 : BEQ .noVaria
    LDA !SAMUS_ITEMS_EQUIPPED : BIT #$0001 : BNE .equipVaria
    ; unequip
    LDA #$0002 : STA !ram_cm_varia : BRA +
  .equipVaria
    LDA #$0001 : STA !ram_cm_varia : BRA +
  .noVaria
    LDA #$0000 : STA !ram_cm_varia

+   LDA !SAMUS_ITEMS_COLLECTED : BIT #$0020 : BEQ .noGravity
    LDA !SAMUS_ITEMS_EQUIPPED : BIT #$0020 : BNE .equipGravity
    ; unequip
    LDA #$0002 : STA !ram_cm_gravity : BRA +
  .equipGravity
    LDA #$0001 : STA !ram_cm_gravity : BRA +
  .noGravity
    LDA #$0000 : STA !ram_cm_gravity

+   LDA !SAMUS_ITEMS_COLLECTED : BIT #$0004 : BEQ .noMorph
    LDA !SAMUS_ITEMS_EQUIPPED : BIT #$0004 : BNE .equipMorph
    ; unequip
    LDA #$0002 : STA !ram_cm_morph : BRA +
  .equipMorph
    LDA #$0001 : STA !ram_cm_morph : BRA +
  .noMorph
    LDA #$0000 : STA !ram_cm_morph

+   LDA !SAMUS_ITEMS_COLLECTED : BIT #$1000 : BEQ .noBombs
    LDA !SAMUS_ITEMS_EQUIPPED : BIT #$1000 : BNE .equipBombs
    ; unequip
    LDA #$0002 : STA !ram_cm_bombs : BRA +
  .equipBombs
    LDA #$0001 : STA !ram_cm_bombs : BRA +
  .noBombs
    LDA #$0000 : STA !ram_cm_bombs

+   LDA !SAMUS_ITEMS_COLLECTED : BIT #$0002 : BEQ .noSpring
    LDA !SAMUS_ITEMS_EQUIPPED : BIT #$0002 : BNE .equipSpring
    ; unequip
    LDA #$0002 : STA !ram_cm_spring : BRA +
  .equipSpring
    LDA #$0001 : STA !ram_cm_spring : BRA +
  .noSpring
    LDA #$0000 : STA !ram_cm_spring

+   LDA !SAMUS_ITEMS_COLLECTED : BIT #$0008 : BEQ .noScrew
    LDA !SAMUS_ITEMS_EQUIPPED : BIT #$0008 : BNE .equipScrew
    ; unequip
    LDA #$0002 : STA !ram_cm_screw : BRA +
  .equipScrew
    LDA #$0001 : STA !ram_cm_screw : BRA +
  .noScrew
    LDA #$0000 : STA !ram_cm_screw

+   LDA !SAMUS_ITEMS_COLLECTED : BIT #$0100 : BEQ .noHiJump
    LDA !SAMUS_ITEMS_EQUIPPED : BIT #$0100 : BNE .equipHiJump
    ; unequip
    LDA #$0002 : STA !ram_cm_hijump : BRA +
  .equipHiJump
    LDA #$0001 : STA !ram_cm_hijump : BRA +
  .noHiJump
    LDA #$0000 : STA !ram_cm_hijump

+   LDA !SAMUS_ITEMS_COLLECTED : BIT #$0200 : BEQ .noSpace
    LDA !SAMUS_ITEMS_EQUIPPED : BIT #$0200 : BNE .equipSpace
    ; unequip
    LDA #$0002 : STA !ram_cm_space : BRA +
  .equipSpace
    LDA #$0001 : STA !ram_cm_space : BRA +
  .noSpace
    LDA #$0000 : STA !ram_cm_space

+   LDA !SAMUS_ITEMS_COLLECTED : BIT #$2000 : BEQ .noSpeed
    LDA !SAMUS_ITEMS_EQUIPPED : BIT #$2000 : BNE .equipSpeed
    ; unequip
    LDA #$0002 : STA !ram_cm_speed : BRA +
  .equipSpeed
    LDA #$0001 : STA !ram_cm_speed : BRA +
  .noSpeed
    LDA #$0000 : STA !ram_cm_speed

+   %submenu_jump()
}

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
    %cm_equipment_item("Varia Suit", !ram_cm_varia, #$0001, #$FFFE)

ti_gravitysuit:
    %cm_equipment_item("Gravity Suit", !ram_cm_gravity, #$0020, #$FFDF)

ti_morphball:
    %cm_equipment_item("Morph Ball", !ram_cm_morph, #$0004, #$FFFB)

ti_bomb:
    %cm_equipment_item("Bombs", !ram_cm_bombs, #$1000, #$EFFF)

ti_springball:
    %cm_equipment_item("Spring Ball", !ram_cm_spring, #$0002, #$FFFD)

ti_screwattack:
    %cm_equipment_item("Screw Attack", !ram_cm_screw, #$0008, #$FFF7)

ti_hijumpboots:
    %cm_equipment_item("Hi Jump Boots", !ram_cm_hijump, #$0100, #$FEFF)

ti_spacejump:
    %cm_equipment_item("Space Jump", !ram_cm_space, #$0200, #$FDFF)

ti_speedbooster:
    %cm_equipment_item("Speed Booster", !ram_cm_speed, #$2000, #$DFFF)

ti_grapple:
    %cm_toggle_bit("Grapple", !SAMUS_ITEMS_COLLECTED, #$4000, .routine)
  .routine
    LDA !SAMUS_ITEMS_EQUIPPED : EOR #$4000 : STA !SAMUS_ITEMS_EQUIPPED
    RTL

ti_xray:
    %cm_toggle_bit("X-Ray", !SAMUS_ITEMS_COLLECTED, #$8000, .routine)
  .routine
    LDA !SAMUS_ITEMS_EQUIPPED : EOR #$8000 : STA !SAMUS_ITEMS_EQUIPPED
    RTL

equipment_toggle_items:
{
; DP values are passed in from the cm_equipment_item macro that calls this routine
; Address is a 24-bit pointer to !ram_cm_<item>, Increment is the inverse, ToggleValue is the bitmask
    LDA [!DP_Address] : BEQ .unobtained
    DEC : BEQ .equipped
    ; unquipped
    LDA !SAMUS_ITEMS_EQUIPPED : AND !DP_Increment : STA !SAMUS_ITEMS_EQUIPPED
    LDA !SAMUS_ITEMS_COLLECTED : ORA !DP_ToggleValue : STA !SAMUS_ITEMS_COLLECTED
    RTL

  .equipped
    LDA !SAMUS_ITEMS_EQUIPPED : ORA !DP_ToggleValue : STA !SAMUS_ITEMS_EQUIPPED
    LDA !SAMUS_ITEMS_COLLECTED : ORA !DP_ToggleValue : STA !SAMUS_ITEMS_COLLECTED
    RTL

  .unobtained
    LDA !SAMUS_ITEMS_EQUIPPED : AND !DP_Increment : STA !SAMUS_ITEMS_EQUIPPED
    LDA !SAMUS_ITEMS_COLLECTED : AND !DP_Increment : STA !SAMUS_ITEMS_COLLECTED
    RTL
}


; -----------------
; Toggle Beams menu
; -----------------

eq_prepare_beams_menu:
{
    JSL setup_beams_ram
    %submenu_jump()
}

setup_beams_ram:
{
+   LDA !SAMUS_BEAMS_COLLECTED : BIT #$1000 : BEQ .noCharge
    LDA !SAMUS_BEAMS_EQUIPPED : BIT #$1000 : BNE .equipCharge
    ; unequip Charge
    LDA #$0002 : STA !ram_cm_charge : BRA +
  .equipCharge
    LDA #$0001 : STA !ram_cm_charge : BRA +
  .noCharge
    LDA #$0000 : STA !ram_cm_charge

+   LDA !SAMUS_BEAMS_COLLECTED : BIT #$0002 : BEQ .noIce
    LDA !SAMUS_BEAMS_EQUIPPED : BIT #$0002 : BNE .equipIce
    ; unequip Ice
    LDA #$0002 : STA !ram_cm_ice : BRA +
  .equipIce
    LDA #$0001 : STA !ram_cm_ice : BRA +
  .noIce
    LDA #$0000 : STA !ram_cm_ice

+   LDA !SAMUS_BEAMS_COLLECTED : BIT #$0001 : BEQ .noWave
    LDA !SAMUS_BEAMS_EQUIPPED : BIT #$0001 : BNE .equipWave
    ; unequip Wave
    LDA #$0002 : STA !ram_cm_wave : BRA +
  .equipWave
    LDA #$0001 : STA !ram_cm_wave : BRA +
  .noWave
    LDA #$0000 : STA !ram_cm_wave

+   LDA !SAMUS_BEAMS_COLLECTED : BIT #$0004 : BEQ .noSpazer
    LDA !SAMUS_BEAMS_EQUIPPED : BIT #$0004 : BNE .equipSpazer
    ; unequip Spazer
    LDA #$0002 : STA !ram_cm_spazer : BRA +
  .equipSpazer
    LDA #$0001 : STA !ram_cm_spazer : BRA +
  .noSpazer
    LDA #$0000 : STA !ram_cm_spazer

+   LDA !SAMUS_BEAMS_COLLECTED : BIT #$0008 : BEQ .noPlasma
    LDA !SAMUS_BEAMS_EQUIPPED : BIT #$0008 : BNE .equipPlasma
    ; unequip Plasma
    LDA #$0002 : STA !ram_cm_plasma : BRA +
  .equipPlasma
    LDA #$0001 : STA !ram_cm_plasma : BRA +
  .noPlasma
    LDA #$0000 : STA !ram_cm_plasma

+   RTL
}

ToggleBeamsMenu:
    dw tb_chargebeam
    dw tb_icebeam
    dw tb_wavebeam
    dw tb_spazerbeam
    dw tb_plasmabeam
    dw #$FFFF
    dw misc_hyperbeam
    dw #$FFFF
    dw tb_glitchedbeams
    dw #$0000
    %cm_header("TOGGLE BEAMS")

tb_chargebeam:
    %cm_equipment_beam("Charge", !ram_cm_charge, #$1000, #$EFFF, #$100F)

tb_icebeam:
    %cm_equipment_beam("Ice", !ram_cm_ice, #$0002, #$FFFD, #$100F)

tb_wavebeam:
    %cm_equipment_beam("Wave", !ram_cm_wave, #$0001, #$FFFE, #$100F)

tb_spazerbeam:
    %cm_equipment_beam("Spazer", !ram_cm_spazer, #$0004, #$FFFB, #$1007)

tb_plasmabeam:
    %cm_equipment_beam("Plasma", !ram_cm_plasma, #$0008, #$FFF7, #$100B)

tb_glitchedbeams:
    %cm_submenu(">Glitched Beams", #GlitchedBeamsMenu)

equipment_toggle_beams:
{
; DP values are passed in from the cm_equipment_beam macro that calls this routine
; Address is a 24-bit pointer to !ram_cm_<beam>, Increment is the inverse, ToggleValue is the bitmask, Temp is the AND for Spazer+Plasma safety
    LDA [!DP_Address] : BEQ .unobtained
    DEC : BEQ .equipped
    ; unquipped
    LDA !SAMUS_BEAMS_EQUIPPED : AND !DP_Increment : STA !SAMUS_BEAMS_EQUIPPED
    LDA !SAMUS_BEAMS_COLLECTED : ORA !DP_ToggleValue : STA !SAMUS_BEAMS_COLLECTED
    BRA .done

  .equipped
    LDA !SAMUS_BEAMS_EQUIPPED : ORA !DP_ToggleValue : AND !DP_Temp : STA !SAMUS_BEAMS_EQUIPPED
    LDA !SAMUS_BEAMS_COLLECTED : ORA !DP_ToggleValue : STA !SAMUS_BEAMS_COLLECTED
    BRA .done

  .unobtained
    LDA !SAMUS_BEAMS_EQUIPPED : AND !DP_Increment : STA !SAMUS_BEAMS_EQUIPPED
    LDA !SAMUS_BEAMS_COLLECTED : AND !DP_Increment : STA !SAMUS_BEAMS_COLLECTED

  .done
    JML $90AC8D ; update beam gfx
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
    %cm_jsl("Murder Beam", action_glitched_beam, #$100F)

gb_spacetime:
    %cm_jsl("Spacetime Beam", action_glitched_beam, #$100E)

gb_chainsaw:
    %cm_jsl("Chainsaw Beam", action_glitched_beam, #$100D)

gb_unnamed:
    %cm_jsl("Unnamed Glitched Beam", action_glitched_beam, #$100C)

action_glitched_beam:
{
    TYA : STA !SAMUS_BEAMS_EQUIPPED
    LDA !SAMUS_BEAMS_COLLECTED : ORA !SAMUS_BEAMS_EQUIPPED : STA !SAMUS_BEAMS_COLLECTED
    ; play a song-dependent sound and hope it's the wrong song :)
    LDA #$0042 : JSL !SFX_LIB1
    JSL setup_beams_ram
    JML $90AC8D ; update beam gfx
}


; -------------
; Teleport menu
; -------------

TeleportMenu:
    dw #tel_goto_crateria
    dw #tel_goto_brinstar
    dw #tel_goto_norfair
    dw #tel_goto_wreckedship
    dw #tel_goto_maridia
    dw #tel_goto_tourian
    dw #$0000
    %cm_header("TELEPORT TO SAVE STATION")

tel_goto_crateria:
    %cm_submenu(">Crateria", #TeleportCrateriaMenu)

tel_goto_brinstar:
    %cm_submenu(">Brinstar", #TeleportBrinstarMenu)

tel_goto_norfair:
    %cm_submenu(">Norfair", #TeleportNorfairMenu)

tel_goto_wreckedship:
    %cm_submenu(">Wrecked Ship", #TeleportWreckedShipMenu)

tel_goto_maridia:
    %cm_submenu(">Maridia", #TeleportMaridiaMenu)

tel_goto_tourian:
    %cm_submenu(">Tourian", #TeleportTourianMenu)

TeleportCrateriaMenu:
    dw #tel_crateriaship
    dw #tel_crateriaparlor
    dw #$FFFF
    dw #tel_crateria08
    dw #tel_crateria09
    dw #tel_crateria0A
    dw #tel_crateria0B
    dw #tel_crateria0C
    dw #tel_crateria11
    dw #tel_craterialanding
    dw #$0000
    %cm_header("CRATERIA SAVE STATIONS")

tel_crateriaship:
    %cm_jsl("Ship", #action_teleport, #$0000)

tel_crateriaparlor:
    %cm_jsl("Parlor", #action_teleport, #$0001)

tel_crateria08:
    %cm_jsl("DEBUG Forgotten Hwy Elev", #action_teleport, #$0008)

tel_crateria09:
    %cm_jsl("DEBUG Red Brinstar Elev", #action_teleport, #$0009)

tel_crateria0A:
    %cm_jsl("DEBUG Blue Brinstar Elev", #action_teleport, #$000A)

tel_crateria0B:
    %cm_jsl("DEBUG Green Brinstar Elev", #action_teleport, #$000B)

tel_crateria0C:
    %cm_jsl("DEBUG Tourian Elevator", #action_teleport, #$000C)

tel_crateria11:
    %cm_jsl("DEBUG Forgotten Highway", #action_teleport, #$0011)

tel_craterialanding:
    %cm_jsl("Gunship Landing", #action_teleport, #$0012)

TeleportBrinstarMenu:
    dw #tel_brinstarpink
    dw #tel_brinstargreenshaft
    dw #tel_brinstargreenetecoons
    dw #tel_brinstarkraid
    dw #tel_brinstarredtower
    dw #$FFFF
    dw #tel_brinstar08
    dw #tel_brinstar09
    dw #tel_brinstar0A
    dw #tel_brinstar0B
    dw #tel_brinstar11
    dw #tel_brinstar12
    dw #$0000
    %cm_header("BRINSTAR SAVE STATIONS")

tel_brinstarpink:
    %cm_jsl("Pink Spospo", #action_teleport, #$0100)

tel_brinstargreenshaft:
    %cm_jsl("Green Shaft", #action_teleport, #$0101)

tel_brinstargreenetecoons:
    %cm_jsl("Green Etecoons", #action_teleport, #$0102)

tel_brinstarkraid:
    %cm_jsl("Kraid", #action_teleport, #$0103)

tel_brinstarredtower:
    %cm_jsl("Red Tower", #action_teleport, #$0104)

tel_brinstar08:
    %cm_jsl("DEBUG West Crateria Elev", #action_teleport, #$0108)

tel_brinstar09:
    %cm_jsl("DEBUG Old Tourian Elevator", #action_teleport, #$0109)

tel_brinstar0A:
    %cm_jsl("DEBUG Crateria Elevator", #action_teleport, #$010A)

tel_brinstar0B:
    %cm_jsl("DEBUG Norfair Elevator", #action_teleport, #$010B)

tel_brinstar11:
    %cm_jsl("DEBUG Kraid Gadora Room", #action_teleport, #$0111)

tel_brinstar12:
    %cm_jsl("DEBUG Big Pink", #action_teleport, #$0112)

TeleportNorfairMenu:
    dw #tel_norfairgrapple
    dw #tel_norfairbubble
    dw #tel_norfairtunnel
    dw #tel_norfaircrocomire
    dw #tel_norfairlnelevator
    dw #tel_norfairridley
    dw #$FFFF
    dw #tel_norfair08
    dw #tel_norfair09
    dw #tel_norfair0A
    dw #tel_norfair11
    dw #tel_norfair12
    dw #tel_norfair13
    dw #tel_norfair15
    dw #tel_norfair16
    dw #$0000
    %cm_header("NORFAIR SAVE STATIONS")

tel_norfairgrapple:
    %cm_jsl("Grapple", #action_teleport, #$0200)

tel_norfairbubble:
    %cm_jsl("Bubble Mountain", #action_teleport, #$0201)

tel_norfairtunnel:
    %cm_jsl("Tunnel", #action_teleport, #$0202)

tel_norfaircrocomire:
    %cm_jsl("Crocomire", #action_teleport, #$0203)

tel_norfairlnelevator:
    %cm_jsl("LN Elevator", #action_teleport, #$0204)

tel_norfairridley:
    %cm_jsl("Ridley", #action_teleport, #$0205)

tel_norfair08:
    %cm_jsl("DEBUG Brinstar Elevator", #action_teleport, #$0208)

tel_norfair09:
    %cm_jsl("DEBUG Lower Norfair Elev", #action_teleport, #$0209)

tel_norfair0A:
    %cm_jsl("DEBUG Upper Norfair Elev", #action_teleport, #$020A)

tel_norfair11:
    %cm_jsl("DEBUG Crocomire Speedway", #action_teleport, #$0211)

tel_norfair12:
    %cm_jsl("DEBUG Ridley Farming Room", #action_teleport, #$0212)

tel_norfair13:
    %cm_jsl("DEBUG Post-Croc Farming", #action_teleport, #$0213)

tel_norfair15:
    %cm_jsl("DEBUG OoB Screw Attack", #action_teleport, #$0215)

tel_norfair16:
    %cm_jsl("DEBUG Golden Torizo Room", #action_teleport, #$0216)

TeleportWreckedShipMenu:
    dw #tel_wreckedship
    dw #$FFFF
    dw #tel_wreckedship10
    dw #tel_wreckedship11
    dw #$0000
    %cm_header("WRECKED SHIP SAVE STATIONS")

tel_wreckedship:
    %cm_jsl("Wrecked Ship", #action_teleport, #$0300)

tel_wreckedship10:
    %cm_jsl("DEBUG Entrance", #action_teleport, #$0310)

tel_wreckedship11:
    %cm_jsl("DEBUG Basement", #action_teleport, #$0311)

TeleportMaridiaMenu:
    dw #tel_maridiatube
    dw #tel_maridiaelevator
    dw #tel_maridiaaqueduct
    dw #tel_maridiadraygon
    dw #$FFFF
    dw #tel_maridia08
    dw #tel_maridia10
    dw #tel_maridia11
    dw #tel_maridia12
    dw #tel_maridia13
    dw #$0000
    %cm_header("MARIDIA SAVE STATIONS")

tel_maridiatube:
    %cm_jsl("Tube", #action_teleport, #$0400)

tel_maridiaelevator:
    %cm_jsl("Elevator", #action_teleport, #$0401)

tel_maridiaaqueduct:
    %cm_jsl("Aqueduct", #action_teleport, #$0402)

tel_maridiadraygon:
    %cm_jsl("Draygon", #action_teleport, #$0403)

tel_maridia08:
    %cm_jsl("DEBUG East Crateria Elev", #action_teleport, #$0408)

tel_maridia10:
    %cm_jsl("DEBUG Pseudo Plasma Spark", #action_teleport, #$0410)

tel_maridia11:
    %cm_jsl("DEBUG Precious Room", #action_teleport, #$0411)

tel_maridia12:
    %cm_jsl("DEBUG Botwoon Hallway", #action_teleport, #$0412)

tel_maridia13:
    %cm_jsl("DEBUG Oasis", #action_teleport, #$0413)

TeleportTourianMenu:
    dw #tel_tourianmb
    dw #tel_tourianentrance
    dw #$FFFF
    dw #tel_tourian08
    dw #tel_tourian10
    dw #tel_tourian11
    dw #$0000
    %cm_header("TOURIAN SAVE STATIONS")

tel_tourianmb:
    %cm_jsl("Mother Brain", #action_teleport, #$0500)

tel_tourianentrance:
    %cm_jsl("Entrance", #action_teleport, #$0501)

tel_tourian08:
    %cm_jsl("DEBUG Crateria Elevator", #action_teleport, #$0508)

tel_tourian10:
    %cm_jsl("DEBUG Rinka Shaft", #action_teleport, #$0510)

tel_tourian11:
    %cm_jsl("DEBUG Dustin Torizo", #action_teleport, #$0511)

action_teleport:
{
    ; Teleport destination in Y when called
    TYA : AND #$FF00 : XBA : STA !AREA_ID
    TYA : AND #$00FF : STA !LOAD_STATION_INDEX
    LDA #$0006 : STA !GAMEMODE

    ; Make sure we can teleport to Zebes from Ceres
    %a8()
    LDA #$05 : STA $7ED914
    %a16()

    STZ $0727 ; Clear pause menu index
    STZ $0795 ; Clear door transition flag
    STZ $0E18 ; Set elevator to inactive
    STZ $1C1F ; Clear message box index

    LDA !SAMUS_HP_MAX : BNE +
    LDA #$001F : STA !SAMUS_HP

+   JSL reset_all_counters
    JSL stop_all_sounds

    LDA #$0001 : STA !ram_cm_leave

    RTL
}


; -----------
; Misc menu
; -----------

MiscMenu:
    dw #misc_bluesuit
    dw #misc_flashsuit
    dw #misc_hyperbeam
    dw #$FFFF
    dw #misc_slowdownrate
    dw #misc_healthbomb
    dw #misc_waterphysics
    dw #$FFFF
    dw #misc_magicpants
    dw #misc_spacepants
    dw #$FFFF
    dw #misc_metronome
    dw #misc_metronome_tickrate
    dw #misc_metronome_sfx
    dw #$FFFF
    dw #misc_killenemies
    dw #misc_forcestand
    dw #misc_magnetstairs
    dw #$0000
    %cm_header("MISC OPTIONS")

misc_bluesuit:
    %cm_toggle("Blue Suit", !SAMUS_DASH_COUNTER, #$0004, #0)

misc_flashsuit:
    %cm_toggle("Flash Suit", !SAMUS_SHINE_TIMER, #$0001, #0)

misc_hyperbeam:
    %cm_toggle_bit("Hyper Beam", !SAMUS_HYPER_BEAM, #$8000, #.routine)
  .routine
    AND #$8000 : BEQ .off
    LDA #$0003 ; jump table index
if !FEATURE_PAL
    JML $91E412 ; setup Samus for Hyper Beam
else
    JML $91E4AD ; setup Samus for Hyper Beam
endif

  .off
    ; check for Spazer+Plasma
    LDA !SAMUS_BEAMS_COLLECTED : AND #$000C : CMP #$000C : BEQ .disableMurder
    LDA !SAMUS_BEAMS_COLLECTED : STA !SAMUS_BEAMS_EQUIPPED
    BRA .FXobjects

  .disableMurder
    LDA !SAMUS_BEAMS_COLLECTED : AND #$000B : STA !SAMUS_BEAMS_EQUIPPED

  .FXobjects
    LDX #$000E

    LDX #$000E
  .loopFXobjects
    ; find Hyper Beam palette FX object the index
    LDA $1E7D,X : CMP #$E1F0 : BEQ .found
    DEX #2 : BPL .loopFXobjects

  .found
    STZ $1E7D,X ; this is probably the only one that matters
    STZ $1E8D,X : STZ $1E9D,X : STZ $1EAD,X
    STZ $1EBD,X : STZ $1ECD,X : STZ $1EDD,X

    JML $90AC8D ; update beam gfx

misc_slowdownrate:
    %cm_numfield("Samus Slowdown Rate", $7E0A66, 0, 4, 1, 1, #0)

misc_healthbomb:
    %cm_toggle("Health Bomb Flag", !SAMUS_HEALTH_WARNING, #$0001, #0)

misc_magicpants:
    dw !ACTION_CHOICE
    dl #!ram_magic_pants_enabled
    dw #$0000
    db #$28, "Magic Pants", #$FF
    db #$28, "        OFF", #$FF
    db #$28, "      FLASH", #$FF
    db #$28, "       LOUD", #$FF
    db #$28, "       BOTH", #$FF
    db #$FF

misc_spacepants:
    dw !ACTION_CHOICE
    dl #!ram_space_pants_enabled
    dw #$0000
    db #$28, "Space Pants", #$FF
    db #$28, "        OFF", #$FF
    db #$28, "      FLASH", #$FF
    db #$28, "       LOUD", #$FF
    db #$28, "       BOTH", #$FF
    db #$FF

misc_waterphysics:
    %cm_toggle("Ignore Water this Room", $7E197E, #$0004, #0)

misc_metronome:
    %cm_toggle("Metronome", !ram_metronome, #$0001, GameLoopExtras)

misc_metronome_tickrate:
    %cm_numfield("Metronome Tickrate", !sram_metronome_tickrate, 1, 255, 1, 8, #.routine)
  .routine
    LDA #$0000 : STA !ram_metronome_counter
    RTL

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
    %cm_jsl("Kill Enemies", .kill_loop, #0)
  .kill_loop
    ; 8000 = solid to Samus, 0400 = Ignore Samus projectiles
    TAX : LDA $0F86,X : BIT #$8400 : BNE +
    ORA #$0200 : STA $0F86,X
+   TXA : CLC : ADC #$0040 : CMP #$0800 : BNE .kill_loop
    %sfxconfirm()
    RTL

misc_forcestand:
    %cm_jsl("Force Samus to Stand Up", .routine, #0)
  .routine
    JSL $90E2D4 ; bridge to: Release Samus from Draygon
    %sfxconfirm()
    RTL

!ROOM_LAYOUT_MAGNET_STAIRS = #$0001
misc_magnetstairs:
    %cm_toggle("Magnet Stairs Fix", !sram_magnetstairs, #$0001, #.routine)
  .routine
    LDA !ROOM_ID : CMP #$DFD7 : BNE .done
    LDA !sram_magnetstairs : BEQ .broken
    ; change tile type and BTS
    %a8()
    LDA #$10 : STA $7F01F9 : STA $7F02EB
    LDA #$53 : STA $7F64FD : STA $7F6576
    RTL
  .broken
    ; change tile type and BTS
    %a8()
    LDA #$80 : STA $7F01F9 : STA $7F02EB
    LDA #$00 : STA $7F64FD : STA $7F6576
  .done
    RTL

GameLoopExtras:
{
    ; This allows us to maintain a baseline for CPU timing
    ; without restricting our ability to add non-essential features
    ; Set the flag if any of these features are enabled
    LDA !ram_magic_pants_enabled : BNE .enabled
    LDA !ram_space_pants_enabled : BNE .enabled
    LDA !ram_metronome : BNE .enabled
    LDA !ram_infinite_ammo

  .enabled
    STA !ram_game_loop_extras
    RTL
}


; ---------------
; Sprite Features
; ---------------

SpritesMenu:
    dw #sprites_samus_prio
    dw #sprites_show_samus_hitbox
    dw #sprites_show_enemy_hitbox
    dw #sprites_show_extended_spritemap_hitbox
    dw #sprites_show_custom_boss_hitbox
    dw #sprites_show_samusproj_hitbox
    dw #sprites_show_enemyproj_hitbox
    dw #sprites_show_proj_as_32x32
    dw #sprites_oob_viewer
    dw #$0000
    %cm_header("SPRITE FEATURES")

sprites_samus_prio:
    %cm_toggle_bit("Samus on Top", !sram_sprite_prio_flag, #$3000, #0)

sprites_show_samus_hitbox:
    %cm_toggle_bit("Show Samus Hitbox", !ram_sprite_feature_flags, !SPRITE_SAMUS_HITBOX, #0)

sprites_show_enemy_hitbox:
    %cm_toggle_bit("Normal Enemy Hitboxes", !ram_sprite_feature_flags, !SPRITE_ENEMY_HITBOX, #0)

sprites_show_extended_spritemap_hitbox:
    %cm_toggle_bit("Large Enemy Hitboxes", !ram_sprite_feature_flags, !SPRITE_EXTENDED_HITBOX, #0)

sprites_show_custom_boss_hitbox:
    %cm_toggle_bit("Special Boss Hitboxes", !ram_sprite_feature_flags, !SPRITE_BOSS_HITBOX, #0)

sprites_show_samusproj_hitbox:
    %cm_toggle_bit("Samus Projectile Hitbox", !ram_sprite_feature_flags, !SPRITE_SAMUS_PROJ, #0)

sprites_show_enemyproj_hitbox:
    %cm_toggle_bit("Enemy Projectile Hitbox", !ram_sprite_feature_flags, !SPRITE_ENEMY_PROJ, #0)

sprites_show_proj_as_32x32:
    %cm_toggle_bit("32x32 Projectile Boxes", !ram_sprite_feature_flags, !SPRITE_32x32_PROJ, #0)

sprites_oob_viewer:
    %cm_toggle_bit("OoB Tile Viewer", !ram_sprite_feature_flags, !SPRITE_OOB_WATCH, .routine)
  .routine
    LDA !ram_sprite_feature_flags : BIT !SPRITE_OOB_WATCH : BEQ +
    JML upload_sprite_oob_tiles
+   RTL


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
    %cm_jsl("Reset All Events", .routine, #$0000)
  .routine
    LDA #$0000
    STA $7ED820 : STA $7ED822
    %sfxquake()
    RTL

events_resetdoors:
    %cm_jsl("Reset All Doors", .routine, #$0000)
  .routine
    %ai8()
    LDA #$00 : LDX #$B0
-   STA $7ED800,X
    INX : CPX #$D0 : BNE -
    %ai16()
    %sfxquake()
    RTL

events_resetitems:
    %cm_jsl("Reset All Items", .routine, #$0000)
  .routine
    %ai8()
    LDA #$00 : LDX #$70
-   STA $7ED800,X
    INX : CPX #$90 : BNE -
    %ai16()
    %sfxquake()
    RTL

events_goto_bosses:
    %cm_submenu(">Bosses", #BossesMenu)

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

pushpc
org $85A000
print pc, " mainmenu InfoHUD start"

InfoHudMenu:
    dw #ih_goto_display_mode
    dw #ih_display_mode
    dw #ih_display_mode_reward
    dw #$FFFF
    dw #ih_goto_room_strat
    dw #ih_room_strat
    dw #$FFFF
    dw #ih_superhud
    dw #ih_door_display_mode
    dw #$FFFF
    dw #ih_goto_timer_settings
    dw #$FFFF
    dw #ih_top_HUD_mode
    dw #ih_dynamic_frames_held
if !PRESERVE_WRAM_DURING_SPACETIME
    dw #ih_spacetime_infohud
endif
    dw #ih_status_icons
    dw #ih_lag
    dw #$FFFF
    dw #ih_ram_watch
    dw #$0000
    %cm_header("INFOHUD")

ih_goto_display_mode:
    %cm_submenu(">Select InfoHUD Mode", #DisplayModeMenu)

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
    dw ihmode_armpump
    dw ihmode_shottimer
    dw ihmode_ramwatch
    dw #$FFFF
    dw ihmode_GOTO_PAGE_TWO
    dw #$0000
    %cm_header("INFOHUD DISPLAY MODE")

DisplayModeMenu2:
    dw ihmode_countdamage
    dw ihmode_pumpcounter
;    dw ihmode_dboost ; (unfinished)
    dw ihmode_armpump
    dw ihmode_ramwatch
    dw ihmode_GOTO_PAGE_ONE
    dw #$0000
    %cm_header("INFOHUD DISPLAY MODE 2/2")

ihmode_enemyhp:
    %cm_jsl("Enemy HP", #action_select_infohud_mode, #$0000)

ihmode_roomstrat:
!IH_MODE_ROOMSTRAT_INDEX = #$0001
    %cm_jsl("Room Strat", #action_select_infohud_mode, #$0001)

ihmode_chargetimer:
    %cm_jsl("Charge Timer", #action_select_infohud_mode, #$0002)

ihmode_xfactor:
    %cm_jsl("X-Factor Timer", #action_select_infohud_mode, #$0003)

ihmode_cooldowncounter:
    %cm_jsl("Cooldown Timer", #action_select_infohud_mode, #$0004)

ihmode_shinetimer:
    %cm_jsl("Shinespark Timer", #action_select_infohud_mode, #$0005)

ihmode_dashcounter:
    %cm_jsl("Dash Counter", #action_select_infohud_mode, #$0006)

ihmode_shinetune:
!IH_MODE_SHINETUNE_INDEX = #$0007
    %cm_jsl("Shine Tune", #action_select_infohud_mode, #$0007)

ihmode_iframecounter:
    %cm_jsl("I-Frame Counter", #action_select_infohud_mode, #$0008)

ihmode_spikesuit:
    %cm_jsl("Spikesuit Trainer", #action_select_infohud_mode, #$0009)

ihmode_lagcounter:
    %cm_jsl("Lag Counter", #action_select_infohud_mode, #$000A)

ihmode_cpuusage:
    %cm_jsl("CPU Usage", #action_select_infohud_mode, #$000B)

ihmode_xpos:
    %cm_jsl("X Position", #action_select_infohud_mode, #$000C)

ihmode_ypos:
    %cm_jsl("Y Position", #action_select_infohud_mode, #$000D)

ihmode_hspeed:
    %cm_jsl("Horizontal Speed", #action_select_infohud_mode, #$000E)

!IH_MODE_VSPEED_INDEX = #$000F
ihmode_vspeed:
    %cm_jsl("Vertical Speed", #action_select_infohud_mode, #$000F)

ihmode_quickdrop:
    %cm_jsl("Quickdrop Trainer", #action_select_infohud_mode, #$0010)

ihmode_walljump:
    %cm_jsl("Walljump Trainer", #action_select_infohud_mode, #$0011)

!IH_MODE_ARMPUMP_INDEX = $0012
ihmode_armpump:
    %cm_jsl("Arm Pump Trainer", #action_select_infohud_mode, #$0012)

ihmode_shottimer:
    %cm_jsl("Shot Timer", #action_select_infohud_mode, #$0013)

ihmode_countdamage:
    %cm_jsl("Boss Damage Counter", #action_select_infohud_mode, #$0014)

!IH_MODE_RAMWATCH_INDEX = #$0015
ihmode_ramwatch:
    %cm_jsl("Custom RAM Watch", #action_select_infohud_mode, #$0015)

ihmode_pumpcounter:
    %cm_jsl("Arm Pump Counter", #action_select_infohud_mode, #$0016)

;ihmode_dboost:
;    %cm_jsl("WIP - Damage Boost Trainer", #action_select_infohud_mode, #$0016)

ihmode_GOTO_PAGE_ONE:
    %cm_jsl(">GOTO PAGE ONE", ihmode_GOTO_PAGE_TWO_routine, #DisplayModeMenu)

ihmode_GOTO_PAGE_TWO:
    %cm_jsl(">GOTO PAGE TWO", .routine, #DisplayModeMenu2)
  .routine
    JSL cm_go_back
    %submenu_jump()

action_select_infohud_mode:
{
    TYA : STA !sram_display_mode
    JML cm_previous_menu
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
    db #$28, "   ARM PUMP", #$FF
    db #$28, " SHOT TIMER", #$FF
    db #$28, "DMG COUNTER", #$FF
    db #$28, "  RAM WATCH", #$FF
    db #$28, " PUMP COUNT", #$FF
;    db #$28, "WIP D-BOOST", #$FF
    db #$FF

ih_display_mode_reward:
    %cm_toggle("Strat Reward SFX", !sram_display_mode_reward, #$0001, #0)

ih_goto_room_strat:
    %cm_submenu(">Select Room Strat", #RoomStratMenu)

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
    dw ihstrat_kihuntermanip
    dw ihstrat_kraidradar
    dw ihstrat_zebskip
    dw ihstrat_pitdoor
    dw ihstrat_ridleyai
    dw ihstrat_ceresridley
    dw ihstrat_draygonai
    dw ihstrat_downbackzeb
    dw ihstrat_twocries
    dw ihstrat_wasteland
    dw ihstrat_moondance
    dw #$0000
    %cm_header("INFOHUD ROOM STRAT")
    %cm_footer("ROOM STRAT MUST BE ACTIVE")

ihstrat_superhud:
    %cm_jsl("Super HUD", #action_select_room_strat, #$0000)

ihstrat_mbhp:
!IH_STRAT_MBHP_INDEX = #$0001
    %cm_jsl("Mother Brain HP", #action_select_room_strat, #$0001)

ihstrat_moatcwj:
    %cm_jsl("Moat CWJ", #action_select_room_strat, #$0002)

ihstrat_gateglitch:
    %cm_jsl("Gate Glitch", #action_select_room_strat, #$0003)

ihstrat_tacotank:
    %cm_jsl("Taco Tank", #action_select_room_strat, #$0004)

ihstrat_robotflush:
    %cm_jsl("Robot Flush", #action_select_room_strat, #$0005)

ihstrat_shinetopb:
    %cm_jsl("Shine to PB", #action_select_room_strat, #$0006)

ihstrat_elevatorcf:
    %cm_jsl("Elevator Crystal Flash", #action_select_room_strat, #$0007)

ihstrat_botwooncf:
    %cm_jsl("Botwoon Crystal Flash", #action_select_room_strat, #$0008)

ihstrat_doorskip:
    %cm_jsl("Parlor Door Skip", #action_select_room_strat, #$0009)

ihstrat_snailclip:
    %cm_jsl("Aqueduct Snail Clip", #action_select_room_strat, #$000A)

ihstrat_kihuntermanip:
    %cm_jsl("Kihunter Manipulation", #action_select_room_strat, #$000B)

ihstrat_kraidradar:
    %cm_jsl("Kraid Nail Radar", #action_select_room_strat, #$000C)

ihstrat_zebskip:
    %cm_jsl("Zeb Skip Indicator", #action_select_room_strat, #$000D)

ihstrat_pitdoor:
    %cm_jsl("Pit Room Right Door", #action_select_room_strat, #$000E)

ihstrat_ridleyai:
    %cm_jsl("Ridley's AI Tracker", #action_select_room_strat, #$000F)

ihstrat_ceresridley:
    %cm_jsl("Ceres Ridley Hits", #action_select_room_strat, #$0010)

ihstrat_draygonai:
    %cm_jsl("Draygon's AI Tracker", #action_select_room_strat, #$0011)

ihstrat_downbackzeb:
    %cm_jsl("Downback Zeb Skip", #action_select_room_strat, #$0012)

ihstrat_twocries:
    %cm_jsl("Two Cries Standup", #action_select_room_strat, #$0013)

ihstrat_wasteland:
    %cm_jsl("Wasteland RNG Manip", #action_select_room_strat, #$0014)

ihstrat_moondance:
    %cm_jsl("Moondance", #action_select_room_strat, #$0015)

action_select_room_strat:
{
    TYA : STA !sram_room_strat
    ; enable ROOM STRAT mode
    LDA !IH_MODE_ROOMSTRAT_INDEX : STA !sram_display_mode
    JML cm_previous_menu
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
    db #$28, "   KIHUNTER", #$FF
    db #$28, "KRAID RADAR", #$FF
    db #$28, "   ZEB SKIP", #$FF
    db #$28, "PIT DOOR TC", #$FF
    db #$28, "  RIDLEY AI", #$FF
    db #$28, "RIDLEY HITS", #$FF
    db #$28, " DRAYGON AI", #$FF
    db #$28, "  DBACK ZEB", #$FF
    db #$28, "  TWO CRIES", #$FF
    db #$28, "  WASTELAND", #$FF
    db #$28, "  MOONDANCE", #$FF
    db #$FF
  .routine
    LDA #$0001 : STA !sram_display_mode
    RTL

print pc, " superhud menu end"
ih_superhud:
    %cm_submenu(">Configure Super HUD", #SuperHUDMenu)

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
        %cm_submenu(">Bottom HUD List", #SuperHUDBottomMenu)

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
    %cm_jsl("Enemy HP", #action_select_superhud_bottom, #$0000)

ih_superhud_chargetimer:
    %cm_jsl("Charge Timer", #action_select_superhud_bottom, #$0001)

ih_superhud_xfactor:
    %cm_jsl("X-Factor Timer", #action_select_superhud_bottom, #$0002)

ih_superhud_cooldowncounter:
    %cm_jsl("Cooldown Timer", #action_select_superhud_bottom, #$0003)

ih_superhud_shinetimer:
    %cm_jsl("Shinespark Timer", #action_select_superhud_bottom, #$0004)

ih_superhud_iframecounter:
    %cm_jsl("I-Frame Counter", #action_select_superhud_bottom, #$0005)

ih_superhud_spikesuit:
    %cm_jsl("Spikesuit Trainer", #action_select_superhud_bottom, #$0006)

ih_superhud_xpos:
    %cm_jsl("X Position", #action_select_superhud_bottom, #$0007)

ih_superhud_ypos:
    %cm_jsl("Y Position", #action_select_superhud_bottom, #$0008)

ih_superhud_hspeed:
    %cm_jsl("Horizontal Speed", #action_select_superhud_bottom, #$0009)

ih_superhud_quickdrop:
    %cm_jsl("Quickdrop Trainer", #action_select_superhud_bottom, #$000A)

ih_superhud_walljump:
    %cm_jsl("Walljump Trainer", #action_select_superhud_bottom, #$000B)

ih_superhud_shottimer:
    %cm_jsl("Shot Timer", #action_select_superhud_bottom, #$000C)

ih_superhud_countdamage:
    %cm_jsl("Boss Damage Counter", #action_select_superhud_bottom, #$000D)

ih_superhud_ramwatch:
    %cm_jsl("Custom RAM Watch", #action_select_superhud_bottom, #$000E)

ih_superhud_moatcwj:
    %cm_jsl("Moat CWJ", #action_select_superhud_bottom, #$000F)

ih_superhud_gateglitch:
    %cm_jsl("Gate Glitch", #action_select_superhud_bottom, #$0010)

ih_superhud_tacotank:
    %cm_jsl("Taco Tank", #action_select_superhud_bottom, #$0011)

ih_superhud_robotflush:
    %cm_jsl("Robot Flush", #action_select_superhud_bottom, #$0012)

ih_superhud_elevatorcf:
    %cm_jsl("Elevator Crystal Flash", #action_select_superhud_bottom, #$0013)

ih_superhud_botwooncf:
    %cm_jsl("Botwoon Crystal Flash", #action_select_superhud_bottom, #$0014)

ih_superhud_doorskip:
    %cm_jsl("Parlor Door Skip", #action_select_superhud_bottom, #$0015)

action_select_superhud_bottom:
{
    TYA : STA !sram_superhud_bottom
    JML cm_previous_menu
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
    db #$FF

ih_superhud_middle_submenu:
    %cm_submenu(">Middle HUD List", #SuperHUDMiddleMenu)

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
    dw #$0000
    %cm_header("MIDDLE DISPLAY MODE")

ih_superhud_middle_off:
    %cm_jsl("Disabled", #action_select_superhud_middle, #$0000)

ih_superhud_middle_xfactor:
    %cm_jsl("X-Factor Timer", #action_select_superhud_middle, #$0001)

ih_superhud_middle_shinetimer:
    %cm_jsl("Shinespark Timer", #action_select_superhud_middle, #$0002)

ih_superhud_middle_iframecounter:
    %cm_jsl("I-Frame Counter", #action_select_superhud_middle, #$0003)

ih_superhud_middle_lagcounter:
    %cm_jsl("Lag Counter", #action_select_superhud_middle, #$0004)

ih_superhud_middle_cpuusage:
    %cm_jsl("CPU Usage", #action_select_superhud_middle, #$0005)

ih_superhud_middle_shottimer:
    %cm_jsl("Shot Timer", #action_select_superhud_middle, #$0006)

ih_superhud_middle_chargetimer:
    %cm_jsl("Charge Timer", #action_select_superhud_middle, #$0007)

ih_superhud_middle_dashcounter:
    %cm_jsl("Dash Counter", #action_select_superhud_middle, #$0008)

ih_superhud_middle_cooldowncounter:
    %cm_jsl("Cooldown Timer", #action_select_superhud_middle, #$0009)
    
action_select_superhud_middle:
{
    TYA : STA !sram_superhud_middle
    JML cm_previous_menu
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
    db #$FF

ih_superhud_top_submenu:
    %cm_submenu(">Top HUD List", #SuperHUDTopMenu)

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
    dw #$0000
    %cm_header("TOP DISPLAY MODE")

ih_superhud_top_off:
    %cm_jsl("Disabled", #action_select_superhud_top, #$0000)

ih_superhud_top_xfactor:
    %cm_jsl("X-Factor Timer", #action_select_superhud_top, #$0001)

ih_superhud_top_shinetimer:
    %cm_jsl("Shinespark Timer", #action_select_superhud_top, #$0002)

ih_superhud_top_iframecounter:
    %cm_jsl("I-Frame Counter", #action_select_superhud_top, #$0003)

ih_superhud_top_lagcounter:
    %cm_jsl("Lag Counter", #action_select_superhud_top, #$0004)

ih_superhud_top_cpuusage:
    %cm_jsl("CPU Usage", #action_select_superhud_top, #$0005)

ih_superhud_top_shottimer:
    %cm_jsl("Shot Timer", #action_select_superhud_top, #$0006)

ih_superhud_top_chargetimer:
    %cm_jsl("Charge Timer", #action_select_superhud_top, #$0007)

ih_superhud_top_dashcounter:
    %cm_jsl("Dash Counter", #action_select_superhud_top, #$0008)

ih_superhud_top_cooldowncounter:
    %cm_jsl("Cooldown Timer", #action_select_superhud_top, #$0009)

ih_superhud_enable:
    %cm_jsl("Enable Super HUD", .routine, #$0001)
  .routine
    TYA : STA !sram_display_mode
    DEC : STA !sram_room_strat
    %sfxconfirm()
    RTL
    
action_select_superhud_top:
{
    TYA : STA !sram_superhud_top
    JML cm_previous_menu
}
print pc, " superhud menu end"

ih_door_display_mode:
    dw !ACTION_CHOICE
    dl #!sram_door_display_mode
    dw #$0000
    db #$28, "Door HUD Mode", #$FF
    db #$28, "        OFF", #$FF
    db #$28, "HORIZ SPEED", #$FF
    db #$28, " VERT SPEED", #$FF
    db #$28, "     CHARGE", #$FF
    db #$28, "SHINE TIMER", #$FF
    db #$28, "DASHCOUNTER", #$FF
    db #$28, " X POSITION", #$FF
    db #$28, " Y POSITION", #$FF
    db #$FF

ih_goto_timer_settings:
    %cm_submenu(">Timer Settings", #TimerSettingsMenu)

TimerSettingsMenu:
    dw #ih_room_counter
    dw #ih_lag_counter
    dw #$FFFF
    dw #ih_auto_update_timers
    dw #$FFFF
    dw #ih_reset_seg_after_door
    dw #ih_reset_seg_item_touch
    dw #$0000
    %cm_header("TIMER SETTINGS")

ih_room_counter:
    dw !ACTION_CHOICE
    dl #!sram_frame_counter_mode
    dw #$0000
    db #$28, "Frame Counters", #$FF
    db #$28, "   REALTIME", #$FF
    db #$28, "     INGAME", #$FF
    db #$28, "   SPEEDRUN", #$FF
    db #$FF
!FRAME_COUNTER_ADJUST_REALTIME = #$0002

ih_lag_counter:
    dw !ACTION_CHOICE
    dl #!sram_lag_counter_mode
    dw #$0000
    db #$28, "Transition Lag", #$FF
    db #$28, "       DOOR", #$FF
    db #$28, "       FULL", #$FF
    db #$FF

ih_auto_update_timers:
    %cm_toggle_inverted("Auto Update Timers", !ram_timers_autoupdate, #$0001, #0)

ih_reset_seg_after_door:
    %cm_jsl("Reset Segment in Next Room", #.routine, #$0001)
  .routine
    TYA : STA !ram_reset_segment_later
    %sfxquake()
    RTL

ih_reset_seg_item_touch:
    %cm_jsl("Reset Segment on Item Touch", #ih_reset_seg_after_door_routine, #$8000)

ih_status_icons:
    %cm_toggle("Status Icons", !sram_status_icons, #$0001, #0)

ih_lag:
    %cm_numfield("Artificial Lag", !sram_artificial_lag, 0, 64, 1, 4, #0)

!TOP_DISPLAY_VANILLA = #$0002
ih_top_HUD_mode:
    dw !ACTION_CHOICE
    dl #!sram_top_display_mode
    dw #$0000
    db #$28, "Top-Left Displa", #$FF
    db #$28, "y    ITEM %", #$FF
    db #$28, "y  RESERVES", #$FF
    db #$28, "y   VANILLA", #$FF
    db #$FF

ih_dynamic_frames_held:
    dw !ACTION_DYNAMIC
    dl #!sram_top_display_mode
    dw #ih_goto_frames_held
    dw #ih_goto_frames_held
    dw #$0000
    dw #$0000

ih_goto_frames_held:
    %cm_submenu(">Frames Held Mode", #IHFramesHeldMenu)

IHFramesHeldMenu:
    dw #ih_frames_held_a
    dw #ih_frames_held_b
    dw #ih_frames_held_x
    dw #ih_frames_held_y
    dw #ih_frames_held_l
    dw #ih_frames_held_r
    dw #ih_frames_held_select
    dw #ih_frames_held_start
    dw #ih_frames_held_left
    dw #ih_frames_held_right
    dw #ih_frames_held_up
    dw #ih_frames_held_down
    dw #$0000
    %cm_header("FRAMES HELD MODE")

ih_frames_held_a:
    %cm_toggle_bit("A", !ram_frames_held, !CTRL_A, #0)

ih_frames_held_b:
    %cm_toggle_bit("B", !ram_frames_held, !CTRL_B, #0)

ih_frames_held_x:
    %cm_toggle_bit("X", !ram_frames_held, !CTRL_X, #0)

ih_frames_held_y:
    %cm_toggle_bit("Y", !ram_frames_held, !CTRL_Y, #0)

ih_frames_held_l:
    %cm_toggle_bit("L", !ram_frames_held, !CTRL_L, #0)

ih_frames_held_r:
    %cm_toggle_bit("R", !ram_frames_held, !CTRL_R, #0)

ih_frames_held_select:
    %cm_toggle_bit("Select", !ram_frames_held, !CTRL_SELECT, #0)

ih_frames_held_start:
    %cm_toggle_bit("Start", !ram_frames_held, !IH_INPUT_START, #0)

ih_frames_held_left:
    %cm_toggle_bit("Left", !ram_frames_held, !IH_INPUT_LEFT, #0)

ih_frames_held_right:
    %cm_toggle_bit("Right", !ram_frames_held, !IH_INPUT_RIGHT, #0)

ih_frames_held_up:
    %cm_toggle_bit("Up", !ram_frames_held, !IH_INPUT_UP, #0)

ih_frames_held_down:
    %cm_toggle_bit("Down", !ram_frames_held, !IH_INPUT_DOWN, #0)

!TOP_HUD_RESERVES_INDEX = #$0001
!TOP_HUD_VANILLA_INDEX = #$0002

ih_spacetime_infohud:
    dw !ACTION_CHOICE
    dl #!ram_spacetime_infohud
    dw #$0000
    db #$28, "Spacetime HUD ", #$FF
    db #$28, "    VANILLA", #$FF
    db #$28, "  PRESERVED", #$FF
    db #$FF

ih_ram_watch:
    %cm_jsl(">Customize RAM Watch", #ih_prepare_ram_watch_menu, #RAMWatchMenu)

incsrc ramwatchmenu.asm

print pc, " mainmenu InfoHUD end"
warnpc $85D000 ; IFBmenu.asm
pullpc


; ----------
; Game menu
; ----------

pushpc
org $B3F000
print pc, " mainmenu GameMenu start"

GameMenu:
    dw #game_alternatetext
    dw #game_moonwalk
    dw #game_iconcancel
    dw #game_goto_controls
    dw #$FFFF
    dw #game_fanfare_toggle
    dw #game_music_toggle
    dw #game_bubble_sfx
    dw #game_healthalarm
    dw #$FFFF
    dw #game_goto_debug
    dw #game_goto_cutscenes
    dw #$FFFF
if !FEATURE_VANILLAHUD
else
    dw #game_minimap
endif
    dw #game_clear_minimap
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
    %cm_submenu(">Controller Setting Mode", #ControllerSettingMenu)

game_fanfare_toggle:
    dw !ACTION_CHOICE
    dl #!sram_fanfare_toggle
    dw #$0000
    db #$28, "Fanfare", #$FF
    db #$28, "        OFF", #$FF
    db #$28, "         ON", #$FF
    db #$28, "FORCE MUSIC", #$FF
    db #$FF

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
    RTL

  .resume_music
    LDA !MUSIC_DATA : CLC : ADC #$FF00 : STZ !MUSIC_DATA : JSL !MUSIC_ROUTINE
    LDA !MUSIC_TRACK : STZ !MUSIC_TRACK : JML !MUSIC_ROUTINE

game_bubble_sfx:
    %cm_toggle_bit_inverted("Random Bubble SFX", !sram_random_bubble_sfx, #$0001, #0)

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

game_goto_debug:
    %cm_submenu(">Debug Settings", #DebugMenu)

DebugMenu:
    dw #game_debugmode
    dw #$FFFF
    dw #game_invincibility
    dw #game_infiniteammo
    dw #game_pacifist
    dw #$FFFF
    dw #game_debugbrightness
    dw #game_paldebug
    dw #game_debugplms
    dw #game_debugprojectiles
    dw #game_debugfixscrolloffsets
    dw #game_elevatorfix
    dw #$0000
    %cm_header("DEBUG SETTINGS")

game_debugmode:
    %cm_toggle("Debug Mode", !DEBUG_MODE_FLAG, #$0001, #0)

game_invincibility:
    %cm_toggle_bit("Invincibility", $7E0DE0, #$0007, #0)

game_infiniteammo:
    %cm_toggle_bit("Infinite Ammo", !ram_infinite_ammo, #$0001, .routine)
  .routine
    JML GameLoopExtras

game_pacifist:
    %cm_toggle("Deal Zero Damage", !ram_pacifist, #$0001, #0)

game_debugbrightness:
    %cm_toggle("Debug CPU Brightness", $7E0DF4, #$0001, #0)

game_paldebug:
    %cm_toggle_inverted("PAL Debug Movement", $7E09E6, #$0001, .routine)
  .routine
    LDA !PAL_DEBUG_MOVEMENT : BNE .clearFlag
    LDA !sram_suit_properties : ORA !SUIT_PROPRETIES_PAL_DEBUG_FLAG
    BRA .set
  .clearFlag
    LDA !sram_suit_properties : AND !SUIT_PROPERTIES_MASK
  .set
    STA !sram_suit_properties
    RTL

game_debugplms:
    %cm_toggle_bit_inverted("Pseudo G-Mode", $7E1C23, #$8000, #0)

game_debugprojectiles:
    %cm_toggle_bit("Enable Projectiles", $7E198D, #$8000, #0)

game_debugfixscrolloffsets:
    %cm_toggle_bit("Fix Scroll Offsets", !ram_fix_scroll_offsets, #$0001, #0)

game_elevatorfix:
    %cm_jsl("OoB Elevator Tile Fix", .routine, #0)
  .routine
    STZ !ELEVATOR_PROPERTIES
    %sfxconfirm()
    RTL

game_minimap:
    %cm_toggle("Minimap", !ram_minimap, #$0001, #0)

game_clear_minimap:
    %cm_jsl("Clear Minimap", .clear_minimap, #$0000)

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
    DEX #2 : BPL .clear_minimap_loop
    %sfxquake()
    RTL

game_goto_cutscenes:
    %cm_submenu(">Cutscenes", #CutscenesMenu)


; ---------------
; Cutscenes menu
; ---------------

CutscenesMenu:
    dw #cutscenes_quickboot
    dw #cutscenes_skip_intro
    dw #cutscenes_skip_ceres_arrival
    dw #cutscenes_skip_game_over
    dw #$FFFF
    dw #kraid_skip_intro
    dw #cutscenes_kraid_camera
    dw #phan_skip_intro
    dw #cutscenes_fast_mb
    dw #$FFFF
    dw #cutscenes_fast_bowling
    dw #cutscenes_g4_skip
    dw #$0000
    %cm_header("CUTSCENES")

cutscenes_quickboot:
    %cm_toggle_bit("Boot to Menu", !sram_cutscenes, !CUTSCENE_QUICKBOOT, #0)

cutscenes_skip_intro:
    %cm_toggle_bit("Skip Intro", !sram_cutscenes, !CUTSCENE_SKIP_INTRO, #0)

cutscenes_skip_ceres_arrival:
    %cm_toggle_bit("Skip Ceres Arrival", !sram_cutscenes, !CUTSCENE_SKIP_CERES_ARRIVAL, #0)

cutscenes_skip_game_over:
    %cm_toggle_bit("Skip Game Over", !sram_cutscenes, !CUTSCENE_SKIP_GAMEOVER, #0)

kraid_skip_intro:
    %cm_toggle("Skip Kraid Intro", !sram_kraid_intro, #$0001, #0)

cutscenes_kraid_camera:
    %cm_toggle_bit("Unlock Kraid Death Cam", !sram_cutscenes, !CUTSCENE_KRAID_DEATH_CAMERA, #0)

phan_skip_intro:
    %cm_toggle_bit("Skip Phantoon Intro", !sram_phantoon_intro, #$0001, 0)

cutscenes_fast_mb:
    %cm_toggle_bit("Fast Mother Brain", !sram_cutscenes, !CUTSCENE_FAST_MB, #0)

cutscenes_fast_bowling:
    %cm_toggle_bit("Fast Bowling", !sram_cutscenes, !CUTSCENE_FAST_BOWLING, #0)

cutscenes_g4_skip:
    %cm_toggle_bit("Skip G4", !sram_cutscenes, !CUTSCENE_SKIP_G4, #.routine)
  .routine
    BIT !CUTSCENE_SKIP_G4 : BEQ .off
    LDA !ROOM_ID : CMP #$A5ED : BNE .done
    ; Verify all four G4 bosses killed
    LDA $7ED828 : BIT #$0100 : BEQ .done
    LDA $7ED82C : BIT #$0001 : BEQ .done
    LDA $7ED82A : AND #$0101 : CMP #$0101 : BNE .done
    ; Set Tourian open
    LDA $7ED820 : ORA #$0400 : STA $7ED820
    BRA .done
  .off
    LDA !ROOM_ID : CMP #$A5ED : BNE .done
    LDA $7ED820 : AND #$FBFF : STA $7ED820
  .done
    RTL


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
    %cm_submenu(">Common Controller Layouts", #ControllerCommonMenu)

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
    %cm_jsl("Save to File", .routine, #0)
  .routine
    LDA !GAMEMODE : CMP #$0002 : BEQ .fail
    LDA !CURRENT_SAVE_FILE : BEQ .fileA
    CMP #$0001 : BEQ .fileB
    CMP #$0002 : BEQ .fileC
  .fail
    %sfxfail()
    RTL

  .fileA
    LDX #$0020 : BRA .save
  .fileB
    LDX #$067C : BRA .save
  .fileC
    LDX #$0CD8
  .save
    LDA.w !IH_INPUT_SHOT : STA $700000,X : INX #2
    LDA.w !IH_INPUT_JUMP : STA $700000,X : INX #2
    LDA.w !IH_INPUT_RUN : STA $700000,X : INX #2
    LDA.w !IH_INPUT_ITEM_CANCEL : STA $700000,X : INX #2
    LDA.w !IH_INPUT_ITEM_SELECT : STA $700000,X : INX #2
    LDA.w !IH_INPUT_ANGLE_UP : STA $700000,X : INX #2
    LDA.w !IH_INPUT_ANGLE_DOWN : STA $700000,X
    %sfxsave()
    RTL

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
    %cm_jsl("A", action_assign_input, !CTRL_A)

controls_assign_B:
    %cm_jsl("B", action_assign_input, !CTRL_B)

controls_assign_X:
    %cm_jsl("X", action_assign_input, !CTRL_X)

controls_assign_Y:
    %cm_jsl("Y", action_assign_input, !CTRL_Y)

controls_assign_Select:
    %cm_jsl("Select", action_assign_input, !CTRL_SELECT)

controls_assign_L:
    %cm_jsl("L", action_assign_input, !CTRL_L)

controls_assign_R:
    %cm_jsl("R", action_assign_input, !CTRL_R)

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

+   JML cm_previous_menu
}

check_duplicate_inputs:
{
    ; ram_cm_ctrl_assign = word address of input being assigned
    ; ram_cm_ctrl_swap = previous input bitmask being moved
    ; X / $C2 = word address of new input
    ; Y / $C4 = new input bitmask

    LDA #$09B2 : CMP $C2 : BEQ .check_jump      ; check if we just assigned shot
    LDA $09B2 : BEQ +                           ; check if shot is unassigned
    CMP $C4 : BNE .check_jump                   ; skip to check_jump if not a duplicate assignment
+   JMP .shot                                   ; swap with shot

  .check_jump
    LDA #$09B4 : CMP $C2 : BEQ .check_dash
    LDA $09B4 : BEQ +
    CMP $C4 : BNE .check_dash
+   JMP .jump

  .check_dash
    LDA #$09B6 : CMP $C2 : BEQ .check_cancel
    LDA $09B6 : BEQ +
    CMP $C4 : BNE .check_cancel
+   JMP .dash

  .check_cancel
    LDA #$09B8 : CMP $C2 : BEQ .check_select
    LDA $09B8 : BEQ +
    CMP $C4 : BNE .check_select
+   JMP .cancel

  .check_select
    LDA #$09BA : CMP $C2 : BEQ .check_up
    LDA $09BA : BEQ +
    CMP $C4 : BNE .check_up
+   JMP .select

  .check_up
    LDA #$09BE : CMP $C2 : BEQ .check_down
    LDA $09BE : BEQ +
    CMP $C4 : BNE .check_down
+   JMP .up

  .check_down
    LDA #$09BC : CMP $C2 : BEQ .not_detected
    LDA $09BC : BEQ +
    CMP $C4 : BNE .not_detected
+   JMP .down

  .not_detected
    LDA #$FFFF
    RTL

  .shot
    LDA !ram_cm_ctrl_swap : AND #$0030 : BEQ +  ; check if old input is L or R
    LDA #$0000 : STA $09B2                      ; unassign input
    RTL
+   LDA !ram_cm_ctrl_swap : STA $09B2           ; input is safe to be assigned
    RTL

  .jump
    LDA !ram_cm_ctrl_swap : AND #$0030 : BEQ +
    LDA #$0000 : STA $09B4
    RTL
+   LDA !ram_cm_ctrl_swap : STA $09B4
    RTL

  .dash
    LDA !ram_cm_ctrl_swap : AND #$0030 : BEQ +
    LDA #$0000 : STA $09B6
    RTL
+   LDA !ram_cm_ctrl_swap : STA $09B6
    RTL

  .cancel
    LDA !ram_cm_ctrl_swap : AND #$0030 : BEQ +
    LDA #$0000 : STA $09B8
    RTL
+   LDA !ram_cm_ctrl_swap : STA $09B8
    RTL

  .select
    LDA !ram_cm_ctrl_swap : AND #$0030 : BEQ +
    LDA #$0000 : STA $09BA
    RTL
+   LDA !ram_cm_ctrl_swap : STA $09BA
    RTL

  .up
    LDA !ram_cm_ctrl_swap : AND #$0030 : BEQ .unbind_up  ; check if input is L or R, unbind if not
    LDA !ram_cm_ctrl_swap : STA $09BE                    ; safe to assign input
    CMP $09BC : BEQ .swap_down                           ; check if input matches angle down
    RTL

  .unbind_up
    STA $09BE               ; unassign up
    RTL

  .swap_down
    CMP #$0020 : BNE +      ; check if angle up is assigned to L
    LDA #$0010 : STA $09BC  ; assign R to angle down
    RTL
+   LDA #$0020 : STA $09BC  ; assign L to angle down
    RTL

  .down
    LDA !ram_cm_ctrl_swap : AND #$0030 : BEQ .unbind_down
    LDA !ram_cm_ctrl_swap : STA $09BC
    CMP $09BE : BEQ .swap_up
    RTL

  .unbind_down
    STA $09BC               ; unassign down
    RTL

  .swap_up
    CMP #$0020 : BNE +
    LDA #$0010 : STA $09BE
    RTL
+   LDA #$0020 : STA $09BE
    RTL
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
    %cm_jsl("Default (D1)", #action_set_common_controls, #$0000)

controls_common_d2:
    %cm_jsl("Select+Cancel Swap (D2)", #action_set_common_controls, #$000E)

controls_common_d3:
    %cm_jsl("D2 + Shot+Select Swap (D3)", #action_set_common_controls, #$001C)

controls_common_d4:
    %cm_jsl("MMX Style (D4)", #action_set_common_controls, #$002A)

controls_common_d5:
    %cm_jsl("SMW Style (D5)", #action_set_common_controls, #$0038)

action_set_common_controls:
{
    TYX
    LDA.l ControllerLayoutTable,X : STA.w !IH_INPUT_SHOT
    LDA.l ControllerLayoutTable+2,X : STA.w !IH_INPUT_JUMP
    LDA.l ControllerLayoutTable+4,X : STA.w !IH_INPUT_RUN
    LDA.l ControllerLayoutTable+6,X : STA.w !IH_INPUT_ITEM_CANCEL
    LDA.l ControllerLayoutTable+8,X : STA.w !IH_INPUT_ITEM_SELECT
    LDA.l ControllerLayoutTable+10,X : STA.w !IH_INPUT_ANGLE_DOWN
    LDA.l ControllerLayoutTable+12,X : STA.w !IH_INPUT_ANGLE_UP
    %sfxconfirm()
    JML cm_previous_menu
}

print pc, " mainmenu GameMenu start"
pullpc


; ----------
; RNG menu
; ----------

RngMenu:
    dw #rng_goto_phanmenu
    dw #$FFFF
    dw #rng_botwoon_first
    dw #rng_botwoon_hidden
    dw #rng_botwoon_second
    dw #rng_botwoon_spit
    dw #$FFFF
    dw #rng_draygon_rng_right
    dw #rng_draygon_rng_left
    dw #$FFFF
    dw #rng_crocomire_rng
    dw #$FFFF
    dw #rng_kraid_claw_rng
    dw #rng_kraid_wait_rng
    dw #$FFFF
    dw #rng_baby_rng
    dw #$0000
    %cm_header("BOSS RNG CONTROL")

rng_goto_phanmenu:
    %cm_jsl(">Phantoon Menu", ih_prepare_phantoon_menu, #PhantoonMenu)

ih_prepare_phantoon_menu:
{
    LDA !ram_phantoon_rng_inverted : PHA
    JSL phan_set_phan_first_phase
    JSL phan_set_phan_second_phase
    PLA : STA !ram_phantoon_rng_inverted
    %submenu_jump()
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
    dw #phan_flamepattern
    dw #phan_next_flamepattern
    dw #phan_flame_direction
    dw #phan_always_visible
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
    db #$28, "   NO SLOWS", #$FF
    db #$28, "     CUSTOM", #$FF
    db #$FF
  .routine
    ASL : TAX
    LDA.l PhantoonPhaseTable,X : STA !ram_phantoon_rng_round_1
    RTL

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
    db #$28, "   NO SLOWS", #$FF
    db #$28, "     CUSTOM", #$FF
    db #$FF
  .routine
    ASL : TAX
    LDA.l PhantoonPhaseTable2,X : STA !ram_phantoon_rng_round_2 : BEQ +
    TXA : BEQ +
    LDA #$0002
+   STA !ram_phantoon_rng_inverted
    RTL

PhantoonPhaseTable:
    dw #$003F, #$0020, #$0008, #$0002, #$0010, #$0004, #$0001
    dw #$0030, #$000C, #$0003, #$002A, #$0015, #$003C

PhantoonPhaseTable2:
    dw #$003F, #$0020, #$0008, #$0002, #$0010, #$0004, #$0001
    dw #$0030, #$000C, #$0003, #$002A, #$0015, #$0024

phan_set_phan_first_phase:
{
    LDX #$0000
    LDA !ram_phantoon_rng_round_1 : BEQ +

-   CMP.l PhantoonPhaseTable,X : BEQ +
    INX #2 : CPX #$001A : BNE -

+   TXA : LSR : STA !ram_cm_phan_first_phase
    RTL
}

phan_set_phan_second_phase:
{
    LDX #$0000
    LDA !ram_phantoon_rng_round_2 : BEQ +

-   CMP.l PhantoonPhaseTable,X : BEQ +
    INX #2 : CPX #$001A : BNE -

+   TXA : LSR : STA !ram_cm_phan_second_phase
    BEQ +
    TXA : BEQ +
    LDA #$0002
+   STA !ram_phantoon_rng_inverted
    RTL
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

phan_flame_direction:
    dw !ACTION_CHOICE
    dl #!ram_phantoon_flame_direction
    dw #$0000
    db #$28, "Flame Direction", #$FF
    db #$28, "     RANDOM", #$FF
    db #$28, "       LEFT", #$FF
    db #$28, "      RIGHT", #$FF
    db #$FF

phan_always_visible:
    %cm_toggle("Always Visible", !ram_phantoon_always_visible, #$0001, #0)


rng_botwoon_first:
    dw !ACTION_CHOICE
    dl #!ram_cm_botwoon_first
    dw #.routine
    db #$28, "Botwoon First", #$FF
    db #$28, "     RANDOM", #$FF
    db #$28, "  LB BOTTOM", #$FF
    db #$28, "  LT    TOP", #$FF
    db #$28, "  LR  RIGHT", #$FF
    db #$28, "  LL   LEFT", #$FF
    db #$FF
  .routine
    LDA !ram_cm_botwoon_first : BEQ .random
    ; possible values are $01, $09, $11, $19
    ; the 1s bit will be dropped, used here for convenience
    DEC : ASL #3 : INC
    STA !ram_botwoon_first : STA !ram_botwoon_rng
    RTL
  .random
    STA !ram_botwoon_first
    LDA !ram_botwoon_second : BNE +
    LDA !ram_botwoon_hidden
+   STA !ram_botwoon_rng
    RTL

rng_botwoon_hidden:
    dw !ACTION_CHOICE
    dl #!ram_cm_botwoon_hidden
    dw #.routine
    db #$28, "Botwoon Hidden", #$FF
    db #$28, "     RANDOM", #$FF
    db #$28, "LB BL TL RL", #$FF
    db #$28, "LT BT TB RB", #$FF
    db #$28, "LR BR TR RT", #$FF
    db #$FF
  .routine
    LDA !ram_cm_botwoon_hidden : BEQ .random
    ; possible values are $01, $09, $11
    ; the 1s bit will be dropped, used here for convenience
    DEC : ASL #3 : INC
    STA !ram_botwoon_hidden : STA !ram_botwoon_rng
    RTL
  .random
    STA !ram_botwoon_hidden
    LDA !ram_botwoon_first : BNE +
    LDA !ram_botwoon_second
+   STA !ram_botwoon_rng
    RTL

rng_botwoon_second:
    dw !ACTION_CHOICE
    dl #!ram_cm_botwoon_second
    dw #.routine
    db #$28, "Botwoon Second", #$FF
    db #$28, "     RANDOM", #$FF
    db #$28, "LB BL TL RL", #$FF
    db #$28, "LT BT TB RB", #$FF
    db #$28, "LR BR TR RT", #$FF
    db #$28, "LL BB TT RR", #$FF
    db #$FF
  .routine
    LDA !ram_cm_botwoon_second : BEQ .random
    ; possible values are $01, $09, $11, $19
    ; the 1s bit will be dropped, used here for convenience
    DEC : ASL #3 : INC
    STA !ram_botwoon_second : STA !ram_botwoon_rng
    RTL
  .random
    STA !ram_botwoon_second
    LDA !ram_botwoon_first : BNE +
    LDA !ram_botwoon_hidden
+   STA !ram_botwoon_rng
    RTL

rng_botwoon_spit:
    dw !ACTION_CHOICE
    dl #!ram_cm_botwoon_spit
    dw #.routine
    db #$28, "Botwoon Spit", #$FF
    db #$28, "     RANDOM", #$FF
    db #$28, " NEVER SPIT", #$FF
    db #$28, "ALWAYS SPIT", #$FF
    db #$FF
  .routine
    ; 0-4 = no spit, 6-E = spit
    LDA !ram_cm_botwoon_spit : ASL #2 : STA !ram_botwoon_spit
    RTL

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

rng_kraid_claw_rng:
    dw !ACTION_CHOICE
    dl #!ram_kraid_claw_rng
    dw #$0000
    db #$28, "Kraid Claw RNG", #$FF
    db #$28, "     RANDOM", #$FF
    db #$28, "      LAGGY", #$FF
    db #$28, "    LAGGIER", #$FF
    db #$FF

rng_kraid_wait_rng:
    dw !ACTION_CHOICE
    dl #!ram_kraid_wait_rng
    dw #$0000
    db #$28, "Kraid Wait RNG", #$FF
    db #$28, "     RANDOM", #$FF
    db #$28, "         64", #$FF
    db #$28, "        128", #$FF
    db #$28, "        192", #$FF
    db #$28, "        256", #$FF
    db #$28, "        320", #$FF
    db #$28, "        384", #$FF
    db #$28, "        448", #$FF
    db #$FF

rng_baby_rng:
    dw !ACTION_CHOICE
    dl #!ram_baby_rng
    dw #$0000
    db #$28, "Baby Skip RNG", #$FF
    db #$28, "     RANDOM", #$FF
    db #$28, "   NO LUNGE", #$FF
    db #$28, "      LUNGE", #$FF
    db #$FF


; --------------
; Savestate Menu
; --------------

SavestateMenu:
    dw #save_rerandomize
    dw #save_freeze
    dw #save_middoorsave
    dw #save_alwayssave
if !FEATURE_DEV
    dw #$FFFF
    dw #save_delete
endif
    dw #$0000
    %cm_header("SAVESTATE SETTINGS")

save_rerandomize:
    %cm_toggle("Rerandomize", !sram_rerandomize, #$0001, #0)

save_freeze:
    %cm_toggle("Freeze on Load State", !ram_freeze_on_load, #$0001, #0)

save_middoorsave:
    %cm_toggle("Auto-Save Mid-Door", !ram_auto_save_state, #$0001, #0)

save_alwayssave:
    %cm_toggle("Auto-Save Every Door", !ram_auto_save_state+1, #$80, #0)

save_delete:
    %cm_jsl("DEV Delete Savestate", .routine, #$DEAD)
  .routine
    TYA : STA !SRAM_SAVED_STATE
    %sfxconfirm()
    RTL


; -------------
; Slowdown Mode
; -------------

SlowdownMenu:
    dw #slowdown_mode
    dw #slowdown_frames
    dw #$0000
    %cm_header("SLOWDOWN MODE")
    %cm_footer("PAUSE IS STILL WIP")

slowdown_mode:
    dw !ACTION_CHOICE
    dl #!ram_cm_slowdown_mode
    dw #$0000
    db #$28, "Slowdown Mode", #$FF
    db #$28, "        OFF", #$FF
    db #$28, "      PAUSE", #$FF
    db #$28, "   SLOWDOWN", #$FF
    db #$FF

slowdown_frames:
    %cm_numfield("Slowdown (Lag) Frames", !ram_cm_slowdown_frames, 0, 120, 1, 4, #0)


; ----------
; Ctrl Menu
; ----------

CtrlMenu:
    dw #ctrl_menu
if !FEATURE_SD2SNES
    dw #ctrl_save_state
    dw #ctrl_load_state
    dw #ctrl_auto_save_state
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
    dw #ctrl_force_stand
if !FEATURE_SD2SNES
else
    dw #ctrl_randomize_rng
endif
if !FEATURE_VANILLAHUD
else
    dw #ctrl_reveal_damage
    dw #ctrl_update_timers
endif
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

ctrl_auto_save_state:
    %cm_ctrl_shortcut("Auto Save State", !sram_ctrl_auto_save_state)

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
    %cm_jsl("Clear Shortcuts", .routine, #$0000)
  .routine
    TYA
    STA !ram_game_mode_extras
    STA !sram_ctrl_save_state
    STA !sram_ctrl_load_state
    STA !sram_ctrl_auto_save_state
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
    RTL

ctrl_reset_defaults:
    %cm_jsl("Reset to Defaults", .routine, #$0000)
  .routine
    %sfxquake()
    JSL init_sram_controller_shortcuts
    JML validate_sram_for_savestates

init_wram_based_on_sram:
{
    JSL GameModeExtras
    JML validate_sram_for_savestates
}

validate_sram_for_savestates:
{
    ; check if required SRAM range is valid
    ; writes to SRAM will mirror in other banks if not valid
if !FEATURE_TINYSTATES
    LDA $737FFE : INC : STA $707FFE
    CMP $737FFE : BEQ .double_check
else
    LDA $777FFE : INC : STA $707FFE
    CMP $777FFE : BEQ .double_check
endif
    RTL

  .double_check
    ; double check
if !FEATURE_TINYSTATES
    LDA $732FFE : INC : STA $702FFE
    CMP $732FFE : BEQ .fail
else
    LDA $772FFE : INC : STA $702FFE
    CMP $772FFE : BEQ .fail
endif
    RTL

  .fail
    ; disable savestate controls
    LDA #$0000
    STA !sram_ctrl_save_state : STA !sram_ctrl_load_state
    RTL
}


; ------------------
; Menu Customization
; ------------------

incsrc customizemenu.asm



; ----------
; Firebat Menu   IFBMenu:
; ----------

incsrc IFBmenu.asm

