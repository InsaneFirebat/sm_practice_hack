PresetsMenuSpazer:
    dw #presets_goto_spazer_crateria
    dw #presets_goto_spazer_brinstar
    dw #presets_goto_spazer_upper_norfair
    dw #presets_goto_spazer_red_brinstar
    dw #presets_goto_spazer_wrecked_ship
    dw #presets_goto_spazer_red_brinstar_final
    dw #presets_goto_spazer_maridia
    dw #presets_goto_spazer_upper_norfair_revisit
    dw #presets_goto_spazer_lower_norfair
    dw #presets_goto_spazer_backtracking
    dw #presets_goto_spazer_tourian
    dw #$0000
    %cm_header("ANY% KPDR WITH SPAZER")

presets_goto_spazer_crateria:
    %cm_submenu("Crateria", #presets_submenu_spazer_crateria)

presets_goto_spazer_brinstar:
    %cm_submenu("Brinstar", #presets_submenu_spazer_brinstar)

presets_goto_spazer_upper_norfair:
    %cm_submenu("Upper Norfair", #presets_submenu_spazer_upper_norfair)

presets_goto_spazer_red_brinstar:
    %cm_submenu("Red Brinstar", #presets_submenu_spazer_red_brinstar)

presets_goto_spazer_wrecked_ship:
    %cm_submenu("Wrecked Ship", #presets_submenu_spazer_wrecked_ship)

presets_goto_spazer_red_brinstar_final:
    %cm_submenu("Red Brinstar Final", #presets_submenu_spazer_red_brinstar_final)

presets_goto_spazer_maridia:
    %cm_submenu("Maridia", #presets_submenu_spazer_maridia)

presets_goto_spazer_upper_norfair_revisit:
    %cm_submenu("Upper Norfair Revisit", #presets_submenu_spazer_upper_norfair_revisit)

presets_goto_spazer_lower_norfair:
    %cm_submenu("Lower Norfair", #presets_submenu_spazer_lower_norfair)

presets_goto_spazer_backtracking:
    %cm_submenu("Backtracking", #presets_submenu_spazer_backtracking)

presets_goto_spazer_tourian:
    %cm_submenu("Tourian", #presets_submenu_spazer_tourian)

presets_submenu_spazer_crateria:
    dw #presets_spazer_crateria_ceres_elevator
    dw #presets_spazer_crateria_ceres_last_3_rooms
    dw #presets_spazer_crateria_ship
    dw #presets_spazer_crateria_parlor
    dw #presets_spazer_crateria_climb_down
    dw #presets_spazer_crateria_pit_room
    dw #presets_spazer_crateria_morph
    dw #presets_spazer_crateria_construction_zone
    dw #presets_spazer_crateria_construction_zone_revisit
    dw #presets_spazer_crateria_pit_room_revisit
    dw #presets_spazer_crateria_climb_up
    dw #presets_spazer_crateria_parlor_revisit
    dw #presets_spazer_crateria_flyway
    dw #presets_spazer_crateria_bomb_torizo
    dw #presets_spazer_crateria_alcatraz
    dw #presets_spazer_crateria_terminator
    dw #presets_spazer_crateria_green_pirate_shaft
    dw #$0000
    %cm_header("CRATERIA")

presets_submenu_spazer_brinstar:
    dw #presets_spazer_brinstar_green_brinstar_elevator
    dw #presets_spazer_brinstar_early_supers
    dw #presets_spazer_brinstar_dachora_room
    dw #presets_spazer_brinstar_big_pink
    dw #presets_spazer_brinstar_green_hill_zone
    dw #presets_spazer_brinstar_noob_bridge
    dw #presets_spazer_brinstar_red_tower
    dw #presets_spazer_brinstar_skree_boost
    dw #presets_spazer_brinstar_below_spazer
    dw #presets_spazer_brinstar_entering_kraids_lair
    dw #presets_spazer_brinstar_kraid_kihunters
    dw #presets_spazer_brinstar_mini_kraid
    dw #presets_spazer_brinstar_kraid
    dw #presets_spazer_brinstar_leaving_varia
    dw #presets_spazer_brinstar_mini_kraid_revisit
    dw #presets_spazer_brinstar_kraid_kihunters_revisit
    dw #presets_spazer_brinstar_kraid_etank
    dw #$0000
    %cm_header("BRINSTAR")

presets_submenu_spazer_upper_norfair:
    dw #presets_spazer_upper_norfair_business_center
    dw #presets_spazer_upper_norfair_hi_jump_etank
    dw #presets_spazer_upper_norfair_leaving_hi_jump
    dw #presets_spazer_upper_norfair_business_center_2
    dw #presets_spazer_upper_norfair_precathedral
    dw #presets_spazer_upper_norfair_cathedral
    dw #presets_spazer_upper_norfair_rising_tide
    dw #presets_spazer_upper_norfair_bubble_mountain
    dw #presets_spazer_upper_norfair_bat_cave
    dw #presets_spazer_upper_norfair_single_chamber
    dw #presets_spazer_upper_norfair_double_chamber
    dw #presets_spazer_upper_norfair_double_chamber_revisit
    dw #presets_spazer_upper_norfair_single_chamber_revisit
    dw #presets_spazer_upper_norfair_bubble_mountain_revisit
    dw #presets_spazer_upper_norfair_frog_speedway
    dw #presets_spazer_upper_norfair_business_center_3
    dw #$0000
    %cm_header("UPPER NORFAIR")

presets_submenu_spazer_red_brinstar:
    dw #presets_spazer_red_brinstar_alpha_spark
    dw #presets_spazer_red_brinstar_reverse_skree_boost
    dw #presets_spazer_red_brinstar_red_tower_climb
    dw #presets_spazer_red_brinstar_hellway
    dw #presets_spazer_red_brinstar_caterpillars_down
    dw #presets_spazer_red_brinstar_alpha_power_bombs
    dw #presets_spazer_red_brinstar_caterpillars_up
    dw #$0000
    %cm_header("RED BRINSTAR")

presets_submenu_spazer_wrecked_ship:
    dw #presets_spazer_wrecked_ship_crateria_kihunters
    dw #presets_spazer_wrecked_ship_oceanfly_setup
    dw #presets_spazer_wrecked_ship_ocean_spark
    dw #presets_spazer_wrecked_ship_entering_wrecked_ship
    dw #presets_spazer_wrecked_ship_basement
    dw #presets_spazer_wrecked_ship_phantoon
    dw #presets_spazer_wrecked_ship_leaving_phantoon
    dw #presets_spazer_wrecked_ship_shaft_to_supers
    dw #presets_spazer_wrecked_ship_wrecked_ship_shaft
    dw #presets_spazer_wrecked_ship_attic
    dw #presets_spazer_wrecked_ship_upper_west_ocean
    dw #presets_spazer_wrecked_ship_pancakes_and_wavers
    dw #presets_spazer_wrecked_ship_bowling_spark
    dw #presets_spazer_wrecked_ship_leaving_gravity
    dw #presets_spazer_wrecked_ship_moat_ball
    dw #presets_spazer_wrecked_ship_crateria_kihunters_return
    dw #$0000
    %cm_header("WRECKED SHIP")

presets_submenu_spazer_red_brinstar_final:
    dw #presets_spazer_red_brinstar_final_red_tower_elevator
    dw #presets_spazer_red_brinstar_final_hellway_revisit
    dw #presets_spazer_red_brinstar_final_red_tower_down
    dw #presets_spazer_red_brinstar_final_skree_boost_final
    dw #presets_spazer_red_brinstar_final_below_spazer_final
    dw #$0000
    %cm_header("RED BRINSTAR FINAL")

presets_submenu_spazer_maridia:
    dw #presets_spazer_maridia_breaking_tube
    dw #presets_spazer_maridia_fish_tank
    dw #presets_spazer_maridia_mt_everest
    dw #presets_spazer_maridia_crab_shaft
    dw #presets_spazer_maridia_aqueduct
    dw #presets_spazer_maridia_botwoon_hallway
    dw #presets_spazer_maridia_botwoon
    dw #presets_spazer_maridia_botwoon_etank
    dw #presets_spazer_maridia_halfie_setup
    dw #presets_spazer_maridia_draygon
    dw #presets_spazer_maridia_reverse_halfie_spikesuit
    dw #presets_spazer_maridia_womple_jump
    dw #presets_spazer_maridia_cac_alley_east
    dw #presets_spazer_maridia_cac_alley_west
    dw #presets_spazer_maridia_plasma_spark
    dw #presets_spazer_maridia_plasma_climb
    dw #presets_spazer_maridia_plasma_beam
    dw #presets_spazer_maridia_plasma_spark_revisit
    dw #presets_spazer_maridia_toilet
    dw #presets_spazer_maridia_sewers
    dw #presets_spazer_maridia_lower_maridia_gate
    dw #$0000
    %cm_header("MARIDIA")

presets_submenu_spazer_upper_norfair_revisit:
    dw #presets_spazer_upper_norfair_revisit_ice_beam_gates
    dw #presets_spazer_upper_norfair_revisit_ice_maze_up
    dw #presets_spazer_upper_norfair_revisit_ice_maze_down
    dw #presets_spazer_upper_norfair_revisit_ice_escape
    dw #presets_spazer_upper_norfair_revisit_purple_shaft_upper
    dw #presets_spazer_upper_norfair_revisit_magdollite_tunnel_upper
    dw #presets_spazer_upper_norfair_revisit_kronic_boost_upper
    dw #presets_spazer_upper_norfair_revisit_croc_speedway_lower
    dw #presets_spazer_upper_norfair_revisit_spiky_acid_snakes_lower
    dw #presets_spazer_upper_norfair_revisit_kronic_boost_lower
    dw #$0000
    %cm_header("UPPER NORFAIR REVISIT")

presets_submenu_spazer_lower_norfair:
    dw #presets_spazer_lower_norfair_ln_main_hall
    dw #presets_spazer_lower_norfair_prepillars
    dw #presets_spazer_lower_norfair_worst_room_in_the_game
    dw #presets_spazer_lower_norfair_amphitheatre
    dw #presets_spazer_lower_norfair_kihunter_stairs_down
    dw #presets_spazer_lower_norfair_wasteland
    dw #presets_spazer_lower_norfair_metal_ninja_pirates
    dw #presets_spazer_lower_norfair_plowerhouse
    dw #presets_spazer_lower_norfair_ridley
    dw #presets_spazer_lower_norfair_leaving_ridley
    dw #presets_spazer_lower_norfair_reverse_plowerhouse
    dw #presets_spazer_lower_norfair_wasteland_revisit
    dw #presets_spazer_lower_norfair_kihunter_stairs_up
    dw #presets_spazer_lower_norfair_fire_flea_room
    dw #presets_spazer_lower_norfair_springball_maze
    dw #presets_spazer_lower_norfair_three_musketeers
    dw #presets_spazer_lower_norfair_single_chamber_final
    dw #presets_spazer_lower_norfair_bubble_mountain_final
    dw #presets_spazer_lower_norfair_business_center_final
    dw #$0000
    %cm_header("LOWER NORFAIR")

presets_submenu_spazer_backtracking:
    dw #presets_spazer_backtracking_maridia_tube_revisit
    dw #presets_spazer_backtracking_fish_tank_revisit
    dw #presets_spazer_backtracking_mt_everest_revisit_revisit
    dw #presets_spazer_backtracking_red_brinstar_green_gate
    dw #presets_spazer_backtracking_crateria_kihunters_final
    dw #presets_spazer_backtracking_parlor_spacejump
    dw #presets_spazer_backtracking_terminator_revisit
    dw #presets_spazer_backtracking_green_pirate_shaft_revisit
    dw #$0000
    %cm_header("BACKTRACKING")

presets_submenu_spazer_tourian:
    dw #presets_spazer_tourian_metroids_1
    dw #presets_spazer_tourian_metroids_2
    dw #presets_spazer_tourian_metroids_3
    dw #presets_spazer_tourian_metroids_4
    dw #presets_spazer_tourian_giant_hoppers
    dw #presets_spazer_tourian_baby_skip
    dw #presets_spazer_tourian_gedora_room
    dw #presets_spazer_tourian_zeb_skip
    dw #presets_spazer_tourian_escape_room_3
    dw #presets_spazer_tourian_climb_spark
    dw #presets_spazer_tourian_escape_parlor
    dw #$0000
    %cm_header("TOURIAN")

; Crateria
presets_spazer_crateria_ceres_elevator:
    %cm_preset("Ceres Elevator", #preset_spazer_crateria_ceres_elevator)

presets_spazer_crateria_ceres_last_3_rooms:
    %cm_preset("Ceres Last 3 Rooms", #preset_spazer_crateria_ceres_last_3_rooms)

presets_spazer_crateria_ship:
    %cm_preset("Ship", #preset_spazer_crateria_ship)

presets_spazer_crateria_parlor:
    %cm_preset("Parlor", #preset_spazer_crateria_parlor)

presets_spazer_crateria_climb_down:
    %cm_preset("Climb Down", #preset_spazer_crateria_climb_down)

presets_spazer_crateria_pit_room:
    %cm_preset("Pit Room", #preset_spazer_crateria_pit_room)

presets_spazer_crateria_morph:
    %cm_preset("Morph", #preset_spazer_crateria_morph)

presets_spazer_crateria_construction_zone:
    %cm_preset("Construction Zone", #preset_spazer_crateria_construction_zone)

presets_spazer_crateria_construction_zone_revisit:
    %cm_preset("Construction Zone Revisit", #preset_spazer_crateria_construction_zone_revisit)

presets_spazer_crateria_pit_room_revisit:
    %cm_preset("Pit Room Revisit", #preset_spazer_crateria_pit_room_revisit)

presets_spazer_crateria_climb_up:
    %cm_preset("Climb Up", #preset_spazer_crateria_climb_up)

presets_spazer_crateria_parlor_revisit:
    %cm_preset("Parlor Revisit", #preset_spazer_crateria_parlor_revisit)

presets_spazer_crateria_flyway:
    %cm_preset("Flyway", #preset_spazer_crateria_flyway)

presets_spazer_crateria_bomb_torizo:
    %cm_preset("Bomb Torizo", #preset_spazer_crateria_bomb_torizo)

presets_spazer_crateria_alcatraz:
    %cm_preset("Alcatraz", #preset_spazer_crateria_alcatraz)

presets_spazer_crateria_terminator:
    %cm_preset("Terminator", #preset_spazer_crateria_terminator)

presets_spazer_crateria_green_pirate_shaft:
    %cm_preset("Green Pirate Shaft", #preset_spazer_crateria_green_pirate_shaft)


; Brinstar
presets_spazer_brinstar_green_brinstar_elevator:
    %cm_preset("Green Brinstar Elevator", #preset_spazer_brinstar_green_brinstar_elevator)

presets_spazer_brinstar_early_supers:
    %cm_preset("Early Supers", #preset_spazer_brinstar_early_supers)

presets_spazer_brinstar_dachora_room:
    %cm_preset("Dachora Room", #preset_spazer_brinstar_dachora_room)

presets_spazer_brinstar_big_pink:
    %cm_preset("Big Pink", #preset_spazer_brinstar_big_pink)

presets_spazer_brinstar_green_hill_zone:
    %cm_preset("Green Hill Zone", #preset_spazer_brinstar_green_hill_zone)

presets_spazer_brinstar_noob_bridge:
    %cm_preset("Noob Bridge", #preset_spazer_brinstar_noob_bridge)

presets_spazer_brinstar_red_tower:
    %cm_preset("Red Tower", #preset_spazer_brinstar_red_tower)

presets_spazer_brinstar_skree_boost:
    %cm_preset("Skree Boost", #preset_spazer_brinstar_skree_boost)

presets_spazer_brinstar_below_spazer:
    %cm_preset("Below Spazer", #preset_spazer_brinstar_below_spazer)

presets_spazer_brinstar_entering_kraids_lair:
    %cm_preset("Entering Kraid's Lair", #preset_spazer_brinstar_entering_kraids_lair)

presets_spazer_brinstar_kraid_kihunters:
    %cm_preset("Kraid Kihunters", #preset_spazer_brinstar_kraid_kihunters)

presets_spazer_brinstar_mini_kraid:
    %cm_preset("Mini Kraid", #preset_spazer_brinstar_mini_kraid)

presets_spazer_brinstar_kraid:
    %cm_preset("Kraid", #preset_spazer_brinstar_kraid)

presets_spazer_brinstar_leaving_varia:
    %cm_preset("Leaving Varia", #preset_spazer_brinstar_leaving_varia)

presets_spazer_brinstar_mini_kraid_revisit:
    %cm_preset("Mini Kraid Revisit", #preset_spazer_brinstar_mini_kraid_revisit)

presets_spazer_brinstar_kraid_kihunters_revisit:
    %cm_preset("Kraid Kihunters Revisit", #preset_spazer_brinstar_kraid_kihunters_revisit)

presets_spazer_brinstar_kraid_etank:
    %cm_preset("Kraid E-tank", #preset_spazer_brinstar_kraid_etank)


; Upper Norfair
presets_spazer_upper_norfair_business_center:
    %cm_preset("Business Center", #preset_spazer_upper_norfair_business_center)

presets_spazer_upper_norfair_hi_jump_etank:
    %cm_preset("Hi Jump E-tank", #preset_spazer_upper_norfair_hi_jump_etank)

presets_spazer_upper_norfair_leaving_hi_jump:
    %cm_preset("Leaving Hi Jump", #preset_spazer_upper_norfair_leaving_hi_jump)

presets_spazer_upper_norfair_business_center_2:
    %cm_preset("Business Center 2", #preset_spazer_upper_norfair_business_center_2)

presets_spazer_upper_norfair_precathedral:
    %cm_preset("Pre-Cathedral", #preset_spazer_upper_norfair_precathedral)

presets_spazer_upper_norfair_cathedral:
    %cm_preset("Cathedral", #preset_spazer_upper_norfair_cathedral)

presets_spazer_upper_norfair_rising_tide:
    %cm_preset("Rising Tide", #preset_spazer_upper_norfair_rising_tide)

presets_spazer_upper_norfair_bubble_mountain:
    %cm_preset("Bubble Mountain", #preset_spazer_upper_norfair_bubble_mountain)

presets_spazer_upper_norfair_bat_cave:
    %cm_preset("Bat Cave", #preset_spazer_upper_norfair_bat_cave)

presets_spazer_upper_norfair_single_chamber:
    %cm_preset("Single Chamber", #preset_spazer_upper_norfair_single_chamber)

presets_spazer_upper_norfair_double_chamber:
    %cm_preset("Double Chamber", #preset_spazer_upper_norfair_double_chamber)

presets_spazer_upper_norfair_double_chamber_revisit:
    %cm_preset("Double Chamber Revisit", #preset_spazer_upper_norfair_double_chamber_revisit)

presets_spazer_upper_norfair_single_chamber_revisit:
    %cm_preset("Single Chamber Revisit", #preset_spazer_upper_norfair_single_chamber_revisit)

presets_spazer_upper_norfair_bubble_mountain_revisit:
    %cm_preset("Bubble Mountain Revisit", #preset_spazer_upper_norfair_bubble_mountain_revisit)

presets_spazer_upper_norfair_frog_speedway:
    %cm_preset("Frog Speedway", #preset_spazer_upper_norfair_frog_speedway)

presets_spazer_upper_norfair_business_center_3:
    %cm_preset("Business Center 3", #preset_spazer_upper_norfair_business_center_3)


; Red Brinstar
presets_spazer_red_brinstar_alpha_spark:
    %cm_preset("Alpha Spark", #preset_spazer_red_brinstar_alpha_spark)

presets_spazer_red_brinstar_reverse_skree_boost:
    %cm_preset("Reverse Skree Boost", #preset_spazer_red_brinstar_reverse_skree_boost)

presets_spazer_red_brinstar_red_tower_climb:
    %cm_preset("Red Tower Climb", #preset_spazer_red_brinstar_red_tower_climb)

presets_spazer_red_brinstar_hellway:
    %cm_preset("Hellway", #preset_spazer_red_brinstar_hellway)

presets_spazer_red_brinstar_caterpillars_down:
    %cm_preset("Caterpillars Down", #preset_spazer_red_brinstar_caterpillars_down)

presets_spazer_red_brinstar_alpha_power_bombs:
    %cm_preset("Alpha Power Bombs", #preset_spazer_red_brinstar_alpha_power_bombs)

presets_spazer_red_brinstar_caterpillars_up:
    %cm_preset("Caterpillars Up", #preset_spazer_red_brinstar_caterpillars_up)


; Wrecked Ship
presets_spazer_wrecked_ship_crateria_kihunters:
    %cm_preset("Crateria Kihunters", #preset_spazer_wrecked_ship_crateria_kihunters)

presets_spazer_wrecked_ship_oceanfly_setup:
    %cm_preset("Oceanfly Setup", #preset_spazer_wrecked_ship_oceanfly_setup)

presets_spazer_wrecked_ship_ocean_spark:
    %cm_preset("Ocean Spark", #preset_spazer_wrecked_ship_ocean_spark)

presets_spazer_wrecked_ship_entering_wrecked_ship:
    %cm_preset("Entering Wrecked Ship", #preset_spazer_wrecked_ship_entering_wrecked_ship)

presets_spazer_wrecked_ship_basement:
    %cm_preset("Basement", #preset_spazer_wrecked_ship_basement)

presets_spazer_wrecked_ship_phantoon:
    %cm_preset("Phantoon", #preset_spazer_wrecked_ship_phantoon)

presets_spazer_wrecked_ship_leaving_phantoon:
    %cm_preset("Leaving Phantoon", #preset_spazer_wrecked_ship_leaving_phantoon)

presets_spazer_wrecked_ship_shaft_to_supers:
    %cm_preset("Shaft to Supers", #preset_spazer_wrecked_ship_shaft_to_supers)

presets_spazer_wrecked_ship_wrecked_ship_shaft:
    %cm_preset("Wrecked Ship Shaft", #preset_spazer_wrecked_ship_wrecked_ship_shaft)

presets_spazer_wrecked_ship_attic:
    %cm_preset("Attic", #preset_spazer_wrecked_ship_attic)

presets_spazer_wrecked_ship_upper_west_ocean:
    %cm_preset("Upper West Ocean", #preset_spazer_wrecked_ship_upper_west_ocean)

presets_spazer_wrecked_ship_pancakes_and_wavers:
    %cm_preset("Pancakes and Wavers", #preset_spazer_wrecked_ship_pancakes_and_wavers)

presets_spazer_wrecked_ship_bowling_spark:
    %cm_preset("Bowling Spark", #preset_spazer_wrecked_ship_bowling_spark)

presets_spazer_wrecked_ship_leaving_gravity:
    %cm_preset("Leaving Gravity", #preset_spazer_wrecked_ship_leaving_gravity)

presets_spazer_wrecked_ship_moat_ball:
    %cm_preset("Moat Ball", #preset_spazer_wrecked_ship_moat_ball)

presets_spazer_wrecked_ship_crateria_kihunters_return:
    %cm_preset("Crateria Kihunters Return", #preset_spazer_wrecked_ship_crateria_kihunters_return)


; Red Brinstar Final
presets_spazer_red_brinstar_final_red_tower_elevator:
    %cm_preset("Red Tower Elevator", #preset_spazer_red_brinstar_final_red_tower_elevator)

presets_spazer_red_brinstar_final_hellway_revisit:
    %cm_preset("Hellway Revisit", #preset_spazer_red_brinstar_final_hellway_revisit)

presets_spazer_red_brinstar_final_red_tower_down:
    %cm_preset("Red Tower Down", #preset_spazer_red_brinstar_final_red_tower_down)

presets_spazer_red_brinstar_final_skree_boost_final:
    %cm_preset("Skree Boost Final", #preset_spazer_red_brinstar_final_skree_boost_final)

presets_spazer_red_brinstar_final_below_spazer_final:
    %cm_preset("Below Spazer Final", #preset_spazer_red_brinstar_final_below_spazer_final)


; Maridia
presets_spazer_maridia_breaking_tube:
    %cm_preset("Breaking Tube", #preset_spazer_maridia_breaking_tube)

presets_spazer_maridia_fish_tank:
    %cm_preset("Fish Tank", #preset_spazer_maridia_fish_tank)

presets_spazer_maridia_mt_everest:
    %cm_preset("Mt Everest", #preset_spazer_maridia_mt_everest)

presets_spazer_maridia_crab_shaft:
    %cm_preset("Crab Shaft", #preset_spazer_maridia_crab_shaft)

presets_spazer_maridia_aqueduct:
    %cm_preset("Aqueduct", #preset_spazer_maridia_aqueduct)

presets_spazer_maridia_botwoon_hallway:
    %cm_preset("Botwoon Hallway", #preset_spazer_maridia_botwoon_hallway)

presets_spazer_maridia_botwoon:
    %cm_preset("Botwoon", #preset_spazer_maridia_botwoon)

presets_spazer_maridia_botwoon_etank:
    %cm_preset("Botwoon E-tank", #preset_spazer_maridia_botwoon_etank)

presets_spazer_maridia_halfie_setup:
    %cm_preset("Halfie Setup", #preset_spazer_maridia_halfie_setup)

presets_spazer_maridia_draygon:
    %cm_preset("Draygon", #preset_spazer_maridia_draygon)

presets_spazer_maridia_reverse_halfie_spikesuit:
    %cm_preset("Reverse Halfie (Spikesuit)", #preset_spazer_maridia_reverse_halfie_spikesuit)

presets_spazer_maridia_womple_jump:
    %cm_preset("Womple Jump", #preset_spazer_maridia_womple_jump)

presets_spazer_maridia_cac_alley_east:
    %cm_preset("Cac Alley East", #preset_spazer_maridia_cac_alley_east)

presets_spazer_maridia_cac_alley_west:
    %cm_preset("Cac Alley West", #preset_spazer_maridia_cac_alley_west)

presets_spazer_maridia_plasma_spark:
    %cm_preset("Plasma Spark", #preset_spazer_maridia_plasma_spark)

presets_spazer_maridia_plasma_climb:
    %cm_preset("Plasma Climb", #preset_spazer_maridia_plasma_climb)

presets_spazer_maridia_plasma_beam:
    %cm_preset("Plasma Beam", #preset_spazer_maridia_plasma_beam)

presets_spazer_maridia_plasma_spark_revisit:
    %cm_preset("Plasma Spark Revisit", #preset_spazer_maridia_plasma_spark_revisit)

presets_spazer_maridia_toilet:
    %cm_preset("Toilet", #preset_spazer_maridia_toilet)

presets_spazer_maridia_sewers:
    %cm_preset("Sewers", #preset_spazer_maridia_sewers)

presets_spazer_maridia_lower_maridia_gate:
    %cm_preset("Lower Maridia Gate", #preset_spazer_maridia_lower_maridia_gate)


; Upper Norfair Revisit
presets_spazer_upper_norfair_revisit_ice_beam_gates:
    %cm_preset("Ice Beam Gates", #preset_spazer_upper_norfair_revisit_ice_beam_gates)

presets_spazer_upper_norfair_revisit_ice_maze_up:
    %cm_preset("Ice Maze Up", #preset_spazer_upper_norfair_revisit_ice_maze_up)

presets_spazer_upper_norfair_revisit_ice_maze_down:
    %cm_preset("Ice Maze Down", #preset_spazer_upper_norfair_revisit_ice_maze_down)

presets_spazer_upper_norfair_revisit_ice_escape:
    %cm_preset("Ice Escape", #preset_spazer_upper_norfair_revisit_ice_escape)

presets_spazer_upper_norfair_revisit_purple_shaft_upper:
    %cm_preset("Purple Shaft (Upper)", #preset_spazer_upper_norfair_revisit_purple_shaft_upper)

presets_spazer_upper_norfair_revisit_magdollite_tunnel_upper:
    %cm_preset("Magdollite Tunnel (Upper)", #preset_spazer_upper_norfair_revisit_magdollite_tunnel_upper)

presets_spazer_upper_norfair_revisit_kronic_boost_upper:
    %cm_preset("Kronic Boost (Upper)", #preset_spazer_upper_norfair_revisit_kronic_boost_upper)

presets_spazer_upper_norfair_revisit_croc_speedway_lower:
    %cm_preset("Croc Speedway (Lower)", #preset_spazer_upper_norfair_revisit_croc_speedway_lower)

presets_spazer_upper_norfair_revisit_spiky_acid_snakes_lower:
    %cm_preset("Spiky Acid Snakes (Lower)", #preset_spazer_upper_norfair_revisit_spiky_acid_snakes_lower)

presets_spazer_upper_norfair_revisit_kronic_boost_lower:
    %cm_preset("Kronic Boost (Lower)", #preset_spazer_upper_norfair_revisit_kronic_boost_lower)


; Lower Norfair
presets_spazer_lower_norfair_ln_main_hall:
    %cm_preset("LN Main Hall", #preset_spazer_lower_norfair_ln_main_hall)

presets_spazer_lower_norfair_prepillars:
    %cm_preset("Pre-Pillars", #preset_spazer_lower_norfair_prepillars)

presets_spazer_lower_norfair_worst_room_in_the_game:
    %cm_preset("Worst Room in the Game", #preset_spazer_lower_norfair_worst_room_in_the_game)

presets_spazer_lower_norfair_amphitheatre:
    %cm_preset("Amphitheatre", #preset_spazer_lower_norfair_amphitheatre)

presets_spazer_lower_norfair_kihunter_stairs_down:
    %cm_preset("Kihunter Stairs Down", #preset_spazer_lower_norfair_kihunter_stairs_down)

presets_spazer_lower_norfair_wasteland:
    %cm_preset("Wasteland", #preset_spazer_lower_norfair_wasteland)

presets_spazer_lower_norfair_metal_ninja_pirates:
    %cm_preset("Metal Ninja Pirates", #preset_spazer_lower_norfair_metal_ninja_pirates)

presets_spazer_lower_norfair_plowerhouse:
    %cm_preset("Plowerhouse", #preset_spazer_lower_norfair_plowerhouse)

presets_spazer_lower_norfair_ridley:
    %cm_preset("Ridley", #preset_spazer_lower_norfair_ridley)

presets_spazer_lower_norfair_leaving_ridley:
    %cm_preset("Leaving Ridley", #preset_spazer_lower_norfair_leaving_ridley)

presets_spazer_lower_norfair_reverse_plowerhouse:
    %cm_preset("Reverse Plowerhouse", #preset_spazer_lower_norfair_reverse_plowerhouse)

presets_spazer_lower_norfair_wasteland_revisit:
    %cm_preset("Wasteland Revisit", #preset_spazer_lower_norfair_wasteland_revisit)

presets_spazer_lower_norfair_kihunter_stairs_up:
    %cm_preset("Kihunter Stairs Up", #preset_spazer_lower_norfair_kihunter_stairs_up)

presets_spazer_lower_norfair_fire_flea_room:
    %cm_preset("Fire Flea Room", #preset_spazer_lower_norfair_fire_flea_room)

presets_spazer_lower_norfair_springball_maze:
    %cm_preset("Springball Maze", #preset_spazer_lower_norfair_springball_maze)

presets_spazer_lower_norfair_three_musketeers:
    %cm_preset("Three Musketeers", #preset_spazer_lower_norfair_three_musketeers)

presets_spazer_lower_norfair_single_chamber_final:
    %cm_preset("Single Chamber Final", #preset_spazer_lower_norfair_single_chamber_final)

presets_spazer_lower_norfair_bubble_mountain_final:
    %cm_preset("Bubble Mountain Final", #preset_spazer_lower_norfair_bubble_mountain_final)

presets_spazer_lower_norfair_business_center_final:
    %cm_preset("Business Center Final", #preset_spazer_lower_norfair_business_center_final)


; Backtracking
presets_spazer_backtracking_maridia_tube_revisit:
    %cm_preset("Maridia Tube Revisit", #preset_spazer_backtracking_maridia_tube_revisit)

presets_spazer_backtracking_fish_tank_revisit:
    %cm_preset("Fish Tank Revisit", #preset_spazer_backtracking_fish_tank_revisit)

presets_spazer_backtracking_mt_everest_revisit_revisit:
    %cm_preset("Mt Everest Revisit Revisit", #preset_spazer_backtracking_mt_everest_revisit_revisit)

presets_spazer_backtracking_red_brinstar_green_gate:
    %cm_preset("Red Brinstar Green Gate", #preset_spazer_backtracking_red_brinstar_green_gate)

presets_spazer_backtracking_crateria_kihunters_final:
    %cm_preset("Crateria Kihunters Final", #preset_spazer_backtracking_crateria_kihunters_final)

presets_spazer_backtracking_parlor_spacejump:
    %cm_preset("Parlor Spacejump", #preset_spazer_backtracking_parlor_spacejump)

presets_spazer_backtracking_terminator_revisit:
    %cm_preset("Terminator Revisit", #preset_spazer_backtracking_terminator_revisit)

presets_spazer_backtracking_green_pirate_shaft_revisit:
    %cm_preset("Green Pirate Shaft Revisit", #preset_spazer_backtracking_green_pirate_shaft_revisit)


; Tourian
presets_spazer_tourian_metroids_1:
    %cm_preset("Metroids 1", #preset_spazer_tourian_metroids_1)

presets_spazer_tourian_metroids_2:
    %cm_preset("Metroids 2", #preset_spazer_tourian_metroids_2)

presets_spazer_tourian_metroids_3:
    %cm_preset("Metroids 3", #preset_spazer_tourian_metroids_3)

presets_spazer_tourian_metroids_4:
    %cm_preset("Metroids 4", #preset_spazer_tourian_metroids_4)

presets_spazer_tourian_giant_hoppers:
    %cm_preset("Giant Hoppers", #preset_spazer_tourian_giant_hoppers)

presets_spazer_tourian_baby_skip:
    %cm_preset("Baby Skip", #preset_spazer_tourian_baby_skip)

presets_spazer_tourian_gedora_room:
    %cm_preset("Gedora Room", #preset_spazer_tourian_gedora_room)

presets_spazer_tourian_zeb_skip:
    %cm_preset("Zeb Skip", #preset_spazer_tourian_zeb_skip)

presets_spazer_tourian_escape_room_3:
    %cm_preset("Escape Room 3", #preset_spazer_tourian_escape_room_3)

presets_spazer_tourian_climb_spark:
    %cm_preset("Climb Spark", #preset_spazer_tourian_climb_spark)

presets_spazer_tourian_escape_parlor:
    %cm_preset("Escape Parlor", #preset_spazer_tourian_escape_parlor)


