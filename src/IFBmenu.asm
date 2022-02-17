; ----------
; Firebat Menu   IFBMenu:
; ----------

IFBMenu:
    dw #ifb_customizemenu
    dw #$FFFF
    dw #ifb_soundtest
    dw #$FFFF
    dw #ifb_presetrando
if !FEATURE_EXTRAS
    dw #$FFFF
    dw #ifb_noclip
    dw #ifb_nosteam
endif
    dw #$FFFF
if !FEATURE_PAL
else
    dw #ifb_debugteleport
endif
    dw #$FFFF
    dw #ifb_factory_reset
    dw #$0000
    %cm_header("CUSTOM ROMS ONLY")
    %cm_footer("MODIFIED BY INSANEFIREBAT")

ifb_soundtest:
    %cm_submenu("Sound Test", #SoundTestMenu)

ifb_presetrando:
    %cm_submenu("Preset Randomizer", #PresetRandoMenu)

if !FEATURE_PAL
else
ifb_debugteleport:
    %cm_submenu("Hidden Dev Load Stations", #DebugTeleportMenu)
endif

if !FEATURE_EXTRAS
    ifb_noclip:
        %cm_toggle("Walk Through Walls", !ram_noclip, #$0001, #0)

    ifb_nosteam:
        %cm_toggle("No Steam Collision", !ram_steamcollision, #$0001, #0)
endif

ifb_factory_reset:
    %cm_submenu("Factory Reset", #FactoryResetConfirm)


; ----------
; Custom Palettes
; ----------

incsrc customizemenu.asm


; ----------
; Debug Teleport Menu
; ----------

if !FEATURE_PAL
else
DebugTeleportMenu:
    dw #ifb_debugteleport_crateria
    dw #ifb_debugteleport_brinstar
    dw #ifb_debugteleport_norfair
    dw #ifb_debugteleport_wreckedship
    dw #ifb_debugteleport_maridia
    dw #ifb_debugteleport_tourian
    dw #ifb_debugteleport_extra
    dw #$0000
    %cm_header("DEBUG LOAD POINTS")

ifb_debugteleport_crateria:
    %cm_submenu("Crateria", #DebugTeleportCrateriaMenu)

ifb_debugteleport_brinstar:
    %cm_submenu("Brinstar", #DebugTeleportBrinstarMenu)

ifb_debugteleport_norfair:
    %cm_submenu("Norfair", #DebugTeleportNorfairMenu)

ifb_debugteleport_wreckedship:
    %cm_submenu("Wrecked Ship", #DebugTeleportWreckedShipMenu)

ifb_debugteleport_maridia:
    %cm_submenu("Maridia", #DebugTeleportMaridiaMenu)

ifb_debugteleport_tourian:
    %cm_submenu("Tourian", #DebugTeleportTourianMenu)

ifb_debugteleport_extra:
    %cm_submenu("Extras", #DebugTeleportExtraMenu)

DebugTeleportCrateriaMenu:
    dw #tel_crat_08
    dw #tel_crat_09
    dw #tel_crat_0A
    dw #tel_crat_0B
    dw #tel_crat_0C
    dw #tel_crat_10
    dw #tel_crat_11
    dw #tel_crat_12
    dw #$0000
    %cm_header("CRATERIA DEBUG LOAD")

tel_crat_08:
    %cm_jsr("Crateria 08", #action_teleport, #$0008)

tel_crat_09:
    %cm_jsr("Crateria 09", #action_teleport, #$0009)

tel_crat_0A:
    %cm_jsr("Crateria 0A", #action_teleport, #$000A)

tel_crat_0B:
    %cm_jsr("Crateria 0B", #action_teleport, #$000B)

tel_crat_0C:
    %cm_jsr("Crateria 0C", #action_teleport, #$000C)

tel_crat_10:
    %cm_jsr("Crateria 10", #action_teleport, #$0010)

tel_crat_11:
    %cm_jsr("Crateria 11", #action_teleport, #$0011)

tel_crat_12:
    %cm_jsr("Crateria 12", #action_teleport, #$0012)

DebugTeleportBrinstarMenu:
    dw #tel_brin_08
    dw #tel_brin_09
    dw #tel_brin_0A
    dw #tel_brin_0B
    dw #tel_brin_11
    dw #tel_brin_12
    dw #$0000
    %cm_header("BRINSTAR DEBUG LOAD")

tel_brin_08:
    %cm_jsr("Brinstar 08", #action_teleport, #$0108)

tel_brin_09:
    %cm_jsr("Brinstar 09", #action_teleport, #$0109)

tel_brin_0A:
    %cm_jsr("Brinstar 0A", #action_teleport, #$010A)

tel_brin_0B:
    %cm_jsr("Brinstar 0B", #action_teleport, #$010B)

tel_brin_11:
    %cm_jsr("Brinstar 11", #action_teleport, #$0111)

tel_brin_12:
    %cm_jsr("Brinstar 12", #action_teleport, #$0112)

DebugTeleportNorfairMenu:
    dw #tel_norf_08
    dw #tel_norf_09
    dw #tel_norf_0A
    dw #tel_norf_11
    dw #tel_norf_12
    dw #tel_norf_13
    dw #tel_norf_14
    dw #tel_norf_15
    dw #tel_norf_16
    dw #$0000
    %cm_header("NORFAIR DEBUG LOAD")

tel_norf_08:
    %cm_jsr("Norfair 08", #action_teleport, #$0208)

tel_norf_09:
    %cm_jsr("Norfair 09", #action_teleport, #$0209)

tel_norf_0A:
    %cm_jsr("Norfair 0A", #action_teleport, #$020A)

tel_norf_11:
    %cm_jsr("Norfair 11", #action_teleport, #$0211)

tel_norf_12:
    %cm_jsr("Norfair 12", #action_teleport, #$0212)

tel_norf_13:
    %cm_jsr("Norfair 13", #action_teleport, #$0213)

tel_norf_14:
    %cm_jsr("Norfair 14", #action_teleport, #$0214)

tel_norf_15:
    %cm_jsr("Norfair 15", #action_teleport, #$0215)

tel_norf_16:
    %cm_jsr("Norfair 16", #action_teleport, #$0216)

DebugTeleportWreckedShipMenu:
    dw #tel_ship_10
    dw #tel_ship_11
    dw #$0000
    %cm_header("WRECKED SHIP DEBUG LOAD")

tel_ship_10:
    %cm_jsr("Wrecked Ship 10", #action_teleport, #$0310)

tel_ship_11:
    %cm_jsr("Wrecked Ship 11", #action_teleport, #$0311)

DebugTeleportMaridiaMenu:
    dw #tel_mari_08
    dw #tel_mari_10
    dw #tel_mari_11
    dw #tel_mari_12
    dw #tel_mari_13
    dw #$0000
    %cm_header("MARIDIA DEBUG LOAD")

tel_mari_08:
    %cm_jsr("Maridia 08", #action_teleport, #$0408)

tel_mari_10:
    %cm_jsr("Maridia 10", #action_teleport, #$0410)

tel_mari_11:
    %cm_jsr("Maridia 11", #action_teleport, #$0411)

tel_mari_12:
    %cm_jsr("Maridia 12", #action_teleport, #$0412)

tel_mari_13:
    %cm_jsr("Maridia 13", #action_teleport, #$0413)


DebugTeleportTourianMenu:
    dw #tel_tour_08
    dw #tel_tour_10
    dw #tel_tourianbbyskip
    dw #$0000
    %cm_header("TOURIAN DEBUG LOAD")

tel_tour_08:
    %cm_jsr("Tourian 08", #action_teleport, #$0508)

tel_tour_10:
    %cm_jsr("Tourian 10", #action_teleport, #$0510)

DebugTeleportExtraMenu:
    dw #tel_ceres
    dw #tel_debug
    dw #$0000
    %cm_header("EXTRA DEBUG LOAD")

tel_ceres:
    %cm_jsr("Ceres Station", #action_teleport, #$0600)

tel_debug:
    %cm_jsr("Debug Room CRASH", #action_teleport, #$0700)
endif


; ------------
; Preset Rando
; ------------

PresetRandoMenu:
    dw #presetrando_enable
    dw #$FFFF
    dw #presetrando_morph
    dw #presetrando_charge
    dw #presetrando_beampref
    dw #$FFFF
    dw #presetrando_etanks
    dw #presetrando_reserves
    dw #presetrando_missiles
    dw #presetrando_supers
    dw #presetrando_pbs
    dw #$0000
    %cm_header("RANDOMIZE PRESET EQUIP")

presetrando_enable: 
    %cm_toggle("Equipment Rando", !sram_presetrando, #$0001, #0)

presetrando_morph:
    %cm_toggle("Force Morph Ball", !sram_presetrando_morph, #$0001, #0)

presetrando_charge:
    %cm_toggle("Force Charge Beam", !sram_presetrando_charge, #$0001, #0)

presetrando_beampref:
    dw !ACTION_CHOICE
    dl #!sram_presetrando_beampref
    dw #$0000
    db #$28, "Beam Preference", #$FF
        db #$28, "     RANDOM", #$FF
        db #$28, "     SPAZER", #$FF
        db #$28, "     PLASMA", #$FF
    db #$FF

presetrando_etanks: 
    %cm_numfield("Max Energy Tanks", !sram_presetrando_max_etanks, 0, 14, 1, 2, #0)

presetrando_reserves: 
    %cm_numfield("Max Reserve Tanks", !sram_presetrando_max_reserves, 0, 4, 1, 1, #0)

presetrando_missiles: 
    %cm_numfield("Max Missile Pickups", !sram_presetrando_max_missiles, 0, 50, 1, 5, #0)

presetrando_supers: 
    %cm_numfield("Max Super Pickups", !sram_presetrando_max_supers, 0, 50, 1, 5, #0)

presetrando_pbs: 
    %cm_numfield("Max Power Bomb Pickups", !sram_presetrando_max_pbs, 0, 50, 1, 5, #0)


; ----------
; Sound Test
; ----------

SoundTestMenu:
    dw #ifb_soundtest_goto_music
    dw #game_music_toggle
    dw #$FFFF
    dw #ifb_soundtest_lib1_sound
    dw #ifb_soundtest_lib2_sound
    dw #ifb_soundtest_lib3_sound
    dw #ifb_soundtest_silence
    dw #$0000
    %cm_header("SOUND TEST MENU")
    %cm_footer("PRESS Y TO PLAY SOUNDS")

ifb_soundtest_lib1_sound:
    %cm_numfield_sound("Library One Sound", !ram_soundtest_lib1, 1, 66, 1, .routine)
  .routine
    LDA !ram_soundtest_lib1 : JSL !SFX_LIB1
    RTS

ifb_soundtest_lib2_sound:
    %cm_numfield_sound("Library Two Sound", !ram_soundtest_lib2, 1, 127, 1, .routine)
  .routine
    LDA !ram_soundtest_lib2 : JSL !SFX_LIB2
    RTS

ifb_soundtest_lib3_sound:
    %cm_numfield_sound("Library Three Sound", !ram_soundtest_lib3, 1, 47, 1, .routine)
  .routine
    LDA !ram_soundtest_lib3 : JSL !SFX_LIB3
    RTS

ifb_soundtest_silence:
    %cm_jsr("Silence Sound FX", .routine, #0)
  .routine
    JSL stop_all_sounds
    RTS

ifb_soundtest_goto_music:
    %cm_submenu("Music Selection", #MusicSelectMenu1)

MusicSelectMenu1:
    dw #ifb_soundtest_music_title1
    dw #ifb_soundtest_music_title2
    dw #ifb_soundtest_music_intro
    dw #ifb_soundtest_music_ceres
    dw #ifb_soundtest_music_escape
    dw #ifb_soundtest_music_rainstorm
    dw #ifb_soundtest_music_spacepirate
    dw #ifb_soundtest_music_samustheme
    dw #ifb_soundtest_music_greenbrinstar
    dw #ifb_soundtest_music_redbrinstar
    dw #ifb_soundtest_music_uppernorfair
    dw #ifb_soundtest_music_lowernorfair
    dw #ifb_soundtest_music_easternmaridia
    dw #ifb_soundtest_music_westernmaridia
    dw #ifb_soundtest_music_wreckedshipoff
    dw #ifb_soundtest_music_wreckedshipon
    dw #ifb_soundtest_music_hallway
    dw #ifb_soundtest_music_goldenstatue
    dw #ifb_soundtest_music_tourian
    dw #ifb_soundtest_music_goto_2
    dw #$0000
    %cm_header("PLAY MUSIC - PAGE ONE")

ifb_soundtest_music_title1:
    %cm_jsr("Title Theme Part 1", #action_soundtest_playmusic, #$0305)

ifb_soundtest_music_title2:
    %cm_jsr("Title Theme Part 2", #action_soundtest_playmusic, #$0306)

ifb_soundtest_music_intro:
    %cm_jsr("Intro", #action_soundtest_playmusic, #$3605)

ifb_soundtest_music_ceres:
    %cm_jsr("Ceres Station", #action_soundtest_playmusic, #$2D06)

ifb_soundtest_music_escape:
    %cm_jsr("Escape Sequence", #action_soundtest_playmusic, #$2407)

ifb_soundtest_music_rainstorm:
    %cm_jsr("Zebes Rainstorm", #action_soundtest_playmusic, #$0605)

ifb_soundtest_music_spacepirate:
    %cm_jsr("Space Pirate Theme", #action_soundtest_playmusic, #$0905)

ifb_soundtest_music_samustheme:
    %cm_jsr("Samus Theme", #action_soundtest_playmusic, #$0C05)

ifb_soundtest_music_greenbrinstar:
    %cm_jsr("Green Brinstar", #action_soundtest_playmusic, #$0F05)

ifb_soundtest_music_redbrinstar:
    %cm_jsr("Red Brinstar", #action_soundtest_playmusic, #$1205)

ifb_soundtest_music_uppernorfair:
    %cm_jsr("Upper Norfair", #action_soundtest_playmusic, #$1505)

ifb_soundtest_music_lowernorfair:
    %cm_jsr("Lower Norfair", #action_soundtest_playmusic, #$1805)

ifb_soundtest_music_easternmaridia:
    %cm_jsr("Eastern Maridia", #action_soundtest_playmusic, #$1B05)

ifb_soundtest_music_westernmaridia:
    %cm_jsr("Western Maridia", #action_soundtest_playmusic, #$1B06)

ifb_soundtest_music_wreckedshipoff:
    %cm_jsr("Wrecked Ship Unpowered", #action_soundtest_playmusic, #$3005)

ifb_soundtest_music_wreckedshipon:
    %cm_jsr("Wrecked Ship", #action_soundtest_playmusic, #$3006)

ifb_soundtest_music_hallway:
    %cm_jsr("Hallway to Statue", #action_soundtest_playmusic, #$0004)

ifb_soundtest_music_goldenstatue:
    %cm_jsr("Golden Statue", #action_soundtest_playmusic, #$0906)

ifb_soundtest_music_tourian:
    %cm_jsr("Tourian", #action_soundtest_playmusic, #$1E05)

ifb_soundtest_music_goto_2:
    %cm_jsr("GOTO PAGE TWO", .routine, #MusicSelectMenu2)
  .routine
    JSL cm_go_back
    JMP action_submenu

MusicSelectMenu2:
    dw #ifb_soundtest_music_preboss1
    dw #ifb_soundtest_music_preboss2
    dw #ifb_soundtest_music_miniboss
    dw #ifb_soundtest_music_smallboss
    dw #ifb_soundtest_music_bigboss
    dw #ifb_soundtest_music_motherbrain
    dw #ifb_soundtest_music_credits
    dw #ifb_soundtest_music_itemroom
    dw #ifb_soundtest_music_itemfanfare
    dw #ifb_soundtest_music_spacecolony
    dw #ifb_soundtest_music_zebesexplodes
    dw #ifb_soundtest_music_loadsave
    dw #ifb_soundtest_music_death
    dw #ifb_soundtest_music_lastmetroid
    dw #ifb_soundtest_music_galaxypeace
    dw #ifb_soundtest_music_goto_1
    dw #$0000
    %cm_header("PLAY MUSIC - PAGE TWO")

ifb_soundtest_music_preboss1:
    %cm_jsr("Chozo Statue Awakens", #action_soundtest_playmusic, #$2406)

ifb_soundtest_music_preboss2:
    %cm_jsr("Approaching Confrontation", #action_soundtest_playmusic, #$2706)

ifb_soundtest_music_miniboss:
    %cm_jsr("Miniboss Fight", #action_soundtest_playmusic, #$2A05)

ifb_soundtest_music_smallboss:
    %cm_jsr("Small Boss Confrontation", #action_soundtest_playmusic, #$2705)

ifb_soundtest_music_bigboss:
    %cm_jsr("Big Boss Confrontation", #action_soundtest_playmusic, #$2405)

ifb_soundtest_music_motherbrain:
    %cm_jsr("Mother Brain Fight", #action_soundtest_playmusic, #$2105)

ifb_soundtest_music_credits:
    %cm_jsr("Credits", #action_soundtest_playmusic, #$3C05)

ifb_soundtest_music_itemroom:
    %cm_jsr("Item - Elevator Room", #action_soundtest_playmusic, #$0003)

ifb_soundtest_music_itemfanfare:
    %cm_jsr("Item Fanfare", #action_soundtest_playmusic, #$0002)

ifb_soundtest_music_spacecolony:
    %cm_jsr("Arrival at Space Colony", #action_soundtest_playmusic, #$2D05)

ifb_soundtest_music_zebesexplodes:
    %cm_jsr("Zebes Explodes", #action_soundtest_playmusic, #$3305)

ifb_soundtest_music_loadsave:
    %cm_jsr("Samus Appears", #action_soundtest_playmusic, #$0001)

ifb_soundtest_music_death:
    %cm_jsr("Death", #action_soundtest_playmusic, #$3905)

ifb_soundtest_music_lastmetroid:
    %cm_jsr("Last Metroid in Captivity", #action_soundtest_playmusic, #$3F05)

ifb_soundtest_music_galaxypeace:
    %cm_jsr("The Galaxy is at Peace", #action_soundtest_playmusic, #$4205)

ifb_soundtest_music_goto_1:
    %cm_jsr("GOTO PAGE ONE", .routine, #MusicSelectMenu1)
  .routine
    JSL cm_go_back
    JMP action_submenu

action_soundtest_playmusic:
{
    PHY
    LDA #$0000 : JSL !MUSIC_ROUTINE                  ; always load silence first
    PLY : TYA
    %a8() : STA !ram_soundtest_music
    XBA : %a16()
    STA $07CB                                        ; store data index to the room
    ORA #$FF00 : JSL !MUSIC_ROUTINE                  ; play from negative data index
    LDA !ram_soundtest_music : JSL !MUSIC_ROUTINE    ; play from track index
    RTS
}


FactoryResetConfirm:
    dw #ifb_factory_reset_abort
    dw #$FFFF
    dw #ifb_factory_reset_keep_presets
    dw #ifb_factory_reset_delete_presets
    dw #$0000
    %cm_header("KEEP CUSTOM PRESETS?")
    %cm_footer("THIS WILL REBOOT THE GAME")

ifb_factory_reset_abort:
    %cm_jsr("ABORT", #.routine, #$0000)
  .routine
    %sfxgoback()
    JSL cm_previous_menu
    RTS

ifb_factory_reset_keep_presets:
    %cm_jsr("Yes, keep my presets", #action_factory_reset, #$0000)

ifb_factory_reset_delete_presets:
    %cm_jsr("No, mark them as empty", .routine, #$0000)
  .routine
    TYX : TXA
-   STA !PRESET_SLOTS,X ; overwrite "5AFE" words
    INY : TYA : ASL : XBA : TAX
    CPY #$0020 : BNE -
    ; continue into action_factory_reset

action_factory_reset:
{
    ; Mark save files as corrupt
;    LDX #$000A
;-   LDA $8082AD,X : STA $F01FE0,X
;    DEX #2 : BPL -
    ; InfoHUD probably skips the routine that checks this

    ; Wipe standard practice hack memory
    LDA #$0000 : LDX !WRAM_SIZE-2
-   STA !WRAM_START,X
    DEX #2 : BPL -

    ; Wipe custom practice hack memory
    LDX #$01FE
-   STA $F02100,X
    DEX #2 : BPL -

    ; Mark practice hack SRAM as outdated
    LDA #$FFFF : STA !sram_initialized

    ; Reboot
    ; I'd like to silence audio before doing this, but there isn't enough time
    JML $80841C
}


; ---------------------
; Additional Menu Space
; ---------------------

pushpc
org $B6F200
print pc, " mainmenu bankB6 start"

set_category_loadout:
    TYA : ASL #4 : TAX

    ; Items
    LDA.l EquipmentTable,X : STA $7E09A4 : STA $7E09A2 : INX #2

    ; Beams
    LDA.l EquipmentTable,X : STA $7E09A8 : TAY
    AND #$000C : CMP #$000C : BEQ .murderBeam
    TYA : STA $7E09A6 : INX #2 : BRA +

  .murderBeam
    TYA : AND #$100B : STA $7E09A6 : INX #2

    ; Health
+   LDA.l EquipmentTable,X : STA $7E09C2 : STA $7E09C4 : INX #2

    ; Missiles
    LDA.l EquipmentTable,X : STA $7E09C6 : STA $7E09C8 : INX #2

    ; Supers
    LDA.l EquipmentTable,X : STA $7E09CA : STA $7E09CC : INX #2

    ; PBs
    LDA.l EquipmentTable,X : STA $7E09CE : STA $7E09D0 : INX #2

    ; Reserves
    LDA.l EquipmentTable,X : STA $7E09D4 : STA $7E09D6 : INX #2

    JSL cm_set_etanks_and_reserve

    %sfxmissile()
    RTL

EquipmentTable:
    ;  Items,  Beams,  Health, Miss,   Supers, PBs,    Reserv, Dummy
    dw #$F32F, #$100F, #$05DB, #$00E6, #$0032, #$0032, #$0190, #$0000        ; 100%
    dw #$3125, #$1007, #$018F, #$000F, #$000A, #$0005, #$0000, #$0000        ; any% new
    dw #$3325, #$100B, #$018F, #$000F, #$000A, #$0005, #$0000, #$0000        ; any% old
    dw #$1025, #$1002, #$018F, #$000A, #$000A, #$0005, #$0000, #$0000        ; 14% ice
    dw #$3025, #$1000, #$018F, #$000A, #$000A, #$0005, #$0000, #$0000        ; 14% speed
    dw #$F33F, #$100F, #$02BC, #$0064, #$0014, #$0014, #$012C, #$0000        ; gt code
if !FEATURE_PAL
    dw #$F33F, #$100F, #$0834, #$0145, #$0041, #$0046, #$02BC, #$0000        ; 136%
else
    dw #$F33F, #$100F, #$0834, #$0145, #$0041, #$0041, #$02BC, #$0000        ; 135%
endif
    dw #$710C, #$1001, #$031F, #$001E, #$0019, #$0014, #$0064, #$0000        ; rbo
    dw #$9004, #$0000, #$00C7, #$0005, #$0005, #$0005, #$0000, #$0000        ; any% glitched
    dw #$F32F, #$100F, #$0031, #$01A4, #$005A, #$0063, #$0000, #$0000        ; crystal flash
    dw #$0000, #$0000, #$0063, #$0000, #$0000, #$0000, #$0000, #$0000        ; nothing
if !FEATURE_PAL
    dw #$9005, #$1002, #$012B, #$000A, #$000A, #$0005, #$0064, #$0000        ; 14% x-ice
    dw #$1105, #$1002, #$018F, #$000A, #$000A, #$0005, #$0000, #$0000        ; 14% iceboots
    dw #$3105, #$1000, #$018F, #$000A, #$000A, #$0005, #$0000, #$0000        ; 14% speedboots
endif


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

print pc, " mainmenu bankB6 end"
pullpc
