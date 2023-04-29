PresetsMenuZfackpdr:
    dw #presets_goto_zfackpdr_bombs
    dw #presets_goto_zfackpdr_varia_and_supers
    dw #presets_goto_zfackpdr_wave_and_ice
    dw #presets_goto_zfackpdr_power_bombs
    dw #presets_goto_zfackpdr_chozo_orbs
    dw #presets_goto_zfackpdr_speed_booster
    dw #presets_goto_zfackpdr_kraid_and_grapple
    dw #presets_goto_zfackpdr_wrecked_ship_entry
    dw #presets_goto_zfackpdr_gravity
    dw #presets_goto_zfackpdr_space_jump
    dw #presets_goto_zfackpdr_maridia_escape
    dw #presets_goto_zfackpdr_lower_norfair
    dw #presets_goto_zfackpdr_ln_escape
    dw #presets_goto_zfackpdr_tourian
    dw #presets_goto_zfackpdr_mother_brain
    dw #$0000
    %cm_header("PRESETS FOR ZFACKPDR")

presets_goto_zfackpdr_bombs:
    %cm_submenu("Bombs", #presets_submenu_zfackpdr_bombs)

presets_goto_zfackpdr_varia_and_supers:
    %cm_submenu("Varia and Supers", #presets_submenu_zfackpdr_varia_and_supers)

presets_goto_zfackpdr_wave_and_ice:
    %cm_submenu("Wave and Ice", #presets_submenu_zfackpdr_wave_and_ice)

presets_goto_zfackpdr_power_bombs:
    %cm_submenu("Power Bombs", #presets_submenu_zfackpdr_power_bombs)

presets_goto_zfackpdr_chozo_orbs:
    %cm_submenu("Chozo Orbs", #presets_submenu_zfackpdr_chozo_orbs)

presets_goto_zfackpdr_speed_booster:
    %cm_submenu("Speed Booster", #presets_submenu_zfackpdr_speed_booster)

presets_goto_zfackpdr_kraid_and_grapple:
    %cm_submenu("Kraid and Grapple", #presets_submenu_zfackpdr_kraid_and_grapple)

presets_goto_zfackpdr_wrecked_ship_entry:
    %cm_submenu("Wrecked Ship Entry", #presets_submenu_zfackpdr_wrecked_ship_entry)

presets_goto_zfackpdr_gravity:
    %cm_submenu("Gravity", #presets_submenu_zfackpdr_gravity)

presets_goto_zfackpdr_space_jump:
    %cm_submenu("Space Jump", #presets_submenu_zfackpdr_space_jump)

presets_goto_zfackpdr_maridia_escape:
    %cm_submenu("Maridia Escape", #presets_submenu_zfackpdr_maridia_escape)

presets_goto_zfackpdr_lower_norfair:
    %cm_submenu("Lower Norfair", #presets_submenu_zfackpdr_lower_norfair)

presets_goto_zfackpdr_ln_escape:
    %cm_submenu("LN Escape", #presets_submenu_zfackpdr_ln_escape)

presets_goto_zfackpdr_tourian:
    %cm_submenu("Tourian", #presets_submenu_zfackpdr_tourian)

presets_goto_zfackpdr_mother_brain:
    %cm_submenu("Mother Brain", #presets_submenu_zfackpdr_mother_brain)

presets_submenu_zfackpdr_bombs:
    dw #presets_zfackpdr_bombs_ship
    dw #presets_zfackpdr_bombs_sleepy_tunnel
    dw #presets_zfackpdr_bombs_kihunter_babies
    dw #presets_zfackpdr_bombs_climb_down
    dw #presets_zfackpdr_bombs_elevator_to_morph
    dw #presets_zfackpdr_bombs_empty_chozo_down
    dw #presets_zfackpdr_bombs_morph
    dw #presets_zfackpdr_bombs_morph_escape
    dw #presets_zfackpdr_bombs_elevator_bottom
    dw #presets_zfackpdr_bombs_pirate_mushrooms
    dw #presets_zfackpdr_bombs_kihunter_revival
    dw #presets_zfackpdr_bombs_purple_stairs
    dw #presets_zfackpdr_bombs_ship_revisit
    dw #presets_zfackpdr_bombs_rip_n_dive
    dw #presets_zfackpdr_bombs_old_mb_tricks
    dw #presets_zfackpdr_bombs_bomb_torizo
    dw #$0000
    %cm_header("BOMBS")

presets_submenu_zfackpdr_varia_and_supers:
    dw #presets_zfackpdr_varia_and_supers_bt_escape
    dw #presets_zfackpdr_varia_and_supers_kihunter_revisit
    dw #presets_zfackpdr_varia_and_supers_purple_stairs_revisit
    dw #presets_zfackpdr_varia_and_supers_ship_revisit_revisit
    dw #presets_zfackpdr_varia_and_supers_rip_n_dive_revisit
    dw #presets_zfackpdr_varia_and_supers_gate_scam_one
    dw #presets_zfackpdr_varia_and_supers_cannonball
    dw #presets_zfackpdr_varia_and_supers_red_brin_elevator
    dw #presets_zfackpdr_varia_and_supers_varia
    dw #presets_zfackpdr_varia_and_supers_gate_scam_two
    dw #presets_zfackpdr_varia_and_supers_lava_pit_death_room
    dw #presets_zfackpdr_varia_and_supers_bug_pipe_secret
    dw #presets_zfackpdr_varia_and_supers_bubble_mountain
    dw #presets_zfackpdr_varia_and_supers_early_supers
    dw #$0000
    %cm_header("VARIA AND SUPERS")

presets_submenu_zfackpdr_wave_and_ice:
    dw #presets_zfackpdr_wave_and_ice_bubbly_troubly_
    dw #presets_zfackpdr_wave_and_ice_hopper_statue_room
    dw #presets_zfackpdr_wave_and_ice_gate_scam_three
    dw #presets_zfackpdr_wave_and_ice_bubble_lava_room
    dw #presets_zfackpdr_wave_and_ice_freeze_booger_room
    dw #presets_zfackpdr_wave_and_ice_wave_bugs_down
    dw #presets_zfackpdr_wave_and_ice_wave_escape
    dw #presets_zfackpdr_wave_and_ice_bubble_lava_room_revisit
    dw #presets_zfackpdr_wave_and_ice_spiky_nova_room
    dw #presets_zfackpdr_wave_and_ice_rising_lava_platforms
    dw #presets_zfackpdr_wave_and_ice_ice_pirate_tower
    dw #presets_zfackpdr_wave_and_ice_ice_escape
    dw #$0000
    %cm_header("WAVE AND ICE")

presets_submenu_zfackpdr_power_bombs:
    dw #presets_zfackpdr_power_bombs_boot_bug_bonanza
    dw #presets_zfackpdr_power_bombs_norfair_lobby
    dw #presets_zfackpdr_power_bombs_map_tower_up
    dw #presets_zfackpdr_power_bombs_cac_attack_revisit
    dw #presets_zfackpdr_power_bombs_ceiling_missiles
    dw #presets_zfackpdr_power_bombs_gate_scam_four
    dw #presets_zfackpdr_power_bombs_face_climb
    dw #presets_zfackpdr_power_bombs_hidden_hoppers
    dw #presets_zfackpdr_power_bombs_spiky_platform_tower
    dw #presets_zfackpdr_power_bombs_waveless_softlock
    dw #presets_zfackpdr_power_bombs_croc
    dw #presets_zfackpdr_power_bombs_power_bombs_2
    dw #$0000
    %cm_header("POWER BOMBS")

presets_submenu_zfackpdr_chozo_orbs:
    dw #presets_zfackpdr_chozo_orbs_lava_death_revisit
    dw #presets_zfackpdr_chozo_orbs_red_tower
    dw #presets_zfackpdr_chozo_orbs_jungle_boost
    dw #presets_zfackpdr_chozo_orbs_green_tunnel_tower
    dw #presets_zfackpdr_chozo_orbs_charge_beam
    dw #presets_zfackpdr_chozo_orbs_pink_elevator
    dw #presets_zfackpdr_chozo_orbs_noob_bridge
    dw #presets_zfackpdr_chozo_orbs_save_station
    dw #presets_zfackpdr_chozo_orbs_pain_lake
    dw #presets_zfackpdr_chozo_orbs_chozo_orbs_2
    dw #$0000
    %cm_header("CHOZO ORBS")

presets_submenu_zfackpdr_speed_booster:
    dw #presets_zfackpdr_speed_booster_tunnel_lake
    dw #presets_zfackpdr_speed_booster_mini_kraid_hall
    dw #presets_zfackpdr_speed_booster_hopper_madness
    dw #presets_zfackpdr_speed_booster_enter_maridia
    dw #presets_zfackpdr_speed_booster_sand_tower_down
    dw #presets_zfackpdr_speed_booster_sand_hall
    dw #presets_zfackpdr_speed_booster_platform_climb
    dw #presets_zfackpdr_speed_booster_speed_escape
    dw #presets_zfackpdr_speed_booster_sand_tower_up
    dw #presets_zfackpdr_speed_booster_shaktool
    dw #$0000
    %cm_header("SPEED BOOSTER")

presets_submenu_zfackpdr_kraid_and_grapple:
    dw #presets_zfackpdr_kraid_and_grapple_kraids_lair
    dw #presets_zfackpdr_kraid_and_grapple_hopper_madness_two
    dw #presets_zfackpdr_kraid_and_grapple_spazer
    dw #presets_zfackpdr_kraid_and_grapple_spike_tunnel
    dw #presets_zfackpdr_kraid_and_grapple_kraid_entrance_
    dw #presets_zfackpdr_kraid_and_grapple_kraid
    dw #presets_zfackpdr_kraid_and_grapple_kraid_escape
    dw #presets_zfackpdr_kraid_and_grapple_spazer_revisit
    dw #presets_zfackpdr_kraid_and_grapple_more_hopper_pain
    dw #presets_zfackpdr_kraid_and_grapple_grapple_bugs
    dw #presets_zfackpdr_kraid_and_grapple_grapple_lake
    dw #$0000
    %cm_header("KRAID AND GRAPPLE")

presets_submenu_zfackpdr_wrecked_ship_entry:
    dw #presets_zfackpdr_wrecked_ship_entry_kihunter_climb
    dw #presets_zfackpdr_wrecked_ship_entry_red_tower_climb
    dw #presets_zfackpdr_wrecked_ship_entry_red_brin_escape
    dw #presets_zfackpdr_wrecked_ship_entry_crateria_grapple_climb
    dw #presets_zfackpdr_wrecked_ship_entry_ship_entrance_lake
    dw #presets_zfackpdr_wrecked_ship_entry_enter_ship
    dw #presets_zfackpdr_wrecked_ship_entry_spiky_tower_climb
    dw #presets_zfackpdr_wrecked_ship_entry_platforms_n_bots
    dw #presets_zfackpdr_wrecked_ship_entry_antenna_climb
    dw #presets_zfackpdr_wrecked_ship_entry_phantoon
    dw #$0000
    %cm_header("WRECKED SHIP ENTRY")

presets_submenu_zfackpdr_gravity:
    dw #presets_zfackpdr_gravity_phantoon_escape
    dw #presets_zfackpdr_gravity_empty_hand
    dw #presets_zfackpdr_gravity_lake_shortcut_supers
    dw #presets_zfackpdr_gravity_grapple_lake_2
    dw #presets_zfackpdr_gravity_robot_boxing
    dw #presets_zfackpdr_gravity_gravity_2
    dw #presets_zfackpdr_gravity_red_brin_revisit
    dw #presets_zfackpdr_gravity_cac_hallway
    dw #presets_zfackpdr_gravity_red_tower_down_again
    dw #presets_zfackpdr_gravity_kihunter_club
    dw #presets_zfackpdr_gravity_kraid_tower_revisit
    dw #presets_zfackpdr_gravity_hopper_madness_three
    dw #$0000
    %cm_header("GRAVITY")

presets_submenu_zfackpdr_space_jump:
    dw #presets_zfackpdr_space_jump_maridia_reentry
    dw #presets_zfackpdr_space_jump_crumble_spark_setup
    dw #presets_zfackpdr_space_jump_hidden_fish_tunnel
    dw #presets_zfackpdr_space_jump_crumble_gap_scam
    dw #presets_zfackpdr_space_jump_toilet_up
    dw #presets_zfackpdr_space_jump_fortress
    dw #presets_zfackpdr_space_jump_toilet_down
    dw #presets_zfackpdr_space_jump_mocktroid_sand_hall
    dw #presets_zfackpdr_space_jump_botwoon
    dw #presets_zfackpdr_space_jump_tube_maze
    dw #presets_zfackpdr_space_jump_gate_scam_five
    dw #presets_zfackpdr_space_jump_draygon
    dw #$0000
    %cm_header("SPACE JUMP")

presets_submenu_zfackpdr_maridia_escape:
    dw #presets_zfackpdr_maridia_escape_draygon_escape
    dw #presets_zfackpdr_maridia_escape_spikey_chozo
    dw #presets_zfackpdr_maridia_escape_grassy_tower
    dw #presets_zfackpdr_maridia_escape_plasma
    dw #presets_zfackpdr_maridia_escape_toilet_down_2
    dw #presets_zfackpdr_maridia_escape_hot_air_baloons
    dw #presets_zfackpdr_maridia_escape_crab_hall
    dw #presets_zfackpdr_maridia_escape_shaktool_revisit
    dw #presets_zfackpdr_maridia_escape_brinstar_reentry
    dw #presets_zfackpdr_maridia_escape_grapple_lake_3
    dw #presets_zfackpdr_maridia_escape_red_tower_passthrough
    dw #presets_zfackpdr_maridia_escape_enter_norfair
    dw #presets_zfackpdr_maridia_escape_lava_dive
    dw #$0000
    %cm_header("MARIDIA ESCAPE")

presets_submenu_zfackpdr_lower_norfair:
    dw #presets_zfackpdr_lower_norfair_ln_main_hall
    dw #presets_zfackpdr_lower_norfair_bubble_hopper_madness
    dw #presets_zfackpdr_lower_norfair_rising_kihunters
    dw #presets_zfackpdr_lower_norfair_ball_maze
    dw #presets_zfackpdr_lower_norfair_dragon_ruins
    dw #presets_zfackpdr_lower_norfair_monkey_bars
    dw #presets_zfackpdr_lower_norfair_crumble_lobby
    dw #presets_zfackpdr_lower_norfair_metal_ninja_pirates
    dw #presets_zfackpdr_lower_norfair_ridley_entrance
    dw #presets_zfackpdr_lower_norfair_ridley
    dw #$0000
    %cm_header("LOWER NORFAIR")

presets_submenu_zfackpdr_ln_escape:
    dw #presets_zfackpdr_ln_escape_ridley_escape
    dw #presets_zfackpdr_ln_escape_crumble_lobby_revisit
    dw #presets_zfackpdr_ln_escape_ln_main_hall_revisit
    dw #presets_zfackpdr_ln_escape_lava_dive_revisit
    dw #presets_zfackpdr_ln_escape_norfair_lobby_revisit
    dw #presets_zfackpdr_ln_escape_red_tower_revisit
    dw #presets_zfackpdr_ln_escape_red_brin_elevator_2
    dw #presets_zfackpdr_ln_escape_canonball_revisit
    dw #presets_zfackpdr_ln_escape_old_mb_revisit
    dw #presets_zfackpdr_ln_escape_g4
    dw #$0000
    %cm_header("LN ESCAPE")

presets_submenu_zfackpdr_tourian:
    dw #presets_zfackpdr_tourian_enter_tourian
    dw #presets_zfackpdr_tourian_acid_spark
    dw #presets_zfackpdr_tourian_pirate_debocle_
    dw #presets_zfackpdr_tourian_false_lava
    dw #presets_zfackpdr_tourian_generator
    dw #presets_zfackpdr_tourian_enter_night
    dw #presets_zfackpdr_tourian_first_metroid
    dw #presets_zfackpdr_tourian_metroid_platforms
    dw #presets_zfackpdr_tourian_metroid_platforms_loop
    dw #presets_zfackpdr_tourian_metroid_hall_and_tower
    dw #presets_zfackpdr_tourian_metroid_toilet
    dw #$0000
    %cm_header("TOURIAN")

presets_submenu_zfackpdr_mother_brain:
    dw #presets_zfackpdr_mother_brain_baby_skip
    dw #presets_zfackpdr_mother_brain_sandy_elevator
    dw #presets_zfackpdr_mother_brain_ball_maze_2
    dw #presets_zfackpdr_mother_brain_mother_brain_2
    dw #presets_zfackpdr_mother_brain_mother_brain_2_2
    dw #presets_zfackpdr_mother_brain_mother_brain_3
    dw #presets_zfackpdr_mother_brain_escape
    dw #presets_zfackpdr_mother_brain_ball_maze_revisit
    dw #presets_zfackpdr_mother_brain_tourian_elevator_spark
    dw #presets_zfackpdr_mother_brain_pirate_frenzy
    dw #presets_zfackpdr_mother_brain_purple_stairs_revisit_2
    dw #$0000
    %cm_header("MOTHER BRAIN")

; Bombs
presets_zfackpdr_bombs_ship:
    %cm_preset("Ship", #preset_zfackpdr_bombs_ship)

presets_zfackpdr_bombs_sleepy_tunnel:
    %cm_preset("Sleepy Tunnel", #preset_zfackpdr_bombs_sleepy_tunnel)

presets_zfackpdr_bombs_kihunter_babies:
    %cm_preset("Kihunter Babies", #preset_zfackpdr_bombs_kihunter_babies)

presets_zfackpdr_bombs_climb_down:
    %cm_preset("Climb Down", #preset_zfackpdr_bombs_climb_down)

presets_zfackpdr_bombs_elevator_to_morph:
    %cm_preset("Elevator to Morph", #preset_zfackpdr_bombs_elevator_to_morph)

presets_zfackpdr_bombs_empty_chozo_down:
    %cm_preset("Empty Chozo Down", #preset_zfackpdr_bombs_empty_chozo_down)

presets_zfackpdr_bombs_morph:
    %cm_preset("Morph", #preset_zfackpdr_bombs_morph)

presets_zfackpdr_bombs_morph_escape:
    %cm_preset("Morph Escape", #preset_zfackpdr_bombs_morph_escape)

presets_zfackpdr_bombs_elevator_bottom:
    %cm_preset("Elevator Bottom", #preset_zfackpdr_bombs_elevator_bottom)

presets_zfackpdr_bombs_pirate_mushrooms:
    %cm_preset("Pirate Mushrooms", #preset_zfackpdr_bombs_pirate_mushrooms)

presets_zfackpdr_bombs_kihunter_revival:
    %cm_preset("Kihunter Revival", #preset_zfackpdr_bombs_kihunter_revival)

presets_zfackpdr_bombs_purple_stairs:
    %cm_preset("Purple Stairs", #preset_zfackpdr_bombs_purple_stairs)

presets_zfackpdr_bombs_ship_revisit:
    %cm_preset("Ship Revisit", #preset_zfackpdr_bombs_ship_revisit)

presets_zfackpdr_bombs_rip_n_dive:
    %cm_preset("Rip n Dive", #preset_zfackpdr_bombs_rip_n_dive)

presets_zfackpdr_bombs_old_mb_tricks:
    %cm_preset("Old MB Tricks", #preset_zfackpdr_bombs_old_mb_tricks)

presets_zfackpdr_bombs_bomb_torizo:
    %cm_preset("Bomb Torizo", #preset_zfackpdr_bombs_bomb_torizo)


; Varia and Supers
presets_zfackpdr_varia_and_supers_bt_escape:
    %cm_preset("BT Escape", #preset_zfackpdr_varia_and_supers_bt_escape)

presets_zfackpdr_varia_and_supers_kihunter_revisit:
    %cm_preset("Kihunter Revisit", #preset_zfackpdr_varia_and_supers_kihunter_revisit)

presets_zfackpdr_varia_and_supers_purple_stairs_revisit:
    %cm_preset("Purple Stairs Revisit", #preset_zfackpdr_varia_and_supers_purple_stairs_revisit)

presets_zfackpdr_varia_and_supers_ship_revisit_revisit:
    %cm_preset("Ship Revisit Revisit", #preset_zfackpdr_varia_and_supers_ship_revisit_revisit)

presets_zfackpdr_varia_and_supers_rip_n_dive_revisit:
    %cm_preset("Rip n Dive Revisit", #preset_zfackpdr_varia_and_supers_rip_n_dive_revisit)

presets_zfackpdr_varia_and_supers_gate_scam_one:
    %cm_preset("Gate Scam One", #preset_zfackpdr_varia_and_supers_gate_scam_one)

presets_zfackpdr_varia_and_supers_cannonball:
    %cm_preset("Cannonball", #preset_zfackpdr_varia_and_supers_cannonball)

presets_zfackpdr_varia_and_supers_red_brin_elevator:
    %cm_preset("Red Brin Elevator", #preset_zfackpdr_varia_and_supers_red_brin_elevator)

presets_zfackpdr_varia_and_supers_varia:
    %cm_preset("Varia", #preset_zfackpdr_varia_and_supers_varia)

presets_zfackpdr_varia_and_supers_gate_scam_two:
    %cm_preset("Gate Scam Two", #preset_zfackpdr_varia_and_supers_gate_scam_two)

presets_zfackpdr_varia_and_supers_lava_pit_death_room:
    %cm_preset("Lava Pit Death Room", #preset_zfackpdr_varia_and_supers_lava_pit_death_room)

presets_zfackpdr_varia_and_supers_bug_pipe_secret:
    %cm_preset("Bug Pipe Secret", #preset_zfackpdr_varia_and_supers_bug_pipe_secret)

presets_zfackpdr_varia_and_supers_bubble_mountain:
    %cm_preset("Bubble Mountain", #preset_zfackpdr_varia_and_supers_bubble_mountain)

presets_zfackpdr_varia_and_supers_early_supers:
    %cm_preset("Early Supers", #preset_zfackpdr_varia_and_supers_early_supers)


; Wave and Ice
presets_zfackpdr_wave_and_ice_bubbly_troubly_:
    %cm_preset("Bubbly Troubly ", #preset_zfackpdr_wave_and_ice_bubbly_troubly_)

presets_zfackpdr_wave_and_ice_hopper_statue_room:
    %cm_preset("Hopper Statue Room", #preset_zfackpdr_wave_and_ice_hopper_statue_room)

presets_zfackpdr_wave_and_ice_gate_scam_three:
    %cm_preset("Gate Scam Three", #preset_zfackpdr_wave_and_ice_gate_scam_three)

presets_zfackpdr_wave_and_ice_bubble_lava_room:
    %cm_preset("Bubble Lava Room", #preset_zfackpdr_wave_and_ice_bubble_lava_room)

presets_zfackpdr_wave_and_ice_freeze_booger_room:
    %cm_preset("Freeze Booger Room", #preset_zfackpdr_wave_and_ice_freeze_booger_room)

presets_zfackpdr_wave_and_ice_wave_bugs_down:
    %cm_preset("Wave Bugs Down", #preset_zfackpdr_wave_and_ice_wave_bugs_down)

presets_zfackpdr_wave_and_ice_wave_escape:
    %cm_preset("Wave Escape", #preset_zfackpdr_wave_and_ice_wave_escape)

presets_zfackpdr_wave_and_ice_bubble_lava_room_revisit:
    %cm_preset("Bubble Lava Room Revisit", #preset_zfackpdr_wave_and_ice_bubble_lava_room_revisit)

presets_zfackpdr_wave_and_ice_spiky_nova_room:
    %cm_preset("Spiky Nova Room", #preset_zfackpdr_wave_and_ice_spiky_nova_room)

presets_zfackpdr_wave_and_ice_rising_lava_platforms:
    %cm_preset("Rising Lava Platforms", #preset_zfackpdr_wave_and_ice_rising_lava_platforms)

presets_zfackpdr_wave_and_ice_ice_pirate_tower:
    %cm_preset("Ice Pirate Tower", #preset_zfackpdr_wave_and_ice_ice_pirate_tower)

presets_zfackpdr_wave_and_ice_ice_escape:
    %cm_preset("Ice Escape", #preset_zfackpdr_wave_and_ice_ice_escape)


; Power Bombs
presets_zfackpdr_power_bombs_boot_bug_bonanza:
    %cm_preset("Boot Bug Bonanza", #preset_zfackpdr_power_bombs_boot_bug_bonanza)

presets_zfackpdr_power_bombs_norfair_lobby:
    %cm_preset("Norfair Lobby", #preset_zfackpdr_power_bombs_norfair_lobby)

presets_zfackpdr_power_bombs_map_tower_up:
    %cm_preset("Map Tower Up", #preset_zfackpdr_power_bombs_map_tower_up)

presets_zfackpdr_power_bombs_cac_attack_revisit:
    %cm_preset("Cac Attack Revisit", #preset_zfackpdr_power_bombs_cac_attack_revisit)

presets_zfackpdr_power_bombs_ceiling_missiles:
    %cm_preset("Ceiling Missiles", #preset_zfackpdr_power_bombs_ceiling_missiles)

presets_zfackpdr_power_bombs_gate_scam_four:
    %cm_preset("Gate Scam Four", #preset_zfackpdr_power_bombs_gate_scam_four)

presets_zfackpdr_power_bombs_face_climb:
    %cm_preset("Face Climb", #preset_zfackpdr_power_bombs_face_climb)

presets_zfackpdr_power_bombs_hidden_hoppers:
    %cm_preset("Hidden Hoppers", #preset_zfackpdr_power_bombs_hidden_hoppers)

presets_zfackpdr_power_bombs_spiky_platform_tower:
    %cm_preset("Spiky Platform Tower", #preset_zfackpdr_power_bombs_spiky_platform_tower)

presets_zfackpdr_power_bombs_waveless_softlock:
    %cm_preset("Waveless Softlock", #preset_zfackpdr_power_bombs_waveless_softlock)

presets_zfackpdr_power_bombs_croc:
    %cm_preset("Croc", #preset_zfackpdr_power_bombs_croc)

presets_zfackpdr_power_bombs_power_bombs_2:
    %cm_preset("Power Bombs", #preset_zfackpdr_power_bombs_power_bombs_2)


; Chozo Orbs
presets_zfackpdr_chozo_orbs_lava_death_revisit:
    %cm_preset("Lava Death Revisit", #preset_zfackpdr_chozo_orbs_lava_death_revisit)

presets_zfackpdr_chozo_orbs_red_tower:
    %cm_preset("Red Tower", #preset_zfackpdr_chozo_orbs_red_tower)

presets_zfackpdr_chozo_orbs_jungle_boost:
    %cm_preset("Jungle Boost", #preset_zfackpdr_chozo_orbs_jungle_boost)

presets_zfackpdr_chozo_orbs_green_tunnel_tower:
    %cm_preset("Green Tunnel Tower", #preset_zfackpdr_chozo_orbs_green_tunnel_tower)

presets_zfackpdr_chozo_orbs_charge_beam:
    %cm_preset("Charge Beam", #preset_zfackpdr_chozo_orbs_charge_beam)

presets_zfackpdr_chozo_orbs_pink_elevator:
    %cm_preset("Pink Elevator", #preset_zfackpdr_chozo_orbs_pink_elevator)

presets_zfackpdr_chozo_orbs_noob_bridge:
    %cm_preset("Noob Bridge", #preset_zfackpdr_chozo_orbs_noob_bridge)

presets_zfackpdr_chozo_orbs_save_station:
    %cm_preset("Save Station", #preset_zfackpdr_chozo_orbs_save_station)

presets_zfackpdr_chozo_orbs_pain_lake:
    %cm_preset("Pain Lake", #preset_zfackpdr_chozo_orbs_pain_lake)

presets_zfackpdr_chozo_orbs_chozo_orbs_2:
    %cm_preset("Chozo Orbs", #preset_zfackpdr_chozo_orbs_chozo_orbs_2)


; Speed Booster
presets_zfackpdr_speed_booster_tunnel_lake:
    %cm_preset("Tunnel Lake", #preset_zfackpdr_speed_booster_tunnel_lake)

presets_zfackpdr_speed_booster_mini_kraid_hall:
    %cm_preset("Mini Kraid Hall", #preset_zfackpdr_speed_booster_mini_kraid_hall)

presets_zfackpdr_speed_booster_hopper_madness:
    %cm_preset("Hopper Madness", #preset_zfackpdr_speed_booster_hopper_madness)

presets_zfackpdr_speed_booster_enter_maridia:
    %cm_preset("Enter Maridia", #preset_zfackpdr_speed_booster_enter_maridia)

presets_zfackpdr_speed_booster_sand_tower_down:
    %cm_preset("Sand Tower Down", #preset_zfackpdr_speed_booster_sand_tower_down)

presets_zfackpdr_speed_booster_sand_hall:
    %cm_preset("Sand Hall", #preset_zfackpdr_speed_booster_sand_hall)

presets_zfackpdr_speed_booster_platform_climb:
    %cm_preset("Platform Climb", #preset_zfackpdr_speed_booster_platform_climb)

presets_zfackpdr_speed_booster_speed_escape:
    %cm_preset("Speed Escape", #preset_zfackpdr_speed_booster_speed_escape)

presets_zfackpdr_speed_booster_sand_tower_up:
    %cm_preset("Sand Tower Up", #preset_zfackpdr_speed_booster_sand_tower_up)

presets_zfackpdr_speed_booster_shaktool:
    %cm_preset("Shaktool", #preset_zfackpdr_speed_booster_shaktool)


; Kraid and Grapple
presets_zfackpdr_kraid_and_grapple_kraids_lair:
    %cm_preset("Kraid's Lair", #preset_zfackpdr_kraid_and_grapple_kraids_lair)

presets_zfackpdr_kraid_and_grapple_hopper_madness_two:
    %cm_preset("Hopper Madness Two", #preset_zfackpdr_kraid_and_grapple_hopper_madness_two)

presets_zfackpdr_kraid_and_grapple_spazer:
    %cm_preset("Spazer", #preset_zfackpdr_kraid_and_grapple_spazer)

presets_zfackpdr_kraid_and_grapple_spike_tunnel:
    %cm_preset("Spike Tunnel", #preset_zfackpdr_kraid_and_grapple_spike_tunnel)

presets_zfackpdr_kraid_and_grapple_kraid_entrance_:
    %cm_preset("Kraid Entrance ", #preset_zfackpdr_kraid_and_grapple_kraid_entrance_)

presets_zfackpdr_kraid_and_grapple_kraid:
    %cm_preset("Kraid", #preset_zfackpdr_kraid_and_grapple_kraid)

presets_zfackpdr_kraid_and_grapple_kraid_escape:
    %cm_preset("Kraid Escape", #preset_zfackpdr_kraid_and_grapple_kraid_escape)

presets_zfackpdr_kraid_and_grapple_spazer_revisit:
    %cm_preset("Spazer Revisit", #preset_zfackpdr_kraid_and_grapple_spazer_revisit)

presets_zfackpdr_kraid_and_grapple_more_hopper_pain:
    %cm_preset("More Hopper Pain", #preset_zfackpdr_kraid_and_grapple_more_hopper_pain)

presets_zfackpdr_kraid_and_grapple_grapple_bugs:
    %cm_preset("Grapple Bugs", #preset_zfackpdr_kraid_and_grapple_grapple_bugs)

presets_zfackpdr_kraid_and_grapple_grapple_lake:
    %cm_preset("Grapple Lake", #preset_zfackpdr_kraid_and_grapple_grapple_lake)


; Wrecked Ship Entry
presets_zfackpdr_wrecked_ship_entry_kihunter_climb:
    %cm_preset("Kihunter Climb", #preset_zfackpdr_wrecked_ship_entry_kihunter_climb)

presets_zfackpdr_wrecked_ship_entry_red_tower_climb:
    %cm_preset("Red Tower Climb", #preset_zfackpdr_wrecked_ship_entry_red_tower_climb)

presets_zfackpdr_wrecked_ship_entry_red_brin_escape:
    %cm_preset("Red Brin Escape", #preset_zfackpdr_wrecked_ship_entry_red_brin_escape)

presets_zfackpdr_wrecked_ship_entry_crateria_grapple_climb:
    %cm_preset("Crateria Grapple Climb", #preset_zfackpdr_wrecked_ship_entry_crateria_grapple_climb)

presets_zfackpdr_wrecked_ship_entry_ship_entrance_lake:
    %cm_preset("Ship Entrance Lake", #preset_zfackpdr_wrecked_ship_entry_ship_entrance_lake)

presets_zfackpdr_wrecked_ship_entry_enter_ship:
    %cm_preset("Enter Ship", #preset_zfackpdr_wrecked_ship_entry_enter_ship)

presets_zfackpdr_wrecked_ship_entry_spiky_tower_climb:
    %cm_preset("Spiky Tower Climb", #preset_zfackpdr_wrecked_ship_entry_spiky_tower_climb)

presets_zfackpdr_wrecked_ship_entry_platforms_n_bots:
    %cm_preset("Platforms n Bots", #preset_zfackpdr_wrecked_ship_entry_platforms_n_bots)

presets_zfackpdr_wrecked_ship_entry_antenna_climb:
    %cm_preset("Antenna Climb", #preset_zfackpdr_wrecked_ship_entry_antenna_climb)

presets_zfackpdr_wrecked_ship_entry_phantoon:
    %cm_preset("Phantoon", #preset_zfackpdr_wrecked_ship_entry_phantoon)


; Gravity
presets_zfackpdr_gravity_phantoon_escape:
    %cm_preset("Phantoon Escape", #preset_zfackpdr_gravity_phantoon_escape)

presets_zfackpdr_gravity_empty_hand:
    %cm_preset("Empty Hand", #preset_zfackpdr_gravity_empty_hand)

presets_zfackpdr_gravity_lake_shortcut_supers:
    %cm_preset("Lake Shortcut Supers", #preset_zfackpdr_gravity_lake_shortcut_supers)

presets_zfackpdr_gravity_grapple_lake_2:
    %cm_preset("Grapple Lake", #preset_zfackpdr_gravity_grapple_lake_2)

presets_zfackpdr_gravity_robot_boxing:
    %cm_preset("Robot Boxing", #preset_zfackpdr_gravity_robot_boxing)

presets_zfackpdr_gravity_gravity_2:
    %cm_preset("Gravity", #preset_zfackpdr_gravity_gravity_2)

presets_zfackpdr_gravity_red_brin_revisit:
    %cm_preset("Red Brin Revisit", #preset_zfackpdr_gravity_red_brin_revisit)

presets_zfackpdr_gravity_cac_hallway:
    %cm_preset("Cac Hallway", #preset_zfackpdr_gravity_cac_hallway)

presets_zfackpdr_gravity_red_tower_down_again:
    %cm_preset("Red Tower Down Again", #preset_zfackpdr_gravity_red_tower_down_again)

presets_zfackpdr_gravity_kihunter_club:
    %cm_preset("Kihunter Club", #preset_zfackpdr_gravity_kihunter_club)

presets_zfackpdr_gravity_kraid_tower_revisit:
    %cm_preset("Kraid Tower Revisit", #preset_zfackpdr_gravity_kraid_tower_revisit)

presets_zfackpdr_gravity_hopper_madness_three:
    %cm_preset("Hopper Madness Three", #preset_zfackpdr_gravity_hopper_madness_three)


; Space Jump
presets_zfackpdr_space_jump_maridia_reentry:
    %cm_preset("Maridia Reentry", #preset_zfackpdr_space_jump_maridia_reentry)

presets_zfackpdr_space_jump_crumble_spark_setup:
    %cm_preset("Crumble Spark Setup", #preset_zfackpdr_space_jump_crumble_spark_setup)

presets_zfackpdr_space_jump_hidden_fish_tunnel:
    %cm_preset("Hidden Fish Tunnel", #preset_zfackpdr_space_jump_hidden_fish_tunnel)

presets_zfackpdr_space_jump_crumble_gap_scam:
    %cm_preset("Crumble Gap Scam", #preset_zfackpdr_space_jump_crumble_gap_scam)

presets_zfackpdr_space_jump_toilet_up:
    %cm_preset("Toilet Up", #preset_zfackpdr_space_jump_toilet_up)

presets_zfackpdr_space_jump_fortress:
    %cm_preset("Fortress", #preset_zfackpdr_space_jump_fortress)

presets_zfackpdr_space_jump_toilet_down:
    %cm_preset("Toilet Down", #preset_zfackpdr_space_jump_toilet_down)

presets_zfackpdr_space_jump_mocktroid_sand_hall:
    %cm_preset("Mocktroid Sand Hall", #preset_zfackpdr_space_jump_mocktroid_sand_hall)

presets_zfackpdr_space_jump_botwoon:
    %cm_preset("Botwoon", #preset_zfackpdr_space_jump_botwoon)

presets_zfackpdr_space_jump_tube_maze:
    %cm_preset("Tube Maze", #preset_zfackpdr_space_jump_tube_maze)

presets_zfackpdr_space_jump_gate_scam_five:
    %cm_preset("Gate Scam Five", #preset_zfackpdr_space_jump_gate_scam_five)

presets_zfackpdr_space_jump_draygon:
    %cm_preset("Draygon", #preset_zfackpdr_space_jump_draygon)


; Maridia Escape
presets_zfackpdr_maridia_escape_draygon_escape:
    %cm_preset("Draygon Escape", #preset_zfackpdr_maridia_escape_draygon_escape)

presets_zfackpdr_maridia_escape_spikey_chozo:
    %cm_preset("Spikey Chozo", #preset_zfackpdr_maridia_escape_spikey_chozo)

presets_zfackpdr_maridia_escape_grassy_tower:
    %cm_preset("Grassy Tower", #preset_zfackpdr_maridia_escape_grassy_tower)

presets_zfackpdr_maridia_escape_plasma:
    %cm_preset("Plasma", #preset_zfackpdr_maridia_escape_plasma)

presets_zfackpdr_maridia_escape_toilet_down_2:
    %cm_preset("Toilet Down", #preset_zfackpdr_maridia_escape_toilet_down_2)

presets_zfackpdr_maridia_escape_hot_air_baloons:
    %cm_preset("Hot Air Baloons", #preset_zfackpdr_maridia_escape_hot_air_baloons)

presets_zfackpdr_maridia_escape_crab_hall:
    %cm_preset("Crab Hall", #preset_zfackpdr_maridia_escape_crab_hall)

presets_zfackpdr_maridia_escape_shaktool_revisit:
    %cm_preset("Shaktool Revisit", #preset_zfackpdr_maridia_escape_shaktool_revisit)

presets_zfackpdr_maridia_escape_brinstar_reentry:
    %cm_preset("Brinstar Reentry", #preset_zfackpdr_maridia_escape_brinstar_reentry)

presets_zfackpdr_maridia_escape_grapple_lake_3:
    %cm_preset("Grapple Lake", #preset_zfackpdr_maridia_escape_grapple_lake_3)

presets_zfackpdr_maridia_escape_red_tower_passthrough:
    %cm_preset("Red Tower Passthrough", #preset_zfackpdr_maridia_escape_red_tower_passthrough)

presets_zfackpdr_maridia_escape_enter_norfair:
    %cm_preset("Enter Norfair", #preset_zfackpdr_maridia_escape_enter_norfair)

presets_zfackpdr_maridia_escape_lava_dive:
    %cm_preset("Lava Dive", #preset_zfackpdr_maridia_escape_lava_dive)


; Lower Norfair
presets_zfackpdr_lower_norfair_ln_main_hall:
    %cm_preset("LN Main Hall", #preset_zfackpdr_lower_norfair_ln_main_hall)

presets_zfackpdr_lower_norfair_bubble_hopper_madness:
    %cm_preset("Bubble Hopper Madness", #preset_zfackpdr_lower_norfair_bubble_hopper_madness)

presets_zfackpdr_lower_norfair_rising_kihunters:
    %cm_preset("Rising Kihunters", #preset_zfackpdr_lower_norfair_rising_kihunters)

presets_zfackpdr_lower_norfair_ball_maze:
    %cm_preset("Ball Maze", #preset_zfackpdr_lower_norfair_ball_maze)

presets_zfackpdr_lower_norfair_dragon_ruins:
    %cm_preset("Dragon Ruins", #preset_zfackpdr_lower_norfair_dragon_ruins)

presets_zfackpdr_lower_norfair_monkey_bars:
    %cm_preset("Monkey Bars", #preset_zfackpdr_lower_norfair_monkey_bars)

presets_zfackpdr_lower_norfair_crumble_lobby:
    %cm_preset("Crumble Lobby", #preset_zfackpdr_lower_norfair_crumble_lobby)

presets_zfackpdr_lower_norfair_metal_ninja_pirates:
    %cm_preset("Metal Ninja Pirates", #preset_zfackpdr_lower_norfair_metal_ninja_pirates)

presets_zfackpdr_lower_norfair_ridley_entrance:
    %cm_preset("Ridley Entrance", #preset_zfackpdr_lower_norfair_ridley_entrance)

presets_zfackpdr_lower_norfair_ridley:
    %cm_preset("Ridley", #preset_zfackpdr_lower_norfair_ridley)


; LN Escape
presets_zfackpdr_ln_escape_ridley_escape:
    %cm_preset("Ridley Escape", #preset_zfackpdr_ln_escape_ridley_escape)

presets_zfackpdr_ln_escape_crumble_lobby_revisit:
    %cm_preset("Crumble Lobby Revisit", #preset_zfackpdr_ln_escape_crumble_lobby_revisit)

presets_zfackpdr_ln_escape_ln_main_hall_revisit:
    %cm_preset("LN Main Hall Revisit", #preset_zfackpdr_ln_escape_ln_main_hall_revisit)

presets_zfackpdr_ln_escape_lava_dive_revisit:
    %cm_preset("Lava Dive Revisit", #preset_zfackpdr_ln_escape_lava_dive_revisit)

presets_zfackpdr_ln_escape_norfair_lobby_revisit:
    %cm_preset("Norfair Lobby Revisit", #preset_zfackpdr_ln_escape_norfair_lobby_revisit)

presets_zfackpdr_ln_escape_red_tower_revisit:
    %cm_preset("Red Tower Revisit", #preset_zfackpdr_ln_escape_red_tower_revisit)

presets_zfackpdr_ln_escape_red_brin_elevator_2:
    %cm_preset("Red Brin Elevator", #preset_zfackpdr_ln_escape_red_brin_elevator_2)

presets_zfackpdr_ln_escape_canonball_revisit:
    %cm_preset("Canonball Revisit", #preset_zfackpdr_ln_escape_canonball_revisit)

presets_zfackpdr_ln_escape_old_mb_revisit:
    %cm_preset("Old MB Revisit", #preset_zfackpdr_ln_escape_old_mb_revisit)

presets_zfackpdr_ln_escape_g4:
    %cm_preset("G4", #preset_zfackpdr_ln_escape_g4)


; Tourian
presets_zfackpdr_tourian_enter_tourian:
    %cm_preset("Enter Tourian", #preset_zfackpdr_tourian_enter_tourian)

presets_zfackpdr_tourian_acid_spark:
    %cm_preset("Acid Spark", #preset_zfackpdr_tourian_acid_spark)

presets_zfackpdr_tourian_pirate_debocle_:
    %cm_preset("Pirate Debocle ", #preset_zfackpdr_tourian_pirate_debocle_)

presets_zfackpdr_tourian_false_lava:
    %cm_preset("False Lava", #preset_zfackpdr_tourian_false_lava)

presets_zfackpdr_tourian_generator:
    %cm_preset("Generator", #preset_zfackpdr_tourian_generator)

presets_zfackpdr_tourian_enter_night:
    %cm_preset("Enter Night", #preset_zfackpdr_tourian_enter_night)

presets_zfackpdr_tourian_first_metroid:
    %cm_preset("First Metroid", #preset_zfackpdr_tourian_first_metroid)

presets_zfackpdr_tourian_metroid_platforms:
    %cm_preset("Metroid Platforms", #preset_zfackpdr_tourian_metroid_platforms)

presets_zfackpdr_tourian_metroid_platforms_loop:
    %cm_preset("Metroid Platforms Loop", #preset_zfackpdr_tourian_metroid_platforms_loop)

presets_zfackpdr_tourian_metroid_hall_and_tower:
    %cm_preset("Metroid Hall and Tower", #preset_zfackpdr_tourian_metroid_hall_and_tower)

presets_zfackpdr_tourian_metroid_toilet:
    %cm_preset("Metroid Toilet", #preset_zfackpdr_tourian_metroid_toilet)


; Mother Brain
presets_zfackpdr_mother_brain_baby_skip:
    %cm_preset("Baby Skip", #preset_zfackpdr_mother_brain_baby_skip)

presets_zfackpdr_mother_brain_sandy_elevator:
    %cm_preset("Sandy Elevator", #preset_zfackpdr_mother_brain_sandy_elevator)

presets_zfackpdr_mother_brain_ball_maze_2:
    %cm_preset("Ball Maze", #preset_zfackpdr_mother_brain_ball_maze_2)

presets_zfackpdr_mother_brain_mother_brain_2:
    %cm_preset("Mother Brain", #preset_zfackpdr_mother_brain_mother_brain_2)

presets_zfackpdr_mother_brain_mother_brain_2_2:
    %cm_preset("Mother Brain 2", #preset_zfackpdr_mother_brain_mother_brain_2_2)

presets_zfackpdr_mother_brain_mother_brain_3:
    %cm_preset("Mother Brain 3", #preset_zfackpdr_mother_brain_mother_brain_3)

presets_zfackpdr_mother_brain_escape:
    %cm_preset("Escape", #preset_zfackpdr_mother_brain_escape)

presets_zfackpdr_mother_brain_ball_maze_revisit:
    %cm_preset("Ball Maze Revisit", #preset_zfackpdr_mother_brain_ball_maze_revisit)

presets_zfackpdr_mother_brain_tourian_elevator_spark:
    %cm_preset("Tourian Elevator Spark", #preset_zfackpdr_mother_brain_tourian_elevator_spark)

presets_zfackpdr_mother_brain_pirate_frenzy:
    %cm_preset("Pirate Frenzy", #preset_zfackpdr_mother_brain_pirate_frenzy)

presets_zfackpdr_mother_brain_purple_stairs_revisit_2:
    %cm_preset("Purple Stairs Revisit", #preset_zfackpdr_mother_brain_purple_stairs_revisit_2)


