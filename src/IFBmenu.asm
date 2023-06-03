; ------------
; Firebat Menu
; ------------

pushpc
org $85C000
print pc, " mainmenuu IFBmenu start"

IFBMenu:
if !FEATURE_VANILLAHUD
else
    dw #ifb_customizehud
endif
    dw #$FFFF
    dw #ifb_brb
    dw #ifb_soundtest
    dw #ifb_presetrando
    dw #ifb_debugteleport
if !FEATURE_EXTRAS
    dw #$FFFF
    dw #ifb_noclip
    dw #ifb_nosteam
endif
    dw #$FFFF
    dw #ifb_capture_cropping
    dw #$FFFF
    dw #ifb_factory_reset
if !FEATURE_DEV
    dw #$FFFF
    dw #ifb_emu_test
endif
    dw #$0000
    %cm_header("CUSTOM ROMS ONLY")
    %cm_footer("MODIFIED BY INSANEFIREBAT")

ifb_customizehud:
    %cm_numfield("HUD Number Font", !sram_number_gfx_choice, 0, 22, 1, 2, #0)

ifb_brb:
    %cm_submenu("BRB Screen", #BRBMenu)

ifb_soundtest:
    %cm_submenu("Sound Test", #SoundTestMenu)

ifb_presetrando:
    %cm_submenu("Preset Randomizer", #PresetRandoMenu)

ifb_debugteleport:
    %cm_submenu("Hidden Dev Load Stations", #DebugTeleportMenu)

if !FEATURE_EXTRAS
ifb_noclip:
    %cm_toggle("Walk Through Walls", !ram_noclip, #$0001, #0)

ifb_nosteam:
    %cm_toggle("No Steam Collision", !ram_steamcollision, #$0001, #0)
endif

ifb_capture_cropping:
    %cm_submenu("Capture Cropping Mode", #CaptureCroppingMenu)

ifb_factory_reset:
    %cm_submenu("Factory Reset", #FactoryResetConfirm)

if !FEATURE_DEV
ifb_emu_test:
    %cm_jsl("Detect Emulator Inaccuracy", .routine, #0)
  .routine
    ; 80 / 10 = 8
    LDA #$0050 : STA $4204
    %a8()
    LDA #$0A : STA $4206
    %a16()
    LDA $4214 : CMP #$0008 : BEQ .badEmu
    %sfxconfirm()
    RTL

  .badEmu
    ; didn't wait for math
    ; load some stuff for the crash handler
    LDA #$BADD
    LDX #$F00D
    LDY #$DEAD
    BRK #$9F
endif


; --------
; BRB Menu
; --------

BRBMenu:
    dw ifb_brb_screen
    dw #$FFFF
    dw ifb_brb_timer_mode
    dw ifb_brb_timer_min
    dw ifb_brb_timer_sec
    dw ifb_brb_timer_clear
    dw #$FFFF
    dw ifb_brb_cycle_timer
    dw ifb_brb_palette_cycle
    dw #$FFFF
    dw ifb_brb_scroll
    dw #$FFFF
    dw #ifb_soundtest_goto_music
    dw #ifb_game_music_toggle
    dw #$0000
    %cm_header("BRB SCREEN MENU")

ifb_brb_screen:
    %cm_jsl("Launch BRB Screen", .routine, #0)
  .routine
    JSL cm_brb_loop
    JSL wait_for_lag_frame_long
    JSL cm_transfer_custom_tileset
    JSL cm_refresh_cgram_long
    RTL

ifb_brb_timer_mode:
    dw !ACTION_CHOICE
    dl #!ram_cm_brb_timer_mode
    dw #$0000
    db #$28, "Timer Mode", #$FF
        db #$28, "        OFF", #$FF
        db #$28, "   COUNT UP", #$FF
        db #$28, " COUNT DOWN", #$FF
    db #$FF

ifb_brb_timer_min:
    %cm_numfield("Minutes on Timer", !ram_cm_brb_mins, 0, 99, 1, 5, #0)

ifb_brb_timer_sec:
    %cm_numfield("Seconds on Timer", !ram_cm_brb_secs, 0, 59, 1, 5, #0)

ifb_brb_timer_clear:
    %cm_jsl("Clear Timer", .routine, #0)
  .routine
    TYA : STA !ram_cm_brb_mins
    STA !ram_cm_brb_secs : STA !ram_cm_brb_frames
    RTL

ifb_brb_cycle_timer:
    %cm_numfield_word("Cycle Timer (seconds)", !ram_cm_brb_set_cycle, 1, 512, .routine)
  .routine
    LDA !ram_cm_brb_set_cycle : BNE +
    LDA #$0009 ; default to ~10s
+   ASL #6 : STA !ram_cm_brb_cycle_time
    RTL

ifb_brb_palette_cycle:
    %cm_toggle_bit_inverted("Cycle Palettes", !ram_cm_brb_palette, #$FFFF, #0)

ifb_brb_scroll:
    %cm_toggle("Screen Scrolling", !ram_cm_scroll, #$0001, #0)

print pc, " BRB start"
incsrc BRBmenu.asm
print pc, " BRB end"


; ----------
; Debug Teleport Menu
; ----------

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
    %cm_jsl("Crateria 08", #action_teleport_long, #$0008)

tel_crat_09:
    %cm_jsl("Crateria 09", #action_teleport_long, #$0009)

tel_crat_0A:
    %cm_jsl("Crateria 0A", #action_teleport_long, #$000A)

tel_crat_0B:
    %cm_jsl("Crateria 0B", #action_teleport_long, #$000B)

tel_crat_0C:
    %cm_jsl("Crateria 0C", #action_teleport_long, #$000C)

tel_crat_10:
    %cm_jsl("Crateria 10", #action_teleport_long, #$0010)

tel_crat_11:
    %cm_jsl("Crateria 11", #action_teleport_long, #$0011)

tel_crat_12:
    %cm_jsl("Crateria 12", #action_teleport_long, #$0012)

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
    %cm_jsl("Brinstar 08", #action_teleport_long, #$0108)

tel_brin_09:
    %cm_jsl("Brinstar 09", #action_teleport_long, #$0109)

tel_brin_0A:
    %cm_jsl("Brinstar 0A", #action_teleport_long, #$010A)

tel_brin_0B:
    %cm_jsl("Brinstar 0B", #action_teleport_long, #$010B)

tel_brin_11:
    %cm_jsl("Brinstar 11", #action_teleport_long, #$0111)

tel_brin_12:
    %cm_jsl("Brinstar 12", #action_teleport_long, #$0112)

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
    %cm_jsl("Norfair 08", #action_teleport_long, #$0208)

tel_norf_09:
    %cm_jsl("Norfair 09", #action_teleport_long, #$0209)

tel_norf_0A:
    %cm_jsl("Norfair 0A", #action_teleport_long, #$020A)

tel_norf_11:
    %cm_jsl("Norfair 11", #action_teleport_long, #$0211)

tel_norf_12:
    %cm_jsl("Norfair 12", #action_teleport_long, #$0212)

tel_norf_13:
    %cm_jsl("Norfair 13", #action_teleport_long, #$0213)

tel_norf_14:
    %cm_jsl("Norfair 14", #action_teleport_long, #$0214)

tel_norf_15:
    %cm_jsl("Norfair 15", #action_teleport_long, #$0215)

tel_norf_16:
    %cm_jsl("Norfair 16", #action_teleport_long, #$0216)

DebugTeleportWreckedShipMenu:
    dw #tel_ship_10
    dw #tel_ship_11
    dw #$0000
    %cm_header("WRECKED SHIP DEBUG LOAD")

tel_ship_10:
    %cm_jsl("Wrecked Ship 10", #action_teleport_long, #$0310)

tel_ship_11:
    %cm_jsl("Wrecked Ship 11", #action_teleport_long, #$0311)

DebugTeleportMaridiaMenu:
    dw #tel_mari_08
    dw #tel_mari_10
    dw #tel_mari_11
    dw #tel_mari_12
    dw #tel_mari_13
    dw #$0000
    %cm_header("MARIDIA DEBUG LOAD")

tel_mari_08:
    %cm_jsl("Maridia 08", #action_teleport_long, #$0408)

tel_mari_10:
    %cm_jsl("Maridia 10", #action_teleport_long, #$0410)

tel_mari_11:
    %cm_jsl("Maridia 11", #action_teleport_long, #$0411)

tel_mari_12:
    %cm_jsl("Maridia 12", #action_teleport_long, #$0412)

tel_mari_13:
    %cm_jsl("Maridia 13", #action_teleport_long, #$0413)


DebugTeleportTourianMenu:
    dw #tel_tour_08
    dw #tel_tour_10
    dw #tel_tour_11
    dw #$0000
    %cm_header("TOURIAN DEBUG LOAD")

tel_tour_08:
    %cm_jsl("Tourian 08", #action_teleport_long, #$0508)

tel_tour_10:
    %cm_jsl("Tourian 10", #action_teleport_long, #$0510)

tel_tour_11:
    %cm_jsl("Tourian Baby Skip", #action_teleport_long, #$0511)

DebugTeleportExtraMenu:
    dw #tel_ceres
    dw #tel_debug
    dw #$0000
    %cm_header("EXTRA DEBUG LOAD")

tel_ceres:
    %cm_jsl("Ceres Station", #action_teleport_long, #$0600)

tel_debug:
    %cm_jsl("Debug Room CRASH", #action_teleport_long, #$0700)

action_teleport_long:
{
    JSL action_teleport
    RTL
}


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
    dw #ifb_game_music_toggle
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
    RTL

ifb_soundtest_lib2_sound:
    %cm_numfield_sound("Library Two Sound", !ram_soundtest_lib2, 1, 127, 1, .routine)
  .routine
    LDA !ram_soundtest_lib2 : JSL !SFX_LIB2
    RTL

ifb_soundtest_lib3_sound:
    %cm_numfield_sound("Library Three Sound", !ram_soundtest_lib3, 1, 47, 1, .routine)
  .routine
    LDA !ram_soundtest_lib3 : JSL !SFX_LIB3
    RTL

ifb_soundtest_silence:
    %cm_jsl("Silence Sound FX", .routine, #0)
  .routine
    JSL stop_all_sounds
    RTL

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
    %cm_jsl("Title Theme Part 1", #action_soundtest_playmusic, #$0305)

ifb_soundtest_music_title2:
    %cm_jsl("Title Theme Part 2", #action_soundtest_playmusic, #$0306)

ifb_soundtest_music_intro:
    %cm_jsl("Intro", #action_soundtest_playmusic, #$3605)

ifb_soundtest_music_ceres:
    %cm_jsl("Ceres Station", #action_soundtest_playmusic, #$2D06)

ifb_soundtest_music_escape:
    %cm_jsl("Escape Sequence", #action_soundtest_playmusic, #$2407)

ifb_soundtest_music_rainstorm:
    %cm_jsl("Zebes Rainstorm", #action_soundtest_playmusic, #$0605)

ifb_soundtest_music_spacepirate:
    %cm_jsl("Space Pirate Theme", #action_soundtest_playmusic, #$0905)

ifb_soundtest_music_samustheme:
    %cm_jsl("Samus Theme", #action_soundtest_playmusic, #$0C05)

ifb_soundtest_music_greenbrinstar:
    %cm_jsl("Green Brinstar", #action_soundtest_playmusic, #$0F05)

ifb_soundtest_music_redbrinstar:
    %cm_jsl("Red Brinstar", #action_soundtest_playmusic, #$1205)

ifb_soundtest_music_uppernorfair:
    %cm_jsl("Upper Norfair", #action_soundtest_playmusic, #$1505)

ifb_soundtest_music_lowernorfair:
    %cm_jsl("Lower Norfair", #action_soundtest_playmusic, #$1805)

ifb_soundtest_music_easternmaridia:
    %cm_jsl("Eastern Maridia", #action_soundtest_playmusic, #$1B05)

ifb_soundtest_music_westernmaridia:
    %cm_jsl("Western Maridia", #action_soundtest_playmusic, #$1B06)

ifb_soundtest_music_wreckedshipoff:
    %cm_jsl("Wrecked Ship Unpowered", #action_soundtest_playmusic, #$3005)

ifb_soundtest_music_wreckedshipon:
    %cm_jsl("Wrecked Ship", #action_soundtest_playmusic, #$3006)

ifb_soundtest_music_hallway:
    %cm_jsl("Hallway to Statue", #action_soundtest_playmusic, #$0004)

ifb_soundtest_music_goldenstatue:
    %cm_jsl("Golden Statue", #action_soundtest_playmusic, #$0906)

ifb_soundtest_music_tourian:
    %cm_jsl("Tourian", #action_soundtest_playmusic, #$1E05)

ifb_soundtest_music_goto_2:
    %cm_jsl("GOTO PAGE TWO", .routine, #MusicSelectMenu2)
  .routine
    JSL cm_go_back
    ; set bank for manual submenu jump
    PHK : PHK : PLA : STA !ram_cm_menu_bank
    JML action_submenu

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
    %cm_jsl("Chozo Statue Awakens", #action_soundtest_playmusic, #$2406)

ifb_soundtest_music_preboss2:
    %cm_jsl("Approaching Confrontation", #action_soundtest_playmusic, #$2706)

ifb_soundtest_music_miniboss:
    %cm_jsl("Miniboss Fight", #action_soundtest_playmusic, #$2A05)

ifb_soundtest_music_smallboss:
    %cm_jsl("Small Boss Confrontation", #action_soundtest_playmusic, #$2705)

ifb_soundtest_music_bigboss:
    %cm_jsl("Big Boss Confrontation", #action_soundtest_playmusic, #$2405)

ifb_soundtest_music_motherbrain:
    %cm_jsl("Mother Brain Fight", #action_soundtest_playmusic, #$2105)

ifb_soundtest_music_credits:
    %cm_jsl("Credits", #action_soundtest_playmusic, #$3C05)

ifb_soundtest_music_itemroom:
    %cm_jsl("Item - Elevator Room", #action_soundtest_playmusic, #$0003)

ifb_soundtest_music_itemfanfare:
    %cm_jsl("Item Fanfare", #action_soundtest_playmusic, #$0002)

ifb_soundtest_music_spacecolony:
    %cm_jsl("Arrival at Space Colony", #action_soundtest_playmusic, #$2D05)

ifb_soundtest_music_zebesexplodes:
    %cm_jsl("Zebes Explodes", #action_soundtest_playmusic, #$3305)

ifb_soundtest_music_loadsave:
    %cm_jsl("Samus Appears", #action_soundtest_playmusic, #$0001)

ifb_soundtest_music_death:
    %cm_jsl("Death", #action_soundtest_playmusic, #$3905)

ifb_soundtest_music_lastmetroid:
    %cm_jsl("Last Metroid in Captivity", #action_soundtest_playmusic, #$3F05)

ifb_soundtest_music_galaxypeace:
    %cm_jsl("The Galaxy is at Peace", #action_soundtest_playmusic, #$4205)

ifb_soundtest_music_goto_1:
    %cm_jsl("GOTO PAGE ONE", .routine, #MusicSelectMenu1)
  .routine
    JSL cm_go_back
    ; set bank for manual submenu jump
    PHK : PHK : PLA : STA !ram_cm_menu_bank
    JML action_submenu

ifb_game_music_toggle:
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
    LDA !MUSIC_TRACK : STZ !MUSIC_TRACK : JSL !MUSIC_ROUTINE
    RTL

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
    RTL
}


; ----------------
; Capture Cropping
; ----------------

CaptureCroppingMenu:
    dw #ifb_launch_crop_mode
    dw #$FFFF
    dw #ifb_crop_mode
    dw #ifb_crop_tile
    dw #$0000
    %cm_header("CAPTURE CROPPING MODE")

ifb_launch_crop_mode:
    %cm_jsl("Capture Crop Mode", .routine, #0)
  .routine
    JSL cm_crop_mode
    JSL cm_refresh_cgram_long
    RTL

ifb_crop_mode:
    dw !ACTION_CHOICE
    dl #!ram_crop_mode
    dw #$0000
    db #$28, "Drawing Method", #$FF
    db #$28, "     BORDER", #$FF
    db #$28, "       FILL", #$FF
    db #$FF

ifb_crop_tile:
    dw !ACTION_CHOICE
    dl #!ram_crop_tile
    dw #$0000
    db #$28, "Cropping Tile", #$FF
    db #$28, "          ", #$90, #$FF
    db #$28, "          ", #$91, #$FF
    db #$FF


; -------------
; Factory Reset
; -------------

FactoryResetConfirm:
    dw #ifb_factory_reset_abort
    dw #$FFFF
    dw #ifb_factory_reset_keep_presets
    dw #ifb_factory_reset_delete_presets
    dw #$0000
    %cm_header("KEEP CUSTOM PRESETS?")
    %cm_footer("THIS WILL REBOOT THE GAME")

ifb_factory_reset_abort:
    %cm_jsl("ABORT", #.routine, #$0000)
  .routine
    %sfxgoback()
    JSL cm_previous_menu
    RTL

ifb_factory_reset_keep_presets:
    %cm_jsl("Yes, keep my presets", #action_factory_reset, #$0000)

ifb_factory_reset_delete_presets:
    %cm_jsl("No, mark them as empty", .routine, #$0000)
  .routine
    TYX : TXA ; LDA/X/Y #$0000
-   STA !PRESET_SLOTS,X ; overwrite "5AFE" words
    ; inc and multiply Y by $200/$100 for next slot index
    INY : TYA : %presetslotsize()
    CPY !TOTAL_PRESET_SLOTS : BNE -
    ; continue into action_factory_reset

action_factory_reset:
{
    ; Wipe standard practice hack memory
    LDA #$0000 : LDX !WRAM_SIZE-2
-   STA !WRAM_START,X
    DEX #2 : BPL -

    ; Wipe custom practice hack memory
    LDX #$01FE
-   STA !SRAM_START+$100,X
    DEX #2 : BPL -

    ; Mark practice hack SRAM as outdated
    LDA #$FFFF : STA !sram_initialized

    ; Reboot
    ; I'd like to silence audio before doing this, but there isn't enough time
    JML $80841C
}

print pc, " mainmenuu IFBmenu end"
warnpc $85F800 ; gamemode.asm
pullpc
