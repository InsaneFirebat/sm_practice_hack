!SRAM_VERSION = $0005


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
        LDX #$04FF
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
    PLA
    JSL $8B9146
    JML $808459
}

init_sram:
{
    ; Controllers
    LDA #$3000 : STA !sram_ctrl_menu        ; Start + Select
    LDA #$6010 : STA !sram_ctrl_save_state  ; Select + Y + R
    LDA #$6020 : STA !sram_ctrl_load_state  ; Select + Y + L
    LDA #$06F0 : STA !sram_ctrl_load_last_preset  ; Down + Left + L + R + A + X
    LDA #$0000 : STA !sram_ctrl_full_equipment
    LDA #$0000 : STA !sram_ctrl_kill_enemies
    LDA #$0000 : STA !sram_ctrl_reset_segment_timer
    LDA #$0000 : STA !sram_ctrl_reveal_damage
    LDA #$0000 : STA !sram_ctrl_random_preset

    ; Input Cheat Sheet  (#$XXYY)
    ; $4218  (YY)
    ; $80 = A
    ; $40 = X
    ; $20 = L
    ; $10 = R
    ; 
    ; $4219  (XX)
    ; $80 = B
    ; $40 = Y
    ; $20 = Select
    ; $10 = Start
    ; $08 = Up
    ; $04 = Down
    ; $02 = Left
    ; $01 = Right

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
    LDA #$0000 : STA !sram_room_strat
    LDA #$0000 : STA !sram_countdamage
    LDA #$0001 : STA !sram_menu_background
    LDA #$0000 : STA !sram_sprite_prio_flag

    LDA #$0000 : STA !sram_custompalette
    LDA #$9748 : STA !sram_custompalette_hudoutline
    LDA #$0097 : STA !sram_custompalette_hudoutline_hi
    LDA #$0048 : STA !sram_custompalette_hudoutline_lo
    LDA #$0000 : STA !sram_custompalette_hudfill
    LDA #$0000 : STA !sram_custompalette_hudfill_hi
    LDA #$0000 : STA !sram_custompalette_hudfill_lo
    LDA #$7277 : STA !sram_custompalette_menuborder
    LDA #$0072 : STA !sram_custompalette_menuborder_hi
    LDA #$0077 : STA !sram_custompalette_menuborder_lo
    LDA #$48F3 : STA !sram_custompalette_menuheaderoutline
    LDA #$0048 : STA !sram_custompalette_menuheaderoutline_hi
    LDA #$00F3 : STA !sram_custompalette_menuheaderoutline_lo
    LDA #$7FFF : STA !sram_custompalette_menutext
    LDA #$007F : STA !sram_custompalette_menutext_hi
    LDA #$00FF : STA !sram_custompalette_menutext_lo
    LDA #$0000 : STA !sram_custompalette_menunumoutline
    LDA #$0000 : STA !sram_custompalette_menunumoutline_hi
    LDA #$0000 : STA !sram_custompalette_menunumoutline_lo
    LDA #$7FFF : STA !sram_custompalette_menunumfill
    LDA #$007F : STA !sram_custompalette_menunumfill_hi
    LDA #$00FF : STA !sram_custompalette_menunumfill_lo
    LDA #$4376 : STA !sram_custompalette_menutoggleoutline
    LDA #$0043 : STA !sram_custompalette_menutoggleoutline_hi
    LDA #$0076 : STA !sram_custompalette_menutoggleoutline_lo
    LDA #$761F : STA !sram_custompalette_menuseltext
    LDA #$0076 : STA !sram_custompalette_menuseltext_hi
    LDA #$001F : STA !sram_custompalette_menuseltext_lo
    LDA #$0000 : STA !sram_custompalette_menuseltextbg
    LDA #$0000 : STA !sram_custompalette_menuseltextbg_hi
    LDA #$0000 : STA !sram_custompalette_menuseltextbg_lo
    LDA #$0000 : STA !sram_custompalette_menubackground
    LDA #$0000 : STA !sram_custompalette_menubackground_hi
    LDA #$0000 : STA !sram_custompalette_menubackground_lo
    
    LDA #$0000 : STA !sram_presetrando
    LDA #$0001 : STA !sram_presetrando_morph
    LDA #$0001 : STA !sram_presetrando_charge
    LDA #$000E : STA !sram_presetrando_max_etanks
    LDA #$0004 : STA !sram_presetrando_max_reserves
    LDA #$002E : STA !sram_presetrando_max_missiles
    LDA #$000A : STA !sram_presetrando_max_supers
    LDA #$000A : STA !sram_presetrando_max_pbs
    LDA #$0000 : STA !sram_presetrando_beampref

    LDA #!SRAM_VERSION : STA !sram_initialized

    RTS
}

print pc, " init end"
warnpc $81FF00
