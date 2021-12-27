PresetsMenuSzm101:
    dw #presets_goto_SZM101_bombs
    dw #presets_goto_SZM101_varia
    dw #presets_goto_SZM101_power_bombs
    dw #presets_goto_SZM101_upper_norfair
    dw #presets_goto_SZM101_lower_norfair
    dw #presets_goto_SZM101_cleanup_1
    dw #presets_goto_SZM101_chozodia
    dw #presets_goto_SZM101_tourian
    dw #presets_goto_SZM101_cleanup_2
    dw #presets_goto_SZM101_pirate_ship_ridley
    dw #presets_goto_SZM101_pirate_ship_draygon
    dw #$0000
    %cm_header("101% ITEM COLLECTION")
    %cm_footer("PRESETS BY OSSE")

presets_goto_SZM101_bombs:
    %cm_submenu("Bombs", #presets_submenu_SZM101_bombs)

presets_goto_SZM101_varia:
    %cm_submenu("Varia", #presets_submenu_SZM101_varia)

presets_goto_SZM101_power_bombs:
    %cm_submenu("Power Bombs", #presets_submenu_SZM101_power_bombs)

presets_goto_SZM101_upper_norfair:
    %cm_submenu("Upper Norfair", #presets_submenu_SZM101_upper_norfair)

presets_goto_SZM101_lower_norfair:
    %cm_submenu("Lower Norfair", #presets_submenu_SZM101_lower_norfair)

presets_goto_SZM101_cleanup_1:
    %cm_submenu("Cleanup 1", #presets_submenu_SZM101_cleanup_1)

presets_goto_SZM101_chozodia:
    %cm_submenu("Chozodia", #presets_submenu_SZM101_chozodia)

presets_goto_SZM101_tourian:
    %cm_submenu("Tourian", #presets_submenu_SZM101_tourian)

presets_goto_SZM101_cleanup_2:
    %cm_submenu("Cleanup 2", #presets_submenu_SZM101_cleanup_2)

presets_goto_SZM101_pirate_ship_ridley:
    %cm_submenu("Pirate Ship Ridley", #presets_submenu_SZM101_pirate_ship_ridley)

presets_goto_SZM101_pirate_ship_draygon:
    %cm_submenu("Pirate Ship Draygon", #presets_submenu_SZM101_pirate_ship_draygon)

presets_submenu_SZM101_bombs:
    dw #presets_SZM101_bombs_landing_site
    dw #presets_SZM101_bombs_shaft_top
    dw #presets_SZM101_bombs_ceiling_etank
    dw #presets_SZM101_bombs_robo_clip
    dw #presets_SZM101_bombs_white_wall_kago_room
    dw #presets_SZM101_bombs_white_wall_2
    dw #presets_SZM101_bombs_white_wall_missiles
    dw #presets_SZM101_bombs_missile_gate_room
    dw #presets_SZM101_bombs_kihunter_climb
    dw #presets_SZM101_bombs_harder_robo_clip
    dw #presets_SZM101_bombs_crumble_run
    dw #presets_SZM101_bombs_pirate_jump
    dw #presets_SZM101_bombs_bomb_torizo
    dw #$0000
    %cm_header("BOMBS")

presets_submenu_SZM101_varia:
    dw #presets_SZM101_varia_bt_exit
    dw #presets_SZM101_varia_crumble_run_return
    dw #presets_SZM101_varia_ripper_bomb_jump
    dw #presets_SZM101_varia_pancake_fall
    dw #presets_SZM101_varia_pre_grapple
    dw #presets_SZM101_varia_post_grapple
    dw #presets_SZM101_varia_super_room_entry
    dw #presets_SZM101_varia_super_ceiling_bomb_jump
    dw #presets_SZM101_varia_reserve_kihunters
    dw #presets_SZM101_varia_shaft_top_2
    dw #presets_SZM101_varia_robot_clip_again
    dw #presets_SZM101_varia_acid_dive
    dw #presets_SZM101_varia_secret_ceiling
    dw #$0000
    %cm_header("VARIA")

presets_submenu_SZM101_power_bombs:
    dw #presets_SZM101_power_bombs_varia_exit
    dw #presets_SZM101_power_bombs_etank_short_mock
    dw #presets_SZM101_power_bombs_chozo_etank
    dw #presets_SZM101_power_bombs_un_elevator
    dw #presets_SZM101_power_bombs_shot_block_wall
    dw #presets_SZM101_power_bombs_lava_dive_farm
    dw #presets_SZM101_power_bombs_lava_dive_etank
    dw #presets_SZM101_power_bombs_big_hopper_empty_shaft
    dw #presets_SZM101_power_bombs_speed_room
    dw #presets_SZM101_power_bombs_big_hopper_ramps
    dw #presets_SZM101_power_bombs_maglodite_lava_dive
    dw #presets_SZM101_power_bombs_springball_room_
    dw #presets_SZM101_power_bombs_spikesuit
    dw #presets_SZM101_power_bombs_morph_gauntlet
    dw #$0000
    %cm_header("POWER BOMBS")

presets_submenu_SZM101_upper_norfair:
    dw #presets_SZM101_upper_norfair_leaving_power_bomb_room
    dw #presets_SZM101_upper_norfair_pre_ice
    dw #presets_SZM101_upper_norfair_leaving_ice
    dw #presets_SZM101_upper_norfair_baby_croc_supers
    dw #presets_SZM101_upper_norfair_pre_hi_jump
    dw #presets_SZM101_upper_norfair_leaving_hi_jump
    dw #presets_SZM101_upper_norfair_springball
    dw #presets_SZM101_upper_norfair_big_dessgeegas
    dw #presets_SZM101_upper_norfair_wave_block_pit
    dw #presets_SZM101_upper_norfair_exiting_wave
    dw #presets_SZM101_upper_norfair_missiles_below_wave
    dw #presets_SZM101_upper_norfair_wave_wave_gate
    dw #presets_SZM101_upper_norfair_super_blockade
    dw #presets_SZM101_upper_norfair_acid_party
    dw #presets_SZM101_upper_norfair_save_room_secret
    dw #presets_SZM101_upper_norfair_reserve_tank_spark
    dw #$0000
    %cm_header("UPPER NORFAIR")

presets_submenu_SZM101_lower_norfair:
    dw #presets_SZM101_lower_norfair_elevator_entry
    dw #presets_SZM101_lower_norfair_save_room_short_charge
    dw #presets_SZM101_lower_norfair_reverse_long_spark
    dw #presets_SZM101_lower_norfair_tight_short_charge
    dw #presets_SZM101_lower_norfair_crumble_bridge_supers
    dw #presets_SZM101_lower_norfair_firefleas
    dw #presets_SZM101_lower_norfair_spikey_mistep
    dw #presets_SZM101_lower_norfair_fallen_hero_super
    dw #presets_SZM101_lower_norfair_morph_maze_pipes
    dw #presets_SZM101_lower_norfair_build_your_speedway
    dw #presets_SZM101_lower_norfair_monster_elevator
    dw #presets_SZM101_lower_norfair_goldbat_spark
    dw #presets_SZM101_lower_norfair_awful_chain_spark
    dw #presets_SZM101_lower_norfair_chain_spark_puzzle
    dw #presets_SZM101_lower_norfair_leaving_spark_puzzle
    dw #presets_SZM101_lower_norfair_screw_attack
    dw #presets_SZM101_lower_norfair_chain_spark_out_of_ln
    dw #$0000
    %cm_header("LOWER NORFAIR")

presets_submenu_SZM101_cleanup_1:
    dw #presets_SZM101_cleanup_1_caterpiller_short_charge
    dw #presets_SZM101_cleanup_1_solid_cacatacs
    dw #presets_SZM101_cleanup_1_spikesuit_hallway
    dw #presets_SZM101_cleanup_1_chasm_supers
    dw #presets_SZM101_cleanup_1_speed_keep_descent
    dw #presets_SZM101_cleanup_1_hole_in_the_wall_missiles
    dw #presets_SZM101_cleanup_1_eticoon_entry
    dw #presets_SZM101_cleanup_1_super_door_over_crumples
    dw #presets_SZM101_cleanup_1_crumble_pillers
    dw #presets_SZM101_cleanup_1_post_sporespawn_room
    dw #presets_SZM101_cleanup_1_spazer
    dw #presets_SZM101_cleanup_1_spazer_exit
    dw #presets_SZM101_cleanup_1_leaving_tourian
    dw #presets_SZM101_cleanup_1_bomb_hole_missiles
    dw #presets_SZM101_cleanup_1_mini_kraid_big_lag
    dw #presets_SZM101_cleanup_1_pink_room_exit_spark
    dw #$0000
    %cm_header("CLEANUP 1")

presets_submenu_SZM101_chozodia:
    dw #presets_SZM101_chozodia_elevator_top
    dw #presets_SZM101_chozodia_robot_clip_with_speed
    dw #presets_SZM101_chozodia_charge_entry
    dw #presets_SZM101_chozodia_charge_entry_exit
    dw #presets_SZM101_chozodia_shoot_the_floor
    dw #presets_SZM101_chozodia_map_room
    dw #presets_SZM101_chozodia_white_room_etank
    dw #presets_SZM101_chozodia_ship_entry_chain_spark
    dw #presets_SZM101_chozodia_waterway_speedkeep
    dw #presets_SZM101_chozodia_chozodia_speedkeep
    dw #presets_SZM101_chozodia_bang
    dw #presets_SZM101_chozodia_botwoon
    dw #presets_SZM101_chozodia_gravity
    dw #presets_SZM101_chozodia_pb_speedball
    dw #presets_SZM101_chozodia_tricky_chain_spark
    dw #presets_SZM101_chozodia_gold_torizo
    dw #presets_SZM101_chozodia_reflector_puzzle
    dw #presets_SZM101_chozodia_lost_maze_down
    dw #presets_SZM101_chozodia_big_space_boost
    dw #$0000
    %cm_header("CHOZODIA")

presets_submenu_SZM101_tourian:
    dw #presets_SZM101_tourian_kihunter_elevator
    dw #presets_SZM101_tourian_pancake_missiles
    dw #presets_SZM101_tourian_landing_site_spark
    dw #presets_SZM101_tourian_morph_room
    dw #presets_SZM101_tourian_ninja_pirate_fall
    dw #presets_SZM101_tourian_xray
    dw #presets_SZM101_tourian_xray_standup_clip
    dw #presets_SZM101_tourian_blind_speedkeep
    dw #presets_SZM101_tourian_metroids
    dw #presets_SZM101_tourian_mother_brain
    dw #presets_SZM101_tourian_elevator_breakdown
    dw #presets_SZM101_tourian_back_of_gauntlet_missiles
    dw #presets_SZM101_tourian_parlor
    dw #presets_SZM101_tourian_parlor_fall
    dw #presets_SZM101_tourian_phantoon
    dw #presets_SZM101_tourian_ninja_pirates
    dw #presets_SZM101_tourian_vault_missile
    dw #presets_SZM101_tourian_ninja_pirate_room
    dw #presets_SZM101_tourian_under_mb_speedkeep
    dw #presets_SZM101_tourian_metroids_forward
    dw #presets_SZM101_tourian_metroids_backward
    dw #presets_SZM101_tourian_tourian_escape
    dw #$0000
    %cm_header("TOURIAN")

presets_submenu_SZM101_cleanup_2:
    dw #presets_SZM101_cleanup_2_brinstar_secret_item
    dw #presets_SZM101_cleanup_2_mini_kraid_long_room
    dw #presets_SZM101_cleanup_2_mini_kraid_boss_fight
    dw #presets_SZM101_cleanup_2_kraid
    dw #presets_SZM101_cleanup_2_pink_hopper_spark
    dw #presets_SZM101_cleanup_2_reserve_room
    dw #presets_SZM101_cleanup_2_below_reserve_room
    dw #presets_SZM101_cleanup_2_sporespawn_ice_bridge
    dw #presets_SZM101_cleanup_2_sporespawn_exit
    dw #presets_SZM101_cleanup_2_kraid_mouth_missile
    dw #presets_SZM101_cleanup_2_etank_chain_spark
    dw #presets_SZM101_cleanup_2_slick_space_boost
    dw #presets_SZM101_cleanup_2_rock_pipes
    dw #presets_SZM101_cleanup_2_maze_skip
    dw #presets_SZM101_cleanup_2_crocs_hideaway
    dw #presets_SZM101_cleanup_2_crocomire
    dw #presets_SZM101_cleanup_2_broken_grapple_blocks
    dw #presets_SZM101_cleanup_2_lava_dive_pbs
    dw #presets_SZM101_cleanup_2_super_gate_shot
    dw #presets_SZM101_cleanup_2_breakable_chozo
    dw #$0000
    %cm_header("CLEANUP 2")

presets_submenu_SZM101_pirate_ship_ridley:
    dw #presets_SZM101_pirate_ship_ridley_shortest_charge
    dw #presets_SZM101_pirate_ship_ridley_inside_outside_spark
    dw #presets_SZM101_pirate_ship_ridley_plasma_sba
    dw #presets_SZM101_pirate_ship_ridley_super_speed_space_jump
    dw #presets_SZM101_pirate_ship_ridley_kihunter_zoo
    dw #presets_SZM101_pirate_ship_ridley_under_the_ship
    dw #presets_SZM101_pirate_ship_ridley_tease_pbs
    dw #presets_SZM101_pirate_ship_ridley_flappy_birds
    dw #presets_SZM101_pirate_ship_ridley_flappy_exit
    dw #presets_SZM101_pirate_ship_ridley_tube_break
    dw #presets_SZM101_pirate_ship_ridley_kihopper_ramp_down
    dw #presets_SZM101_pirate_ship_ridley_worker_robot_roadblock
    dw #presets_SZM101_pirate_ship_ridley_under_the_ship_2
    dw #presets_SZM101_pirate_ship_ridley_the_lazer_part
    dw #presets_SZM101_pirate_ship_ridley_lazer_save_room
    dw #presets_SZM101_pirate_ship_ridley_spaceboost_etank
    dw #presets_SZM101_pirate_ship_ridley_two_gate
    dw #presets_SZM101_pirate_ship_ridley_ridley
    dw #$0000
    %cm_header("PIRATE SHIP RIDLEY")

presets_submenu_SZM101_pirate_ship_draygon:
    dw #presets_SZM101_pirate_ship_draygon_leaving_ridley
    dw #presets_SZM101_pirate_ship_draygon_gunship_room
    dw #presets_SZM101_pirate_ship_draygon_underground_path
    dw #presets_SZM101_pirate_ship_draygon_green_lazers
    dw #presets_SZM101_pirate_ship_draygon_jetpack_pirates
    dw #presets_SZM101_pirate_ship_draygon_one_try_lazer_skip
    dw #presets_SZM101_pirate_ship_draygon_draygon
    dw #presets_SZM101_pirate_ship_draygon_boss_missile
    dw #presets_SZM101_pirate_ship_draygon_four_key_shutters
    dw #presets_SZM101_pirate_ship_draygon_ninja_pirates_2
    dw #presets_SZM101_pirate_ship_draygon_in_the_way_blocks
    dw #presets_SZM101_pirate_ship_draygon_animal_room
    dw #presets_SZM101_pirate_ship_draygon_crash_room
    dw #presets_SZM101_pirate_ship_draygon_dachora_room
    dw #presets_SZM101_pirate_ship_draygon_white_pirates
    dw #$0000
    %cm_header("PIRATE SHIP DRAYGON")

; Bombs
presets_SZM101_bombs_landing_site:
    %cm_preset("Landing Site", #preset_SZM101_bombs_landing_site)

presets_SZM101_bombs_shaft_top:
    %cm_preset("Shaft Top", #preset_SZM101_bombs_shaft_top)

presets_SZM101_bombs_ceiling_etank:
    %cm_preset("Ceiling Etank", #preset_SZM101_bombs_ceiling_etank)

presets_SZM101_bombs_robo_clip:
    %cm_preset("Robo Clip", #preset_SZM101_bombs_robo_clip)

presets_SZM101_bombs_white_wall_kago_room:
    %cm_preset("White Wall Kago Room", #preset_SZM101_bombs_white_wall_kago_room)

presets_SZM101_bombs_white_wall_2:
    %cm_preset("White Wall 2", #preset_SZM101_bombs_white_wall_2)

presets_SZM101_bombs_white_wall_missiles:
    %cm_preset("White Wall Missiles", #preset_SZM101_bombs_white_wall_missiles)

presets_SZM101_bombs_missile_gate_room:
    %cm_preset("Missile Gate Room", #preset_SZM101_bombs_missile_gate_room)

presets_SZM101_bombs_kihunter_climb:
    %cm_preset("Kihunter Climb", #preset_SZM101_bombs_kihunter_climb)

presets_SZM101_bombs_harder_robo_clip:
    %cm_preset("Harder Robo Clip", #preset_SZM101_bombs_harder_robo_clip)

presets_SZM101_bombs_crumble_run:
    %cm_preset("Crumble Run", #preset_SZM101_bombs_crumble_run)

presets_SZM101_bombs_pirate_jump:
    %cm_preset("Pirate Jump", #preset_SZM101_bombs_pirate_jump)

presets_SZM101_bombs_bomb_torizo:
    %cm_preset("Bomb Torizo", #preset_SZM101_bombs_bomb_torizo)


; Varia
presets_SZM101_varia_bt_exit:
    %cm_preset("BT Exit", #preset_SZM101_varia_bt_exit)

presets_SZM101_varia_crumble_run_return:
    %cm_preset("Crumble Run Return", #preset_SZM101_varia_crumble_run_return)

presets_SZM101_varia_ripper_bomb_jump:
    %cm_preset("Ripper Bomb Jump", #preset_SZM101_varia_ripper_bomb_jump)

presets_SZM101_varia_pancake_fall:
    %cm_preset("Pancake Fall", #preset_SZM101_varia_pancake_fall)

presets_SZM101_varia_pre_grapple:
    %cm_preset("Pre Grapple", #preset_SZM101_varia_pre_grapple)

presets_SZM101_varia_post_grapple:
    %cm_preset("Post Grapple", #preset_SZM101_varia_post_grapple)

presets_SZM101_varia_super_room_entry:
    %cm_preset("Super Room Entry", #preset_SZM101_varia_super_room_entry)

presets_SZM101_varia_super_ceiling_bomb_jump:
    %cm_preset("Super Ceiling Bomb Jump", #preset_SZM101_varia_super_ceiling_bomb_jump)

presets_SZM101_varia_reserve_kihunters:
    %cm_preset("Reserve KiHunters", #preset_SZM101_varia_reserve_kihunters)

presets_SZM101_varia_shaft_top_2:
    %cm_preset("Shaft Top", #preset_SZM101_varia_shaft_top_2)

presets_SZM101_varia_robot_clip_again:
    %cm_preset("Robot Clip Again", #preset_SZM101_varia_robot_clip_again)

presets_SZM101_varia_acid_dive:
    %cm_preset("Acid Dive", #preset_SZM101_varia_acid_dive)

presets_SZM101_varia_secret_ceiling:
    %cm_preset("Secret Ceiling", #preset_SZM101_varia_secret_ceiling)


; Power Bombs
presets_SZM101_power_bombs_varia_exit:
    %cm_preset("Varia Exit", #preset_SZM101_power_bombs_varia_exit)

presets_SZM101_power_bombs_etank_short_mock:
    %cm_preset("Etank Short Mock", #preset_SZM101_power_bombs_etank_short_mock)

presets_SZM101_power_bombs_chozo_etank:
    %cm_preset("Chozo Etank", #preset_SZM101_power_bombs_chozo_etank)

presets_SZM101_power_bombs_un_elevator:
    %cm_preset("UN Elevator", #preset_SZM101_power_bombs_un_elevator)

presets_SZM101_power_bombs_shot_block_wall:
    %cm_preset("Shot Block Wall", #preset_SZM101_power_bombs_shot_block_wall)

presets_SZM101_power_bombs_lava_dive_farm:
    %cm_preset("Lava Dive Farm", #preset_SZM101_power_bombs_lava_dive_farm)

presets_SZM101_power_bombs_lava_dive_etank:
    %cm_preset("Lava Dive Etank", #preset_SZM101_power_bombs_lava_dive_etank)

presets_SZM101_power_bombs_big_hopper_empty_shaft:
    %cm_preset("Big Hopper Empty Shaft", #preset_SZM101_power_bombs_big_hopper_empty_shaft)

presets_SZM101_power_bombs_speed_room:
    %cm_preset("Speed Room", #preset_SZM101_power_bombs_speed_room)

presets_SZM101_power_bombs_big_hopper_ramps:
    %cm_preset("Big Hopper Ramps", #preset_SZM101_power_bombs_big_hopper_ramps)

presets_SZM101_power_bombs_maglodite_lava_dive:
    %cm_preset("Maglodite Lava Dive", #preset_SZM101_power_bombs_maglodite_lava_dive)

presets_SZM101_power_bombs_springball_room_:
    %cm_preset("Springball Room ", #preset_SZM101_power_bombs_springball_room_)

presets_SZM101_power_bombs_spikesuit:
    %cm_preset("Spikesuit", #preset_SZM101_power_bombs_spikesuit)

presets_SZM101_power_bombs_morph_gauntlet:
    %cm_preset("Morph Gauntlet", #preset_SZM101_power_bombs_morph_gauntlet)


; Upper Norfair
presets_SZM101_upper_norfair_leaving_power_bomb_room:
    %cm_preset("Leaving Power Bomb Room", #preset_SZM101_upper_norfair_leaving_power_bomb_room)

presets_SZM101_upper_norfair_pre_ice:
    %cm_preset("Pre Ice", #preset_SZM101_upper_norfair_pre_ice)

presets_SZM101_upper_norfair_leaving_ice:
    %cm_preset("Leaving Ice", #preset_SZM101_upper_norfair_leaving_ice)

presets_SZM101_upper_norfair_baby_croc_supers:
    %cm_preset("Baby Croc Supers", #preset_SZM101_upper_norfair_baby_croc_supers)

presets_SZM101_upper_norfair_pre_hi_jump:
    %cm_preset("Pre Hi Jump", #preset_SZM101_upper_norfair_pre_hi_jump)

presets_SZM101_upper_norfair_leaving_hi_jump:
    %cm_preset("Leaving Hi Jump", #preset_SZM101_upper_norfair_leaving_hi_jump)

presets_SZM101_upper_norfair_springball:
    %cm_preset("Springball", #preset_SZM101_upper_norfair_springball)

presets_SZM101_upper_norfair_big_dessgeegas:
    %cm_preset("Big Dessgeegas", #preset_SZM101_upper_norfair_big_dessgeegas)

presets_SZM101_upper_norfair_wave_block_pit:
    %cm_preset("Wave Block Pit", #preset_SZM101_upper_norfair_wave_block_pit)

presets_SZM101_upper_norfair_exiting_wave:
    %cm_preset("Exiting Wave", #preset_SZM101_upper_norfair_exiting_wave)

presets_SZM101_upper_norfair_missiles_below_wave:
    %cm_preset("Missiles Below Wave", #preset_SZM101_upper_norfair_missiles_below_wave)

presets_SZM101_upper_norfair_wave_wave_gate:
    %cm_preset("Wave Wave Gate", #preset_SZM101_upper_norfair_wave_wave_gate)

presets_SZM101_upper_norfair_super_blockade:
    %cm_preset("Super Blockade", #preset_SZM101_upper_norfair_super_blockade)

presets_SZM101_upper_norfair_acid_party:
    %cm_preset("Acid Party", #preset_SZM101_upper_norfair_acid_party)

presets_SZM101_upper_norfair_save_room_secret:
    %cm_preset("Save Room Secret", #preset_SZM101_upper_norfair_save_room_secret)

presets_SZM101_upper_norfair_reserve_tank_spark:
    %cm_preset("Reserve Tank Spark", #preset_SZM101_upper_norfair_reserve_tank_spark)


; Lower Norfair
presets_SZM101_lower_norfair_elevator_entry:
    %cm_preset("Elevator Entry", #preset_SZM101_lower_norfair_elevator_entry)

presets_SZM101_lower_norfair_save_room_short_charge:
    %cm_preset("Save Room Short Charge", #preset_SZM101_lower_norfair_save_room_short_charge)

presets_SZM101_lower_norfair_reverse_long_spark:
    %cm_preset("Reverse Long Spark", #preset_SZM101_lower_norfair_reverse_long_spark)

presets_SZM101_lower_norfair_tight_short_charge:
    %cm_preset("Tight Short Charge", #preset_SZM101_lower_norfair_tight_short_charge)

presets_SZM101_lower_norfair_crumble_bridge_supers:
    %cm_preset("Crumble Bridge Supers", #preset_SZM101_lower_norfair_crumble_bridge_supers)

presets_SZM101_lower_norfair_firefleas:
    %cm_preset("FireFleas", #preset_SZM101_lower_norfair_firefleas)

presets_SZM101_lower_norfair_spikey_mistep:
    %cm_preset("Spikey Mistep", #preset_SZM101_lower_norfair_spikey_mistep)

presets_SZM101_lower_norfair_fallen_hero_super:
    %cm_preset("Fallen Hero Super", #preset_SZM101_lower_norfair_fallen_hero_super)

presets_SZM101_lower_norfair_morph_maze_pipes:
    %cm_preset("Morph Maze Pipes", #preset_SZM101_lower_norfair_morph_maze_pipes)

presets_SZM101_lower_norfair_build_your_speedway:
    %cm_preset("Build Your Speedway", #preset_SZM101_lower_norfair_build_your_speedway)

presets_SZM101_lower_norfair_monster_elevator:
    %cm_preset("Monster Elevator", #preset_SZM101_lower_norfair_monster_elevator)

presets_SZM101_lower_norfair_goldbat_spark:
    %cm_preset("Goldbat Spark", #preset_SZM101_lower_norfair_goldbat_spark)

presets_SZM101_lower_norfair_awful_chain_spark:
    %cm_preset("Awful Chain Spark", #preset_SZM101_lower_norfair_awful_chain_spark)

presets_SZM101_lower_norfair_chain_spark_puzzle:
    %cm_preset("Chain Spark Puzzle", #preset_SZM101_lower_norfair_chain_spark_puzzle)

presets_SZM101_lower_norfair_leaving_spark_puzzle:
    %cm_preset("Leaving Spark Puzzle", #preset_SZM101_lower_norfair_leaving_spark_puzzle)

presets_SZM101_lower_norfair_screw_attack:
    %cm_preset("Screw Attack", #preset_SZM101_lower_norfair_screw_attack)

presets_SZM101_lower_norfair_chain_spark_out_of_ln:
    %cm_preset("Chain Spark Out Of LN", #preset_SZM101_lower_norfair_chain_spark_out_of_ln)


; Cleanup 1
presets_SZM101_cleanup_1_caterpiller_short_charge:
    %cm_preset("Caterpiller Short Charge", #preset_SZM101_cleanup_1_caterpiller_short_charge)

presets_SZM101_cleanup_1_solid_cacatacs:
    %cm_preset("Solid Cacatacs", #preset_SZM101_cleanup_1_solid_cacatacs)

presets_SZM101_cleanup_1_spikesuit_hallway:
    %cm_preset("Spikesuit Hallway", #preset_SZM101_cleanup_1_spikesuit_hallway)

presets_SZM101_cleanup_1_chasm_supers:
    %cm_preset("Chasm Supers", #preset_SZM101_cleanup_1_chasm_supers)

presets_SZM101_cleanup_1_speed_keep_descent:
    %cm_preset("Speed Keep Descent", #preset_SZM101_cleanup_1_speed_keep_descent)

presets_SZM101_cleanup_1_hole_in_the_wall_missiles:
    %cm_preset("Hole In The Wall Missiles", #preset_SZM101_cleanup_1_hole_in_the_wall_missiles)

presets_SZM101_cleanup_1_eticoon_entry:
    %cm_preset("Eticoon Entry", #preset_SZM101_cleanup_1_eticoon_entry)

presets_SZM101_cleanup_1_super_door_over_crumples:
    %cm_preset("Super Door Over Crumples", #preset_SZM101_cleanup_1_super_door_over_crumples)

presets_SZM101_cleanup_1_crumble_pillers:
    %cm_preset("Crumble Pillers", #preset_SZM101_cleanup_1_crumble_pillers)

presets_SZM101_cleanup_1_post_sporespawn_room:
    %cm_preset("Post Sporespawn Room", #preset_SZM101_cleanup_1_post_sporespawn_room)

presets_SZM101_cleanup_1_spazer:
    %cm_preset("Spazer", #preset_SZM101_cleanup_1_spazer)

presets_SZM101_cleanup_1_spazer_exit:
    %cm_preset("Spazer Exit", #preset_SZM101_cleanup_1_spazer_exit)

presets_SZM101_cleanup_1_leaving_tourian:
    %cm_preset("Leaving Tourian", #preset_SZM101_cleanup_1_leaving_tourian)

presets_SZM101_cleanup_1_bomb_hole_missiles:
    %cm_preset("Bomb Hole Missiles", #preset_SZM101_cleanup_1_bomb_hole_missiles)

presets_SZM101_cleanup_1_mini_kraid_big_lag:
    %cm_preset("Mini Kraid Big Lag", #preset_SZM101_cleanup_1_mini_kraid_big_lag)

presets_SZM101_cleanup_1_pink_room_exit_spark:
    %cm_preset("Pink Room Exit Spark", #preset_SZM101_cleanup_1_pink_room_exit_spark)


; Chozodia
presets_SZM101_chozodia_elevator_top:
    %cm_preset("Elevator Top", #preset_SZM101_chozodia_elevator_top)

presets_SZM101_chozodia_robot_clip_with_speed:
    %cm_preset("Robot Clip With Speed", #preset_SZM101_chozodia_robot_clip_with_speed)

presets_SZM101_chozodia_charge_entry:
    %cm_preset("Charge Entry", #preset_SZM101_chozodia_charge_entry)

presets_SZM101_chozodia_charge_entry_exit:
    %cm_preset("Charge Entry Exit", #preset_SZM101_chozodia_charge_entry_exit)

presets_SZM101_chozodia_shoot_the_floor:
    %cm_preset("Shoot The Floor", #preset_SZM101_chozodia_shoot_the_floor)

presets_SZM101_chozodia_map_room:
    %cm_preset("Map Room", #preset_SZM101_chozodia_map_room)

presets_SZM101_chozodia_white_room_etank:
    %cm_preset("White Room Etank", #preset_SZM101_chozodia_white_room_etank)

presets_SZM101_chozodia_ship_entry_chain_spark:
    %cm_preset("Ship Entry Chain Spark", #preset_SZM101_chozodia_ship_entry_chain_spark)

presets_SZM101_chozodia_waterway_speedkeep:
    %cm_preset("Waterway Speedkeep", #preset_SZM101_chozodia_waterway_speedkeep)

presets_SZM101_chozodia_chozodia_speedkeep:
    %cm_preset("Chozodia Speedkeep", #preset_SZM101_chozodia_chozodia_speedkeep)

presets_SZM101_chozodia_bang:
    %cm_preset("Bang", #preset_SZM101_chozodia_bang)

presets_SZM101_chozodia_botwoon:
    %cm_preset("Botwoon", #preset_SZM101_chozodia_botwoon)

presets_SZM101_chozodia_gravity:
    %cm_preset("Gravity", #preset_SZM101_chozodia_gravity)

presets_SZM101_chozodia_pb_speedball:
    %cm_preset("PB Speedball", #preset_SZM101_chozodia_pb_speedball)

presets_SZM101_chozodia_tricky_chain_spark:
    %cm_preset("Tricky Chain Spark", #preset_SZM101_chozodia_tricky_chain_spark)

presets_SZM101_chozodia_gold_torizo:
    %cm_preset("Gold Torizo", #preset_SZM101_chozodia_gold_torizo)

presets_SZM101_chozodia_reflector_puzzle:
    %cm_preset("Reflector Puzzle", #preset_SZM101_chozodia_reflector_puzzle)

presets_SZM101_chozodia_lost_maze_down:
    %cm_preset("Lost Maze Down", #preset_SZM101_chozodia_lost_maze_down)

presets_SZM101_chozodia_big_space_boost:
    %cm_preset("Big Space Boost", #preset_SZM101_chozodia_big_space_boost)


; Tourian
presets_SZM101_tourian_kihunter_elevator:
    %cm_preset("Kihunter Elevator", #preset_SZM101_tourian_kihunter_elevator)

presets_SZM101_tourian_pancake_missiles:
    %cm_preset("Pancake Missiles", #preset_SZM101_tourian_pancake_missiles)

presets_SZM101_tourian_landing_site_spark:
    %cm_preset("Landing Site Spark", #preset_SZM101_tourian_landing_site_spark)

presets_SZM101_tourian_morph_room:
    %cm_preset("Morph Room", #preset_SZM101_tourian_morph_room)

presets_SZM101_tourian_ninja_pirate_fall:
    %cm_preset("Tourian Room 2", #preset_SZM101_tourian_ninja_pirate_fall)

presets_SZM101_tourian_xray:
    %cm_preset("Xray", #preset_SZM101_tourian_xray)

presets_SZM101_tourian_xray_standup_clip:
    %cm_preset("Xray Standup Clip", #preset_SZM101_tourian_xray_standup_clip)

presets_SZM101_tourian_blind_speedkeep:
    %cm_preset("Blind Speedkeep", #preset_SZM101_tourian_blind_speedkeep)

presets_SZM101_tourian_metroids:
    %cm_preset("Metroids", #preset_SZM101_tourian_metroids)

presets_SZM101_tourian_mother_brain:
    %cm_preset("Mother Brain", #preset_SZM101_tourian_mother_brain)

presets_SZM101_tourian_elevator_breakdown:
    %cm_preset("Elevator Breakdown", #preset_SZM101_tourian_elevator_breakdown)

presets_SZM101_tourian_back_of_gauntlet_missiles:
    %cm_preset("Back Of Gauntlet Missiles", #preset_SZM101_tourian_back_of_gauntlet_missiles)

presets_SZM101_tourian_parlor:
    %cm_preset("Parlor", #preset_SZM101_tourian_parlor)

presets_SZM101_tourian_parlor_fall:
    %cm_preset("Parlor Fall", #preset_SZM101_tourian_parlor_fall)

presets_SZM101_tourian_phantoon:
    %cm_preset("Phantoon", #preset_SZM101_tourian_phantoon)

presets_SZM101_tourian_ninja_pirates:
    %cm_preset("Ninja Pirates", #preset_SZM101_tourian_ninja_pirates)

presets_SZM101_tourian_vault_missile:
    %cm_preset("Vault Missile", #preset_SZM101_tourian_vault_missile)

presets_SZM101_tourian_ninja_pirate_room:
    %cm_preset("Ninja Pirate Room", #preset_SZM101_tourian_ninja_pirate_room)

presets_SZM101_tourian_under_mb_speedkeep:
    %cm_preset("Under MB Speedkeep", #preset_SZM101_tourian_under_mb_speedkeep)

presets_SZM101_tourian_metroids_forward:
    %cm_preset("Metroids Forward", #preset_SZM101_tourian_metroids_forward)

presets_SZM101_tourian_metroids_backward:
    %cm_preset("Metroids Backward", #preset_SZM101_tourian_metroids_backward)

presets_SZM101_tourian_tourian_escape:
    %cm_preset("Tourian Escape", #preset_SZM101_tourian_tourian_escape)


; Cleanup 2
presets_SZM101_cleanup_2_brinstar_secret_item:
    %cm_preset("Brinstar Secret Item", #preset_SZM101_cleanup_2_brinstar_secret_item)

presets_SZM101_cleanup_2_mini_kraid_long_room:
    %cm_preset("Mini Kraid Long Room", #preset_SZM101_cleanup_2_mini_kraid_long_room)

presets_SZM101_cleanup_2_mini_kraid_boss_fight:
    %cm_preset("Mini Kraid Boss Fight", #preset_SZM101_cleanup_2_mini_kraid_boss_fight)

presets_SZM101_cleanup_2_kraid:
    %cm_preset("Kraid", #preset_SZM101_cleanup_2_kraid)

presets_SZM101_cleanup_2_pink_hopper_spark:
    %cm_preset("Pink Hopper Spark", #preset_SZM101_cleanup_2_pink_hopper_spark)

presets_SZM101_cleanup_2_reserve_room:
    %cm_preset("Reserve Room", #preset_SZM101_cleanup_2_reserve_room)

presets_SZM101_cleanup_2_below_reserve_room:
    %cm_preset("Below Reserve Room", #preset_SZM101_cleanup_2_below_reserve_room)

presets_SZM101_cleanup_2_sporespawn_ice_bridge:
    %cm_preset("SporeSpawn Ice Bridge", #preset_SZM101_cleanup_2_sporespawn_ice_bridge)

presets_SZM101_cleanup_2_sporespawn_exit:
    %cm_preset("SporeSpawn Exit", #preset_SZM101_cleanup_2_sporespawn_exit)

presets_SZM101_cleanup_2_kraid_mouth_missile:
    %cm_preset("Kraid Mouth Missile", #preset_SZM101_cleanup_2_kraid_mouth_missile)

presets_SZM101_cleanup_2_etank_chain_spark:
    %cm_preset("Etank Chain Spark", #preset_SZM101_cleanup_2_etank_chain_spark)

presets_SZM101_cleanup_2_slick_space_boost:
    %cm_preset("Slick Space Boost", #preset_SZM101_cleanup_2_slick_space_boost)

presets_SZM101_cleanup_2_rock_pipes:
    %cm_preset("Rock Pipes", #preset_SZM101_cleanup_2_rock_pipes)

presets_SZM101_cleanup_2_maze_skip:
    %cm_preset("Maze Skip", #preset_SZM101_cleanup_2_maze_skip)

presets_SZM101_cleanup_2_crocs_hideaway:
    %cm_preset("Croc's Hideaway", #preset_SZM101_cleanup_2_crocs_hideaway)

presets_SZM101_cleanup_2_crocomire:
    %cm_preset("Crocomire", #preset_SZM101_cleanup_2_crocomire)

presets_SZM101_cleanup_2_broken_grapple_blocks:
    %cm_preset("Broken Grapple Blocks", #preset_SZM101_cleanup_2_broken_grapple_blocks)

presets_SZM101_cleanup_2_lava_dive_pbs:
    %cm_preset("Lava Dive PBs", #preset_SZM101_cleanup_2_lava_dive_pbs)

presets_SZM101_cleanup_2_super_gate_shot:
    %cm_preset("Super Gate Shot", #preset_SZM101_cleanup_2_super_gate_shot)

presets_SZM101_cleanup_2_breakable_chozo:
    %cm_preset("Breakable Chozo", #preset_SZM101_cleanup_2_breakable_chozo)


; Pirate Ship Ridley
presets_SZM101_pirate_ship_ridley_shortest_charge:
    %cm_preset("Shortest Charge", #preset_SZM101_pirate_ship_ridley_shortest_charge)

presets_SZM101_pirate_ship_ridley_inside_outside_spark:
    %cm_preset("Inside Outside Spark", #preset_SZM101_pirate_ship_ridley_inside_outside_spark)

presets_SZM101_pirate_ship_ridley_plasma_sba:
    %cm_preset("Plasma SBA", #preset_SZM101_pirate_ship_ridley_plasma_sba)

presets_SZM101_pirate_ship_ridley_super_speed_space_jump:
    %cm_preset("Super Speed Space Jump", #preset_SZM101_pirate_ship_ridley_super_speed_space_jump)

presets_SZM101_pirate_ship_ridley_kihunter_zoo:
    %cm_preset("Kihunter Zoo", #preset_SZM101_pirate_ship_ridley_kihunter_zoo)

presets_SZM101_pirate_ship_ridley_under_the_ship:
    %cm_preset("Under The Ship", #preset_SZM101_pirate_ship_ridley_under_the_ship)

presets_SZM101_pirate_ship_ridley_tease_pbs:
    %cm_preset("Tease PBs", #preset_SZM101_pirate_ship_ridley_tease_pbs)

presets_SZM101_pirate_ship_ridley_flappy_birds:
    %cm_preset("Flappy Birds", #preset_SZM101_pirate_ship_ridley_flappy_birds)

presets_SZM101_pirate_ship_ridley_flappy_exit:
    %cm_preset("Flappy Exit", #preset_SZM101_pirate_ship_ridley_flappy_exit)

presets_SZM101_pirate_ship_ridley_tube_break:
    %cm_preset("Tube Break", #preset_SZM101_pirate_ship_ridley_tube_break)

presets_SZM101_pirate_ship_ridley_kihopper_ramp_down:
    %cm_preset("Kihopper Ramp Down", #preset_SZM101_pirate_ship_ridley_kihopper_ramp_down)

presets_SZM101_pirate_ship_ridley_worker_robot_roadblock:
    %cm_preset("Worker Robot Roadblock", #preset_SZM101_pirate_ship_ridley_worker_robot_roadblock)

presets_SZM101_pirate_ship_ridley_under_the_ship_2:
    %cm_preset("Under the Ship 2", #preset_SZM101_pirate_ship_ridley_under_the_ship_2)

presets_SZM101_pirate_ship_ridley_the_lazer_part:
    %cm_preset("The Lazer Part", #preset_SZM101_pirate_ship_ridley_the_lazer_part)

presets_SZM101_pirate_ship_ridley_lazer_save_room:
    %cm_preset("Lazer Save Room", #preset_SZM101_pirate_ship_ridley_lazer_save_room)

presets_SZM101_pirate_ship_ridley_spaceboost_etank:
    %cm_preset("SpaceBoost Etank", #preset_SZM101_pirate_ship_ridley_spaceboost_etank)

presets_SZM101_pirate_ship_ridley_two_gate:
    %cm_preset("Two Gate", #preset_SZM101_pirate_ship_ridley_two_gate)

presets_SZM101_pirate_ship_ridley_ridley:
    %cm_preset("Ridley", #preset_SZM101_pirate_ship_ridley_ridley)


; Pirate Ship Draygon
presets_SZM101_pirate_ship_draygon_leaving_ridley:
    %cm_preset("Leaving Ridley", #preset_SZM101_pirate_ship_draygon_leaving_ridley)

presets_SZM101_pirate_ship_draygon_gunship_room:
    %cm_preset("Gunship Room", #preset_SZM101_pirate_ship_draygon_gunship_room)

presets_SZM101_pirate_ship_draygon_underground_path:
    %cm_preset("Underground Path", #preset_SZM101_pirate_ship_draygon_underground_path)

presets_SZM101_pirate_ship_draygon_green_lazers:
    %cm_preset("Green Lazers", #preset_SZM101_pirate_ship_draygon_green_lazers)

presets_SZM101_pirate_ship_draygon_jetpack_pirates:
    %cm_preset("Jetpack Pirates", #preset_SZM101_pirate_ship_draygon_jetpack_pirates)

presets_SZM101_pirate_ship_draygon_one_try_lazer_skip:
    %cm_preset("One Try Lazer Skip", #preset_SZM101_pirate_ship_draygon_one_try_lazer_skip)

presets_SZM101_pirate_ship_draygon_draygon:
    %cm_preset("Draygon", #preset_SZM101_pirate_ship_draygon_draygon)

presets_SZM101_pirate_ship_draygon_boss_missile:
    %cm_preset("Boss Missile", #preset_SZM101_pirate_ship_draygon_boss_missile)

presets_SZM101_pirate_ship_draygon_four_key_shutters:
    %cm_preset("Four Key Shutters", #preset_SZM101_pirate_ship_draygon_four_key_shutters)

presets_SZM101_pirate_ship_draygon_ninja_pirates_2:
    %cm_preset("Ninja Pirates", #preset_SZM101_pirate_ship_draygon_ninja_pirates_2)

presets_SZM101_pirate_ship_draygon_in_the_way_blocks:
    %cm_preset("In The Way Blocks", #preset_SZM101_pirate_ship_draygon_in_the_way_blocks)

presets_SZM101_pirate_ship_draygon_animal_room:
    %cm_preset("Animal Room", #preset_SZM101_pirate_ship_draygon_animal_room)

presets_SZM101_pirate_ship_draygon_crash_room:
    %cm_preset("Crash Room", #preset_SZM101_pirate_ship_draygon_crash_room)

presets_SZM101_pirate_ship_draygon_dachora_room:
    %cm_preset("Dachora Room", #preset_SZM101_pirate_ship_draygon_dachora_room)

presets_SZM101_pirate_ship_draygon_white_pirates:
    %cm_preset("White Pirates", #preset_SZM101_pirate_ship_draygon_white_pirates)


