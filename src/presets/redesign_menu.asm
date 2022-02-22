PresetsMenuRedesign:
    dw #presets_goto_redesign_crateria
    dw #presets_goto_redesign_bombs
    dw #presets_goto_redesign_varia
    dw #presets_goto_redesign_speed_booster
    dw #presets_goto_redesign_hi_jump_boots
    dw #presets_goto_redesign_grapple
    dw #presets_goto_redesign_lower_norfair
    dw #presets_goto_redesign_lost_caverns
    dw #presets_goto_redesign_botwoon
    dw #presets_goto_redesign_cleanup
    dw #presets_goto_redesign_draygon
    dw #presets_goto_redesign_tourian
    dw #presets_goto_redesign_final_escape
    dw #$0000
    %cm_header("REDESIGN ANY% EARLY SPEED")
    %cm_footer("PRESETS BY OSSE101")

presets_goto_redesign_crateria:
    %cm_submenu("Crateria", #presets_submenu_redesign_crateria)

presets_goto_redesign_bombs:
    %cm_submenu("Bombs", #presets_submenu_redesign_bombs)

presets_goto_redesign_varia:
    %cm_submenu("Varia", #presets_submenu_redesign_varia)

presets_goto_redesign_speed_booster:
    %cm_submenu("Speed Booster", #presets_submenu_redesign_speed_booster)

presets_goto_redesign_hi_jump_boots:
    %cm_submenu("Hi Jump Boots", #presets_submenu_redesign_hi_jump_boots)

presets_goto_redesign_grapple:
    %cm_submenu("Grapple", #presets_submenu_redesign_grapple)

presets_goto_redesign_lower_norfair:
    %cm_submenu("Lower Norfair", #presets_submenu_redesign_lower_norfair)

presets_goto_redesign_lost_caverns:
    %cm_submenu("Lost Caverns", #presets_submenu_redesign_lost_caverns)

presets_goto_redesign_botwoon:
    %cm_submenu("Botwoon", #presets_submenu_redesign_botwoon)

presets_goto_redesign_cleanup:
    %cm_submenu("Cleanup", #presets_submenu_redesign_cleanup)

presets_goto_redesign_draygon:
    %cm_submenu("Draygon", #presets_submenu_redesign_draygon)

presets_goto_redesign_tourian:
    %cm_submenu("Tourian", #presets_submenu_redesign_tourian)

presets_goto_redesign_final_escape:
    %cm_submenu("Final Escape", #presets_submenu_redesign_final_escape)

presets_submenu_redesign_crateria:
    dw #presets_redesign_crateria_ceres_elevator
    dw #presets_redesign_crateria_magnet_stairs_escape
    dw #presets_redesign_crateria_landing_site
    dw #presets_redesign_crateria_ledge_room
    dw #presets_redesign_crateria_leaving_morph
    dw #presets_redesign_crateria_pirate_ledge_room
    dw #presets_redesign_crateria_scree_pit
    dw #presets_redesign_crateria_preship_climb
    dw #presets_redesign_crateria_scree_fall
    dw #presets_redesign_crateria_pirate_drop
    dw #$0000
    %cm_header("CRATERIA")

presets_submenu_redesign_bombs:
    dw #presets_redesign_bombs_brin_elevator_left
    dw #presets_redesign_bombs_pipe_bugs_down
    dw #presets_redesign_bombs_big_pink_down
    dw #presets_redesign_bombs_sporespawn
    dw #presets_redesign_bombs_walljump_boots
    dw #presets_redesign_bombs_big_pink_up
    dw #presets_redesign_bombs_pipe_bugs_up
    dw #presets_redesign_bombs_brin_elevator_right
    dw #presets_redesign_bombs_kago_climb
    dw #presets_redesign_bombs_green_pirate_climb
    dw #presets_redesign_bombs_landing_site_2
    dw #presets_redesign_bombs_final_boss
    dw #presets_redesign_bombs_ripper_fall
    dw #presets_redesign_bombs_walljump_climb
    dw #presets_redesign_bombs_reflectors
    dw #presets_redesign_bombs_bomb_torizo
    dw #$0000
    %cm_header("BOMBS")

presets_submenu_redesign_varia:
    dw #presets_redesign_varia_reflectors_2
    dw #presets_redesign_varia_kago_boost
    dw #presets_redesign_varia_walljump_check_down
    dw #presets_redesign_varia_sky_guardian_room
    dw #presets_redesign_varia_final_boss_room
    dw #presets_redesign_varia_ship
    dw #presets_redesign_varia_pirate_drop_2
    dw #presets_redesign_varia_brin_elevator_right_2
    dw #presets_redesign_varia_hopper_hellway
    dw #presets_redesign_varia_early_supers
    dw #presets_redesign_varia_pb_blockade
    dw #presets_redesign_varia_spikey_vileplumes
    dw #presets_redesign_varia_spike_guardian_room
    dw #presets_redesign_varia_soggy_missiles
    dw #presets_redesign_varia_varia_bomb_jump
    dw #$0000
    %cm_header("VARIA")

presets_submenu_redesign_speed_booster:
    dw #presets_redesign_speed_booster_varia_2
    dw #presets_redesign_speed_booster_un_elevator_left
    dw #presets_redesign_speed_booster_wave_bomb_jump
    dw #presets_redesign_speed_booster_exiting_wave
    dw #presets_redesign_speed_booster_big_fall
    dw #presets_redesign_speed_booster_squeept_squeept
    dw #presets_redesign_speed_booster_morph_maze
    dw #presets_redesign_speed_booster_pb_maze
    dw #presets_redesign_speed_booster_reverse_morph_maze
    dw #presets_redesign_speed_booster_five_spawner_farm
    dw #presets_redesign_speed_booster_morph_bomb_blockade
    dw #presets_redesign_speed_booster_lava_bomb_jump
    dw #presets_redesign_speed_booster_speed_entry
    dw #$0000
    %cm_header("SPEED BOOSTER")

presets_submenu_redesign_hi_jump_boots:
    dw #presets_redesign_hi_jump_boots_speed_escape
    dw #presets_redesign_hi_jump_boots_lake_spark
    dw #presets_redesign_hi_jump_boots_squeept_spark
    dw #presets_redesign_hi_jump_boots_big_up_spark
    dw #presets_redesign_hi_jump_boots_chain_spark_out_of_un
    dw #presets_redesign_hi_jump_boots_reserve_elevator
    dw #presets_redesign_hi_jump_boots_red_gate_glitch
    dw #presets_redesign_hi_jump_boots_spikesuit
    dw #presets_redesign_hi_jump_boots_water_bounceball
    dw #presets_redesign_hi_jump_boots_sporespawn_exit
    dw #presets_redesign_hi_jump_boots_charge_hoppers
    dw #presets_redesign_hi_jump_boots_charge_exit
    dw #presets_redesign_hi_jump_boots_missing_etank_room
    dw #presets_redesign_hi_jump_boots_cacatac_alley
    dw #presets_redesign_hi_jump_boots_hi_jump_boots_2
    dw #$0000
    %cm_header("HI JUMP BOOTS")

presets_submenu_redesign_grapple:
    dw #presets_redesign_grapple_hjb_exit
    dw #presets_redesign_grapple_pb_gate
    dw #presets_redesign_grapple_hopper_hallway_farm
    dw #presets_redesign_grapple_towards_dachora
    dw #presets_redesign_grapple_leaving_dachora
    dw #presets_redesign_grapple_pink_wall
    dw #presets_redesign_grapple_norfair_elevator
    dw #presets_redesign_grapple_ice_hellway_farm
    dw #presets_redesign_grapple_ice_hellway_shutters
    dw #presets_redesign_grapple_ice_tripper
    dw #presets_redesign_grapple_leaving_ice
    dw #presets_redesign_grapple_pb_blockade_farm
    dw #presets_redesign_grapple_missile_skip
    dw #presets_redesign_grapple_prescrew
    dw #presets_redesign_grapple_screw
    dw #presets_redesign_grapple_refill_room
    dw #presets_redesign_grapple_spark_blockade
    dw #presets_redesign_grapple_guardian_runback
    dw #presets_redesign_grapple_dessgeega_kill_room
    dw #presets_redesign_grapple_pipe_tunnels
    dw #presets_redesign_grapple_tripper_ride
    dw #$0000
    %cm_header("GRAPPLE")

presets_submenu_redesign_lower_norfair:
    dw #presets_redesign_lower_norfair_springball_skip
    dw #presets_redesign_lower_norfair_acid_death_spikes
    dw #presets_redesign_lower_norfair_bull_room
    dw #presets_redesign_lower_norfair_ripper_ibj
    dw #presets_redesign_lower_norfair_preridley_farm
    dw #presets_redesign_lower_norfair_ridley
    dw #presets_redesign_lower_norfair_ridley_etank
    dw #presets_redesign_lower_norfair_exiting_ridley
    dw #presets_redesign_lower_norfair_gold_torizo
    dw #presets_redesign_lower_norfair_below_bull_room
    dw #presets_redesign_lower_norfair_viola_climb
    dw #presets_redesign_lower_norfair_acid_death_pit
    dw #presets_redesign_lower_norfair_ripper_dessgeegas
    dw #presets_redesign_lower_norfair_after_super_blockade
    dw #presets_redesign_lower_norfair_lava_guardian
    dw #presets_redesign_lower_norfair_ln_final_enemies
    dw #presets_redesign_lower_norfair_rumble_maze
    dw #$0000
    %cm_header("LOWER NORFAIR")

presets_submenu_redesign_lost_caverns:
    dw #presets_redesign_lost_caverns_norfair_elevator_left
    dw #presets_redesign_lost_caverns_water_hoppers
    dw #presets_redesign_lost_caverns_big_pink
    dw #presets_redesign_lost_caverns_brin_elevator_right_3
    dw #presets_redesign_lost_caverns_kago_climb_2
    dw #presets_redesign_lost_caverns_spazer_room
    dw #presets_redesign_lost_caverns_spazer_spark
    dw #presets_redesign_lost_caverns_guardian_chain_spark
    dw #presets_redesign_lost_caverns_landing_site_3
    dw #presets_redesign_lost_caverns_etank_room
    dw #presets_redesign_lost_caverns_sky_guardian
    dw #presets_redesign_lost_caverns_gate_clip
    dw #presets_redesign_lost_caverns_crab_fall
    dw #presets_redesign_lost_caverns_boulder_bowling
    dw #presets_redesign_lost_caverns_phantoon_save_room
    dw #presets_redesign_lost_caverns_lost_maze
    dw #presets_redesign_lost_caverns_phantoon
    dw #$0000
    %cm_header("LOST CAVERNS")

presets_submenu_redesign_botwoon:
    dw #presets_redesign_botwoon_chain_spark_to_gravity
    dw #presets_redesign_botwoon_sinking_chain_spark
    dw #presets_redesign_botwoon_gravity
    dw #presets_redesign_botwoon_spikesuit_2
    dw #presets_redesign_botwoon_fish_tunnel_left
    dw #presets_redesign_botwoon_spiksuit_ibj
    dw #presets_redesign_botwoon_leaving_kago_guardian
    dw #presets_redesign_botwoon_terrible_terrible_fall_supers
    dw #presets_redesign_botwoon_boulder_bowling_2
    dw #presets_redesign_botwoon_red_gate_chain_spark
    dw #presets_redesign_botwoon_spikester_descent
    dw #presets_redesign_botwoon_crabby_ggg
    dw #presets_redesign_botwoon_twin_red_gates
    dw #presets_redesign_botwoon_purple_platforms
    dw #presets_redesign_botwoon_shutter_maze_top
    dw #presets_redesign_botwoon_quicksand_run
    dw #presets_redesign_botwoon_botwoon_2
    dw #presets_redesign_botwoon_botwoon_fall
    dw #$0000
    %cm_header("BOTWOON")

presets_submenu_redesign_cleanup:
    dw #presets_redesign_cleanup_save_room_fall
    dw #presets_redesign_cleanup_snail_highway
    dw #presets_redesign_cleanup_green_brin_pb_blockade
    dw #presets_redesign_cleanup_red_tower_guardian
    dw #presets_redesign_cleanup_spike_guardian
    dw #presets_redesign_cleanup_water_room_2
    dw #presets_redesign_cleanup_norfair_elevator_left_2
    dw #presets_redesign_cleanup_lag_farm
    dw #presets_redesign_cleanup_lava_blockades
    dw #presets_redesign_cleanup_lava_guardian_2
    dw #presets_redesign_cleanup_big_up_spark_2
    dw #presets_redesign_cleanup_lag_climb
    dw #presets_redesign_cleanup_tube_clip
    dw #presets_redesign_cleanup_big_pink_2
    dw #presets_redesign_cleanup_overhead_blockade
    dw #presets_redesign_cleanup_pb_backroom
    dw #presets_redesign_cleanup_hopper_kill_room
    dw #presets_redesign_cleanup_dachora_reverse_spark
    dw #presets_redesign_cleanup_hopper_hellway_2
    dw #presets_redesign_cleanup_broken_tube
    dw #$0000
    %cm_header("CLEANUP")

presets_submenu_redesign_draygon:
    dw #presets_redesign_draygon_speedysupers
    dw #presets_redesign_draygon_mochtroids
    dw #presets_redesign_draygon_bomb_block_tunnel
    dw #presets_redesign_draygon_beam_combo_ggg
    dw #presets_redesign_draygon_falling_sand_climb
    dw #presets_redesign_draygon_draygon_2
    dw #presets_redesign_draygon_sandfall_fall
    dw #presets_redesign_draygon_spacefishjump
    dw #presets_redesign_draygon_towards_shutter_switch
    dw #presets_redesign_draygon_towards_shutter_room
    dw #presets_redesign_draygon_pipes_guardian
    dw #presets_redesign_draygon_mochtroid_spark
    dw #presets_redesign_draygon_big_speed_jump
    dw #presets_redesign_draygon_snail_hallway
    dw #presets_redesign_draygon_ridley_tube_climb
    dw #presets_redesign_draygon_reserve_upspark
    dw #presets_redesign_draygon_shutter_maze_bottom
    dw #presets_redesign_draygon_guard_crabs
    dw #presets_redesign_draygon_beach_crabs
    dw #$0000
    %cm_header("DRAYGON")

presets_submenu_redesign_tourian:
    dw #presets_redesign_tourian_gatekeeper
    dw #presets_redesign_tourian_m1_purple_door_metroids
    dw #presets_redesign_tourian_m2_kill_6
    dw #presets_redesign_tourian_m3_kill_2
    dw #presets_redesign_tourian_m4_kill_5
    dw #presets_redesign_tourian_m5_kill_6
    dw #presets_redesign_tourian_m6_shutter_skip
    dw #presets_redesign_tourian_m7_kill_5
    dw #presets_redesign_tourian_m8_kill_7
    dw #presets_redesign_tourian_m9_kill_9
    dw #presets_redesign_tourian_m10_kill_3
    dw #presets_redesign_tourian_baby_skip
    dw #presets_redesign_tourian_big_hoppers
    dw #presets_redesign_tourian_zeb_skip
    dw #$0000
    %cm_header("TOURIAN")

presets_submenu_redesign_final_escape:
    dw #presets_redesign_final_escape_escape_room_2
    dw #presets_redesign_final_escape_missile_pack_room
    dw #presets_redesign_final_escape_shutter_skip
    dw #presets_redesign_final_escape_maze_shutter_pirate
    dw #presets_redesign_final_escape_jump_morph_room
    dw #presets_redesign_final_escape_morph_tunnels
    dw #presets_redesign_final_escape_metroid_dodge_1
    dw #presets_redesign_final_escape_metroid_dodge_2
    dw #presets_redesign_final_escape_kago_shutter_mockball
    dw #presets_redesign_final_escape_tiny_footholds_climb
    dw #presets_redesign_final_escape_trip_on_slopes
    dw #presets_redesign_final_escape_underwater_platforming_1
    dw #presets_redesign_final_escape_underwater_platforming_2
    dw #presets_redesign_final_escape_mushroom_run
    dw #presets_redesign_final_escape_pirates_and_steam
    dw #presets_redesign_final_escape_lava_and_steam
    dw #presets_redesign_final_escape_rising_tides
    dw #presets_redesign_final_escape_final_boss_2
    dw #presets_redesign_final_escape_ship_2
    dw #$0000
    %cm_header("FINAL ESCAPE")

; Crateria
presets_redesign_crateria_ceres_elevator:
    %cm_preset("Ceres Elevator", #preset_redesign_crateria_ceres_elevator)

presets_redesign_crateria_magnet_stairs_escape:
    %cm_preset("Magnet Stairs Escape", #preset_redesign_crateria_magnet_stairs_escape)

presets_redesign_crateria_landing_site:
    %cm_preset("Landing Site", #preset_redesign_crateria_landing_site)

presets_redesign_crateria_ledge_room:
    %cm_preset("Ledge Room", #preset_redesign_crateria_ledge_room)

presets_redesign_crateria_leaving_morph:
    %cm_preset("Leaving Morph", #preset_redesign_crateria_leaving_morph)

presets_redesign_crateria_pirate_ledge_room:
    %cm_preset("Pirate Ledge Room", #preset_redesign_crateria_pirate_ledge_room)

presets_redesign_crateria_scree_pit:
    %cm_preset("Scree Pit", #preset_redesign_crateria_scree_pit)

presets_redesign_crateria_preship_climb:
    %cm_preset("Preship Climb", #preset_redesign_crateria_preship_climb)

presets_redesign_crateria_scree_fall:
    %cm_preset("Scree Fall", #preset_redesign_crateria_scree_fall)

presets_redesign_crateria_pirate_drop:
    %cm_preset("Pirate Drop", #preset_redesign_crateria_pirate_drop)


; Bombs
presets_redesign_bombs_brin_elevator_left:
    %cm_preset("Brin Elevator Left", #preset_redesign_bombs_brin_elevator_left)

presets_redesign_bombs_pipe_bugs_down:
    %cm_preset("Pipe Bugs Down", #preset_redesign_bombs_pipe_bugs_down)

presets_redesign_bombs_big_pink_down:
    %cm_preset("Big Pink Down", #preset_redesign_bombs_big_pink_down)

presets_redesign_bombs_sporespawn:
    %cm_preset("SporeSpawn", #preset_redesign_bombs_sporespawn)

presets_redesign_bombs_walljump_boots:
    %cm_preset("WallJump Boots", #preset_redesign_bombs_walljump_boots)

presets_redesign_bombs_big_pink_up:
    %cm_preset("Big Pink Up", #preset_redesign_bombs_big_pink_up)

presets_redesign_bombs_pipe_bugs_up:
    %cm_preset("Pipe Bugs Up", #preset_redesign_bombs_pipe_bugs_up)

presets_redesign_bombs_brin_elevator_right:
    %cm_preset("Brin Elevator Right", #preset_redesign_bombs_brin_elevator_right)

presets_redesign_bombs_kago_climb:
    %cm_preset("Kago Climb", #preset_redesign_bombs_kago_climb)

presets_redesign_bombs_green_pirate_climb:
    %cm_preset("Green Pirate Climb", #preset_redesign_bombs_green_pirate_climb)

presets_redesign_bombs_landing_site_2:
    %cm_preset("Landing Site", #preset_redesign_bombs_landing_site_2)

presets_redesign_bombs_final_boss:
    %cm_preset("Final Boss", #preset_redesign_bombs_final_boss)

presets_redesign_bombs_ripper_fall:
    %cm_preset("Ripper Fall", #preset_redesign_bombs_ripper_fall)

presets_redesign_bombs_walljump_climb:
    %cm_preset("Walljump Climb", #preset_redesign_bombs_walljump_climb)

presets_redesign_bombs_reflectors:
    %cm_preset("Reflectors", #preset_redesign_bombs_reflectors)

presets_redesign_bombs_bomb_torizo:
    %cm_preset("Bomb Torizo", #preset_redesign_bombs_bomb_torizo)


; Varia
presets_redesign_varia_reflectors_2:
    %cm_preset("Reflectors", #preset_redesign_varia_reflectors_2)

presets_redesign_varia_kago_boost:
    %cm_preset("Kago Boost", #preset_redesign_varia_kago_boost)

presets_redesign_varia_walljump_check_down:
    %cm_preset("WallJump Check Down", #preset_redesign_varia_walljump_check_down)

presets_redesign_varia_sky_guardian_room:
    %cm_preset("Sky Guardian Room", #preset_redesign_varia_sky_guardian_room)

presets_redesign_varia_final_boss_room:
    %cm_preset("Final Boss Room", #preset_redesign_varia_final_boss_room)

presets_redesign_varia_ship:
    %cm_preset("Ship", #preset_redesign_varia_ship)

presets_redesign_varia_pirate_drop_2:
    %cm_preset("Pirate Drop", #preset_redesign_varia_pirate_drop_2)

presets_redesign_varia_brin_elevator_right_2:
    %cm_preset("Brin Elevator Right", #preset_redesign_varia_brin_elevator_right_2)

presets_redesign_varia_hopper_hellway:
    %cm_preset("Hopper Hellway", #preset_redesign_varia_hopper_hellway)

presets_redesign_varia_early_supers:
    %cm_preset("Early Supers", #preset_redesign_varia_early_supers)

presets_redesign_varia_pb_blockade:
    %cm_preset("PB Blockade", #preset_redesign_varia_pb_blockade)

presets_redesign_varia_spikey_vileplumes:
    %cm_preset("Spikey Vileplumes", #preset_redesign_varia_spikey_vileplumes)

presets_redesign_varia_spike_guardian_room:
    %cm_preset("Spike Guardian Room", #preset_redesign_varia_spike_guardian_room)

presets_redesign_varia_soggy_missiles:
    %cm_preset("Soggy Missiles", #preset_redesign_varia_soggy_missiles)

presets_redesign_varia_varia_bomb_jump:
    %cm_preset("Varia Bomb Jump", #preset_redesign_varia_varia_bomb_jump)


; Speed Booster
presets_redesign_speed_booster_varia_2:
    %cm_preset("Varia", #preset_redesign_speed_booster_varia_2)

presets_redesign_speed_booster_un_elevator_left:
    %cm_preset("UN Elevator Left", #preset_redesign_speed_booster_un_elevator_left)

presets_redesign_speed_booster_wave_bomb_jump:
    %cm_preset("Wave Bomb Jump", #preset_redesign_speed_booster_wave_bomb_jump)

presets_redesign_speed_booster_exiting_wave:
    %cm_preset("Exiting Wave", #preset_redesign_speed_booster_exiting_wave)

presets_redesign_speed_booster_big_fall:
    %cm_preset("Big Fall", #preset_redesign_speed_booster_big_fall)

presets_redesign_speed_booster_squeept_squeept:
    %cm_preset("Squeept Squeept", #preset_redesign_speed_booster_squeept_squeept)

presets_redesign_speed_booster_morph_maze:
    %cm_preset("Morph Maze", #preset_redesign_speed_booster_morph_maze)

presets_redesign_speed_booster_pb_maze:
    %cm_preset("PB Maze", #preset_redesign_speed_booster_pb_maze)

presets_redesign_speed_booster_reverse_morph_maze:
    %cm_preset("Reverse Morph Maze", #preset_redesign_speed_booster_reverse_morph_maze)

presets_redesign_speed_booster_five_spawner_farm:
    %cm_preset("Five Spawner Farm", #preset_redesign_speed_booster_five_spawner_farm)

presets_redesign_speed_booster_morph_bomb_blockade:
    %cm_preset("Morph Bomb Blockade", #preset_redesign_speed_booster_morph_bomb_blockade)

presets_redesign_speed_booster_lava_bomb_jump:
    %cm_preset("Lava Bomb Jump", #preset_redesign_speed_booster_lava_bomb_jump)

presets_redesign_speed_booster_speed_entry:
    %cm_preset("Speed Entry", #preset_redesign_speed_booster_speed_entry)


; Hi Jump Boots
presets_redesign_hi_jump_boots_speed_escape:
    %cm_preset("Speed Escape", #preset_redesign_hi_jump_boots_speed_escape)

presets_redesign_hi_jump_boots_lake_spark:
    %cm_preset("Lake Spark", #preset_redesign_hi_jump_boots_lake_spark)

presets_redesign_hi_jump_boots_squeept_spark:
    %cm_preset("Squeept Spark", #preset_redesign_hi_jump_boots_squeept_spark)

presets_redesign_hi_jump_boots_big_up_spark:
    %cm_preset("Big Up Spark", #preset_redesign_hi_jump_boots_big_up_spark)

presets_redesign_hi_jump_boots_chain_spark_out_of_un:
    %cm_preset("Chain Spark out of UN", #preset_redesign_hi_jump_boots_chain_spark_out_of_un)

presets_redesign_hi_jump_boots_reserve_elevator:
    %cm_preset("Reserve Elevator", #preset_redesign_hi_jump_boots_reserve_elevator)

presets_redesign_hi_jump_boots_red_gate_glitch:
    %cm_preset("Red Gate Glitch", #preset_redesign_hi_jump_boots_red_gate_glitch)

presets_redesign_hi_jump_boots_spikesuit:
    %cm_preset("Spikesuit", #preset_redesign_hi_jump_boots_spikesuit)

presets_redesign_hi_jump_boots_water_bounceball:
    %cm_preset("Water Bounceball", #preset_redesign_hi_jump_boots_water_bounceball)

presets_redesign_hi_jump_boots_sporespawn_exit:
    %cm_preset("SporeSpawn Exit", #preset_redesign_hi_jump_boots_sporespawn_exit)

presets_redesign_hi_jump_boots_charge_hoppers:
    %cm_preset("Charge Hoppers", #preset_redesign_hi_jump_boots_charge_hoppers)

presets_redesign_hi_jump_boots_charge_exit:
    %cm_preset("Charge Exit", #preset_redesign_hi_jump_boots_charge_exit)

presets_redesign_hi_jump_boots_missing_etank_room:
    %cm_preset("Missing Etank Room", #preset_redesign_hi_jump_boots_missing_etank_room)

presets_redesign_hi_jump_boots_cacatac_alley:
    %cm_preset("Cacatac Alley", #preset_redesign_hi_jump_boots_cacatac_alley)

presets_redesign_hi_jump_boots_hi_jump_boots_2:
    %cm_preset("Hi Jump Boots", #preset_redesign_hi_jump_boots_hi_jump_boots_2)


; Grapple
presets_redesign_grapple_hjb_exit:
    %cm_preset("HJB Exit", #preset_redesign_grapple_hjb_exit)

presets_redesign_grapple_pb_gate:
    %cm_preset("PB Gate", #preset_redesign_grapple_pb_gate)

presets_redesign_grapple_hopper_hallway_farm:
    %cm_preset("Hopper Hallway Farm", #preset_redesign_grapple_hopper_hallway_farm)

presets_redesign_grapple_towards_dachora:
    %cm_preset("Towards Dachora", #preset_redesign_grapple_towards_dachora)

presets_redesign_grapple_leaving_dachora:
    %cm_preset("Leaving Dachora", #preset_redesign_grapple_leaving_dachora)

presets_redesign_grapple_pink_wall:
    %cm_preset("Pink Wall", #preset_redesign_grapple_pink_wall)

presets_redesign_grapple_norfair_elevator:
    %cm_preset("Norfair Elevator", #preset_redesign_grapple_norfair_elevator)

presets_redesign_grapple_ice_hellway_farm:
    %cm_preset("Ice Hellway Farm", #preset_redesign_grapple_ice_hellway_farm)

presets_redesign_grapple_ice_hellway_shutters:
    %cm_preset("Ice Hellway Shutters", #preset_redesign_grapple_ice_hellway_shutters)

presets_redesign_grapple_ice_tripper:
    %cm_preset("Ice Tripper", #preset_redesign_grapple_ice_tripper)

presets_redesign_grapple_leaving_ice:
    %cm_preset("Leaving Ice", #preset_redesign_grapple_leaving_ice)

presets_redesign_grapple_pb_blockade_farm:
    %cm_preset("PB Blockade Farm", #preset_redesign_grapple_pb_blockade_farm)

presets_redesign_grapple_missile_skip:
    %cm_preset("Missile Skip", #preset_redesign_grapple_missile_skip)

presets_redesign_grapple_prescrew:
    %cm_preset("Prescrew", #preset_redesign_grapple_prescrew)

presets_redesign_grapple_screw:
    %cm_preset("Screw", #preset_redesign_grapple_screw)

presets_redesign_grapple_refill_room:
    %cm_preset("Refill Room", #preset_redesign_grapple_refill_room)

presets_redesign_grapple_spark_blockade:
    %cm_preset("Spark Blockade", #preset_redesign_grapple_spark_blockade)

presets_redesign_grapple_guardian_runback:
    %cm_preset("Guardian Runback", #preset_redesign_grapple_guardian_runback)

presets_redesign_grapple_dessgeega_kill_room:
    %cm_preset("Dessgeega Kill Room", #preset_redesign_grapple_dessgeega_kill_room)

presets_redesign_grapple_pipe_tunnels:
    %cm_preset("Pipe Tunnels", #preset_redesign_grapple_pipe_tunnels)

presets_redesign_grapple_tripper_ride:
    %cm_preset("Tripper Ride", #preset_redesign_grapple_tripper_ride)


; Lower Norfair
presets_redesign_lower_norfair_springball_skip:
    %cm_preset("Springball Skip", #preset_redesign_lower_norfair_springball_skip)

presets_redesign_lower_norfair_acid_death_spikes:
    %cm_preset("Acid Death Spikes", #preset_redesign_lower_norfair_acid_death_spikes)

presets_redesign_lower_norfair_bull_room:
    %cm_preset("Bull Room", #preset_redesign_lower_norfair_bull_room)

presets_redesign_lower_norfair_ripper_ibj:
    %cm_preset("Ripper IBJ", #preset_redesign_lower_norfair_ripper_ibj)

presets_redesign_lower_norfair_preridley_farm:
    %cm_preset("Preridley Farm", #preset_redesign_lower_norfair_preridley_farm)

presets_redesign_lower_norfair_ridley:
    %cm_preset("Ridley", #preset_redesign_lower_norfair_ridley)

presets_redesign_lower_norfair_ridley_etank:
    %cm_preset("Ridley Etank", #preset_redesign_lower_norfair_ridley_etank)

presets_redesign_lower_norfair_exiting_ridley:
    %cm_preset("Exiting Ridley", #preset_redesign_lower_norfair_exiting_ridley)

presets_redesign_lower_norfair_gold_torizo:
    %cm_preset("Gold Torizo", #preset_redesign_lower_norfair_gold_torizo)

presets_redesign_lower_norfair_below_bull_room:
    %cm_preset("Below Bull Room", #preset_redesign_lower_norfair_below_bull_room)

presets_redesign_lower_norfair_viola_climb:
    %cm_preset("Viola Climb", #preset_redesign_lower_norfair_viola_climb)

presets_redesign_lower_norfair_acid_death_pit:
    %cm_preset("Acid Death Pit", #preset_redesign_lower_norfair_acid_death_pit)

presets_redesign_lower_norfair_ripper_dessgeegas:
    %cm_preset("Ripper Dessgeegas", #preset_redesign_lower_norfair_ripper_dessgeegas)

presets_redesign_lower_norfair_after_super_blockade:
    %cm_preset("After Super Blockade", #preset_redesign_lower_norfair_after_super_blockade)

presets_redesign_lower_norfair_lava_guardian:
    %cm_preset("Lava Guardian", #preset_redesign_lower_norfair_lava_guardian)

presets_redesign_lower_norfair_ln_final_enemies:
    %cm_preset("LN Final Enemies", #preset_redesign_lower_norfair_ln_final_enemies)

presets_redesign_lower_norfair_rumble_maze:
    %cm_preset("Rumble Maze", #preset_redesign_lower_norfair_rumble_maze)


; Lost Caverns
presets_redesign_lost_caverns_norfair_elevator_left:
    %cm_preset("Norfair Elevator Left", #preset_redesign_lost_caverns_norfair_elevator_left)

presets_redesign_lost_caverns_water_hoppers:
    %cm_preset("Water Hoppers", #preset_redesign_lost_caverns_water_hoppers)

presets_redesign_lost_caverns_big_pink:
    %cm_preset("Big Pink", #preset_redesign_lost_caverns_big_pink)

presets_redesign_lost_caverns_brin_elevator_right_3:
    %cm_preset("Brin Elevator Right", #preset_redesign_lost_caverns_brin_elevator_right_3)

presets_redesign_lost_caverns_kago_climb_2:
    %cm_preset("Kago Climb", #preset_redesign_lost_caverns_kago_climb_2)

presets_redesign_lost_caverns_spazer_room:
    %cm_preset("Spazer Room", #preset_redesign_lost_caverns_spazer_room)

presets_redesign_lost_caverns_spazer_spark:
    %cm_preset("Spazer Spark", #preset_redesign_lost_caverns_spazer_spark)

presets_redesign_lost_caverns_guardian_chain_spark:
    %cm_preset("Guardian Chain Spark", #preset_redesign_lost_caverns_guardian_chain_spark)

presets_redesign_lost_caverns_landing_site_3:
    %cm_preset("Landing Site", #preset_redesign_lost_caverns_landing_site_3)

presets_redesign_lost_caverns_etank_room:
    %cm_preset("Etank Room", #preset_redesign_lost_caverns_etank_room)

presets_redesign_lost_caverns_sky_guardian:
    %cm_preset("Sky Guardian", #preset_redesign_lost_caverns_sky_guardian)

presets_redesign_lost_caverns_gate_clip:
    %cm_preset("Gate Clip", #preset_redesign_lost_caverns_gate_clip)

presets_redesign_lost_caverns_crab_fall:
    %cm_preset("Crab Fall", #preset_redesign_lost_caverns_crab_fall)

presets_redesign_lost_caverns_boulder_bowling:
    %cm_preset("Boulder Bowling", #preset_redesign_lost_caverns_boulder_bowling)

presets_redesign_lost_caverns_phantoon_save_room:
    %cm_preset("Phantoon Save Room", #preset_redesign_lost_caverns_phantoon_save_room)

presets_redesign_lost_caverns_lost_maze:
    %cm_preset("Lost Maze", #preset_redesign_lost_caverns_lost_maze)

presets_redesign_lost_caverns_phantoon:
    %cm_preset("Phantoon", #preset_redesign_lost_caverns_phantoon)


; Botwoon
presets_redesign_botwoon_chain_spark_to_gravity:
    %cm_preset("Chain Spark To Gravity", #preset_redesign_botwoon_chain_spark_to_gravity)

presets_redesign_botwoon_sinking_chain_spark:
    %cm_preset("Sinking Chain Spark", #preset_redesign_botwoon_sinking_chain_spark)

presets_redesign_botwoon_gravity:
    %cm_preset("Gravity", #preset_redesign_botwoon_gravity)

presets_redesign_botwoon_spikesuit_2:
    %cm_preset("Spikesuit", #preset_redesign_botwoon_spikesuit_2)

presets_redesign_botwoon_fish_tunnel_left:
    %cm_preset("Fish Tunnel Left", #preset_redesign_botwoon_fish_tunnel_left)

presets_redesign_botwoon_spiksuit_ibj:
    %cm_preset("Spiksuit IBJ", #preset_redesign_botwoon_spiksuit_ibj)

presets_redesign_botwoon_leaving_kago_guardian:
    %cm_preset("Leaving Kago Guardian", #preset_redesign_botwoon_leaving_kago_guardian)

presets_redesign_botwoon_terrible_terrible_fall_supers:
    %cm_preset("Terrible Terrible Fall Supers", #preset_redesign_botwoon_terrible_terrible_fall_supers)

presets_redesign_botwoon_boulder_bowling_2:
    %cm_preset("Boulder Bowling", #preset_redesign_botwoon_boulder_bowling_2)

presets_redesign_botwoon_red_gate_chain_spark:
    %cm_preset("Red Gate Chain Spark", #preset_redesign_botwoon_red_gate_chain_spark)

presets_redesign_botwoon_spikester_descent:
    %cm_preset("Spikester Descent", #preset_redesign_botwoon_spikester_descent)

presets_redesign_botwoon_crabby_ggg:
    %cm_preset("Crabby GGG", #preset_redesign_botwoon_crabby_ggg)

presets_redesign_botwoon_twin_red_gates:
    %cm_preset("Twin Red Gates", #preset_redesign_botwoon_twin_red_gates)

presets_redesign_botwoon_purple_platforms:
    %cm_preset("Purple Platforms", #preset_redesign_botwoon_purple_platforms)

presets_redesign_botwoon_shutter_maze_top:
    %cm_preset("Shutter Maze Top", #preset_redesign_botwoon_shutter_maze_top)

presets_redesign_botwoon_quicksand_run:
    %cm_preset("Quicksand Run", #preset_redesign_botwoon_quicksand_run)

presets_redesign_botwoon_botwoon_2:
    %cm_preset("Botwoon", #preset_redesign_botwoon_botwoon_2)

presets_redesign_botwoon_botwoon_fall:
    %cm_preset("Botwoon Fall", #preset_redesign_botwoon_botwoon_fall)


; Cleanup
presets_redesign_cleanup_save_room_fall:
    %cm_preset("Save Room Fall", #preset_redesign_cleanup_save_room_fall)

presets_redesign_cleanup_snail_highway:
    %cm_preset("Snail Highway", #preset_redesign_cleanup_snail_highway)

presets_redesign_cleanup_green_brin_pb_blockade:
    %cm_preset("Green Brin PB Blockade", #preset_redesign_cleanup_green_brin_pb_blockade)

presets_redesign_cleanup_red_tower_guardian:
    %cm_preset("Red Tower Guardian", #preset_redesign_cleanup_red_tower_guardian)

presets_redesign_cleanup_spike_guardian:
    %cm_preset("Spike Guardian", #preset_redesign_cleanup_spike_guardian)

presets_redesign_cleanup_water_room_2:
    %cm_preset("Water Room 2", #preset_redesign_cleanup_water_room_2)

presets_redesign_cleanup_norfair_elevator_left_2:
    %cm_preset("Norfair Elevator Left", #preset_redesign_cleanup_norfair_elevator_left_2)

presets_redesign_cleanup_lag_farm:
    %cm_preset("Lag Farm", #preset_redesign_cleanup_lag_farm)

presets_redesign_cleanup_lava_blockades:
    %cm_preset("Lava Blockades", #preset_redesign_cleanup_lava_blockades)

presets_redesign_cleanup_lava_guardian_2:
    %cm_preset("Lava Guardian", #preset_redesign_cleanup_lava_guardian_2)

presets_redesign_cleanup_big_up_spark_2:
    %cm_preset("Big Up Spark", #preset_redesign_cleanup_big_up_spark_2)

presets_redesign_cleanup_lag_climb:
    %cm_preset("Lag Climb", #preset_redesign_cleanup_lag_climb)

presets_redesign_cleanup_tube_clip:
    %cm_preset("Tube Clip", #preset_redesign_cleanup_tube_clip)

presets_redesign_cleanup_big_pink_2:
    %cm_preset("Big Pink", #preset_redesign_cleanup_big_pink_2)

presets_redesign_cleanup_overhead_blockade:
    %cm_preset("Overhead Blockade", #preset_redesign_cleanup_overhead_blockade)

presets_redesign_cleanup_pb_backroom:
    %cm_preset("PB Backroom", #preset_redesign_cleanup_pb_backroom)

presets_redesign_cleanup_hopper_kill_room:
    %cm_preset("Hopper Kill Room", #preset_redesign_cleanup_hopper_kill_room)

presets_redesign_cleanup_dachora_reverse_spark:
    %cm_preset("Dachora Reverse Spark", #preset_redesign_cleanup_dachora_reverse_spark)

presets_redesign_cleanup_hopper_hellway_2:
    %cm_preset("Hopper Hellway", #preset_redesign_cleanup_hopper_hellway_2)

presets_redesign_cleanup_broken_tube:
    %cm_preset("Broken Tube", #preset_redesign_cleanup_broken_tube)


; Draygon
presets_redesign_draygon_speedysupers:
    %cm_preset("SpeedySupers", #preset_redesign_draygon_speedysupers)

presets_redesign_draygon_mochtroids:
    %cm_preset("Mochtroids", #preset_redesign_draygon_mochtroids)

presets_redesign_draygon_bomb_block_tunnel:
    %cm_preset("Bomb Block Tunnel", #preset_redesign_draygon_bomb_block_tunnel)

presets_redesign_draygon_beam_combo_ggg:
    %cm_preset("Beam Combo GGG", #preset_redesign_draygon_beam_combo_ggg)

presets_redesign_draygon_falling_sand_climb:
    %cm_preset("Falling Sand Climb", #preset_redesign_draygon_falling_sand_climb)

presets_redesign_draygon_draygon_2:
    %cm_preset("Draygon", #preset_redesign_draygon_draygon_2)

presets_redesign_draygon_sandfall_fall:
    %cm_preset("Sandfall Fall", #preset_redesign_draygon_sandfall_fall)

presets_redesign_draygon_spacefishjump:
    %cm_preset("SpaceFishJump", #preset_redesign_draygon_spacefishjump)

presets_redesign_draygon_towards_shutter_switch:
    %cm_preset("Towards Shutter Switch", #preset_redesign_draygon_towards_shutter_switch)

presets_redesign_draygon_towards_shutter_room:
    %cm_preset("Towards Shutter Room", #preset_redesign_draygon_towards_shutter_room)

presets_redesign_draygon_pipes_guardian:
    %cm_preset("Pipes Guardian", #preset_redesign_draygon_pipes_guardian)

presets_redesign_draygon_mochtroid_spark:
    %cm_preset("Mochtroid Spark", #preset_redesign_draygon_mochtroid_spark)

presets_redesign_draygon_big_speed_jump:
    %cm_preset("Big Speed Jump", #preset_redesign_draygon_big_speed_jump)

presets_redesign_draygon_snail_hallway:
    %cm_preset("Snail Hallway", #preset_redesign_draygon_snail_hallway)

presets_redesign_draygon_ridley_tube_climb:
    %cm_preset("Ridley Tube Climb", #preset_redesign_draygon_ridley_tube_climb)

presets_redesign_draygon_reserve_upspark:
    %cm_preset("Reserve Upspark", #preset_redesign_draygon_reserve_upspark)

presets_redesign_draygon_shutter_maze_bottom:
    %cm_preset("Shutter Maze Bottom", #preset_redesign_draygon_shutter_maze_bottom)

presets_redesign_draygon_guard_crabs:
    %cm_preset("Guard Crabs", #preset_redesign_draygon_guard_crabs)

presets_redesign_draygon_beach_crabs:
    %cm_preset("Beach Crabs", #preset_redesign_draygon_beach_crabs)


; Tourian
presets_redesign_tourian_gatekeeper:
    %cm_preset("GateKeeper", #preset_redesign_tourian_gatekeeper)

presets_redesign_tourian_m1_purple_door_metroids:
    %cm_preset("M1 Purple Door Metroids", #preset_redesign_tourian_m1_purple_door_metroids)

presets_redesign_tourian_m2_kill_6:
    %cm_preset("M2 Kill 6", #preset_redesign_tourian_m2_kill_6)

presets_redesign_tourian_m3_kill_2:
    %cm_preset("M3 Kill 2", #preset_redesign_tourian_m3_kill_2)

presets_redesign_tourian_m4_kill_5:
    %cm_preset("M4 Kill 5", #preset_redesign_tourian_m4_kill_5)

presets_redesign_tourian_m5_kill_6:
    %cm_preset("M5 Kill 6", #preset_redesign_tourian_m5_kill_6)

presets_redesign_tourian_m6_shutter_skip:
    %cm_preset("M6 Shutter Skip", #preset_redesign_tourian_m6_shutter_skip)

presets_redesign_tourian_m7_kill_5:
    %cm_preset("M7 Kill 5", #preset_redesign_tourian_m7_kill_5)

presets_redesign_tourian_m8_kill_7:
    %cm_preset("M8 Kill 7", #preset_redesign_tourian_m8_kill_7)

presets_redesign_tourian_m9_kill_9:
    %cm_preset("M9 Kill 9", #preset_redesign_tourian_m9_kill_9)

presets_redesign_tourian_m10_kill_3:
    %cm_preset("M10 Kill 3", #preset_redesign_tourian_m10_kill_3)

presets_redesign_tourian_baby_skip:
    %cm_preset("Baby Skip", #preset_redesign_tourian_baby_skip)

presets_redesign_tourian_big_hoppers:
    %cm_preset("Big Hoppers", #preset_redesign_tourian_big_hoppers)

presets_redesign_tourian_zeb_skip:
    %cm_preset("Zeb Skip", #preset_redesign_tourian_zeb_skip)


; Final Escape
presets_redesign_final_escape_escape_room_2:
    %cm_preset("Escape Room 2", #preset_redesign_final_escape_escape_room_2)

presets_redesign_final_escape_missile_pack_room:
    %cm_preset("Missile Pack Room", #preset_redesign_final_escape_missile_pack_room)

presets_redesign_final_escape_shutter_skip:
    %cm_preset("Shutter Skip", #preset_redesign_final_escape_shutter_skip)

presets_redesign_final_escape_maze_shutter_pirate:
    %cm_preset("Maze Shutter Pirate", #preset_redesign_final_escape_maze_shutter_pirate)

presets_redesign_final_escape_jump_morph_room:
    %cm_preset("Jump Morph Room", #preset_redesign_final_escape_jump_morph_room)

presets_redesign_final_escape_morph_tunnels:
    %cm_preset("Morph Tunnels", #preset_redesign_final_escape_morph_tunnels)

presets_redesign_final_escape_metroid_dodge_1:
    %cm_preset("Metroid Dodge 1", #preset_redesign_final_escape_metroid_dodge_1)

presets_redesign_final_escape_metroid_dodge_2:
    %cm_preset("Metroid Dodge 2", #preset_redesign_final_escape_metroid_dodge_2)

presets_redesign_final_escape_kago_shutter_mockball:
    %cm_preset("Kago Shutter Mockball", #preset_redesign_final_escape_kago_shutter_mockball)

presets_redesign_final_escape_tiny_footholds_climb:
    %cm_preset("Tiny Footholds Climb", #preset_redesign_final_escape_tiny_footholds_climb)

presets_redesign_final_escape_trip_on_slopes:
    %cm_preset("Trip On Slopes", #preset_redesign_final_escape_trip_on_slopes)

presets_redesign_final_escape_underwater_platforming_1:
    %cm_preset("Underwater Platforming 1", #preset_redesign_final_escape_underwater_platforming_1)

presets_redesign_final_escape_underwater_platforming_2:
    %cm_preset("Underwater Platforming 2", #preset_redesign_final_escape_underwater_platforming_2)

presets_redesign_final_escape_mushroom_run:
    %cm_preset("Mushroom Run", #preset_redesign_final_escape_mushroom_run)

presets_redesign_final_escape_pirates_and_steam:
    %cm_preset("Pirates And Steam", #preset_redesign_final_escape_pirates_and_steam)

presets_redesign_final_escape_lava_and_steam:
    %cm_preset("Lava And Steam", #preset_redesign_final_escape_lava_and_steam)

presets_redesign_final_escape_rising_tides:
    %cm_preset("Rising Tides", #preset_redesign_final_escape_rising_tides)

presets_redesign_final_escape_final_boss_2:
    %cm_preset("Final Boss", #preset_redesign_final_escape_final_boss_2)

presets_redesign_final_escape_ship_2:
    %cm_preset("Ship", #preset_redesign_final_escape_ship_2)


