PresetsMenuKaizoPAny:
    dw #presets_goto_KaizoPAny_bombs
    dw #presets_goto_KaizoPAny_spring
    dw #presets_goto_KaizoPAny_wrecked_ship
    dw #presets_goto_KaizoPAny_draygon
    dw #presets_goto_KaizoPAny_end_game
    dw #$0000
    %cm_header("PRESETS FOR KAIZOPANY")
    %cm_footer("PRESETS BY CHEESYBOATRIDE")

presets_goto_KaizoPAny_bombs:
    %cm_submenu("Bombs", #presets_submenu_KaizoPAny_bombs)

presets_goto_KaizoPAny_spring:
    %cm_submenu("Spring", #presets_submenu_KaizoPAny_spring)

presets_goto_KaizoPAny_wrecked_ship:
    %cm_submenu("Wrecked Ship", #presets_submenu_KaizoPAny_wrecked_ship)

presets_goto_KaizoPAny_draygon:
    %cm_submenu("Draygon", #presets_submenu_KaizoPAny_draygon)

presets_goto_KaizoPAny_end_game:
    %cm_submenu("End Game", #presets_submenu_KaizoPAny_end_game)

presets_submenu_KaizoPAny_bombs:
    dw #presets_KaizoPAny_bombs_landing
    dw #presets_KaizoPAny_bombs_gauntlet
    dw #presets_KaizoPAny_bombs_green_brin
    dw #presets_KaizoPAny_bombs_grapple
    dw #presets_KaizoPAny_bombs_norfair_entry
    dw #presets_KaizoPAny_bombs_bombs_hell
    dw #presets_KaizoPAny_bombs_norfair_exit
    dw #$0000
    %cm_header("BOMBS")

presets_submenu_KaizoPAny_spring:
    dw #presets_KaizoPAny_spring_green_brin_return
    dw #presets_KaizoPAny_spring_crateria_spike_hall
    dw #presets_KaizoPAny_spring_red_tower
    dw #presets_KaizoPAny_spring_red_tower_escape
    dw #presets_KaizoPAny_spring_crat_kihunter_escape
    dw #presets_KaizoPAny_spring_screw
    dw #presets_KaizoPAny_spring_high_jump
    dw #presets_KaizoPAny_spring_crateria_spike_hall_2
    dw #presets_KaizoPAny_spring_charge
    dw #presets_KaizoPAny_spring_maridia_entry
    dw #presets_KaizoPAny_spring_spring_2
    dw #$0000
    %cm_header("SPRING")

presets_submenu_KaizoPAny_wrecked_ship:
    dw #presets_KaizoPAny_wrecked_ship_varia_backtrack
    dw #presets_KaizoPAny_wrecked_ship_varia_hell
    dw #presets_KaizoPAny_wrecked_ship_plasma_spring
    dw #presets_KaizoPAny_wrecked_ship_varia_get
    dw #presets_KaizoPAny_wrecked_ship_crateria_spike_hall_3
    dw #presets_KaizoPAny_wrecked_ship_maridia_return
    dw #presets_KaizoPAny_wrecked_ship_reverse_evirs
    dw #presets_KaizoPAny_wrecked_ship_ws_entry
    dw #presets_KaizoPAny_wrecked_ship_phantoon
    dw #presets_KaizoPAny_wrecked_ship_wave
    dw #presets_KaizoPAny_wrecked_ship_spiky_death_room
    dw #$0000
    %cm_header("WRECKED SHIP")

presets_submenu_KaizoPAny_draygon:
    dw #presets_KaizoPAny_draygon_lava_dive
    dw #presets_KaizoPAny_draygon_temp_blue_supers
    dw #presets_KaizoPAny_draygon_ln_escape
    dw #presets_KaizoPAny_draygon_crateria_spike_hall_4
    dw #presets_KaizoPAny_draygon_main_street
    dw #presets_KaizoPAny_draygon_crab_shaft
    dw #presets_KaizoPAny_draygon_draygon_2
    dw #presets_KaizoPAny_draygon_draygon_escape
    dw #presets_KaizoPAny_draygon_crab_shaft_escape
    dw #presets_KaizoPAny_draygon_green_maridia_missiles
    dw #$0000
    %cm_header("DRAYGON")

presets_submenu_KaizoPAny_end_game:
    dw #presets_KaizoPAny_end_game_power_bombs
    dw #presets_KaizoPAny_end_game_maridia_cleanup
    dw #presets_KaizoPAny_end_game_ridley
    dw #presets_KaizoPAny_end_game_acid_dive
    dw #presets_KaizoPAny_end_game_tower_supers
    dw #presets_KaizoPAny_end_game_crateria_cleanup
    dw #presets_KaizoPAny_end_game_kraid_entry
    dw #presets_KaizoPAny_end_game_kraid_escape
    dw #presets_KaizoPAny_end_game_tourian
    dw #presets_KaizoPAny_end_game_baby_skip
    dw #presets_KaizoPAny_end_game_mother_brain
    dw #$0000
    %cm_header("END GAME")

; Bombs
presets_KaizoPAny_bombs_landing:
    %cm_preset("Landing", #preset_KaizoPAny_bombs_landing)

presets_KaizoPAny_bombs_gauntlet:
    %cm_preset("Gauntlet", #preset_KaizoPAny_bombs_gauntlet)

presets_KaizoPAny_bombs_green_brin:
    %cm_preset("Green Brin", #preset_KaizoPAny_bombs_green_brin)

presets_KaizoPAny_bombs_grapple:
    %cm_preset("Grapple", #preset_KaizoPAny_bombs_grapple)

presets_KaizoPAny_bombs_norfair_entry:
    %cm_preset("Norfair Entry", #preset_KaizoPAny_bombs_norfair_entry)

presets_KaizoPAny_bombs_bombs_hell:
    %cm_preset("Bombs Hell", #preset_KaizoPAny_bombs_bombs_hell)

presets_KaizoPAny_bombs_norfair_exit:
    %cm_preset("Norfair Exit", #preset_KaizoPAny_bombs_norfair_exit)


; Spring
presets_KaizoPAny_spring_green_brin_return:
    %cm_preset("Green Brin Return", #preset_KaizoPAny_spring_green_brin_return)

presets_KaizoPAny_spring_crateria_spike_hall:
    %cm_preset("Crateria Spike hall", #preset_KaizoPAny_spring_crateria_spike_hall)

presets_KaizoPAny_spring_red_tower:
    %cm_preset("Red Tower", #preset_KaizoPAny_spring_red_tower)

presets_KaizoPAny_spring_red_tower_escape:
    %cm_preset("Red Tower Escape", #preset_KaizoPAny_spring_red_tower_escape)

presets_KaizoPAny_spring_crat_kihunter_escape:
    %cm_preset("Crat Kihunter Escape", #preset_KaizoPAny_spring_crat_kihunter_escape)

presets_KaizoPAny_spring_screw:
    %cm_preset("Screw", #preset_KaizoPAny_spring_screw)

presets_KaizoPAny_spring_high_jump:
    %cm_preset("High Jump", #preset_KaizoPAny_spring_high_jump)

presets_KaizoPAny_spring_crateria_spike_hall_2:
    %cm_preset("Crateria spike hall 2", #preset_KaizoPAny_spring_crateria_spike_hall_2)

presets_KaizoPAny_spring_charge:
    %cm_preset("Charge", #preset_KaizoPAny_spring_charge)

presets_KaizoPAny_spring_maridia_entry:
    %cm_preset("Maridia Entry", #preset_KaizoPAny_spring_maridia_entry)

presets_KaizoPAny_spring_spring_2:
    %cm_preset("Spring", #preset_KaizoPAny_spring_spring_2)


; Wrecked Ship
presets_KaizoPAny_wrecked_ship_varia_backtrack:
    %cm_preset("Varia Backtrack", #preset_KaizoPAny_wrecked_ship_varia_backtrack)

presets_KaizoPAny_wrecked_ship_varia_hell:
    %cm_preset("Varia Hell", #preset_KaizoPAny_wrecked_ship_varia_hell)

presets_KaizoPAny_wrecked_ship_plasma_spring:
    %cm_preset("Plasma Spring", #preset_KaizoPAny_wrecked_ship_plasma_spring)

presets_KaizoPAny_wrecked_ship_varia_get:
    %cm_preset("Varia Get", #preset_KaizoPAny_wrecked_ship_varia_get)

presets_KaizoPAny_wrecked_ship_crateria_spike_hall_3:
    %cm_preset("Crateria Spike hall 3", #preset_KaizoPAny_wrecked_ship_crateria_spike_hall_3)

presets_KaizoPAny_wrecked_ship_maridia_return:
    %cm_preset("Maridia Return", #preset_KaizoPAny_wrecked_ship_maridia_return)

presets_KaizoPAny_wrecked_ship_reverse_evirs:
    %cm_preset("Reverse Evirs", #preset_KaizoPAny_wrecked_ship_reverse_evirs)

presets_KaizoPAny_wrecked_ship_ws_entry:
    %cm_preset("WS Entry", #preset_KaizoPAny_wrecked_ship_ws_entry)

presets_KaizoPAny_wrecked_ship_phantoon:
    %cm_preset("Phantoon", #preset_KaizoPAny_wrecked_ship_phantoon)

presets_KaizoPAny_wrecked_ship_wave:
    %cm_preset("Wave", #preset_KaizoPAny_wrecked_ship_wave)

presets_KaizoPAny_wrecked_ship_spiky_death_room:
    %cm_preset("Spiky Death Room", #preset_KaizoPAny_wrecked_ship_spiky_death_room)


; Draygon
presets_KaizoPAny_draygon_lava_dive:
    %cm_preset("Lava Dive", #preset_KaizoPAny_draygon_lava_dive)

presets_KaizoPAny_draygon_temp_blue_supers:
    %cm_preset("Temp Blue Supers", #preset_KaizoPAny_draygon_temp_blue_supers)

presets_KaizoPAny_draygon_ln_escape:
    %cm_preset("LN Escape", #preset_KaizoPAny_draygon_ln_escape)

presets_KaizoPAny_draygon_crateria_spike_hall_4:
    %cm_preset("Crateria Spike Hall 4", #preset_KaizoPAny_draygon_crateria_spike_hall_4)

presets_KaizoPAny_draygon_main_street:
    %cm_preset("Main Street", #preset_KaizoPAny_draygon_main_street)

presets_KaizoPAny_draygon_crab_shaft:
    %cm_preset("Crab Shaft", #preset_KaizoPAny_draygon_crab_shaft)

presets_KaizoPAny_draygon_draygon_2:
    %cm_preset("Draygon", #preset_KaizoPAny_draygon_draygon_2)

presets_KaizoPAny_draygon_draygon_escape:
    %cm_preset("Draygon Escape", #preset_KaizoPAny_draygon_draygon_escape)

presets_KaizoPAny_draygon_crab_shaft_escape:
    %cm_preset("Crab Shaft Escape", #preset_KaizoPAny_draygon_crab_shaft_escape)

presets_KaizoPAny_draygon_green_maridia_missiles:
    %cm_preset("Green Maridia missiles", #preset_KaizoPAny_draygon_green_maridia_missiles)


; End Game
presets_KaizoPAny_end_game_power_bombs:
    %cm_preset("Power Bombs", #preset_KaizoPAny_end_game_power_bombs)

presets_KaizoPAny_end_game_maridia_cleanup:
    %cm_preset("Maridia Clean-up", #preset_KaizoPAny_end_game_maridia_cleanup)

presets_KaizoPAny_end_game_ridley:
    %cm_preset("Ridley", #preset_KaizoPAny_end_game_ridley)

presets_KaizoPAny_end_game_acid_dive:
    %cm_preset("Acid Dive", #preset_KaizoPAny_end_game_acid_dive)

presets_KaizoPAny_end_game_tower_supers:
    %cm_preset("Tower Supers", #preset_KaizoPAny_end_game_tower_supers)

presets_KaizoPAny_end_game_crateria_cleanup:
    %cm_preset("Crateria clean-up", #preset_KaizoPAny_end_game_crateria_cleanup)

presets_KaizoPAny_end_game_kraid_entry:
    %cm_preset("Kraid entry", #preset_KaizoPAny_end_game_kraid_entry)

presets_KaizoPAny_end_game_kraid_escape:
    %cm_preset("Kraid escape", #preset_KaizoPAny_end_game_kraid_escape)

presets_KaizoPAny_end_game_tourian:
    %cm_preset("Tourian", #preset_KaizoPAny_end_game_tourian)

presets_KaizoPAny_end_game_baby_skip:
    %cm_preset("Baby Skip", #preset_KaizoPAny_end_game_baby_skip)

presets_KaizoPAny_end_game_mother_brain:
    %cm_preset("Mother Brain", #preset_KaizoPAny_end_game_mother_brain)


