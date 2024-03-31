
; hijack, runs as game is starting, JSR to RAM initialization to avoid bad values
org $808455
    JML init_code


; hijack when clearing bank 7E
org $808490
;    ; Save quickboot state since it needs to distinguish between a soft and hard reset
;    LDY.w !ram_quickboot_spc_state
    PHA
    LDX #$3FFE
  .clear_bank_loop
    STZ $0000,X
    STZ $4000,X
    STZ $8000,X
    STZ $C000,X
    DEX : DEX
    BPL .clear_bank_loop
    JSL init_nonzero_wram
    PLA

;    STY.w !ram_quickboot_spc_state
    BRA .end_clear_bank


warnpc $8084AF

org $8084AF
  .end_clear_bank

;org $80856E
;    JML init_post_boot


;org $81F000
org !ORG_INIT
print pc, " init start"

init_code:
{
    REP #$30
    PHA

    ; Initialize RAM (Bank 7E required)
    LDA #$0000 : STA !ram_slowdown_mode

    ; Check if we should initialize SRAM
    LDA !sram_initialized : CMP #!SRAM_VERSION : BEQ .sram_initialized
    JSL init_sram

  .sram_initialized
    PLA
    ; Execute overwritten logic and return
    JSL $8B9146
    JML $808459
}

init_nonzero_wram:
{
    ; RAM $7E0000 fluctuates so it is not a good default value
    LDA #!ENEMY_HP : STA !ram_watch_left
    LDA #!SAMUS_HP : STA !ram_watch_right
    LDA #$007E : STA !ram_watch_bank

    LDA !sram_seed_X : STA !ram_seed_X
    LDA !sram_seed_Y : STA !ram_seed_Y

    LDA #$0001 : STA !ram_cm_dummy_on
    RTL
}

init_sram:
{
    ; chosen seeds will automatically change over time, and will never be zero
    LDA.w #init_wram_based_on_sram : STA !sram_seed_X
    LDA.w #!SRAM_VERSION : STA !sram_seed_Y

    LDA #$0015 : STA !sram_artificial_lag
    LDA #$0001 : STA !sram_rerandomize
    LDA #$0000 : STA !sram_fanfare_toggle
    LDA #$0001 : STA !sram_music_toggle
    LDA #$0000 : STA !sram_frame_counter_mode
    LDA #$0000 : STA !sram_display_mode
    LDA #$0000 : STA !sram_last_preset
    LDA #$0000 : STA !sram_save_has_set_rng
    LDA #$0000 : STA !sram_preset_category
    LDA #$0000 : STA !sram_custom_preset_slot
    LDA #$0000 : STA !sram_room_strat
    LDA #$0000 : STA !sram_sprite_prio_flag
    LDA #$0000 : STA !sram_status_icons
    LDA #$0000 : STA !sram_top_display_mode
    LDA #$0001 : STA !sram_healthalarm
    LDA #$0003 : STA !sram_cutscenes
    LDA #$0000 : STA !sram_lag_counter_mode
    LDA #$0000 : STA !sram_preset_options
    LDA #$000A : STA !sram_metronome_tickrate
    LDA #$0002 : STA !sram_metronome_sfx
    LDA #$0000 : STA !sram_ctrl_auto_save_state
    LDA #$0000 : STA !sram_custom_header
    LDA #$0000 : STA !sram_fanfare_timer_adjust

    JSL init_menu_customization

  .controller_shortcuts
    ; branch called by ctrl_reset_defaults in mainmenu.asm
    LDA #$3000 : STA !sram_ctrl_menu                  ; Start + Select
    LDA #$6010 : STA !sram_ctrl_save_state            ; Select + Y + R
    LDA #$6020 : STA !sram_ctrl_load_state            ; Select + Y + L
    LDA #$5020 : STA !sram_ctrl_load_last_preset      ; Start + Y + L
    LDA #$0000 : STA !sram_ctrl_full_equipment
    LDA #$0000 : STA !sram_ctrl_kill_enemies
    LDA #$0000 : STA !sram_ctrl_reset_segment_timer
    LDA #$0000 : STA !sram_ctrl_reset_segment_later
    LDA #$0000 : STA !sram_ctrl_random_preset
    LDA #$0000 : STA !sram_ctrl_save_custom_preset
    LDA #$0000 : STA !sram_ctrl_load_custom_preset
    LDA #$0000 : STA !sram_ctrl_inc_custom_preset
    LDA #$0000 : STA !sram_ctrl_dec_custom_preset
    LDA #$0000 : STA !sram_ctrl_toggle_tileviewer
    LDA #$0000 : STA !sram_ctrl_update_timers
    LDA #$0000 : STA !sram_ctrl_auto_save_state

    LDA #!SRAM_VERSION : STA !sram_initialized
    RTL
}

init_menu_customization:
{
    LDA #$0002 : STA !sram_custompalette_profile
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
    LDA #$0001 : STA !sram_menu_background
    LDA #$0002 : STA !sram_cm_scroll_delay

  .soundFX
    ; branch called by sfx_reset in customizemenu.asm
    LDA #$0037 : STA !sram_customsfx_move
    LDA #$002A : STA !sram_customsfx_toggle
    LDA #$0038 : STA !sram_customsfx_number
    LDA #$0028 : STA !sram_customsfx_confirm
    LDA #$0007 : STA !sram_customsfx_goback
    RTL
}

init_controller_bindings:
{
    ; check if any non-dpad bindings are set
    LDX #$000A
    LDA.w !IH_INPUT_SHOT+$0C
  .loopBindings
    ORA.w !IH_INPUT_SHOT,X
    DEX #2 : BPL .loopBindings
    AND #$FFF0 : BNE .done

    ; load default dpad bindings
    LDA #$0800 : STA.w !INPUT_BIND_UP
    LSR : STA.w !INPUT_BIND_DOWN
    LSR : STA.w !INPUT_BIND_LEFT
    LSR : STA.w !INPUT_BIND_RIGHT

    ; load default non-dpad bindings
    LDX #$000C
  .loopTable
    LDA.l ControllerLayoutTable,X : STA.w !IH_INPUT_SHOT,X
    DEX #2 : BPL .loopTable

  .done
    RTL
}

print pc, " init end"
;warnpc $81FF00 ;;; $FF00: Thanks Genji! ;;;
