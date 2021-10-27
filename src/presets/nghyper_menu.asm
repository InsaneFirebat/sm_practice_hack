PresetsMenuNghyper:
    dw #presets_goto_nghyper_ceres_station
    dw #presets_goto_nghyper_wrecked_ship
    dw #presets_goto_nghyper_red_tower
    dw #presets_goto_nghyper_norfair_preridley
    dw #presets_goto_nghyper_norfair_postridley
    dw #presets_goto_nghyper_kraids_lair
    dw #presets_goto_nghyper_maridia
    dw #presets_goto_nghyper_crateria
    dw #presets_goto_nghyper_tourian
    dw #$0000
    %cm_header("NEWGAME+ HYPER BEAM")

presets_goto_nghyper_ceres_station:
    %cm_submenu("Ceres Station", #presets_submenu_nghyper_ceres_station)

presets_goto_nghyper_wrecked_ship:
    %cm_submenu("Wrecked Ship", #presets_submenu_nghyper_wrecked_ship)

presets_goto_nghyper_red_tower:
    %cm_submenu("Red Tower", #presets_submenu_nghyper_red_tower)

presets_goto_nghyper_norfair_preridley:
    %cm_submenu("Norfair Pre-Ridley", #presets_submenu_nghyper_norfair_preridley)

presets_goto_nghyper_norfair_postridley:
    %cm_submenu("Norfair Post-Ridley", #presets_submenu_nghyper_norfair_postridley)

presets_goto_nghyper_kraids_lair:
    %cm_submenu("Kraid's Lair", #presets_submenu_nghyper_kraids_lair)

presets_goto_nghyper_maridia:
    %cm_submenu("Maridia", #presets_submenu_nghyper_maridia)

presets_goto_nghyper_crateria:
    %cm_submenu("Crateria", #presets_submenu_nghyper_crateria)

presets_goto_nghyper_tourian:
    %cm_submenu("Tourian", #presets_submenu_nghyper_tourian)

presets_submenu_nghyper_ceres_station:
    dw #presets_nghyper_ceres_station_ceres_elevator
    dw #presets_nghyper_ceres_station_magnet_stairs
    dw #presets_nghyper_ceres_station_ceres_ridley
    dw #presets_nghyper_ceres_station_magnet_stairs_escape
    dw #$0000
    %cm_header("CERES STATION")

presets_submenu_nghyper_wrecked_ship:
    dw #presets_nghyper_wrecked_ship_ship
    dw #presets_nghyper_wrecked_ship_moat
    dw #presets_nghyper_wrecked_ship_ocean
    dw #presets_nghyper_wrecked_ship_entering_wrecked_ship
    dw #presets_nghyper_wrecked_ship_phantoon
    dw #presets_nghyper_wrecked_ship_wrecked_ship_shaft
    dw #presets_nghyper_wrecked_ship_leaving_wrecked_ship
    dw #presets_nghyper_wrecked_ship_kihunters_revisit
    dw #$0000
    %cm_header("WRECKED SHIP")

presets_submenu_nghyper_red_tower:
    dw #presets_nghyper_red_tower_red_brinstar_elevator
    dw #presets_nghyper_red_tower_hellway
    dw #presets_nghyper_red_tower_red_tower_2
    dw #presets_nghyper_red_tower_skree_boost
    dw #presets_nghyper_red_tower_below_spazer
    dw #presets_nghyper_red_tower_breaking_maridia_tube
    dw #$0000
    %cm_header("RED TOWER")

presets_submenu_nghyper_norfair_preridley:
    dw #presets_nghyper_norfair_preridley_business_center
    dw #presets_nghyper_norfair_preridley_frog_speedway
    dw #presets_nghyper_norfair_preridley_kronic_boost
    dw #presets_nghyper_norfair_preridley_ln_main_hall
    dw #presets_nghyper_norfair_preridley_fast_pillars_setup
    dw #presets_nghyper_norfair_preridley_worst_room_in_the_game
    dw #presets_nghyper_norfair_preridley_amphitheatre
    dw #presets_nghyper_norfair_preridley_kihunter_stairs
    dw #presets_nghyper_norfair_preridley_wasteland
    dw #presets_nghyper_norfair_preridley_metal_pirates
    dw #presets_nghyper_norfair_preridley_plowerhouse
    dw #presets_nghyper_norfair_preridley_ridley
    dw #$0000
    %cm_header("NORFAIR PRE-RIDLEY")

presets_submenu_nghyper_norfair_postridley:
    dw #presets_nghyper_norfair_postridley_leaving_ridley
    dw #presets_nghyper_norfair_postridley_reverse_plowerhouse
    dw #presets_nghyper_norfair_postridley_wasteland_revisit
    dw #presets_nghyper_norfair_postridley_kihunter_stairs_revisit
    dw #presets_nghyper_norfair_postridley_fireflea_room
    dw #presets_nghyper_norfair_postridley_springball_maze
    dw #presets_nghyper_norfair_postridley_three_musketeers
    dw #presets_nghyper_norfair_postridley_double_chamber
    dw #presets_nghyper_norfair_postridley_bubble_mountain
    dw #presets_nghyper_norfair_postridley_business_center_revisit
    dw #$0000
    %cm_header("NORFAIR POST-RIDLEY")

presets_submenu_nghyper_kraids_lair:
    dw #presets_nghyper_kraids_lair_entering_kraids_lair
    dw #presets_nghyper_kraids_lair_warehouse_kihunters
    dw #presets_nghyper_kraids_lair_kraid_hallway
    dw #presets_nghyper_kraids_lair_kraid
    dw #presets_nghyper_kraids_lair_leaving_kraid
    dw #presets_nghyper_kraids_lair_kraid_hallway_revisit
    dw #presets_nghyper_kraids_lair_warehouse_zealas
    dw #presets_nghyper_kraids_lair_leaving_kraids_lair
    dw #$0000
    %cm_header("KRAID'S LAIR")

presets_submenu_nghyper_maridia:
    dw #presets_nghyper_maridia_entering_maridia
    dw #presets_nghyper_maridia_fish_tank
    dw #presets_nghyper_maridia_mt_everest
    dw #presets_nghyper_maridia_aqueduct
    dw #presets_nghyper_maridia_botwoon
    dw #presets_nghyper_maridia_halfie
    dw #presets_nghyper_maridia_draygon
    dw #presets_nghyper_maridia_womple_jump
    dw #presets_nghyper_maridia_reverse_botwoon_hallway
    dw #presets_nghyper_maridia_aqueduct_revisit
    dw #presets_nghyper_maridia_crab_shaft_revisit
    dw #presets_nghyper_maridia_mt_everest_revisit
    dw #$0000
    %cm_header("MARIDIA")

presets_submenu_nghyper_crateria:
    dw #presets_nghyper_crateria_red_brinstar_gate
    dw #presets_nghyper_crateria_crateria_kihunters_final
    dw #presets_nghyper_crateria_landing_site
    dw #presets_nghyper_crateria_terminator_etank
    dw #presets_nghyper_crateria_green_pirate_shaft
    dw #$0000
    %cm_header("CRATERIA")

presets_submenu_nghyper_tourian:
    dw #presets_nghyper_tourian_metroids_1
    dw #presets_nghyper_tourian_metroids_2
    dw #presets_nghyper_tourian_metroids_3
    dw #presets_nghyper_tourian_metroids_4
    dw #presets_nghyper_tourian_baby_skip
    dw #presets_nghyper_tourian_gadora_room
    dw #presets_nghyper_tourian_mother_brain_room
    dw #presets_nghyper_tourian_escape_room_3
    dw #presets_nghyper_tourian_escape_room_4
    dw #presets_nghyper_tourian_escape_parlor
    dw #$0000
    %cm_header("TOURIAN")

; Ceres Station
presets_nghyper_ceres_station_ceres_elevator:
    %cm_preset("Ceres Elevator", #preset_nghyper_ceres_station_ceres_elevator)

presets_nghyper_ceres_station_magnet_stairs:
    %cm_preset("Magnet Stairs", #preset_nghyper_ceres_station_magnet_stairs)

presets_nghyper_ceres_station_ceres_ridley:
    %cm_preset("Ceres Ridley", #preset_nghyper_ceres_station_ceres_ridley)

presets_nghyper_ceres_station_magnet_stairs_escape:
    %cm_preset("Magnet Stairs Escape", #preset_nghyper_ceres_station_magnet_stairs_escape)


; Wrecked Ship
presets_nghyper_wrecked_ship_ship:
    %cm_preset("Ship", #preset_nghyper_wrecked_ship_ship)

presets_nghyper_wrecked_ship_moat:
    %cm_preset("Moat", #preset_nghyper_wrecked_ship_moat)

presets_nghyper_wrecked_ship_ocean:
    %cm_preset("Ocean", #preset_nghyper_wrecked_ship_ocean)

presets_nghyper_wrecked_ship_entering_wrecked_ship:
    %cm_preset("Entering Wrecked Ship", #preset_nghyper_wrecked_ship_entering_wrecked_ship)

presets_nghyper_wrecked_ship_phantoon:
    %cm_preset("Phantoon", #preset_nghyper_wrecked_ship_phantoon)

presets_nghyper_wrecked_ship_wrecked_ship_shaft:
    %cm_preset("Wrecked Ship Shaft", #preset_nghyper_wrecked_ship_wrecked_ship_shaft)

presets_nghyper_wrecked_ship_leaving_wrecked_ship:
    %cm_preset("Leaving Wrecked Ship", #preset_nghyper_wrecked_ship_leaving_wrecked_ship)

presets_nghyper_wrecked_ship_kihunters_revisit:
    %cm_preset("Kihunters Revisit", #preset_nghyper_wrecked_ship_kihunters_revisit)


; Red Tower
presets_nghyper_red_tower_red_brinstar_elevator:
    %cm_preset("Red Brinstar Elevator", #preset_nghyper_red_tower_red_brinstar_elevator)

presets_nghyper_red_tower_hellway:
    %cm_preset("Hellway", #preset_nghyper_red_tower_hellway)

presets_nghyper_red_tower_red_tower_2:
    %cm_preset("Red Tower", #preset_nghyper_red_tower_red_tower_2)

presets_nghyper_red_tower_skree_boost:
    %cm_preset("Skree Boost", #preset_nghyper_red_tower_skree_boost)

presets_nghyper_red_tower_below_spazer:
    %cm_preset("Below Spazer", #preset_nghyper_red_tower_below_spazer)

presets_nghyper_red_tower_breaking_maridia_tube:
    %cm_preset("Breaking Maridia Tube", #preset_nghyper_red_tower_breaking_maridia_tube)


; Norfair Pre-Ridley
presets_nghyper_norfair_preridley_business_center:
    %cm_preset("Business Center", #preset_nghyper_norfair_preridley_business_center)

presets_nghyper_norfair_preridley_frog_speedway:
    %cm_preset("Frog Speedway", #preset_nghyper_norfair_preridley_frog_speedway)

presets_nghyper_norfair_preridley_kronic_boost:
    %cm_preset("Kronic Boost", #preset_nghyper_norfair_preridley_kronic_boost)

presets_nghyper_norfair_preridley_ln_main_hall:
    %cm_preset("LN Main Hall", #preset_nghyper_norfair_preridley_ln_main_hall)

presets_nghyper_norfair_preridley_fast_pillars_setup:
    %cm_preset("Fast Pillars Setup", #preset_nghyper_norfair_preridley_fast_pillars_setup)

presets_nghyper_norfair_preridley_worst_room_in_the_game:
    %cm_preset("Worst Room in the Game", #preset_nghyper_norfair_preridley_worst_room_in_the_game)

presets_nghyper_norfair_preridley_amphitheatre:
    %cm_preset("Amphitheatre", #preset_nghyper_norfair_preridley_amphitheatre)

presets_nghyper_norfair_preridley_kihunter_stairs:
    %cm_preset("Kihunter Stairs", #preset_nghyper_norfair_preridley_kihunter_stairs)

presets_nghyper_norfair_preridley_wasteland:
    %cm_preset("Wasteland", #preset_nghyper_norfair_preridley_wasteland)

presets_nghyper_norfair_preridley_metal_pirates:
    %cm_preset("Metal Pirates", #preset_nghyper_norfair_preridley_metal_pirates)

presets_nghyper_norfair_preridley_plowerhouse:
    %cm_preset("Plowerhouse", #preset_nghyper_norfair_preridley_plowerhouse)

presets_nghyper_norfair_preridley_ridley:
    %cm_preset("Ridley", #preset_nghyper_norfair_preridley_ridley)


; Norfair Post-Ridley
presets_nghyper_norfair_postridley_leaving_ridley:
    %cm_preset("Leaving Ridley", #preset_nghyper_norfair_postridley_leaving_ridley)

presets_nghyper_norfair_postridley_reverse_plowerhouse:
    %cm_preset("Reverse Plowerhouse", #preset_nghyper_norfair_postridley_reverse_plowerhouse)

presets_nghyper_norfair_postridley_wasteland_revisit:
    %cm_preset("Wasteland Revisit", #preset_nghyper_norfair_postridley_wasteland_revisit)

presets_nghyper_norfair_postridley_kihunter_stairs_revisit:
    %cm_preset("Kihunter Stairs Revisit", #preset_nghyper_norfair_postridley_kihunter_stairs_revisit)

presets_nghyper_norfair_postridley_fireflea_room:
    %cm_preset("Fireflea Room", #preset_nghyper_norfair_postridley_fireflea_room)

presets_nghyper_norfair_postridley_springball_maze:
    %cm_preset("Springball Maze", #preset_nghyper_norfair_postridley_springball_maze)

presets_nghyper_norfair_postridley_three_musketeers:
    %cm_preset("Three Musketeers", #preset_nghyper_norfair_postridley_three_musketeers)

presets_nghyper_norfair_postridley_double_chamber:
    %cm_preset("Double Chamber", #preset_nghyper_norfair_postridley_double_chamber)

presets_nghyper_norfair_postridley_bubble_mountain:
    %cm_preset("Bubble Mountain", #preset_nghyper_norfair_postridley_bubble_mountain)

presets_nghyper_norfair_postridley_business_center_revisit:
    %cm_preset("Business Center Revisit", #preset_nghyper_norfair_postridley_business_center_revisit)


; Kraids Lair
presets_nghyper_kraids_lair_entering_kraids_lair:
    %cm_preset("Entering Kraid's Lair", #preset_nghyper_kraids_lair_entering_kraids_lair)

presets_nghyper_kraids_lair_warehouse_kihunters:
    %cm_preset("Warehouse Kihunters", #preset_nghyper_kraids_lair_warehouse_kihunters)

presets_nghyper_kraids_lair_kraid_hallway:
    %cm_preset("Kraid Hallway", #preset_nghyper_kraids_lair_kraid_hallway)

presets_nghyper_kraids_lair_kraid:
    %cm_preset("Kraid", #preset_nghyper_kraids_lair_kraid)

presets_nghyper_kraids_lair_leaving_kraid:
    %cm_preset("Leaving Kraid", #preset_nghyper_kraids_lair_leaving_kraid)

presets_nghyper_kraids_lair_kraid_hallway_revisit:
    %cm_preset("Kraid Hallway Revisit", #preset_nghyper_kraids_lair_kraid_hallway_revisit)

presets_nghyper_kraids_lair_warehouse_zealas:
    %cm_preset("Warehouse Zealas", #preset_nghyper_kraids_lair_warehouse_zealas)

presets_nghyper_kraids_lair_leaving_kraids_lair:
    %cm_preset("Leaving Kraid's Lair", #preset_nghyper_kraids_lair_leaving_kraids_lair)


; Maridia
presets_nghyper_maridia_entering_maridia:
    %cm_preset("Entering Maridia", #preset_nghyper_maridia_entering_maridia)

presets_nghyper_maridia_fish_tank:
    %cm_preset("Fish Tank", #preset_nghyper_maridia_fish_tank)

presets_nghyper_maridia_mt_everest:
    %cm_preset("Mt Everest", #preset_nghyper_maridia_mt_everest)

presets_nghyper_maridia_aqueduct:
    %cm_preset("Aqueduct", #preset_nghyper_maridia_aqueduct)

presets_nghyper_maridia_botwoon:
    %cm_preset("Botwoon", #preset_nghyper_maridia_botwoon)

presets_nghyper_maridia_halfie:
    %cm_preset("Halfie", #preset_nghyper_maridia_halfie)

presets_nghyper_maridia_draygon:
    %cm_preset("Draygon", #preset_nghyper_maridia_draygon)

presets_nghyper_maridia_womple_jump:
    %cm_preset("Womple Jump", #preset_nghyper_maridia_womple_jump)

presets_nghyper_maridia_reverse_botwoon_hallway:
    %cm_preset("Reverse Botwoon Hallway", #preset_nghyper_maridia_reverse_botwoon_hallway)

presets_nghyper_maridia_aqueduct_revisit:
    %cm_preset("Aqueduct Revisit", #preset_nghyper_maridia_aqueduct_revisit)

presets_nghyper_maridia_crab_shaft_revisit:
    %cm_preset("Crab Shaft Revisit", #preset_nghyper_maridia_crab_shaft_revisit)

presets_nghyper_maridia_mt_everest_revisit:
    %cm_preset("Mt Everest Revisit", #preset_nghyper_maridia_mt_everest_revisit)


; Crateria
presets_nghyper_crateria_red_brinstar_gate:
    %cm_preset("Red Brinstar Gate", #preset_nghyper_crateria_red_brinstar_gate)

presets_nghyper_crateria_crateria_kihunters_final:
    %cm_preset("Crateria Kihunters Final", #preset_nghyper_crateria_crateria_kihunters_final)

presets_nghyper_crateria_landing_site:
    %cm_preset("Landing Site", #preset_nghyper_crateria_landing_site)

presets_nghyper_crateria_terminator_etank:
    %cm_preset("Terminator Etank", #preset_nghyper_crateria_terminator_etank)

presets_nghyper_crateria_green_pirate_shaft:
    %cm_preset("Green Pirate Shaft", #preset_nghyper_crateria_green_pirate_shaft)


; Tourian
presets_nghyper_tourian_metroids_1:
    %cm_preset("Metroids 1", #preset_nghyper_tourian_metroids_1)

presets_nghyper_tourian_metroids_2:
    %cm_preset("Metroids 2", #preset_nghyper_tourian_metroids_2)

presets_nghyper_tourian_metroids_3:
    %cm_preset("Metroids 3", #preset_nghyper_tourian_metroids_3)

presets_nghyper_tourian_metroids_4:
    %cm_preset("Metroids 4", #preset_nghyper_tourian_metroids_4)

presets_nghyper_tourian_baby_skip:
    %cm_preset("Baby Skip", #preset_nghyper_tourian_baby_skip)

presets_nghyper_tourian_gadora_room:
    %cm_preset("Gadora Room", #preset_nghyper_tourian_gadora_room)

presets_nghyper_tourian_mother_brain_room:
    %cm_preset("Mother Brain Room", #preset_nghyper_tourian_mother_brain_room)

presets_nghyper_tourian_escape_room_3:
    %cm_preset("Escape Room 3", #preset_nghyper_tourian_escape_room_3)

presets_nghyper_tourian_escape_room_4:
    %cm_preset("Escape Room 4", #preset_nghyper_tourian_escape_room_4)

presets_nghyper_tourian_escape_parlor:
    %cm_preset("Escape Parlor", #preset_nghyper_tourian_escape_parlor)


