
; -------------
; Version Flags
; -------------

!VERSION_HEADER = $00
!VERSION_MAJOR = 2
!VERSION_MINOR = 5
!VERSION_BUILD = 4
!VERSION_REV_1 = 0
!VERSION_REV_2 = 3


; ---------
; Work RAM
; ---------

!WRAM_BANK = #$007E
!WRAM_SIZE = #$0200
!WRAM_START = $7EFD00
!WRAM_PERSIST_START = !ram_game_loop_extras

; These variables are NOT PERSISTENT across savestates --
; they're saved and reloaded along with the game state.
; Use this section for infohud variables that are dependent
; on the game state. For variables that depend on user
; settings, place them below WRAM_PERSIST_START below.

;FREE_SPACE = !WRAM_START+$00
!ram_gametime_room = !WRAM_START+$02
!ram_last_gametime_room = !WRAM_START+$04
!ram_realtime_room = !WRAM_START+$06
!ram_last_realtime_room = !WRAM_START+$08
!ram_last_room_lag = !WRAM_START+$0A
!ram_last_door_lag_frames = !WRAM_START+$0C
!ram_transition_counter = !WRAM_START+$0E
!ram_transition_flag = !WRAM_START+$10
!ram_last_realtime_door = !WRAM_START+$12

!ram_seg_rt_frames = !WRAM_START+$14
!ram_seg_rt_seconds = !WRAM_START+$16
!ram_seg_rt_minutes = !WRAM_START+$18
!ram_reset_segment_later = !WRAM_START+$1A

!ram_ih_controller = !WRAM_START+$1C
!ram_slowdown_controller_1 = !WRAM_START+$1E
!ram_slowdown_controller_2 = !WRAM_START+$20
!ram_slowdown_frames = !WRAM_START+$22

!ram_momentum_sum = !WRAM_START+$24
!ram_momentum_count = !WRAM_START+$26
!ram_momentum_direction = !WRAM_START+$28
!ram_momentum_last = !WRAM_START+$2A

!ram_last_hp = !WRAM_START+$2C
!ram_reserves_last = !WRAM_START+$2E

!ram_metronome_counter = !WRAM_START+$30
!ram_armed_shine_duration = !WRAM_START+$32
!ram_map_counter = !WRAM_START+$34
!ram_vcounter_data = !WRAM_START+$36

!ram_magic_pants_state = !WRAM_START+$38
!ram_magic_pants_pal1 = !WRAM_START+$3A
!ram_magic_pants_pal2 = !WRAM_START+$3C
!ram_magic_pants_pal3 = !WRAM_START+$3E

!ram_suits_enemy_damage_check = !WRAM_START+$40
!ram_suits_periodic_damage_check = !WRAM_START+$42

; FREE SPACE ^ up to +$4E

!ram_room_has_set_rng = !WRAM_START+$50

!ram_spacetime_read_address = !WRAM_START+$52
!ram_spacetime_read_bank = !WRAM_START+$54
!ram_spacetime_y = !WRAM_START+$56

!ram_watch_left_hud = !WRAM_START+$58
!ram_watch_right_hud = !WRAM_START+$5A
!ram_HUD_check = !WRAM_START+$5C
!ram_roomstrat_counter = !WRAM_START+$5E
!ram_roomstrat_state = !WRAM_START+$60
!ram_enemy_hp = !WRAM_START+$62
!ram_mb_hp = !WRAM_START+$64
!ram_shot_timer = !WRAM_START+$66
!ram_shine_counter = !WRAM_START+$68
!ram_dash_counter = !WRAM_START+$6A
!ram_shinetune_early_1 = !WRAM_START+$6C
!ram_shinetune_late_1 = !WRAM_START+$6E
!ram_shinetune_early_2 = !WRAM_START+$70
!ram_shinetune_late_2 = !WRAM_START+$72
!ram_shinetune_early_3 = !WRAM_START+$74
!ram_shinetune_late_3 = !WRAM_START+$76
!ram_shinetune_early_4 = !WRAM_START+$78
!ram_shinetune_late_4 = !WRAM_START+$7A
!ram_shine_dash_held_late = !WRAM_START+$7C
!ram_xpos = !WRAM_START+$7E
!ram_ypos = !WRAM_START+$80
!ram_subpixel_pos = !WRAM_START+$82
!ram_horizontal_speed = !WRAM_START+$84
!ram_vertical_speed = !WRAM_START+$86
!ram_quickdrop_counter = !WRAM_START+$88
!ram_walljump_counter = !WRAM_START+$8A
!ram_fail_sum = !WRAM_START+$8C
!ram_fail_count = !WRAM_START+$8E

!ram_load_preset = !WRAM_START+$90
!ram_custom_preset = !WRAM_START+$92

; WRAM variables below this point are PERSISTENT -- they
; maintain their value across savestates. Use this section
; for variables such as user settings that do not depend
; on the current game state.

!ram_game_loop_extras = !WRAM_START+$A0
!ram_game_mode_extras = !WRAM_START+$A2
!ram_metronome = !WRAM_START+$A4
!ram_minimap = !WRAM_START+$A6
!ram_magic_pants_enabled = !WRAM_START+$A8
!ram_space_pants_enabled = !WRAM_START+$AA
!ram_random_preset_rng = !WRAM_START+$AC
!ram_random_preset_value = !WRAM_START+$AE
!ram_fix_scroll_offsets = !WRAM_START+$B0
!ram_pacifist = !WRAM_START+$B2
!ram_freeze_on_load = !WRAM_START+$B4
!ram_spacetime_infohud = !WRAM_START+$B6

!ram_kraid_claw_rng = !WRAM_START+$B8
!ram_crocomire_rng = !WRAM_START+$BA
!ram_phantoon_rng_round_1 = !WRAM_START+$BC
!ram_phantoon_rng_round_2 = !WRAM_START+$BE
!ram_phantoon_rng_inverted = !WRAM_START+$C0
!ram_phantoon_rng_eyeclose = !WRAM_START+$C2
!ram_phantoon_rng_flames = !WRAM_START+$C4
!ram_phantoon_rng_next_flames = !WRAM_START+$C6
!ram_botwoon_rng = !WRAM_START+$C8
!ram_draygon_rng_left = !WRAM_START+$CA
!ram_draygon_rng_right = !WRAM_START+$CC
!ram_baby_rng = !WRAM_START+$CE
!ram_kraid_wait_rng = !WRAM_START+$D0
!ram_botwoon_first = !WRAM_START+$D2
!ram_botwoon_hidden = !WRAM_START+$D4
!ram_botwoon_second = !WRAM_START+$D6
!ram_botwoon_spit = !WRAM_START+$D8

!ram_sprite_feature_flags = !WRAM_START+$DA


; ^ FREE SPACE @ $D0-$DC

!ram_watch_bank = !WRAM_START+$DE
!ram_watch_write_mode = !WRAM_START+$E0
!ram_watch_left = !WRAM_START+$E2
!ram_watch_right = !WRAM_START+$E4
!ram_watch_edit_left = !WRAM_START+$E6
!ram_watch_edit_right = !WRAM_START+$E8
!ram_watch_edit_lock_left = !WRAM_START+$EA
!ram_watch_edit_lock_right = !WRAM_START+$EC
!ram_watch_left_index = !WRAM_START+$EE
!ram_watch_right_index = !WRAM_START+$F0

!ram_auto_save_state = !WRAM_START+$F2

!ram_slowdown_mode = $7EFFFE ; Bank $7E required


; ---------
; RAM Menu
; ---------

!ram_tilemap_buffer = $7E5800

!WRAM_MENU_START = $7EFE00

!ram_cm_stack_index = $05D5
!ram_cm_menu_stack = !WRAM_MENU_START+$00         ; 16 bytes
!ram_cm_cursor_stack = !WRAM_MENU_START+$10       ; 16 bytes

!ram_cm_cursor_max = !WRAM_MENU_START+$20
!ram_cm_input_timer = !WRAM_MENU_START+$22
!ram_cm_controller = !WRAM_MENU_START+$24
!ram_cm_menu_bank = !WRAM_MENU_START+$26

; ^ FREE SPACE @ +$28

!ram_cm_etanks = !WRAM_MENU_START+$2A
!ram_cm_reserve = !WRAM_MENU_START+$2C
!ram_cm_leave = !WRAM_MENU_START+$2E
!ram_cm_input_counter = !WRAM_MENU_START+$30
!ram_cm_last_nmi_counter = !WRAM_MENU_START+$32

!ram_cm_ctrl_mode = !WRAM_MENU_START+$34
!ram_cm_ctrl_timer = !WRAM_MENU_START+$36
!ram_cm_ctrl_last_input = !WRAM_MENU_START+$38
!ram_cm_ctrl_assign = !WRAM_MENU_START+$3A
!ram_cm_ctrl_swap = !WRAM_MENU_START+$3C

!ram_cm_slowdown_mode = !WRAM_MENU_START+$3E
!ram_cm_slowdown_frames = !WRAM_MENU_START+$40

!ram_cm_botwoon_rng = !WRAM_MENU_START+$42
!ram_cm_botwoon_first = !WRAM_MENU_START+$44
!ram_cm_botwoon_hidden = !WRAM_MENU_START+$46
!ram_cm_botwoon_second = !WRAM_MENU_START+$48
!ram_cm_botwoon_spit = !WRAM_MENU_START+$4A
!ram_cm_custom_preset_labels = !WRAM_MENU_START+$4C

; ^ FREE SPACE ^ up to +$76

!ram_cm_preserved_timers = !WRAM_MENU_START+$78 ; 8 bytes

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

!ram_cm_phan_first_phase = !WRAM_MENU_START+$80
!ram_cm_phan_second_phase = !WRAM_MENU_START+$82

; ^ FREE SPACE ^ up to +$CE

!ram_cgram_cache = !WRAM_MENU_START+$D0         ; 30 bytes

!DP_MenuIndices = $00 ; 0x4
!DP_CurrentMenu = $04 ; 0x4
!DP_Address = $08 ; 0x4
!DP_JSLTarget = $0C ; 0x4
!DP_CtrlInput = $10 ; 0x4
!DP_Palette = $14
!DP_Temp = $16
; v these repreat v
!DP_ToggleValue = $18
!DP_Increment = $1A
!DP_Minimum = $1C
!DP_Maximum = $1E
!DP_DrawValue = $18
!DP_FirstDigit = $1A
!DP_SecondDigit = $1C
!DP_ThirdDigit = $1E

!ACTION_TOGGLE              = #$0000
!ACTION_TOGGLE_BIT          = #$0002
!ACTION_TOGGLE_INVERTED     = #$0004
!ACTION_TOGGLE_BIT_INVERTED = #$0006
!ACTION_NUMFIELD            = #$0008
!ACTION_NUMFIELD_HEX        = #$000A
!ACTION_NUMFIELD_WORD       = #$000C
!ACTION_NUMFIELD_HEX_WORD   = #$000E
!ACTION_NUMFIELD_COLOR      = #$0010
!ACTION_NUMFIELD_SOUND      = #$0012
!ACTION_CHOICE              = #$0014
!ACTION_CTRL_SHORTCUT       = #$0016
!ACTION_CTRL_INPUT          = #$0018
!ACTION_JSL                 = #$001A
!ACTION_JSL_SUBMENU         = #$001C
!ACTION_CUSTOM_PRESET       = #$001E

; using macros instead of these in custom builds
!SOUND_MENU_MOVE = $0039
!SOUND_MENU_JSL = $0039
!SOUND_MENU_FAIL = $0007


; -----------------
; Crash Handler RAM
; -----------------

!ram_crash_a = !CRASHDUMP
!ram_crash_x = !CRASHDUMP+$02
!ram_crash_y = !CRASHDUMP+$04
!ram_crash_dbp = !CRASHDUMP+$06
!ram_crash_sp = !CRASHDUMP+$08
!ram_crash_type = !CRASHDUMP+$0A
!ram_crash_draw_value = !CRASHDUMP+$0C
!ram_crash_stack_size = !CRASHDUMP+$0E

; Reserve 48 bytes for stack
!ram_crash_stack = !CRASHDUMP+$10

!ram_crash_page = !CRASHDUMP+$40
!ram_crash_palette = !CRASHDUMP+$42
!ram_crash_cursor = !CRASHDUMP+$44
!ram_crash_loop_counter = !CRASHDUMP+$46
!ram_crash_bytes_to_write = !CRASHDUMP+$48
!ram_crash_stack_line_position = !CRASHDUMP+$4A
!ram_crash_text = !CRASHDUMP+$4C
!ram_crash_text_bank = !CRASHDUMP+$4E
!ram_crash_text_palette = !CRASHDUMP+$50
!ram_crash_mem_viewer = !CRASHDUMP+$52
!ram_crash_mem_viewer_bank = !CRASHDUMP+$54
!ram_crash_temp = !CRASHDUMP+$56

!ram_crash_input = !CRASHDUMP+$60
!ram_crash_input_new = !CRASHDUMP+$62
!ram_crash_input_prev = !CRASHDUMP+$64
!ram_crash_input_timer = !CRASHDUMP+$66


; ---------
; Pointers
; ---------

!IH_CONTROLLER_PRI = $8B
!IH_CONTROLLER_PRI_NEW = $8F
!IH_CONTROLLER_PRI_PREV = $97

!IH_CONTROLLER_SEC = $8D
!IH_CONTROLLER_SEC_NEW = $91
!IH_CONTROLLER_SEC_PREV = $99

!MENU_CLEAR = #$000E
!MENU_BLANK = #$281F
!MENU_SLASH = #$287F
!IH_BLANK = #$2C0F
!IH_PERCENT = #$0C0A
!IH_DECIMAL = #$0CCB
!IH_HYPHEN = #$0C55
!IH_ELEVATOR = #$08CE
!IH_SHINESPARK = #$1C32
!IH_HEALTHBOMB = #$085A
!IH_RESERVE_AUTO = #$0C0C
!IH_RESERVE_EMPTY = #$0C0D
!IH_LETTER_A = #$0C76
!IH_LETTER_B = #$0C77
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
!IH_INPUT_LEFTRIGHT = #$0300
!IH_INPUT_LEFT = #$0200
!IH_INPUT_RIGHT = #$0100

!CTRL_B = #$8000
!CTRL_Y = #$4000
!CTRL_SELECT = #$2000
!CTRL_A = #$0080
!CTRL_X = #$0040
!CTRL_L = #$0020
!CTRL_R = #$0010

!IH_INPUT_SHOT = $7E09B2
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
!PB_EXPLOSION_STATUS = $0592
!NMI_REQUEST_FLAG = $05B4
!FRAME_COUNTER_8BIT = $05B5
!FRAME_COUNTER = $05B6
!DEBUG_MODE_FLAG = $05D1
!RANDOM_NUMBER = $05E5
!DISABLE_SOUNDS = $05F5
!SOUND_TIMER = $0686
!SCREEN_FADE_DELAY = $0723
!SCREEN_FADE_COUNTER = $0725
!LOAD_STATION_INDEX = $078B
!ROOM_ID = $079B
!AREA_ID = $079F
!ROOM_WIDTH_BLOCKS = $07A5
!ROOM_WIDTH_SCROLLS = $07A9
!MUSIC_DATA = $07F3
!MUSIC_TRACK = $07F5
!LAYER1_X = $0911
!LAYER1_Y = $0915
!CURRENT_SAVE_FILE = $0952
!GAMEMODE = $0998
!DOOR_FUNCTION_POINTER = $099C
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
!SAMUS_LAST_HP = $0A06
!SAMUS_POSE = $0A1C
!SAMUS_POSE_DIRECTION = $0A1E
!SAMUS_MOVEMENT_TYPE = $0A1F
!SAMUS_PREVIOUS_POSE = $0A20
!SAMUS_PREVIOUS_POSE_DIRECTION = $0A22
!SAMUS_PREVIOUS_MOVEMENT_TYPE = $0A23
!SAMUS_SHINE_TIMER = $0A68
!SAMUS_HEALTH_WARNING = $0A6A
!SAMUS_HYPER_BEAM = $0A76
!SAMUS_ANIMATION_TIMER = $0A94
!SAMUS_ANIMATION_FRAME = $0A96
!LIQUID_PHYSICS_TYPE = $0AD2
!SAMUS_X = $0AF6
!SAMUS_X_SUBPX = $0AF8
!SAMUS_Y = $0AFA
!SAMUS_Y_SUBPX = $0AFC
!SAMUS_X_RADIUS = $0AFE
!SAMUS_Y_RADIUS = $0B00
!SAMUS_SPRITEMAP_X = $0B04
!SAMUS_Y_SUBSPEED = $0B2C
!SAMUS_Y_SPEEDCOMBINED = $0B2D
!SAMUS_Y_SPEED = $0B2E
!SAMUS_Y_DIRECTION = $0B36
!SAMUS_DASH_COUNTER = $0B3F
!SAMUS_X_RUNSPEED = $0B42
!SAMUS_X_SUBRUNSPEED = $0B44
!SAMUS_X_MOMENTUM = $0B46
!SAMUS_X_SUBMOMENTUM = $0B48
!SAMUS_PROJ_X = $0B64
!SAMUS_PROJ_Y = $0B78
!SAMUS_PROJ_RADIUS_X = $0BB4
!SAMUS_PROJ_RADIUS_Y = $0BC8
!SAMUS_COOLDOWN = $0CCC
!SAMUS_CHARGE_TIMER = $0CD0
!SAMUS_HEALTH_DROP_FLAG = $0E1A
!ENEMY_X = $0F7A
!ENEMY_Y = $0F7E
!ENEMY_X_RADIUS = $0F82
!ENEMY_Y_RADIUS = $0F84
!ENEMY_PROPERTIES = $0F86
!ENEMY_PROPERTIES_2 = $0F88
!ENEMY_HP = $0F8C
!ENEMY_SPRITEMAP = $0F8E
!ENEMY_BANK = $0FA6
!SAMUS_IFRAME_TIMER = $18A8
!SAMUS_KNOCKBACK_TIMER = $18AA
!ENEMY_PROJ_ID = $1997
!ENEMY_PROJ_X = $1A4B
!ENEMY_PROJ_Y = $1A93
!ENEMY_PROJ_RADIUS = $1BB3

!HUD_TILEMAP = $7EC600


; -----
; SRAM
; -----

!SRAM_START = $702000

!sram_initialized = !SRAM_START+$00

!sram_ctrl_menu = !SRAM_START+$02
!sram_ctrl_kill_enemies = !SRAM_START+$04
!sram_ctrl_full_equipment = !SRAM_START+$06
!sram_ctrl_reset_segment_timer = !SRAM_START+$08
!sram_ctrl_reset_segment_later = !SRAM_START+$0A
!sram_ctrl_load_state = !SRAM_START+$0C
!sram_ctrl_save_state = !SRAM_START+$0E
!sram_ctrl_load_last_preset = !SRAM_START+$10
!sram_ctrl_random_preset = !SRAM_START+$12
!sram_ctrl_save_custom_preset = !SRAM_START+$14
!sram_ctrl_load_custom_preset = !SRAM_START+$16
!sram_ctrl_inc_custom_preset = !SRAM_START+$18
!sram_ctrl_dec_custom_preset = !SRAM_START+$1A
!sram_ctrl_toggle_tileviewer = !SRAM_START+$1C
!sram_ctrl_update_timers = !SRAM_START+$1E

; ^ FREE SPACE ^

!sram_artificial_lag = !SRAM_START+$20
!sram_rerandomize = !SRAM_START+$22
!sram_fanfare_toggle = !SRAM_START+$24
!sram_frame_counter_mode = !SRAM_START+$26
!sram_display_mode = !SRAM_START+$28
!sram_music_toggle = !SRAM_START+$2A
!sram_last_preset = !SRAM_START+$2C
!sram_save_has_set_rng = !SRAM_START+$2E
!sram_preset_category = !SRAM_START+$30
!sram_custom_preset_slot = !SRAM_START+$32
!sram_room_strat = !SRAM_START+$34
!sram_sprite_prio_flag = !SRAM_START+$36
!sram_metronome_tickrate = !SRAM_START+$38
!sram_metronome_sfx = !SRAM_START+$3A
!sram_status_icons = !SRAM_START+$3C
!sram_suit_properties = !SRAM_START+$3E
!sram_top_display_mode = !SRAM_START+$40
!sram_healthalarm = !SRAM_START+$42
!sram_room_layout = !SRAM_START+$44
!sram_cutscenes = !SRAM_START+$46
!sram_compressed_graphics = !SRAM_START+$48
!sram_lag_counter_mode = !SRAM_START+$4A
!sram_preset_map_tiles = !SRAM_START+$4C
!sram_preset_auto_segment = !SRAM_START+$4E
!sram_suppress_flashing = !SRAM_START+$50

; ^ FREE SPACE ^ up to $F03000

if !FEATURE_TINYSTATES
!PRESET_SLOTS_ROOM = $703000+$06
!PRESET_SLOTS_ENERGY = $703000+$28
!PRESET_SLOTS_MAXENERGY = $703000+$2A
!PRESET_SLOTS_RESERVES = $703000+$3C
!PRESET_SLOTS_MISSILES = $703000+$2C
!PRESET_SLOTS_SUPERS = $703000+$30
!PRESET_SLOTS_PBS = $703000+$34
else
!PRESET_SLOTS_AREA = $703000+$0C
!PRESET_SLOTS_ROOM = $703000+$0A
!PRESET_SLOTS_ENERGY = $703000+$2C
!PRESET_SLOTS_MAXENERGY = $703000+$2E
!PRESET_SLOTS_RESERVES = $703000+$40
!PRESET_SLOTS_MISSILES = $703000+$30
!PRESET_SLOTS_SUPERS = $703000+$34
!PRESET_SLOTS_PBS = $703000+$38
endif

!SPRITE_SAMUS_HITBOX = #$0001
!SPRITE_ENEMY_HITBOX = #$0002
!SPRITE_EXTENDED_HITBOX = #$0004
!SPRITE_BOSS_HITBOX = #$0008
!SPRITE_ENEMY_PROJ = #$0020
!SPRITE_SAMUS_PROJ = #$0010
!SPRITE_32x32_PROJ = #$0040
!SPRITE_OOB_WATCH = #$0080

!SPRITE_SAMUS_HITBOX = #$0001
!SPRITE_ENEMY_HITBOX = #$0002
!SPRITE_EXTENDED_HITBOX = #$0004
!SPRITE_BOSS_HITBOX = #$0008
!SPRITE_SAMUS_PROJ = #$0010
!SPRITE_ENEMY_PROJ = #$0020
!SPRITE_32x32_PROJ = #$0040
!SPRITE_OOB_WATCH = #$0080


; ----------
; Save/Load
; ----------

; Savestate code variables
!SS_BANK = $8000

!SS_INPUT_CUR = $8B
!SS_INPUT_NEW = $8F
!SS_INPUT_PREV = $97

if !FEATURE_TINYSTATES
!SRAM_DMA_BANK = $737000
!SRAM_SAVED_SP = $737F00
!SRAM_SAVED_STATE = $737F02
!SRAM_SAVED_RNG = $737F80
!SRAM_SAVED_FRAME_COUNTER = $737F82
!SRAM_TINYSTATE_ROOM = $737F84
!SRAM_TINYSTATE_FAST = $737F86
!SRAM_SEG_TIMER_F = $737F88
!SRAM_SEG_TIMER_S = $737F8A
!SRAM_SEG_TIMER_M = $737F8C
!SRAM_SAVED_MINIMAP = $737F8E
else
!SRAM_DMA_BANK = $770000
!SRAM_SAVED_RNG = $770080
!SRAM_SAVED_FRAME_COUNTER = $770082
!SRAM_SAVED_SP = $774004
!SRAM_SAVED_STATE = $774006
!SRAM_SAVED_MINIMAP = $774008
!SRAM_SEG_TIMER_F = $737F8A
!SRAM_SEG_TIMER_S = $737F8C
!SRAM_SEG_TIMER_M = $737F8E
endif

; SM specific things
!SRAM_MUSIC_DATA = $701FD0
!SRAM_MUSIC_TRACK = $701FD2
!SRAM_SOUND_TIMER = $701FD4


; ----------------------------------------------------------------------- ;
;                             Custom Features                             ;
; ----------------------------------------------------------------------- ;

!ram_countdamage = $0B0C
!ram_ammo_missiles = $05C9
!ram_ammo_supers = $05CB
!ram_ammo_powerbombs = $05CD


!CUSTOM_WRAM = $7EFB00
!CUSTOM_WRAM_SIZE = #$01FE

!ram_HUD_top = !CUSTOM_WRAM+$00
!ram_HUD_middle = !CUSTOM_WRAM+$02
!ram_HUD_bottom = !CUSTOM_WRAM+$04
!ram_HUD_top_counter = !CUSTOM_WRAM+$06
!ram_HUD_middle_counter = !CUSTOM_WRAM+$08

; FREE SPACE ^

!ram_infinite_ammo = !CUSTOM_WRAM+$10
!ram_infiniteammo_check = !CUSTOM_WRAM+$12
;!ram_FREE_SPACE = !CUSTOM_WRAM+$14
!ram_display_backup = !CUSTOM_WRAM+$16
!ram_dboost_state = !CUSTOM_WRAM+$18
!ram_dboost_kbmax = !CUSTOM_WRAM+$1A
!ram_dboost_kb = !CUSTOM_WRAM+$1C
!ram_dboost_counter = !CUSTOM_WRAM+$1E
!ram_spark_icon = !CUSTOM_WRAM+$20
!ram_lag_counter = !CUSTOM_WRAM+$22
!ram_lag_counter_HUD = !CUSTOM_WRAM+$24
!ram_activated_shine_duration = !CUSTOM_WRAM+$26

; FREE SPACE ^

if !FEATURE_EXTRAS
    !ram_noclip = !CUSTOM_WRAM+$30
    !ram_steamcollision = !CUSTOM_WRAM+$32
; FREE SPACE ^
endif

!ram_enemy0_last_xpos = !CUSTOM_WRAM+$40
!ram_enemy0_last_ypos = !CUSTOM_WRAM+$42
;!ram_enemy1_last_xpos = !CUSTOM_WRAM+$44
;!ram_enemy1_last_ypos = !CUSTOM_WRAM+$46
!ram_enemy2_last_xpos = !CUSTOM_WRAM+$48
!ram_enemy2_last_ypos = !CUSTOM_WRAM+$4A
;!ram_enemy3_last_xpos = !CUSTOM_WRAM+$4C
;!ram_enemy3_last_ypos = !CUSTOM_WRAM+$4E
!ram_enemy4_last_xpos = !CUSTOM_WRAM+$50
!ram_enemy4_last_ypos = !CUSTOM_WRAM+$52
;!ram_enemy5_last_xpos = !CUSTOM_WRAM+$54
;!ram_enemy5_last_ypos = !CUSTOM_WRAM+$56
!ram_enemy6_last_xpos = !CUSTOM_WRAM+$58
!ram_enemy6_last_ypos = !CUSTOM_WRAM+$5A
!ram_enemy7_last_xpos = !CUSTOM_WRAM+$5C
!ram_enemy7_last_ypos = !CUSTOM_WRAM+$5E
!ram_enemy8_last_xpos = !CUSTOM_WRAM+$60
!ram_enemy8_last_ypos = !CUSTOM_WRAM+$62
!ram_radar1 = !CUSTOM_WRAM+$64
!ram_radar2 = !CUSTOM_WRAM+$66

; FREE SPACE ^

!ram_palette_border = !CUSTOM_WRAM+$80
!ram_palette_headeroutline = !CUSTOM_WRAM+$82
!ram_palette_text = !CUSTOM_WRAM+$84
!ram_palette_background = !CUSTOM_WRAM+$86
!ram_palette_numoutline = !CUSTOM_WRAM+$88
!ram_palette_numfill = !CUSTOM_WRAM+$8A
!ram_palette_toggleon = !CUSTOM_WRAM+$8C
!ram_palette_seltext = !CUSTOM_WRAM+$8E
!ram_palette_seltextbg = !CUSTOM_WRAM+$90
!ram_palette_numseloutline = !CUSTOM_WRAM+$92
!ram_palette_numsel = !CUSTOM_WRAM+$94

;!ram_FREE_SPACE = !CUSTOM_WRAM+$96

!ram_soundtest_lib1 = !CUSTOM_WRAM+$98
!ram_soundtest_lib2 = !CUSTOM_WRAM+$9A
!ram_soundtest_lib3 = !CUSTOM_WRAM+$9C
!ram_soundtest_music = !CUSTOM_WRAM+$9E

; FREE SPACE ^

!ram_cm_brb = !CUSTOM_WRAM+$A0
!ram_cm_brb_timer = !CUSTOM_WRAM+$A2
!ram_cm_brb_frames = !CUSTOM_WRAM+$A4
!ram_cm_brb_secs = !CUSTOM_WRAM+$A6
!ram_cm_brb_mins = !CUSTOM_WRAM+$A8
!ram_cm_brb_screen = !CUSTOM_WRAM+$AA
!ram_cm_brb_palette = !CUSTOM_WRAM+$AC
!ram_cm_brb_timer_mode = !CUSTOM_WRAM+$AE
!ram_cm_brb_set_cycle = !CUSTOM_WRAM+$B0
!ram_cm_brb_cycle_time = !CUSTOM_WRAM+$B2

; FREE SPACE ^

!ram_crop_mode = !CUSTOM_WRAM+$C0
!ram_crop_tile = !CUSTOM_WRAM+$C2

; FREE SPACE ^

!ram_cm_scroll = !CUSTOM_WRAM+$D0
!ram_cm_scroll_X = !CUSTOM_WRAM+$D2
!ram_cm_scroll_Y = !CUSTOM_WRAM+$D4
!ram_cm_scroll_H = !CUSTOM_WRAM+$D6
!ram_cm_scroll_V = !CUSTOM_WRAM+$D8
!ram_cm_scroll_timer = !CUSTOM_WRAM+$DA

; FREE SPACE ^

!ram_cm_varia = !CUSTOM_WRAM+$E0
!ram_cm_gravity = !CUSTOM_WRAM+$E2
!ram_cm_morph = !CUSTOM_WRAM+$E4
!ram_cm_bombs = !CUSTOM_WRAM+$E6
!ram_cm_spring = !CUSTOM_WRAM+$E8
!ram_cm_screw = !CUSTOM_WRAM+$EA
!ram_cm_hijump = !CUSTOM_WRAM+$EC
!ram_cm_space = !CUSTOM_WRAM+$EE
!ram_cm_speed = !CUSTOM_WRAM+$F0
!ram_cm_charge = !CUSTOM_WRAM+$F2
!ram_cm_ice = !CUSTOM_WRAM+$F4
!ram_cm_wave = !CUSTOM_WRAM+$F6
!ram_cm_spazer = !CUSTOM_WRAM+$F8
!ram_cm_plasma = !CUSTOM_WRAM+$FA

!ram_seed_X = !CUSTOM_WRAM+$FC
!ram_seed_Y = !CUSTOM_WRAM+$FE


; ---------
; Pointers
; ---------

!PRESET_SLOTS = $703000
!CRASHDUMP = $7EFF00

!PRESET_DOORS = !CUSTOM_WRAM+$180
!PRESET_SPECIAL = !CUSTOM_WRAM+$182
!PRESET_ENEMIES = !CUSTOM_WRAM+$184

!BRB_METROID = #$287F
!BRB_HEART = #$2899


; ------------------------
; SRAM for custom features
; ------------------------

!sram_ctrl_reveal_damage = !SRAM_START+$200
!sram_ctrl_randomize_rng = !SRAM_START+$202
!sram_ctrl_force_stand = !SRAM_START+$204
!sram_ctrl_auto_save_state = !SRAM_START+$206

!sram_menu_background = !SRAM_START+$210
!sram_scroll_button = !SRAM_START+$212
!sram_cm_scroll_button = !SRAM_START+$214
!sram_cm_scroll_delay = !SRAM_START+$216
!sram_cm_font = !SRAM_START+$218
!sram_number_gfx_choice = !SRAM_START+$21A

!sram_phantoon_intro = !SRAM_START+$220
!sram_kraid_intro = !SRAM_START+$222
!ram_magnetstairs = !SRAM_START+$224
!sram_preset_open_doors = !SRAM_START+$226
!sram_preset_ship_landing = !SRAM_START+$228
!sram_preset_enemies = !SRAM_START+$22A
!sram_fast_nintendo_logo = !SRAM_START+$22C
!sram_fanfare_timer_adjust = !SRAM_START+$22E

; FREE SPACE ^

!sram_countdamage = !SRAM_START+$240
!sram_superhud = !SRAM_START+$242
!sram_superhud_bottom = !SRAM_START+$244
!sram_superhud_middle = !SRAM_START+$246
!sram_superhud_top = !SRAM_START+$248
!sram_door_display_mode = !SRAM_START+$24A
!sram_display_mode_reward = !SRAM_START+$24C

; FREE SPACE ^

!sram_seed_X = !SRAM_START+$28C
!sram_seed_Y = !SRAM_START+$28E

!sram_presetrando = !SRAM_START+$290
!sram_presetrando_morph = !SRAM_START+$292
!sram_presetrando_charge = !SRAM_START+$294
!sram_presetrando_max_etanks = !SRAM_START+$296
!sram_presetrando_max_reserves = !SRAM_START+$298
!sram_presetrando_max_missiles = !SRAM_START+$29A
!sram_presetrando_max_supers = !SRAM_START+$29C
!sram_presetrando_max_pbs = !SRAM_START+$29E
!sram_presetrando_beampref = !SRAM_START+$2A0

!sram_custompalette_blue = !SRAM_START+$2A2
!sram_custompalette_green = !SRAM_START+$2A4
!sram_custompalette_red = !SRAM_START+$2A6
!sram_custompalette_hi = !SRAM_START+$2A8
!sram_custompalette_lo = !SRAM_START+$2AA

; FREE SPACE ^

; do not change order without updating custom palette profiles in menu.asm
!sram_palette_border = !SRAM_START+$2B0
!sram_palette_headeroutline = !SRAM_START+$2B2
!sram_palette_text = !SRAM_START+$2B4
!sram_palette_numoutline = !SRAM_START+$2B6
!sram_palette_numfill = !SRAM_START+$2B8
!sram_palette_toggleon = !SRAM_START+$2BA
!sram_palette_seltext = !SRAM_START+$2BC
!sram_palette_seltextbg = !SRAM_START+$2BE
!sram_palette_background = !SRAM_START+$2C0
!sram_palette_numseloutline = !SRAM_START+$2C2
!sram_palette_numsel = !SRAM_START+$2C4
!sram_custompalette_profile = !SRAM_START+$2C6

; FREE SPACE ^

!sram_customsfx_move = !SRAM_START+$2F0
!sram_customsfx_toggle = !SRAM_START+$2F2
!sram_customsfx_number = !SRAM_START+$2F4
!sram_customsfx_confirm = !SRAM_START+$2F6
!sram_customsfx_goback = !SRAM_START+$2F8

!sram_dummy_on = !SRAM_START+$2FA
!sram_dummy_off = !SRAM_START+$2FC
!sram_dummy_num = !SRAM_START+$2FE

