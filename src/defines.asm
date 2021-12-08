; ---------------
; Compiler Flags
; ---------------

!FEATURE_REDESIGN ?= 0
!FEATURE_SD2SNES ?= 1
!ORIGINAL_MESSAGE_TEXT ?= 0
!PRESERVE_WRAM_DURING_SPACETIME ?= 0

!VERSION_MAJOR = 2
!VERSION_MINOR = 3
!VERSION_BUILD = 1
!VERSION_REV_1 = 0
!VERSION_REV_2 = 0

; ---------
; Work RAM
; ---------

!WRAM_BANK = #$007E
!WRAM_SIZE = #$0200
!WRAM_START = $7EFB00

!ram_load_preset = !WRAM_START+$00
!ram_gametime_room = !WRAM_START+$02
!ram_last_gametime_room = !WRAM_START+$04
!ram_realtime_room = !WRAM_START+$06
!ram_last_realtime_room = !WRAM_START+$08
!ram_last_room_lag = !WRAM_START+$0A
!ram_last_door_lag_frames = !WRAM_START+$0C
!ram_transition_counter = !WRAM_START+$0E
!ram_transition_flag = !WRAM_START+$10
!ram_transition_flag_2 = !WRAM_START+$12

!ram_seg_rt_frames = !WRAM_START+$14
!ram_seg_rt_seconds = !WRAM_START+$16
!ram_seg_rt_minutes = !WRAM_START+$18
!ram_reset_segment_later = !WRAM_START+$1A

!ram_ih_controller = !WRAM_START+$1C
!ram_slowdown_controller_1 = !WRAM_START+$1E
!ram_slowdown_controller_2 = !WRAM_START+$20
!ram_slowdown_frames = !WRAM_START+$22

!ram_tmp_1 = !WRAM_START+$24
!ram_tmp_2 = !WRAM_START+$26
!ram_tmp_3 = !WRAM_START+$28
!ram_tmp_4 = !WRAM_START+$2A

!ram_last_hp = !WRAM_START+$2C

; ^ FREE SPACE ^

!ram_pct_1 = !WRAM_START+$30
!ram_pct_2 = !WRAM_START+$32
!ram_armed_shine_duration = !WRAM_START+$34
!ram_minimap = !WRAM_START+$36
!ram_map_counter = !WRAM_START+$38
!ram_vcounter_data = !WRAM_START+$3A

!ram_sprite_hitbox_active = !WRAM_START+$3C
!ram_oob_watch_active = !WRAM_START+$3E
!ram_custom_preset = !WRAM_START+$40

!ram_magic_pants_enabled = !WRAM_START+$42
!ram_magic_pants_state = !WRAM_START+$44
!ram_magic_pants_pal1 = !WRAM_START+$46
!ram_magic_pants_pal2 = !WRAM_START+$48
!ram_magic_pants_pal3 = !WRAM_START+$4A

!ram_room_has_set_rng = !WRAM_START+$4C
!ram_kraid_rng = !WRAM_START+$4E
!ram_crocomire_rng = !WRAM_START+$50
!ram_phantoon_rng_1 = !WRAM_START+$52
!ram_phantoon_rng_2 = !WRAM_START+$54
!ram_phantoon_rng_3 = !WRAM_START+$56
!ram_botwoon_rng = !WRAM_START+$58
!ram_draygon_rng_left = !WRAM_START+$5A
!ram_draygon_rng_right = !WRAM_START+$5C

!ram_game_loop_extras = !WRAM_START+$5E
!ram_game_mode_extras = !WRAM_START+$60

!ram_metronome = !WRAM_START+$62
!ram_metronome_counter = !WRAM_START+$64

!ram_suits_enemy_damage_check = !WRAM_START+$66
!ram_suits_periodic_damage_check = !WRAM_START+$68


!ram_tel_debug_area = !WRAM_START+$7C
!ram_tel_debug_station = !WRAM_START+$7E

; ^ FREE SPACE ^ up to +$7E

!ram_watch_left = !WRAM_START+$80
!ram_watch_left_hud = !WRAM_START+$82
!ram_watch_left_hi = !WRAM_START+$84
!ram_watch_left_lo = !WRAM_START+$86
!ram_watch_right = !WRAM_START+$88
!ram_watch_right_hud = !WRAM_START+$8A
!ram_watch_right_hi = !WRAM_START+$8C
!ram_watch_right_lo = !WRAM_START+$8E
!ram_watch_edit_left = !WRAM_START+$90
!ram_watch_edit_left_hi = !WRAM_START+$92
!ram_watch_edit_left_lo = !WRAM_START+$94
!ram_watch_edit_right = !WRAM_START+$96
!ram_watch_edit_right_hi = !WRAM_START+$98
!ram_watch_edit_right_lo = !WRAM_START+$9A
!ram_watch_edit_lock_left = !WRAM_START+$9C
!ram_watch_edit_lock_right = !WRAM_START+$9E

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

!ram_cm_stack_index = $5D5
!ram_cm_menu_stack = !WRAM_MENU_START+$00         ; 16 bytes
!ram_cm_cursor_stack = !WRAM_MENU_START+$10       ; 16 bytes
 
!ram_cm_cursor_max = !WRAM_MENU_START+$20
!ram_cm_input_timer = !WRAM_MENU_START+$24
!ram_cm_controller = !WRAM_MENU_START+$26
!ram_cm_menu_bank = !WRAM_MENU_START+$28
 
!ram_cm_etanks = !WRAM_MENU_START+$2A
!ram_cm_reserve = !WRAM_MENU_START+$2C
!ram_cm_leave = !WRAM_MENU_START+$2E
!ram_cm_input_counter = !WRAM_MENU_START+$30
!ram_cm_last_nmi_counter = !WRAM_MENU_START+$32
 
!ram_cm_ctrl_mode = !WRAM_MENU_START+$34
!ram_cm_ctrl_timer = !WRAM_MENU_START+$36
!ram_cm_ctrl_last_input = !WRAM_MENU_START+$38
 
; ^ FREE SPACE ^ up to +$CE
 
!ram_cgram_cache = !WRAM_MENU_START+$D0         ; 20 bytes

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
!ACTION_NUMFIELD_COLOR  = #$0012

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
!IH_HYPHEN = #$0CCF
!IH_BOMB = #$0058
!IH_LETTER_A = #$0CD8
!IH_LETTER_B = #$0CD9
!IH_LETTER_C = #$0C33
!IH_LETTER_D = #$0C45
!IH_LETTER_E = #$0C47
!IH_LETTER_F = #$0C48
!IH_LETTER_H = #$0CCA
!IH_LETTER_L = #$0C0B
!IH_LETTER_N = #$0CB8
!IH_LETTER_R = #$0C0C
!IH_LETTER_X = #$0CDA
!IH_LETTER_Y = #$0CDB
!IH_ELEVATOR = #$1C0B
!IH_SHINETIMER = #$0047

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

!SFX_LIB1 = $80903F
!SFX_LIB2 = $8090C1
!SFX_LIB3 = $809143


; -----
; SRAM
; -----

!sram_initialized = $702A00

!sram_ctrl_menu = $702A02
!sram_ctrl_kill_enemies = $702A04
!sram_ctrl_full_equipment = $702A06
!sram_ctrl_reset_segment_timer = $702A08
!sram_ctrl_reset_segment_later = $702A0A
!sram_ctrl_load_state = $702A0C
!sram_ctrl_save_state = $702A0E
!sram_ctrl_load_last_preset = $702A10
!sram_ctrl_random_preset = $702A12
!sram_ctrl_save_custom_preset = $702A14
!sram_ctrl_load_custom_preset = $702A16
!sram_ctrl_inc_custom_preset = $702A18
!sram_ctrl_dec_custom_preset = $702A1A

; FREE SPACE ^

!sram_artificial_lag = $702A20
!sram_rerandomize = $702A22
!sram_fanfare_toggle = $702A24
!sram_frame_counter_mode = $702A26
!sram_display_mode = $702A28
!sram_music_toggle = $702A2A
!sram_last_preset = $702A2C
!sram_save_has_set_rng = $702A2E
!sram_preset_category = $702A30
!sram_custom_preset_slot = $702A32
!sram_room_strat = $702A34
!sram_sprite_prio_flag = $702A36
!sram_metronome_tickrate = $702A38
!sram_metronome_sfx = $702A3A
!sram_status_icons = $F02A3C
!sram_suit_properties = $F02A3E

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
!SRAM_MUSIC_BANK = $F01FD0
!SRAM_MUSIC_TRACK = $F01FD2
!MUSIC_BANK = $07F3
!MUSIC_TRACK = $07F5
!MUSIC_ROUTINE = $808FC1
