; ---------------
; Symbol Export
; ---------------


; ----
; WRAM
; ----

incsrc wram_symbols.asm


; ---------
; Hack RAM
; ---------

;FREE_SPACE = $7EFD00+$00
ram_gametime_room = $7EFD00+$02
ram_last_gametime_room = $7EFD00+$04
ram_realtime_room = $7EFD00+$06
ram_last_realtime_room = $7EFD00+$08
ram_last_room_lag = $7EFD00+$0A
ram_last_door_lag_frames = $7EFD00+$0C
ram_transition_counter = $7EFD00+$0E
ram_transition_flag = $7EFD00+$10
ram_last_realtime_door = $7EFD00+$12

ram_seg_rt_frames = $7EFD00+$14
ram_seg_rt_seconds = $7EFD00+$16
ram_seg_rt_minutes = $7EFD00+$18
ram_reset_segment_later = $7EFD00+$1A

ram_ih_controller = $7EFD00+$1C
ram_slowdown_controller_1 = $7EFD00+$1E
ram_slowdown_controller_2 = $7EFD00+$20
ram_slowdown_frames = $7EFD00+$22

ram_momentum_sum = $7EFD00+$24
ram_momentum_count = $7EFD00+$26
ram_momentum_direction = $7EFD00+$28
ram_momentum_last = $7EFD00+$2A

ram_last_hp = $7EFD00+$2C
ram_reserves_last = $7EFD00+$2E

ram_metronome_counter = $7EFD00+$30
ram_armed_shine_duration = $7EFD00+$32
ram_map_counter = $7EFD00+$34
ram_vcounter_data = $7EFD00+$36

ram_magic_pants_state = $7EFD00+$38
ram_magic_pants_pal1 = $7EFD00+$3A
ram_magic_pants_pal2 = $7EFD00+$3C
ram_magic_pants_pal3 = $7EFD00+$3E

ram_suits_enemy_damage_check = $7EFD00+$40
ram_suits_periodic_damage_check = $7EFD00+$42

; FREE SPACE ^ up to +$4E

ram_room_has_set_rng = $7EFD00+$50

ram_spacetime_read_address = $7EFD00+$52
ram_spacetime_read_bank = $7EFD00+$54
ram_spacetime_y = $7EFD00+$56

ram_watch_left_hud = $7EFD00+$58
ram_watch_right_hud = $7EFD00+$5A
ram_HUD_check = $7EFD00+$5C
ram_roomstrat_counter = $7EFD00+$5E
ram_roomstrat_state = $7EFD00+$60
ram_enemy_hp = $7EFD00+$62
ram_mb_hp = $7EFD00+$64
ram_shot_timer = $7EFD00+$66
ram_shine_counter = $7EFD00+$68
ram_dash_counter = $7EFD00+$6A
ram_shinetune_early_1 = $7EFD00+$6C
ram_shinetune_late_1 = $7EFD00+$6E
ram_shinetune_early_2 = $7EFD00+$70
ram_shinetune_late_2 = $7EFD00+$72
ram_shinetune_early_3 = $7EFD00+$74
ram_shinetune_late_3 = $7EFD00+$76
ram_shinetune_early_4 = $7EFD00+$78
ram_shinetune_late_4 = $7EFD00+$7A
ram_shine_dash_held_late = $7EFD00+$7C
ram_xpos = $7EFD00+$7E
ram_ypos = $7EFD00+$80
ram_subpixel_pos = $7EFD00+$82
ram_horizontal_speed = $7EFD00+$84
ram_vertical_speed = $7EFD00+$86
ram_quickdrop_counter = $7EFD00+$88
ram_walljump_counter = $7EFD00+$8A
ram_fail_sum = $7EFD00+$8C
ram_fail_count = $7EFD00+$8E

ram_load_preset = $7EFD00+$90
ram_custom_preset = $7EFD00+$92

; WRAM variables below this point are PERSISTENT -- they
; maintain their value across savestates. Use this section
; for variables such as user settings that do not depend
; on the current game state.

ram_game_loop_extras = $7EFD00+$A0
ram_game_mode_extras = $7EFD00+$A2
ram_metronome = $7EFD00+$A4
ram_minimap = $7EFD00+$A6
ram_magic_pants_enabled = $7EFD00+$A8
ram_space_pants_enabled = $7EFD00+$AA
ram_random_preset_rng = $7EFD00+$AC
ram_random_preset_value = $7EFD00+$AE
ram_fix_scroll_offsets = $7EFD00+$B0
ram_pacifist = $7EFD00+$B2
ram_freeze_on_load = $7EFD00+$B4
ram_spacetime_infohud = $7EFD00+$B6

ram_kraid_rng = $7EFD00+$B8
ram_crocomire_rng = $7EFD00+$BA
ram_phantoon_rng_round_1 = $7EFD00+$BC
ram_phantoon_rng_round_2 = $7EFD00+$BE
ram_phantoon_rng_inverted = $7EFD00+$C0
ram_phantoon_rng_eyeclose = $7EFD00+$C2
ram_phantoon_rng_flames = $7EFD00+$C4
ram_phantoon_rng_next_flames = $7EFD00+$C6
ram_botwoon_rng = $7EFD00+$C8
ram_draygon_rng_left = $7EFD00+$CA
ram_draygon_rng_right = $7EFD00+$CC

ram_sprite_features_active = $7EFD00+$CE
ram_sprite_samus_hitbox_active = $7EFD00+$D0
ram_sprite_enemy_hitbox_active = $7EFD00+$D2
ram_sprite_extended_hitbox_active = $7EFD00+$D4
ram_oob_watch_active = $7EFD00+$D6
ram_sprite_samusproj_hitbox_active = $7EFD00+$D8
ram_sprite_enemyproj_hitbox_active = $7EFD00+$DA
ram_sprite_custom_hitbox_active = $7EFD00+$DC

ram_watch_bank = $7EFD00+$DE
ram_watch_write_mode = $7EFD00+$E0
ram_watch_left = $7EFD00+$E2
ram_watch_right = $7EFD00+$E4
ram_watch_edit_left = $7EFD00+$E6
ram_watch_edit_right = $7EFD00+$E8
ram_watch_edit_lock_left = $7EFD00+$EA
ram_watch_edit_lock_right = $7EFD00+$EC
ram_watch_left_index = $7EFD00+$EE
ram_watch_right_index = $7EFD00+$F0

; FREE SPACE ^ up to $FE

ram_slowdown_mode = $7EFFFE ; Bank $7E required


; ---------
; RAM Menu
; ---------

ram_tilemap_buffer = $7E5800

ram_cm_stack_index = $05D5
ram_cm_menu_stack = $7EFE00+$00         ; 16 bytes
ram_cm_cursor_stack = $7EFE00+$10       ; 16 bytes

ram_cm_cursor_max = $7EFE00+$20
ram_cm_input_timer = $7EFE00+$22
ram_cm_controller = $7EFE00+$24
ram_cm_menu_bank = $7EFE00+$26

; ^ FREE SPACE @ +$28

ram_cm_etanks = $7EFE00+$2A
ram_cm_reserve = $7EFE00+$2C
ram_cm_leave = $7EFE00+$2E
ram_cm_input_counter = $7EFE00+$30
ram_cm_last_nmi_counter = $7EFE00+$32

ram_cm_ctrl_mode = $7EFE00+$34
ram_cm_ctrl_timer = $7EFE00+$36
ram_cm_ctrl_last_input = $7EFE00+$38
ram_cm_ctrl_assign = $7EFE00+$3A
ram_cm_ctrl_swap = $7EFE00+$3C
ram_cm_botwoon_rng = $7EFE00+$3E

ram_cm_slowdown_mode = $7EFE00+$40
ram_cm_slowdown_frames = $7EFE00+$42


; ------------------
; Reusable RAM Menu
; ------------------

; The following RAM may be used multiple times,
; as long as it isn't used multiple times on the same menu page

ram_cm_watch_left_hi = $7EFE00+$80
ram_cm_watch_left_lo = $7EFE00+$82
ram_cm_watch_left_index_lo = $7EFE00+$84
ram_cm_watch_left_index_hi = $7EFE00+$86
ram_cm_watch_enemy_property = $7EFE00+$88
ram_cm_watch_enemy_index = $7EFE00+$8A
ram_cm_watch_right_hi = $7EFE00+$8C
ram_cm_watch_right_lo = $7EFE00+$8E
ram_cm_watch_right_index_lo = $7EFE00+$90
ram_cm_watch_right_index_hi = $7EFE00+$92
ram_cm_watch_edit_left_hi = $7EFE00+$94
ram_cm_watch_edit_left_lo = $7EFE00+$96
ram_cm_watch_edit_right_hi = $7EFE00+$98
ram_cm_watch_edit_right_lo = $7EFE00+$9A
ram_cm_watch_enemy_side = $7EFE00+$9C
ram_cm_watch_bank = $7EFE00+$9E
ram_cm_watch_common_address = $7EFE00+$A0

ram_cm_phan_first_phase = $7EFE00+$80
ram_cm_phan_second_phase = $7EFE00+$82

; ^ FREE SPACE ^ up to +$CE

ram_cgram_cache = $7EFE00+$D0         ; 30 bytes

DP_MenuIndices = $00 ; 0x4
DP_CurrentMenu = $04 ; 0x4
DP_Address = $08 ; 0x4
DP_JSLTarget = $0C ; 0x4
DP_CtrlInput = $10 ; 0x4
DP_Palette = $14
DP_Temp = $16
; v these repreat v
DP_ToggleValue = $18
DP_Increment = $1A
DP_Minimum = $1C
DP_Maximum = $1E
DP_DrawValue = $18
DP_FirstDigit = $1A
DP_SecondDigit = $1C
DP_ThirdDigit = $1E


; -----------------
; Crash Handler RAM
; -----------------

ram_crash_a = $7EFF00
ram_crash_x = $7EFF00+$02
ram_crash_y = $7EFF00+$04
ram_crash_dbp = $7EFF00+$06
ram_crash_sp = $7EFF00+$08
ram_crash_type = $7EFF00+$0A
ram_crash_draw_value = $7EFF00+$0C
ram_crash_stack_size = $7EFF00+$0E

; Reserve 48 bytes for stack
ram_crash_stack = $7EFF00+$10

ram_crash_page = $7EFF00+$40
ram_crash_palette = $7EFF00+$42
ram_crash_cursor = $7EFF00+$44
ram_crash_loop_counter = $7EFF00+$46
ram_crash_bytes_to_write = $7EFF00+$48
ram_crash_stack_line_position = $7EFF00+$4A
ram_crash_text = $7EFF00+$4C
ram_crash_text_bank = $7EFF00+$4E
ram_crash_text_palette = $7EFF00+$50
ram_crash_mem_viewer = $7EFF00+$52
ram_crash_mem_viewer_bank = $7EFF00+$54
ram_crash_temp = $7EFF00+$56

ram_crash_input = $7EFF00+$60
ram_crash_input_new = $7EFF00+$62
ram_crash_input_prev = $7EFF00+$64
ram_crash_input_timer = $7EFF00+$66


; ---------
; Pointers
; ---------

IH_CONTROLLER_PRI = $8B
IH_CONTROLLER_PRI_NEW = $8F
IH_CONTROLLER_PRI_PREV = $97

IH_CONTROLLER_SEC = $8D
IH_CONTROLLER_SEC_NEW = $91
IH_CONTROLLER_SEC_PREV = $99

IH_INPUT_SHOT = $7E09B2
IH_INPUT_JUMP = $7E09B4
IH_INPUT_RUN = $7E09B6
IH_INPUT_ITEM_CANCEL = $7E09B8
IH_INPUT_ITEM_SELECT = $7E09BA
IH_INPUT_ANGLE_UP = $7E09BE
IH_INPUT_ANGLE_DOWN = $7E09BC


; --------------
; Vanilla Labels
; --------------

MUSIC_ROUTINE = $808FC1
SFX_LIB1 = $80903F
SFX_LIB2 = $8090C1
SFX_LIB3 = $809143

OAM_STACK_POINTER = $0590
PB_EXPLOSION_STATUS = $0592
NMI_REQUEST_FLAG = $05B4
FRAME_COUNTER_8BIT = $05B5
FRAME_COUNTER = $05B6
DEBUG_MODE_FLAG = $05D1
RANDOM_NUMBER = $05E5
DISABLE_SOUNDS = $05F5
SCREEN_FADE_DELAY = $0723
SCREEN_FADE_COUNTER = $0725
LOAD_STATION_INDEX = $078B
ROOM_ID = $079B
AREA_ID = $079F
ROOM_WIDTH_BLOCKS = $07A5
ROOM_WIDTH_SCROLLS = $07A9
SOUND_TIMER = $0686
MUSIC_DATA = $07F3
MUSIC_TRACK = $07F5
LAYER1_X = $0911
LAYER1_Y = $0915
CURRENT_SAVE_FILE = $0952
GAMEMODE = $0998
SAMUS_ITEMS_EQUIPPED = $09A2
SAMUS_ITEMS_COLLECTED = $09A4
SAMUS_BEAMS_EQUIPPED = $09A6
SAMUS_BEAMS_COLLECTED = $09A8
SAMUS_RESERVE_MODE = $09C0
SAMUS_HP = $09C2
SAMUS_HP_MAX = $09C4
SAMUS_MISSILES = $09C6
SAMUS_MISSILES_MAX = $09C8
SAMUS_SUPERS = $09CA
SAMUS_SUPERS_MAX = $09CC
SAMUS_PBS = $09CE
SAMUS_PBS_MAX = $09D0
SAMUS_RESERVE_MAX = $09D4
SAMUS_RESERVE_ENERGY = $09D6
SAMUS_LAST_HP = $0A06
SAMUS_POSE = $0A1C
SAMUS_POSE_DIRECTION = $0A1E
SAMUS_MOVEMENT_TYPE = $0A1F
SAMUS_SHINE_TIMER = $0A68
SAMUS_HEALTH_WARNING = $0A6A
SAMUS_HYPER_BEAM = $0A76
SAMUS_ANIMATION_TIMER = $0A94
SAMUS_ANIMATION_FRAME = $0A96
LIQUID_PHYSICS_TYPE = $0AD2
SAMUS_X = $0AF6
SAMUS_X_SUBPX = $0AF8
SAMUS_Y = $0AFA
SAMUS_Y_SUBPX = $0AFC
SAMUS_X_RADIUS = $0AFE
SAMUS_Y_RADIUS = $0B00
SAMUS_SPRITEMAP_X = $0B04
SAMUS_Y_SUBSPEED = $0B2C
SAMUS_Y_SPEEDCOMBINED = $0B2D
SAMUS_Y_SPEED = $0B2E
SAMUS_Y_DIRECTION = $0B36
SAMUS_DASH_COUNTER = $0B3F
SAMUS_X_RUNSPEED = $0B42
SAMUS_X_SUBRUNSPEED = $0B44
SAMUS_X_MOMENTUM = $0B46
SAMUS_X_SUBMOMENTUM = $0B48
SAMUS_PROJ_X = $0B64
SAMUS_PROJ_Y = $0B78
SAMUS_PROJ_RADIUS_X = $0BB4
SAMUS_PROJ_RADIUS_Y = $0BC8
SAMUS_COOLDOWN = $0CCC
SAMUS_CHARGE_TIMER = $0CD0
SAMUS_HEALTH_DROP_FLAG = $0E1A
ENEMY_X = $0F7A
ENEMY_Y = $0F7E
ENEMY_X_RADIUS = $0F82
ENEMY_Y_RADIUS = $0F84
ENEMY_PROPERTIES_2 = $0F88
ENEMY_HP = $0F8C
ENEMY_SPRITEMAP = $0F8E
ENEMY_BANK = $0FA6
SAMUS_IFRAME_TIMER = $18A8
SAMUS_KNOCKBACK_TIMER = $18AA
ENEMY_PROJ_ID = $1997
ENEMY_PROJ_X = $1A4B
ENEMY_PROJ_Y = $1A93
ENEMY_PROJ_RADIUS = $1BB3

HUD_TILEMAP = $7EC600


; -----
; SRAM
; -----

sram_initialized = $702000+$00

sram_ctrl_menu = $702000+$02
sram_ctrl_kill_enemies = $702000+$04
sram_ctrl_full_equipment = $702000+$06
sram_ctrl_reset_segment_timer = $702000+$08
sram_ctrl_reset_segment_later = $702000+$0A
sram_ctrl_load_state = $702000+$0C
sram_ctrl_save_state = $702000+$0E
sram_ctrl_load_last_preset = $702000+$10
sram_ctrl_random_preset = $702000+$12
sram_ctrl_save_custom_preset = $702000+$14
sram_ctrl_load_custom_preset = $702000+$16
sram_ctrl_inc_custom_preset = $702000+$18
sram_ctrl_dec_custom_preset = $702000+$1A
sram_ctrl_toggle_tileviewer = $702000+$1C
sram_ctrl_update_timers = $702000+$1E

sram_artificial_lag = $702000+$20
sram_rerandomize = $702000+$22
sram_fanfare_toggle = $702000+$24
sram_frame_counter_mode = $702000+$26
sram_display_mode = $702000+$28
sram_music_toggle = $702000+$2A
sram_last_preset = $702000+$2C
sram_save_has_set_rng = $702000+$2E
sram_preset_category = $702000+$30
sram_custom_preset_slot = $702000+$32
sram_room_strat = $702000+$34
sram_sprite_prio_flag = $702000+$36
sram_metronome_tickrate = $702000+$38
sram_metronome_sfx = $702000+$3A
sram_status_icons = $702000+$3C
sram_suit_properties = $702000+$3E
sram_top_display_mode = $702000+$40
sram_healthalarm = $702000+$42
sram_room_layout = $702000+$44
sram_cutscenes = $702000+$46
sram_compressed_graphics = $702000+$48
sram_lag_counter_mode = $702000+$4A
sram_preset_map_tiles = $702000+$4C

; ^ FREE SPACE ^ up to $F03000


; ----------
; Save/Load
; ----------

SS_INPUT_CUR = $8B
SS_INPUT_NEW = $8F
SS_INPUT_PREV = $97

if !FEATURE_TINYSTATES
SRAM_DMA_BANK = $726B10
SRAM_SAVED_SP = $726B12
SRAM_SAVED_STATE = $726B14
SRAM_SAVED_RNG = $726B16
SRAM_SAVED_FRAME_COUNTER = $726B18
SRAM_TINYSTATE_ROOM = $726B1A
SRAM_TINYSTATE_FAST = $726B1C
SRAM_SEG_TIMER_F = $726B1E
SRAM_SEG_TIMER_S = $726B20
SRAM_SEG_TIMER_M = $726B22
else
SRAM_DMA_BANK = $770000
SRAM_SAVED_RNG = $770080
SRAM_SAVED_FRAME_COUNTER = $770082
SRAM_SAVED_SP = $774004
SRAM_SAVED_STATE = $774006
SRAM_SEG_TIMER_F = $737F8A
SRAM_SEG_TIMER_S = $737F8C
SRAM_SEG_TIMER_M = $737F8E
endif

; SM specific things
SRAM_MUSIC_DATA = $701FD0
SRAM_MUSIC_TRACK = $701FD2
SRAM_SOUND_TIMER = $701FD4


; ----------------------------------------------------------------------- ;
;                             Custom Features                             ;
; ----------------------------------------------------------------------- ;

ram_countdamage = $0B0C
ram_ammo_missiles = $05C9
ram_ammo_supers = $05CB
ram_ammo_powerbombs = $05CD

ram_HUD_top = $7EFB00+$00
ram_HUD_middle = $7EFB00+$02
ram_HUD_bottom = $7EFB00+$04
ram_HUD_top_counter = $7EFB00+$06
ram_HUD_middle_counter = $7EFB00+$08

; FREE SPACE ^

ram_infinite_ammo = $7EFB00+$10
ram_infiniteammo_check = $7EFB00+$12
;ram_FREE_SPACE = $7EFB00+$14
ram_display_backup = $7EFB00+$16
ram_dboost_state = $7EFB00+$18
ram_dboost_kbmax = $7EFB00+$1A
ram_dboost_kb = $7EFB00+$1C
ram_dboost_counter = $7EFB00+$1E
ram_spark_icon = $7EFB00+$20
ram_lag_counter = $7EFB00+$22
ram_lag_counter_HUD = $7EFB00+$24
ram_activated_shine_duration = $7EFB00+$26

; FREE SPACE ^

if !FEATURE_EXTRAS
    ram_noclip = $7EFB00+$30
    ram_steamcollision = $7EFB00+$32
; FREE SPACE ^
endif

ram_enemy0_last_xpos = $7EFB00+$40
ram_enemy0_last_ypos = $7EFB00+$42
;ram_enemy1_last_xpos = $7EFB00+$44
;ram_enemy1_last_ypos = $7EFB00+$46
ram_enemy2_last_xpos = $7EFB00+$48
ram_enemy2_last_ypos = $7EFB00+$4A
;ram_enemy3_last_xpos = $7EFB00+$4C
;ram_enemy3_last_ypos = $7EFB00+$4E
ram_enemy4_last_xpos = $7EFB00+$50
ram_enemy4_last_ypos = $7EFB00+$52
;ram_enemy5_last_xpos = $7EFB00+$54
;ram_enemy5_last_ypos = $7EFB00+$56
ram_enemy6_last_xpos = $7EFB00+$58
ram_enemy6_last_ypos = $7EFB00+$5A
ram_enemy7_last_xpos = $7EFB00+$5C
ram_enemy7_last_ypos = $7EFB00+$5E
ram_enemy8_last_xpos = $7EFB00+$60
ram_enemy8_last_ypos = $7EFB00+$62
ram_radar1 = $7EFB00+$64
ram_radar2 = $7EFB00+$66

; FREE SPACE ^

ram_palette_border = $7EFB00+$80
ram_palette_headeroutline = $7EFB00+$82
ram_palette_text = $7EFB00+$84
ram_palette_background = $7EFB00+$86
ram_palette_numoutline = $7EFB00+$88
ram_palette_numfill = $7EFB00+$8A
ram_palette_toggleon = $7EFB00+$8C
ram_palette_seltext = $7EFB00+$8E
ram_palette_seltextbg = $7EFB00+$90
ram_palette_numseloutline = $7EFB00+$92
ram_palette_numsel = $7EFB00+$94

;ram_FREE_SPACE = $7EFB00+$96

ram_soundtest_lib1 = $7EFB00+$98
ram_soundtest_lib2 = $7EFB00+$9A
ram_soundtest_lib3 = $7EFB00+$9C
ram_soundtest_music = $7EFB00+$9E

; FREE SPACE ^

ram_cm_brb = $7EFB00+$A0
ram_cm_brb_timer = $7EFB00+$A2
ram_cm_brb_frames = $7EFB00+$A4
ram_cm_brb_secs = $7EFB00+$A6
ram_cm_brb_mins = $7EFB00+$A8
ram_cm_brb_screen = $7EFB00+$AA
ram_cm_brb_palette = $7EFB00+$AC
ram_cm_brb_timer_mode = $7EFB00+$AE
ram_cm_brb_set_cycle = $7EFB00+$B0
ram_cm_brb_cycle_time = $7EFB00+$B2

; FREE SPACE ^

ram_crop_mode = $7EFB00+$C0
ram_crop_tile = $7EFB00+$C2

; FREE SPACE ^

ram_cm_scroll = $7EFB00+$D0
ram_cm_scroll_X = $7EFB00+$D2
ram_cm_scroll_Y = $7EFB00+$D4
ram_cm_scroll_H = $7EFB00+$D6
ram_cm_scroll_V = $7EFB00+$D8
ram_cm_scroll_timer = $7EFB00+$DA

; FREE SPACE ^

ram_cm_varia = $7EFB00+$E0
ram_cm_gravity = $7EFB00+$E2
ram_cm_morph = $7EFB00+$E4
ram_cm_bombs = $7EFB00+$E6
ram_cm_spring = $7EFB00+$E8
ram_cm_screw = $7EFB00+$EA
ram_cm_hijump = $7EFB00+$EC
ram_cm_space = $7EFB00+$EE
ram_cm_speed = $7EFB00+$F0
ram_cm_charge = $7EFB00+$F2
ram_cm_ice = $7EFB00+$F4
ram_cm_wave = $7EFB00+$F6
ram_cm_spazer = $7EFB00+$F8
ram_cm_plasma = $7EFB00+$FA

ram_seed_X = $7EFB00+$FC
ram_seed_Y = $7EFB00+$FE


; ---------
; Pointers
; ---------

PRESET_SLOTS = $703000

PRESET_DOORS = $7EFB00+$180
PRESET_SPECIAL = $7EFB00+$182
PRESET_ENEMIES = $7EFB00+$184


; ------------------------
; SRAM for custom features
; ------------------------

sram_ctrl_reveal_damage = $702000+$200
sram_ctrl_randomize_rng = $702000+$202
sram_ctrl_force_stand = $702000+$204

sram_menu_background = $702000+$210
sram_scroll_button = $702000+$212
sram_cm_scroll_button = $702000+$214
sram_cm_scroll_delay = $702000+$216
sram_cm_font = $702000+$218
sram_number_gfx_choice = $702000+$21A

sram_phantoon_intro = $702000+$220
sram_kraid_intro = $702000+$222
ram_magnetstairs = $702000+$224
sram_preset_open_doors = $702000+$226
sram_preset_ship_landing = $702000+$228
sram_preset_enemies = $702000+$22A
sram_fast_nintendo_logo = $702000+$22C

; FREE SPACE ^

sram_countdamage = $702000+$240
sram_superhud = $702000+$242
sram_superhud_bottom = $702000+$244
sram_superhud_middle = $702000+$246
sram_superhud_top = $702000+$248
sram_door_display_mode = $702000+$24A

; FREE SPACE ^

sram_seed_X = $702000+$28C
sram_seed_Y = $702000+$28E

sram_presetrando = $702000+$290
sram_presetrando_morph = $702000+$292
sram_presetrando_charge = $702000+$294
sram_presetrando_max_etanks = $702000+$296
sram_presetrando_max_reserves = $702000+$298
sram_presetrando_max_missiles = $702000+$29A
sram_presetrando_max_supers = $702000+$29C
sram_presetrando_max_pbs = $702000+$29E
sram_presetrando_beampref = $702000+$2A0

sram_custompalette_blue = $702000+$2A2
sram_custompalette_green = $702000+$2A4
sram_custompalette_red = $702000+$2A6
sram_custompalette_hi = $702000+$2A8
sram_custompalette_lo = $702000+$2AA

; FREE SPACE ^

; do not change order without updating custom palette profiles in menu.asm
sram_palette_border = $702000+$2B0
sram_palette_headeroutline = $702000+$2B2
sram_palette_text = $702000+$2B4
sram_palette_numoutline = $702000+$2B6
sram_palette_numfill = $702000+$2B8
sram_palette_toggleon = $702000+$2BA
sram_palette_seltext = $702000+$2BC
sram_palette_seltextbg = $702000+$2BE
sram_palette_background = $702000+$2C0
sram_palette_numseloutline = $702000+$2C2
sram_palette_numsel = $702000+$2C4
sram_custompalette_profile = $702000+$2C6

; FREE SPACE ^

sram_customsfx_move = $702000+$2F0
sram_customsfx_toggle = $702000+$2F2
sram_customsfx_number = $702000+$2F4
sram_customsfx_confirm = $702000+$2F6
sram_customsfx_goback = $702000+$2F8

sram_dummy_on = $702000+$2FA
sram_dummy_off = $702000+$2FC
sram_dummy_num = $702000+$2FE
