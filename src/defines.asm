; ---------------
; Compiler Flags
; ---------------

!FEATURE_SD2SNES ?= 0
!FEATURE_PAL ?= 0
!FEATURE_EXTRAS ?= 0
!ORIGINAL_MESSAGE_TEXT ?= 0

; ----
; RAM
; ----

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
!ram_last_elevator = $7FFB2E
!ram_pct_1 = $7FFB30
!ram_pct_2 = $7FFB32
!ram_armed_shine_duration = $7FFB34
!ram_minimap = $7FFB36
!ram_map_counter = $7FFB38
!ram_vcounter_data = $7FFB3A
!ram_sprite_hitbox_active = $7FFB3E
!ram_oob_watch_active = $7FFB40
!ram_oob_watch_lag_backup = $7FFB42
!ram_custom_preset = $7FFB44

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

!ram_game_loop_extras = $7FFB6C
!ram_game_mode_extras = $7FFB6E

!ram_metronome = $7FFB70
!ram_metronome_counter = $7FFB72


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


; -----
; Menu
; -----

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

!ACTION_TOGGLE            = #$0000
!ACTION_TOGGLE_BIT        = #$0002
!ACTION_JSR               = #$0004
!ACTION_NUMFIELD          = #$0006
!ACTION_CHOICE            = #$0008
!ACTION_CTRL_SHORTCUT     = #$000A
!ACTION_NUMFIELD_HEX      = #$000C
!ACTION_NUMFIELD_WORD     = #$000E
!ACTION_TOGGLE_INVERTED   = #$0010
!ACTION_NUMFIELD_COLOR    = #$0012
!ACTION_NUMFIELD_HEX_WORD = #$0014
!ACTION_NUMFIELD_SOUND    = #$0016

; using macros instead of these in custom builds
!SOUND_MENU_MOVE = $0039
!SOUND_MENU_JSR = $0039
!SOUND_MENU_FAIL = $0007


; ---------
; Pointers
; ---------

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
!IH_ELEVATOR = #$1CCE
!IH_SHINESPARK = #$0C47
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

!IH_INPUT_START = #$1000
!IH_INPUT_UP = #$0800
!IH_INPUT_DOWN = #$0400
!IH_INPUT_LEFT = #$0200
!IH_INPUT_RIGHT = #$0100
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

!sram_initialized = $F02000

!sram_ctrl_menu = $F02002
!sram_ctrl_kill_enemies = $F02004
!sram_ctrl_full_equipment = $F02006
!sram_ctrl_reset_segment_timer = $F02008
!sram_ctrl_reset_segment_later = $F0200A
!sram_ctrl_load_state = $F0200C
!sram_ctrl_save_state = $F0200E
!sram_ctrl_load_last_preset = $F02010
!sram_ctrl_random_preset = $F02012
!sram_ctrl_save_custom_preset = $F02014
!sram_ctrl_load_custom_preset = $F02016
!sram_ctrl_inc_custom_preset = $F02018
!sram_ctrl_dec_custom_preset = $F0201A
!sram_ctrl_toggle_tileviewer = $F0201C

; FREE SPACE ^

!sram_artificial_lag = $F02020
!sram_rerandomize = $F02022
!sram_fanfare_toggle = $F02024
!sram_frame_counter_mode = $F02026
!sram_display_mode = $F02028
!sram_music_toggle = $F0202A
!sram_last_preset = $F0202C
!sram_save_has_set_rng = $F0202E
!sram_preset_category = $F02030
!sram_custom_preset_slot = $F02032
!sram_room_strat = $F02034
!sram_sprite_prio_flag = $F02036
!sram_metronome_tickrate = $F02038
!sram_metronome_sfx = $F0203A
!sram_status_icons = $F0203C

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
!ram_spark_icon = $7FFC20

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


; ---------
; Pointers
; ---------


; -----
; SRAM for custom features
; -----

!sram_ctrl_reveal_damage = $F02200
!sram_ctrl_randomize_rng = $F02202
!sram_ctrl_force_stand = $F02204

!sram_countdamage = $F02210
!sram_menu_background = $F02212
!sram_healthalarm = $F0221A

; FREE SPACE ^

!sram_superhud = $F02282
!sram_superhud_bottom = $F02284
!sram_superhud_middle = $F02286
!sram_superhud_top = $F02288

!sram_dummy_on = $F0228A
!sram_dummy_off = $F0228C
!sram_dummy_num = $F0228E

!sram_presetrando = $F02290
!sram_presetrando_morph = $F02292
!sram_presetrando_charge = $F02294
!sram_presetrando_max_etanks = $F02296
!sram_presetrando_max_reserves = $F02298
!sram_presetrando_max_missiles = $F0229A
!sram_presetrando_max_supers = $F0229C
!sram_presetrando_max_pbs = $F0229E
!sram_presetrando_beampref = $F022A0

!sram_custompalette_blue = $F022A2
!sram_custompalette_green = $F022A4
!sram_custompalette_red = $F022A6

; FREE SPACE ^

; do not change order without updating custom palette profiles in menu.asm
!sram_custompalette_menuborder = $F022B0
!sram_custompalette_menuheaderoutline = $F022B2
!sram_custompalette_menutext = $F022B4
!sram_custompalette_menunumoutline = $F022B6
!sram_custompalette_menunumfill = $F022B8
!sram_custompalette_menutoggleon = $F022BA
!sram_custompalette_menuseltext = $F022BC
!sram_custompalette_menuseltextbg = $F022BE
!sram_custompalette_menubackground = $F022C0
!sram_custompalette_menunumseloutline = $F022C2
!sram_custompalette_menunumsel = $F022C4
!sram_custompalette_profile = $F022C6

; FREE SPACE ^

!sram_customsfx_move = $F022F0
!sram_customsfx_toggle = $F022F2
!sram_customsfx_number = $F022F4
!sram_customsfx_confirm = $F022F6
!sram_customsfx_goback = $F022F8
