!ram_load_preset = $7FFB00

!ram_gametime_room = $7FFB02
!ram_last_gametime_room = $7FFB04
!ram_realtime_room = $7FFB06
!ram_last_realtime_room = $7FFB08
!ram_last_room_lag = $7FFB0A
!ram_last_door_lag_frames = $7FFB0C
!ram_transition_counter = $7FFB0E
!ram_transition_flag = $7FFB10
!ram_transition_flag_2 = $7FFB12

!ram_seg_rt_frames = $7FFB14
!ram_seg_rt_seconds = $7FFB16
!ram_seg_rt_minutes = $7FFB18
!ram_reset_segment_later = $7FFB1A

!ram_ih_controller = $7FFB1C
!ram_slowdown_controller_1 = $7FFB1E
!ram_slowdown_controller_2 = $7FFB20
!ram_slowdown_frames = $7FFB22
!ram_slowdown_mode = $7EFFFC ; $7E

!ram_tmp_1 = $7FFB24
!ram_tmp_2 = $7FFB26
!ram_tmp_3 = $7FFB28
!ram_tmp_4 = $7FFB2A

!ram_last_hp = $7FFB2C
!ram_etanks = $7FFB2E
!ram_pct_1 = $7FFB30
!ram_pct_2 = $7FFB32
!ram_armed_shine_duration = $7FFB34
!ram_minimap = $7FFB36
!ram_map_counter = $7FFB38
!ram_vcounter_data = $7FFB3C
!ram_custom_preset = $7FFB3E

; FREE SPACE ^

!ram_magic_pants_enabled = $7FFB50
!ram_magic_pants_state = $7FFB52
!ram_magic_pants_pal1 = $7FFB54
!ram_magic_pants_pal2 = $7FFB56
!ram_magic_pants_pal3 = $7FFB58

!ram_room_has_set_rng = $7FFB5A
!ram_kraid_rng = $7FFB5C
!ram_crocomire_rng = $7FFB5E
!ram_phantoon_rng_1 = $7FFB60
!ram_phantoon_rng_2 = $7FFB62
!ram_phantoon_rng_3 = $7FFB64
!ram_botwoon_rng = $7FFB66
!ram_draygon_rng_left = $7FFB68
!ram_draygon_rng_right = $7FFB6A

!ram_metronome = $7FFB6E
!ram_metronome_counter = $7FFB70

; FREE SPACE ^


; --------
; Infohud
; --------

!ram_HUD_check = $7FFB80
!ram_roomstrat_counter = $7FFB82
!ram_roomstrat_state = $7FFB84
!ram_enemy_hp = $7FFB86
!ram_mb_hp = $7FFB88
!ram_shot_timer = $7FFB8A
!ram_shine_counter = $7FFB8C
!ram_dash_counter = $7FFB8E
!ram_shine_dash_held_late = $7FFB90
!ram_shinetune_early_1 = $7FFB92
!ram_shinetune_late_1 = $7FFB94
!ram_shinetune_early_2 = $7FFB96
!ram_shinetune_late_2 = $7FFB98
!ram_shinetune_early_3 = $7FFB9A
!ram_shinetune_late_3 = $7FFB9C
!ram_shinetune_early_4 = $7FFB9E
!ram_shinetune_late_4 = $7FFBA0
!ram_xpos = $7FFBA2
!ram_ypos = $7FFBA4
!ram_subpixel_pos = $7FFBA6
!ram_horizontal_speed = $7FFBA8
!ram_vertical_speed = $7FFBAA
!ram_quickdrop_counter = $7FFBAC
!ram_walljump_counter = $7FFBAE

; FREE SPACE ^

!ram_watch_left = $7FFBE0
!ram_watch_left_hud = $7FFBE2
!ram_watch_left_hi = $7FFBE4
!ram_watch_left_lo = $7FFBE6
!ram_watch_right = $7FFBE8
!ram_watch_right_hud = $7FFBEA
!ram_watch_right_hi = $7FFBEC
!ram_watch_right_lo = $7FFBEE
!ram_watch_edit_left = $7FFBF0
!ram_watch_edit_left_hi = $7FFBF2
!ram_watch_edit_left_lo = $7FFBF4
!ram_watch_edit_right = $7FFBF6
!ram_watch_edit_right_hi = $7FFBF8
!ram_watch_edit_right_lo = $7FFBFA
!ram_watch_edit_lock_left = $7FFBFC
!ram_watch_edit_lock_right = $7FFBFE


; -------------
; Menu
; -------------

!ram_cm_stack_index = $5D5
!ram_cm_menu_stack = $7FFF00 ; 0x10
!ram_cm_cursor_stack = $7FFF10 ; 0x10
!ram_cm_cursor_max = $7FFF20
!ram_cm_input_timer = $7FFF22
!ram_cm_controller = $7FFF24
!ram_cm_menu_bank = $7FFF26

!ram_cm_etanks = $7FFF28
!ram_cm_reserve = $7FFF2A
!ram_cm_leave = $7FFF2C
!ram_cm_input_counter = $7FFF2E
!ram_cm_last_nmi_counter = $7FFF30

!ram_cm_ctrl_mode = $7FFF32
!ram_cm_ctrl_timer = $7FFF34
!ram_cm_ctrl_last_input = $7FFF36

; FREE SPACE ^

!ram_cgram_cache = $7FFFD0 ; 0x14 bytes

!ram_hex2dec_first_digit = $14
!ram_hex2dec_second_digit = $16
!ram_hex2dec_third_digit = $18
!ram_hex2dec_rest = $1A

!ACTION_TOGGLE          = #$0000
!ACTION_TOGGLE_BIT      = #$0002
!ACTION_JSR             = #$0004
!ACTION_NUMFIELD        = #$0006
!ACTION_CHOICE          = #$0008
!ACTION_CTRL_SHORTCUT   = #$000A
!ACTION_NUMFIELD_HEX    = #$000C
!ACTION_NUMFIELD_WORD   = #$000E
!ACTION_TOGGLE_INVERTED = #$0010
!ACTION_JSR_NOSOUND     = #$0004

; using macros instead of these in custom builds
!SOUND_MENU_MOVE = $0039
!SOUND_MENU_JSR = $0039


; ------------
; Pointers
; ------------

!IH_CONTROLLER_PRI = $8B
!IH_CONTROLLER_PRI_NEW = $8F
!IH_CONTROLLER_PRI_PREV = $97

!IH_CONTROLLER_SEC = $8D
!IH_CONTROLLER_SEC_NEW = $91
!IH_CONTROLLER_SEC_PREV = $99

!IH_BLANK = #$2C0F
!IH_PERCENT = #$0C0A
!IH_DECIMAL = #$0CCB
!IH_HYPHEN = #$0C55
!IH_LETTER_A = #$0C64
!IH_LETTER_B = #$0C65
!IH_LETTER_C = #$0C58
!IH_LETTER_D = #$0C59
!IH_LETTER_E = #$0C5A
!IH_LETTER_F = #$0C5B
!IH_LETTER_H = #$0C6C
!IH_LETTER_L = #$0C68
!IH_LETTER_N = #$0C56
!IH_LETTER_R = #$0C69
!IH_LETTER_X = #$0C66
!IH_LETTER_Y = #$0C67
!IH_ARROW_LEFT = #$0C60
!IH_ARROW_UP = #$0C61
!IH_ARROW_RIGHT = #$0C62
!IH_ARROW_DOWN = #$0C63

!IH_PAUSE = #$0100 ; right
!IH_SLOWDOWN = #$0400 ; down
!IH_SPEEDUP = #$0800 ; up
!IH_RESET = #$0200 ; left
!IH_STATUS_R = #$0010 ; r
!IH_STATUS_L = #$0020 ; l

!ram_game_loop_extras = $0A00

!IH_INPUT_UP = $7E09AA
!IH_INPUT_DOWN = $7E09AC
!IH_INPUT_LEFT = $7E09AE
!IH_INPUT_RIGHT = $7E09B0
!IH_INPUT_SHOOT = $7E09B2
!IH_INPUT_JUMP = $7E09B4
!IH_INPUT_RUN = $7E09B6
!IH_INPUT_ITEM_CANCEL = $7E09B8
!IH_INPUT_ITEM_SELECT = $7E09BA
!IH_INPUT_ANGLE_UP = $7E09BC
!IH_INPUT_ANGLE_DOWN = $7E09BE

; Pointers to single queue soundfx/music
!SFX_LIB1 = $80903F
!SFX_LIB2 = $8090C1
!SFX_LIB3 = $809143
;!MUSIC_ROUTINE = $808FC1  ; duplicated here for reference


; -----
; SRAM
; -----

!sram_initialized = $702000

!sram_ctrl_menu = $702002
!sram_ctrl_kill_enemies = $702004
!sram_ctrl_full_equipment = $702006
!sram_ctrl_reset_segment_timer = $702008
!sram_ctrl_reset_segment_later = $70200A
!sram_ctrl_load_state = $70200C
!sram_ctrl_save_state = $70200E
!sram_ctrl_load_last_preset = $702010
!sram_ctrl_random_preset = $702012
!sram_ctrl_save_custom_preset = $702014
!sram_ctrl_load_custom_preset = $702016

; FREE SPACE ^

!sram_artificial_lag = $702020
!sram_rerandomize = $702022
!sram_fanfare_toggle = $702024
!sram_frame_counter_mode = $702026
!sram_display_mode = $702028
!sram_music_toggle = $70202A
!sram_last_preset = $70202C
!sram_save_has_set_rng = $70202E
!sram_preset_category = $702030
!sram_room_strat = $702032
!sram_sprite_prio_flag = $702034
!sram_metronome_tickrate = $702036
!sram_metronome_sfx = $702038
!sram_custom_preset_slot = $70203A
!sram_preset_enemies = $70203C

; FREE SPACE ^


; ----------
; Save/Load
; ----------

; Savestate code variables
!SS_BANK = $8000

!SS_INPUT_CUR = $8B
!SS_INPUT_NEW = $8F
!SS_INPUT_PREV = $97

!SRAM_DMA_BANK = $770000
!SRAM_SAVED_SP = $774004

; SM specific things
!SRAM_MUSIC_BANK = $701FD0
!SRAM_MUSIC_TRACK = $701FD2
!MUSIC_BANK = $07F3
!MUSIC_TRACK = $07F5
!MUSIC_ROUTINE = $808FC1



; ----------------------------------------------------------------------- ;
;                             Custom Features                             ;
; ----------------------------------------------------------------------- ;

!ram_HUD_top = $7FFC00
!ram_HUD_middle = $7FFC02
!ram_HUD_bottom = $7FFC03

;!ram_cooldown_counter = $7FFB32
;!ram_iframe_counter = $7FFB3A
;!ram_charge_counter = $7FFB1C
;!ram_xfac_counter = $7FFB1E
;!ram_ridleygrab = $7FFBE2
;!ram_countdamage_hud = $7FFBE8

!ram_infinite_ammo = $7FFC10
!ram_infiniteammo_check = $7FFC12
!ram_ammo_missiles = $05C9
!ram_ammo_supers = $05CB
!ram_ammo_powerbombs = $05CD

!ram_countdamage = $0B0C
!ram_display_backup = $7FFC14

!ram_magnetstairs = $7FFC16

!ram_dboost_state = $7FFC18
!ram_dboost_kbmax = $7FFC1A
!ram_dboost_kb = $7FFC1C
!ram_dboost_counter = $7FFC1E

; FREE SPACE ^

if !FEATURE_EXTRAS
    !ram_noclip = $7FFC30
    !ram_steamcollision = $7FFC32
; FREE SPACE ^
endif

!ram_enemy0_last_xpos = $7FFC40
!ram_enemy0_last_ypos = $7FFC42
;!ram_enemy1_last_xpos = $7FFC44
;!ram_enemy1_last_ypos = $7FFC46
!ram_enemy2_last_xpos = $7FFC48
!ram_enemy2_last_ypos = $7FFC4A
;!ram_enemy3_last_xpos = $7FFC4C
;!ram_enemy3_last_ypos = $7FFC4E
!ram_enemy4_last_xpos = $7FFC50
!ram_enemy4_last_ypos = $7FFC52
;!ram_enemy5_last_xpos = $7FFC54
;!ram_enemy5_last_ypos = $7FFC56
!ram_enemy6_last_xpos = $7FFC58
!ram_enemy6_last_ypos = $7FFC5A
!ram_enemy7_last_xpos = $7FFC5C
!ram_enemy7_last_ypos = $7FFC5E
!ram_enemy8_last_xpos = $7FFC60
!ram_enemy8_last_ypos = $7FFC62
!ram_radar1 = $7FFC64
!ram_radar2 = $7FFC66

; FREE SPACE ^

!ram_custompalette_menuborder = $7FFCE0
!ram_custompalette_menuheaderoutline = $7FFCE2
!ram_custompalette_menutext = $7FFCE4
!ram_custompalette_menubackground = $7FFCE6
!ram_custompalette_menunumoutline = $7FFCE8
!ram_custompalette_menunumfill = $7FFCEA
!ram_custompalette_menutoggleon = $7FFCEC
!ram_custompalette_menuseltext = $7FFCEE
!ram_custompalette_menuseltextbg = $7FFCF0
!ram_custompalette_menunumseloutline = $7FFCF2
!ram_custompalette_menunumsel = $7FFCF4

; FREE SPACE ^

!ram_soundtest_lib1 = $7FFCF8
!ram_soundtest_lib2 = $7FFCFA
!ram_soundtest_lib3 = $7FFCFC
!ram_soundtest_music = $7FFCFE


; ------------
; Pointers
; ------------

!ram_game_loop_extras = $0A00


; -----
; SRAM for custom features
; -----

!sram_ctrl_reveal_damage = $702100
!sram_ctrl_randomize_rng = $702102

!sram_countdamage = $702110
!sram_menu_background = $702112
!sram_healthalarm = $70211A

; FREE SPACE ^

!sram_superhud = $702182
!sram_superhud_bottom = $702184
!sram_superhud_middle = $702186
!sram_superhud_top = $702188

!sram_dummy_on = $70218A
!sram_dummy_off = $70218C
!sram_dummy_num = $70218E

!sram_presetrando = $702190
!sram_presetrando_morph = $702192
!sram_presetrando_charge = $702194
!sram_presetrando_max_etanks = $702196
!sram_presetrando_max_reserves = $702198
!sram_presetrando_max_missiles = $7021A0
!sram_presetrando_max_supers = $7021AA
!sram_presetrando_max_pbs = $7021AC
!sram_presetrando_beampref = $7021AE

; do not change order without updating custom palette profiles in menu.asm
!sram_custompalette_menuborder = $7020B0
!sram_custompalette_menuborder_hi = $7020B2
!sram_custompalette_menuborder_lo = $7020B4
!sram_custompalette_menuheaderoutline = $7020B6
!sram_custompalette_menuheaderoutline_hi = $7020B8
!sram_custompalette_menuheaderoutline_lo = $7020BA
!sram_custompalette_menutext = $7020BC
!sram_custompalette_menutext_hi = $7020BE
!sram_custompalette_menutext_lo = $7020C0
!sram_custompalette_menunumoutline = $7020C2
!sram_custompalette_menunumoutline_hi = $7020C4
!sram_custompalette_menunumoutline_lo = $7020C6
!sram_custompalette_menunumfill = $7020C8
!sram_custompalette_menunumfill_hi = $7020CA
!sram_custompalette_menunumfill_lo = $7020CC
!sram_custompalette_menutoggleon = $7020CE
!sram_custompalette_menutoggleon_hi = $7020D0
!sram_custompalette_menutoggleon_lo = $7020D2
!sram_custompalette_menuseltext = $7020D4
!sram_custompalette_menuseltext_hi = $7020D6
!sram_custompalette_menuseltext_lo = $7020D8
!sram_custompalette_menuseltextbg = $7020DA
!sram_custompalette_menuseltextbg_hi = $7020DC
!sram_custompalette_menuseltextbg_lo = $7020DE
!sram_custompalette_menubackground = $7020E0
!sram_custompalette_menubackground_hi = $7020E2
!sram_custompalette_menubackground_lo = $7020E4
!sram_custompalette_menunumseloutline = $7020E6
!sram_custompalette_menunumseloutline_hi = $7020E8
!sram_custompalette_menunumseloutline_lo = $7020EA
!sram_custompalette_menunumsel = $7020EC
!sram_custompalette_menunumsel_hi = $7020EE
!sram_custompalette_menunumsel_lo = $7020F0
!sram_custompalette_profile = $7020F2

!sram_customsfx_move = $7020F4
!sram_customsfx_toggle = $7020F6
!sram_customsfx_number = $7020F8
!sram_customsfx_confirm = $7020FA
!sram_customsfx_goback = $7020FC
