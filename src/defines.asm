; ---------------
; Compiler Flags
; ---------------

!FEATURE_SD2SNES ?= 0
!FEATURE_PAL ?= 0
!FEATURE_EXTRAS ?= 0
!ORIGINAL_MESSAGE_TEXT ?= 0
!PRESERVE_WRAM_DURING_SPACETIME ?= 1
!RAW_TILE_GRAPHICS ?= 1

!VERSION_MAJOR = 2
!VERSION_MINOR = 3
!VERSION_BUILD = 4
!VERSION_REV_1 = 1
!VERSION_REV_2 = 0


; ---------
; Work RAM
; ---------

!WRAM_BANK = #$007E
!WRAM_SIZE = #$0200
!WRAM_START = $7EFB00

!ram_load_preset = !WRAM_START+$00
!ram_custom_preset = !WRAM_START+$02
!ram_gametime_room = !WRAM_START+$04
!ram_last_gametime_room = !WRAM_START+$06
!ram_realtime_room = !WRAM_START+$08
!ram_last_realtime_room = !WRAM_START+$0A
!ram_last_room_lag = !WRAM_START+$0C
!ram_last_door_lag_frames = !WRAM_START+$0E
!ram_transition_counter = !WRAM_START+$10
!ram_transition_flag = !WRAM_START+$12
!ram_transition_flag_2 = !WRAM_START+$14

!ram_seg_rt_frames = !WRAM_START+$16
!ram_seg_rt_seconds = !WRAM_START+$18
!ram_seg_rt_minutes = !WRAM_START+$1A
!ram_reset_segment_later = !WRAM_START+$1C

!ram_ih_controller = !WRAM_START+$1E
!ram_slowdown_controller_1 = !WRAM_START+$20
!ram_slowdown_controller_2 = !WRAM_START+$22
!ram_slowdown_frames = !WRAM_START+$24

!ram_tmp_1 = !WRAM_START+$26
!ram_tmp_2 = !WRAM_START+$28
!ram_tmp_3 = !WRAM_START+$2A
!ram_tmp_4 = !WRAM_START+$2C
!ram_last_hp = !WRAM_START+$2E
!ram_pct_1 = !WRAM_START+$30
!ram_pct_2 = !WRAM_START+$32
!ram_armed_shine_duration = !WRAM_START+$34
!ram_minimap = !WRAM_START+$36
!ram_map_counter = !WRAM_START+$38
!ram_vcounter_data = !WRAM_START+$3A
!ram_reserves_last = !WRAM_START+$3C

!ram_sprite_samus_hitbox_active = !WRAM_START+$3E
!ram_sprite_enemy_hitbox_active = !WRAM_START+$40
!ram_sprite_extended_hitbox_active = !WRAM_START+$42
!ram_oob_watch_active = !WRAM_START+$44
!ram_suits_enemy_damage_check = !WRAM_START+$46
!ram_suits_periodic_damage_check = !WRAM_START+$48
!ram_sprite_samusproj_hitbox_active = !WRAM_START+$4A
!ram_sprite_enemyproj_hitbox_active = !WRAM_START+$4C
!ram_fix_scroll_offsets = !WRAM_START+$4E

!ram_magic_pants_enabled = !WRAM_START+$50
!ram_magic_pants_state = !WRAM_START+$52
!ram_magic_pants_pal1 = !WRAM_START+$54
!ram_magic_pants_pal2 = !WRAM_START+$56
!ram_magic_pants_pal3 = !WRAM_START+$58

!ram_room_has_set_rng = !WRAM_START+$5A
!ram_kraid_rng = !WRAM_START+$5C
!ram_crocomire_rng = !WRAM_START+$5E
!ram_phantoon_rng_1 = !WRAM_START+$60
!ram_phantoon_rng_2 = !WRAM_START+$62
!ram_phantoon_rng_3 = !WRAM_START+$64
!ram_phantoon_rng_4 = !WRAM_START+$66
!ram_phantoon_rng_5 = !WRAM_START+$68
!ram_botwoon_rng = !WRAM_START+$6A
!ram_draygon_rng_left = !WRAM_START+$6C
!ram_draygon_rng_right = !WRAM_START+$6E

!ram_game_loop_extras = !WRAM_START+$70
!ram_game_mode_extras = !WRAM_START+$72
!ram_sprite_features_active = !WRAM_START+$74

!ram_metronome = !WRAM_START+$76
!ram_metronome_counter = !WRAM_START+$78

!ram_fix_scroll_offsets = !WRAM_START+$7A
!ram_magnetstairs = !WRAM_START+$7C
!ram_arearando = !WRAM_START+$7E

!ram_watch_bank = !WRAM_START+$80
!ram_watch_write_mode = !WRAM_START+$82
!ram_watch_left = !WRAM_START+$84
!ram_watch_left_hud = !WRAM_START+$86
!ram_watch_right = !WRAM_START+$88
!ram_watch_right_hud = !WRAM_START+$8A
!ram_watch_edit_left = !WRAM_START+$8C
!ram_watch_edit_right = !WRAM_START+$8E
!ram_watch_edit_lock_left = !WRAM_START+$90
!ram_watch_edit_lock_right = !WRAM_START+$92

; ^ FREE SPACE ^ up to +$9E

!ram_HUD_check = !WRAM_START+$A0
!ram_roomstrat_counter = !WRAM_START+$A2
!ram_roomstrat_state = !WRAM_START+$A4
!ram_enemy_hp = !WRAM_START+$A6
!ram_mb_hp = !WRAM_START+$A8
!ram_shot_timer = !WRAM_START+$AA
!ram_shine_counter = !WRAM_START+$AC
!ram_dash_counter = !WRAM_START+$AE
!ram_shinetune_early_1 = !WRAM_START+$B0
!ram_shinetune_late_1 = !WRAM_START+$B2
!ram_shinetune_early_2 = !WRAM_START+$B4
!ram_shinetune_late_2 = !WRAM_START+$B6
!ram_shinetune_early_3 = !WRAM_START+$B8
!ram_shinetune_late_3 = !WRAM_START+$BA
!ram_shinetune_early_4 = !WRAM_START+$BC
!ram_shinetune_late_4 = !WRAM_START+$BE
!ram_shine_dash_held_late = !WRAM_START+$C0
!ram_xpos = !WRAM_START+$C2
!ram_ypos = !WRAM_START+$C4
!ram_subpixel_pos = !WRAM_START+$C6
!ram_horizontal_speed = !WRAM_START+$C8
!ram_vertical_speed = !WRAM_START+$CA
!ram_quickdrop_counter = !WRAM_START+$CC
!ram_walljump_counter = !WRAM_START+$CE

; ^ FREE SPACE ^ up to +$FC

; -----------------------
; RAM (Bank 7E required)
; -----------------------


!ram_slowdown_mode = $7EFBFE

; ---------
; RAM Menu
; ---------

!WRAM_MENU_START = $7EFC00

!ram_cm_stack_index = $05D5
!ram_cm_menu_stack = !WRAM_MENU_START+$00         ; 16 bytes
!ram_cm_cursor_stack = !WRAM_MENU_START+$10       ; 16 bytes

!ram_cm_cursor_max = !WRAM_MENU_START+$20
!ram_cm_input_timer = !WRAM_MENU_START+$22
!ram_cm_controller = !WRAM_MENU_START+$24
!ram_cm_menu_bank = !WRAM_MENU_START+$26

!ram_cm_etanks = !WRAM_MENU_START+$28
!ram_cm_reserve = !WRAM_MENU_START+$2A
!ram_cm_leave = !WRAM_MENU_START+$2C
!ram_cm_input_counter = !WRAM_MENU_START+$2E
!ram_cm_last_nmi_counter = !WRAM_MENU_START+$30

!ram_cm_ctrl_mode = !WRAM_MENU_START+$32
!ram_cm_ctrl_timer = !WRAM_MENU_START+$34
!ram_cm_ctrl_last_input = !WRAM_MENU_START+$36
!ram_cm_ctrl_assign = !WRAM_MENU_START+$38
!ram_cm_ctrl_swap = !WRAM_MENU_START+$3A
!ram_cm_slow_graphics = !WRAM_MENU_START+$3C

; ^ FREE SPACE ^ up to +$7E

; ------------------
; Reusable RAM Menu
; ------------------

; The following RAM may be used multiple times,
; as long as it isn't used multiple times on the same menu page

!ram_cm_watch_left_hi = !WRAM_MENU_START+$80
!ram_cm_watch_left_lo = !WRAM_MENU_START+$82
!ram_cm_watch_left_index_lo = !WRAM_MENU_START+$84
!ram_cm_watch_left_index_hi = !WRAM_MENU_START+$86
!ram_cm_watch_enemy_property = !WRAM_MENU_START+$88
!ram_cm_watch_enemy_index = !WRAM_MENU_START+$8A
!ram_cm_watch_right_hi = !WRAM_MENU_START+$8C
!ram_cm_watch_right_lo = !WRAM_MENU_START+$8E
!ram_cm_watch_right_index_lo = !WRAM_MENU_START+$90
!ram_cm_watch_right_index_hi = !WRAM_MENU_START+$92
!ram_cm_watch_edit_left_hi = !WRAM_MENU_START+$94
!ram_cm_watch_edit_left_lo = !WRAM_MENU_START+$96
!ram_cm_watch_edit_right_hi = !WRAM_MENU_START+$98
!ram_cm_watch_edit_right_lo = !WRAM_MENU_START+$9A
!ram_cm_watch_enemy_side = !WRAM_MENU_START+$9C
!ram_cm_watch_bank = !WRAM_MENU_START+$9E
!ram_cm_watch_common_address = !WRAM_MENU_START+$A0

!ram_cm_botwoon_rng = !WRAM_MENU_START+$80

; ^ FREE SPACE ^ up to +$CE

!ram_cgram_cache = !WRAM_MENU_START+$D0         ; 30 bytes

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
!ACTION_CTRL_INPUT        = #$0018

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
!IH_ELEVATOR = #$08CE
!IH_SHINESPARK = #$1C47
!IH_HEALTHBOMB = #$085A
!IH_RESERVE_AUTO = #$0C32
!IH_RESERVE_EMPTY = #$0C33
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

!IH_INPUT_HELD = #$0001
!IH_INPUT_START = #$1000
!IH_INPUT_UP = #$0800
!IH_INPUT_DOWN = #$0400
!IH_INPUT_LEFT = #$0200
!IH_INPUT_RIGHT = #$0100

!CTRL_B = #$8000
!CTRL_Y = #$4000
!CTRL_SELECT = #$2000
!CTRL_A = #$0080
!CTRL_X = #$0040
!CTRL_L = #$0020
!CTRL_R = #$0010

!IH_INPUT_SHOOT = $7E09B2
!IH_INPUT_JUMP = $7E09B4
!IH_INPUT_RUN = $7E09B6
!IH_INPUT_ITEM_CANCEL = $7E09B8
!IH_INPUT_ITEM_SELECT = $7E09BA
!IH_INPUT_ANGLE_UP = $7E09BE
!IH_INPUT_ANGLE_DOWN = $7E09BC


; --------------
; Vanilla Labels
; --------------

!MUSIC_ROUTINE = $808FC1
!SFX_LIB1 = $80903F
!SFX_LIB2 = $8090C1
!SFX_LIB3 = $809143

!OAM_STACK_POINTER = $0590
!ROOM_ID = $079B
!SOUND_TIMER = $0686
!MUSIC_DATA = $07F3
!MUSIC_TRACK = $07F5
!LAYER1_X = $0911
!LAYER1_Y = $0915
!GAMEMODE = $0998
!SAMUS_ITEMS_EQUIPPED = $09A2
!SAMUS_ITEMS_COLLECTED = $09A4
!SAMUS_BEAMS_EQUIPPED = $09A6
!SAMUS_BEAMS_COLLECTED = $09A8
!SAMUS_RESERVE_MODE = $09C0
!SAMUS_HP = $09C2
!SAMUS_HP_MAX = $09C4
!SAMUS_MISSILES = $09C6
!SAMUS_MISSILES_MAX = $09C8
!SAMUS_SUPERS = $09CA
!SAMUS_SUPERS_MAX = $09CC
!SAMUS_PBS = $09CE
!SAMUS_PBS_MAX = $09D0
!SAMUS_RESERVE_MAX = $09D4
!SAMUS_RESERVE_ENERGY = $09D6
!SAMUS_POSE = $0A1C
!SAMUS_POSE_DIRECTION = $0A1E
!SAMUS_MOVEMENT_TYPE = $0A1F
!SAMUS_X = $0AF6
!SAMUS_X_SUBPX = $0AF8
!SAMUS_Y = $0AFA
!SAMUS_Y_SUBPX = $0AFC
!SAMUS_X_RADIUS = $0AFE
!SAMUS_Y_RADIUS = $0B00
!SAMUS_SPRITEMAP_X = $0B04
!SAMUS_Y_SUBSPEED = $0B2C
!SAMUS_Y_SPEED = $0B2E
!SAMUS_Y_DIRECTION = $0B36
!SAMUS_DASH_COUNTER = $0B3F
!SAMUS_PROJ_X = $0B64
!SAMUS_PROJ_Y = $0B78
!SAMUS_PROJ_RADIUS_X = $0BB4
!SAMUS_PROJ_RADIUS_Y = $0BC8
!SAMUS_COOLDOWN = $0CCC
!SAMUS_CHARGE_TIMER = $0CD0
!ENEMY_X = $0F7A
!ENEMY_Y = $0F7E
!ENEMY_X_RADIUS = $0F82
!ENEMY_Y_RADIUS = $0F84
!ENEMY_PROPERTIES_2 = $0F88
!ENEMY_HP = $0F8C
!ENEMY_SPRITEMAP = $0F8E
!ENEMY_BANK = $0FA6
!SAMUS_IFRAME_TIMER = $18A8
!ENEMY_PROJ_ID = $1997
!ENEMY_PROJ_X = $1A4B
!ENEMY_PROJ_Y = $1A93
!ENEMY_PROJ_RADIUS = $1BB3


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

; ^ FREE SPACE ^

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
!sram_suit_properties = $F0203E
!sram_top_display_mode = $F02040
!sram_healthalarm = $F02042
!sram_room_layout = $F02044
!sram_cutscenes = $F02046

; ^ FREE SPACE ^ up to $F03000


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
!SRAM_MUSIC_DATA = $701FD0
!SRAM_MUSIC_TRACK = $701FD2
!SRAM_SOUND_TIMER = $701FD4



; ----------------------------------------------------------------------- ;
;                             Custom Features                             ;
; ----------------------------------------------------------------------- ;

!ram_HUD_top = $F02100
!ram_HUD_middle = $F02102
!ram_HUD_bottom = $F02104

!ram_watch_bank = $F02106
!ram_watch_left_index = $F02108
!ram_watch_right_index = $F0210A

!ram_cm_rng = $F0210C

; FREE SPACE ^

!ram_infinite_ammo = $F02110
!ram_infiniteammo_check = $F02112
!ram_ammo_missiles = $05C9
!ram_ammo_supers = $05CB
!ram_ammo_powerbombs = $05CD

!ram_countdamage = $0B0C
!ram_display_backup = $F02114

!ram_magnetstairs = $F02116

!ram_dboost_state = $F02118
!ram_dboost_kbmax = $F0211A
!ram_dboost_kb = $F0211C
!ram_dboost_counter = $F0211E
!ram_spark_icon = $F02120
!ram_lag_counter = $F02122
!ram_lag_counter_HUD = $F02124

; FREE SPACE ^

if !FEATURE_EXTRAS
    !ram_noclip = $F02130
    !ram_steamcollision = $F02132
; FREE SPACE ^
endif

!ram_enemy0_last_xpos = $F02140
!ram_enemy0_last_ypos = $F02142
;!ram_enemy1_last_xpos = $F02144
;!ram_enemy1_last_ypos = $F02146
!ram_enemy2_last_xpos = $F02148
!ram_enemy2_last_ypos = $F0214A
;!ram_enemy3_last_xpos = $F0214C
;!ram_enemy3_last_ypos = $F0214E
!ram_enemy4_last_xpos = $F02150
!ram_enemy4_last_ypos = $F02152
;!ram_enemy5_last_xpos = $F02154
;!ram_enemy5_last_ypos = $F02156
!ram_enemy6_last_xpos = $F02158
!ram_enemy6_last_ypos = $F0215A
!ram_enemy7_last_xpos = $F0215C
!ram_enemy7_last_ypos = $F0215E
!ram_enemy8_last_xpos = $F02160
!ram_enemy8_last_ypos = $F02162
!ram_radar1 = $F02164
!ram_radar2 = $F02166

; FREE SPACE ^

!ram_custompalette_menuborder = $F021E0
!ram_custompalette_menuheaderoutline = $F021E2
!ram_custompalette_menutext = $F021E4
!ram_custompalette_menubackground = $F021E6
!ram_custompalette_menunumoutline = $F021E8
!ram_custompalette_menunumfill = $F021EA
!ram_custompalette_menutoggleon = $F021EC
!ram_custompalette_menuseltext = $F021EE
!ram_custompalette_menuseltextbg = $F021F0
!ram_custompalette_menunumseloutline = $F021F2
!ram_custompalette_menunumsel = $F021F4

; FREE SPACE ^

!ram_soundtest_lib1 = $F021F8
!ram_soundtest_lib2 = $F021FA
!ram_soundtest_lib3 = $F021FC
!ram_soundtest_music = $F021FE


; ---------
; Pointers
; ---------

!PRESET_SLOTS = $F03000


; -----
; SRAM for custom features
; -----

!sram_ctrl_reveal_damage = $F02200
!sram_ctrl_randomize_rng = $F02202
!sram_ctrl_force_stand = $F02204
!sram_ctrl_update_timers = $F02206

!sram_scroll_button = $F02210
!sram_cm_scroll_button = $F02212
!sram_cm_scroll_delay = $F02214

!sram_countdamage = $F02220
!sram_menu_background = $F02222

; FREE SPACE ^

!sram_superhud = $F02282
!sram_superhud_bottom = $F02284
!sram_superhud_middle = $F02286
!sram_superhud_top = $F02288

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

!sram_dummy_on = $F022FA
!sram_dummy_off = $F022FC
!sram_dummy_num = $F022FE

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

