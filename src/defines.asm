
; -------------
; Version Flags
; -------------

!VERSION_HEADER = $00
!VERSION_MAJOR = 2
!VERSION_MINOR = 6
!VERSION_BUILD = 2
!VERSION_REV = 5


; ---------
; Work RAM
; ---------

!WRAM_BANK = !WRAM_START>>16
!WRAM_SIZE = #$0200
!WRAM_START = $7EFD00
!WRAM_END = $7EFF00
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

; FREE SPACE ^ up to +$4E

!ram_room_has_set_rng = !WRAM_START+$50
;!ram_FREE_SPACE = !WRAM_START+$52

!ram_load_preset = !WRAM_START+$54
!ram_custom_preset = !WRAM_START+$56

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
!ram_loadstate_rando_enable = !WRAM_START+$6C

; ----------------------------------------------------------
; Shinetune uses several variables not used by other modes,
; but also shinetune does not use many other variables,
; so the following variables share the same WRAM

!ram_xpos = !WRAM_START+$6E
!ram_ypos = !WRAM_START+$70
!ram_subpixel_pos = !WRAM_START+$72
!ram_horizontal_speed = !WRAM_START+$74
!ram_vertical_speed = !WRAM_START+$76
!ram_quickdrop_counter = !WRAM_START+$78
!ram_walljump_counter = !WRAM_START+$7A
!ram_fail_sum = !WRAM_START+$7C
!ram_fail_count = !WRAM_START+$7E

!ram_shine_dash_held_late = !WRAM_START+$6E
!ram_shinetune_early_1 = !WRAM_START+$70
!ram_shinetune_late_1 = !WRAM_START+$72
!ram_shinetune_early_2 = !WRAM_START+$74
!ram_shinetune_late_2 = !WRAM_START+$76
!ram_shinetune_early_3 = !WRAM_START+$78
!ram_shinetune_late_3 = !WRAM_START+$7A
!ram_shinetune_early_4 = !WRAM_START+$7C
!ram_shinetune_late_4 = !WRAM_START+$7E

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
!ram_phantoon_flame_direction = !WRAM_START+$DA
!ram_phantoon_always_visible = !WRAM_START+$DC

!ram_sprite_feature_flags = !WRAM_START+$DE
!ram_auto_save_state = !WRAM_START+$E0
!ram_timers_autoupdate = !WRAM_START+$E2
!ram_frames_held = !WRAM_START+$E4
!ram_quickboot_spc_state = !WRAM_START+$E6
!ram_print_segment_timer = !WRAM_START+$E8

!ram_watch_bank = !WRAM_START+$EA
!ram_watch_write_mode = !WRAM_START+$EC
!ram_watch_left = !WRAM_START+$EE
!ram_watch_right = !WRAM_START+$F0
!ram_watch_edit_left = !WRAM_START+$F2
!ram_watch_edit_right = !WRAM_START+$F4
!ram_watch_edit_lock_left = !WRAM_START+$F6
!ram_watch_edit_lock_right = !WRAM_START+$F8
!ram_watch_left_index = !WRAM_START+$FA
!ram_watch_right_index = !WRAM_START+$FC

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
!ram_cm_horizontal_cursor = !WRAM_MENU_START+$28

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
!ram_cm_gmode = !WRAM_MENU_START+$4E

!ram_seed_X = !WRAM_MENU_START+$50
!ram_seed_Y = !WRAM_MENU_START+$52

!ram_cm_sfxlib1 = !WRAM_MENU_START+$54
!ram_cm_sfxlib2 = !WRAM_MENU_START+$56
!ram_cm_sfxlib3 = !WRAM_MENU_START+$58

; ^ FREE SPACE ^ up to +$76

!ram_cm_preserved_timers = !WRAM_MENU_START+$88 ; 8 bytes

; ------------------
; Reusable RAM Menu
; ------------------

; The following RAM may be used multiple times,
; as long as it isn't used multiple times on the same menu page

!ram_zz_shared_80 = !WRAM_MENU_START+$80 ; this group is for symbols
!ram_zz_shared_82 = !WRAM_MENU_START+$82
;!ram_zz_shared_84 = !WRAM_MENU_START+$84
;!ram_zz_shared_86 = !WRAM_MENU_START+$86

!ram_cm_watch_enemy_property = !WRAM_MENU_START+$80
!ram_cm_watch_enemy_index = !WRAM_MENU_START+$82
!ram_cm_watch_enemy_side = !WRAM_MENU_START+$84
!ram_cm_watch_common_address = !WRAM_MENU_START+$86

!ram_cm_preset_elevator = !WRAM_MENU_START+$90

!ram_cm_phan_first_phase = !WRAM_MENU_START+$80
!ram_cm_phan_second_phase = !WRAM_MENU_START+$82

!ram_cm_keyboard_buffer = !WRAM_MENU_START+$90 ; $18 bytes

!ram_cm_manage_slots = !WRAM_MENU_START+$90
!ram_cm_selected_slot = !WRAM_MENU_START+$92

; ^ FREE SPACE ^ up to +$CE

; Currently first 28 bytes plus last 2 bytes are used
!ram_cgram_cache = !WRAM_MENU_START+$D0 ; $30 bytes


; -----------------
; Crash Handler RAM
; -----------------

!CRASHDUMP = $7EFF00

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
!ram_crash_bg = !CRASHDUMP+$44
!ram_crash_cursor = !CRASHDUMP+$46
!ram_crash_loop_counter = !CRASHDUMP+$48
!ram_crash_bytes_to_write = !CRASHDUMP+$4A
!ram_crash_stack_line_position = !CRASHDUMP+$4C
!ram_crash_text = !CRASHDUMP+$4E
!ram_crash_text_bank = !CRASHDUMP+$50
!ram_crash_text_palette = !CRASHDUMP+$52
!ram_crash_mem_viewer = !CRASHDUMP+$54
!ram_crash_mem_viewer_bank = !CRASHDUMP+$56
!ram_crash_temp = !CRASHDUMP+$58
!ram_crash_emu = !CRASHDUMP+$5A

!ram_crash_input = !CRASHDUMP+$60
!ram_crash_input_new = !CRASHDUMP+$62
!ram_crash_input_prev = !CRASHDUMP+$64
!ram_crash_input_timer = !CRASHDUMP+$66


; ---------------
; Vanilla Defines
; ---------------

!MUSIC_ROUTINE = $808FC1
!SFX_LIB1 = $80903F
!SFX_LIB2 = $8090C1
!SFX_LIB3 = $809143

!DECOMP_44 = $44
!DECOMP_SRC = $47
!DECOMP_VAR = $4A
!DECOMP_DEST = $4C
!DECOMP_DICTCOPY_INV = $4F
!REG_2100_BRIGHTNESS = $51
!REG_2108_BG2_TILEMAP = $59
!REG_4200_NMI = $84
!CONTROLLER_1_AUTOPRESS = $A3
!NEXT_IRQ_CMD = $A7
!IRQ_CMD = $AB
!REG_210D_BG1_X = $B1
!REG_210E_BG1_Y = $B3
!REG_210F_BG2_X = $B5
!REG_2110_BG2_Y = $B7

!VRAM_WRITE_STACK_POINTER = $0330
!OAM_LOW = $0370
!OAM_HIGH = $0570
!OAM_STACK_POINTER = $0590
!PB_EXPLOSION_STATUS = $0592
!REALTIME_LAG_COUNTER = $05A0 ; Not used in vanilla
!NMI_REQUEST_FLAG = $05B4
!FRAME_COUNTER_8BIT = $05B5
!FRAME_COUNTER = $05B6
!NMI_COUNTER = $05B8
!DEBUG_MODE = $05D1
!DEBUG_MISSILES = $05C9
!DEBUG_SUPERS = $05CB
!DEBUG_POWERBOMBS = $05CD
!DEBUG_MODE_FLAG = $05D1
!RANDOM_NUMBER = $05E5
!BITMASK = $05E7
!DISABLE_SOUNDS = $05F5
!DISABLE_MINIMAP = $05F7
!UPLOADING_TO_APU = $0617
!MUSIC_QUEUE_ENTRIES = $0619
!MUSIC_QUEUE_TIMERS = $0629
!MUSIC_QUEUE_NEXT = $0639
!MUSIC_QUEUE_START = $063B
!MUSIC_ENTRY = $063D
!MUSIC_TIMER = $063F
!SOUND_TIMER = $0686
!SCREEN_FADE_DELAY = $0723
!SCREEN_FADE_COUNTER = $0725
!PAUSE_MENU_INDEX = $0727
!AREA_MAP_COLLECTED = $0789
!LOAD_STATION_INDEX = $078B
!DOOR_ID = $078D
!DOOR_BTS = $078F
!DOOR_DIRECTION = $0791
!DOOR_FLAG_ELEV = $0795
!DOOR_FLAG_ENEMY = $0797
!ELEVATOR_DIRECTION = $0799
!ROOM_ID = $079B
!AREA_ID = $079F
!ROOM_WIDTH_BLOCKS = $07A5
!ROOM_WIDTH_SCROLLS = $07A9
!PREVIOUS_CRE_BITSET = $07B1
!CRE_BITSET = $07B3
!STATE_POINTER = $07BB
!ROOM_MUSIC_DATA_INDEX = $07CB
!ENEMY_POPULATION = $07CF
!ENEMY_SET = $07D1
!ROOM_MAIN_ASM_POINTER = $07DF
!MUSIC_DATA = $07F3
!MUSIC_TRACK = $07F5
!MAP_TILES_EXPLORED = $07F7
!LAYER1_SUB_X = $090F
!LAYER1_X = $0911
!LAYER1_SUB_Y = $0913
!LAYER1_Y = $0915
!LAYER2_X = $0917
!LAYER2_Y = $0919
!BG1_X_OFFSET = $091D
!BG1_Y_OFFSET = $091F
!BG2_X_OFFSET = $0921
!BG2_Y_OFFSET = $0923
!DOOR_DESTINATION_X = $0927
!DOOR_DESTINATION_Y = $0929
!SAMUS_DOOR_SUBSPEED = $092B
!SAMUS_DOOR_SPEED = $092D
!DOOR_FINISHED_SCROLLING = $0931
!CERES_STATUS = $093F
!TIMER_STATUS = $0943
!CURRENT_SAVE_FILE = $0952
!GAMEMODE = $0998
!DOOR_FUNCTION_POINTER = $099C
!SAMUS_ITEMS_EQUIPPED = $09A2
!SAMUS_ITEMS_COLLECTED = $09A4
!SAMUS_BEAMS_EQUIPPED = $09A6
!SAMUS_BEAMS_COLLECTED = $09A8
!CTRL_BINDING_UP = $09AA
!CTRL_BINDING_DOWN = $09AC
!CTRL_BINDING_LEFT = $09AE
!CTRL_BINDING_RIGHT = $09B0
!CTRL_BINDING_SHOT = $09B2
!CTRL_BINDING_JUMP = $09B4
!CTRL_BINDING_DASH = $09B6
!CTRL_BINDING_CANCEL = $09B8
!CTRL_BINDING_SELECT = $09BA
!CTRL_BINDING_ANGLEDOWN = $09BC
!CTRL_BINDING_ANGLEUP = $09BE
!SAMUS_RESERVE_MODE = $09C0
!SAMUS_HP = $09C2
!SAMUS_HP_MAX = $09C4
!SAMUS_MISSILES = $09C6
!SAMUS_MISSILES_MAX = $09C8
!SAMUS_SUPERS = $09CA
!SAMUS_SUPERS_MAX = $09CC
!SAMUS_PBS = $09CE
!SAMUS_PBS_MAX = $09D0
!SAMUS_ITEM_SELECTED = $09D2
!SAMUS_RESERVE_MAX = $09D4
!SAMUS_RESERVE_ENERGY = $09D6
!IGT_FRAMES = $09DA
!IGT_SECONDS = $09DC
!IGT_MINUTES = $09DE
!IGT_HOURS = $09E0
!SAMUS_MOONWALK = $09E4
!PAL_DEBUG_MOVEMENT = $09E6
!SAMUS_AUTO_CANCEL = $0A04
!SAMUS_LAST_HP = $0A06
!SAMUS_POSE = $0A1C
!SAMUS_POSE_DIRECTION = $0A1E
!SAMUS_MOVEMENT_TYPE = $0A1F
!SAMUS_PREVIOUS_POSE = $0A20
!SAMUS_PREVIOUS_POSE_DIRECTION = $0A22
!SAMUS_PREVIOUS_MOVEMENT_TYPE = $0A23
!SAMUS_LAST_DIFFERENT_POSE = $0A24
!SAMUS_LAST_DIFFERENT_POSE_DIRECTION = $0A26
!SAMUS_LAST_DIFFERENT_MOVEMENT_TYPE = $0A27
!SAMUS_POTENTIAL_POSE_VALUES = $0A28
!SAMUS_POTENTIAL_POSE_FLAGS = $0A2E
!SAMUS_LOCKED_HANDLER = $0A42
!SAMUS_MOVEMENT_HANDLER = $0A44
!SAMUS_SUBUNIT_ENERGY = $0A4C
!SAMUS_KNOCKBACK_DIRECTION = $0A54
!SAMUS_BOMB_JUMP_DIRECTION = $0A56
!SAMUS_NORMAL_MOVEMENT_HANDLER = $0A58
!SAMUS_TIMER_HACK_HANDLER = $0A5A
!SAMUS_DRAW_HANDLER = $0A5C
!SAMUS_CONTROLLER_HANDLER = $0A60
!SAMUS_SHINE_TIMER = $0A68
!SAMUS_HEALTH_WARNING = $0A6A
!SAMUS_X_SPEED_TABLE = $0A6C
!SAMUS_CONTACT_DAMAGE_INDEX = $0A6E
!SAMUS_WATER_PHYSICS = $0A70  ; Not used in vanilla
!SAMUS_HYPER_BEAM = $0A76
!TIME_IS_FROZEN = $0A78
!DEMO_PREINSTRUCTION_POINTER = $0A7A
!DEMO_INSTRUCTION_TIMER = $0A7C
!DEMO_INSTRUCTION_POINTER = $0A7E
!DEMO_CONTROLLER_PRI = $0A84
!DEMO_INPUT_ENABLED = $0A88
!DEMO_PREVIOUS_CONTROLLER_PRI = $0A8C
!DEMO_PREVIOUS_CONTROLLER_PRI_NEW = $0A8E
!SAMUS_ANIMATION_TIMER = $0A94
!SAMUS_ANIMATION_FRAME = $0A96
!SAMUS_LAVA_DAMAGE_SUITS = $0A98  ; Not used in vanilla
!SAMUS_SHINESPARK_DELAY_TIMER = $0AA2
!SAMUS_SHINE_TIMER_TYPE = $0ACC
!LIQUID_PHYSICS_TYPE = $0AD2
!SAMUS_AUTO_JUMP_TIMER = $0AF4
!SAMUS_X = $0AF6
!SAMUS_X_SUBPX = $0AF8
!SAMUS_Y = $0AFA
!SAMUS_Y_SUBPX = $0AFC
!SAMUS_X_RADIUS = $0AFE
!SAMUS_Y_RADIUS = $0B00
!SAMUS_COLLISION_DIRECTION = $0B02
!SAMUS_SPRITEMAP_X = $0B04
!SAMUS_PREVIOUS_X = $0B10
!SAMUS_PREVIOUS_X_SUBPX = $0B12
!SAMUS_PREVIOUS_Y = $0B14
!SAMUS_PREVIOUS_Y_SUBPX = $0B16
!SAMUS_Y_SUBSPEED = $0B2C
!SAMUS_Y_SPEEDCOMBINED = $0B2D
!SAMUS_Y_SPEED = $0B2E
!SAMUS_Y_SUBACCELERATION = $0B32
!SAMUS_Y_ACCELERATION = $0B34
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
!SAMUS_PROJ_PROPERTIES = $0C18
!SAMUS_COOLDOWN = $0CCC
!SAMUS_PROJECTILE_TIMER = $0CCE
!SAMUS_CHARGE_TIMER = $0CD0
!SAMUS_BOMB_COUNTER = $0CD2
!SAMUS_BOMB_SPREAD_CHARGE_TIMER = $0CD4
!SAMUS_POWER_BOMB_X = $0CE2
!SAMUS_POWER_BOMB_Y = $0CE4
!PREVIOUS_CONTROLLER_PRI = $0DFE
!PREVIOUS_CONTROLLER_PRI_NEW = $0E00
!ELEVATOR_PROPERTIES = $0E16
!ELEVATOR_STATUS = $0E18
!HEALTH_BOMB_FLAG = $0E1A
!ENEMY_BG2_VRAM_TRANSFER_FLAG = $0E1E
!ENEMY_MAIN_LOOP_COUNTER = $0E44
!ENEMY_KILLS_COUNTER = $0E50
!ENEMY_KILLS_UNLOCK = $0E52
!ENEMY_INDEX = $0E54
!ENEMY_ID = $0F78
!ENEMY_X = $0F7A
!ENEMY_Y = $0F7E
!ENEMY_X_RADIUS = $0F82
!ENEMY_Y_RADIUS = $0F84
!ENEMY_PROPERTIES = $0F86
!ENEMY_PROPERTIES_2 = $0F88
!ENEMY_HP = $0F8C
!ENEMY_SPRITEMAP = $0F8E
!ENEMY_TIMER = $0F90
!ENEMY_INIT_PARAM = $0F92
!ENEMY_PALETTE_INDEX = $0F96
!ENEMY_FROZEN_TIMER = $0F9E
!ENEMY_BANK = $0FA6
!ENEMY_FUNCTION_POINTER = $0FA8
!ENEMY_VAR_1 = $0FAA
!ENEMY_VAR_3 = $0FAE
!ENEMY_VAR_4 = $0FB0
!ENEMY_VAR_5 = $0FB2
!SAMUS_IFRAME_TIMER = $18A8
!SAMUS_KNOCKBACK_TIMER = $18AA
!LAVA_ACID_Y = $1962
!FX_BASE_Y = $1978
!ENEMY_PROJ_ENABLE = $198D
!ENEMY_PROJ_ID = $1997
!ENEMY_PROJ_X_SUBPX = $1A27
!ENEMY_PROJ_X = $1A4B
!ENEMY_PROJ_Y_SUBPX = $1A6F
!ENEMY_PROJ_Y = $1A93
!ENEMY_PROJ_X_VELOCITY = $1AB7
!ENEMY_PROJ_Y_VELOCITY = $1ADB
!ENEMY_PROJ_RADIUS = $1BB3
!ENEMY_PROJ_PROPERTIES = $1BD7
!MESSAGE_BOX_INDEX = $1C1F
!PLM_ENABLE = $1C23
!PLM_GFX_INDEX = $1C2D
!PLM_ID = $1C37
!SAVE_STATION_LOCKOUT = $1E75
!PALETTE_FX_ENABLE = $1E79
!PALETTE_FX_ID = $1E7D
!PALETTE_FX_COLOR_INDICES = $1E8D
!PALETTE_FX_VARIABLE = $1E9D
!PALETTE_FX_PREINSTRUCTION = $1EAD
!PALETTE_FX_INSTRUCTION_POINTER = $1EBD
!PALETTE_FX_INSTRUCTION_TIMER = $1ECD
!PALETTE_FX_TIMER = $1EDD
!CINEMATIC_FUNCTION_POINTER = $1F51
!DEMO_TIMER = $1F53
!DEMO_CURRENT_SET = $1F55
!DEMO_CURRENT_SCENE = $1F57
!HUD_TILEMAP = $7EC600
!LOADING_GAME_STATE = $7ED914

!LEVEL_DATA_SIZE = $7F0000
!LEVEL_DATA = $7F0002
!LEVEL_BTS = $7F6402

!INPUT_BIND_UP = $7E09AA
!INPUT_BIND_DOWN = $7E09AC
!INPUT_BIND_LEFT = $7E09AE
!INPUT_BIND_RIGHT = $7E09B0
!IH_INPUT_SHOT = $7E09B2
!IH_INPUT_JUMP = $7E09B4
!IH_INPUT_RUN = $7E09B6
!IH_INPUT_ITEM_CANCEL = $7E09B8
!IH_INPUT_ITEM_SELECT = $7E09BA
!IH_INPUT_ANGLE_UP = $7E09BE
!IH_INPUT_ANGLE_DOWN = $7E09BC

!PRESET_SLOTS = $703000
if !FEATURE_TINYSTATES
!TOTAL_PRESET_SLOTS = #$000F
!PRESET_SLOT_SIZE = #$0100
!PRESET_SLOTS_ROOM = $703000+$06
!PRESET_SLOTS_ENERGY = $703000+$28
!PRESET_SLOTS_MAXENERGY = $703000+$2A
!PRESET_SLOTS_RESERVES = $703000+$3C
!PRESET_SLOTS_MISSILES = $703000+$2C
!PRESET_SLOTS_SUPERS = $703000+$30
!PRESET_SLOTS_PBS = $703000+$34
else
!TOTAL_PRESET_SLOTS = #$0027
!PRESET_SLOT_SIZE = #$0200
!PRESET_SLOTS_ROOM = $703000+$0A
!PRESET_SLOTS_AREA = $703000+$0C
!PRESET_SLOTS_ENERGY = $703000+$2C
!PRESET_SLOTS_MAXENERGY = $703000+$2E
!PRESET_SLOTS_RESERVES = $703000+$40
!PRESET_SLOTS_MISSILES = $703000+$30
!PRESET_SLOTS_SUPERS = $703000+$34
!PRESET_SLOTS_PBS = $703000+$38
endif


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
!sram_magnetstairs = !SRAM_START+$44
!sram_cutscenes = !SRAM_START+$46
!sram_compressed_graphics = !SRAM_START+$48
!sram_lag_counter_mode = !SRAM_START+$4A

!sram_fast_doors = !SRAM_START+$4C
!sram_suppress_flashing = !SRAM_START+$4E
!sram_fast_elevators = !SRAM_START+$50
!sram_custom_damage = !SRAM_START+$52
!sram_custom_charge_damage = !SRAM_START+$54
!sram_custom_uncharge_damage = !SRAM_START+$56
!sram_water_physics = !SRAM_START+$58
!sram_double_jump = !SRAM_START+$5A

; do not change order without updating custom palette profiles in customizemenu.asm
!sram_palette_border = !SRAM_START+$5C
!sram_palette_headeroutline = !SRAM_START+$5E
!sram_palette_text = !SRAM_START+$60
!sram_palette_numoutline = !SRAM_START+$62
!sram_palette_numfill = !SRAM_START+$64
!sram_palette_toggleon = !SRAM_START+$66
!sram_palette_seltext = !SRAM_START+$68
!sram_palette_seltextbg = !SRAM_START+$6A
!sram_palette_background = !SRAM_START+$6C
!sram_palette_numseloutline = !SRAM_START+$6E
!sram_palette_numsel = !SRAM_START+$70
!sram_custompalette_profile = !SRAM_START+$72
;!sram_menu_background = !SRAM_START+$74
!sram_cm_scroll_delay = !SRAM_START+$76
!sram_customsfx_move = !SRAM_START+$78
!sram_customsfx_toggle = !SRAM_START+$7A
!sram_customsfx_number = !SRAM_START+$7C
!sram_customsfx_confirm = !SRAM_START+$7E
!sram_customsfx_goback = !SRAM_START+$80

!sram_seed_X = !SRAM_START+$82
!sram_seed_Y = !SRAM_START+$84

!sram_fast_teleport = !SRAM_START+$86

; ^ FREE SPACE ^ up to $F02BEE

!sram_custom_header = !SRAM_START+$BD8 ; $18 bytes

!sram_custom_header_normal = !SRAM_START+$BA8 ; $18 bytes
!sram_custom_preset_safewords_normal = !SRAM_START+$BC0 ; $50 bytes
!sram_custom_preset_names_normal = !SRAM_START+$C10 ; $3C0 bytes

!sram_custom_header_tinystates = !SRAM_START+$E18 ; $18 bytes
!sram_custom_preset_safewords_tinystates = !SRAM_START+$E30 ; $20 bytes
!sram_custom_preset_names_tinystates = !SRAM_START+$E50 ; $180 bytes


; ----------
; Save/Load
; ----------

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
!SRAM_SLOWDOWN_MODE = $737F90
!SRAM_SAVED_ENEMY_COUNTER = $737F92
else
!SRAM_DMA_BANK = $770000
!SRAM_SAVED_RNG = $770080
!SRAM_SAVED_FRAME_COUNTER = $770082
!SRAM_SAVED_ENEMY_COUNTER = $770084
!SRAM_SAVED_SP = $774004
!SRAM_SAVED_STATE = $774006
!SRAM_SAVED_MINIMAP = $774008
!SRAM_SEG_TIMER_F = $737F8A
!SRAM_SEG_TIMER_S = $737F8C
!SRAM_SEG_TIMER_M = $737F8E
!SRAM_SLOWDOWN_MODE = $737F90
endif

; SM specific things
!SRAM_MUSIC_DATA = $701FD0
!SRAM_MUSIC_TRACK = $701FD2
!SRAM_SOUND_TIMER = $701FD4


; ----------------------------------------------------------------------- ;
;                             Custom Features                             ;
; ----------------------------------------------------------------------- ;

!ram_countdamage = $0B0C


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
!ram_hyper_beam = !CUSTOM_WRAM+$28

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
!ram_radar6 = !CUSTOM_WRAM+$68
!ram_radar7 = !CUSTOM_WRAM+$6A

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

!ram_frames_held_timers = !CUSTOM_WRAM+$100 ; $18 bytes

!PRESET_DOORS = !CUSTOM_WRAM+$180
!PRESET_SPECIAL = !CUSTOM_WRAM+$182
!PRESET_ENEMIES = !CUSTOM_WRAM+$184


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

; FREE SPACE ^

!sram_cm_font = !SRAM_START+$218
!sram_number_gfx_choice = !SRAM_START+$21A

!sram_phantoon_intro = !SRAM_START+$220
!sram_kraid_intro = !SRAM_START+$222
!ram_magnetstairs = !SRAM_START+$224
!sram_preset_open_doors = !SRAM_START+$226
!sram_preset_ship_landing = !SRAM_START+$228
!sram_preset_enemies = !SRAM_START+$22A
!sram_demo_timer = !SRAM_START+$22C
!sram_preset_elevator = !SRAM_START+$22E
!sram_preset_map_tiles = !SRAM_START+$230
!sram_preset_auto_segment = !SRAM_START+$232
!sram_random_bubble_sfx = !SRAM_START+$234

; FREE SPACE ^

!sram_countdamage = !SRAM_START+$240
!sram_superhud = !SRAM_START+$242
!sram_superhud_bottom = !SRAM_START+$244
!sram_superhud_middle = !SRAM_START+$246
!sram_superhud_top = !SRAM_START+$248
!sram_door_display_mode = !SRAM_START+$24A
!sram_display_mode_reward = !SRAM_START+$24C

; FREE SPACE ^

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
!sram_custompalette = !SRAM_START+$2A8

!sram_loadstate_rando_energy = !SRAM_START+$2AA
!sram_loadstate_rando_reserves = !SRAM_START+$2AC
!sram_loadstate_rando_missiles = !SRAM_START+$2AE
!sram_loadstate_rando_supers = !SRAM_START+$2B0
!sram_loadstate_rando_powerbombs = !SRAM_START+$2B2

; FREE SPACE ^

!sram_dummy_on = !SRAM_START+$2FA
!sram_dummy_off = !SRAM_START+$2FC
!sram_dummy_num = !SRAM_START+$2FE


; ---------
; Pointers
; ---------

; this is moved here to prevent symbols.asm from having duplicate labels
if !FEATURE_TINYSTATES
!sram_read_only_locks = !SRAM_START+$DFA ; $6 bytes
!sram_streamer_name = !SRAM_START+$E00 ; $18 bytes
!sram_custom_header = !SRAM_START+$E18 ; $18 bytes
!sram_custom_preset_safewords = !SRAM_START+$E60 ; $20 bytes
!sram_custom_preset_names = !SRAM_START+$E80 ; $180 bytes
else
!sram_read_only_locks = !SRAM_START+$B8A ; $6 bytes
!sram_streamer_name = !SRAM_START+$B90 ; $18 bytes
!sram_custom_header = !SRAM_START+$BA8 ; $18 bytes
!sram_custom_preset_safewords = !SRAM_START+$BF0 ; $50 bytes
!sram_custom_preset_names = !SRAM_START+$C40 ; $3C0 bytes
endif

!IH_CONTROLLER_PRI = $8B
!IH_CONTROLLER_PRI_NEW = $8F
!IH_CONTROLLER_PRI_PREV = $97

!IH_CONTROLLER_SEC = $8D
!IH_CONTROLLER_SEC_NEW = $91
!IH_CONTROLLER_SEC_PREV = $99

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
!DP_KB_Index = $18
!DP_KB_Row = $1A
!DP_KB_Control = $1C
!DP_KB_Shift = $1E
; v single digit editing v
!DP_DigitAddress = $20 ; 0x4
!DP_DigitValue = $24
!DP_DigitMinimum = $26
!DP_DigitMaximum = $28

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
!ACTION_RAM_WATCH           = #$0020
!ACTION_DYNAMIC             = #$0022
!ACTION_MANAGE_PRESETS      = #$0024

if !FEATURE_PAL
!FRAMERATE = #$0032
else
!FRAMERATE = #$003C
endif

; menu tiles
!KB_SHIFT1 = $9A
!KB_SHIFT2 = $9B
!KB_DEL1 = $9C
!KB_DEL2 = $9D
!MENU_CLEAR = #$000E
!MENU_BLANK = #$281F
!MENU_SLASH = #$289F
!MENU_ARROW_RIGHT = #$3880
!MENU_LOCK = #$2895

; HUD tiles
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
!IH_NUMBER_ZERO = #$0C09
!IH_ARROW_LEFT = #$0C60
!IH_ARROW_UP = #$0C61
!IH_ARROW_RIGHT = #$0C62
!IH_ARROW_DOWN = #$0C63
!IH_MORPH_BALL_YELLOW = #$00C9
!IH_MORPH_BALL_GREEN = #$10C9
!IH_ARROW_UP_PINK_OUTLINE = #$0861
!IH_ARROW_DOWN_PINK_OUTLINE = #$0863
!IH_ARROW_UP_RED = #$1C61
!IH_ARROW_UP_GREY = #$1461
!IH_ARROW_DOWN_RED = #$1C63
!IH_ARROW_DOWN_GREY = #$1463

!IH_PAUSE = #$0100 ; right
!IH_SLOWDOWN = #$0400 ; down
!IH_SPEEDUP = #$0800 ; up
!IH_RESET = #$0200 ; left
!IH_STATUS_R = #$0010 ; r
!IH_STATUS_L = #$0020 ; l

!IH_INPUT_HELD = #$0001
!IH_INPUT_START = #$1000
!IH_INPUT_UPDOWN = #$0C00
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

!IH_MODE_INDEX_ENEMYHP = #(InfoHUDModeTable_enemyhp-InfoHUDModeTable)/2
!IH_MODE_INDEX_ROOMSTRAT = #(InfoHUDModeTable_roomstrat-InfoHUDModeTable)/2
!IH_MODE_INDEX_CHARGETIMER = #(InfoHUDModeTable_chargetimer-InfoHUDModeTable)/2
!IH_MODE_INDEX_XFACTOR = #(InfoHUDModeTable_xfactor-InfoHUDModeTable)/2
!IH_MODE_INDEX_COOLDOWN = #(InfoHUDModeTable_cooldown-InfoHUDModeTable)/2
!IH_MODE_INDEX_SHINETIMER = #(InfoHUDModeTable_shinetimer-InfoHUDModeTable)/2
!IH_MODE_INDEX_DASHCOUNTER = #(InfoHUDModeTable_dashcounter-InfoHUDModeTable)/2
!IH_MODE_INDEX_SHINETUNE = #(InfoHUDModeTable_shinetune-InfoHUDModeTable)/2
!IH_MODE_INDEX_IFRAMECOUNTER = #(InfoHUDModeTable_iframecounter-InfoHUDModeTable)/2
!IH_MODE_INDEX_SPIKESUIT = #(InfoHUDModeTable_spikesuit-InfoHUDModeTable)/2
!IH_MODE_INDEX_LAGCOUNTER = #(InfoHUDModeTable_lagcounter-InfoHUDModeTable)/2
!IH_MODE_INDEX_CPUUSAGE = #(InfoHUDModeTable_cpuusage-InfoHUDModeTable)/2
!IH_MODE_INDEX_HSPEED = #(InfoHUDModeTable_hspeed-InfoHUDModeTable)/2
!IH_MODE_INDEX_DASHSPEED = #(InfoHUDModeTable_dashspeed-InfoHUDModeTable)/2
!IH_MODE_INDEX_VSPEED = #(InfoHUDModeTable_vspeed-InfoHUDModeTable)/2
!IH_MODE_INDEX_QUICKDROP = #(InfoHUDModeTable_quickdrop-InfoHUDModeTable)/2
!IH_MODE_INDEX_WALLJUMP = #(InfoHUDModeTable_walljump-InfoHUDModeTable)/2
!IH_MODE_INDEX_DOUBLESBJ = #(InfoHUDModeTable_doublesbj-InfoHUDModeTable)/2
!IH_MODE_INDEX_COUNTDAMAGE = #(InfoHUDModeTable_countdamage-InfoHUDModeTable)/2
!IH_MODE_INDEX_ARMPUMP = #(InfoHUDModeTable_armpump-InfoHUDModeTable)/2
!IH_MODE_INDEX_PUMPCOUNTER = #(InfoHUDModeTable_pumpcounter-InfoHUDModeTable)/2
!IH_MODE_INDEX_XPOS = #(InfoHUDModeTable_xpos-InfoHUDModeTable)/2
!IH_MODE_INDEX_YPOS = #(InfoHUDModeTable_ypos-InfoHUDModeTable)/2
!IH_MODE_INDEX_CAMERAPOS = #(InfoHUDModeTable_camerapos-InfoHUDModeTable)/2
!IH_MODE_INDEX_SHOTTIMER = #(InfoHUDModeTable_shottimer-InfoHUDModeTable)/2
!IH_MODE_INDEX_RAMWATCH = #(InfoHUDModeTable_ramwatch-InfoHUDModeTable)/2
!IH_MODE_COUNT = #(InfoHUDModeTable_end-InfoHUDModeTable)/2

!IH_STRAT_INDEX_SUPERHUD = #(status_room_table_superhud-status_room_table)/2
!IH_STRAT_INDEX_CERESRIDLEY = #(status_room_table_ceresridley-status_room_table)/2
!IH_STRAT_INDEX_DOORSKIP = #(status_room_table_doorskip-status_room_table)/2
!IH_STRAT_INDEX_TACOTANK = #(status_room_table_tacotank-status_room_table)/2
!IH_STRAT_INDEX_PITDOOR = #(status_room_table_pitdoor-status_room_table)/2
!IH_STRAT_INDEX_MOONDANCE = #(status_room_table_moondance-status_room_table)/2
!IH_STRAT_INDEX_KRAIDRADAR = #(status_room_table_kraidradar-status_room_table)/2
!IH_STRAT_INDEX_GATEGLITCH = #(status_room_table_gateglitch-status_room_table)/2
!IH_STRAT_INDEX_MOATCWJ = #(status_room_table_moatcwj-status_room_table)/2
!IH_STRAT_INDEX_ROBOTFLUSH = #(status_room_table_robotflush-status_room_table)/2
!IH_STRAT_INDEX_SHINETOPB = #(status_room_table_shinetopb-status_room_table)/2
!IH_STRAT_INDEX_ELEVATORCF = #(status_room_table_elevatorcf-status_room_table)/2
!IH_STRAT_INDEX_BOTWOONCF = #(status_room_table_botwooncf-status_room_table)/2
!IH_STRAT_INDEX_DRAYGONAI = #(status_room_table_draygonai-status_room_table)/2
!IH_STRAT_INDEX_SNAILCLIP = #(status_room_table_snailclip-status_room_table)/2
!IH_STRAT_INDEX_WASTELAND = #(status_room_table_wasteland-status_room_table)/2
!IH_STRAT_INDEX_RIDLEYAI = #(status_room_table_ridleyai-status_room_table)/2
!IH_STRAT_INDEX_KIHUNTERMANIP = #(status_room_table_kihuntermanip-status_room_table)/2
!IH_STRAT_INDEX_DOWNBACKZEB = #(status_room_table_downbackzeb-status_room_table)/2
!IH_STRAT_INDEX_ZEBSKIP = #(status_room_table_zebskip-status_room_table)/2
!IH_STRAT_INDEX_MBHP = #(status_room_table_mbhp-status_room_table)/2
!IH_STRAT_INDEX_TWOCRIES = #(status_room_table_twocries-status_room_table)/2
!IH_STRAT_COUNT = #(status_room_table_end-status_room_table)/2

!IH_SUPERHUD_BOTTOM_INDEX_ENEMYHP = #(superhud_bottom_table_enemyhp-superhud_bottom_table)/2
!IH_SUPERHUD_BOTTOM_INDEX_CHARGETIMER = #(superhud_bottom_table_chargetimer-superhud_bottom_table)/2
!IH_SUPERHUD_BOTTOM_INDEX_XFACTOR = #(superhud_bottom_table_xfactor-superhud_bottom_table)/2
!IH_SUPERHUD_BOTTOM_INDEX_COOLDOWN = #(superhud_bottom_table_cooldown-superhud_bottom_table)/2
!IH_SUPERHUD_BOTTOM_INDEX_SHINETIMER = #(superhud_bottom_table_shinetimer-superhud_bottom_table)/2
!IH_SUPERHUD_BOTTOM_INDEX_DASHCOUNTER = #(superhud_bottom_table_dashcounter-superhud_bottom_table)/2
!IH_SUPERHUD_BOTTOM_INDEX_SHINETUNE = #(superhud_bottom_table_shinetune-superhud_bottom_table)/2
!IH_SUPERHUD_BOTTOM_INDEX_IFRAMECOUNTER = #(superhud_bottom_table_iframecounter-superhud_bottom_table)/2
!IH_SUPERHUD_BOTTOM_INDEX_SPIKESUIT = #(superhud_bottom_table_spikesuit-superhud_bottom_table)/2
!IH_SUPERHUD_BOTTOM_INDEX_LAGCOUNTER = #(superhud_bottom_table_lagcounter-superhud_bottom_table)/2
!IH_SUPERHUD_BOTTOM_INDEX_CPUUSAGE = #(superhud_bottom_table_cpuusage-superhud_bottom_table)/2
!IH_SUPERHUD_BOTTOM_INDEX_HSPEED = #(superhud_bottom_table_hspeed-superhud_bottom_table)/2
!IH_SUPERHUD_BOTTOM_INDEX_DASHSPEED = #(superhud_bottom_table_dashspeed-superhud_bottom_table)/2
!IH_SUPERHUD_BOTTOM_INDEX_VSPEED = #(superhud_bottom_table_vspeed-superhud_bottom_table)/2
!IH_SUPERHUD_BOTTOM_INDEX_QUICKDROP = #(superhud_bottom_table_quickdrop-superhud_bottom_table)/2
!IH_SUPERHUD_BOTTOM_INDEX_WALLJUMP = #(superhud_bottom_table_walljump-superhud_bottom_table)/2
!IH_SUPERHUD_BOTTOM_INDEX_DOUBLESBJ = #(superhud_bottom_table_doublesbj-superhud_bottom_table)/2
!IH_SUPERHUD_BOTTOM_INDEX_COUNTDAMAGE = #(superhud_bottom_table_countdamage-superhud_bottom_table)/2
!IH_SUPERHUD_BOTTOM_INDEX_ARMPUMP = #(superhud_bottom_table_armpump-superhud_bottom_table)/2
!IH_SUPERHUD_BOTTOM_INDEX_PUMPCOUNTER = #(superhud_bottom_table_pumpcounter-superhud_bottom_table)/2
!IH_SUPERHUD_BOTTOM_INDEX_XPOS = #(superhud_bottom_table_xpos-superhud_bottom_table)/2
!IH_SUPERHUD_BOTTOM_INDEX_YPOS = #(superhud_bottom_table_ypos-superhud_bottom_table)/2
!IH_SUPERHUD_BOTTOM_INDEX_CAMERAPOS = #(superhud_bottom_table_camerapos-superhud_bottom_table)/2
!IH_SUPERHUD_BOTTOM_INDEX_SHOTTIMER = #(superhud_bottom_table_shottimer-superhud_bottom_table)/2
!IH_SUPERHUD_BOTTOM_INDEX_RAMWATCH = #(superhud_bottom_table_ramwatch-superhud_bottom_table)/2
!IH_SUPERHUD_BOTTOM_INDEX_CERESRIDLEY = #(superhud_bottom_table_ceresridley-superhud_bottom_table)/2
!IH_SUPERHUD_BOTTOM_INDEX_DOORSKIP = #(superhud_bottom_table_doorskip-superhud_bottom_table)/2
!IH_SUPERHUD_BOTTOM_INDEX_TACOTANK = #(superhud_bottom_table_tacotank-superhud_bottom_table)/2
!IH_SUPERHUD_BOTTOM_INDEX_PITDOOR = #(superhud_bottom_table_pitdoor-superhud_bottom_table)/2
!IH_SUPERHUD_BOTTOM_INDEX_MOONDANCE = #(superhud_bottom_table_moondance-superhud_bottom_table)/2
!IH_SUPERHUD_BOTTOM_INDEX_KRAIDRADAR = #(superhud_bottom_table_kraidradar-superhud_bottom_table)/2
!IH_SUPERHUD_BOTTOM_INDEX_GATEGLITCH = #(superhud_bottom_table_gateglitch-superhud_bottom_table)/2
!IH_SUPERHUD_BOTTOM_INDEX_MOATCWJ = #(superhud_bottom_table_moatcwj-superhud_bottom_table)/2
!IH_SUPERHUD_BOTTOM_INDEX_ROBOTFLUSH = #(superhud_bottom_table_robotflush-superhud_bottom_table)/2
!IH_SUPERHUD_BOTTOM_INDEX_SHINETOPB = #(superhud_bottom_table_shinetopb-superhud_bottom_table)/2
!IH_SUPERHUD_BOTTOM_INDEX_ELEVATORCF = #(superhud_bottom_table_elevatorcf-superhud_bottom_table)/2
!IH_SUPERHUD_BOTTOM_INDEX_BOTWOONCF = #(superhud_bottom_table_botwooncf-superhud_bottom_table)/2
!IH_SUPERHUD_BOTTOM_INDEX_DRAYGONAI = #(superhud_bottom_table_draygonai-superhud_bottom_table)/2
!IH_SUPERHUD_BOTTOM_INDEX_SNAILCLIP = #(superhud_bottom_table_snailclip-superhud_bottom_table)/2
!IH_SUPERHUD_BOTTOM_INDEX_WASTELAND = #(superhud_bottom_table_wasteland-superhud_bottom_table)/2
!IH_SUPERHUD_BOTTOM_INDEX_RIDLEYAI = #(superhud_bottom_table_ridleyai-superhud_bottom_table)/2
!IH_SUPERHUD_BOTTOM_INDEX_KIHUNTERMANIP = #(superhud_bottom_table_kihuntermanip-superhud_bottom_table)/2
!IH_SUPERHUD_BOTTOM_INDEX_DOWNBACKZEB = #(superhud_bottom_table_downbackzeb-superhud_bottom_table)/2
!IH_SUPERHUD_BOTTOM_INDEX_ZEBSKIP = #(superhud_bottom_table_zebskip-superhud_bottom_table)/2
!IH_SUPERHUD_BOTTOM_INDEX_MBHP = #(superhud_bottom_table_mbhp-superhud_bottom_table)/2
!IH_SUPERHUD_BOTTOM_INDEX_TWOCRIES = #(superhud_bottom_table_twocries-superhud_bottom_table)/2
!IH_SUPERHUD_BOTTOM_COUNT = #(superhud_bottom_table_end-superhud_bottom_table)/2

!IH_SUPERHUD_MIDDLE_INDEX_OFF = #(superhud_middle_table_off-superhud_middle_table)/2
!IH_SUPERHUD_MIDDLE_INDEX_CHARGETIMER = #(superhud_middle_table_chargetimer-superhud_middle_table)/2
!IH_SUPERHUD_MIDDLE_INDEX_XFACTOR = #(superhud_middle_table_xfactor-superhud_middle_table)/2
!IH_SUPERHUD_MIDDLE_INDEX_COOLDOWN = #(superhud_middle_table_cooldown-superhud_middle_table)/2
!IH_SUPERHUD_MIDDLE_INDEX_SHINETIMER = #(superhud_middle_table_shinetimer-superhud_middle_table)/2
!IH_SUPERHUD_MIDDLE_INDEX_DASHCOUNTER = #(superhud_middle_table_dashcounter-superhud_middle_table)/2
!IH_SUPERHUD_MIDDLE_INDEX_IFRAMECOUNTER = #(superhud_middle_table_iframecounter-superhud_middle_table)/2
!IH_SUPERHUD_MIDDLE_INDEX_LAGCOUNTER = #(superhud_middle_table_lagcounter-superhud_middle_table)/2
!IH_SUPERHUD_MIDDLE_INDEX_CPUUSAGE = #(superhud_middle_table_cpuusage-superhud_middle_table)/2
!IH_SUPERHUD_MIDDLE_INDEX_HSPEED = #(superhud_middle_table_hspeed-superhud_middle_table)/2
!IH_SUPERHUD_MIDDLE_INDEX_DASHSPEED = #(superhud_middle_table_dashspeed-superhud_middle_table)/2
!IH_SUPERHUD_MIDDLE_INDEX_SHOTTIMER = #(superhud_middle_table_shottimer-superhud_middle_table)/2
!IH_SUPERHUD_MIDDLE_INDEX_ITEMPERCENT = #(superhud_middle_table_itempercent-superhud_middle_table)/2
!IH_SUPERHUD_MIDDLE_INDEX_RESERVES = #(superhud_middle_table_reserves-superhud_middle_table)/2
!IH_SUPERHUD_MIDDLE_INDEX_STATUSICONS = #(superhud_middle_table_statusicons-superhud_middle_table)/2
!IH_SUPERHUD_MIDDLE_INDEX_TILECOUNTER = #(superhud_middle_table_tilecounter-superhud_middle_table)/2
!IH_SUPERHUD_MIDDLE_COUNT = #(superhud_middle_table_-superhud_middle_table)/2

!IH_SUPERHUD_TOP_INDEX_OFF = #(superhud_top_table_off-superhud_top_table)/2
!IH_SUPERHUD_TOP_INDEX_CHARGETIMER = #(superhud_top_table_chargetimer-superhud_top_table)/2
!IH_SUPERHUD_TOP_INDEX_XFACTOR = #(superhud_top_table_xfactor-superhud_top_table)/2
!IH_SUPERHUD_TOP_INDEX_COOLDOWN = #(superhud_top_table_cooldown-superhud_top_table)/2
!IH_SUPERHUD_TOP_INDEX_SHINETIMER = #(superhud_top_table_shinetimer-superhud_top_table)/2
!IH_SUPERHUD_TOP_INDEX_DASHCOUNTER = #(superhud_top_table_dashcounter-superhud_top_table)/2
!IH_SUPERHUD_TOP_INDEX_IFRAMECOUNTER = #(superhud_top_table_iframecounter-superhud_top_table)/2
!IH_SUPERHUD_TOP_INDEX_LAGCOUNTER = #(superhud_top_table_lagcounter-superhud_top_table)/2
!IH_SUPERHUD_TOP_INDEX_CPUUSAGE = #(superhud_top_table_cpuusage-superhud_top_table)/2
!IH_SUPERHUD_TOP_INDEX_HSPEED = #(superhud_top_table_hspeed-superhud_top_table)/2
!IH_SUPERHUD_TOP_INDEX_DASHSPEED = #(superhud_top_table_dashspeed-superhud_top_table)/2
!IH_SUPERHUD_TOP_INDEX_SHOTTIMER = #(superhud_top_table_shottimer-superhud_top_table)/2
!IH_SUPERHUD_TOP_INDEX_ITEMPERCENT = #(superhud_top_table_itempercent-superhud_top_table)/2
!IH_SUPERHUD_TOP_INDEX_RESERVES = #(superhud_top_table_reserves-superhud_top_table)/2
!IH_SUPERHUD_TOP_INDEX_STATUSICONS = #(superhud_top_table_statusicons-superhud_top_table)/2
!IH_SUPERHUD_TOP_INDEX_TILECOUNTER = #(superhud_top_table_tilecounter-superhud_top_table)/2
!IH_SUPERHUD_TOP_COUNT = #(superhud_top_table_end-superhud_top_table)/2

!IH_DOOR_INDEX_HSPEED = #(status_door_display_table_hspeed-status_door_display_table)/2
!IH_DOOR_INDEX_VSPEED = #(status_door_display_table_vspeed-status_door_display_table)/2
!IH_DOOR_INDEX_CHARGETIMER = #(status_door_display_table_chargetimer-status_door_display_table)/2
!IH_DOOR_INDEX_SHINETIMER = #(status_door_display_table_shinetimer-status_door_display_table)/2
!IH_DOOR_INDEX_DASHCOUNTER = #(status_door_display_table_dashcounter-status_door_display_table)/2
!IH_DOOR_INDEX_XPOS = #(status_door_display_table_xpos-status_door_display_table)/2
!IH_DOOR_INDEX_YPOS = #(status_door_display_table_ypos-status_door_display_table)/2

!TOP_HUD_RESERVES_INDEX = #(ih_top_HUD_mode_reserves-ih_top_HUD_mode_start)/$D
!TOP_HUD_VANILLA_INDEX = #(ih_top_HUD_mode_vanilla-ih_top_HUD_mode_start)/$D
!FRAME_COUNTER_ADJUST_REALTIME = #(ih_room_counter_adjust-ih_room_counter_start)/$D

!SPRITE_SAMUS_HITBOX = #$0001
!SPRITE_ENEMY_HITBOX = #$0002
!SPRITE_EXTENDED_HITBOX = #$0004
!SPRITE_BOSS_HITBOX = #$0008
!SPRITE_SAMUS_PROJ = #$0010
!SPRITE_ENEMY_PROJ = #$0020
!SPRITE_32x32_PROJ = #$0040
!SPRITE_OOB_WATCH = #$0080
!SPRITE_OOB_X_WRAP = #$0400

!CUTSCENE_SKIP_INTRO = #$0001
!CUTSCENE_SKIP_CERES_ARRIVAL = #$0002
!CUTSCENE_SKIP_G4 = #$0080
!CUTSCENE_FAST_MB = #$0100
!CUTSCENE_QUICKBOOT = #$0800
!CUTSCENE_SKIP_GAMEOVER = #$1000
!CUTSCENE_FAST_BOWLING = #$2000
!CUTSCENE_KRAID_DEATH_CAMERA = #$4000

!PRESETS_ELEVATOR_SHORT = #$0001
!PRESETS_ELEVATOR_LONG = #$0002

!PROFILE_CUSTOM       = #$0000
!PROFILE_Twitch       = #$0001
!PROFILE_Default      = #$0002
!PROFILE_Firebat      = #$0003
!PROFILE_wardrinker   = #$0004
!PROFILE_mm2          = #$0005
!PROFILE_ptoil        = #$0006
!PROFILE_Zohdin       = #$0007
!PROFILE_DarkXoa      = #$0008
!PROFILE_Melonax      = #$0009
!PROFILE_TopsyTurvy   = #$000A
!PROFILE_OST          = #$000B
!PROFILE_JRP          = #$000C
!PROFILE_Layrus       = #$000D
!PROFILE_Dayne        = #$000E
!PROFILE_DreamCowboy  = #$000F
!PROFILE_Zeni         = #$0010
!PROFILE_Dyce         = #$0011
!PROFILE_Forever      = #$0012
!PROFILE_Grey         = #$0013
!PROFILE_Red          = #$0014
!PROFILE_Purple       = #$0015
!PROFILE_HUD          = #$0016
!PROFILE_Memes        = #$0017
!PROFILE_Grapedrinkz  = #$0018
!PROFILE_PapaSchmo    = #$0019
!PROFILE_Vespher      = #$001A
!PROFILE_EXAKT        = #$001B
!PROFILE_Bastion      = #$001C
!PROFILE_D9Killdozer  = #$001D

!BRB_TOTAL_SCREENS = #(BRBTilemapAddress_end-BRBTilemapAddress)/2
!BRB_METROID = #$287F
!BRB_HEART = #$2899

!SAFEWORD = #$5AFE


; Savestate code variables
!SS_BANK = $8000
