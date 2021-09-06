PresetsMenuRouteA:
    dw #presets_goto_RouteA_crateria
    dw #$0000
    %cm_header("PRESETS FOR ROUTE A")

presets_goto_RouteA_crateria:
    %cm_submenu("Crateria", #presets_submenu_RouteA_crateria)

presets_submenu_RouteA_crateria:
    dw #presets_RouteA_crateria_ship
    dw #presets_RouteA_crateria_segment_2
    dw #presets_RouteA_crateria_segment_3
    dw #presets_RouteA_crateria_segment_4
    dw #presets_RouteA_crateria_segment_5
    dw #presets_RouteA_crateria_segment_6
    dw #presets_RouteA_crateria_segment_7
    dw #presets_RouteA_crateria_segment_8
    dw #presets_RouteA_crateria_segment_9
    dw #presets_RouteA_crateria_segment_10
    dw #presets_RouteA_crateria_segment_11
    dw #presets_RouteA_crateria_segment_12
    dw #presets_RouteA_crateria_segment_13
    dw #presets_RouteA_crateria_segment_14
    dw #$0000
    %cm_header("CRATERIA")


; Crateria
presets_RouteA_crateria_ship:
    %cm_preset("Ship", #preset_RouteA_crateria_ship)

presets_RouteA_crateria_segment_2:
    %cm_preset("Segment 2", #preset_RouteA_crateria_segment_2)

presets_RouteA_crateria_segment_3:
    %cm_preset("Segment 3", #preset_RouteA_crateria_segment_3)

presets_RouteA_crateria_segment_4:
    %cm_preset("Segment 4", #preset_RouteA_crateria_segment_4)

presets_RouteA_crateria_segment_5:
    %cm_preset("Segment 5", #preset_RouteA_crateria_segment_5)

presets_RouteA_crateria_segment_6:
    %cm_preset("Segment 6", #preset_RouteA_crateria_segment_6)

presets_RouteA_crateria_segment_7:
    %cm_preset("Segment 7", #preset_RouteA_crateria_segment_7)

presets_RouteA_crateria_segment_8:
    %cm_preset("Segment 8", #preset_RouteA_crateria_segment_8)

presets_RouteA_crateria_segment_9:
    %cm_preset("Segment 9", #preset_RouteA_crateria_segment_9)

presets_RouteA_crateria_segment_10:
    %cm_preset("Segment 10", #preset_RouteA_crateria_segment_10)

presets_RouteA_crateria_segment_11:
    %cm_preset("Segment 11", #preset_RouteA_crateria_segment_11)

presets_RouteA_crateria_segment_12:
    %cm_preset("Segment 12", #preset_RouteA_crateria_segment_12)

presets_RouteA_crateria_segment_13:
    %cm_preset("Segment 13", #preset_RouteA_crateria_segment_13)

presets_RouteA_crateria_segment_14:
    %cm_preset("Segment 14", #preset_RouteA_crateria_segment_14)
