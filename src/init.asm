!SRAM_VERSION = $0008


; hijack, runs as game is starting, JSR to RAM initialization to avoid bad values
org $808455
    JML init_code


org $81F000
print pc, " init start"
init_code:
{
    REP #$30
    PHA

    ; Clear WRAM
    {
        ; We mostly use $7FFB00 and upward, so just zero everything
        LDA #$0000
        LDX #$04FE
      .loop
        STA $7FFB00,X
        DEX : DEX : BPL .loop

        LDA #$0000
        STA !ram_slowdown_mode
    }

    ; Check if we should initialize SRAM
    LDA !sram_initialized : CMP #!SRAM_VERSION : BEQ .sram_initialized

    JSR init_sram

  .sram_initialized
    ; Check if any less common controller shortcuts are configured
    JSL GameModeExtras

    PLA
    ; Execute overwritten logic and return
if !FEATURE_PAL
    JSL $8B90EF
else
    JSL $8B9146
endif
    JML $808459
}

init_sram:
{
    ; Controllers
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

    ; Features
    LDA #$0016 : STA !sram_artificial_lag
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
    LDA #$0000 : STA !sram_custom_preset_slot

    LDA #$0000 : STA !sram_countdamage
    LDA #$0000 : STA !sram_menu_background
    LDA #$0000 : STA !sram_sprite_prio_flag
    LDA #$0000 : STA !sram_custom_preset_slot
    LDA #$000A : STA !sram_metronome_tickrate
    LDA #$0002 : STA !sram_metronome_sfx
    LDA #$0001 : STA !sram_healthalarm
    LDA #$0000 : STA !sram_superhud
    LDA #$0000 : STA !sram_superhud_bottom
    LDA #$0006 : STA !sram_superhud_middle
    LDA #$0008 : STA !sram_superhud_top

    LDA #$0003 : STA !sram_custompalette_profile
    LDA #$0A20 : STA !sram_custompalette_menutext
    LDA #$000A : STA !sram_custompalette_menutext_hi
    LDA #$0020 : STA !sram_custompalette_menutext_lo
    LDA #$000F : STA !sram_custompalette_menuseltext
    LDA #$0000 : STA !sram_custompalette_menuseltext_hi
    LDA #$000F : STA !sram_custompalette_menuseltext_lo
    LDA #$0005 : STA !sram_custompalette_menuseltextbg
    LDA #$0000 : STA !sram_custompalette_menuseltextbg_hi
    LDA #$0005 : STA !sram_custompalette_menuseltextbg_lo
    LDA #$000E : STA !sram_custompalette_menuheaderoutline
    LDA #$0000 : STA !sram_custompalette_menuheaderoutline_hi
    LDA #$000E : STA !sram_custompalette_menuheaderoutline_lo
    LDA #$0002 : STA !sram_custompalette_menunumfill
    LDA #$0000 : STA !sram_custompalette_menunumfill_hi
    LDA #$0002 : STA !sram_custompalette_menunumfill_lo
    LDA #$0A20 : STA !sram_custompalette_menunumoutline
    LDA #$000A : STA !sram_custompalette_menunumoutline_hi
    LDA #$0020 : STA !sram_custompalette_menunumoutline_lo
    LDA #$000F : STA !sram_custompalette_menunumsel
    LDA #$0000 : STA !sram_custompalette_menunumsel_hi
    LDA #$000F : STA !sram_custompalette_menunumsel_lo
    LDA #$0A20 : STA !sram_custompalette_menunumseloutline
    LDA #$000A : STA !sram_custompalette_menunumseloutline_hi
    LDA #$0020 : STA !sram_custompalette_menunumseloutline_lo
    LDA #$0680 : STA !sram_custompalette_menutoggleon
    LDA #$0006 : STA !sram_custompalette_menutoggleon_hi
    LDA #$0080 : STA !sram_custompalette_menutoggleon_lo
    LDA #$000E : STA !sram_custompalette_menuborder
    LDA #$0000 : STA !sram_custompalette_menuborder_hi
    LDA #$000E : STA !sram_custompalette_menuborder_lo
    LDA #$0000 : STA !sram_custompalette_menubackground
    LDA #$0000 : STA !sram_custompalette_menubackground_hi
    LDA #$0000 : STA !sram_custompalette_menubackground_lo

    LDA #$0037 : STA !sram_customsfx_move
    LDA #$002A : STA !sram_customsfx_toggle
    LDA #$0037 : STA !sram_customsfx_number
    LDA #$0038 : STA !sram_customsfx_confirm
    LDA #$0007 : STA !sram_customsfx_goback

    LDA #$0000 : STA !sram_presetrando
    LDA #$0001 : STA !sram_presetrando_morph
    LDA #$0000 : STA !sram_presetrando_charge
    LDA #$0004 : STA !sram_presetrando_max_etanks
    LDA #$0002 : STA !sram_presetrando_max_reserves
    LDA #$0006 : STA !sram_presetrando_max_missiles
    LDA #$0005 : STA !sram_presetrando_max_supers
    LDA #$0002 : STA !sram_presetrando_max_pbs
    LDA #$0000 : STA !sram_presetrando_beampref

    LDA #$0001 : STA !sram_dummy_on
    LDA #$0000 : STA !sram_dummy_off
    LDA #$FFFF : STA !sram_dummy_num

    LDA #!SRAM_VERSION : STA !sram_initialized

    RTS
}

print pc, " init end"
warnpc $81FF00
