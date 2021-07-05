!ram_gametime_room = $7FFB00
!ram_last_gametime_room = $7FFB02
!ram_realtime_room = $7FFB44
!ram_last_realtime_room = $7FFB46
!ram_last_room_lag = $7FFB48
!ram_transition_counter = $7FFB0E
!ram_last_door_lag_frames = $7FFB10

!ram_armed_shine_duration = $7FFB14
!ram_etanks = $7FFB12 ; ??
!ram_max_etanks = $7FFB24 ; ??
!ram_last_hp = $7FFB9A

!ram_slowdown_mode = $7EFFFC
!ram_slowdown_frames = $7FFB52
!ram_shine_dash_held_late = $7FFB1A
!ram_shine_counter = $7FFB30
;!ram_cooldown_counter = $7FFB32
!ram_xpos = $7FFB34
!ram_ypos = $7FFB36
!ram_dash_counter = $7FFB38
;!ram_iframe_counter = $7FFB3A
!ram_subpixel_pos = $7FFB3C
!ram_mb_hp = $7FFB3E
!ram_enemy_hp = $7FFB40
!ram_horizontal_speed = $7FFB58
!ram_vertical_speed = $7FFB5A
!ram_magic_pants_enabled = $7FFB64
!ram_magic_pants_state = $7FFB66
!ram_magic_pants_pal1 = $7FFB70
!ram_magic_pants_pal2 = $7FFB72
!ram_magic_pants_pal3 = $7FFB74
;!ram_charge_counter = $7FFB1C
;!ram_xfac_counter = $7FFB1E
!ram_map_counter = $7FFB8A
!ram_vcounter_data = $7FFB8C
!ram_minimap = $7FFB98
!ram_shot_timer = $7FFB9E

!ram_ammo_missiles = $05C9 ; debug mode would use these for roughly the same purpose
!ram_ammo_supers = $05CB
!ram_ammo_powerbombs = $05CD
!ram_countdamage = $0B0C

!ram_display_backup = $7FFBE0
;!ram_ridleygrab = $7FFBE2
!ram_infinite_ammo = $7FFBE4
!ram_infiniteammo_check = $7FFBE6
;!ram_countdamage_hud = $7FFBE8
!ram_dboost_state = $7FFBEA
!ram_dboost_kbmax = $7FFBEC
!ram_dboost_kb = $7FFBEE
!ram_dboost_counter = $7FFBF0

if !FEATURE_EXTRAS
    !ram_noclip = $7FFBFC
    !ram_steamcollision = $7FFBFE
endif

!ram_kraid_rng = $7FFBA6 ; $7FFB78 on master, moved cause it's very tight here
!ram_phantoon_rng_1 = $7FFB76
!ram_phantoon_rng_2 = $7FFB78
!ram_phantoon_rng_3 = $7FFB7A
!ram_crocomire_rng = $7FFB7C
!ram_draygon_rng_left = $7FFB7E
!ram_draygon_rng_right = $7FFB80
!ram_botwoon_rng = $7FFB86
!ram_room_has_set_rng = $7FFB88

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

!ram_watch_left = $7FFC30
!ram_watch_left_hud = $7FFC32
!ram_watch_left_hi = $7FFC34
!ram_watch_left_lo = $7FFC36
!ram_watch_right = $7FFC38
!ram_watch_right_hud = $7FFC3A
!ram_watch_right_hi = $7FFC3C
!ram_watch_right_lo = $7FFC3E
!ram_watch_edit_left = $7FFC40
!ram_watch_edit_left_hi = $7FFC42
!ram_watch_edit_left_lo = $7FFC44
!ram_watch_edit_right = $7FFC46
!ram_watch_edit_right_hi = $7FFC48
!ram_watch_edit_right_lo = $7FFC4A
!ram_watch_edit_lock_left = $7FFC4C
!ram_watch_edit_lock_right = $7FFC4E

!ram_soundtest_lib1 = $7FFC92
!ram_soundtest_lib2 = $7FFC94
!ram_soundtest_lib3 = $7FFC96
!ram_soundtest_music = $7FFC98

!ram_custompalette_menuborder = $7FFC9A
!ram_custompalette_menuheaderoutline = $7FFC9C
!ram_custompalette_menutext = $7FFC9E
!ram_custompalette_menubackground = $7FFCA0
!ram_custompalette_menunumoutline = $7FFCA2
!ram_custompalette_menunumfill = $7FFCA4
!ram_custompalette_menutoggleon = $7FFCA6
!ram_custompalette_menuseltext = $7FFCA8
!ram_custompalette_menuseltextbg = $7FFCAA
!ram_custompalette_menunumseloutline = $7FFCAC
!ram_custompalette_menunumsel = $7FFCAE

!ram_tmp_1 = $7FFB4C
!ram_tmp_2 = $7FFB4E
!ram_tmp_3 = $7FFB08
!ram_tmp_4 = $7FFB0A
!ram_transition_flag = $7FFB16
!ram_transition_flag_2 = $7FFB2C
!ram_pct_1 = $7FFB20
!ram_pct_2 = $7FFB26
!ram_ih_controller = $7FFB42
!ram_slowdown_controller_1 = $7FFB54
!ram_slowdown_controller_2 = $7FFB56

!ram_seg_rt_frames = $7FFBA0
!ram_seg_rt_seconds = $7FFBA2
!ram_seg_rt_minutes = $7FFBA4 ; A6 taken

!ram_cm_ctrl_mode = $7FFBC0
!ram_cm_ctrl_timer = $7FFBC2
!ram_cm_ctrl_last_input = $7FFBC4

!ram_roomstrat_counter = $7FFBC6
!ram_roomstrat_state = $7FFBC8
!ram_walljump_counter = $7FFBCA
!ram_quickdrop_counter = $7FFBCC

!ram_shinetune_early_1 = $7FFBD0
!ram_shinetune_late_1 = $7FFBD2
!ram_shinetune_early_2 = $7FFBD4
!ram_shinetune_late_2 = $7FFBD6
!ram_shinetune_early_3 = $7FFBD8
!ram_shinetune_late_3 = $7FFBDA
!ram_shinetune_early_4 = $7FFBDC
!ram_shinetune_late_4 = $7FFBDE

; -----
; SRAM
; -----

!sram_initialized = $702000

!sram_ctrl_menu = $702002
!sram_ctrl_kill_enemies = $702004
!sram_ctrl_full_equipment = $702006
!sram_ctrl_reset_segment_timer = $702008
!sram_ctrl_load_state = $70200A
!sram_ctrl_save_state = $70200C
!sram_ctrl_load_last_preset = $70200E
!sram_ctrl_random_preset = $702024

!sram_ctrl_reveal_damage = $702062
!sram_ctrl_randomize_rng = $702064

!sram_artificial_lag = $702010
!sram_rerandomize = $702012
!sram_fanfare_toggle = $702014
!sram_frame_counter_mode = $702016
!sram_display_mode = $702018
!sram_music_toggle = $70201A
!sram_last_preset = $70201C
!sram_save_has_set_rng = $70201E
!sram_preset_category = $702020
!sram_room_strat = $702022
!sram_sprite_prio_flag = $702026

!sram_countdamage = $702060
!sram_menu_background = $702062
!sram_dummy_on = $702064
!sram_dummy_off = $702066
!sram_dummy_num = $702068
!sram_healthalarm = $70206A

!sram_presetrando = $702090
!sram_presetrando_morph = $702092
!sram_presetrando_charge = $702094
!sram_presetrando_max_etanks = $702096
!sram_presetrando_max_reserves = $702098
!sram_presetrando_max_missiles = $70209A
!sram_presetrando_max_supers = $70209C
!sram_presetrando_max_pbs = $70209E
!sram_presetrando_beampref = $7020A0

!sram_custompalette = $7020A2
!sram_custompalette_hudoutline = $7020A4
!sram_custompalette_hudoutline_hi = $7020A6
!sram_custompalette_hudoutline_lo = $7020A8
!sram_custompalette_hudfill = $7020AA
!sram_custompalette_hudfill_hi = $7020AC
!sram_custompalette_hudfill_lo = $7020AE
!sram_custompalette_menuborder = $7020B0
; the rest of custompalette must be in this order
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


; -------------
; Menu
; -------------

!ram_cm_menu_stack = $7FFFD0 ; 0x10
!ram_cm_cursor_stack = $7FFFE0 ; 0x10
!ram_cm_stack_index = $5D5
!ram_cm_cursor_max = $7FFFF2
!ram_cm_input_timer = $7FFFF4
!ram_cm_controller = $7FFFF6
!ram_cm_menu_bank = $7FFFF8

!ram_cm_etanks = $7FFB90
!ram_cm_reserve = $7FFB92
!ram_cm_leave = $7FFB94
!ram_cm_input_counter = $7FFB96
!ram_cm_last_nmi_counter = $7FFB9C

!ram_hex2dec_first_digit = $14
!ram_hex2dec_second_digit = $16
!ram_hex2dec_third_digit = $18
!ram_hex2dec_rest = $1A

!ram_ctrl1 = $8B
!ram_ctrl1_filtered = $8F

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

; Pointers to single queue soundfx/music
!SFX_LIB1 = $80903F
!SFX_LIB2 = $8090C1
!SFX_LIB3 = $809143
;!MUSIC_ROUTINE = $808FC1  ; duplicated here for reference

; --------
; Infohud
; --------

!IH_CONTROLLER_PRI = $8B
!IH_CONTROLLER_PRI_NEW = $8F
!IH_CONTROLLER_PRI_PREV = $97

!IH_CONTROLLER_SEC = $8D
!IH_CONTROLLER_SEC_NEW = $91
!IH_CONTROLLER_SEC_PREV = $99

!IH_PAUSE = #$0100 ; right
!IH_SLOWDOWN = #$0400 ; down
!IH_SPEEDUP = #$0800 ; up
!IH_RESET = #$0200 ; left
!IH_STATUS_R = #$0010 ; r
!IH_STATUS_L = #$0020 ; l

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

!IH_BLANK = #$2C0F
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
!IH_PERCENT = #$0C0A
!IH_ARROW_LEFT = #$0C60
!IH_ARROW_UP = #$0C61
!IH_ARROW_RIGHT = #$0C62
!IH_ARROW_DOWN = #$0C63

; ------------
; Presets
; ------------

!ram_load_preset = $7FFC00
!ram_cgram_cache = $7FFC02 ; 0x16 bytes

; ----------
; Save/load
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

