PresetsMenuRouteB:
    dw #presets_goto_RouteB_crateria
    dw #presets_goto_RouteB_brinstar
    dw #presets_goto_RouteB_upper_norfair
    dw #presets_goto_RouteB_maridia
    dw #presets_goto_RouteB_wrecked_ship
    dw #presets_goto_RouteB_lower_norfair
    dw #presets_goto_RouteB_red_tower
    dw #presets_goto_RouteB_maridia_return
    dw #presets_goto_RouteB_backtracking
    dw #presets_goto_RouteB_tourian
    dw #$0000
    %cm_header("PRESETS FOR ROUTE B")

presets_goto_RouteB_crateria:
    %cm_submenu("Crateria", #presets_submenu_RouteB_crateria)

presets_goto_RouteB_brinstar:
    %cm_submenu("Brinstar", #presets_submenu_RouteB_brinstar)

presets_goto_RouteB_upper_norfair:
    %cm_submenu("Upper Norfair", #presets_submenu_RouteB_upper_norfair)

presets_goto_RouteB_maridia:
    %cm_submenu("Maridia", #presets_submenu_RouteB_maridia)

presets_goto_RouteB_wrecked_ship:
    %cm_submenu("Wrecked Ship", #presets_submenu_RouteB_wrecked_ship)

presets_goto_RouteB_lower_norfair:
    %cm_submenu("Lower Norfair", #presets_submenu_RouteB_lower_norfair)

presets_goto_RouteB_red_tower:
    %cm_submenu("Red Tower", #presets_submenu_RouteB_red_tower)

presets_goto_RouteB_maridia_return:
    %cm_submenu("Maridia Return", #presets_submenu_RouteB_maridia_return)

presets_goto_RouteB_backtracking:
    %cm_submenu("Backtracking", #presets_submenu_RouteB_backtracking)

presets_goto_RouteB_tourian:
    %cm_submenu("Tourian", #presets_submenu_RouteB_tourian)

presets_submenu_RouteB_crateria:
    dw #presets_RouteB_crateria_ship
    dw #presets_RouteB_crateria_morph
    dw #presets_RouteB_crateria_elevator
    dw #presets_RouteB_crateria_elevator_2
    dw #presets_RouteB_crateria_climb
    dw #presets_RouteB_crateria_bomb_torizo
    dw #$0000
    %cm_header("CRATERIA")

presets_submenu_RouteB_brinstar:
    dw #presets_RouteB_brinstar_green_brinstar_elevator
    dw #presets_RouteB_brinstar_sporespawn
    dw #presets_RouteB_brinstar_green_hill
    dw #presets_RouteB_brinstar_springball
    dw #presets_RouteB_brinstar_spikeway
    dw #presets_RouteB_brinstar_red_brinstar
    dw #presets_RouteB_brinstar_etank_hallway
    dw #presets_RouteB_brinstar_kraids_lair
    dw #presets_RouteB_brinstar_kraid
    dw #presets_RouteB_brinstar_water_tank
    dw #$0000
    %cm_header("BRINSTAR")

presets_submenu_RouteB_upper_norfair:
    dw #presets_RouteB_upper_norfair_upper_norfair_elevator
    dw #presets_RouteB_upper_norfair_hot_spring
    dw #presets_RouteB_upper_norfair_super_missiles
    dw #presets_RouteB_upper_norfair_unknown
    dw #presets_RouteB_upper_norfair_road_to_ice_beam
    dw #presets_RouteB_upper_norfair_the_four_horsemen
    dw #presets_RouteB_upper_norfair_bubble_mountain_supers
    dw #presets_RouteB_upper_norfair_blue_gate_glich
    dw #presets_RouteB_upper_norfair_speed_way
    dw #presets_RouteB_upper_norfair_speed_ball
    dw #presets_RouteB_upper_norfair_zero_mission
    dw #presets_RouteB_upper_norfair_energy_spark
    dw #presets_RouteB_upper_norfair_spark_again
    dw #presets_RouteB_upper_norfair_grapplebeam
    dw #presets_RouteB_upper_norfair_grapple_way
    dw #presets_RouteB_upper_norfair_the_real_bubble_mountain
    dw #$0000
    %cm_header("UPPER NORFAIR")

presets_submenu_RouteB_maridia:
    dw #presets_RouteB_maridia_maridia_elevator
    dw #presets_RouteB_maridia_water_jump
;    dw #presets_RouteB_maridia_botwoon
    dw #presets_RouteB_maridia_sand_pit
    dw #presets_RouteB_maridia_grappleway_underwater
    dw #$0000
    %cm_header("MARIDIA")

presets_submenu_RouteB_wrecked_ship:
    dw #presets_RouteB_wrecked_ship_wrecked_ship_elevator
    dw #presets_RouteB_wrecked_ship_wrecked_ship_2
    dw #presets_RouteB_wrecked_ship_phantoon
    dw #presets_RouteB_wrecked_ship_wave_beam
    dw #$0000
    %cm_header("WRECKED SHIP")

presets_submenu_RouteB_lower_norfair:
    dw #presets_RouteB_lower_norfair_maridia_elevator_2
    dw #presets_RouteB_lower_norfair_upper_norfair_elevator_2
    dw #presets_RouteB_lower_norfair_road_to_lower_norfair
    dw #presets_RouteB_lower_norfair_lavadive
    dw #presets_RouteB_lower_norfair_lower_norfair_elevator
    dw #presets_RouteB_lower_norfair_screw_attack
    dw #presets_RouteB_lower_norfair_the_red_room
    dw #presets_RouteB_lower_norfair_health_refill
    dw #presets_RouteB_lower_norfair_metal_pirates
    dw #presets_RouteB_lower_norfair_ridley
    dw #presets_RouteB_lower_norfair_chilean_climb
    dw #presets_RouteB_lower_norfair_zero_mission_dejavu
    dw #presets_RouteB_lower_norfair_elevator_climb
    dw #$0000
    %cm_header("LOWER NORFAIR")

presets_submenu_RouteB_red_tower:
    dw #presets_RouteB_red_tower_red_tower_elevator
    dw #presets_RouteB_red_tower_red_tower_climb
    dw #presets_RouteB_red_tower_water_spike_corridor
    dw #$0000
    %cm_header("RED TOWER")

presets_submenu_RouteB_maridia_return:
    dw #presets_RouteB_maridia_return_maridia_entrace
    dw #presets_RouteB_maridia_return_red_tubes
    dw #presets_RouteB_maridia_return_halfie_spark
    dw #presets_RouteB_maridia_return_draygon
    dw #presets_RouteB_maridia_return_reverse_halfie
    dw #presets_RouteB_maridia_return_plasma_beam
    dw #presets_RouteB_maridia_return_tube_room
    dw #presets_RouteB_maridia_return_red_tubes_return
    dw #$0000
    %cm_header("MARIDIA RETURN")

presets_submenu_RouteB_backtracking:
    dw #presets_RouteB_backtracking_green_brinstar_entrace
    dw #presets_RouteB_backtracking_crateria_elevator
    dw #presets_RouteB_backtracking_g4
    dw #$0000
    %cm_header("BACKTRACKING")

presets_submenu_RouteB_tourian:
    dw #presets_RouteB_tourian_tourian_elevator
    dw #presets_RouteB_tourian_metroids_room_2
    dw #presets_RouteB_tourian_metroids_room_3
    dw #presets_RouteB_tourian_metroids_room_4
    dw #presets_RouteB_tourian_pirates_room
    dw #presets_RouteB_tourian_baby_skip
    dw #presets_RouteB_tourian_zebetite_skip
    dw #$0000
    %cm_header("TOURIAN")

; Crateria
presets_RouteB_crateria_ship:
    %cm_preset("Ship", #preset_RouteB_crateria_ship)

presets_RouteB_crateria_morph:
    %cm_preset("Morph", #preset_RouteB_crateria_morph)

presets_RouteB_crateria_elevator:
    %cm_preset("Elevator", #preset_RouteB_crateria_elevator)

presets_RouteB_crateria_elevator_2:
    %cm_preset("Elevator 2", #preset_RouteB_crateria_elevator_2)

presets_RouteB_crateria_climb:
    %cm_preset("Climb", #preset_RouteB_crateria_climb)

presets_RouteB_crateria_bomb_torizo:
    %cm_preset("Bomb Torizo", #preset_RouteB_crateria_bomb_torizo)


; Brinstar
presets_RouteB_brinstar_green_brinstar_elevator:
    %cm_preset("Green Brinstar Elevator", #preset_RouteB_brinstar_green_brinstar_elevator)

presets_RouteB_brinstar_sporespawn:
    %cm_preset("SporeSpawn", #preset_RouteB_brinstar_sporespawn)

presets_RouteB_brinstar_green_hill:
    %cm_preset("Green Hill", #preset_RouteB_brinstar_green_hill)

presets_RouteB_brinstar_springball:
    %cm_preset("SpringBall", #preset_RouteB_brinstar_springball)

presets_RouteB_brinstar_spikeway:
    %cm_preset("SpikeWay", #preset_RouteB_brinstar_spikeway)

presets_RouteB_brinstar_red_brinstar:
    %cm_preset("Red Brinstar", #preset_RouteB_brinstar_red_brinstar)

presets_RouteB_brinstar_etank_hallway:
    %cm_preset("E-Tank Hallway", #preset_RouteB_brinstar_etank_hallway)

presets_RouteB_brinstar_kraids_lair:
    %cm_preset("Kraids Lair", #preset_RouteB_brinstar_kraids_lair)

presets_RouteB_brinstar_kraid:
    %cm_preset("Kraid", #preset_RouteB_brinstar_kraid)

presets_RouteB_brinstar_water_tank:
    %cm_preset("Water Tank", #preset_RouteB_brinstar_water_tank)


; Upper Norfair
presets_RouteB_upper_norfair_upper_norfair_elevator:
    %cm_preset("Upper Norfair Elevator", #preset_RouteB_upper_norfair_upper_norfair_elevator)

presets_RouteB_upper_norfair_hot_spring:
    %cm_preset("Hot Spring", #preset_RouteB_upper_norfair_hot_spring)

presets_RouteB_upper_norfair_super_missiles:
    %cm_preset("Super Missiles", #preset_RouteB_upper_norfair_super_missiles)

presets_RouteB_upper_norfair_unknown:
    %cm_preset("Unknown", #preset_RouteB_upper_norfair_unknown)

presets_RouteB_upper_norfair_road_to_ice_beam:
    %cm_preset("Road to Ice Beam", #preset_RouteB_upper_norfair_road_to_ice_beam)

presets_RouteB_upper_norfair_the_four_horsemen:
    %cm_preset("The Four Horsemen", #preset_RouteB_upper_norfair_the_four_horsemen)

presets_RouteB_upper_norfair_bubble_mountain_supers:
    %cm_preset("Bubble Mountain Supers", #preset_RouteB_upper_norfair_bubble_mountain_supers)

presets_RouteB_upper_norfair_blue_gate_glich:
    %cm_preset("Blue Gate Glich", #preset_RouteB_upper_norfair_blue_gate_glich)

presets_RouteB_upper_norfair_speed_way:
    %cm_preset("Speed Way", #preset_RouteB_upper_norfair_speed_way)

presets_RouteB_upper_norfair_speed_ball:
    %cm_preset("Speed Ball", #preset_RouteB_upper_norfair_speed_ball)

presets_RouteB_upper_norfair_zero_mission:
    %cm_preset("Zero Mission", #preset_RouteB_upper_norfair_zero_mission)

presets_RouteB_upper_norfair_energy_spark:
    %cm_preset("Energy Spark", #preset_RouteB_upper_norfair_energy_spark)

presets_RouteB_upper_norfair_spark_again:
    %cm_preset("Spark Again", #preset_RouteB_upper_norfair_spark_again)

presets_RouteB_upper_norfair_grapplebeam:
    %cm_preset("GrappleBeam", #preset_RouteB_upper_norfair_grapplebeam)

presets_RouteB_upper_norfair_grapple_way:
    %cm_preset("Grapple Way", #preset_RouteB_upper_norfair_grapple_way)

presets_RouteB_upper_norfair_the_real_bubble_mountain:
    %cm_preset("The Real Bubble Mountain", #preset_RouteB_upper_norfair_the_real_bubble_mountain)


; Maridia
presets_RouteB_maridia_maridia_elevator:
    %cm_preset("Maridia Elevator", #preset_RouteB_maridia_maridia_elevator)

presets_RouteB_maridia_water_jump:
    %cm_preset("Water Jump", #preset_RouteB_maridia_water_jump)

;presets_RouteB_maridia_botwoon:
;    %cm_preset("Botwoon", #preset_RouteB_maridia_botwoon)

presets_RouteB_maridia_sand_pit:
    %cm_preset("Sand Pit", #preset_RouteB_maridia_sand_pit)

presets_RouteB_maridia_grappleway_underwater:
    %cm_preset("GrappleWay UnderWater", #preset_RouteB_maridia_grappleway_underwater)


; Wrecked Ship
presets_RouteB_wrecked_ship_wrecked_ship_elevator:
    %cm_preset("Wrecked Ship Elevator", #preset_RouteB_wrecked_ship_wrecked_ship_elevator)

presets_RouteB_wrecked_ship_wrecked_ship_2:
    %cm_preset("Wrecked Ship", #preset_RouteB_wrecked_ship_wrecked_ship_2)

presets_RouteB_wrecked_ship_phantoon:
    %cm_preset("Phantoon", #preset_RouteB_wrecked_ship_phantoon)

presets_RouteB_wrecked_ship_wave_beam:
    %cm_preset("Wave Beam", #preset_RouteB_wrecked_ship_wave_beam)


; Lower Norfair
presets_RouteB_lower_norfair_maridia_elevator_2:
    %cm_preset("Maridia Elevator 2", #preset_RouteB_lower_norfair_maridia_elevator_2)

presets_RouteB_lower_norfair_upper_norfair_elevator_2:
    %cm_preset("Upper Norfair Elevator 2", #preset_RouteB_lower_norfair_upper_norfair_elevator_2)

presets_RouteB_lower_norfair_road_to_lower_norfair:
    %cm_preset("Road to Lower Norfair", #preset_RouteB_lower_norfair_road_to_lower_norfair)

presets_RouteB_lower_norfair_lavadive:
    %cm_preset("LavaDive", #preset_RouteB_lower_norfair_lavadive)

presets_RouteB_lower_norfair_lower_norfair_elevator:
    %cm_preset("Lower Norfair Elevator", #preset_RouteB_lower_norfair_lower_norfair_elevator)

presets_RouteB_lower_norfair_screw_attack:
    %cm_preset("Screw Attack", #preset_RouteB_lower_norfair_screw_attack)

presets_RouteB_lower_norfair_the_red_room:
    %cm_preset("The Red Room", #preset_RouteB_lower_norfair_the_red_room)

presets_RouteB_lower_norfair_health_refill:
    %cm_preset("Health Refill", #preset_RouteB_lower_norfair_health_refill)

presets_RouteB_lower_norfair_metal_pirates:
    %cm_preset("Metal Pirates", #preset_RouteB_lower_norfair_metal_pirates)

presets_RouteB_lower_norfair_ridley:
    %cm_preset("Ridley", #preset_RouteB_lower_norfair_ridley)

presets_RouteB_lower_norfair_chilean_climb:
    %cm_preset("Chilean Climb", #preset_RouteB_lower_norfair_chilean_climb)

presets_RouteB_lower_norfair_zero_mission_dejavu:
    %cm_preset("Zero Mission DeJaVu", #preset_RouteB_lower_norfair_zero_mission_dejavu)

presets_RouteB_lower_norfair_elevator_climb:
    %cm_preset("Elevator Climb", #preset_RouteB_lower_norfair_elevator_climb)


; Red Tower
presets_RouteB_red_tower_red_tower_elevator:
    %cm_preset("Red Tower Elevator", #preset_RouteB_red_tower_red_tower_elevator)

presets_RouteB_red_tower_red_tower_climb:
    %cm_preset("Red Tower Climb", #preset_RouteB_red_tower_red_tower_climb)

presets_RouteB_red_tower_water_spike_corridor:
    %cm_preset("Water Spike Corridor", #preset_RouteB_red_tower_water_spike_corridor)


; Maridia Return
presets_RouteB_maridia_return_maridia_entrace:
    %cm_preset("Maridia Entrace", #preset_RouteB_maridia_return_maridia_entrace)

presets_RouteB_maridia_return_red_tubes:
    %cm_preset("Red Tubes", #preset_RouteB_maridia_return_red_tubes)

presets_RouteB_maridia_return_halfie_spark:
    %cm_preset("Halfie Spark", #preset_RouteB_maridia_return_halfie_spark)

presets_RouteB_maridia_return_draygon:
    %cm_preset("Draygon", #preset_RouteB_maridia_return_draygon)

presets_RouteB_maridia_return_reverse_halfie:
    %cm_preset("Reverse Halfie", #preset_RouteB_maridia_return_reverse_halfie)

presets_RouteB_maridia_return_plasma_beam:
    %cm_preset("Plasma Beam", #preset_RouteB_maridia_return_plasma_beam)

presets_RouteB_maridia_return_tube_room:
    %cm_preset("Tube Room", #preset_RouteB_maridia_return_tube_room)

presets_RouteB_maridia_return_red_tubes_return:
    %cm_preset("Red Tubes Return", #preset_RouteB_maridia_return_red_tubes_return)


; Backtracking
presets_RouteB_backtracking_green_brinstar_entrace:
    %cm_preset("Green Brinstar Entrace", #preset_RouteB_backtracking_green_brinstar_entrace)

presets_RouteB_backtracking_crateria_elevator:
    %cm_preset("Crateria Elevator", #preset_RouteB_backtracking_crateria_elevator)

presets_RouteB_backtracking_g4:
    %cm_preset("G4", #preset_RouteB_backtracking_g4)


; Tourian
presets_RouteB_tourian_tourian_elevator:
    %cm_preset("Tourian Elevator", #preset_RouteB_tourian_tourian_elevator)

presets_RouteB_tourian_metroids_room_2:
    %cm_preset("Metroids Room 2", #preset_RouteB_tourian_metroids_room_2)

presets_RouteB_tourian_metroids_room_3:
    %cm_preset("Metroids Room 3", #preset_RouteB_tourian_metroids_room_3)

presets_RouteB_tourian_metroids_room_4:
    %cm_preset("Metroids Room 4", #preset_RouteB_tourian_metroids_room_4)

presets_RouteB_tourian_pirates_room:
    %cm_preset("Pirates Room", #preset_RouteB_tourian_pirates_room)

presets_RouteB_tourian_baby_skip:
    %cm_preset("Baby Skip", #preset_RouteB_tourian_baby_skip)

presets_RouteB_tourian_zebetite_skip:
    %cm_preset("Zebetite Skip", #preset_RouteB_tourian_zebetite_skip)


