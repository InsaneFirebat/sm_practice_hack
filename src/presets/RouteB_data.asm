
preset_RouteB_crateria_ship:
    dw #$0000
    dl $7E078B : db $02 : dw $0000 ; Elevator Index
    dl $7E078D : db $02 : dw $88FE ; DDB
    dl $7E078F : db $02 : dw $0000 ; DoorOut Index
    dl $7E079B : db $02 : dw $91F8 ; MDB
    dl $7E079F : db $02 : dw $0000 ; Region
    dl $7E07C3 : db $02 : dw $C629 ; GFX Pointers
    dl $7E07C5 : db $02 : dw $7CBA ; GFX Pointers
    dl $7E07C7 : db $02 : dw $C2AD ; GFX Pointers
    dl $7E07F3 : db $02 : dw $0006 ; Music Bank
    dl $7E07F5 : db $02 : dw $0005 ; Music Track
    dl $7E090F : db $02 : dw $C000 ; Screen subpixel X position.
    dl $7E0911 : db $02 : dw $03FA ; Screen X position in pixels
    dl $7E0913 : db $02 : dw $0000 ; Screen subpixel Y position
    dl $7E0915 : db $02 : dw $03D3 ; Screen Y position in pixels
    dl $7E093F : db $02 : dw $0000 ; Ceres escape flag
    dl $7E09A2 : db $02 : dw $0000 ; Equipped Items
    dl $7E09A4 : db $02 : dw $0000 ; Collected Items
    dl $7E09A6 : db $02 : dw $0000 ; Beams
    dl $7E09A8 : db $02 : dw $0000 ; Beams
    dl $7E09C0 : db $02 : dw $0000 ; Manual/Auto reserve tank
    dl $7E09C2 : db $02 : dw $0063 ; Health
    dl $7E09C4 : db $02 : dw $0063 ; Max helath
    dl $7E09C6 : db $02 : dw $0000 ; Missiles
    dl $7E09C8 : db $02 : dw $0000 ; Max missiles
    dl $7E09CA : db $02 : dw $0000 ; Supers
    dl $7E09CC : db $02 : dw $0000 ; Max supers
    dl $7E09CE : db $02 : dw $0000 ; Pbs
    dl $7E09D0 : db $02 : dw $0000 ; Max pbs
    dl $7E09D4 : db $02 : dw $0000 ; Max reserves
    dl $7E09D6 : db $02 : dw $0000 ; Reserves
    dl $7E0A1C : db $02 : dw $0002 ; Samus position/state
    dl $7E0A1E : db $02 : dw $0004 ; More position/state
    dl $7E0A68 : db $02 : dw $0000 ; Flash suit
    dl $7E0A76 : db $02 : dw $0000 ; Hyper beam
    dl $7E0AF6 : db $02 : dw $047E ; Samus X
    dl $7E0AFA : db $02 : dw $0443 ; Samus Y
    dl $7E0B3F : db $02 : dw $0000 ; Blue suit
    dl $7ED7C0 : db $02 : dw $0000 ; SRAM copy
    dl $7ED7C2 : db $02 : dw $0000 ; SRAM copy
    dl $7ED7C4 : db $02 : dw $0000 ; SRAM copy
    dl $7ED7C6 : db $02 : dw $0000 ; SRAM copy
    dl $7ED7C8 : db $02 : dw $0800 ; SRAM copy
    dl $7ED7CA : db $02 : dw $0400 ; SRAM copy
    dl $7ED7CC : db $02 : dw $0200 ; SRAM copy
    dl $7ED7CE : db $02 : dw $0100 ; SRAM copy
    dl $7ED7D0 : db $02 : dw $0040 ; SRAM copy
    dl $7ED7D2 : db $02 : dw $0080 ; SRAM copy
    dl $7ED7D4 : db $02 : dw $8000 ; SRAM copy
    dl $7ED7D6 : db $02 : dw $2000 ; SRAM copy
    dl $7ED7D8 : db $02 : dw $4000 ; SRAM copy
    dl $7ED7DA : db $02 : dw $0020 ; SRAM copy
    dl $7ED7DC : db $02 : dw $0010 ; SRAM copy
    dl $7ED7DE : db $02 : dw $0000 ; SRAM copy
    dl $7ED7E0 : db $02 : dw $0063 ; SRAM copy
    dl $7ED7E2 : db $02 : dw $0063 ; SRAM copy
    dl $7ED7E4 : db $02 : dw $0000 ; SRAM copy
    dl $7ED7E6 : db $02 : dw $0000 ; SRAM copy
    dl $7ED7E8 : db $02 : dw $0000 ; SRAM copy
    dl $7ED7EA : db $02 : dw $0000 ; SRAM copy
    dl $7ED7EC : db $02 : dw $0000 ; SRAM copy
    dl $7ED7EE : db $02 : dw $0000 ; SRAM copy
    dl $7ED7F0 : db $02 : dw $0000 ; SRAM copy
    dl $7ED7F2 : db $02 : dw $0000 ; SRAM copy
    dl $7ED7F4 : db $02 : dw $0000 ; SRAM copy
    dl $7ED7F6 : db $02 : dw $0000 ; SRAM copy
    dl $7ED7F8 : db $02 : dw $0039 ; SRAM copy
    dl $7ED7FA : db $02 : dw $0012 ; SRAM copy
    dl $7ED7FC : db $02 : dw $0001 ; SRAM copy
    dl $7ED7FE : db $02 : dw $0000 ; SRAM copy
    dl $7ED800 : db $02 : dw $0000 ; SRAM copy
    dl $7ED802 : db $02 : dw $0001 ; SRAM copy
    dl $7ED804 : db $02 : dw $0001 ; SRAM copy
    dl $7ED806 : db $02 : dw $0001 ; SRAM copy
    dl $7ED808 : db $02 : dw $0000 ; SRAM copy
    dl $7ED80A : db $02 : dw $0000 ; SRAM copy
    dl $7ED80C : db $02 : dw $0000 ; SRAM copy
    dl $7ED80E : db $02 : dw $0000 ; SRAM copy
    dl $7ED810 : db $02 : dw $0000 ; SRAM copy
    dl $7ED812 : db $02 : dw $0000 ; SRAM copy
    dl $7ED814 : db $02 : dw $0000 ; SRAM copy
    dl $7ED816 : db $02 : dw $0000 ; SRAM copy
    dl $7ED818 : db $02 : dw $0000 ; SRAM copy
    dl $7ED81A : db $02 : dw $0000 ; SRAM copy
    dl $7ED81C : db $02 : dw $0000 ; SRAM copy
    dl $7ED81E : db $02 : dw $0000 ; SRAM copy
    dl $7ED820 : db $02 : dw $0000 ; Events, Items, Doors
    dl $7ED822 : db $02 : dw $0000 ; Events, Items, Doors
    dl $7ED824 : db $02 : dw $0000 ; Events, Items, Doors
    dl $7ED826 : db $02 : dw $0000 ; Events, Items, Doors
    dl $7ED828 : db $02 : dw $0000 ; Events, Items, Doors
    dl $7ED82A : db $02 : dw $0000 ; Events, Items, Doors
    dl $7ED82C : db $02 : dw $0000 ; Events, Items, Doors
    dl $7ED82E : db $02 : dw $0001 ; Events, Items, Doors
    dl $7ED830 : db $02 : dw $0000 ; Events, Items, Doors
    dl $7ED832 : db $02 : dw $0000 ; Events, Items, Doors
    dl $7ED834 : db $02 : dw $0000 ; Events, Items, Doors
    dl $7ED836 : db $02 : dw $0000 ; Events, Items, Doors
    dl $7ED838 : db $02 : dw $0000 ; Events, Items, Doors
    dl $7ED83A : db $02 : dw $0000 ; Events, Items, Doors
    dl $7ED83C : db $02 : dw $0000 ; Events, Items, Doors
    dl $7ED83E : db $02 : dw $0000 ; Events, Items, Doors
    dl $7ED840 : db $02 : dw $0000 ; Events, Items, Doors
    dl $7ED842 : db $02 : dw $0000 ; Events, Items, Doors
    dl $7ED844 : db $02 : dw $0000 ; Events, Items, Doors
    dl $7ED846 : db $02 : dw $0000 ; Events, Items, Doors
    dl $7ED848 : db $02 : dw $0000 ; Events, Items, Doors
    dl $7ED84A : db $02 : dw $0000 ; Events, Items, Doors
    dl $7ED84C : db $02 : dw $0000 ; Events, Items, Doors
    dl $7ED84E : db $02 : dw $0000 ; Events, Items, Doors
    dl $7ED850 : db $02 : dw $0000 ; Events, Items, Doors
    dl $7ED852 : db $02 : dw $0000 ; Events, Items, Doors
    dl $7ED854 : db $02 : dw $0000 ; Events, Items, Doors
    dl $7ED856 : db $02 : dw $0000 ; Events, Items, Doors
    dl $7ED858 : db $02 : dw $0000 ; Events, Items, Doors
    dl $7ED85A : db $02 : dw $0000 ; Events, Items, Doors
    dl $7ED85C : db $02 : dw $0000 ; Events, Items, Doors
    dl $7ED85E : db $02 : dw $0000 ; Events, Items, Doors
    dl $7ED860 : db $02 : dw $0000 ; Events, Items, Doors
    dl $7ED862 : db $02 : dw $0000 ; Events, Items, Doors
    dl $7ED864 : db $02 : dw $0000 ; Events, Items, Doors
    dl $7ED866 : db $02 : dw $0000 ; Events, Items, Doors
    dl $7ED868 : db $02 : dw $0000 ; Events, Items, Doors
    dl $7ED86A : db $02 : dw $0000 ; Events, Items, Doors
    dl $7ED86C : db $02 : dw $0000 ; Events, Items, Doors
    dl $7ED86E : db $02 : dw $0000 ; Events, Items, Doors
    dl $7ED870 : db $02 : dw $0000 ; Events, Items, Doors
    dl $7ED872 : db $02 : dw $0000 ; Events, Items, Doors
    dl $7ED874 : db $02 : dw $0000 ; Events, Items, Doors
    dl $7ED876 : db $02 : dw $0000 ; Events, Items, Doors
    dl $7ED878 : db $02 : dw $0000 ; Events, Items, Doors
    dl $7ED87A : db $02 : dw $0000 ; Events, Items, Doors
    dl $7ED87C : db $02 : dw $0000 ; Events, Items, Doors
    dl $7ED87E : db $02 : dw $0000 ; Events, Items, Doors
    dl $7ED880 : db $02 : dw $0000 ; Events, Items, Doors
    dl $7ED882 : db $02 : dw $0000 ; Events, Items, Doors
    dl $7ED884 : db $02 : dw $0000 ; Events, Items, Doors
    dl $7ED886 : db $02 : dw $0000 ; Events, Items, Doors
    dl $7ED888 : db $02 : dw $0000 ; Events, Items, Doors
    dl $7ED88A : db $02 : dw $0000 ; Events, Items, Doors
    dl $7ED88C : db $02 : dw $0000 ; Events, Items, Doors
    dl $7ED88E : db $02 : dw $0000 ; Events, Items, Doors
    dl $7ED890 : db $02 : dw $0000 ; Events, Items, Doors
    dl $7ED892 : db $02 : dw $0000 ; Events, Items, Doors
    dl $7ED894 : db $02 : dw $0000 ; Events, Items, Doors
    dl $7ED896 : db $02 : dw $0000 ; Events, Items, Doors
    dl $7ED898 : db $02 : dw $0000 ; Events, Items, Doors
    dl $7ED89A : db $02 : dw $0000 ; Events, Items, Doors
    dl $7ED89C : db $02 : dw $0000 ; Events, Items, Doors
    dl $7ED89E : db $02 : dw $0000 ; Events, Items, Doors
    dl $7ED8A0 : db $02 : dw $0000 ; Events, Items, Doors
    dl $7ED8A2 : db $02 : dw $0000 ; Events, Items, Doors
    dl $7ED8A4 : db $02 : dw $0000 ; Events, Items, Doors
    dl $7ED8A6 : db $02 : dw $0000 ; Events, Items, Doors
    dl $7ED8A8 : db $02 : dw $0000 ; Events, Items, Doors
    dl $7ED8AA : db $02 : dw $0000 ; Events, Items, Doors
    dl $7ED8AC : db $02 : dw $0000 ; Events, Items, Doors
    dl $7ED8AE : db $02 : dw $0000 ; Events, Items, Doors
    dl $7ED8B0 : db $02 : dw $0000 ; Events, Items, Doors
    dl $7ED8B2 : db $02 : dw $0000 ; Events, Items, Doors
    dl $7ED8B4 : db $02 : dw $0000 ; Events, Items, Doors
    dl $7ED8B6 : db $02 : dw $0000 ; Events, Items, Doors
    dl $7ED8B8 : db $02 : dw $0000 ; Events, Items, Doors
    dl $7ED8BA : db $02 : dw $0000 ; Events, Items, Doors
    dl $7ED8BC : db $02 : dw $0000 ; Events, Items, Doors
    dl $7ED8BE : db $02 : dw $0000 ; Events, Items, Doors
    dl $7ED8C0 : db $02 : dw $0000 ; Events, Items, Doors
    dl $7ED8C2 : db $02 : dw $0000 ; Events, Items, Doors
    dl $7ED8C4 : db $02 : dw $0000 ; Events, Items, Doors
    dl $7ED8C6 : db $02 : dw $0000 ; Events, Items, Doors
    dl $7ED8C8 : db $02 : dw $0000 ; Events, Items, Doors
    dl $7ED8CA : db $02 : dw $0000 ; Events, Items, Doors
    dl $7ED8CC : db $02 : dw $0000 ; Events, Items, Doors
    dl $7ED8CE : db $02 : dw $0000 ; Events, Items, Doors
    dl $7ED8D0 : db $02 : dw $0000 ; Events, Items, Doors
    dl $7ED8D2 : db $02 : dw $0000 ; Events, Items, Doors
    dl $7ED8D4 : db $02 : dw $0000 ; Events, Items, Doors
    dl $7ED8D6 : db $02 : dw $0000 ; Events, Items, Doors
    dl $7ED8D8 : db $02 : dw $0000 ; Events, Items, Doors
    dl $7ED8DA : db $02 : dw $0000 ; Events, Items, Doors
    dl $7ED8DC : db $02 : dw $0000 ; Events, Items, Doors
    dl $7ED8DE : db $02 : dw $0000 ; Events, Items, Doors
    dl $7ED8E0 : db $02 : dw $0000 ; Events, Items, Doors
    dl $7ED8E2 : db $02 : dw $0000 ; Events, Items, Doors
    dl $7ED8E4 : db $02 : dw $0000 ; Events, Items, Doors
    dl $7ED8E6 : db $02 : dw $0000 ; Events, Items, Doors
    dl $7ED8E8 : db $02 : dw $0000 ; Events, Items, Doors
    dl $7ED8EA : db $02 : dw $0000 ; Events, Items, Doors
    dl $7ED8EC : db $02 : dw $0000 ; Events, Items, Doors
    dl $7ED8EE : db $02 : dw $0000 ; Events, Items, Doors
    dl $7ED8F0 : db $02 : dw $0000 ; Events, Items, Doors
    dl $7ED8F2 : db $02 : dw $0000 ; Events, Items, Doors
    dl $7ED8F4 : db $02 : dw $0000 ; Events, Items, Doors
    dl $7ED8F6 : db $02 : dw $0000 ; Events, Items, Doors
    dl $7ED8F8 : db $02 : dw $0001 ; Events, Items, Doors
    dl $7ED8FA : db $02 : dw $0000 ; Events, Items, Doors
    dl $7ED8FC : db $02 : dw $0000 ; Events, Items, Doors
    dl $7ED8FE : db $02 : dw $0000 ; Events, Items, Doors
    dl $7ED900 : db $02 : dw $0000 ; Events, Items, Doors
    dl $7ED902 : db $02 : dw $0000 ; Events, Items, Doors
    dl $7ED904 : db $02 : dw $0000 ; Events, Items, Doors
    dl $7ED906 : db $02 : dw $0000 ; Events, Items, Doors
    dl $7ED908 : db $02 : dw $0000 ; Events, Items, Doors
    dl $7ED90A : db $02 : dw $0000 ; Events, Items, Doors
    dl $7ED90C : db $02 : dw $0000 ; Events, Items, Doors
    dl $7ED90E : db $02 : dw $0000 ; Events, Items, Doors
    dl $7ED910 : db $02 : dw $0000 ; Events, Items, Doors
    dl $7ED912 : db $02 : dw $0000 ; Events, Items, Doors
    dl $7ED914 : db $02 : dw $0005 ; Events, Items, Doors
    dl $7ED916 : db $02 : dw $0000 ; Events, Items, Doors
    dl $7ED918 : db $02 : dw $0000 ; Events, Items, Doors
    dl $7ED91A : db $02 : dw $0000 ; Events, Items, Doors
    dl $7ED91C : db $02 : dw $0000 ; Events, Items, Doors
    dl $7ED91E : db $02 : dw $0000 ; Events, Items, Doors
    dw #$FFFF
.after

preset_RouteB_crateria_morph:
    dw #preset_RouteB_crateria_ship ; Crateria: Ship
    dl $7E078D : db $02 : dw $8976 ; DDB
    dl $7E078F : db $02 : dw $0002 ; DoorOut Index
    dl $7E079B : db $02 : dw $92B3 ; MDB
    dl $7E090F : db $02 : dw $9800 ; Screen subpixel X position.
    dl $7E0911 : db $02 : dw $0100 ; Screen X position in pixels
    dl $7E0913 : db $02 : dw $0400 ; Screen subpixel Y position
    dl $7E0915 : db $02 : dw $0200 ; Screen Y position in pixels
    dl $7E0AF6 : db $02 : dw $0134 ; Samus X
    dl $7E0AFA : db $02 : dw $028B ; Samus Y
    dl $7ED91A : db $02 : dw $0002 ; Events, Items, Doors
    dw #$FFFF
.after

preset_RouteB_crateria_elevator:
    dw #preset_RouteB_crateria_morph ; Crateria: Morph
    dl $7E078D : db $02 : dw $8B9E ; DDB
    dl $7E078F : db $02 : dw $0001 ; DoorOut Index
    dl $7E079B : db $02 : dw $9E9F ; MDB
    dl $7E079F : db $02 : dw $0001 ; Region
    dl $7E07C3 : db $02 : dw $E6B0 ; GFX Pointers
    dl $7E07C5 : db $02 : dw $64BB ; GFX Pointers
    dl $7E07C7 : db $02 : dw $C2B2 ; GFX Pointers
    dl $7E07F5 : db $02 : dw $0007 ; Music Track
    dl $7E090F : db $02 : dw $E000 ; Screen subpixel X position.
    dl $7E0913 : db $02 : dw $0000 ; Screen subpixel Y position
    dl $7E0915 : db $02 : dw $0248 ; Screen Y position in pixels
    dl $7E09A2 : db $02 : dw $0004 ; Equipped Items
    dl $7E09A4 : db $02 : dw $0004 ; Collected Items
    dl $7E0A1C : db $02 : dw $0000 ; Samus position/state
    dl $7E0A1E : db $02 : dw $0000 ; More position/state
    dl $7E0AF6 : db $02 : dw $0180 ; Samus X
    dl $7E0AFA : db $02 : dw $02B8 ; Samus Y
    dl $7ED870 : db $02 : dw $0002 ; Events, Items, Doors
    dl $7ED91A : db $02 : dw $0003 ; Events, Items, Doors
    dw #$FFFF
.after

preset_RouteB_crateria_elevator_2:
    dw #preset_RouteB_crateria_elevator ; Crateria: Elevator
    dl $7E078D : db $02 : dw $8EB6 ; DDB
    dl $7E078F : db $02 : dw $0002 ; DoorOut Index
    dl $7E079B : db $02 : dw $97B5 ; MDB
    dl $7E079F : db $02 : dw $0000 ; Region
    dl $7E07C3 : db $02 : dw $F911 ; GFX Pointers
    dl $7E07C5 : db $02 : dw $43BA ; GFX Pointers
    dl $7E07C7 : db $02 : dw $C2AF ; GFX Pointers
    dl $7E07F5 : db $02 : dw $0003 ; Music Track
    dl $7E090F : db $02 : dw $9000 ; Screen subpixel X position.
    dl $7E0911 : db $02 : dw $0000 ; Screen X position in pixels
    dl $7E0915 : db $02 : dw $0000 ; Screen Y position in pixels
    dl $7E09C6 : db $02 : dw $0005 ; Missiles
    dl $7E09C8 : db $02 : dw $0005 ; Max missiles
    dl $7E0AF6 : db $02 : dw $0080 ; Samus X
    dl $7E0AFA : db $02 : dw $0088 ; Samus Y
    dl $7ED870 : db $02 : dw $0082 ; Events, Items, Doors
    dl $7ED91A : db $02 : dw $0008 ; Events, Items, Doors
    dw #$FFFF
.after

preset_RouteB_crateria_climb:
    dw #preset_RouteB_crateria_elevator_2 ; Crateria: Elevator 2
    dl $7E078D : db $02 : dw $8B4A ; DDB
    dl $7E078F : db $02 : dw $0001 ; DoorOut Index
    dl $7E079B : db $02 : dw $96BA ; MDB
    dl $7E07C3 : db $02 : dw $C629 ; GFX Pointers
    dl $7E07C5 : db $02 : dw $7CBA ; GFX Pointers
    dl $7E07C7 : db $02 : dw $C2AD ; GFX Pointers
    dl $7E07F3 : db $02 : dw $0009 ; Music Bank
    dl $7E07F5 : db $02 : dw $0005 ; Music Track
    dl $7E090F : db $02 : dw $E000 ; Screen subpixel X position.
    dl $7E0911 : db $02 : dw $0700 ; Screen X position in pixels
    dl $7E0913 : db $02 : dw $3000 ; Screen subpixel Y position
    dl $7E0915 : db $02 : dw $0200 ; Screen Y position in pixels
    dl $7E09C6 : db $02 : dw $0004 ; Missiles
    dl $7E0A1C : db $02 : dw $0001 ; Samus position/state
    dl $7E0A1E : db $02 : dw $0008 ; More position/state
    dl $7E0AF6 : db $02 : dw $07C4 ; Samus X
    dl $7E0AFA : db $02 : dw $028B ; Samus Y
    dl $7ED820 : db $02 : dw $0001 ; Events, Items, Doors
    dl $7ED8B0 : db $02 : dw $0100 ; Events, Items, Doors
    dw #$FFFF
.after

preset_RouteB_crateria_bomb_torizo:
    dw #preset_RouteB_crateria_climb ; Crateria: Climb
    dl $7E078D : db $02 : dw $8C82 ; DDB
    dl $7E078F : db $02 : dw $0000 ; DoorOut Index
    dl $7E079B : db $02 : dw $86EE ; MDB
    dl $7E07F3 : db $02 : dw $0006 ; Music Bank
    dl $7E07F5 : db $02 : dw $0006 ; Music Track
    dl $7E090F : db $02 : dw $6000 ; Screen subpixel X position.
    dl $7E0911 : db $02 : dw $0000 ; Screen X position in pixels
    dl $7E0913 : db $02 : dw $0000 ; Screen subpixel Y position
    dl $7E0915 : db $02 : dw $0300 ; Screen Y position in pixels
    dl $7E09C2 : db $02 : dw $0054 ; Health
    dl $7E09C6 : db $02 : dw $0000 ; Missiles
    dl $7E0A1C : db $02 : dw $0002 ; Samus position/state
    dl $7E0A1E : db $02 : dw $0004 ; More position/state
    dl $7E0AF6 : db $02 : dw $004E ; Samus X
    dl $7E0AFA : db $02 : dw $039B ; Samus Y
    dl $7ED8B0 : db $02 : dw $0102 ; Events, Items, Doors
    dl $7ED91A : db $02 : dw $000D ; Events, Items, Doors
    dw #$FFFF
.after

preset_RouteB_brinstar_green_brinstar_elevator:
    dw #preset_RouteB_crateria_bomb_torizo ; Crateria: Bomb Torizo
    dl $7E078D : db $02 : dw $8C0A ; DDB
    dl $7E078F : db $02 : dw $0001 ; DoorOut Index
    dl $7E079B : db $02 : dw $9AD9 ; MDB
    dl $7E079F : db $02 : dw $0001 ; Region
    dl $7E07C3 : db $02 : dw $E6B0 ; GFX Pointers
    dl $7E07C5 : db $02 : dw $64BB ; GFX Pointers
    dl $7E07C7 : db $02 : dw $C2B2 ; GFX Pointers
    dl $7E07F3 : db $02 : dw $000F ; Music Bank
    dl $7E07F5 : db $02 : dw $0005 ; Music Track
    dl $7E090F : db $02 : dw $8000 ; Screen subpixel X position.
    dl $7E0911 : db $02 : dw $0300 ; Screen X position in pixels
    dl $7E0915 : db $02 : dw $0200 ; Screen Y position in pixels
    dl $7E09A2 : db $02 : dw $1004 ; Equipped Items
    dl $7E09A4 : db $02 : dw $1004 ; Collected Items
    dl $7E09C2 : db $02 : dw $0063 ; Health
    dl $7E0A1C : db $02 : dw $0000 ; Samus position/state
    dl $7E0A1E : db $02 : dw $0000 ; More position/state
    dl $7E0AF6 : db $02 : dw $0380 ; Samus X
    dl $7E0AFA : db $02 : dw $0299 ; Samus Y
    dl $7ED828 : db $02 : dw $0004 ; Events, Items, Doors
    dl $7ED870 : db $02 : dw $4082 ; Events, Items, Doors
    dl $7ED8B0 : db $02 : dw $0112 ; Events, Items, Doors
    dl $7ED8B2 : db $02 : dw $0001 ; Events, Items, Doors
    dl $7ED91A : db $02 : dw $0014 ; Events, Items, Doors
    dw #$FFFF
.after

preset_RouteB_brinstar_sporespawn:
    dw #preset_RouteB_brinstar_green_brinstar_elevator ; Brinstar: Green Brinstar Elevator
    dl $7E078D : db $02 : dw $8F3A ; DDB
    dl $7E079B : db $02 : dw $9D19 ; MDB
    dl $7E090F : db $02 : dw $B400 ; Screen subpixel X position.
    dl $7E0911 : db $02 : dw $0000 ; Screen X position in pixels
    dl $7E0913 : db $02 : dw $0FFF ; Screen subpixel Y position
    dl $7E09C2 : db $02 : dw $0040 ; Health
    dl $7E09C6 : db $02 : dw $000A ; Missiles
    dl $7E09C8 : db $02 : dw $000A ; Max missiles
    dl $7E0A1C : db $02 : dw $0002 ; Samus position/state
    dl $7E0A1E : db $02 : dw $0004 ; More position/state
    dl $7E0AF6 : db $02 : dw $0031 ; Samus X
    dl $7E0AFA : db $02 : dw $029B ; Samus Y
    dl $7ED872 : db $02 : dw $0004 ; Events, Items, Doors
    dl $7ED8B2 : db $02 : dw $0011 ; Events, Items, Doors
    dl $7ED91A : db $02 : dw $0018 ; Events, Items, Doors
    dw #$FFFF
.after

preset_RouteB_brinstar_green_hill:
    dw #preset_RouteB_brinstar_sporespawn ; Brinstar: SporeSpawn
    dl $7E078D : db $02 : dw $8DC6 ; DDB
    dl $7E078F : db $02 : dw $0000 ; DoorOut Index
    dl $7E079B : db $02 : dw $9CB3 ; MDB
    dl $7E090F : db $02 : dw $3000 ; Screen subpixel X position.
    dl $7E0911 : db $02 : dw $0600 ; Screen X position in pixels
    dl $7E0913 : db $02 : dw $F800 ; Screen subpixel Y position
    dl $7E0915 : db $02 : dw $001F ; Screen Y position in pixels
    dl $7E09A6 : db $02 : dw $1000 ; Beams
    dl $7E09A8 : db $02 : dw $1000 ; Beams
    dl $7E09C2 : db $02 : dw $0045 ; Health
    dl $7E0A1C : db $02 : dw $0001 ; Samus position/state
    dl $7E0A1E : db $02 : dw $0008 ; More position/state
    dl $7E0AF6 : db $02 : dw $06D0 ; Samus X
    dl $7E0AFA : db $02 : dw $008B ; Samus Y
    dl $7ED828 : db $02 : dw $0204 ; Events, Items, Doors
    dl $7ED872 : db $02 : dw $0006 ; Events, Items, Doors
    dl $7ED8B2 : db $02 : dw $1011 ; Events, Items, Doors
    dl $7ED91A : db $02 : dw $001E ; Events, Items, Doors
    dw #$FFFF
.after

preset_RouteB_brinstar_springball:
    dw #preset_RouteB_brinstar_green_hill ; Brinstar: Green Hill
    dl $7E078D : db $02 : dw $8FD6 ; DDB
    dl $7E079B : db $02 : dw $9AD9 ; MDB
    dl $7E090F : db $02 : dw $0FFF ; Screen subpixel X position.
    dl $7E0913 : db $02 : dw $0000 ; Screen subpixel Y position
    dl $7E0915 : db $02 : dw $0021 ; Screen Y position in pixels
    dl $7E09C2 : db $02 : dw $004F ; Health
    dl $7E0AF6 : db $02 : dw $06C5 ; Samus X
    dl $7ED91A : db $02 : dw $001F ; Events, Items, Doors
    dw #$FFFF
.after

preset_RouteB_brinstar_spikeway:
    dw #preset_RouteB_brinstar_springball ; Brinstar: SpringBall
    dl $7E078D : db $02 : dw $8EFE ; DDB
    dl $7E079B : db $02 : dw $A0A4 ; MDB
    dl $7E090F : db $02 : dw $6000 ; Screen subpixel X position.
    dl $7E0911 : db $02 : dw $0000 ; Screen X position in pixels
    dl $7E0913 : db $02 : dw $3000 ; Screen subpixel Y position
    dl $7E0915 : db $02 : dw $0100 ; Screen Y position in pixels
    dl $7E09A2 : db $02 : dw $1006 ; Equipped Items
    dl $7E09A4 : db $02 : dw $1006 ; Collected Items
    dl $7E09C2 : db $02 : dw $0046 ; Health
    dl $7E09C6 : db $02 : dw $0005 ; Missiles
    dl $7E0AF6 : db $02 : dw $00C9 ; Samus X
    dl $7E0AFA : db $02 : dw $018B ; Samus Y
    dl $7ED874 : db $02 : dw $0001 ; Events, Items, Doors
    dl $7ED8B4 : db $02 : dw $0140 ; Events, Items, Doors
    dl $7ED91A : db $02 : dw $0022 ; Events, Items, Doors
    dw #$FFFF
.after

preset_RouteB_brinstar_red_brinstar:
    dw #preset_RouteB_brinstar_spikeway ; Brinstar: SpikeWay
    dl $7E078D : db $02 : dw $9096 ; DDB
    dl $7E079B : db $02 : dw $9C5E ; MDB
    dl $7E090F : db $02 : dw $1000 ; Screen subpixel X position.
    dl $7E0911 : db $02 : dw $0200 ; Screen X position in pixels
    dl $7E0913 : db $02 : dw $4C00 ; Screen subpixel Y position
    dl $7E0915 : db $02 : dw $0000 ; Screen Y position in pixels
    dl $7E09C2 : db $02 : dw $0063 ; Health
    dl $7E09C6 : db $02 : dw $0007 ; Missiles
    dl $7E0AF6 : db $02 : dw $02C9 ; Samus X
    dl $7E0AFA : db $02 : dw $008B ; Samus Y
    dl $7ED91A : db $02 : dw $0024 ; Events, Items, Doors
    dw #$FFFF
.after

preset_RouteB_brinstar_etank_hallway:
    dw #preset_RouteB_brinstar_red_brinstar ; Brinstar: Red Brinstar
    dl $7E078D : db $02 : dw $9132 ; DDB
    dl $7E079B : db $02 : dw $A322 ; MDB
    dl $7E07C3 : db $02 : dw $A5AA ; GFX Pointers
    dl $7E07C5 : db $02 : dw $5FBC ; GFX Pointers
    dl $7E07C7 : db $02 : dw $C2B3 ; GFX Pointers
    dl $7E07F3 : db $02 : dw $0012 ; Music Bank
    dl $7E0911 : db $02 : dw $0000 ; Screen X position in pixels
    dl $7E0913 : db $02 : dw $7C00 ; Screen subpixel Y position
    dl $7E0915 : db $02 : dw $054C ; Screen Y position in pixels
    dl $7E09A2 : db $02 : dw $1007 ; Equipped Items
    dl $7E09A4 : db $02 : dw $1007 ; Collected Items
    dl $7E09C2 : db $02 : dw $0036 ; Health
    dl $7E09C6 : db $02 : dw $0008 ; Missiles
    dl $7E09C8 : db $02 : dw $000F ; Max missiles
    dl $7E0AF6 : db $02 : dw $00C6 ; Samus X
    dl $7E0AFA : db $02 : dw $05BB ; Samus Y
    dl $7ED874 : db $02 : dw $0015 ; Events, Items, Doors
    dl $7ED8B4 : db $02 : dw $0340 ; Events, Items, Doors
    dl $7ED8C2 : db $02 : dw $0001 ; Events, Items, Doors
    dl $7ED91A : db $02 : dw $0029 ; Events, Items, Doors
    dw #$FFFF
.after

preset_RouteB_brinstar_kraids_lair:
    dw #preset_RouteB_brinstar_etank_hallway ; Brinstar: E-Tank Hallway
    dl $7E078D : db $02 : dw $AEDA ; DDB
    dl $7E078F : db $02 : dw $0005 ; DoorOut Index
    dl $7E079B : db $02 : dw $A471 ; MDB
    dl $7E090F : db $02 : dw $A000 ; Screen subpixel X position.
    dl $7E0911 : db $02 : dw $0200 ; Screen X position in pixels
    dl $7E0913 : db $02 : dw $0000 ; Screen subpixel Y position
    dl $7E0915 : db $02 : dw $011F ; Screen Y position in pixels
    dl $7E09C2 : db $02 : dw $00B8 ; Health
    dl $7E09C4 : db $02 : dw $00C7 ; Max helath
    dl $7E09C6 : db $02 : dw $000B ; Missiles
    dl $7E0AF6 : db $02 : dw $02CC ; Samus X
    dl $7E0AFA : db $02 : dw $018B ; Samus Y
    dl $7ED874 : db $02 : dw $0017 ; Events, Items, Doors
    dl $7ED91A : db $02 : dw $002C ; Events, Items, Doors
    dw #$FFFF
.after

preset_RouteB_brinstar_kraid:
    dw #preset_RouteB_brinstar_kraids_lair ; Brinstar: Kraids Lair
    dl $7E078D : db $02 : dw $919E ; DDB
    dl $7E078F : db $02 : dw $0001 ; DoorOut Index
    dl $7E079B : db $02 : dw $A56B ; MDB
    dl $7E07F3 : db $02 : dw $0027 ; Music Bank
    dl $7E07F5 : db $02 : dw $0006 ; Music Track
    dl $7E090F : db $02 : dw $0000 ; Screen subpixel X position.
    dl $7E0911 : db $02 : dw $0100 ; Screen X position in pixels
    dl $7E0913 : db $02 : dw $3800 ; Screen subpixel Y position
    dl $7E0915 : db $02 : dw $0100 ; Screen Y position in pixels
    dl $7E09C2 : db $02 : dw $00BF ; Health
    dl $7E0AF6 : db $02 : dw $01CD ; Samus X
    dl $7ED8B4 : db $02 : dw $8340 ; Events, Items, Doors
    dl $7ED8B6 : db $02 : dw $0004 ; Events, Items, Doors
    dw #$FFFF
.after

preset_RouteB_brinstar_water_tank:
    dw #preset_RouteB_brinstar_kraid ; Brinstar: Kraid
    dl $7E078D : db $02 : dw $913E ; DDB
    dl $7E078F : db $02 : dw $0000 ; DoorOut Index
    dl $7E079B : db $02 : dw $A253 ; MDB
    dl $7E07F3 : db $02 : dw $0012 ; Music Bank
    dl $7E07F5 : db $02 : dw $0005 ; Music Track
    dl $7E090F : db $02 : dw $AFFF ; Screen subpixel X position.
    dl $7E0911 : db $02 : dw $0000 ; Screen X position in pixels
    dl $7E0913 : db $02 : dw $CBFF ; Screen subpixel Y position
    dl $7E0915 : db $02 : dw $0508 ; Screen Y position in pixels
    dl $7E09A2 : db $02 : dw $1107 ; Equipped Items
    dl $7E09A4 : db $02 : dw $1107 ; Collected Items
    dl $7E09C2 : db $02 : dw $00BD ; Health
    dl $7E09C6 : db $02 : dw $0008 ; Missiles
    dl $7E0A1C : db $02 : dw $0002 ; Samus position/state
    dl $7E0A1E : db $02 : dw $0004 ; More position/state
    dl $7E0AF6 : db $02 : dw $0039 ; Samus X
    dl $7E0AFA : db $02 : dw $058B ; Samus Y
    dl $7ED828 : db $02 : dw $0304 ; Events, Items, Doors
    dl $7ED874 : db $02 : dw $0037 ; Events, Items, Doors
    dl $7ED91A : db $02 : dw $002E ; Events, Items, Doors
    dw #$FFFF
.after

preset_RouteB_upper_norfair_upper_norfair_elevator:
    dw #preset_RouteB_brinstar_water_tank ; Brinstar: Water Tank
    dl $7E078D : db $02 : dw $9246 ; DDB
    dl $7E078F : db $02 : dw $0002 ; DoorOut Index
    dl $7E079B : db $02 : dw $A7DE ; MDB
    dl $7E079F : db $02 : dw $0002 ; Region
    dl $7E07C3 : db $02 : dw $C3F9 ; GFX Pointers
    dl $7E07C5 : db $02 : dw $BBBD ; GFX Pointers
    dl $7E07C7 : db $02 : dw $C2B6 ; GFX Pointers
    dl $7E07F3 : db $02 : dw $0015 ; Music Bank
    dl $7E090F : db $02 : dw $0000 ; Screen subpixel X position.
    dl $7E0913 : db $02 : dw $0000 ; Screen subpixel Y position
    dl $7E0915 : db $02 : dw $0219 ; Screen Y position in pixels
    dl $7E09C2 : db $02 : dw $0090 ; Health
    dl $7E09C6 : db $02 : dw $000E ; Missiles
    dl $7E0A1C : db $02 : dw $009B ; Samus position/state
    dl $7E0A1E : db $02 : dw $0000 ; More position/state
    dl $7E0AF6 : db $02 : dw $0080 ; Samus X
    dl $7E0AFA : db $02 : dw $0289 ; Samus Y
    dl $7ED91A : db $02 : dw $0030 ; Events, Items, Doors
    dw #$FFFF
.after

preset_RouteB_upper_norfair_hot_spring:
    dw #preset_RouteB_upper_norfair_upper_norfair_elevator ; Upper Norfair: Upper Norfair Elevator
    dl $7E078D : db $02 : dw $9282 ; DDB
    dl $7E078F : db $02 : dw $0001 ; DoorOut Index
    dl $7E079B : db $02 : dw $A8F8 ; MDB
    dl $7E090F : db $02 : dw $B000 ; Screen subpixel X position.
    dl $7E0913 : db $02 : dw $3000 ; Screen subpixel Y position
    dl $7E0915 : db $02 : dw $0600 ; Screen Y position in pixels
    dl $7E09C2 : db $02 : dw $006D ; Health
    dl $7E0A1C : db $02 : dw $0002 ; Samus position/state
    dl $7E0A1E : db $02 : dw $0004 ; More position/state
    dl $7E0AF6 : db $02 : dw $003E ; Samus X
    dl $7E0AFA : db $02 : dw $068B ; Samus Y
    dl $7ED91A : db $02 : dw $0031 ; Events, Items, Doors
    dw #$FFFF
.after

preset_RouteB_upper_norfair_super_missiles:
    dw #preset_RouteB_upper_norfair_hot_spring ; Upper Norfair: Hot Spring
    dl $7E078D : db $02 : dw $944A ; DDB
    dl $7E078F : db $02 : dw $0002 ; DoorOut Index
    dl $7E079B : db $02 : dw $A9E5 ; MDB
    dl $7E07C5 : db $02 : dw $E4BD ; GFX Pointers
    dl $7E07C7 : db $02 : dw $C2B5 ; GFX Pointers
    dl $7E07F5 : db $02 : dw $0003 ; Music Track
    dl $7E090F : db $02 : dw $3000 ; Screen subpixel X position.
    dl $7E0915 : db $02 : dw $0000 ; Screen Y position in pixels
    dl $7E09C2 : db $02 : dw $0063 ; Health
    dl $7E09C6 : db $02 : dw $0006 ; Missiles
    dl $7E09CA : db $02 : dw $0005 ; Supers
    dl $7E09CC : db $02 : dw $0005 ; Max supers
    dl $7E0A1C : db $02 : dw $0001 ; Samus position/state
    dl $7E0A1E : db $02 : dw $0008 ; More position/state
    dl $7E0AF6 : db $02 : dw $007C ; Samus X
    dl $7E0AFA : db $02 : dw $00AB ; Samus Y
    dl $7ED876 : db $02 : dw $0010 ; Events, Items, Doors
    dl $7ED8B8 : db $02 : dw $0008 ; Events, Items, Doors
    dl $7ED91A : db $02 : dw $0032 ; Events, Items, Doors
    dw #$FFFF
.after

preset_RouteB_upper_norfair_unknown:
    dw #preset_RouteB_upper_norfair_super_missiles ; Upper Norfair: Super Missiles
    dl $7E078D : db $02 : dw $AFC2 ; DDB
    dl $7E079B : db $02 : dw $A923 ; MDB
    dl $7E07F5 : db $02 : dw $0005 ; Music Track
    dl $7E090F : db $02 : dw $5000 ; Screen subpixel X position.
    dl $7E0913 : db $02 : dw $9BFF ; Screen subpixel Y position
    dl $7E0915 : db $02 : dw $0300 ; Screen Y position in pixels
    dl $7E09C2 : db $02 : dw $012B ; Health
    dl $7E09C4 : db $02 : dw $012B ; Max helath
    dl $7E09C6 : db $02 : dw $000F ; Missiles
    dl $7E0A1C : db $02 : dw $0002 ; Samus position/state
    dl $7E0A1E : db $02 : dw $0004 ; More position/state
    dl $7E0AF6 : db $02 : dw $0036 ; Samus X
    dl $7E0AFA : db $02 : dw $038B ; Samus Y
    dl $7ED876 : db $02 : dw $0050 ; Events, Items, Doors
    dl $7ED8B8 : db $02 : dw $0018 ; Events, Items, Doors
    dl $7ED91A : db $02 : dw $0034 ; Events, Items, Doors
    dw #$FFFF
.after

preset_RouteB_upper_norfair_road_to_ice_beam:
    dw #preset_RouteB_upper_norfair_unknown ; Upper Norfair: Unknown
    dl $7E078D : db $02 : dw $973E ; DDB
    dl $7E078F : db $02 : dw $0001 ; DoorOut Index
    dl $7E079B : db $02 : dw $A7DE ; MDB
    dl $7E07C5 : db $02 : dw $BBBD ; GFX Pointers
    dl $7E07C7 : db $02 : dw $C2B6 ; GFX Pointers
    dl $7E090F : db $02 : dw $FB80 ; Screen subpixel X position.
    dl $7E0913 : db $02 : dw $3C00 ; Screen subpixel Y position
    dl $7E0915 : db $02 : dw $0211 ; Screen Y position in pixels
    dl $7E09C2 : db $02 : dw $00E7 ; Health
    dl $7E09CA : db $02 : dw $0004 ; Supers
    dl $7E0AF6 : db $02 : dw $004F ; Samus X
    dl $7E0AFA : db $02 : dw $028B ; Samus Y
    dl $7ED8B8 : db $02 : dw $0058 ; Events, Items, Doors
    dl $7ED91A : db $02 : dw $0035 ; Events, Items, Doors
    dw #$FFFF
.after

preset_RouteB_upper_norfair_the_four_horsemen:
    dw #preset_RouteB_upper_norfair_road_to_ice_beam ; Upper Norfair: Road to Ice Beam
    dl $7E090F : db $02 : dw $7000 ; Screen subpixel X position.
    dl $7E0913 : db $02 : dw $4000 ; Screen subpixel Y position
    dl $7E0915 : db $02 : dw $0513 ; Screen Y position in pixels
    dl $7E09A6 : db $02 : dw $1002 ; Beams
    dl $7E09A8 : db $02 : dw $1002 ; Beams
    dl $7E09C2 : db $02 : dw $0107 ; Health
    dl $7E09CA : db $02 : dw $0005 ; Supers
    dl $7E0A1C : db $02 : dw $0001 ; Samus position/state
    dl $7E0A1E : db $02 : dw $0008 ; More position/state
    dl $7E0AF6 : db $02 : dw $00B2 ; Samus X
    dl $7E0AFA : db $02 : dw $059B ; Samus Y
    dl $7ED876 : db $02 : dw $0052 ; Events, Items, Doors
    dl $7ED91A : db $02 : dw $0037 ; Events, Items, Doors
    dw #$FFFF
.after

preset_RouteB_upper_norfair_bubble_mountain_supers:
    dw #preset_RouteB_upper_norfair_the_four_horsemen ; Upper Norfair: The Four Horsemen
    dl $7E078D : db $02 : dw $9582 ; DDB
    dl $7E078F : db $02 : dw $0004 ; DoorOut Index
    dl $7E079B : db $02 : dw $AB07 ; MDB
    dl $7E07C5 : db $02 : dw $E4BD ; GFX Pointers
    dl $7E07C7 : db $02 : dw $C2B5 ; GFX Pointers
    dl $7E090F : db $02 : dw $D000 ; Screen subpixel X position.
    dl $7E0913 : db $02 : dw $0000 ; Screen subpixel Y position
    dl $7E0915 : db $02 : dw $0129 ; Screen Y position in pixels
    dl $7E09C2 : db $02 : dw $012B ; Health
    dl $7E09CA : db $02 : dw $0009 ; Supers
    dl $7E09CC : db $02 : dw $000A ; Max supers
    dl $7E0A1C : db $02 : dw $0002 ; Samus position/state
    dl $7E0A1E : db $02 : dw $0004 ; More position/state
    dl $7E0AF6 : db $02 : dw $003A ; Samus X
    dl $7E0AFA : db $02 : dw $01BB ; Samus Y
    dl $7ED876 : db $02 : dw $1052 ; Events, Items, Doors
    dl $7ED8B8 : db $02 : dw $2458 ; Events, Items, Doors
    dl $7ED91A : db $02 : dw $0038 ; Events, Items, Doors
    dw #$FFFF
.after

preset_RouteB_upper_norfair_blue_gate_glich:
    dw #preset_RouteB_upper_norfair_bubble_mountain_supers ; Upper Norfair: Bubble Mountain Supers
    dl $7E078D : db $02 : dw $955E ; DDB
    dl $7E078F : db $02 : dw $0001 ; DoorOut Index
    dl $7E090F : db $02 : dw $F000 ; Screen subpixel X position.
    dl $7E0913 : db $02 : dw $BC00 ; Screen subpixel Y position
    dl $7E0915 : db $02 : dw $0402 ; Screen Y position in pixels
    dl $7E09C2 : db $02 : dw $0112 ; Health
    dl $7E09CA : db $02 : dw $000A ; Supers
    dl $7E0A1C : db $02 : dw $0001 ; Samus position/state
    dl $7E0A1E : db $02 : dw $0008 ; More position/state
    dl $7E0AF6 : db $02 : dw $00CE ; Samus X
    dl $7E0AFA : db $02 : dw $048B ; Samus Y
    dl $7ED91A : db $02 : dw $0039 ; Events, Items, Doors
    dw #$FFFF
.after

preset_RouteB_upper_norfair_speed_way:
    dw #preset_RouteB_upper_norfair_blue_gate_glich ; Upper Norfair: Blue Gate Glich
    dl $7E078D : db $02 : dw $95B2 ; DDB
    dl $7E079B : db $02 : dw $AD1B ; MDB
    dl $7E07F5 : db $02 : dw $0003 ; Music Track
    dl $7E090F : db $02 : dw $D000 ; Screen subpixel X position.
    dl $7E0913 : db $02 : dw $1C00 ; Screen subpixel Y position
    dl $7E0915 : db $02 : dw $0000 ; Screen Y position in pixels
    dl $7E09A2 : db $02 : dw $3107 ; Equipped Items
    dl $7E09A4 : db $02 : dw $3107 ; Collected Items
    dl $7E09C2 : db $02 : dw $012B ; Health
    dl $7E09CA : db $02 : dw $0009 ; Supers
    dl $7E0A1C : db $02 : dw $0002 ; Samus position/state
    dl $7E0A1E : db $02 : dw $0004 ; More position/state
    dl $7E0AF6 : db $02 : dw $002E ; Samus X
    dl $7E0AFA : db $02 : dw $008B ; Samus Y
    dl $7ED876 : db $02 : dw $9052 ; Events, Items, Doors
    dl $7ED8BA : db $02 : dw $0002 ; Events, Items, Doors
    dl $7ED91A : db $02 : dw $003A ; Events, Items, Doors
    dw #$FFFF
.after

preset_RouteB_upper_norfair_speed_ball:
    dw #preset_RouteB_upper_norfair_speed_way ; Upper Norfair: Speed Way
    dl $7E078D : db $02 : dw $955E ; DDB
    dl $7E079B : db $02 : dw $AB07 ; MDB
    dl $7E07F5 : db $02 : dw $0005 ; Music Track
    dl $7E090F : db $02 : dw $0000 ; Screen subpixel X position.
    dl $7E0913 : db $02 : dw $BC00 ; Screen subpixel Y position
    dl $7E0915 : db $02 : dw $0200 ; Screen Y position in pixels
    dl $7E09C2 : db $02 : dw $00EF ; Health
    dl $7E09C6 : db $02 : dw $0005 ; Missiles
    dl $7E09CA : db $02 : dw $000A ; Supers
    dl $7E0AF6 : db $02 : dw $0033 ; Samus X
    dl $7E0AFA : db $02 : dw $025B ; Samus Y
    dl $7ED822 : db $02 : dw $0020 ; Events, Items, Doors
    dl $7ED91A : db $02 : dw $003C ; Events, Items, Doors
    dw #$FFFF
.after

preset_RouteB_upper_norfair_zero_mission:
    dw #preset_RouteB_upper_norfair_speed_ball ; Upper Norfair: Speed Ball
    dl $7E078D : db $02 : dw $928E ; DDB
    dl $7E078F : db $02 : dw $0000 ; DoorOut Index
    dl $7E079B : db $02 : dw $B026 ; MDB
    dl $7E07C3 : db $02 : dw $860B ; GFX Pointers
    dl $7E07C5 : db $02 : dw $58C0 ; GFX Pointers
    dl $7E07C7 : db $02 : dw $C2BE ; GFX Pointers
    dl $7E090F : db $02 : dw $E000 ; Screen subpixel X position.
    dl $7E0913 : db $02 : dw $7400 ; Screen subpixel Y position
    dl $7E0915 : db $02 : dw $0000 ; Screen Y position in pixels
    dl $7E09C2 : db $02 : dw $00CA ; Health
    dl $7E0AF6 : db $02 : dw $0036 ; Samus X
    dl $7E0AFA : db $02 : dw $008B ; Samus Y
    dl $7ED91A : db $02 : dw $003F ; Events, Items, Doors
    dw #$FFFF
.after

preset_RouteB_upper_norfair_energy_spark:
    dw #preset_RouteB_upper_norfair_zero_mission ; Upper Norfair: Zero Mission
    dl $7E078D : db $02 : dw $973E ; DDB
    dl $7E078F : db $02 : dw $0001 ; DoorOut Index
    dl $7E079B : db $02 : dw $A7DE ; MDB
    dl $7E07C3 : db $02 : dw $C3F9 ; GFX Pointers
    dl $7E07C5 : db $02 : dw $BBBD ; GFX Pointers
    dl $7E07C7 : db $02 : dw $C2B6 ; GFX Pointers
    dl $7E090F : db $02 : dw $9000 ; Screen subpixel X position.
    dl $7E0913 : db $02 : dw $3800 ; Screen subpixel Y position
    dl $7E0915 : db $02 : dw $0320 ; Screen Y position in pixels
    dl $7E09C2 : db $02 : dw $00FD ; Health
    dl $7E09C6 : db $02 : dw $000F ; Missiles
    dl $7E09CA : db $02 : dw $0009 ; Supers
    dl $7E0A1C : db $02 : dw $0001 ; Samus position/state
    dl $7E0A1E : db $02 : dw $0008 ; More position/state
    dl $7E0AF6 : db $02 : dw $00B6 ; Samus X
    dl $7E0AFA : db $02 : dw $039B ; Samus Y
    dl $7ED8B6 : db $02 : dw $2004 ; Events, Items, Doors
    dw #$FFFF
.after

preset_RouteB_upper_norfair_spark_again:
    dw #preset_RouteB_upper_norfair_energy_spark ; Upper Norfair: Energy Spark
    dl $7E078D : db $02 : dw $94CE ; DDB
    dl $7E078F : db $02 : dw $0000 ; DoorOut Index
    dl $7E079B : db $02 : dw $A815 ; MDB
    dl $7E090F : db $02 : dw $6000 ; Screen subpixel X position.
    dl $7E0911 : db $02 : dw $0500 ; Screen X position in pixels
    dl $7E0913 : db $02 : dw $0400 ; Screen subpixel Y position
    dl $7E0915 : db $02 : dw $002A ; Screen Y position in pixels
    dl $7E09C2 : db $02 : dw $00F4 ; Health
    dl $7E09C4 : db $02 : dw $01F3 ; Max helath
    dl $7E09C6 : db $02 : dw $0004 ; Missiles
    dl $7E0AF6 : db $02 : dw $05C5 ; Samus X
    dl $7E0AFA : db $02 : dw $00BB ; Samus Y
    dl $7ED872 : db $02 : dw $0007 ; Events, Items, Doors
    dl $7ED876 : db $02 : dw $9056 ; Events, Items, Doors
    dl $7ED8B8 : db $02 : dw $245A ; Events, Items, Doors
    dl $7ED8BA : db $02 : dw $0006 ; Events, Items, Doors
    dl $7ED91A : db $02 : dw $0041 ; Events, Items, Doors
    dw #$FFFF
.after

preset_RouteB_upper_norfair_grapplebeam:
    dw #preset_RouteB_upper_norfair_spark_again ; Upper Norfair: Spark Again
    dl $7E078D : db $02 : dw $B0B0 ; DDB
    dl $7E078F : db $02 : dw $0003 ; DoorOut Index
    dl $7E079B : db $02 : dw $B192 ; MDB
    dl $7E07C5 : db $02 : dw $E4BD ; GFX Pointers
    dl $7E07C7 : db $02 : dw $C2B5 ; GFX Pointers
    dl $7E090F : db $02 : dw $E000 ; Screen subpixel X position.
    dl $7E0911 : db $02 : dw $0600 ; Screen X position in pixels
    dl $7E0913 : db $02 : dw $8400 ; Screen subpixel Y position
    dl $7E0915 : db $02 : dw $039C ; Screen Y position in pixels
    dl $7E09C2 : db $02 : dw $01A8 ; Health
    dl $7E09C6 : db $02 : dw $000C ; Missiles
    dl $7E09CA : db $02 : dw $000A ; Supers
    dl $7E0AF6 : db $02 : dw $069B ; Samus X
    dl $7E0AFA : db $02 : dw $042B ; Samus Y
    dl $7ED8BA : db $02 : dw $000E ; Events, Items, Doors
    dl $7ED91A : db $02 : dw $0043 ; Events, Items, Doors
    dw #$FFFF
.after

preset_RouteB_upper_norfair_grapple_way:
    dw #preset_RouteB_upper_norfair_grapplebeam ; Upper Norfair: GrappleBeam
    dl $7E078D : db $02 : dw $97F2 ; DDB
    dl $7E078F : db $02 : dw $0000 ; DoorOut Index
    dl $7E090F : db $02 : dw $3000 ; Screen subpixel X position.
    dl $7E0913 : db $02 : dw $0000 ; Screen subpixel Y position
    dl $7E0915 : db $02 : dw $04C8 ; Screen Y position in pixels
    dl $7E09A2 : db $02 : dw $7107 ; Equipped Items
    dl $7E09A4 : db $02 : dw $7107 ; Collected Items
    dl $7E09C2 : db $02 : dw $016C ; Health
    dl $7E0A1C : db $02 : dw $0002 ; Samus position/state
    dl $7E0A1E : db $02 : dw $0004 ; More position/state
    dl $7E0AF6 : db $02 : dw $062E ; Samus X
    dl $7E0AFA : db $02 : dw $055B ; Samus Y
    dl $7ED878 : db $02 : dw $0004 ; Events, Items, Doors
    dl $7ED91A : db $02 : dw $0044 ; Events, Items, Doors
    dw #$FFFF
.after

preset_RouteB_upper_norfair_the_real_bubble_mountain:
    dw #preset_RouteB_upper_norfair_grapple_way ; Upper Norfair: Grapple Way
    dl $7E078D : db $02 : dw $9762 ; DDB
    dl $7E078F : db $02 : dw $0002 ; DoorOut Index
    dl $7E079B : db $02 : dw $B0DD ; MDB
    dl $7E090F : db $02 : dw $4000 ; Screen subpixel X position.
    dl $7E0913 : db $02 : dw $8000 ; Screen subpixel Y position
    dl $7E0915 : db $02 : dw $0024 ; Screen Y position in pixels
    dl $7E09C2 : db $02 : dw $01F3 ; Health
    dl $7E09C6 : db $02 : dw $000F ; Missiles
    dl $7E0A1C : db $02 : dw $0001 ; Samus position/state
    dl $7E0A1E : db $02 : dw $0008 ; More position/state
    dl $7E0AF6 : db $02 : dw $06CE ; Samus X
    dl $7E0AFA : db $02 : dw $008B ; Samus Y
    dl $7ED91A : db $02 : dw $0046 ; Events, Items, Doors
    dw #$FFFF
.after

preset_RouteB_maridia_maridia_elevator:
    dw #preset_RouteB_upper_norfair_the_real_bubble_mountain ; Upper Norfair: The Real Bubble Mountain
    dl $7E078D : db $02 : dw $9756 ; DDB
    dl $7E078F : db $02 : dw $0001 ; DoorOut Index
    dl $7E079B : db $02 : dw $D765 ; MDB
    dl $7E079F : db $02 : dw $0004 ; Region
    dl $7E07C3 : db $02 : dw $B130 ; GFX Pointers
    dl $7E07C5 : db $02 : dw $3CBE ; GFX Pointers
    dl $7E07C7 : db $02 : dw $C2B8 ; GFX Pointers
    dl $7E07F5 : db $02 : dw $0003 ; Music Track
    dl $7E090F : db $02 : dw $8000 ; Screen subpixel X position.
    dl $7E0911 : db $02 : dw $0000 ; Screen X position in pixels
    dl $7E0913 : db $02 : dw $0000 ; Screen subpixel Y position
    dl $7E0915 : db $02 : dw $0000 ; Screen Y position in pixels
    dl $7E09C2 : db $02 : dw $01BC ; Health
    dl $7E09CA : db $02 : dw $0009 ; Supers
    dl $7E0A1C : db $02 : dw $009B ; Samus position/state
    dl $7E0A1E : db $02 : dw $0000 ; More position/state
    dl $7E0AF6 : db $02 : dw $0080 ; Samus X
    dl $7E0AFA : db $02 : dw $0088 ; Samus Y
    dl $7ED8BA : db $02 : dw $002E ; Events, Items, Doors
    dw #$FFFF
.after

preset_RouteB_maridia_water_jump:
    dw #preset_RouteB_maridia_maridia_elevator ; Maridia: Maridia Elevator
    dl $7E078D : db $02 : dw $A60C ; DDB
    dl $7E079B : db $02 : dw $D340 ; MDB
    dl $7E07F3 : db $02 : dw $001B ; Music Bank
    dl $7E07F5 : db $02 : dw $0006 ; Music Track
    dl $7E090F : db $02 : dw $36C0 ; Screen subpixel X position.
    dl $7E0913 : db $02 : dw $7000 ; Screen subpixel Y position
    dl $7E0915 : db $02 : dw $0300 ; Screen Y position in pixels
    dl $7E09C2 : db $02 : dw $0162 ; Health
    dl $7E09C6 : db $02 : dw $000B ; Missiles
    dl $7E09CA : db $02 : dw $0008 ; Supers
    dl $7E0A1C : db $02 : dw $0002 ; Samus position/state
    dl $7E0A1E : db $02 : dw $0004 ; More position/state
    dl $7E0AF6 : db $02 : dw $002F ; Samus X
    dl $7E0AFA : db $02 : dw $038B ; Samus Y
    dl $7ED8BC : db $02 : dw $0800 ; Events, Items, Doors
    dw #$FFFF
.after

preset_RouteB_maridia_bootwon:
    dw #preset_RouteB_maridia_water_jump ; Maridia: Water Jump
    dl $7E078D : db $02 : dw $A504 ; DDB
    dl $7E079B : db $02 : dw $D08A ; MDB
    dl $7E090F : db $02 : dw $0C00 ; Screen subpixel X position.
    dl $7E0911 : db $02 : dw $0400 ; Screen X position in pixels
    dl $7E0913 : db $02 : dw $5000 ; Screen subpixel Y position
    dl $7E0915 : db $02 : dw $0000 ; Screen Y position in pixels
    dl $7E09C2 : db $02 : dw $0174 ; Health
    dl $7E09C6 : db $02 : dw $000A ; Missiles
    dl $7E09CA : db $02 : dw $0009 ; Supers
    dl $7E0A1C : db $02 : dw $0001 ; Samus position/state
    dl $7E0A1E : db $02 : dw $0008 ; More position/state
    dl $7E0AF6 : db $02 : dw $04C8 ; Samus X
    dl $7E0AFA : db $02 : dw $008B ; Samus Y
    dl $7ED8B2 : db $02 : dw $3011 ; Events, Items, Doors
    dl $7ED8BC : db $02 : dw $0A00 ; Events, Items, Doors
    dl $7ED91A : db $02 : dw $0047 ; Events, Items, Doors
    dw #$FFFF
.after

preset_RouteB_maridia_sand_pit:
    dw #preset_RouteB_maridia_bootwon ; Maridia: Bootwon
    dl $7E078D : db $02 : dw $A750 ; DDB
    dl $7E078F : db $02 : dw $0000 ; DoorOut Index
    dl $7E079B : db $02 : dw $D6D0 ; MDB
    dl $7E090F : db $02 : dw $2B4E ; Screen subpixel X position.
    dl $7E0911 : db $02 : dw $0200 ; Screen X position in pixels
    dl $7E0913 : db $02 : dw $0000 ; Screen subpixel Y position
    dl $7E0915 : db $02 : dw $00CD ; Screen Y position in pixels
    dl $7E09C2 : db $02 : dw $0130 ; Health
    dl $7E09C6 : db $02 : dw $0002 ; Missiles
    dl $7E09CA : db $02 : dw $0000 ; Supers
    dl $7E09CE : db $02 : dw $0003 ; Pbs
    dl $7E09D0 : db $02 : dw $0005 ; Max pbs
    dl $7E0AF6 : db $02 : dw $02C7 ; Samus X
    dl $7E0AFA : db $02 : dw $015B ; Samus Y
    dl $7ED82C : db $02 : dw $0002 ; Events, Items, Doors
    dl $7ED87A : db $02 : dw $0004 ; Events, Items, Doors
    dl $7ED8B6 : db $02 : dw $2005 ; Events, Items, Doors
    dl $7ED91A : db $02 : dw $0048 ; Events, Items, Doors
    dw #$FFFF
.after

preset_RouteB_maridia_grappleway_underwater:
    dw #preset_RouteB_maridia_sand_pit ; Maridia: Sand Pit
    dl $7E078D : db $02 : dw $A600 ; DDB
    dl $7E079B : db $02 : dw $D48E ; MDB
    dl $7E090F : db $02 : dw $4001 ; Screen subpixel X position.
    dl $7E0911 : db $02 : dw $0000 ; Screen X position in pixels
    dl $7E0913 : db $02 : dw $7000 ; Screen subpixel Y position
    dl $7E0915 : db $02 : dw $0104 ; Screen Y position in pixels
    dl $7E09C2 : db $02 : dw $0133 ; Health
    dl $7E09C6 : db $02 : dw $0001 ; Missiles
    dl $7E09CA : db $02 : dw $0001 ; Supers
    dl $7E09CE : db $02 : dw $0001 ; Pbs
    dl $7E0A1C : db $02 : dw $0002 ; Samus position/state
    dl $7E0A1E : db $02 : dw $0004 ; More position/state
    dl $7E0AF6 : db $02 : dw $0035 ; Samus X
    dl $7E0AFA : db $02 : dw $018B ; Samus Y
    dl $7ED8B4 : db $02 : dw $8348 ; Events, Items, Doors
    dl $7ED8BC : db $02 : dw $0E00 ; Events, Items, Doors
    dl $7ED91A : db $02 : dw $0049 ; Events, Items, Doors
    dw #$FFFF
.after

preset_RouteB_wrecked_ship_wrecked_ship_elevator:
    dw #preset_RouteB_maridia_grappleway_underwater ; Maridia: GrappleWay UnderWater
    dl $7E078D : db $02 : dw $B260 ; DDB
    dl $7E078F : db $02 : dw $0002 ; DoorOut Index
    dl $7E079B : db $02 : dw $94CC ; MDB
    dl $7E079F : db $02 : dw $0000 ; Region
    dl $7E07C3 : db $02 : dw $F911 ; GFX Pointers
    dl $7E07C5 : db $02 : dw $43BA ; GFX Pointers
    dl $7E07C7 : db $02 : dw $C2AF ; GFX Pointers
    dl $7E07F5 : db $02 : dw $0003 ; Music Track
    dl $7E090F : db $02 : dw $9000 ; Screen subpixel X position.
    dl $7E0913 : db $02 : dw $0000 ; Screen subpixel Y position
    dl $7E0915 : db $02 : dw $0000 ; Screen Y position in pixels
    dl $7E09A2 : db $02 : dw $7127 ; Equipped Items
    dl $7E09A4 : db $02 : dw $7127 ; Collected Items
    dl $7E09C2 : db $02 : dw $010B ; Health
    dl $7E09C6 : db $02 : dw $0003 ; Missiles
    dl $7E09CE : db $02 : dw $0005 ; Pbs
    dl $7E0A1C : db $02 : dw $009B ; Samus position/state
    dl $7E0A1E : db $02 : dw $0000 ; More position/state
    dl $7E0AF6 : db $02 : dw $0080 ; Samus X
    dl $7E0AFA : db $02 : dw $0089 ; Samus Y
    dl $7ED820 : db $02 : dw $0801 ; Events, Items, Doors
    dl $7ED830 : db $02 : dw $0001 ; Events, Items, Doors
    dl $7ED870 : db $02 : dw $4086 ; Events, Items, Doors
    dl $7ED8BC : db $02 : dw $1E00 ; Events, Items, Doors
    dl $7ED8C2 : db $02 : dw $0003 ; Events, Items, Doors
    dl $7ED91A : db $02 : dw $004C ; Events, Items, Doors
    dw #$FFFF
.after

preset_RouteB_wrecked_ship_wrecked_ship_2:
    dw #preset_RouteB_wrecked_ship_wrecked_ship_elevator ; Wrecked Ship: Wrecked Ship Elevator
    dl $7E078D : db $02 : dw $B1E8 ; DDB
    dl $7E078F : db $02 : dw $0005 ; DoorOut Index
    dl $7E079B : db $02 : dw $CA08 ; MDB
    dl $7E07C3 : db $02 : dw $C629 ; GFX Pointers
    dl $7E07C5 : db $02 : dw $7CBA ; GFX Pointers
    dl $7E07C7 : db $02 : dw $C2AD ; GFX Pointers
    dl $7E07F3 : db $02 : dw $0006 ; Music Bank
    dl $7E07F5 : db $02 : dw $0005 ; Music Track
    dl $7E090F : db $02 : dw $1D3F ; Screen subpixel X position.
    dl $7E0911 : db $02 : dw $0800 ; Screen X position in pixels
    dl $7E0915 : db $02 : dw $01FB ; Screen Y position in pixels
    dl $7E09C2 : db $02 : dw $0135 ; Health
    dl $7E09C6 : db $02 : dw $000F ; Missiles
    dl $7E09CA : db $02 : dw $0008 ; Supers
    dl $7E0A1C : db $02 : dw $0001 ; Samus position/state
    dl $7E0A1E : db $02 : dw $0008 ; More position/state
    dl $7E0AF6 : db $02 : dw $08CA ; Samus X
    dl $7E0AFA : db $02 : dw $028B ; Samus Y
    dl $7ED8BA : db $02 : dw $402E ; Events, Items, Doors
    dl $7ED91A : db $02 : dw $0050 ; Events, Items, Doors
    dw #$FFFF
.after

preset_RouteB_wrecked_ship_phantoon:
    dw #preset_RouteB_wrecked_ship_wrecked_ship_2 ; Wrecked Ship: Wrecked Ship
    dl $7E078D : db $02 : dw $A1D4 ; DDB
    dl $7E078F : db $02 : dw $0001 ; DoorOut Index
    dl $7E079B : db $02 : dw $CC6F ; MDB
    dl $7E079F : db $02 : dw $0003 ; Region
    dl $7E07C3 : db $02 : dw $AE9E ; GFX Pointers
    dl $7E07C5 : db $02 : dw $A6BB ; GFX Pointers
    dl $7E07C7 : db $02 : dw $C2B1 ; GFX Pointers
    dl $7E07F3 : db $02 : dw $0030 ; Music Bank
    dl $7E090F : db $02 : dw $6400 ; Screen subpixel X position.
    dl $7E0911 : db $02 : dw $0100 ; Screen X position in pixels
    dl $7E0915 : db $02 : dw $0000 ; Screen Y position in pixels
    dl $7E09C2 : db $02 : dw $00E0 ; Health
    dl $7E09C6 : db $02 : dw $000C ; Missiles
    dl $7E09CA : db $02 : dw $0007 ; Supers
    dl $7E09CE : db $02 : dw $0004 ; Pbs
    dl $7E0AF6 : db $02 : dw $01D1 ; Samus X
    dl $7E0AFA : db $02 : dw $008B ; Samus Y
    dl $7ED8BA : db $02 : dw $502E ; Events, Items, Doors
    dl $7ED8BC : db $02 : dw $1E0A ; Events, Items, Doors
    dl $7ED91A : db $02 : dw $0053 ; Events, Items, Doors
    dw #$FFFF
.after

preset_RouteB_wrecked_ship_wave_beam:
    dw #preset_RouteB_wrecked_ship_phantoon ; Wrecked Ship: Phantoon
    dl $7E078D : db $02 : dw $A2F4 ; DDB
    dl $7E078F : db $02 : dw $0000 ; DoorOut Index
    dl $7E079B : db $02 : dw $CBD5 ; MDB
    dl $7E07C5 : db $02 : dw $E7BB ; GFX Pointers
    dl $7E07C7 : db $02 : dw $C2B0 ; GFX Pointers
    dl $7E07F5 : db $02 : dw $0006 ; Music Track
    dl $7E090F : db $02 : dw $1000 ; Screen subpixel X position.
    dl $7E0911 : db $02 : dw $0000 ; Screen X position in pixels
    dl $7E0915 : db $02 : dw $0400 ; Screen Y position in pixels
    dl $7E09C2 : db $02 : dw $0074 ; Health
    dl $7E09C8 : db $02 : dw $0014 ; Max missiles
    dl $7E09CA : db $02 : dw $000A ; Supers
    dl $7E09CE : db $02 : dw $0003 ; Pbs
    dl $7E0AF6 : db $02 : dw $0034 ; Samus X
    dl $7E0AFA : db $02 : dw $048B ; Samus Y
    dl $7ED82A : db $02 : dw $0100 ; Events, Items, Doors
    dl $7ED878 : db $02 : dw $0104 ; Events, Items, Doors
    dl $7ED91A : db $02 : dw $0056 ; Events, Items, Doors
    dw #$FFFF
.after

preset_RouteB_lower_norfair_maridia_elevator_2:
    dw #preset_RouteB_wrecked_ship_wave_beam ; Wrecked Ship: Wave Beam
    dl $7E078D : db $02 : dw $8A5A ; DDB
    dl $7E078F : db $02 : dw $0001 ; DoorOut Index
    dl $7E079B : db $02 : dw $D3DF ; MDB
    dl $7E079F : db $02 : dw $0004 ; Region
    dl $7E07C3 : db $02 : dw $B130 ; GFX Pointers
    dl $7E07C5 : db $02 : dw $3CBE ; GFX Pointers
    dl $7E07C7 : db $02 : dw $C2B8 ; GFX Pointers
    dl $7E07F3 : db $02 : dw $001B ; Music Bank
    dl $7E090F : db $02 : dw $8000 ; Screen subpixel X position.
    dl $7E0915 : db $02 : dw $0208 ; Screen Y position in pixels
    dl $7E09A6 : db $02 : dw $1003 ; Beams
    dl $7E09A8 : db $02 : dw $1003 ; Beams
    dl $7E09C2 : db $02 : dw $0023 ; Health
    dl $7E09CE : db $02 : dw $0004 ; Pbs
    dl $7E0A1C : db $02 : dw $009B ; Samus position/state
    dl $7E0A1E : db $02 : dw $0000 ; More position/state
    dl $7E0AF6 : db $02 : dw $0080 ; Samus X
    dl $7E0AFA : db $02 : dw $0298 ; Samus Y
    dl $7ED878 : db $02 : dw $0504 ; Events, Items, Doors
    dl $7ED91A : db $02 : dw $005E ; Events, Items, Doors
    dw #$FFFF
.after

preset_RouteB_lower_norfair_upper_norfair_elevator_2:
    dw #preset_RouteB_lower_norfair_maridia_elevator_2 ; Lower Norfair: Maridia Elevator 2
    dl $7E078D : db $02 : dw $B284 ; DDB
    dl $7E079B : db $02 : dw $AFCE ; MDB
    dl $7E079F : db $02 : dw $0002 ; Region
    dl $7E07C3 : db $02 : dw $C3F9 ; GFX Pointers
    dl $7E07C5 : db $02 : dw $BBBD ; GFX Pointers
    dl $7E07C7 : db $02 : dw $C2B6 ; GFX Pointers
    dl $7E07F3 : db $02 : dw $0015 ; Music Bank
    dl $7E07F5 : db $02 : dw $0005 ; Music Track
    dl $7E090F : db $02 : dw $C000 ; Screen subpixel X position.
    dl $7E0915 : db $02 : dw $0200 ; Screen Y position in pixels
    dl $7E09C2 : db $02 : dw $0046 ; Health
    dl $7E09CE : db $02 : dw $0005 ; Pbs
    dw #$FFFF
.after

preset_RouteB_lower_norfair_road_to_lower_norfair:
    dw #preset_RouteB_lower_norfair_upper_norfair_elevator_2 ; Lower Norfair: Upper Norfair Elevator 2
    dl $7E078D : db $02 : dw $9762 ; DDB
    dl $7E078F : db $02 : dw $0002 ; DoorOut Index
    dl $7E079B : db $02 : dw $B0DD ; MDB
    dl $7E07C5 : db $02 : dw $E4BD ; GFX Pointers
    dl $7E07C7 : db $02 : dw $C2B5 ; GFX Pointers
    dl $7E090F : db $02 : dw $4000 ; Screen subpixel X position.
    dl $7E0913 : db $02 : dw $13FF ; Screen subpixel Y position
    dl $7E0915 : db $02 : dw $0112 ; Screen Y position in pixels
    dl $7E09C2 : db $02 : dw $01E4 ; Health
    dl $7E09C6 : db $02 : dw $0011 ; Missiles
    dl $7E09CE : db $02 : dw $000A ; Pbs
    dl $7E09D0 : db $02 : dw $000A ; Max pbs
    dl $7E0A1C : db $02 : dw $0002 ; Samus position/state
    dl $7E0A1E : db $02 : dw $0004 ; More position/state
    dl $7E0AF6 : db $02 : dw $0035 ; Samus X
    dl $7E0AFA : db $02 : dw $018B ; Samus Y
    dl $7ED878 : db $02 : dw $0505 ; Events, Items, Doors
    dl $7ED91A : db $02 : dw $0061 ; Events, Items, Doors
    dw #$FFFF
.after

preset_RouteB_lower_norfair_lavadive:
    dw #preset_RouteB_lower_norfair_road_to_lower_norfair ; Lower Norfair: Road to Lower Norfair
    dl $7E078D : db $02 : dw $9672 ; DDB
    dl $7E078F : db $02 : dw $0001 ; DoorOut Index
    dl $7E079B : db $02 : dw $AEDF ; MDB
    dl $7E090F : db $02 : dw $5000 ; Screen subpixel X position.
    dl $7E0913 : db $02 : dw $0000 ; Screen subpixel Y position
    dl $7E0915 : db $02 : dw $0400 ; Screen Y position in pixels
    dl $7E09C2 : db $02 : dw $01F1 ; Health
    dl $7E09C6 : db $02 : dw $0014 ; Missiles
    dl $7E09CE : db $02 : dw $0008 ; Pbs
    dl $7E0A1C : db $02 : dw $0001 ; Samus position/state
    dl $7E0A1E : db $02 : dw $0008 ; More position/state
    dl $7E0AF6 : db $02 : dw $0080 ; Samus X
    dl $7E0AFA : db $02 : dw $049B ; Samus Y
    dl $7ED8B8 : db $02 : dw $2C5A ; Events, Items, Doors
    dl $7ED91A : db $02 : dw $0063 ; Events, Items, Doors
    dw #$FFFF
.after

preset_RouteB_lower_norfair_lower_norfair_elevator:
    dw #preset_RouteB_lower_norfair_lavadive ; Lower Norfair: LavaDive
    dl $7E078D : db $02 : dw $96F6 ; DDB
    dl $7E079B : db $02 : dw $B236 ; MDB
    dl $7E07F3 : db $02 : dw $0018 ; Music Bank
    dl $7E090F : db $02 : dw $6000 ; Screen subpixel X position.
    dl $7E0911 : db $02 : dw $0700 ; Screen X position in pixels
    dl $7E0915 : db $02 : dw $0200 ; Screen Y position in pixels
    dl $7E09C2 : db $02 : dw $0193 ; Health
    dl $7E09CE : db $02 : dw $0007 ; Pbs
    dl $7E0A1C : db $02 : dw $009B ; Samus position/state
    dl $7E0A1E : db $02 : dw $0000 ; More position/state
    dl $7E0AF6 : db $02 : dw $0780 ; Samus X
    dl $7E0AFA : db $02 : dw $0289 ; Samus Y
    dl $7ED8BA : db $02 : dw $502F ; Events, Items, Doors
    dw #$FFFF
.after

preset_RouteB_lower_norfair_screw_attack:
    dw #preset_RouteB_lower_norfair_lower_norfair_elevator ; Lower Norfair: Lower Norfair Elevator
    dl $7E078D : db $02 : dw $998A ; DDB
    dl $7E078F : db $02 : dw $0002 ; DoorOut Index
    dl $7E079B : db $02 : dw $B6C1 ; MDB
    dl $7E07F5 : db $02 : dw $0003 ; Music Track
    dl $7E090F : db $02 : dw $8380 ; Screen subpixel X position.
    dl $7E0911 : db $02 : dw $0100 ; Screen X position in pixels
    dl $7E0913 : db $02 : dw $4800 ; Screen subpixel Y position
    dl $7E0915 : db $02 : dw $001F ; Screen Y position in pixels
    dl $7E09A2 : db $02 : dw $712F ; Equipped Items
    dl $7E09A4 : db $02 : dw $712F ; Collected Items
    dl $7E09C2 : db $02 : dw $0165 ; Health
    dl $7E09CA : db $02 : dw $0000 ; Supers
    dl $7E0A1C : db $02 : dw $0002 ; Samus position/state
    dl $7E0A1E : db $02 : dw $0004 ; More position/state
    dl $7E0AF6 : db $02 : dw $01AF ; Samus X
    dl $7E0AFA : db $02 : dw $00B4 ; Samus Y
    dl $7ED87A : db $02 : dw $4004 ; Events, Items, Doors
    dl $7ED8BE : db $02 : dw $2000 ; Events, Items, Doors
    dl $7ED91A : db $02 : dw $0064 ; Events, Items, Doors
    dw #$FFFF
.after

preset_RouteB_lower_norfair_the_red_room:
    dw #preset_RouteB_lower_norfair_screw_attack ; Lower Norfair: Screw Attack
    dl $7E078D : db $02 : dw $9972 ; DDB
    dl $7E078F : db $02 : dw $0003 ; DoorOut Index
    dl $7E079B : db $02 : dw $B236 ; MDB
    dl $7E07F5 : db $02 : dw $0005 ; Music Track
    dl $7E090F : db $02 : dw $C000 ; Screen subpixel X position.
    dl $7E0911 : db $02 : dw $0000 ; Screen X position in pixels
    dl $7E0913 : db $02 : dw $0000 ; Screen subpixel Y position
    dl $7E0915 : db $02 : dw $001C ; Screen Y position in pixels
    dl $7E09C2 : db $02 : dw $00EC ; Health
    dl $7E09CA : db $02 : dw $0005 ; Supers
    dl $7E09CE : db $02 : dw $0006 ; Pbs
    dl $7E0AF6 : db $02 : dw $002F ; Samus X
    dl $7E0AFA : db $02 : dw $008B ; Samus Y
    dw #$FFFF
.after

preset_RouteB_lower_norfair_health_refill:
    dw #preset_RouteB_lower_norfair_the_red_room ; Lower Norfair: The Red Room
    dl $7E078D : db $02 : dw $98EE ; DDB
    dl $7E078F : db $02 : dw $0004 ; DoorOut Index
    dl $7E079B : db $02 : dw $B305 ; MDB
    dl $7E07C3 : db $02 : dw $860B ; GFX Pointers
    dl $7E07C5 : db $02 : dw $58C0 ; GFX Pointers
    dl $7E07C7 : db $02 : dw $C2BE ; GFX Pointers
    dl $7E090F : db $02 : dw $8000 ; Screen subpixel X position.
    dl $7E0913 : db $02 : dw $0400 ; Screen subpixel Y position
    dl $7E0915 : db $02 : dw $0000 ; Screen Y position in pixels
    dl $7E09C2 : db $02 : dw $01F3 ; Health
    dl $7E09CE : db $02 : dw $0007 ; Pbs
    dl $7E0AF6 : db $02 : dw $0037 ; Samus X
    dl $7ED8C0 : db $02 : dw $0002 ; Events, Items, Doors
    dw #$FFFF
.after

preset_RouteB_lower_norfair_metal_pirates:
    dw #preset_RouteB_lower_norfair_health_refill ; Lower Norfair: Health Refill
    dl $7E078D : db $02 : dw $995A ; DDB
    dl $7E078F : db $02 : dw $0000 ; DoorOut Index
    dl $7E079B : db $02 : dw $9104 ; MDB
    dl $7E07C3 : db $02 : dw $C3F9 ; GFX Pointers
    dl $7E07C5 : db $02 : dw $E4BD ; GFX Pointers
    dl $7E07C7 : db $02 : dw $C2B5 ; GFX Pointers
    dl $7E090F : db $02 : dw $B000 ; Screen subpixel X position.
    dl $7E0913 : db $02 : dw $D000 ; Screen subpixel Y position
    dl $7E0915 : db $02 : dw $0300 ; Screen Y position in pixels
    dl $7E09C2 : db $02 : dw $01C1 ; Health
    dl $7E09CA : db $02 : dw $0009 ; Supers
    dl $7E09CE : db $02 : dw $0008 ; Pbs
    dl $7E0AF6 : db $02 : dw $0030 ; Samus X
    dl $7E0AFA : db $02 : dw $038B ; Samus Y
    dl $7ED8C0 : db $02 : dw $000E ; Events, Items, Doors
    dw #$FFFF
.after

preset_RouteB_lower_norfair_ridley:
    dw #preset_RouteB_lower_norfair_metal_pirates ; Lower Norfair: Metal Pirates
    dl $7E078D : db $02 : dw $9A32 ; DDB
    dl $7E079B : db $02 : dw $B37A ; MDB
    dl $7E090F : db $02 : dw $7000 ; Screen subpixel X position.
    dl $7E0913 : db $02 : dw $C400 ; Screen subpixel Y position
    dl $7E0915 : db $02 : dw $0000 ; Screen Y position in pixels
    dl $7E09C2 : db $02 : dw $01EA ; Health
    dl $7E09CE : db $02 : dw $000A ; Pbs
    dl $7E0AF6 : db $02 : dw $0035 ; Samus X
    dl $7E0AFA : db $02 : dw $009B ; Samus Y
    dl $7ED8C0 : db $02 : dw $003E ; Events, Items, Doors
    dw #$FFFF
.after

preset_RouteB_lower_norfair_chilean_climb:
    dw #preset_RouteB_lower_norfair_ridley ; Lower Norfair: Ridley
    dl $7E078D : db $02 : dw $B430 ; DDB
    dl $7E078F : db $02 : dw $0001 ; DoorOut Index
    dl $7E079B : db $02 : dw $B6EE ; MDB
    dl $7E07C5 : db $02 : dw $BBBD ; GFX Pointers
    dl $7E07C7 : db $02 : dw $C2B6 ; GFX Pointers
    dl $7E090F : db $02 : dw $F680 ; Screen subpixel X position.
    dl $7E0911 : db $02 : dw $0500 ; Screen X position in pixels
    dl $7E0913 : db $02 : dw $1800 ; Screen subpixel Y position
    dl $7E09C2 : db $02 : dw $00F6 ; Health
    dl $7E09C6 : db $02 : dw $000C ; Missiles
    dl $7E09C8 : db $02 : dw $0019 ; Max missiles
    dl $7E09CA : db $02 : dw $0004 ; Supers
    dl $7E09CE : db $02 : dw $0009 ; Pbs
    dl $7E0A1C : db $02 : dw $0001 ; Samus position/state
    dl $7E0A1E : db $02 : dw $0008 ; More position/state
    dl $7E0AF6 : db $02 : dw $05CE ; Samus X
    dl $7E0AFA : db $02 : dw $005C ; Samus Y
    dl $7ED82A : db $02 : dw $0101 ; Events, Items, Doors
    dl $7ED87C : db $02 : dw $0002 ; Events, Items, Doors
    dl $7ED91A : db $02 : dw $0065 ; Events, Items, Doors
    dw #$FFFF
.after

preset_RouteB_lower_norfair_zero_mission_dejavu:
    dw #preset_RouteB_lower_norfair_chilean_climb ; Lower Norfair: Chilean Climb
    dl $7E078D : db $02 : dw $928E ; DDB
    dl $7E078F : db $02 : dw $0000 ; DoorOut Index
    dl $7E079B : db $02 : dw $B026 ; MDB
    dl $7E07C3 : db $02 : dw $860B ; GFX Pointers
    dl $7E07C5 : db $02 : dw $58C0 ; GFX Pointers
    dl $7E07C7 : db $02 : dw $C2BE ; GFX Pointers
    dl $7E07F3 : db $02 : dw $0015 ; Music Bank
    dl $7E090F : db $02 : dw $D000 ; Screen subpixel X position.
    dl $7E0911 : db $02 : dw $0000 ; Screen X position in pixels
    dl $7E0913 : db $02 : dw $2800 ; Screen subpixel Y position
    dl $7E09C2 : db $02 : dw $010A ; Health
    dl $7E09CA : db $02 : dw $0005 ; Supers
    dl $7E09CE : db $02 : dw $000A ; Pbs
    dl $7E0A1C : db $02 : dw $0002 ; Samus position/state
    dl $7E0A1E : db $02 : dw $0004 ; More position/state
    dl $7E0AF6 : db $02 : dw $0032 ; Samus X
    dl $7E0AFA : db $02 : dw $008B ; Samus Y
    dl $7ED91A : db $02 : dw $0068 ; Events, Items, Doors
    dw #$FFFF
.after

preset_RouteB_lower_norfair_elevator_climb:
    dw #preset_RouteB_lower_norfair_zero_mission_dejavu ; Lower Norfair: Zero Mission DeJaVu
    dl $7E078D : db $02 : dw $938A ; DDB
    dl $7E079B : db $02 : dw $AFA3 ; MDB
    dl $7E07C3 : db $02 : dw $C3F9 ; GFX Pointers
    dl $7E07C5 : db $02 : dw $E4BD ; GFX Pointers
    dl $7E07C7 : db $02 : dw $C2B5 ; GFX Pointers
    dl $7E090F : db $02 : dw $7000 ; Screen subpixel X position.
    dl $7E0911 : db $02 : dw $0500 ; Screen X position in pixels
    dl $7E0913 : db $02 : dw $5C00 ; Screen subpixel Y position
    dl $7E09C2 : db $02 : dw $01F3 ; Health
    dl $7E09C6 : db $02 : dw $0019 ; Missiles
    dl $7E09CA : db $02 : dw $000A ; Supers
    dl $7E0A1C : db $02 : dw $0001 ; Samus position/state
    dl $7E0A1E : db $02 : dw $0008 ; More position/state
    dl $7E0AF6 : db $02 : dw $05D7 ; Samus X
    dw #$FFFF
.after

preset_RouteB_red_tower_red_tower_elevator:
    dw #preset_RouteB_lower_norfair_elevator_climb ; Lower Norfair: Elevator Climb
    dl $7E078D : db $02 : dw $92EE ; DDB
    dl $7E078F : db $02 : dw $0004 ; DoorOut Index
    dl $7E079B : db $02 : dw $A6A1 ; MDB
    dl $7E079F : db $02 : dw $0001 ; Region
    dl $7E07C3 : db $02 : dw $A5AA ; GFX Pointers
    dl $7E07C5 : db $02 : dw $5FBC ; GFX Pointers
    dl $7E07C7 : db $02 : dw $C2B3 ; GFX Pointers
    dl $7E07F3 : db $02 : dw $0012 ; Music Bank
    dl $7E07F5 : db $02 : dw $0003 ; Music Track
    dl $7E090F : db $02 : dw $4000 ; Screen subpixel X position.
    dl $7E0911 : db $02 : dw $0000 ; Screen X position in pixels
    dl $7E0913 : db $02 : dw $0000 ; Screen subpixel Y position
    dl $7E0A1C : db $02 : dw $009B ; Samus position/state
    dl $7E0A1E : db $02 : dw $0000 ; More position/state
    dl $7E0AF6 : db $02 : dw $0080 ; Samus X
    dl $7E0AFA : db $02 : dw $0086 ; Samus Y
    dl $7ED91A : db $02 : dw $0069 ; Events, Items, Doors
    dw #$FFFF
.after

preset_RouteB_red_tower_red_tower_climb:
    dw #preset_RouteB_red_tower_red_tower_elevator ; Red Tower: Red Tower Elevator
    dl $7E078D : db $02 : dw $90DE ; DDB
    dl $7E078F : db $02 : dw $0000 ; DoorOut Index
    dl $7E079B : db $02 : dw $A408 ; MDB
    dl $7E07F5 : db $02 : dw $0005 ; Music Track
    dl $7E090F : db $02 : dw $C000 ; Screen subpixel X position.
    dl $7E0911 : db $02 : dw $0400 ; Screen X position in pixels
    dl $7E0915 : db $02 : dw $0003 ; Screen Y position in pixels
    dl $7E09C2 : db $02 : dw $0195 ; Health
    dl $7E0A1C : db $02 : dw $0001 ; Samus position/state
    dl $7E0A1E : db $02 : dw $0008 ; More position/state
    dl $7E0AF6 : db $02 : dw $04C7 ; Samus X
    dl $7E0AFA : db $02 : dw $008B ; Samus Y
    dl $7ED91A : db $02 : dw $006A ; Events, Items, Doors
    dw #$FFFF
.after

preset_RouteB_red_tower_water_spike_corridor:
    dw #preset_RouteB_red_tower_red_tower_climb ; Red Tower: Red Tower Climb
    dl $7E078D : db $02 : dw $907E ; DDB
    dl $7E079B : db $02 : dw $A293 ; MDB
    dl $7E090F : db $02 : dw $1000 ; Screen subpixel X position.
    dl $7E0915 : db $02 : dw $0000 ; Screen Y position in pixels
    dl $7E09C2 : db $02 : dw $01A3 ; Health
    dl $7E0AF6 : db $02 : dw $04D0 ; Samus X
    dl $7ED91A : db $02 : dw $006B ; Events, Items, Doors
    dw #$FFFF
.after

preset_RouteB_maridia_return_maridia_entrace:
    dw #preset_RouteB_red_tower_water_spike_corridor ; Red Tower: Water Spike Corridor
    dl $7E078D : db $02 : dw $A360 ; DDB
    dl $7E079B : db $02 : dw $CEFB ; MDB
    dl $7E079F : db $02 : dw $0004 ; Region
    dl $7E07C3 : db $02 : dw $B130 ; GFX Pointers
    dl $7E07C5 : db $02 : dw $3CBE ; GFX Pointers
    dl $7E07C7 : db $02 : dw $C2B8 ; GFX Pointers
    dl $7E090F : db $02 : dw $A000 ; Screen subpixel X position.
    dl $7E0911 : db $02 : dw $0000 ; Screen X position in pixels
    dl $7E0913 : db $02 : dw $3C00 ; Screen subpixel Y position
    dl $7E0915 : db $02 : dw $006F ; Screen Y position in pixels
    dl $7E09C2 : db $02 : dw $01B5 ; Health
    dl $7E0AF6 : db $02 : dw $007F ; Samus X
    dl $7E0AFA : db $02 : dw $0103 ; Samus Y
    dw #$FFFF
.after

preset_RouteB_maridia_return_red_tubes:
    dw #preset_RouteB_maridia_return_maridia_entrace ; Maridia Return: Maridia Entrace
    dl $7E078D : db $02 : dw $A438 ; DDB
    dl $7E078F : db $02 : dw $0001 ; DoorOut Index
    dl $7E079B : db $02 : dw $CFC9 ; MDB
    dl $7E07F3 : db $02 : dw $001B ; Music Bank
    dl $7E07F5 : db $02 : dw $0006 ; Music Track
    dl $7E090F : db $02 : dw $E000 ; Screen subpixel X position.
    dl $7E0913 : db $02 : dw $0000 ; Screen subpixel Y position
    dl $7E0915 : db $02 : dw $001B ; Screen Y position in pixels
    dl $7E09C2 : db $02 : dw $01B1 ; Health
    dl $7E09CA : db $02 : dw $0009 ; Supers
    dl $7E0A1C : db $02 : dw $0002 ; Samus position/state
    dl $7E0A1E : db $02 : dw $0004 ; More position/state
    dl $7E0AF6 : db $02 : dw $002D ; Samus X
    dl $7E0AFA : db $02 : dw $008B ; Samus Y
    dl $7ED8BE : db $02 : dw $2001 ; Events, Items, Doors
    dl $7ED91A : db $02 : dw $006C ; Events, Items, Doors
    dw #$FFFF
.after

preset_RouteB_maridia_return_halfie_spark:
    dw #preset_RouteB_maridia_return_red_tubes ; Maridia Return: Red Tubes
    dl $7E078D : db $02 : dw $A4B0 ; DDB
    dl $7E078F : db $02 : dw $0000 ; DoorOut Index
    dl $7E079B : db $02 : dw $D617 ; MDB
    dl $7E07C3 : db $02 : dw $E78D ; GFX Pointers
    dl $7E07C5 : db $02 : dw $2EBE ; GFX Pointers
    dl $7E07C7 : db $02 : dw $C2B9 ; GFX Pointers
    dl $7E07F5 : db $02 : dw $0005 ; Music Track
    dl $7E090F : db $02 : dw $8000 ; Screen subpixel X position.
    dl $7E0911 : db $02 : dw $0276 ; Screen X position in pixels
    dl $7E0913 : db $02 : dw $8000 ; Screen subpixel Y position
    dl $7E0915 : db $02 : dw $01EB ; Screen Y position in pixels
    dl $7E09C2 : db $02 : dw $01F3 ; Health
    dl $7E09CA : db $02 : dw $0007 ; Supers
    dl $7E0AF6 : db $02 : dw $02DE ; Samus X
    dl $7E0AFA : db $02 : dw $027B ; Samus Y
    dl $7ED8BE : db $02 : dw $2081 ; Events, Items, Doors
    dl $7ED91A : db $02 : dw $006D ; Events, Items, Doors
    dw #$FFFF
.after

preset_RouteB_maridia_return_draygon:
    dw #preset_RouteB_maridia_return_halfie_spark ; Maridia Return: Halfie Spark
    dl $7E078D : db $02 : dw $A7F8 ; DDB
    dl $7E078F : db $02 : dw $0002 ; DoorOut Index
    dl $7E079B : db $02 : dw $D78F ; MDB
    dl $7E090F : db $02 : dw $A001 ; Screen subpixel X position.
    dl $7E0911 : db $02 : dw $0100 ; Screen X position in pixels
    dl $7E0913 : db $02 : dw $5400 ; Screen subpixel Y position
    dl $7E0915 : db $02 : dw $01F3 ; Screen Y position in pixels
    dl $7E09CA : db $02 : dw $0006 ; Supers
    dl $7E0AF6 : db $02 : dw $0137 ; Samus X
    dl $7E0AFA : db $02 : dw $028B ; Samus Y
    dl $7ED8BE : db $02 : dw $2A81 ; Events, Items, Doors
    dl $7ED91A : db $02 : dw $006E ; Events, Items, Doors
    dw #$FFFF
.after

preset_RouteB_maridia_return_reverse_halfie:
    dw #preset_RouteB_maridia_return_draygon ; Maridia Return: Draygon
    dl $7E078D : db $02 : dw $A96C ; DDB
    dl $7E078F : db $02 : dw $0000 ; DoorOut Index
    dl $7E090F : db $02 : dw $8000 ; Screen subpixel X position.
    dl $7E0911 : db $02 : dw $0000 ; Screen X position in pixels
    dl $7E0913 : db $02 : dw $2400 ; Screen subpixel Y position
    dl $7E0915 : db $02 : dw $0000 ; Screen Y position in pixels
    dl $7E09A2 : db $02 : dw $732F ; Equipped Items
    dl $7E09A4 : db $02 : dw $732F ; Collected Items
    dl $7E09C2 : db $02 : dw $00E1 ; Health
    dl $7E09CA : db $02 : dw $0009 ; Supers
    dl $7E0AF6 : db $02 : dw $007F ; Samus X
    dl $7E0AFA : db $02 : dw $009B ; Samus Y
    dl $7ED82C : db $02 : dw $0003 ; Events, Items, Doors
    dl $7ED87A : db $02 : dw $4804 ; Events, Items, Doors
    dl $7ED91A : db $02 : dw $0070 ; Events, Items, Doors
    dw #$FFFF
.after

preset_RouteB_maridia_return_plasma_beam:
    dw #preset_RouteB_maridia_return_reverse_halfie ; Maridia Return: Reverse Halfie
    dl $7E078D : db $02 : dw $A54C ; DDB
    dl $7E078F : db $02 : dw $0001 ; DoorOut Index
    dl $7E079B : db $02 : dw $D6FD ; MDB
    dl $7E07F5 : db $02 : dw $0006 ; Music Track
    dl $7E090F : db $02 : dw $E000 ; Screen subpixel X position.
    dl $7E0913 : db $02 : dw $0000 ; Screen subpixel Y position
    dl $7E09C2 : db $02 : dw $0158 ; Health
    dl $7E09CA : db $02 : dw $000A ; Supers
    dl $7E0AF6 : db $02 : dw $0030 ; Samus X
    dl $7E0AFA : db $02 : dw $008B ; Samus Y
    dl $7ED8BE : db $02 : dw $2A87 ; Events, Items, Doors
    dl $7ED91A : db $02 : dw $0077 ; Events, Items, Doors
    dw #$FFFF
.after

preset_RouteB_maridia_return_tube_room:
    dw #preset_RouteB_maridia_return_plasma_beam ; Maridia Return: Plasma Beam
    dl $7E078D : db $02 : dw $A51C ; DDB
    dl $7E078F : db $02 : dw $0003 ; DoorOut Index
    dl $7E079B : db $02 : dw $D3DF ; MDB
    dl $7E07C3 : db $02 : dw $B130 ; GFX Pointers
    dl $7E07C5 : db $02 : dw $3CBE ; GFX Pointers
    dl $7E07C7 : db $02 : dw $C2B8 ; GFX Pointers
    dl $7E090F : db $02 : dw $3000 ; Screen subpixel X position.
    dl $7E0913 : db $02 : dw $3400 ; Screen subpixel Y position
    dl $7E0915 : db $02 : dw $0500 ; Screen Y position in pixels
    dl $7E09A6 : db $02 : dw $100B ; Beams
    dl $7E09A8 : db $02 : dw $100B ; Beams
    dl $7E09C2 : db $02 : dw $017B ; Health
    dl $7E09C6 : db $02 : dw $0018 ; Missiles
    dl $7E09CE : db $02 : dw $0009 ; Pbs
    dl $7E0AF6 : db $02 : dw $0035 ; Samus X
    dl $7E0AFA : db $02 : dw $05BB ; Samus Y
    dl $7ED87A : db $02 : dw $480C ; Events, Items, Doors
    dl $7ED8BE : db $02 : dw $3A87 ; Events, Items, Doors
    dl $7ED91A : db $02 : dw $0079 ; Events, Items, Doors
    dw #$FFFF
.after

preset_RouteB_maridia_return_red_tubes_return:
    dw #preset_RouteB_maridia_return_tube_room ; Maridia Return: Tube Room
    dl $7E078D : db $02 : dw $B3E4 ; DDB
    dl $7E078F : db $02 : dw $0001 ; DoorOut Index
    dl $7E079B : db $02 : dw $D1A3 ; MDB
    dl $7E090F : db $02 : dw $1002 ; Screen subpixel X position.
    dl $7E0913 : db $02 : dw $4C00 ; Screen subpixel Y position
    dl $7E0915 : db $02 : dw $010D ; Screen Y position in pixels
    dl $7E09C2 : db $02 : dw $018F ; Health
    dl $7E0AF6 : db $02 : dw $0032 ; Samus X
    dl $7E0AFA : db $02 : dw $018B ; Samus Y
    dl $7ED91A : db $02 : dw $007C ; Events, Items, Doors
    dw #$FFFF
.after

preset_RouteB_backtracking_green_brinstar_entrace:
    dw #preset_RouteB_maridia_return_red_tubes_return ; Maridia Return: Red Tubes Return
    dl $7E078D : db $02 : dw $8CFA ; DDB
    dl $7E078F : db $02 : dw $0003 ; DoorOut Index
    dl $7E079B : db $02 : dw $D913 ; MDB
    dl $7E07C3 : db $02 : dw $E78D ; GFX Pointers
    dl $7E07C5 : db $02 : dw $2EBE ; GFX Pointers
    dl $7E07C7 : db $02 : dw $C2B9 ; GFX Pointers
    dl $7E07F5 : db $02 : dw $0005 ; Music Track
    dl $7E090F : db $02 : dw $8000 ; Screen subpixel X position.
    dl $7E0913 : db $02 : dw $F800 ; Screen subpixel Y position
    dl $7E0915 : db $02 : dw $0000 ; Screen Y position in pixels
    dl $7E09C2 : db $02 : dw $019E ; Health
    dl $7E09C6 : db $02 : dw $0019 ; Missiles
    dl $7E09CE : db $02 : dw $000A ; Pbs
    dl $7E0AF6 : db $02 : dw $0069 ; Samus X
    dl $7E0AFA : db $02 : dw $008B ; Samus Y
    dl $7ED820 : db $02 : dw $2801 ; Events, Items, Doors
    dl $7ED8BC : db $02 : dw $3E0A ; Events, Items, Doors
    dl $7ED91A : db $02 : dw $007D ; Events, Items, Doors
    dw #$FFFF
.after

preset_RouteB_backtracking_crateria_elevator:
    dw #preset_RouteB_backtracking_green_brinstar_entrace ; Backtracking: Green Brinstar Entrace
    dl $7E078D : db $02 : dw $8EB6 ; DDB
    dl $7E078F : db $02 : dw $0002 ; DoorOut Index
    dl $7E079B : db $02 : dw $97B5 ; MDB
    dl $7E079F : db $02 : dw $0000 ; Region
    dl $7E07C3 : db $02 : dw $F911 ; GFX Pointers
    dl $7E07C5 : db $02 : dw $43BA ; GFX Pointers
    dl $7E07C7 : db $02 : dw $C2AF ; GFX Pointers
    dl $7E07F3 : db $02 : dw $0009 ; Music Bank
    dl $7E07F5 : db $02 : dw $0003 ; Music Track
    dl $7E090F : db $02 : dw $5000 ; Screen subpixel X position.
    dl $7E0913 : db $02 : dw $0000 ; Screen subpixel Y position
    dl $7E09C2 : db $02 : dw $01A1 ; Health
    dl $7E09CE : db $02 : dw $0007 ; Pbs
    dl $7E0A1C : db $02 : dw $009B ; Samus position/state
    dl $7E0A1E : db $02 : dw $0000 ; More position/state
    dl $7E0AF6 : db $02 : dw $0080 ; Samus X
    dl $7E0AFA : db $02 : dw $0088 ; Samus Y
    dl $7ED8B2 : db $02 : dw $3019 ; Events, Items, Doors
    dl $7ED91A : db $02 : dw $007F ; Events, Items, Doors
    dw #$FFFF
.after

preset_RouteB_backtracking_g4:
    dw #preset_RouteB_backtracking_crateria_elevator ; Backtracking: Crateria Elevator
    dl $7E078D : db $02 : dw $ADC6 ; DDB
    dl $7E078F : db $02 : dw $0005 ; DoorOut Index
    dl $7E079B : db $02 : dw $A5ED ; MDB
    dl $7E07C3 : db $02 : dw $A5AA ; GFX Pointers
    dl $7E07C5 : db $02 : dw $47BC ; GFX Pointers
    dl $7E07C7 : db $02 : dw $C2B4 ; GFX Pointers
    dl $7E07F5 : db $02 : dw $0004 ; Music Track
    dl $7E090F : db $02 : dw $DC00 ; Screen subpixel X position.
    dl $7E0913 : db $02 : dw $DC00 ; Screen subpixel Y position
    dl $7E09C2 : db $02 : dw $019D ; Health
    dl $7E09CA : db $02 : dw $0008 ; Supers
    dl $7E0A1C : db $02 : dw $0002 ; Samus position/state
    dl $7E0A1E : db $02 : dw $0004 ; More position/state
    dl $7E0AF6 : db $02 : dw $0035 ; Samus X
    dl $7E0AFA : db $02 : dw $008B ; Samus Y
    dl $7ED8B0 : db $02 : dw $4152 ; Events, Items, Doors
    dw #$FFFF
.after

preset_RouteB_tourian_tourian_elevator:
    dw #preset_RouteB_backtracking_g4 ; Backtracking: G4
    dl $7E078D : db $02 : dw $9222 ; DDB
    dl $7E078F : db $02 : dw $0001 ; DoorOut Index
    dl $7E079B : db $02 : dw $DAAE ; MDB
    dl $7E079F : db $02 : dw $0005 ; Region
    dl $7E07C3 : db $02 : dw $D414 ; GFX Pointers
    dl $7E07C5 : db $02 : dw $EDBF ; GFX Pointers
    dl $7E07C7 : db $02 : dw $C2BA ; GFX Pointers
    dl $7E07F3 : db $02 : dw $001E ; Music Bank
    dl $7E07F5 : db $02 : dw $0005 ; Music Track
    dl $7E090F : db $02 : dw $B001 ; Screen subpixel X position.
    dl $7E0913 : db $02 : dw $0000 ; Screen subpixel Y position
    dl $7E0915 : db $02 : dw $0238 ; Screen Y position in pixels
    dl $7E0A1C : db $02 : dw $009B ; Samus position/state
    dl $7E0A1E : db $02 : dw $0000 ; More position/state
    dl $7E0AF6 : db $02 : dw $0080 ; Samus X
    dl $7E0AFA : db $02 : dw $02A8 ; Samus Y
    dl $7ED820 : db $02 : dw $2FC1 ; Events, Items, Doors
    dl $7ED90C : db $02 : dw $0100 ; Events, Items, Doors
    dw #$FFFF
.after

preset_RouteB_tourian_metroids_room_2:
    dw #preset_RouteB_tourian_tourian_elevator ; Tourian: Tourian Elevator
    dl $7E078D : db $02 : dw $A984 ; DDB
    dl $7E078F : db $02 : dw $0000 ; DoorOut Index
    dl $7E079B : db $02 : dw $DAE1 ; MDB
    dl $7E090F : db $02 : dw $9000 ; Screen subpixel X position.
    dl $7E0913 : db $02 : dw $7800 ; Screen subpixel Y position
    dl $7E0915 : db $02 : dw $0000 ; Screen Y position in pixels
    dl $7E09C2 : db $02 : dw $01F3 ; Health
    dl $7E09CA : db $02 : dw $000A ; Supers
    dl $7E0A1C : db $02 : dw $0002 ; Samus position/state
    dl $7E0A1E : db $02 : dw $0004 ; More position/state
    dl $7E0AF6 : db $02 : dw $0031 ; Samus X
    dl $7E0AFA : db $02 : dw $008B ; Samus Y
    dl $7ED822 : db $02 : dw $0021 ; Events, Items, Doors
    dl $7ED8C0 : db $02 : dw $00BE ; Events, Items, Doors
    dw #$FFFF
.after

preset_RouteB_tourian_metroids_room_3:
    dw #preset_RouteB_tourian_metroids_room_2 ; Tourian: Metroids Room 2
    dl $7E078D : db $02 : dw $A9B4 ; DDB
    dl $7E078F : db $02 : dw $0001 ; DoorOut Index
    dl $7E079B : db $02 : dw $DB31 ; MDB
    dl $7E0913 : db $02 : dw $D800 ; Screen subpixel Y position
    dl $7E0915 : db $02 : dw $0023 ; Screen Y position in pixels
    dl $7E09CE : db $02 : dw $0008 ; Pbs
    dl $7E0A1C : db $02 : dw $0001 ; Samus position/state
    dl $7E0A1E : db $02 : dw $0008 ; More position/state
    dl $7E0AF6 : db $02 : dw $00C9 ; Samus X
    dl $7ED822 : db $02 : dw $0023 ; Events, Items, Doors
    dl $7ED8C0 : db $02 : dw $01BE ; Events, Items, Doors
    dw #$FFFF
.after

preset_RouteB_tourian_metroids_room_4:
    dw #preset_RouteB_tourian_metroids_room_3 ; Tourian: Metroids Room 3
    dl $7E078D : db $02 : dw $A9CC ; DDB
    dl $7E079B : db $02 : dw $DB7D ; MDB
    dl $7E0911 : db $02 : dw $0400 ; Screen X position in pixels
    dl $7E0913 : db $02 : dw $0000 ; Screen subpixel Y position
    dl $7E0915 : db $02 : dw $0000 ; Screen Y position in pixels
    dl $7E09CE : db $02 : dw $000A ; Pbs
    dl $7E0AF6 : db $02 : dw $0486 ; Samus X
    dl $7E0AFA : db $02 : dw $006B ; Samus Y
    dl $7ED822 : db $02 : dw $0027 ; Events, Items, Doors
    dl $7ED8C0 : db $02 : dw $03BE ; Events, Items, Doors
    dw #$FFFF
.after

preset_RouteB_tourian_pirates_room:
    dw #preset_RouteB_tourian_metroids_room_4 ; Tourian: Metroids Room 4
    dl $7E078D : db $02 : dw $A9E4 ; DDB
    dl $7E079B : db $02 : dw $DBCD ; MDB
    dl $7E090F : db $02 : dw $5000 ; Screen subpixel X position.
    dl $7E0911 : db $02 : dw $0000 ; Screen X position in pixels
    dl $7E0915 : db $02 : dw $001C ; Screen Y position in pixels
    dl $7E0A1C : db $02 : dw $0002 ; Samus position/state
    dl $7E0A1E : db $02 : dw $0004 ; More position/state
    dl $7E0AF6 : db $02 : dw $0034 ; Samus X
    dl $7E0AFA : db $02 : dw $008B ; Samus Y
    dl $7ED822 : db $02 : dw $002F ; Events, Items, Doors
    dl $7ED8C0 : db $02 : dw $07BE ; Events, Items, Doors
    dw #$FFFF
.after

preset_RouteB_tourian_baby_skip:
    dw #preset_RouteB_tourian_pirates_room ; Tourian: Pirates Room
    dl $7E078D : db $02 : dw $A9FC ; DDB
    dl $7E079B : db $02 : dw $DC19 ; MDB
    dl $7E07F3 : db $02 : dw $0024 ; Music Bank
    dl $7E07F5 : db $02 : dw $0006 ; Music Track
    dl $7E090F : db $02 : dw $2000 ; Screen subpixel X position.
    dl $7E0915 : db $02 : dw $0023 ; Screen Y position in pixels
    dl $7E09C2 : db $02 : dw $01D5 ; Health
    dl $7E0AF6 : db $02 : dw $002A ; Samus X
    dw #$FFFF
.after

preset_RouteB_tourian_zebetite_skip:
    dw #preset_RouteB_tourian_baby_skip ; Tourian: Baby Skip
    dl $7E078D : db $02 : dw $AAA4 ; DDB
    dl $7E079B : db $02 : dw $DDF3 ; MDB
    dl $7E07F3 : db $02 : dw $001E ; Music Bank
    dl $7E07F5 : db $02 : dw $0005 ; Music Track
    dl $7E090F : db $02 : dw $6000 ; Screen subpixel X position.
    dl $7E0913 : db $02 : dw $1000 ; Screen subpixel Y position
    dl $7E0915 : db $02 : dw $0026 ; Screen Y position in pixels
    dl $7E09C2 : db $02 : dw $01F3 ; Health
    dl $7E09CA : db $02 : dw $0008 ; Supers
    dl $7E0AF6 : db $02 : dw $0044 ; Samus X
    dl $7ED830 : db $02 : dw $0011 ; Events, Items, Doors
    dl $7ED8C0 : db $02 : dw $3FBE ; Events, Items, Doors
    dw #$FFFF
.after
