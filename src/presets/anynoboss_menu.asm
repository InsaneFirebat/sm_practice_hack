PresetsMenuAnynoboss:
    dw #presets_goto_anynoboss_start_to_bombs
    dw #presets_goto_anynoboss_reset
    dw #presets_goto_anynoboss_tourian
    dw #$0000
    %cm_header("PRESETS FOR ANYNOBOSS")

presets_goto_anynoboss_start_to_bombs:
    %cm_submenu("START TO BOMBS", #presets_submenu_anynoboss_start_to_bombs)

presets_goto_anynoboss_reset:
    %cm_submenu("RESET", #presets_submenu_anynoboss_reset)

presets_goto_anynoboss_tourian:
    %cm_submenu("TOURIAN", #presets_submenu_anynoboss_tourian)

presets_submenu_anynoboss_start_to_bombs:
    dw #presets_anynoboss_start_to_bombs_construction_zone
    dw #presets_anynoboss_start_to_bombs_blue_shaft_up
    dw #presets_anynoboss_start_to_bombs_table_room
    dw #presets_anynoboss_start_to_bombs_gold_shaft_down
    dw #presets_anynoboss_start_to_bombs_first_missiles_room
    dw #presets_anynoboss_start_to_bombs_gold_shaft_up
    dw #presets_anynoboss_start_to_bombs_blue_with_lava_1
    dw #presets_anynoboss_start_to_bombs_blue_with_lava_2
    dw #presets_anynoboss_start_to_bombs_down_the_hole
    dw #presets_anynoboss_start_to_bombs_second_missiles_room
    dw #presets_anynoboss_start_to_bombs_up_the_hole
    dw #presets_anynoboss_start_to_bombs_etank_room
    dw #presets_anynoboss_start_to_bombs_gold_shaft_to_bombs
    dw #$0000
    %cm_header("START TO BOMBS")

presets_submenu_anynoboss_reset:
    dw #presets_anynoboss_reset_construction_zone_revisit
    dw #presets_anynoboss_reset_blue_shaft_up_2
    dw #presets_anynoboss_reset_shaft_bomb_jump
    dw #presets_anynoboss_reset_farming_room
    dw #presets_anynoboss_reset_bridge_skip
    dw #$0000
    %cm_header("RESET")

presets_submenu_anynoboss_tourian:
    dw #presets_anynoboss_tourian_metroids_1
    dw #presets_anynoboss_tourian_metroids_2
    dw #presets_anynoboss_tourian_metroids_3
    dw #presets_anynoboss_tourian_metroids_4
    dw #presets_anynoboss_tourian_mother_brain_room
    dw #presets_anynoboss_tourian_escape_climb
    dw #$0000
    %cm_header("TOURIAN")

; START TO BOMBS
presets_anynoboss_start_to_bombs_construction_zone:
    %cm_preset("Construction Zone", #preset_anynoboss_start_to_bombs_construction_zone)

presets_anynoboss_start_to_bombs_blue_shaft_up:
    %cm_preset("Blue Shaft Up", #preset_anynoboss_start_to_bombs_blue_shaft_up)

presets_anynoboss_start_to_bombs_table_room:
    %cm_preset("Table Room", #preset_anynoboss_start_to_bombs_table_room)

presets_anynoboss_start_to_bombs_gold_shaft_down:
    %cm_preset("Gold Shaft Down", #preset_anynoboss_start_to_bombs_gold_shaft_down)

presets_anynoboss_start_to_bombs_first_missiles_room:
    %cm_preset("First Missiles Room", #preset_anynoboss_start_to_bombs_first_missiles_room)

presets_anynoboss_start_to_bombs_gold_shaft_up:
    %cm_preset("Gold Shaft up", #preset_anynoboss_start_to_bombs_gold_shaft_up)

presets_anynoboss_start_to_bombs_blue_with_lava_1:
    %cm_preset("Blue with Lava 1", #preset_anynoboss_start_to_bombs_blue_with_lava_1)

presets_anynoboss_start_to_bombs_blue_with_lava_2:
    %cm_preset("Blue with Lava 2", #preset_anynoboss_start_to_bombs_blue_with_lava_2)

presets_anynoboss_start_to_bombs_down_the_hole:
    %cm_preset("Down the Hole", #preset_anynoboss_start_to_bombs_down_the_hole)

presets_anynoboss_start_to_bombs_second_missiles_room:
    %cm_preset("Second Missiles Room", #preset_anynoboss_start_to_bombs_second_missiles_room)

presets_anynoboss_start_to_bombs_up_the_hole:
    %cm_preset("Up the Hole", #preset_anynoboss_start_to_bombs_up_the_hole)

presets_anynoboss_start_to_bombs_etank_room:
    %cm_preset("Etank Room", #preset_anynoboss_start_to_bombs_etank_room)

presets_anynoboss_start_to_bombs_gold_shaft_to_bombs:
    %cm_preset("Gold Shaft to Bombs", #preset_anynoboss_start_to_bombs_gold_shaft_to_bombs)


; RESET
presets_anynoboss_reset_construction_zone_revisit:
    %cm_preset("Construction Zone Revisit", #preset_anynoboss_reset_construction_zone_revisit)

presets_anynoboss_reset_blue_shaft_up_2:
    %cm_preset("Blue Shaft Up 2", #preset_anynoboss_reset_blue_shaft_up_2)

presets_anynoboss_reset_shaft_bomb_jump:
    %cm_preset("Shaft Bomb Jump", #preset_anynoboss_reset_shaft_bomb_jump)

presets_anynoboss_reset_farming_room:
    %cm_preset("Farming Room", #preset_anynoboss_reset_farming_room)

presets_anynoboss_reset_bridge_skip:
    %cm_preset("Bridge Skip", #preset_anynoboss_reset_bridge_skip)


; TOURIAN
presets_anynoboss_tourian_metroids_1:
    %cm_preset("Metroids 1", #preset_anynoboss_tourian_metroids_1)

presets_anynoboss_tourian_metroids_2:
    %cm_preset("Metroids 2", #preset_anynoboss_tourian_metroids_2)

presets_anynoboss_tourian_metroids_3:
    %cm_preset("Metroids 3", #preset_anynoboss_tourian_metroids_3)

presets_anynoboss_tourian_metroids_4:
    %cm_preset("Metroids 4", #preset_anynoboss_tourian_metroids_4)

presets_anynoboss_tourian_mother_brain_room:
    %cm_preset("Mother Brain Room", #preset_anynoboss_tourian_mother_brain_room)

presets_anynoboss_tourian_escape_climb:
    %cm_preset("Escape Climb", #preset_anynoboss_tourian_escape_climb)


