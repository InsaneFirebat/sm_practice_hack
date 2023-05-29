
; ---------------
; Symbol Export
; ---------------

incsrc wram_symbols.asm


ram_gametime_room = !ram_gametime_room
ram_last_gametime_room = !ram_last_gametime_room
ram_realtime_room = !ram_realtime_room
ram_last_realtime_room = !ram_last_realtime_room
ram_last_room_lag = !ram_last_room_lag
ram_last_door_lag_frames = !ram_last_door_lag_frames
ram_transition_counter = !ram_transition_counter
ram_transition_flag = !ram_transition_flag
ram_last_realtime_door = !ram_last_realtime_door

ram_seg_rt_frames = !ram_seg_rt_frames
ram_seg_rt_seconds = !ram_seg_rt_seconds
ram_seg_rt_minutes = !ram_seg_rt_minutes
ram_reset_segment_later = !ram_reset_segment_later

ram_ih_controller = !ram_ih_controller
ram_slowdown_controller_1 = !ram_slowdown_controller_1
ram_slowdown_controller_2 = !ram_slowdown_controller_2
ram_slowdown_frames = !ram_slowdown_frames

ram_momentum_sum = !ram_momentum_sum
ram_momentum_count = !ram_momentum_count
ram_momentum_direction = !ram_momentum_direction
ram_momentum_last = !ram_momentum_last

ram_last_hp = !ram_last_hp
ram_reserves_last = !ram_reserves_last

ram_metronome_counter = !ram_metronome_counter
ram_armed_shine_duration = !ram_armed_shine_duration
ram_map_counter = !ram_map_counter
ram_vcounter_data = !ram_vcounter_data

ram_magic_pants_state = !ram_magic_pants_state
ram_magic_pants_pal1 = !ram_magic_pants_pal1
ram_magic_pants_pal2 = !ram_magic_pants_pal2
ram_magic_pants_pal3 = !ram_magic_pants_pal3

ram_suits_enemy_damage_check = !ram_suits_enemy_damage_check
ram_suits_periodic_damage_check = !ram_suits_periodic_damage_check

ram_room_has_set_rng = !ram_room_has_set_rng ; +$50

ram_spacetime_read_address = !ram_spacetime_read_address ; +$52
ram_spacetime_read_bank = !ram_spacetime_read_bank ; +$54
ram_spacetime_y = !ram_spacetime_y ; +$56

ram_watch_left_hud = !ram_watch_left_hud ; +$58
ram_watch_right_hud = !ram_watch_right_hud ; +$5A
ram_HUD_check = !ram_HUD_check ; +$5C
ram_roomstrat_counter = !ram_roomstrat_counter ; +$5E
ram_roomstrat_state = !ram_roomstrat_state ; +$60
ram_enemy_hp = !ram_enemy_hp ; +$62
ram_mb_hp = !ram_mb_hp ; +$64
ram_shot_timer = !ram_shot_timer ; +$66
ram_shine_counter = !ram_shine_counter ; +$68
ram_dash_counter = !ram_dash_counter ; +$6A
ram_shinetune_early_1 = !ram_shinetune_early_1 ; +$6C
ram_shinetune_late_1 = !ram_shinetune_late_1 ; +$6E
ram_shinetune_early_2 = !ram_shinetune_early_2 ; +$70
ram_shinetune_late_2 = !ram_shinetune_late_2 ; +$72
ram_shinetune_early_3 = !ram_shinetune_early_3 ; +$74
ram_shinetune_late_3 = !ram_shinetune_late_3 ; +$76
ram_shinetune_early_4 = !ram_shinetune_early_4 ; +$78
ram_shinetune_late_4 = !ram_shinetune_late_4 ; +$7A
ram_shine_dash_held_late = !ram_shine_dash_held_late ; +$7C
ram_xpos = !ram_xpos ; +$7E
ram_ypos = !ram_ypos ; +$80
ram_subpixel_pos = !ram_subpixel_pos ; +$82
ram_horizontal_speed = !ram_horizontal_speed ; +$84
ram_vertical_speed = !ram_vertical_speed ; +$86
ram_quickdrop_counter = !ram_quickdrop_counter ; +$88
ram_walljump_counter = !ram_walljump_counter ; +$8A
ram_fail_sum = !ram_fail_sum ; +$8C
ram_fail_count = !ram_fail_count ; +$8E

ram_load_preset = !ram_load_preset ; +$90
ram_custom_preset = !ram_custom_preset ; +$92

ram_game_loop_extras = !ram_game_loop_extras ; +$A0
ram_game_mode_extras = !ram_game_mode_extras ; +$A2
ram_metronome = !ram_metronome ; +$A4
ram_minimap = !ram_minimap ; +$A6
ram_magic_pants_enabled = !ram_magic_pants_enabled ; +$A8
ram_space_pants_enabled = !ram_space_pants_enabled ; +$AA
ram_random_preset_rng = !ram_random_preset_rng ; +$AC
ram_random_preset_value = !ram_random_preset_value ; +$AE
ram_fix_scroll_offsets = !ram_fix_scroll_offsets ; +$B0
ram_pacifist = !ram_pacifist ; +$B2
ram_freeze_on_load = !ram_freeze_on_load ; +$B4
ram_spacetime_infohud = !ram_spacetime_infohud ; +$B6

ram_kraid_claw_rng = !ram_kraid_claw_rng ; +$B8
ram_crocomire_rng = !ram_crocomire_rng ; +$BA
ram_phantoon_rng_round_1 = !ram_phantoon_rng_round_1 ; +$BC
ram_phantoon_rng_round_2 = !ram_phantoon_rng_round_2 ; +$BE
ram_phantoon_rng_inverted = !ram_phantoon_rng_inverted ; +$C0
ram_phantoon_rng_eyeclose = !ram_phantoon_rng_eyeclose ; +$C2
ram_phantoon_rng_flames = !ram_phantoon_rng_flames ; +$C4
ram_phantoon_rng_next_flames = !ram_phantoon_rng_next_flames ; +$C6
ram_botwoon_rng = !ram_botwoon_rng ; +$C8
ram_draygon_rng_left = !ram_draygon_rng_left ; +$CA
ram_draygon_rng_right = !ram_draygon_rng_right ; +$CC
ram_baby_rng = !ram_baby_rng ; +$CE
ram_kraid_wait_rng = !ram_kraid_wait_rng ; +$D0
ram_botwoon_first = !ram_botwoon_first ; +$D2
ram_botwoon_hidden = !ram_botwoon_hidden ; +$D4
ram_botwoon_second = !ram_botwoon_second ; +$D6
ram_botwoon_spit = !ram_botwoon_spit ; +$D8
ram_phantoon_flame_direction = !ram_phantoon_flame_direction ; +$DA

ram_sprite_feature_flags = !ram_sprite_feature_flags ; +$DC
ram_auto_save_state = !ram_auto_save_state ; +$DE

ram_watch_bank = !ram_watch_bank ; +$EA
ram_watch_write_mode = !ram_watch_write_mode ; +$EC
ram_watch_left = !ram_watch_left ; +$EE
ram_watch_right = !ram_watch_right ; +$F0
ram_watch_edit_left = !ram_watch_edit_left ; +$F2
ram_watch_edit_right = !ram_watch_edit_right ; +$F4
ram_watch_edit_lock_left = !ram_watch_edit_lock_left ; +$F6
ram_watch_edit_lock_right = !ram_watch_edit_lock_right ; +$F8
ram_watch_left_index = !ram_watch_left_index ; +$FA
ram_watch_right_index = !ram_watch_right_index ; +$FC

ram_slowdown_mode = $7EFFFE ; Bank $7E required!ram_slowdown_mode = !$7EFFFE ; Bank $7E required



ram_tilemap_buffer = $7E5800

ram_cm_stack_index = $05D5
ram_cm_menu_stack = !ram_cm_menu_stack ; +$WRAM_MENU_START+$00         ; 16 bytes
ram_cm_cursor_stack = !ram_cm_cursor_stack ; +$WRAM_MENU_START+$10       ; 16 bytes

ram_cm_cursor_max = !ram_cm_cursor_max ; +$WRAM_MENU_START+$20
ram_cm_input_timer = !ram_cm_input_timer ; +$WRAM_MENU_START+$22
ram_cm_controller = !ram_cm_controller ; +$WRAM_MENU_START+$24
ram_cm_menu_bank = !ram_cm_menu_bank ; +$WRAM_MENU_START+$26

ram_cm_etanks = !ram_cm_etanks ; +$WRAM_MENU_START+$2A
ram_cm_reserve = !ram_cm_reserve ; +$WRAM_MENU_START+$2C
ram_cm_leave = !ram_cm_leave ; +$WRAM_MENU_START+$2E
ram_cm_input_counter = !ram_cm_input_counter ; +$WRAM_MENU_START+$30
ram_cm_last_nmi_counter = !ram_cm_last_nmi_counter ; +$WRAM_MENU_START+$32

ram_cm_ctrl_mode = !ram_cm_ctrl_mode ; +$WRAM_MENU_START+$34
ram_cm_ctrl_timer = !ram_cm_ctrl_timer ; +$WRAM_MENU_START+$36
ram_cm_ctrl_last_input = !ram_cm_ctrl_last_input ; +$WRAM_MENU_START+$38
ram_cm_ctrl_assign = !ram_cm_ctrl_assign ; +$WRAM_MENU_START+$3A
ram_cm_ctrl_swap = !ram_cm_ctrl_swap ; +$WRAM_MENU_START+$3C

ram_cm_slowdown_mode = !ram_cm_slowdown_mode ; +$WRAM_MENU_START+$3E
ram_cm_slowdown_frames = !ram_cm_slowdown_frames ; +$WRAM_MENU_START+$40

ram_cm_botwoon_rng = !ram_cm_botwoon_rng ; +$WRAM_MENU_START+$42
ram_cm_botwoon_first = !ram_cm_botwoon_first ; +$WRAM_MENU_START+$44
ram_cm_botwoon_hidden = !ram_cm_botwoon_hidden ; +$WRAM_MENU_START+$46
ram_cm_botwoon_second = !ram_cm_botwoon_second ; +$WRAM_MENU_START+$48
ram_cm_botwoon_spit = !ram_cm_botwoon_spit ; +$WRAM_MENU_START+$4A
ram_cm_custom_preset_labels = !ram_cm_custom_preset_labels ; +$WRAM_MENU_START+$4C

ram_seed_X = !ram_seed_X ; +$WRAM_MENU_START+$4E
ram_seed_Y = !ram_seed_Y ; +$WRAM_MENU_START+$50

ram_cm_preserved_timers = !ram_cm_preserved_timers ; +$WRAM_MENU_START+$78 ; 8 bytes

ram_cm_watch_left_hi = !ram_cm_watch_left_hi ; +$WRAM_MENU_START+$80
ram_cm_watch_left_lo = !ram_cm_watch_left_lo ; +$WRAM_MENU_START+$82
ram_cm_watch_left_index_lo = !ram_cm_watch_left_index_lo ; +$WRAM_MENU_START+$84
ram_cm_watch_left_index_hi = !ram_cm_watch_left_index_hi ; +$WRAM_MENU_START+$86
ram_cm_watch_enemy_property = !ram_cm_watch_enemy_property ; +$WRAM_MENU_START+$88
ram_cm_watch_enemy_index = !ram_cm_watch_enemy_index ; +$WRAM_MENU_START+$8A
ram_cm_watch_right_hi = !ram_cm_watch_right_hi ; +$WRAM_MENU_START+$8C
ram_cm_watch_right_lo = !ram_cm_watch_right_lo ; +$WRAM_MENU_START+$8E
ram_cm_watch_right_index_lo = !ram_cm_watch_right_index_lo ; +$WRAM_MENU_START+$90
ram_cm_watch_right_index_hi = !ram_cm_watch_right_index_hi ; +$WRAM_MENU_START+$92
ram_cm_watch_edit_left_hi = !ram_cm_watch_edit_left_hi ; +$WRAM_MENU_START+$94
ram_cm_watch_edit_left_lo = !ram_cm_watch_edit_left_lo ; +$WRAM_MENU_START+$96
ram_cm_watch_edit_right_hi = !ram_cm_watch_edit_right_hi ; +$WRAM_MENU_START+$98
ram_cm_watch_edit_right_lo = !ram_cm_watch_edit_right_lo ; +$WRAM_MENU_START+$9A
ram_cm_watch_enemy_side = !ram_cm_watch_enemy_side ; +$WRAM_MENU_START+$9C
ram_cm_watch_bank = !ram_cm_watch_bank ; +$WRAM_MENU_START+$9E
ram_cm_watch_common_address = !ram_cm_watch_common_address ; +$WRAM_MENU_START+$A0

ram_cm_phan_first_phase = !ram_cm_phan_first_phase ; +$WRAM_MENU_START+$80
ram_cm_phan_second_phase = !ram_cm_phan_second_phase ; +$WRAM_MENU_START+$82

ram_cgram_cache = !ram_cgram_cache ; +$WRAM_MENU_START+$D0         ; 30 bytes

ram_crash_a = !ram_crash_a ; +$CRASHDUMP
ram_crash_x = !ram_crash_x ; +$CRASHDUMP+$02
ram_crash_y = !ram_crash_y ; +$CRASHDUMP+$04
ram_crash_dbp = !ram_crash_dbp ; +$CRASHDUMP+$06
ram_crash_sp = !ram_crash_sp ; +$CRASHDUMP+$08
ram_crash_type = !ram_crash_type ; +$CRASHDUMP+$0A
ram_crash_draw_value = !ram_crash_draw_value ; +$CRASHDUMP+$0C
ram_crash_stack_size = !ram_crash_stack_size ; +$CRASHDUMP+$0E

ram_crash_stack = !ram_crash_stack ; +$CRASHDUMP+$10

ram_crash_page = !ram_crash_page ; +$CRASHDUMP+$40
ram_crash_palette = !ram_crash_palette ; +$CRASHDUMP+$42
ram_crash_cursor = !ram_crash_cursor ; +$CRASHDUMP+$44
ram_crash_loop_counter = !ram_crash_loop_counter ; +$CRASHDUMP+$46
ram_crash_bytes_to_write = !ram_crash_bytes_to_write ; +$CRASHDUMP+$48
ram_crash_stack_line_position = !ram_crash_stack_line_position ; +$CRASHDUMP+$4A
ram_crash_text = !ram_crash_text ; +$CRASHDUMP+$4C
ram_crash_text_bank = !ram_crash_text_bank ; +$CRASHDUMP+$4E
ram_crash_text_palette = !ram_crash_text_palette ; +$CRASHDUMP+$50
ram_crash_mem_viewer = !ram_crash_mem_viewer ; +$CRASHDUMP+$52
ram_crash_mem_viewer_bank = !ram_crash_mem_viewer_bank ; +$CRASHDUMP+$54
ram_crash_temp = !ram_crash_temp ; +$CRASHDUMP+$56

ram_crash_input = !ram_crash_input ; +$CRASHDUMP+$60
ram_crash_input_new = !ram_crash_input_new ; +$CRASHDUMP+$62
ram_crash_input_prev = !ram_crash_input_prev ; +$CRASHDUMP+$64
ram_crash_input_timer = !ram_crash_input_timer ; +$CRASHDUMP+$66

HUD_TILEMAP = $7EC600




sram_initialized = !sram_initialized ; +$SRAM_START+$00

sram_ctrl_menu = !sram_ctrl_menu ; +$SRAM_START+$02
sram_ctrl_kill_enemies = !sram_ctrl_kill_enemies ; +$SRAM_START+$04
sram_ctrl_full_equipment = !sram_ctrl_full_equipment ; +$SRAM_START+$06
sram_ctrl_reset_segment_timer = !sram_ctrl_reset_segment_timer ; +$SRAM_START+$08
sram_ctrl_reset_segment_later = !sram_ctrl_reset_segment_later ; +$SRAM_START+$0A
sram_ctrl_load_state = !sram_ctrl_load_state ; +$SRAM_START+$0C
sram_ctrl_save_state = !sram_ctrl_save_state ; +$SRAM_START+$0E
sram_ctrl_load_last_preset = !sram_ctrl_load_last_preset ; +$SRAM_START+$10
sram_ctrl_random_preset = !sram_ctrl_random_preset ; +$SRAM_START+$12
sram_ctrl_save_custom_preset = !sram_ctrl_save_custom_preset ; +$SRAM_START+$14
sram_ctrl_load_custom_preset = !sram_ctrl_load_custom_preset ; +$SRAM_START+$16
sram_ctrl_inc_custom_preset = !sram_ctrl_inc_custom_preset ; +$SRAM_START+$18
sram_ctrl_dec_custom_preset = !sram_ctrl_dec_custom_preset ; +$SRAM_START+$1A
sram_ctrl_toggle_tileviewer = !sram_ctrl_toggle_tileviewer ; +$SRAM_START+$1C
sram_ctrl_update_timers = !sram_ctrl_update_timers ; +$SRAM_START+$1E

sram_artificial_lag = !sram_artificial_lag ; +$SRAM_START+$20
sram_rerandomize = !sram_rerandomize ; +$SRAM_START+$22
sram_fanfare_toggle = !sram_fanfare_toggle ; +$SRAM_START+$24
sram_frame_counter_mode = !sram_frame_counter_mode ; +$SRAM_START+$26
sram_display_mode = !sram_display_mode ; +$SRAM_START+$28
sram_music_toggle = !sram_music_toggle ; +$SRAM_START+$2A
sram_last_preset = !sram_last_preset ; +$SRAM_START+$2C
sram_save_has_set_rng = !sram_save_has_set_rng ; +$SRAM_START+$2E
sram_preset_category = !sram_preset_category ; +$SRAM_START+$30
sram_custom_preset_slot = !sram_custom_preset_slot ; +$SRAM_START+$32
sram_room_strat = !sram_room_strat ; +$SRAM_START+$34
sram_sprite_prio_flag = !sram_sprite_prio_flag ; +$SRAM_START+$36
sram_metronome_tickrate = !sram_metronome_tickrate ; +$SRAM_START+$38
sram_metronome_sfx = !sram_metronome_sfx ; +$SRAM_START+$3A
sram_status_icons = !sram_status_icons ; +$SRAM_START+$3C
sram_suit_properties = !sram_suit_properties ; +$SRAM_START+$3E
sram_top_display_mode = !sram_top_display_mode ; +$SRAM_START+$40
sram_healthalarm = !sram_healthalarm ; +$SRAM_START+$42
sram_room_layout = !sram_room_layout ; +$SRAM_START+$44
sram_cutscenes = !sram_cutscenes ; +$SRAM_START+$46
sram_compressed_graphics = !sram_compressed_graphics ; +$SRAM_START+$48
sram_lag_counter_mode = !sram_lag_counter_mode ; +$SRAM_START+$4A

sram_fast_doors = !sram_fast_doors ; +$SRAM_START+$4C
sram_suppress_flashing = !sram_suppress_flashing ; +$SRAM_START+$4E
sram_fast_elevators = !sram_fast_elevators ; +$SRAM_START+$50
sram_custom_damage = !sram_custom_damage ; +$SRAM_START+$52
sram_custom_charge_damage = !sram_custom_charge_damage ; +$SRAM_START+$54
sram_custom_uncharge_damage = !sram_custom_uncharge_damage ; +$SRAM_START+$56
sram_water_physics = !sram_water_physics ; +$SRAM_START+$58
sram_double_jump = !sram_double_jump ; +$SRAM_START+$5A

sram_palette_border = !sram_palette_border ; +$SRAM_START+$5C
sram_palette_headeroutline = !sram_palette_headeroutline ; +$SRAM_START+$5E
sram_palette_text = !sram_palette_text ; +$SRAM_START+$60
sram_palette_numoutline = !sram_palette_numoutline ; +$SRAM_START+$62
sram_palette_numfill = !sram_palette_numfill ; +$SRAM_START+$64
sram_palette_toggleon = !sram_palette_toggleon ; +$SRAM_START+$66
sram_palette_seltext = !sram_palette_seltext ; +$SRAM_START+$68
sram_palette_seltextbg = !sram_palette_seltextbg ; +$SRAM_START+$6A
sram_palette_background = !sram_palette_background ; +$SRAM_START+$6C
sram_palette_numseloutline = !sram_palette_numseloutline ; +$SRAM_START+$6E
sram_palette_numsel = !sram_palette_numsel ; +$SRAM_START+$70
sram_custompalette_profile = !sram_custompalette_profile ; +$SRAM_START+$72
sram_menu_background = !sram_menu_background ; +$SRAM_START+$74
sram_cm_scroll_delay = !sram_cm_scroll_delay ; +$SRAM_START+$76
sram_customsfx_move = !sram_customsfx_move ; +$SRAM_START+$78
sram_customsfx_toggle = !sram_customsfx_toggle ; +$SRAM_START+$7A
sram_customsfx_number = !sram_customsfx_number ; +$SRAM_START+$7C
sram_customsfx_confirm = !sram_customsfx_confirm ; +$SRAM_START+$7E
sram_customsfx_goback = !sram_customsfx_goback ; +$SRAM_START+$80

sram_seed_X = !sram_seed_X ; +$SRAM_START+$82
sram_seed_Y = !sram_seed_Y ; +$SRAM_START+$84




ram_countdamage = $0B0C
ram_ammo_missiles = $05C9
ram_ammo_supers = $05CB
ram_ammo_powerbombs = $05CD

ram_HUD_top = !ram_HUD_top ; +$CUSTOM_WRAM+$00
ram_HUD_middle = !ram_HUD_middle ; +$CUSTOM_WRAM+$02
ram_HUD_bottom = !ram_HUD_bottom ; +$CUSTOM_WRAM+$04
ram_HUD_top_counter = !ram_HUD_top_counter ; +$CUSTOM_WRAM+$06
ram_HUD_middle_counter = !ram_HUD_middle_counter ; +$CUSTOM_WRAM+$08

ram_infinite_ammo = !ram_infinite_ammo ; +$CUSTOM_WRAM+$10
ram_infiniteammo_check = !ram_infiniteammo_check ; +$CUSTOM_WRAM+$12

ram_display_backup = !ram_display_backup ; +$CUSTOM_WRAM+$16
ram_dboost_state = !ram_dboost_state ; +$CUSTOM_WRAM+$18
ram_dboost_kbmax = !ram_dboost_kbmax ; +$CUSTOM_WRAM+$1A
ram_dboost_kb = !ram_dboost_kb ; +$CUSTOM_WRAM+$1C
ram_dboost_counter = !ram_dboost_counter ; +$CUSTOM_WRAM+$1E
ram_spark_icon = !ram_spark_icon ; +$CUSTOM_WRAM+$20
ram_lag_counter = !ram_lag_counter ; +$CUSTOM_WRAM+$22
ram_lag_counter_HUD = !ram_lag_counter_HUD ; +$CUSTOM_WRAM+$24
ram_activated_shine_duration = !ram_activated_shine_duration ; +$CUSTOM_WRAM+$26

ram_enemy0_last_xpos = !ram_enemy0_last_xpos ; +$CUSTOM_WRAM+$40
ram_enemy0_last_ypos = !ram_enemy0_last_ypos ; +$CUSTOM_WRAM+$42
;!ram_enemy1_last_xpos,#ERROR!,;!ram_enemy1_last_xpos ; +$CUSTOM_WRAM+$44
;!ram_enemy1_last_ypos,#ERROR!,;!ram_enemy1_last_ypos ; +$CUSTOM_WRAM+$46
ram_enemy2_last_xpos = !ram_enemy2_last_xpos ; +$CUSTOM_WRAM+$48
ram_enemy2_last_ypos = !ram_enemy2_last_ypos ; +$CUSTOM_WRAM+$4A
;!ram_enemy3_last_xpos,#ERROR!,;!ram_enemy3_last_xpos ; +$CUSTOM_WRAM+$4C
;!ram_enemy3_last_ypos,#ERROR!,;!ram_enemy3_last_ypos ; +$CUSTOM_WRAM+$4E
ram_enemy4_last_xpos = !ram_enemy4_last_xpos ; +$CUSTOM_WRAM+$50
ram_enemy4_last_ypos = !ram_enemy4_last_ypos ; +$CUSTOM_WRAM+$52
;!ram_enemy5_last_xpos,#ERROR!,;!ram_enemy5_last_xpos ; +$CUSTOM_WRAM+$54
;!ram_enemy5_last_ypos,#ERROR!,;!ram_enemy5_last_ypos ; +$CUSTOM_WRAM+$56
ram_enemy6_last_xpos = !ram_enemy6_last_xpos ; +$CUSTOM_WRAM+$58
ram_enemy6_last_ypos = !ram_enemy6_last_ypos ; +$CUSTOM_WRAM+$5A
ram_enemy7_last_xpos = !ram_enemy7_last_xpos ; +$CUSTOM_WRAM+$5C
ram_enemy7_last_ypos = !ram_enemy7_last_ypos ; +$CUSTOM_WRAM+$5E
ram_enemy8_last_xpos = !ram_enemy8_last_xpos ; +$CUSTOM_WRAM+$60
ram_enemy8_last_ypos = !ram_enemy8_last_ypos ; +$CUSTOM_WRAM+$62
ram_radar1 = !ram_radar1 ; +$CUSTOM_WRAM+$64
ram_radar2 = !ram_radar2 ; +$CUSTOM_WRAM+$66

ram_palette_border = !ram_palette_border ; +$CUSTOM_WRAM+$80
ram_palette_headeroutline = !ram_palette_headeroutline ; +$CUSTOM_WRAM+$82
ram_palette_text = !ram_palette_text ; +$CUSTOM_WRAM+$84
ram_palette_background = !ram_palette_background ; +$CUSTOM_WRAM+$86
ram_palette_numoutline = !ram_palette_numoutline ; +$CUSTOM_WRAM+$88
ram_palette_numfill = !ram_palette_numfill ; +$CUSTOM_WRAM+$8A
ram_palette_toggleon = !ram_palette_toggleon ; +$CUSTOM_WRAM+$8C
ram_palette_seltext = !ram_palette_seltext ; +$CUSTOM_WRAM+$8E
ram_palette_seltextbg = !ram_palette_seltextbg ; +$CUSTOM_WRAM+$90
ram_palette_numseloutline = !ram_palette_numseloutline ; +$CUSTOM_WRAM+$92
ram_palette_numsel = !ram_palette_numsel ; +$CUSTOM_WRAM+$94

ram_soundtest_lib1 = !ram_soundtest_lib1 ; +$CUSTOM_WRAM+$98
ram_soundtest_lib2 = !ram_soundtest_lib2 ; +$CUSTOM_WRAM+$9A
ram_soundtest_lib3 = !ram_soundtest_lib3 ; +$CUSTOM_WRAM+$9C
ram_soundtest_music = !ram_soundtest_music ; +$CUSTOM_WRAM+$9E

ram_cm_brb = !ram_cm_brb ; +$CUSTOM_WRAM+$A0
ram_cm_brb_timer = !ram_cm_brb_timer ; +$CUSTOM_WRAM+$A2
ram_cm_brb_frames = !ram_cm_brb_frames ; +$CUSTOM_WRAM+$A4
ram_cm_brb_secs = !ram_cm_brb_secs ; +$CUSTOM_WRAM+$A6
ram_cm_brb_mins = !ram_cm_brb_mins ; +$CUSTOM_WRAM+$A8
ram_cm_brb_screen = !ram_cm_brb_screen ; +$CUSTOM_WRAM+$AA
ram_cm_brb_palette = !ram_cm_brb_palette ; +$CUSTOM_WRAM+$AC
ram_cm_brb_timer_mode = !ram_cm_brb_timer_mode ; +$CUSTOM_WRAM+$AE
ram_cm_brb_set_cycle = !ram_cm_brb_set_cycle ; +$CUSTOM_WRAM+$B0
ram_cm_brb_cycle_time = !ram_cm_brb_cycle_time ; +$CUSTOM_WRAM+$B2

ram_crop_mode = !ram_crop_mode ; +$CUSTOM_WRAM+$C0
ram_crop_tile = !ram_crop_tile ; +$CUSTOM_WRAM+$C2

ram_cm_scroll = !ram_cm_scroll ; +$CUSTOM_WRAM+$D0
ram_cm_scroll_X = !ram_cm_scroll_X ; +$CUSTOM_WRAM+$D2
ram_cm_scroll_Y = !ram_cm_scroll_Y ; +$CUSTOM_WRAM+$D4
ram_cm_scroll_H = !ram_cm_scroll_H ; +$CUSTOM_WRAM+$D6
ram_cm_scroll_V = !ram_cm_scroll_V ; +$CUSTOM_WRAM+$D8
ram_cm_scroll_timer = !ram_cm_scroll_timer ; +$CUSTOM_WRAM+$DA

ram_cm_varia = !ram_cm_varia ; +$CUSTOM_WRAM+$E0
ram_cm_gravity = !ram_cm_gravity ; +$CUSTOM_WRAM+$E2
ram_cm_morph = !ram_cm_morph ; +$CUSTOM_WRAM+$E4
ram_cm_bombs = !ram_cm_bombs ; +$CUSTOM_WRAM+$E6
ram_cm_spring = !ram_cm_spring ; +$CUSTOM_WRAM+$E8
ram_cm_screw = !ram_cm_screw ; +$CUSTOM_WRAM+$EA
ram_cm_hijump = !ram_cm_hijump ; +$CUSTOM_WRAM+$EC
ram_cm_space = !ram_cm_space ; +$CUSTOM_WRAM+$EE
ram_cm_speed = !ram_cm_speed ; +$CUSTOM_WRAM+$F0
ram_cm_charge = !ram_cm_charge ; +$CUSTOM_WRAM+$F2
ram_cm_ice = !ram_cm_ice ; +$CUSTOM_WRAM+$F4
ram_cm_wave = !ram_cm_wave ; +$CUSTOM_WRAM+$F6
ram_cm_spazer = !ram_cm_spazer ; +$CUSTOM_WRAM+$F8
ram_cm_plasma = !ram_cm_plasma ; +$CUSTOM_WRAM+$FA





sram_ctrl_reveal_damage = !sram_ctrl_reveal_damage ; +$SRAM_START+$200
sram_ctrl_randomize_rng = !sram_ctrl_randomize_rng ; +$SRAM_START+$202
sram_ctrl_force_stand = !sram_ctrl_force_stand ; +$SRAM_START+$204
sram_ctrl_auto_save_state = !sram_ctrl_auto_save_state ; +$SRAM_START+$206

sram_scroll_button = !sram_scroll_button ; +$SRAM_START+$212
sram_cm_scroll_button = !sram_cm_scroll_button ; +$SRAM_START+$214

sram_cm_font = !sram_cm_font ; +$SRAM_START+$218
sram_number_gfx_choice = !sram_number_gfx_choice ; +$SRAM_START+$21A

sram_phantoon_intro = !sram_phantoon_intro ; +$SRAM_START+$220
sram_kraid_intro = !sram_kraid_intro ; +$SRAM_START+$222
ram_magnetstairs = !ram_magnetstairs ; +$SRAM_START+$224
sram_preset_open_doors = !sram_preset_open_doors ; +$SRAM_START+$226
sram_preset_ship_landing = !sram_preset_ship_landing ; +$SRAM_START+$228
sram_preset_enemies = !sram_preset_enemies ; +$SRAM_START+$22A
sram_fast_nintendo_logo = !sram_fast_nintendo_logo ; +$SRAM_START+$22C
sram_fanfare_timer_adjust = !sram_fanfare_timer_adjust ; +$SRAM_START+$22E
sram_preset_map_tiles = !sram_preset_map_tiles ; +$SRAM_START+$230
sram_preset_auto_segment = !sram_preset_auto_segment ; +$SRAM_START+$232

sram_countdamage = !sram_countdamage ; +$SRAM_START+$240
sram_superhud = !sram_superhud ; +$SRAM_START+$242
sram_superhud_bottom = !sram_superhud_bottom ; +$SRAM_START+$244
sram_superhud_middle = !sram_superhud_middle ; +$SRAM_START+$246
sram_superhud_top = !sram_superhud_top ; +$SRAM_START+$248
sram_door_display_mode = !sram_door_display_mode ; +$SRAM_START+$24A
sram_display_mode_reward = !sram_display_mode_reward ; +$SRAM_START+$24C

sram_presetrando = !sram_presetrando ; +$SRAM_START+$290
sram_presetrando_morph = !sram_presetrando_morph ; +$SRAM_START+$292
sram_presetrando_charge = !sram_presetrando_charge ; +$SRAM_START+$294
sram_presetrando_max_etanks = !sram_presetrando_max_etanks ; +$SRAM_START+$296
sram_presetrando_max_reserves = !sram_presetrando_max_reserves ; +$SRAM_START+$298
sram_presetrando_max_missiles = !sram_presetrando_max_missiles ; +$SRAM_START+$29A
sram_presetrando_max_supers = !sram_presetrando_max_supers ; +$SRAM_START+$29C
sram_presetrando_max_pbs = !sram_presetrando_max_pbs ; +$SRAM_START+$29E
sram_presetrando_beampref = !sram_presetrando_beampref ; +$SRAM_START+$2A0

sram_custompalette_blue = !sram_custompalette_blue ; +$SRAM_START+$2A2
sram_custompalette_green = !sram_custompalette_green ; +$SRAM_START+$2A4
sram_custompalette_red = !sram_custompalette_red ; +$SRAM_START+$2A6
sram_custompalette_hi = !sram_custompalette_hi ; +$SRAM_START+$2A8
sram_custompalette_lo = !sram_custompalette_lo ; +$SRAM_START+$2AA

sram_dummy_on = !sram_dummy_on ; +$SRAM_START+$2FA
sram_dummy_off = !sram_dummy_off ; +$SRAM_START+$2FC
sram_dummy_num = !sram_dummy_num ; +$SRAM_START+$2FE



