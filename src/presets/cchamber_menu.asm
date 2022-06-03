PresetsMenuCchamber:
    dw #presets_goto_cchamber_crateria
    dw #presets_goto_cchamber_brinstar
    dw #presets_goto_cchamber_maridia
    dw #presets_goto_cchamber_norfair
    dw #presets_goto_cchamber_tourian
    dw #$0000
    %cm_header(" CONTAINMENT CHAMBER ANY%")
    %cm_footer("   PRESETS BY BEASTWORM")

presets_goto_cchamber_crateria:
    %cm_submenu("Crateria", #presets_submenu_cchamber_crateria)

presets_goto_cchamber_brinstar:
    %cm_submenu("Brinstar", #presets_submenu_cchamber_brinstar)

presets_goto_cchamber_maridia:
    %cm_submenu("Maridia", #presets_submenu_cchamber_maridia)

presets_goto_cchamber_norfair:
    %cm_submenu("Norfair", #presets_submenu_cchamber_norfair)

presets_goto_cchamber_tourian:
    %cm_submenu("Tourian", #presets_submenu_cchamber_tourian)

presets_submenu_cchamber_crateria:
    dw #presets_cchamber_crateria_puzzle_1
    dw #presets_cchamber_crateria_puzzle_2
    dw #presets_cchamber_crateria_puzzle_3
    dw #presets_cchamber_crateria_puzzle_4
    dw #presets_cchamber_crateria_puzzle_5
    dw #presets_cchamber_crateria_puzzle_5_gate
    dw #presets_cchamber_crateria_puzzle_5_super
    dw #presets_cchamber_crateria_puzzle_6
    dw #$0000
    %cm_header("CRATERIA")

presets_submenu_cchamber_brinstar:
    dw #presets_cchamber_brinstar_puzzle_7
    dw #presets_cchamber_brinstar_puzzle_8
    dw #presets_cchamber_brinstar_puzzle_9
    dw #presets_cchamber_brinstar_puzzle_a
    dw #$0000
    %cm_header("BRINSTAR")

presets_submenu_cchamber_maridia:
    dw #presets_cchamber_maridia_puzzle_b
    dw #presets_cchamber_maridia_puzzle_c
    dw #presets_cchamber_maridia_puzzle_d
    dw #presets_cchamber_maridia_puzzle_e
    dw #presets_cchamber_maridia_puzzle_f
    dw #presets_cchamber_maridia_puzzle_g
    dw #$0000
    %cm_header("MARIDIA")

presets_submenu_cchamber_norfair:
    dw #presets_cchamber_norfair_entry
    dw #presets_cchamber_norfair_gravity
    dw #presets_cchamber_norfair_puzzle_h
    dw #presets_cchamber_norfair_springball
    dw #presets_cchamber_norfair_puzzle_i
    dw #presets_cchamber_norfair_minikraid
    dw #$0000
    %cm_header("NORFAIR")

presets_submenu_cchamber_tourian:
    dw #presets_cchamber_tourian_puzzle_j
    dw #presets_cchamber_tourian_puzzle_k
    dw #presets_cchamber_tourian_puzzle_l
    dw #presets_cchamber_tourian_puzzle_m
    dw #presets_cchamber_tourian_invisible_maze
    dw #presets_cchamber_tourian_ridley
    dw #presets_cchamber_tourian_puzzle_n
    dw #presets_cchamber_tourian_puzzle_o
    dw #presets_cchamber_tourian_climb_spark
    dw #$0000
    %cm_header("TOURIAN")

; Crateria
presets_cchamber_crateria_puzzle_1:
    %cm_preset("Puzzle 1", #preset_cchamber_crateria_puzzle_1)

presets_cchamber_crateria_puzzle_2:
    %cm_preset("Puzzle 2", #preset_cchamber_crateria_puzzle_2)

presets_cchamber_crateria_puzzle_3:
    %cm_preset("Puzzle 3", #preset_cchamber_crateria_puzzle_3)

presets_cchamber_crateria_puzzle_4:
    %cm_preset("Puzzle 4", #preset_cchamber_crateria_puzzle_4)

presets_cchamber_crateria_puzzle_5:
    %cm_preset("Puzzle 5", #preset_cchamber_crateria_puzzle_5)

presets_cchamber_crateria_puzzle_5_gate:
    %cm_preset("Puzzle 5 Gate", #preset_cchamber_crateria_puzzle_5_gate)

presets_cchamber_crateria_puzzle_5_super:
    %cm_preset("Puzzle 5 Super", #preset_cchamber_crateria_puzzle_5_super)

presets_cchamber_crateria_puzzle_6:
    %cm_preset("Puzzle 6", #preset_cchamber_crateria_puzzle_6)


; Brinstar
presets_cchamber_brinstar_puzzle_7:
    %cm_preset("Puzzle 7", #preset_cchamber_brinstar_puzzle_7)

presets_cchamber_brinstar_puzzle_8:
    %cm_preset("Puzzle 8", #preset_cchamber_brinstar_puzzle_8)

presets_cchamber_brinstar_puzzle_9:
    %cm_preset("Puzzle 9", #preset_cchamber_brinstar_puzzle_9)

presets_cchamber_brinstar_puzzle_a:
    %cm_preset("Puzzle A", #preset_cchamber_brinstar_puzzle_a)


; Maridia
presets_cchamber_maridia_puzzle_b:
    %cm_preset("Puzzle B", #preset_cchamber_maridia_puzzle_b)

presets_cchamber_maridia_puzzle_c:
    %cm_preset("Puzzle C", #preset_cchamber_maridia_puzzle_c)

presets_cchamber_maridia_puzzle_d:
    %cm_preset("Puzzle D", #preset_cchamber_maridia_puzzle_d)

presets_cchamber_maridia_puzzle_e:
    %cm_preset("Puzzle E", #preset_cchamber_maridia_puzzle_e)

presets_cchamber_maridia_puzzle_f:
    %cm_preset("Puzzle F", #preset_cchamber_maridia_puzzle_f)

presets_cchamber_maridia_puzzle_g:
    %cm_preset("Puzzle G", #preset_cchamber_maridia_puzzle_g)


; Norfair
presets_cchamber_norfair_entry:
    %cm_preset("Entry", #preset_cchamber_norfair_entry)

presets_cchamber_norfair_gravity:
    %cm_preset("Gravity", #preset_cchamber_norfair_gravity)

presets_cchamber_norfair_puzzle_h:
    %cm_preset("Puzzle H", #preset_cchamber_norfair_puzzle_h)

presets_cchamber_norfair_springball:
    %cm_preset("Springball", #preset_cchamber_norfair_springball)

presets_cchamber_norfair_puzzle_i:
    %cm_preset("Puzzle I", #preset_cchamber_norfair_puzzle_i)

presets_cchamber_norfair_minikraid:
    %cm_preset("MiniKraid", #preset_cchamber_norfair_minikraid)


; Tourian
presets_cchamber_tourian_puzzle_j:
    %cm_preset("Puzzle J", #preset_cchamber_tourian_puzzle_j)

presets_cchamber_tourian_puzzle_k:
    %cm_preset("Puzzle K", #preset_cchamber_tourian_puzzle_k)

presets_cchamber_tourian_puzzle_l:
    %cm_preset("Puzzle L", #preset_cchamber_tourian_puzzle_l)

presets_cchamber_tourian_puzzle_m:
    %cm_preset("Puzzle M", #preset_cchamber_tourian_puzzle_m)

presets_cchamber_tourian_invisible_maze:
    %cm_preset("Invisible Maze", #preset_cchamber_tourian_invisible_maze)

presets_cchamber_tourian_ridley:
    %cm_preset("Ridley", #preset_cchamber_tourian_ridley)

presets_cchamber_tourian_puzzle_n:
    %cm_preset("Puzzle N", #preset_cchamber_tourian_puzzle_n)

presets_cchamber_tourian_puzzle_o:
    %cm_preset("Puzzle O", #preset_cchamber_tourian_puzzle_o)

presets_cchamber_tourian_climb_spark:
    %cm_preset("Climb Spark", #preset_cchamber_tourian_climb_spark)


