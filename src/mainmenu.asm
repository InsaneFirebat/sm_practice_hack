; --------
; Helpers
; --------

macro cm_header(title)
    table ../resources/header.tbl
    db #$28, "<title>", #$FF
    table ../resources/normal.tbl
endmacro

macro cm_version_header(title, major, minor, build, rev_1, rev_2)
    table ../resources/header.tbl
if !VERSION_REV_1
    db #$28, "<title> <major>.<minor>.<build>.<rev_1><rev_2>", #$FF
else
if !VERSION_REV_2
    db #$28, "<title> <major>.<minor>.<build>.<rev_2>", #$FF
else
    db #$28, "<title> <major>.<minor>.<build>", #$FF
endif
endif
    table ../resources/normal.tbl
endmacro

macro cm_numfield(title, addr, start, end, increment, jsrtarget)
    dw !ACTION_NUMFIELD
    dl <addr>
    db <start>, <end>, <increment>
    dw <jsrtarget>
    db #$28, "<title>", #$FF
endmacro

macro cm_numfield_word(title, addr, start, end, increment, jsrtarget)
    dw !ACTION_NUMFIELD_WORD
    dl <addr>
    dw <start>, <end>, <increment>
    dw <jsrtarget>
    db #$28, "<title>", #$FF
endmacro

macro cm_numfield_hex(title, addr, start, end, increment, jsrtarget)
    dw !ACTION_NUMFIELD_HEX
    dl <addr>
    db <start>, <end>, <increment>
    dw <jsrtarget>
    db #$28, "<title>", #$FF
endmacro

macro cm_numfield_color(title, addr, jsrtarget)
    dw !ACTION_NUMFIELD_COLOR
    dl <addr>
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

action_submenu:
{
    ; Increment stack pointer by 2, then store current menu
    LDA !ram_cm_stack_index : INC #2 : STA !ram_cm_stack_index : TAX
    TYA : STA !ram_cm_menu_stack,X
    LDA #$0000 : STA !ram_cm_cursor_stack,X

    LDA #!SOUND_MENU_MOVE : JSL $80903F
    JSR cm_calculate_max
    JSR cm_draw

    RTS
}

action_presets_submenu:
{
    ; Increment stack pointer by 2, then store current menu    
    LDA !ram_cm_stack_index : INC #2 : STA !ram_cm_stack_index : TAX
    LDA !sram_preset_category : ASL : TAY
    
    LDA.w preset_category_submenus,Y : STA !ram_cm_menu_stack,X
    LDA.w preset_category_banks,Y : STA !ram_cm_menu_bank
    
    LDA #$0000 : STA !ram_cm_cursor_stack,X

    LDA #!SOUND_MENU_MOVE : JSL $80903F
    JSR cm_calculate_max
    JSR cm_draw

    RTS
}

preset_category_submenus:
{
    dw #PresetsMenuPrkd
    dw #$0000
}

preset_category_banks:
{
    dw #PresetsMenuPrkd>>16
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
    dw #mm_goto_infohud
    dw #mm_goto_gamemenu
    dw #mm_goto_sprites
;    dw #mm_goto_rngmenu
    dw #mm_goto_ctrlsmenu
    dw #$0000
    %cm_version_header("CONTAINMENT CHAMBER", !VERSION_MAJOR, !VERSION_MINOR, !VERSION_BUILD, !VERSION_REV_1, !VERSION_REV_2)

mm_goto_equipment:
    %cm_submenu("Equipment", #EquipmentMenu)

mm_goto_presets:
    %cm_jsr("Category Presets", #action_presets_submenu, #$0000)

mm_goto_presets_menu:
    %cm_submenu("Preset Options", #PresetsMenu)

mm_goto_teleport:
    %cm_submenu("Teleport", #TeleportMenu)

mm_goto_events:
    %cm_submenu("Events", #EventsMenu)

mm_goto_misc:
    %cm_submenu("Misc", #MiscMenu)

mm_goto_infohud:
    %cm_submenu("Infohud", #InfoHudMenu)

mm_goto_gamemenu:
    %cm_submenu("Game", #GameMenu)

mm_goto_sprites:
    %cm_submenu("Sprite Features", #SpritesMenu)

mm_goto_rngmenu:
    %cm_submenu("RNG Control", #RngMenu)

mm_goto_ctrlsmenu:
    %cm_submenu("Controller Shortcuts", #CtrlMenu)


; -------------
; Presets menu
; -------------

PresetsMenu:
    dw #presets_goto_select_preset_category
    dw #presets_current
    dw #presets_custom_preset_slot
    dw #presets_save_custom_preset
    dw #presets_load_custom_preset
    dw #$0000
    %cm_header("PRESET OPTIONS MENU")

presets_goto_select_preset_category:
    %cm_submenu("Select Preset Category", #SelectPresetCategoryMenu)

presets_custom_preset_slot:
    %cm_numfield("Custom Preset Slot", !sram_custom_preset_slot, 0, 39, 1, #0) ; update total slots in gamemode.asm

presets_save_custom_preset:
    %cm_jsr("Save Custom Preset", #action_save_custom_preset, #$0000)

presets_load_custom_preset:
    %cm_jsr("Load Custom Preset", #action_load_custom_preset, #$0000)

SelectPresetCategoryMenu:
    dw #presets_current
    dw #precat_prkd
    dw #$0000
    %cm_header("SELECT PRESET CATEGORY")

presets_current:
    dw !ACTION_CHOICE
    dl #!sram_preset_category
    dw #$0000
    db #$28, "CURRENT PRESET", #$FF
        db #$28, "PLACEHOLDER", #$FF
    db #$FF

precat_prkd:
    %cm_jsr("Any% PRKD (Placeholder)", #action_select_preset_category, #$0000)

action_select_preset_category:
{
    TYA : STA !sram_preset_category
    JSR cm_go_back
    JSR cm_calculate_max
    RTS
}

action_save_custom_preset:
{
    JSL custom_preset_save
    LDA #$0001 : STA !ram_cm_leave
    LDA !SOUND_MENU_MOVE : JSL !SFX_LIB1
    RTS
}

action_load_custom_preset:
{
    ; check if slot is populated first
    LDA !sram_custom_preset_slot
    ASL : XBA : TAX
    LDA $F03000,X : CMP #$5AFE : BEQ .safe
    LDA #!SOUND_MENU_FAIL : JSL !SFX_LIB1
    RTS

  .safe
    STA !ram_custom_preset
    LDA #$0001 : STA !ram_cm_leave
    RTS
}

LoadRandomPreset:
{
    PHY : PHX
    JSL $808111 : STA $12     ; random number

    LDA #$00B8 : STA $18      ; this routine lives in bank B8
    LDA !sram_preset_category : ASL : TAY
    LDA #preset_category_submenus : STA $16
    LDA [$16],Y : TAX         ; preset category submenu table
    LDA #preset_category_banks : STA $16
    LDA [$16],Y : STA $18     ; preset category menu bank

    STX $16 : LDY #$0000
  .toploop
    INY #2
    LDA [$16],Y : BNE .toploop
    TYA : LSR : TAY           ; Y = size of preset category submenu table

    LDA $12 : XBA : AND #$00FF : STA $4204
    %a8()
    STY $4206                 ; divide top half of random number by Y
    %a16()
    PEA $0000 : PLA
    LDA $4216 : ASL : TAY     ; randomly selected subcategory
    LDA [$16],Y : STA $16     ; increment four bytes to get the subcategory table
    LDY #$0004 : LDA [$16],Y : STA $16

    LDY #$0000
  .subloop
    INY #2
    LDA [$16],Y : BNE .subloop
    TYA : LSR : TAY           ; Y = size of subcategory table

    LDA $12 : AND #$00FF : STA $4204
    %a8()
    STY $4206                 ; divide bottom half of random number by Y
    %a16()
    PEA $0000 : PLA
    LDA $4216 : ASL : TAY     ; randomly selected preset
    LDA [$16],Y : STA $16     ; increment four bytes to get the data
    LDY #$0004 : LDA [$16],Y

    STA !ram_load_preset

    PLX : PLY
    RTL
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
    dw #eq_currentenergy
    dw #eq_setetanks
    dw #eq_currentreserves
    dw #eq_setreserves
    dw #eq_setmissiles
    dw #eq_setsupers
    dw #eq_setpbs
    dw #$0000
    %cm_header("EQUIPMENT")

eq_refill:
    %cm_jsr("Refill", .refill, #$0000)

  .refill
    LDA $7E09C4 : STA $7E09C2 ; health
    LDA $7E09C8 : STA $7E09C6 ; missiles
    LDA $7E09CC : STA $7E09CA ; supers
    LDA $7E09D0 : STA $7E09CE ; pbs
    LDA $7E09D4 : STA $7E09D6 ; reserves
    LDA #!SOUND_MENU_JSR : JSL $80903F
    RTS

eq_toggle_category:
    %cm_submenu("Toggle Category", #ToggleCategoryMenu)

eq_goto_toggleitems:
    %cm_submenu("Toggle Items", #ToggleItemsMenu)

eq_goto_togglebeams:
    %cm_submenu("Toggle Beams", #ToggleBeamsMenu)

eq_currentenergy:
    %cm_numfield_word("Current Energy", $7E09C2, 0, 2100, 1, #0)

eq_setetanks:
    %cm_numfield("Energy Tanks", !ram_cm_etanks, 0, 21, 1, .routine)
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
        STA $09C4 : STA $09C2
        RTS

eq_currentreserves:
    %cm_numfield_word("Current Reserves", $7E09D6, 0, 700, 1, #0)

eq_setreserves:
    %cm_numfield("Reserve Tanks", !ram_cm_reserve, 0, 7, 1, .routine)
    .routine
        TAX
        LDA #$0000
      .loop
        DEX : BMI .endloop
        CLC : ADC #$0064
        BRA .loop
      .endloop
        STA $09D6 : STA $09D4
        RTS

eq_setmissiles:
    %cm_numfield_word("Missiles", $7E09C8, 0, 325, 5, .routine)
    .routine
        LDA $09C8 : STA $09C6 ; missiles
        RTS

eq_setsupers:
    %cm_numfield("Super Missiles", $7E09CC, 0, 65, 5, .routine)
    .routine
        LDA $09CC : STA $09CA ; supers
        RTS

eq_setpbs:
    %cm_numfield("Power Bombs", $7E09D0, 0, 65, 5, .routine)
    .routine
        LDA $09D0 : STA $09CE ; pbs
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
    dw #cat_gt_code
    dw #cat_rbo
    dw #cat_any_glitched
    dw #cat_nothing
    dw #$0000
    %cm_header("TOGGLE CATEGORY")

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

cat_rbo:
    %cm_jsr("RBO", action_category, #$0006)

cat_any_glitched:
    %cm_jsr("Any% glitched", action_category, #$0007)

cat_nothing:
    %cm_jsr("Nothing", action_category, #$0008)


action_category:
{
    TYA : ASL #4 : TAX

    ; Items
    LDA .table,X : STA $7E09A4 : STA $7E09A2 : INX #2

    ; Beams
    LDA .table,X : STA $7E09A8 : TAY
    AND #$000C : CMP #$000C : BEQ .murderBeam
    TYA : STA $7E09A6 : INX #2 : BRA +

  .murderBeam
    TYA : AND #$100B : STA $7E09A6 : INX #2

    ; Health
+   LDA .table,X : STA $7E09C2 : STA $7E09C4 : INX #2

    ; Missiles
    LDA .table,X : STA $7E09C6 : STA $7E09C8 : INX #2

    ; Supers
    LDA .table,X : STA $7E09CA : STA $7E09CC : INX #2

    ; PBs
    LDA .table,X : STA $7E09CE : STA $7E09D0 : INX #2

    ; Reserves
    LDA .table,X : STA $7E09D4 : STA $7E09D6 : INX #2

    JSR cm_set_etanks_and_reserve
    LDA #!SOUND_MENU_JSR : JSL $80903F
    RTS

  .table
    ;  Items,  Beams,  Health, Miss,   Supers, PBs,    Reserv, Dummy
    dw #$F32F, #$100F, #$05DB, #$00E6, #$0032, #$0032, #$0190, #$0000        ; 100%
    dw #$3125, #$1007, #$018F, #$000F, #$000A, #$0005, #$0000, #$0000        ; any% new
    dw #$3325, #$100B, #$018F, #$000F, #$000A, #$0005, #$0000, #$0000        ; any% old
    dw #$1025, #$1002, #$018F, #$000A, #$000A, #$0005, #$0000, #$0000        ; 14% ice
    dw #$3025, #$1000, #$018F, #$000A, #$000A, #$0005, #$0000, #$0000        ; 14% speed
    dw #$F32F, #$100F, #$02BC, #$0064, #$0014, #$0014, #$012C, #$0000        ; gt code
    dw #$710C, #$1001, #$031F, #$001E, #$0019, #$0014, #$0064, #$0000        ; rbo
    dw #$9004, #$0000, #$00C7, #$0005, #$0005, #$0005, #$0000, #$0000        ; any% glitched
    dw #$0000, #$0000, #$0063, #$0000, #$0000, #$0000, #$0000, #$0000        ; nothing
}


; ------------------
; Toggle Items menu
; ------------------

ToggleItemsMenu:
    dw #ti_variasuit
    dw #ti_gravitysuit
    dw #ti_morphball
    dw #ti_bomb
    dw #ti_springball
    dw #ti_screwattack
    dw #ti_hijumpboots
    dw #ti_spacejump
    dw #ti_speedbooster
    dw #ti_grapple
    dw #ti_xray
    dw #$0000
    %cm_header("TOGGLE ITEMS")

ti_variasuit:
    %cm_toggle_bit("Varia Suit", $7E09A4, #$0001, #action_equip_collected_items)

ti_gravitysuit:
    %cm_toggle_bit("Gravity Suit", $7E09A4, #$0020, #action_equip_collected_items)

ti_morphball:
    %cm_toggle_bit("Morphing Ball", $7E09A4, #$0004, #action_equip_collected_items)

ti_bomb:
    %cm_toggle_bit("Bombs", $7E09A4, #$1000, #action_equip_collected_items)

ti_springball:
    %cm_toggle_bit("Spring Ball", $7E09A4, #$0002, #action_equip_collected_items)

ti_screwattack:
    %cm_toggle_bit("Screw Attack", $7E09A4, #$0008, #action_equip_collected_items)

ti_hijumpboots:
    %cm_toggle_bit("Hi Jump Boots", $7E09A4, #$0100, #action_equip_collected_items)

ti_spacejump:
    %cm_toggle_bit("Space Jump", $7E09A4, #$0200, #action_equip_collected_items)

ti_speedbooster:
    %cm_toggle_bit("Speed Booster", $7E09A4, #$2000, #action_equip_collected_items)

ti_grapple:
    %cm_toggle_bit("Grapple", $7E09A2, #$4000, .routine)
    .routine
        LDA $09A4 : EOR #$4000 : STA $09A4
        RTS

ti_xray:
    %cm_toggle_bit("X-Ray", $7E09A2, #$8000, .routine)
    .routine
        LDA $09A4 : EOR #$8000 : STA $09A4
        RTS

action_equip_collected_items:
{
    LDA $09A4 : STA $09A6
    RTS
}


; -----------------
; Toggle Beams menu
; -----------------

ToggleBeamsMenu:
    dw tb_chargebeam
    dw tb_icebeam
    dw tb_wavebeam
    dw tb_spazerbeam
    dw tb_plasmabeam
    dw tb_glitchedbeams
    dw #$0000
    %cm_header("TOGGLE BEAMS")

tb_chargebeam:
    %cm_toggle_bit("Charge", $7E09A8, #$1000, #action_equip_collected_beams)

tb_icebeam:
    %cm_toggle_bit("Ice", $7E09A8, #$0002, #action_equip_collected_beams)

tb_wavebeam:
    %cm_toggle_bit("Wave", $7E09A8, #$0001, #action_equip_collected_beams)

tb_spazerbeam:
    %cm_toggle_bit("Spazer", $7E09A8, #$0004, #action_equip_collected_beams)

tb_plasmabeam:
    %cm_toggle_bit("Plasma", $7E09A8, #$0008, #action_equip_collected_beams)

tb_glitchedbeams:
    %cm_submenu("Glitched Beams", #GlitchedBeamsMenu)

action_equip_collected_beams:
{
    LDA $09A8 : STA $09A6 : TAY
    AND #$000C : CMP #$000C : BEQ .murderBeam
    TYA : STA $7E09A6
    RTS

  .murderBeam
    TYA : AND #$100B : STA $7E09A6

  .done
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
    %cm_header("GLITCHED BEAMS")

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
    STA $09A6 : STA $09A8
    LDA #$0042 : JSL !SFX_LIB1 ; unlabeled, song dependent sound
    RTS
}


; ---------------
; Teleport menu
; ---------------

TeleportMenu:
    dw #tel_000
    dw #tel_001
    dw #tel_002
    dw #tel_400
    dw #tel_402
    dw #tel_401
    dw #tel_500
    dw #tel_501
    dw #tel_412
    dw #tel_200
    dw #tel_00B
    dw #tel_209
    dw #tel_goto_debug
    dw #$0000
    %cm_header("TELEPOT TO SAVE STATION")

tel_000:
    %cm_jsr("ZERO", #action_teleport, #$0000)

tel_001:
    %cm_jsr("FOUR", #action_teleport, #$0001)

tel_002:
    %cm_jsr("SEVEN", #action_teleport, #$0002)

tel_00B:
    %cm_jsr("DEBUG - Charge Beam", #action_teleport, #$000B)

tel_200:
    %cm_jsr("Norfair ????", #action_teleport, #$0200)

tel_209:
    %cm_jsr("DEBUG - Kraid!", #action_teleport, #$0209)

tel_400:
    %cm_jsr("BEE", #action_teleport, #$0400)

tel_401:
    %cm_jsr("EFF", #action_teleport, #$0401)

tel_402:
    %cm_jsr("DEE", #action_teleport, #$0402)

tel_412:
    %cm_jsr("DEBUG - GEE", #action_teleport, #$0412)

tel_500:
    %cm_jsr("JAY", #action_teleport, #$0500)

tel_501:
    %cm_jsr("EMM", #action_teleport, #$0501)

tel_goto_debug:
    %cm_submenu("Debug Teleports", #DebugTeleportMenu)

DebugTeleportMenu:
    dw #tel_debug_area
    dw #tel_debug_station
    dw #tel_debug_execute
    dw #$0000
    %cm_header("DEBUG LOAD POINTS")

tel_debug_area:
    dw !ACTION_CHOICE
    dl #!ram_tel_debug_area
    dw #$0000
    db #$28, "Select Area", #$FF
        db #$28, "   CRATERIA", #$FF
        db #$28, "   BRINSTAR", #$FF
        db #$28, "    NORFAIR", #$FF
        db #$28, "  REQT SHIP", #$FF
        db #$28, "    MARIDIA", #$FF
        db #$28, "    TOURIAN", #$FF
    db #$FF

tel_debug_station:
    %cm_numfield_hex("Station ID", !ram_tel_debug_station, 0, 21, 1, #0)

tel_debug_execute:
    %cm_jsr("TELEPORT", #action_debug_teleport, #$0000)

action_teleport:
{
    ; teleport destination in Y when called
    TYA : AND #$FF00 : XBA : STA $7E079F
    TYA : AND #$00FF : STA $7E078B
    LDA #$0006 : STA $7E0998

    ; Make sure we can teleport to Zebes from Ceres
    SEP #$20
    LDA #$05 : STA $7ED914
    REP #$20

    ; Clear message box index and door transition flags
    STZ $0795 : STZ $1C1F

    JSL reset_all_counters
    JSL stop_all_sounds

    LDA #$0001 : STA !ram_cm_leave

    RTS
}

action_debug_teleport:
{
    LDA !ram_tel_debug_area : XBA
    ORA !ram_tel_debug_station : TAY
    JMP action_teleport
}


; -----------
; Misc menu
; -----------

MiscMenu:
    dw #misc_bluesuit
    dw #misc_flashsuit
    dw #misc_hyperbeam
    dw #misc_gooslowdown
    dw #misc_magicpants
    dw #misc_spacepants
    dw #misc_loudpants
    dw #misc_fanfare_toggle
    dw #misc_music_toggle
    dw #misc_invincibility
    dw #misc_killenemies
    dw #misc_suit_properties
    dw #misc_forcestand
    dw #$0000
    %cm_header("MISC")

misc_bluesuit:
    %cm_toggle("Blue Suit", $7E0B3F, #$0004, #0)

misc_flashsuit:
    %cm_toggle("Flash Suit", $7E0A68, #$0001, #0)

misc_hyperbeam:
    %cm_toggle("Hyper Beam", $7E0A76, #$0001, #0)

misc_gooslowdown:
    %cm_numfield("Goo Slowdown", $7E0A66, 0, 4, 1, #0)

misc_magicpants:
    %cm_toggle_bit("Magic Pants", !ram_magic_pants_enabled, #$0001, GameLoopExtras)

misc_spacepants:
    %cm_toggle_bit("Space Pants", !ram_magic_pants_enabled, #$0002, GameLoopExtras)

misc_loudpants:
    %cm_toggle_bit("Loud Pants", !ram_magic_pants_enabled, #$0004, GameLoopExtras)

misc_fanfare_toggle:
    %cm_toggle("Fanfare", !sram_fanfare_toggle, #$0001, #0)

misc_music_toggle:
    %cm_toggle("Music", !sram_music_toggle, #$0001, .routine)

  .routine
    BIT #$0001 : BEQ .noMusic
    LDA $07F5 : STA $2140
    RTS

  .noMusic
    LDA #$0000 
    STA $0629
    STA $062B
    STA $062D
    STA $062F
    STA $0631
    STA $0633
    STA $0635
    STA $0637
    STA $063F
    STA $2140
    RTS

misc_invincibility:
    %cm_toggle_bit("Invincibility", $7E0DE0, #$0007, #0)

misc_killenemies:
    %cm_jsr("Kill Enemies", #.kill_loop, #0)
  .kill_loop
    ; 8000 = solid to Samus, 0400 = Ignore Samus projectiles
    TAX : LDA $0F86,X : BIT #$8400 : BNE +
    ORA #$0200 : STA $0F86,X
+   TXA : CLC : ADC #$0040 : CMP #$0400 : BNE .kill_loop

    RTS

misc_suit_properties:
    dw !ACTION_CHOICE
    dl #!sram_suit_properties
    dw .routine
    db #$28, "Suit Propertie", #$FF
    db #$28, "s   VANILLA", #$FF
    db #$28, "s  BALANCED", #$FF
    db #$28, "s  PROGRESS", #$FF
    db #$FF

  .routine
    JSL misc_init_suits_ram
    RTS

misc_init_suits_ram:
{
    LDA #$0021 : STA !ram_suits_enemy_damage_check : STA !ram_suits_periodic_damage_check

    LDA !sram_suit_properties : CMP #$0002 : BNE .init_periodic_damage
    LDA #$0001 : STA !ram_suits_enemy_damage_check

  .init_periodic_damage
    LDA !sram_suit_properties : BEQ .end
    LDA #$0001 : STA !ram_suits_periodic_damage_check

  .end
    RTL
}

misc_forcestand:
    %cm_jsr("Force Samus to Stand Up", .routine, #0)

  .routine
    JSL $90E2D4
    LDA #!SOUND_MENU_JSR : JSL $80903F
    RTS


; ---------------
; Sprite Features
; ---------------

SpritesMenu:
    dw #sprites_samus_prio
    dw #sprites_show_hitbox
    dw #sprites_oob_viewer
    dw #$0000
    %cm_header("SPRITE FEATURES")

sprites_samus_prio:
    %cm_toggle_bit("Samus on Top", !sram_sprite_prio_flag, #$3000, #0)

sprites_show_hitbox:
    %cm_toggle("Show Samus Hitbox", !ram_sprite_hitbox_active, #1, #0)

sprites_oob_viewer:
    %cm_toggle("OOB Tile Viewer", !ram_oob_watch_active, #1, #toggle_oob_viewer)

toggle_oob_viewer:
{
    LDA !ram_oob_watch_active : BEQ +
    JSL upload_sprite_oob_tiles
+   RTS
}


; -----------
; Events menu
; -----------

EventsMenu:
    dw #events_resetevents
    dw #events_resetdoors
    dw #events_resetitems
    dw #events_goto_bosses
    dw #events_zebesawake
    dw #events_maridiatubebroken
    dw #events_chozoacid
    dw #events_shaktool
    dw #events_tourian
    dw #events_metroid1
    dw #events_metroid2
    dw #events_metroid3
    dw #events_metroid4
    dw #events_zebesexploding
    dw #events_animals
    dw #$0000
    %cm_header("EVENTS")

events_resetevents:
    %cm_jsr("Reset All Events", action_reset_events, #$0000)

events_resetdoors:
    %cm_jsr("Reset All Doors", action_reset_doors, #$0000)

events_resetitems:
    %cm_jsr("Reset All Items", action_reset_items, #$0000)

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

events_zebesexploding:
    %cm_toggle_bit("Zebes Set Ablaze", $7ED820, #$4000, #0)

events_animals:
    %cm_toggle_bit("Animals Saved", $7ED820, #$8000, #0)

action_reset_events:
{
    LDA #$0000
    STA $7ED820
    STA $7ED822
    LDA #!SOUND_MENU_JSR : JSL $80903F
    RTS
}

action_reset_doors:
{
    PHP
    %ai8()
    LDX #$B0
    LDA #$00
-   STA $7ED800, X
    INX
    CPX #$D0
    BNE -
    PLP
    LDA #!SOUND_MENU_JSR : JSL $80903F
    RTS
}

action_reset_items:
{
    PHP
    %ai8()
    LDX #$70
    LDA #$00
-   STA $7ED800, X
    INX
    CPX #$90
    BNE -
    PLP
    LDA #!SOUND_MENU_JSR : JSL $80903F
    RTS
}


; ------------
; Bosses menu
; ------------

BossesMenu:
    dw #boss_bombtorizo
    dw #boss_spospo
    dw #boss_kraid
    dw #boss_phantoon
    dw #boss_botwoon
    dw #boss_draygon
    dw #boss_crocomire
    dw #boss_gt
    dw #boss_ridley
    dw #$0000
    %cm_header("BOSSES")

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


; --------------
; Infohud menu
; --------------

InfoHudMenu:
    dw #ih_goto_display_mode
    dw #ih_display_mode
;    dw #ih_goto_room_strat
;    dw #ih_room_strat
    dw #ih_room_counter
    dw #ih_reset_seg_later
    dw #ih_status_icons
    dw #ih_lag
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
    dw ihmode_xpos
    dw ihmode_ypos
    dw ihmode_hspeed
    dw ihmode_vspeed
    dw ihmode_quickdrop
    dw ihmode_walljump
    dw ihmode_shottimer
    dw ihmode_ramwatch
    dw #$0000
    %cm_header("INFOHUD DISPLAY MODE")

ihmode_enemyhp:
    %cm_jsr("Enemy HP", #action_select_infohud_mode, #$0000)

!IH_MODE_ROOMSTRAT_INDEX = $0001
ihmode_roomstrat:
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

!IH_MODE_SHINETUNE_INDEX = $0007
ihmode_shinetune:
    %cm_jsr("Shine Tune", #action_select_infohud_mode, #$0007)

ihmode_iframecounter:
    %cm_jsr("I-Frame Counter", #action_select_infohud_mode, #$0008)

ihmode_spikesuit:
    %cm_jsr("Spikesuit Trainer", #action_select_infohud_mode, #$0009)

ihmode_lagcounter:
    %cm_jsr("CPU Usage", #action_select_infohud_mode, #$000A)

ihmode_xpos:
    %cm_jsr("X Position", #action_select_infohud_mode, #$000B)

ihmode_ypos:
    %cm_jsr("Y Position", #action_select_infohud_mode, #$000C)

ihmode_hspeed:
    %cm_jsr("Horizontal Speed", #action_select_infohud_mode, #$000D)

!IH_MODE_VSPEED_INDEX = $000E
ihmode_vspeed:
    %cm_jsr("Vertical Speed", #action_select_infohud_mode, #$000E)

ihmode_quickdrop:
    %cm_jsr("Quickdrop Trainer", #action_select_infohud_mode, #$000F)

ihmode_walljump:
    %cm_jsr("Walljump Trainer", #action_select_infohud_mode, #$0010)

ihmode_shottimer:
    %cm_jsr("Shot Timer", #action_select_infohud_mode, #$0011)

ihmode_ramwatch:
    %cm_jsr("RAM Watch", #action_select_infohud_mode, #$0012)

action_select_infohud_mode:
{
    TYA : STA !sram_display_mode
    JSR cm_go_back
    JSR cm_calculate_max
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
    db #$28, "  CPU USAGE", #$FF
    db #$28, " X POSITION", #$FF
    db #$28, " Y POSITION", #$FF
    db #$28, "HORIZ SPEED", #$FF
    db #$28, " VERT SPEED", #$FF
    db #$28, " QUICK DROP", #$FF
    db #$28, "  WALL JUMP", #$FF
    db #$28, " SHOT TIMER", #$FF
    db #$28, "  RAM WATCH", #$FF
    db #$FF

ih_goto_room_strat:
    %cm_submenu("Select Room Strat", #RoomStratMenu)

RoomStratMenu:
    dw ihstrat_doorskip
    dw ihstrat_tacotank
    dw ihstrat_gateglitch
    dw ihstrat_moatcwj
    dw ihstrat_robotflush
    dw ihstrat_shinetopb
    dw ihstrat_elevatorcf
    dw ihstrat_botwooncf
    dw ihstrat_mbhp
    dw #$0000
    %cm_header("INFOHUD ROOM STRAT")

ihstrat_doorskip:
    %cm_jsr("Parlor-Climb Door Skip", #action_select_room_strat, #$0000)

ihstrat_tacotank:
    %cm_jsr("Taco Tank", #action_select_room_strat, #$0001)

ihstrat_gateglitch:
    %cm_jsr("Gate Glitch", #action_select_room_strat, #$0002)

ihstrat_moatcwj:
    %cm_jsr("Moat CWJ", #action_select_room_strat, #$0003)

ihstrat_robotflush:
    %cm_jsr("Robot Flush", #action_select_room_strat, #$0004)

ihstrat_shinetopb:
    %cm_jsr("Shine to PB", #action_select_room_strat, #$0005)

ihstrat_elevatorcf:
    %cm_jsr("Elevator Crystal Flash", #action_select_room_strat, #$0006)

ihstrat_botwooncf:
    %cm_jsr("Botwoon Crystal Flash", #action_select_room_strat, #$0007)

!IH_STRAT_MBHP_INDEX = $0008
ihstrat_mbhp:
    %cm_jsr("Mother Brain HP", #action_select_room_strat, #$0008)

action_select_room_strat:
{
    TYA : STA !sram_room_strat
    LDA #!IH_MODE_ROOMSTRAT_INDEX : STA !sram_display_mode
    JSR cm_go_back
    JSR cm_calculate_max
    RTS
}

ih_room_strat:
    dw !ACTION_CHOICE
    dl #!sram_room_strat
    dw #$0000
    db #$28, "Current Strat", #$FF
    db #$28, "  DOOR SKIP", #$FF
    db #$28, "  TACO TANK", #$FF
    db #$28, "GATE GLITCH", #$FF
    db #$28, "   MOAT CWJ", #$FF
    db #$28, "ROBOT FLUSH", #$FF
    db #$28, "SHINE TO PB", #$FF
    db #$28, "ELEVATOR CF", #$FF
    db #$28, " BOTWOON CF", #$FF
    db #$28, "      MB HP", #$FF
    db #$FF

ih_room_counter:
    dw !ACTION_CHOICE
    dl #!sram_frame_counter_mode
    dw #$0000
    db #$28, "Frame Counters", #$FF
    db #$28, "   REALTIME", #$FF
    db #$28, "     INGAME", #$FF
    db #$FF

ih_status_icons:
    %cm_toggle("Status Icons", !sram_status_icons, #1, #toggle_status_icons)

toggle_status_icons:
{
    LDA !IH_BLANK : STA $7EC656 : STA $7EC658
    RTS
}

ih_lag:
    %cm_numfield("Artificial Lag", !sram_artificial_lag, 0, 64, 1, #0)

ih_reset_seg_later:
    %cm_jsr("Reset Segment in Next Room", #.routine, #$FFFF)
    .routine
        TYA : STA !ram_reset_segment_later
        RTS

ih_ram_watch:
    %cm_submenu("Customize RAM Watch", #RAMWatchMenu)

RAMWatchMenu:
    dw ramwatch_left_hi
    dw ramwatch_left_lo
    dw ramwatch_left_edit_hi
    dw ramwatch_left_edit_lo
    dw ramwatch_execute_left
    dw ramwatch_lock_left
    dw ramwatch_right_hi
    dw ramwatch_right_lo
    dw ramwatch_right_edit_hi
    dw ramwatch_right_edit_lo
    dw ramwatch_execute_right
    dw ramwatch_lock_right
    dw #$0000
    %cm_header("READ AND WRITE TO MEMORY")

ramwatch_left_hi:
    %cm_numfield_hex("Address 1 High", !ram_watch_left_hi, 0, 255, 1, #.routine)
    .routine
        XBA : ORA !ram_watch_left_lo
        STA !ram_watch_left
        RTS

ramwatch_left_lo:
    %cm_numfield_hex("Address 1 Low", !ram_watch_left_lo, 0, 255, 1, #.routine)
    .routine
        XBA : ORA !ram_watch_left_hi
        XBA : STA !ram_watch_left
        RTS

ramwatch_left_edit_hi:
    %cm_numfield_hex("Value 1 High", !ram_watch_edit_left_hi, 0, 255, 1, #.routine)
    .routine
        XBA : ORA !ram_watch_edit_left_lo
        STA !ram_watch_edit_left
        RTS

ramwatch_left_edit_lo:
    %cm_numfield_hex("Value 1 Low", !ram_watch_edit_left_lo, 0, 255, 1, #.routine)
    .routine
        XBA : ORA !ram_watch_edit_left_hi
        XBA : STA !ram_watch_edit_left
        RTS

ramwatch_right_hi:
    %cm_numfield_hex("Address 2 High", !ram_watch_right_hi, 0, 255, 1, #.routine)
    .routine
        XBA : ORA !ram_watch_right_lo
        STA !ram_watch_right
        RTS

ramwatch_right_lo:
    %cm_numfield_hex("Address 2 Low", !ram_watch_right_lo, 0, 255, 1, #.routine)
    .routine
        XBA : ORA !ram_watch_right_hi
        XBA : STA !ram_watch_right
        RTS

ramwatch_right_edit_hi:
    %cm_numfield_hex("Value 2 High", !ram_watch_edit_right_hi, 0, 255, 1, #.routine)
    .routine
        XBA : ORA !ram_watch_edit_right_lo
        STA !ram_watch_edit_right
        RTS

ramwatch_right_edit_lo:
    %cm_numfield_hex("Value 2 Low", !ram_watch_edit_right_lo, 0, 255, 1, #.routine)
    .routine
        XBA : ORA !ram_watch_edit_right_hi
        XBA : STA !ram_watch_edit_right
        RTS

ramwatch_execute_left:
    %cm_jsr("Write to Address 1", #action_ramwatch_edit_left, #$0000)

ramwatch_execute_right:
    %cm_jsr("Write to Address 2", #action_ramwatch_edit_right, #$0000)

ramwatch_lock_left:
    %cm_toggle("Lock Value 1", !ram_watch_edit_lock_left, #$0001, #action_HUD_ramwatch)

ramwatch_lock_right:
    %cm_toggle("Lock Value 2", !ram_watch_edit_lock_right, #$0001, #action_HUD_ramwatch)

action_ramwatch_edit_left:
{
    LDA !ram_watch_left : TAX
    LDA !ram_watch_edit_left : STA $7E0000,X
    LDA #$0012 : STA !sram_display_mode
    RTS
}

action_ramwatch_edit_right:
{
    LDA !ram_watch_right : TAX
    LDA !ram_watch_edit_right : STA $7E0000,X
    LDA #$0012 : STA !sram_display_mode
    RTS
}

action_HUD_ramwatch:
{
    LDA #$0012 : STA !sram_display_mode
    RTS
}


; ----------
; Game menu
; ----------

GameMenu:
    dw #game_alternatetext
    dw #game_moonwalk
    dw #game_iconcancel
    dw #game_debugmode
    dw #game_debugbrightness
;    dw #game_minimap
;    dw #game_clear_minimap
    dw #game_metronome
    dw #game_metronome_tickrate
    dw #game_metronome_sfx
    dw #$0000
    %cm_header("GAME")

game_alternatetext:
    %cm_toggle("Japanese Text", $7E09E2, #$0001, #0)

game_moonwalk:
    %cm_toggle("Moon Walk", $7E09E4, #$0001, #0)

game_iconcancel:
    %cm_toggle("Icon Cancel", $7E09EA, #$0001, #0)

game_debugmode:
    %cm_toggle("Debug Mode", $7E05D1, #$0001, #0)

game_debugbrightness:
    %cm_toggle("Debug CPU Brightness", $7E0DF4, #$0001, #0)

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
    LDA #!SOUND_MENU_JSR : JSL $80903F
    RTS

game_metronome:
    %cm_toggle("Metronome", !ram_metronome, #$0001, GameLoopExtras)

game_metronome_tickrate:
    %cm_numfield("Metronome Tickrate", !sram_metronome_tickrate, 1, 255, 1, #.routine)
    .routine
        LDA #$0000 : STA !ram_metronome_counter
        RTS

game_metronome_sfx:
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

GameLoopExtras:
{
    LDA !ram_magic_pants_enabled : BNE .enabled
    LDA !ram_metronome : BNE .enabled
    LDA #$0000 : STA !ram_game_loop_extras
    RTS
  .enabled
    LDA #$0001 : STA !ram_game_loop_extras
    RTS
}


; ----------
; RNG menu
; ----------

RngMenu:
    if !FEATURE_SD2SNES
        dw #rng_rerandomize
    endif
    dw #rng_phan_first_phase
    dw #rng_phan_second_phase
    dw #rng_phan_eyeclose
    dw #rng_botwoon_rng
    dw #rng_draygon_rng_right
    dw #rng_draygon_rng_left
    dw #rng_crocomire_rng
    dw #rng_kraid_rng
    dw #$0000
    %cm_header("BOSS RNG CONTROL")

rng_rerandomize:
    %cm_toggle("Rerandomize", !sram_rerandomize, #$0001, #0)

rng_botwoon_rng:
    dw !ACTION_CHOICE
    dl #!ram_botwoon_rng
    dw #$0000
    db #$28, "Botwoon RNG", #$FF
    db #$28, "     RANDOM", #$FF
    db #$28, "       DOWN", #$FF
    db #$28, "         UP", #$FF
    db #$28, "      RIGHT", #$FF
    db #$28, "       LEFT", #$FF
    db #$FF

rng_phan_first_phase:
    dw !ACTION_CHOICE
    dl #!ram_phantoon_rng_1
    dw #$0000
    db #$28, "Phan 1st Phase", #$FF
    db #$28, "     RANDOM", #$FF
    db #$28, "  FAST LEFT", #$FF
    db #$28, "   MID LEFT", #$FF
    db #$28, "  SLOW LEFT", #$FF
    db #$28, " FAST RIGHT", #$FF
    db #$28, "  MID RIGHT", #$FF
    db #$28, " SLOW RIGHT", #$FF
    db #$FF

rng_phan_second_phase:
    dw !ACTION_CHOICE
    dl #!ram_phantoon_rng_2
    dw #$0000
    db #$28, "Phan 2nd Phase", #$FF
    db #$28, "     RANDOM", #$FF
    db #$28, "  FAST LEFT", #$FF
    db #$28, "   MID LEFT", #$FF
    db #$28, "  SLOW LEFT", #$FF
    db #$28, " FAST RIGHT", #$FF
    db #$28, "  MID RIGHT", #$FF
    db #$28, " SLOW RIGHT", #$FF
    db #$FF

rng_phan_eyeclose:
    dw !ACTION_CHOICE
    dl #!ram_phantoon_rng_3
    dw #$0000
    db #$28, "Phan Eye Close", #$FF
    db #$28, "     RANDOM", #$FF
    db #$28, "       SLOW", #$FF
    db #$28, "        MID", #$FF
    db #$28, "       FAST", #$FF
    db #$FF

rng_draygon_rng_right:
    dw !ACTION_CHOICE
    dl #!ram_draygon_rng_right
    dw #$0000
    db #$28, "Draygon from R", #$FF
    db #$28, "ight RANDOM", #$FF
    db #$28, "ight   GOOP", #$FF
    db #$28, "ight  SWOOP", #$FF
    db #$FF

rng_draygon_rng_left:
    dw !ACTION_CHOICE
    dl #!ram_draygon_rng_left
    dw #$0000
    db #$28, "Draygon from L", #$FF
    db #$28, "eft  RANDOM", #$FF
    db #$28, "eft    GOOP", #$FF
    db #$28, "eft   SWOOP", #$FF
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
    dw #ctrl_clear_shortcuts
    dw #$0000
    %cm_header("CONTROLLER SHORTCUTS")

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

ctrl_random_preset:
    %cm_ctrl_shortcut("Random Preset", !sram_ctrl_random_preset)

ctrl_save_custom_preset:
    %cm_ctrl_shortcut("Save Cust Preset", !sram_ctrl_save_custom_preset)

ctrl_load_custom_preset:
    %cm_ctrl_shortcut("Load Cust Preset", !sram_ctrl_load_custom_preset)

ctrl_inc_custom_preset:
    %cm_ctrl_shortcut("Next Preset Slot", !sram_ctrl_inc_custom_preset)

ctrl_dec_custom_preset:
    %cm_ctrl_shortcut("Prev Preset Slot", !sram_ctrl_dec_custom_preset)

ctrl_toggle_tileviewer:
    %cm_ctrl_shortcut("Toggle OOB Tiles", !sram_ctrl_toggle_tileviewer)

ctrl_clear_shortcuts:
    %cm_jsr("Clear Shortcuts", action_clear_shortcuts, #$0000)

action_clear_shortcuts:
{
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
    STA !sram_ctrl_toggle_tileviewer
    ; menu to default, Start + Select
    LDA #$3000 : STA !sram_ctrl_menu
    RTS
}

GameModeExtras:
{
    ; Check if any less common shortcuts are configured
    LDA !sram_ctrl_reset_segment_timer : BNE .enabled
    LDA !sram_ctrl_reset_segment_later : BNE .enabled
    LDA !sram_ctrl_kill_enemies : BNE .enabled
    LDA !sram_ctrl_full_equipment : BNE .enabled
    LDA !sram_ctrl_save_custom_preset : BNE .enabled
    LDA !sram_ctrl_load_custom_preset : BNE .enabled
    LDA !sram_ctrl_inc_custom_preset : BNE .enabled
    LDA !sram_ctrl_dec_custom_preset : BNE .enabled
    LDA !sram_ctrl_toggle_tileviewer : BNE .enabled
    LDA #$0000 : STA !ram_game_mode_extras
    RTL

  .enabled
    STA !ram_game_mode_extras
    RTL
}
