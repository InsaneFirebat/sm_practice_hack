; increment least significant bits when
; allocating to SRAM on the master branch
; decrement most significant bits for custom branches
!SRAM_VERSION = #$0013


; hijack, runs as game is starting, JSR to RAM initialization to avoid bad values
org $808455
    JML init_code


; hijack when clearing bank 7E
org $808490
clear_bank:
    ; Save quickboot state since it needs to distinguish between a soft and hard reset
    LDY.w !ram_quickboot_spc_state
    LDX #$3FFE
  .loop
    STZ $0000,X
    STZ $4000,X
    STZ $8000,X
    STZ $C000,X
    DEX #2 : BPL .loop
    JSL init_nonzero_wram

    STY.w !ram_quickboot_spc_state
    BRA .end

warnpc $8084AF

org $8084AF
  .end

org $80856E
    JML init_post_boot


org $81F000
print pc, " init start"

init_code:
{
    %ai16()
    PHA

    ; Initialize RAM (Bank 7E required)
    LDA #$0000 : STA !ram_slowdown_mode

    ; Check if we should initialize SRAM
    LDA !sram_initialized : CMP !SRAM_VERSION : BEQ .sram_initialized
    JSL init_sram

  .sram_initialized
    JSL validate_sram_for_savestates

if !PRESERVE_WRAM_DURING_SPACETIME
    ; WRAM located in bank 7E, clear it later
else
    ; Clear WRAM
    LDA #$0000 : LDX !WRAM_SIZE-2
-   STA !WRAM_START,X
    DEX #2 : BPL -

    ; Clear custom hack range
    LDX !CUSTOM_WRAM_SIZE
-   STA !CUSTOM_WRAM,X
    DEX #2 : BPL -

    JSL init_nonzero_wram
endif

  .done
    PLA
    ; Execute overwritten logic and return
if !FEATURE_PAL
    JSL $8B90EF
else
    JSL $8B9146
endif
    JML $808459
}

init_nonzero_wram:
{
    JSL init_wram_based_on_sram

    ; RAM $7E0000 fluctuates so it is not a good default value
    LDA #!ENEMY_HP : STA !ram_watch_left
    LDA #!SAMUS_HP : STA !ram_watch_right
    LDA #$007E : STA !ram_watch_bank
    LDA !sram_seed_X : STA !ram_seed_X
    LDA !sram_seed_Y : STA !ram_seed_Y

    LDA #$0000
    STA !ram_watch_left_index : STA !ram_watch_right_index
    STA !ram_cm_watch_enemy_side
    STA !ram_cm_watch_enemy_property : STA !ram_cm_watch_enemy_index

    LDA #$000A : STA !ram_cm_brb_set_cycle
    LDA #$0258 : STA !ram_cm_brb_cycle_time

    LDA #$0001
    STA !ram_cm_sfxlib1 : STA !ram_cm_sfxlib2 : STA !ram_cm_sfxlib3

    RTL
}

init_sram:
{
    ; Clear 200h bytes for custom build SRAM
    LDA #$0000 : LDX #$01FE
-   STA $F02100,X
    DEX #2 : BPL -

    ; Features
    LDA #$0015 : STA !sram_artificial_lag ; 21 / 15h
    LDA #$0001 : STA !sram_rerandomize
    LDA #$0000 : STA !sram_fanfare_toggle
    LDA #$0001 : STA !sram_music_toggle
    LDA #$0000 : STA !sram_frame_counter_mode
    LDA #$0000 : STA !sram_display_mode
    LDA #$0000 : STA !sram_top_display_mode
    LDA #$0000 : STA !sram_last_preset
    LDA #$0000 : STA !sram_save_has_set_rng
    LDA #$0000 : STA !sram_preset_category
    LDA #$0000 : STA !sram_custom_preset_slot
    LDA #$0000 : STA !sram_room_strat
    LDA #$0000 : STA !sram_sprite_prio_flag
    LDA #$0000 : STA !sram_status_icons
    LDA #$0000 : STA !sram_suit_properties
    LDA #$0001 : STA !sram_healthalarm
    LDA #$0000 : STA !sram_magnetstairs
    LDA #$0003 : STA !sram_cutscenes
    LDA #$0000 : STA !sram_compressed_graphics
    LDA #$0000 : STA !sram_lag_counter_mode
    LDA #$0000 : STA !sram_suppress_flashing

    LDA #$0000 : STA !sram_phantoon_intro
    LDA #$0000 : STA !sram_kraid_intro
    LDA #$0001 : STA !sram_preset_open_doors
    LDA #$0001 : STA !sram_preset_ship_landing ; 1 - on until ship presets are fixed
    LDA #$0000 : STA !sram_preset_enemies
    LDA #$0001 : STA !sram_preset_map_tiles
    LDA #$0001 : STA !sram_preset_auto_segment
    LDA #$0000 : STA !sram_countdamage
    LDA #$0001 : STA !sram_menu_background
    LDA #$000A : STA !sram_metronome_tickrate
    LDA #$0002 : STA !sram_metronome_sfx
    LDA #$0000 : STA !sram_superhud
    LDA #$0000 : STA !sram_superhud_bottom
    LDA #$0000 : STA !sram_superhud_middle
    LDA #$0000 : STA !sram_superhud_top
    LDA #$0000 : STA !sram_door_display_mode
    LDA #$0000 : STA !sram_display_mode_reward
    LDA #$0000 : STA !sram_random_bubble_sfx
    LDA #$0384 : STA !sram_demo_timer

    LDA #$0000 : STA !sram_custom_header

    LDA #$0001 : STA !sram_custompalette_profile ; 1 - Twitch
    LDA #$7277 : STA !sram_palette_border
    LDA #$48F3 : STA !sram_palette_headeroutline
    LDA #$7FFF : STA !sram_palette_text
    LDA #$0000 : STA !sram_palette_background
    LDA #$0000 : STA !sram_palette_numoutline
    LDA #$7FFF : STA !sram_palette_numfill
    LDA #$4376 : STA !sram_palette_toggleon
    LDA #$761F : STA !sram_palette_seltext
    LDA #$0000 : STA !sram_palette_seltextbg
    LDA #$0000 : STA !sram_palette_numseloutline
    LDA #$761F : STA !sram_palette_numsel

    LDA #$0037 : STA !sram_customsfx_move
    LDA #$0038 : STA !sram_customsfx_toggle
    LDA #$002A : STA !sram_customsfx_number
    LDA #$0028 : STA !sram_customsfx_confirm
    LDA #$0007 : STA !sram_customsfx_goback

    LDA #$0001 : STA !sram_scroll_button
    LDA #$4000 : STA !sram_cm_scroll_button
    LDA #$0002 : STA !sram_cm_scroll_delay

    LDA #$0000 : STA !sram_cm_font

    LDA #$FEED : STA !sram_seed_X
    LDA #$5EED : STA !sram_seed_Y

    LDA #$0000 : STA !sram_presetrando
    LDA #$0001 : STA !sram_presetrando_morph
    LDA #$0001 : STA !sram_presetrando_charge
    LDA #$000E : STA !sram_presetrando_max_etanks
    LDA #$0004 : STA !sram_presetrando_max_reserves
    LDA #$002E : STA !sram_presetrando_max_missiles
    LDA #$000A : STA !sram_presetrando_max_supers
    LDA #$000A : STA !sram_presetrando_max_pbs
    LDA #$0000 : STA !sram_presetrando_beampref

    LDA #$0001 : STA !sram_dummy_on
    LDA #$0000 : STA !sram_dummy_off
    LDA #$00FF : STA !sram_dummy_num

  .controller_shortcuts
    LDA #$3000 : STA !sram_ctrl_menu        ; Start + Select
    LDA #$6010 : STA !sram_ctrl_save_state  ; Select + Y + R
    LDA #$6020 : STA !sram_ctrl_load_state  ; Select + Y + L
    LDA #$5020 : STA !sram_ctrl_load_last_preset  ; Start + Y + L
    LDA #$0000 : STA !sram_ctrl_auto_save_state
    LDA #$0000 : STA !sram_ctrl_full_equipment
    LDA #$0000 : STA !sram_ctrl_kill_enemies
    LDA #$0000 : STA !sram_ctrl_reset_segment_timer
    LDA #$0000 : STA !sram_ctrl_reset_segment_later
    LDA #$0000 : STA !sram_ctrl_reveal_damage
    LDA #$0000 : STA !sram_ctrl_random_preset
    LDA #$0000 : STA !sram_ctrl_randomize_rng
    LDA #$0000 : STA !sram_ctrl_save_custom_preset
    LDA #$0000 : STA !sram_ctrl_load_custom_preset
    LDA #$0000 : STA !sram_ctrl_inc_custom_preset
    LDA #$0000 : STA !sram_ctrl_dec_custom_preset
    LDA #$0000 : STA !sram_ctrl_toggle_tileviewer
    LDA #$0000 : STA !sram_ctrl_force_stand
    LDA #$0000 : STA !sram_ctrl_update_timers

    ; Input Cheat Sheet  ($4218)
    ; $8000 = B
    ; $4000 = Y
    ; $2000 = Select
    ; $1000 = Start
    ; $0800 = Up
    ; $0400 = Down
    ; $0200 = Left
    ; $0100 = Right
    ; $0080 = A
    ; $0040 = X
    ; $0020 = L
    ; $0010 = R

    LDA !SRAM_VERSION : STA !sram_initialized

    RTL
}

init_sram_long:
{
    JSR init_sram
    RTL
}

init_post_boot:
{
    ; Load the last selected file slot (so that the user's controller
    ; bindings will apply if they load a preset without loading a save file)
    LDA $701FEC : STA !CURRENT_SAVE_FILE
    CMP #$0003 : BCC +
    LDA #$0000
+   JSL $818085 ; Load save file
    BCC .check_quickboot

    ; No valid save, load a new file (for default controller bindings)
    JSR $B2CB

  .check_quickboot
    ; Is quickboot enabled?
    LDA !sram_cutscenes : AND !CUTSCENE_QUICKBOOT : BEQ .done

    ; Boot to the infohud menu
    JML cm_boot

  .done
    JML $82893D ; hijacked code: start main game loop
}

print pc, " init end"
warnpc $81FF00
