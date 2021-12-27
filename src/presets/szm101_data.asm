
preset_SZM101_bombs_landing_site:
    dw #$0000
    dl $7E078B : db $02 : dw $0000 ; Elevator Index
    dl $7E078D : db $02 : dw $896A ; DDB
    dl $7E078F : db $02 : dw $0000 ; DoorOut Index
    dl $7E079B : db $02 : dw $91F8 ; MDB
    dl $7E079F : db $02 : dw $0000 ; Region
    dl $7E07C3 : db $02 : dw $C629 ; GFX Pointers
    dl $7E07C5 : db $02 : dw $7CBA ; GFX Pointers
    dl $7E07C7 : db $02 : dw $C2AD ; GFX Pointers
    dl $7E07F3 : db $02 : dw $0036 ; Music Bank
    dl $7E07F5 : db $02 : dw $0005 ; Music Track
    dl $7E090F : db $02 : dw $C000 ; Screen subpixel X position.
    dl $7E0911 : db $02 : dw $03FA ; Screen X position in pixels
    dl $7E0913 : db $02 : dw $4000 ; Screen subpixel Y position
    dl $7E0915 : db $02 : dw $03F9 ; Screen Y position in pixels
    dl $7E0917 : db $02 : dw $02FB ; Layer 2 X scroll in room in pixels?
    dl $7E0919 : db $02 : dw $03F9 ; Layer 2 Y scroll in room in pixels? (up = positive)
    dl $7E0921 : db $02 : dw $0300 ; BG2 X scroll offset due to room transitions (Translates between Layer 2 scroll and BG2 scroll)
    dl $7E0923 : db $02 : dw $0400 ; BG2 Y scroll offset due to room transitions (Translates between Layer 2 scroll and BG2 scroll)
    dl $7E093F : db $02 : dw $0000 ; Ceres escape flag
    dl $7E09A2 : db $02 : dw $0000 ; Equipped Items
    dl $7E09A4 : db $02 : dw $0000 ; Collected Items
    dl $7E09A6 : db $02 : dw $0000 ; Beams
    dl $7E09A8 : db $02 : dw $0000 ; Beams
    dl $7E09C0 : db $02 : dw $0000 ; Manual/Auto reserve tank
    dl $7E09C2 : db $02 : dw $0063 ; Health
    dl $7E09C4 : db $02 : dw $0063 ; Max health
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
    dl $7E0AF6 : db $02 : dw $047D ; Samus X
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
    dl $7ED7D0 : db $02 : dw $4000 ; SRAM copy
    dl $7ED7D2 : db $02 : dw $8000 ; SRAM copy
    dl $7ED7D4 : db $02 : dw $0080 ; SRAM copy
    dl $7ED7D6 : db $02 : dw $2000 ; SRAM copy
    dl $7ED7D8 : db $02 : dw $0040 ; SRAM copy
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
    dl $7ED7F8 : db $02 : dw $0000 ; SRAM copy
    dl $7ED7FA : db $02 : dw $0000 ; SRAM copy
    dl $7ED7FC : db $02 : dw $0000 ; SRAM copy
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
    dl $7ED82A : db $02 : dw $0100 ; Events, Items, Doors
    dl $7ED82C : db $02 : dw $0000 ; Events, Items, Doors
    dl $7ED82E : db $02 : dw $0000 ; Events, Items, Doors
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
    dl $7ED87A : db $02 : dw $0020 ; Events, Items, Doors
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
    dl $7ED8F8 : db $02 : dw $0000 ; Events, Items, Doors
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
    dl $7ED91A : db $02 : dw $0002 ; Events, Items, Doors
    dl $7ED91C : db $02 : dw $0000 ; Events, Items, Doors
    dl $7ED91E : db $02 : dw $0000 ; Events, Items, Doors
    dw #$FFFF
.after

preset_SZM101_bombs_shaft_top:
    dw #preset_SZM101_bombs_landing_site ; Bombs: Landing Site
    dl $7E078D : db $02 : dw $908A ; DDB
    dl $7E078F : db $02 : dw $0001 ; DoorOut Index
    dl $7E079B : db $02 : dw $8148 ; MDB
    dl $7E07F3 : db $02 : dw $0006 ; Music Bank
    dl $7E07F5 : db $02 : dw $0007 ; Music Track
    dl $7E090F : db $02 : dw $2C00 ; Screen subpixel X position.
    dl $7E0911 : db $02 : dw $0000 ; Screen X position in pixels
    dl $7E0913 : db $02 : dw $1400 ; Screen subpixel Y position
    dl $7E0915 : db $02 : dw $0000 ; Screen Y position in pixels
    dl $7E0917 : db $02 : dw $0000 ; Layer 2 X scroll in room in pixels?
    dl $7E0919 : db $02 : dw $0000 ; Layer 2 Y scroll in room in pixels? (up = positive)
    dl $7E0921 : db $02 : dw $0100 ; BG2 X scroll offset due to room transitions (Translates between Layer 2 scroll and BG2 scroll)
    dl $7E0923 : db $02 : dw $0000 ; BG2 Y scroll offset due to room transitions (Translates between Layer 2 scroll and BG2 scroll)
    dl $7E0A1C : db $02 : dw $0001 ; Samus position/state
    dl $7E0A1E : db $02 : dw $0008 ; More position/state
    dl $7E0AF6 : db $02 : dw $005E ; Samus X
    dl $7E0AFA : db $02 : dw $008B ; Samus Y
    dl $7ED91A : db $02 : dw $0003 ; Events, Items, Doors
    dw #$FFFF
.after

preset_SZM101_bombs_ceiling_etank:
    dw #preset_SZM101_bombs_shaft_top ; Bombs: Shaft Top
    dl $7E078D : db $02 : dw $91AA ; DDB
    dl $7E078F : db $02 : dw $0000 ; DoorOut Index
    dl $7E079B : db $02 : dw $A2F7 ; MDB
    dl $7E079F : db $02 : dw $0001 ; Region
    dl $7E07C3 : db $02 : dw $E6B0 ; GFX Pointers
    dl $7E07C5 : db $02 : dw $64BB ; GFX Pointers
    dl $7E07C7 : db $02 : dw $C2B2 ; GFX Pointers
    dl $7E07F3 : db $02 : dw $000F ; Music Bank
    dl $7E07F5 : db $02 : dw $0005 ; Music Track
    dl $7E090F : db $02 : dw $2000 ; Screen subpixel X position.
    dl $7E0913 : db $02 : dw $3000 ; Screen subpixel Y position
    dl $7E09A2 : db $02 : dw $0004 ; Equipped Items
    dl $7E09A4 : db $02 : dw $0004 ; Collected Items
    dl $7E09C2 : db $02 : dw $0059 ; Health
    dl $7E0AF6 : db $02 : dw $00CE ; Samus X
    dl $7ED880 : db $02 : dw $0001 ; Events, Items, Doors
    dl $7ED91A : db $02 : dw $0004 ; Events, Items, Doors
    dw #$FFFF
.after

preset_SZM101_bombs_robo_clip:
    dw #preset_SZM101_bombs_ceiling_etank ; Bombs: Ceiling Etank
    dl $7E078D : db $02 : dw $C018 ; DDB
    dl $7E078F : db $02 : dw $0002 ; DoorOut Index
    dl $7E079B : db $02 : dw $A3DD ; MDB
    dl $7E090F : db $02 : dw $F000 ; Screen subpixel X position.
    dl $7E0913 : db $02 : dw $1400 ; Screen subpixel Y position
    dl $7E09C2 : db $02 : dw $0090 ; Health
    dl $7E09C4 : db $02 : dw $0095 ; Max health
    dl $7E0AF6 : db $02 : dw $00CF ; Samus X
    dl $7ED87C : db $02 : dw $0100 ; Events, Items, Doors
    dl $7ED91A : db $02 : dw $0009 ; Events, Items, Doors
    dw #$FFFF
.after

preset_SZM101_bombs_white_wall_kago_room:
    dw #preset_SZM101_bombs_robo_clip ; Bombs: Robo Clip
    dl $7E078D : db $02 : dw $97F2 ; DDB
    dl $7E078F : db $02 : dw $0000 ; DoorOut Index
    dl $7E079B : db $02 : dw $A3AE ; MDB
    dl $7E090F : db $02 : dw $8001 ; Screen subpixel X position.
    dl $7E0911 : db $02 : dw $0200 ; Screen X position in pixels
    dl $7E0913 : db $02 : dw $0000 ; Screen subpixel Y position
    dl $7E0915 : db $02 : dw $0300 ; Screen Y position in pixels
    dl $7E0917 : db $02 : dw $0200 ; Layer 2 X scroll in room in pixels?
    dl $7E0919 : db $02 : dw $0300 ; Layer 2 Y scroll in room in pixels? (up = positive)
    dl $7E0921 : db $02 : dw $FD00 ; BG2 X scroll offset due to room transitions (Translates between Layer 2 scroll and BG2 scroll)
    dl $7E0923 : db $02 : dw $FD00 ; BG2 Y scroll offset due to room transitions (Translates between Layer 2 scroll and BG2 scroll)
    dl $7E0AF6 : db $02 : dw $02CA ; Samus X
    dl $7E0AFA : db $02 : dw $038B ; Samus Y
    dw #$FFFF
.after

preset_SZM101_bombs_white_wall_2:
    dw #preset_SZM101_bombs_white_wall_kago_room ; Bombs: White Wall Kago Room
    dl $7E078D : db $02 : dw $911A ; DDB
    dl $7E078F : db $02 : dw $0001 ; DoorOut Index
    dl $7E079B : db $02 : dw $9994 ; MDB
    dl $7E07C3 : db $02 : dw $860B ; GFX Pointers
    dl $7E07C5 : db $02 : dw $21C0 ; GFX Pointers
    dl $7E07C7 : db $02 : dw $C2C0 ; GFX Pointers
    dl $7E090F : db $02 : dw $8400 ; Screen subpixel X position.
    dl $7E0911 : db $02 : dw $0000 ; Screen X position in pixels
    dl $7E0913 : db $02 : dw $E000 ; Screen subpixel Y position
    dl $7E0915 : db $02 : dw $0000 ; Screen Y position in pixels
    dl $7E0917 : db $02 : dw $0000 ; Layer 2 X scroll in room in pixels?
    dl $7E0919 : db $02 : dw $0000 ; Layer 2 Y scroll in room in pixels? (up = positive)
    dl $7E0921 : db $02 : dw $0100 ; BG2 X scroll offset due to room transitions (Translates between Layer 2 scroll and BG2 scroll)
    dl $7E0923 : db $02 : dw $0000 ; BG2 Y scroll offset due to room transitions (Translates between Layer 2 scroll and BG2 scroll)
    dl $7E09C2 : db $02 : dw $0086 ; Health
    dl $7E0AF6 : db $02 : dw $00C6 ; Samus X
    dl $7E0AFA : db $02 : dw $0095 ; Samus Y
    dw #$FFFF
.after

preset_SZM101_bombs_white_wall_missiles:
    dw #preset_SZM101_bombs_white_wall_2 ; Bombs: White Wall 2
    dl $7E078D : db $02 : dw $8C16 ; DDB
    dl $7E078F : db $02 : dw $0000 ; DoorOut Index
    dl $7E079B : db $02 : dw $A471 ; MDB
    dl $7E07C3 : db $02 : dw $A5AA ; GFX Pointers
    dl $7E07C5 : db $02 : dw $5FBC ; GFX Pointers
    dl $7E07C7 : db $02 : dw $C2B3 ; GFX Pointers
    dl $7E090F : db $02 : dw $C400 ; Screen subpixel X position.
    dl $7E0911 : db $02 : dw $0100 ; Screen X position in pixels
    dl $7E0913 : db $02 : dw $8C00 ; Screen subpixel Y position
    dl $7E0915 : db $02 : dw $0013 ; Screen Y position in pixels
    dl $7E0917 : db $02 : dw $00C0 ; Layer 2 X scroll in room in pixels?
    dl $7E0919 : db $02 : dw $000E ; Layer 2 Y scroll in room in pixels? (up = positive)
    dl $7E0AF6 : db $02 : dw $01C0 ; Samus X
    dl $7E0AFA : db $02 : dw $009B ; Samus Y
    dw #$FFFF
.after

preset_SZM101_bombs_missile_gate_room:
    dw #preset_SZM101_bombs_white_wall_missiles ; Bombs: White Wall Missiles
    dl $7E078D : db $02 : dw $90AE ; DDB
    dl $7E078F : db $02 : dw $0002 ; DoorOut Index
    dl $7E079B : db $02 : dw $AA0E ; MDB
    dl $7E090F : db $02 : dw $1800 ; Screen subpixel X position.
    dl $7E0911 : db $02 : dw $0300 ; Screen X position in pixels
    dl $7E0913 : db $02 : dw $0000 ; Screen subpixel Y position
    dl $7E0915 : db $02 : dw $0100 ; Screen Y position in pixels
    dl $7E0917 : db $02 : dw $0240 ; Layer 2 X scroll in room in pixels?
    dl $7E0919 : db $02 : dw $00C0 ; Layer 2 Y scroll in room in pixels? (up = positive)
    dl $7E0921 : db $02 : dw $FC00 ; BG2 X scroll offset due to room transitions (Translates between Layer 2 scroll and BG2 scroll)
    dl $7E0923 : db $02 : dw $FF00 ; BG2 Y scroll offset due to room transitions (Translates between Layer 2 scroll and BG2 scroll)
    dl $7E09C2 : db $02 : dw $0095 ; Health
    dl $7E09C6 : db $02 : dw $0005 ; Missiles
    dl $7E09C8 : db $02 : dw $0005 ; Max missiles
    dl $7E0AF6 : db $02 : dw $03BE ; Samus X
    dl $7E0AFA : db $02 : dw $018B ; Samus Y
    dl $7ED872 : db $02 : dw $0001 ; Events, Items, Doors
    dl $7ED91A : db $02 : dw $000E ; Events, Items, Doors
    dw #$FFFF
.after

preset_SZM101_bombs_kihunter_climb:
    dw #preset_SZM101_bombs_missile_gate_room ; Bombs: Missile Gate Room
    dl $7E078D : db $02 : dw $90BA ; DDB
    dl $7E078F : db $02 : dw $0003 ; DoorOut Index
    dl $7E079B : db $02 : dw $962A ; MDB
    dl $7E079F : db $02 : dw $0000 ; Region
    dl $7E07C3 : db $02 : dw $F911 ; GFX Pointers
    dl $7E07C5 : db $02 : dw $43BA ; GFX Pointers
    dl $7E07C7 : db $02 : dw $C2AF ; GFX Pointers
    dl $7E07F5 : db $02 : dw $0003 ; Music Track
    dl $7E090F : db $02 : dw $A000 ; Screen subpixel X position.
    dl $7E0911 : db $02 : dw $0000 ; Screen X position in pixels
    dl $7E0913 : db $02 : dw $0C00 ; Screen subpixel Y position
    dl $7E0915 : db $02 : dw $0000 ; Screen Y position in pixels
    dl $7E0917 : db $02 : dw $0000 ; Layer 2 X scroll in room in pixels?
    dl $7E0919 : db $02 : dw $0000 ; Layer 2 Y scroll in room in pixels? (up = positive)
    dl $7E0921 : db $02 : dw $0000 ; BG2 X scroll offset due to room transitions (Translates between Layer 2 scroll and BG2 scroll)
    dl $7E0AF6 : db $02 : dw $007C ; Samus X
    dl $7E0AFA : db $02 : dw $005B ; Samus Y
    dl $7ED91A : db $02 : dw $000F ; Events, Items, Doors
    dw #$FFFF
.after

preset_SZM101_bombs_harder_robo_clip:
    dw #preset_SZM101_bombs_kihunter_climb ; Bombs: Kihunter Climb
    dl $7E078D : db $02 : dw $8AF6 ; DDB
    dl $7E078F : db $02 : dw $0000 ; DoorOut Index
    dl $7E079B : db $02 : dw $98E2 ; MDB
    dl $7E07F3 : db $02 : dw $0009 ; Music Bank
    dl $7E07F5 : db $02 : dw $0006 ; Music Track
    dl $7E090F : db $02 : dw $9001 ; Screen subpixel X position.
    dl $7E0913 : db $02 : dw $0000 ; Screen subpixel Y position
    dl $7E0915 : db $02 : dw $0024 ; Screen Y position in pixels
    dl $7E0919 : db $02 : dw $001B ; Layer 2 Y scroll in room in pixels? (up = positive)
    dl $7E0921 : db $02 : dw $FE00 ; BG2 X scroll offset due to room transitions (Translates between Layer 2 scroll and BG2 scroll)
    dl $7E0923 : db $02 : dw $FE00 ; BG2 Y scroll offset due to room transitions (Translates between Layer 2 scroll and BG2 scroll)
    dl $7E0A1C : db $02 : dw $0002 ; Samus position/state
    dl $7E0A1E : db $02 : dw $0004 ; More position/state
    dl $7E0AF6 : db $02 : dw $001F ; Samus X
    dl $7E0AFA : db $02 : dw $008B ; Samus Y
    dw #$FFFF
.after

preset_SZM101_bombs_crumble_run:
    dw #preset_SZM101_bombs_harder_robo_clip ; Bombs: Harder Robo Clip
    dl $7E078D : db $02 : dw $AE3C ; DDB
    dl $7E078F : db $02 : dw $0002 ; DoorOut Index
    dl $7E079B : db $02 : dw $9FE5 ; MDB
    dl $7E090F : db $02 : dw $A000 ; Screen subpixel X position.
    dl $7E0911 : db $02 : dw $0200 ; Screen X position in pixels
    dl $7E0915 : db $02 : dw $001F ; Screen Y position in pixels
    dl $7E0917 : db $02 : dw $0180 ; Layer 2 X scroll in room in pixels?
    dl $7E0919 : db $02 : dw $0017 ; Layer 2 Y scroll in room in pixels? (up = positive)
    dl $7E0921 : db $02 : dw $0100 ; BG2 X scroll offset due to room transitions (Translates between Layer 2 scroll and BG2 scroll)
    dl $7E0923 : db $02 : dw $0000 ; BG2 Y scroll offset due to room transitions (Translates between Layer 2 scroll and BG2 scroll)
    dl $7E0A1C : db $02 : dw $0001 ; Samus position/state
    dl $7E0A1E : db $02 : dw $0008 ; More position/state
    dl $7E0AF6 : db $02 : dw $02DF ; Samus X
    dw #$FFFF
.after

preset_SZM101_bombs_pirate_jump:
    dw #preset_SZM101_bombs_crumble_run ; Bombs: Crumble Run
    dl $7E078D : db $02 : dw $8F82 ; DDB
    dl $7E078F : db $02 : dw $0001 ; DoorOut Index
    dl $7E079B : db $02 : dw $9A44 ; MDB
    dl $7E090F : db $02 : dw $E000 ; Screen subpixel X position.
    dl $7E0911 : db $02 : dw $0500 ; Screen X position in pixels
    dl $7E0915 : db $02 : dw $021F ; Screen Y position in pixels
    dl $7E0917 : db $02 : dw $03C0 ; Layer 2 X scroll in room in pixels?
    dl $7E0919 : db $02 : dw $0197 ; Layer 2 Y scroll in room in pixels? (up = positive)
    dl $7E0923 : db $02 : dw $FE00 ; BG2 Y scroll offset due to room transitions (Translates between Layer 2 scroll and BG2 scroll)
    dl $7E09C6 : db $02 : dw $000A ; Missiles
    dl $7E09C8 : db $02 : dw $000A ; Max missiles
    dl $7E0AF6 : db $02 : dw $05CB ; Samus X
    dl $7E0AFA : db $02 : dw $028B ; Samus Y
    dl $7ED870 : db $02 : dw $0080 ; Events, Items, Doors
    dl $7ED91A : db $02 : dw $0010 ; Events, Items, Doors
    dw #$FFFF
.after

preset_SZM101_bombs_bomb_torizo:
    dw #preset_SZM101_bombs_pirate_jump ; Bombs: Pirate Jump
    dl $7E078D : db $02 : dw $8BAA ; DDB
    dl $7E078F : db $02 : dw $0000 ; DoorOut Index
    dl $7E079B : db $02 : dw $84F2 ; MDB
    dl $7E07F3 : db $02 : dw $0024 ; Music Bank
    dl $7E07F5 : db $02 : dw $0003 ; Music Track
    dl $7E090F : db $02 : dw $9000 ; Screen subpixel X position.
    dl $7E0911 : db $02 : dw $0200 ; Screen X position in pixels
    dl $7E0913 : db $02 : dw $5C00 ; Screen subpixel Y position
    dl $7E0915 : db $02 : dw $0000 ; Screen Y position in pixels
    dl $7E0917 : db $02 : dw $0180 ; Layer 2 X scroll in room in pixels?
    dl $7E0919 : db $02 : dw $0000 ; Layer 2 Y scroll in room in pixels? (up = positive)
    dl $7E0921 : db $02 : dw $FD00 ; BG2 X scroll offset due to room transitions (Translates between Layer 2 scroll and BG2 scroll)
    dl $7E0923 : db $02 : dw $0000 ; BG2 Y scroll offset due to room transitions (Translates between Layer 2 scroll and BG2 scroll)
    dl $7E09C2 : db $02 : dw $0063 ; Health
    dl $7E0AF6 : db $02 : dw $02C9 ; Samus X
    dl $7E0AFA : db $02 : dw $008B ; Samus Y
    dl $7ED91A : db $02 : dw $0011 ; Events, Items, Doors
    dw #$FFFF
.after

preset_SZM101_varia_bt_exit:
    dw #preset_SZM101_bombs_bomb_torizo ; Bombs: Bomb Torizo
    dl $7E078D : db $02 : dw $8BC2 ; DDB
    dl $7E078F : db $02 : dw $0001 ; DoorOut Index
    dl $7E079B : db $02 : dw $9804 ; MDB
    dl $7E090F : db $02 : dw $B000 ; Screen subpixel X position.
    dl $7E0911 : db $02 : dw $0000 ; Screen X position in pixels
    dl $7E0913 : db $02 : dw $9C00 ; Screen subpixel Y position
    dl $7E0917 : db $02 : dw $0000 ; Layer 2 X scroll in room in pixels?
    dl $7E0921 : db $02 : dw $0100 ; BG2 X scroll offset due to room transitions (Translates between Layer 2 scroll and BG2 scroll)
    dl $7E09A2 : db $02 : dw $1004 ; Equipped Items
    dl $7E09A4 : db $02 : dw $1004 ; Collected Items
    dl $7E09C2 : db $02 : dw $0095 ; Health
    dl $7E0A1C : db $02 : dw $0002 ; Samus position/state
    dl $7E0A1E : db $02 : dw $0004 ; More position/state
    dl $7E0AF6 : db $02 : dw $003B ; Samus X
    dl $7ED828 : db $02 : dw $0004 ; Events, Items, Doors
    dl $7ED880 : db $02 : dw $0003 ; Events, Items, Doors
    dl $7ED8C2 : db $02 : dw $0020 ; Events, Items, Doors
    dl $7ED91A : db $02 : dw $0012 ; Events, Items, Doors
    dw #$FFFF
.after

preset_SZM101_varia_crumble_run_return:
    dw #preset_SZM101_varia_bt_exit ; Varia: BT Exit
    dl $7E078D : db $02 : dw $8BB6 ; DDB
    dl $7E078F : db $02 : dw $0000 ; DoorOut Index
    dl $7E079B : db $02 : dw $9C5E ; MDB
    dl $7E07F3 : db $02 : dw $0009 ; Music Bank
    dl $7E07F5 : db $02 : dw $0006 ; Music Track
    dl $7E090F : db $02 : dw $E000 ; Screen subpixel X position.
    dl $7E0913 : db $02 : dw $E000 ; Screen subpixel Y position
    dl $7E0915 : db $02 : dw $02FD ; Screen Y position in pixels
    dl $7E0919 : db $02 : dw $02FD ; Layer 2 Y scroll in room in pixels? (up = positive)
    dl $7E0921 : db $02 : dw $FF00 ; BG2 X scroll offset due to room transitions (Translates between Layer 2 scroll and BG2 scroll)
    dl $7E0923 : db $02 : dw $FC00 ; BG2 Y scroll offset due to room transitions (Translates between Layer 2 scroll and BG2 scroll)
    dl $7E09C2 : db $02 : dw $0065 ; Health
    dl $7E0AF6 : db $02 : dw $0051 ; Samus X
    dl $7E0AFA : db $02 : dw $038B ; Samus Y
    dw #$FFFF
.after

preset_SZM101_varia_ripper_bomb_jump:
    dw #preset_SZM101_varia_crumble_run_return ; Varia: Crumble Run Return
    dl $7E078D : db $02 : dw $AE48 ; DDB
    dl $7E079B : db $02 : dw $9FE5 ; MDB
    dl $7E090F : db $02 : dw $6000 ; Screen subpixel X position.
    dl $7E0913 : db $02 : dw $7400 ; Screen subpixel Y position
    dl $7E0915 : db $02 : dw $001F ; Screen Y position in pixels
    dl $7E0919 : db $02 : dw $0017 ; Layer 2 Y scroll in room in pixels? (up = positive)
    dl $7E0921 : db $02 : dw $FD00 ; BG2 X scroll offset due to room transitions (Translates between Layer 2 scroll and BG2 scroll)
    dl $7E0923 : db $02 : dw $0000 ; BG2 Y scroll offset due to room transitions (Translates between Layer 2 scroll and BG2 scroll)
    dl $7E09C2 : db $02 : dw $0083 ; Health
    dl $7E0AF6 : db $02 : dw $0027 ; Samus X
    dl $7E0AFA : db $02 : dw $008B ; Samus Y
    dl $7ED91A : db $02 : dw $0013 ; Events, Items, Doors
    dw #$FFFF
.after

preset_SZM101_varia_pancake_fall:
    dw #preset_SZM101_varia_ripper_bomb_jump ; Varia: Ripper Bomb Jump
    dl $7E078D : db $02 : dw $8F76 ; DDB
    dl $7E079B : db $02 : dw $9552 ; MDB
    dl $7E090F : db $02 : dw $C000 ; Screen subpixel X position.
    dl $7E0913 : db $02 : dw $F800 ; Screen subpixel Y position
    dl $7E0921 : db $02 : dw $FF00 ; BG2 X scroll offset due to room transitions (Translates between Layer 2 scroll and BG2 scroll)
    dl $7E0AF6 : db $02 : dw $0034 ; Samus X
    dw #$FFFF
.after

preset_SZM101_varia_pre_grapple:
    dw #preset_SZM101_varia_pancake_fall ; Varia: Pancake Fall
    dl $7E078D : db $02 : dw $B404 ; DDB
    dl $7E078F : db $02 : dw $0003 ; DoorOut Index
    dl $7E079B : db $02 : dw $99BD ; MDB
    dl $7E07C3 : db $02 : dw $C629 ; GFX Pointers
    dl $7E07C5 : db $02 : dw $5DBA ; GFX Pointers
    dl $7E07C7 : db $02 : dw $C2AE ; GFX Pointers
    dl $7E090F : db $02 : dw $5FFF ; Screen subpixel X position.
    dl $7E0913 : db $02 : dw $B400 ; Screen subpixel Y position
    dl $7E0915 : db $02 : dw $0308 ; Screen Y position in pixels
    dl $7E0917 : db $02 : dw $0001 ; Layer 2 X scroll in room in pixels?
    dl $7E0919 : db $02 : dw $0246 ; Layer 2 Y scroll in room in pixels? (up = positive)
    dl $7E0923 : db $02 : dw $FB00 ; BG2 Y scroll offset due to room transitions (Translates between Layer 2 scroll and BG2 scroll)
    dl $7E09C2 : db $02 : dw $004E ; Health
    dl $7E09C6 : db $02 : dw $0008 ; Missiles
    dl $7E0A1C : db $02 : dw $0001 ; Samus position/state
    dl $7E0A1E : db $02 : dw $0008 ; More position/state
    dl $7E0AF6 : db $02 : dw $00C6 ; Samus X
    dl $7E0AFA : db $02 : dw $0395 ; Samus Y
    dl $7ED8C2 : db $02 : dw $0060 ; Events, Items, Doors
    dl $7ED91A : db $02 : dw $0016 ; Events, Items, Doors
    dw #$FFFF
.after

preset_SZM101_varia_post_grapple:
    dw #preset_SZM101_varia_pre_grapple ; Varia: Pre Grapple
    dl $7E078D : db $02 : dw $ADC9 ; DDB
    dl $7E078F : db $02 : dw $0001 ; DoorOut Index
    dl $7E079B : db $02 : dw $9E11 ; MDB
    dl $7E07C3 : db $02 : dw $F911 ; GFX Pointers
    dl $7E07C5 : db $02 : dw $43BA ; GFX Pointers
    dl $7E07C7 : db $02 : dw $C2AF ; GFX Pointers
    dl $7E07F3 : db $02 : dw $0036 ; Music Bank
    dl $7E07F5 : db $02 : dw $0003 ; Music Track
    dl $7E090F : db $02 : dw $A000 ; Screen subpixel X position.
    dl $7E0913 : db $02 : dw $4401 ; Screen subpixel Y position
    dl $7E0915 : db $02 : dw $0100 ; Screen Y position in pixels
    dl $7E0917 : db $02 : dw $0000 ; Layer 2 X scroll in room in pixels?
    dl $7E0919 : db $02 : dw $00C0 ; Layer 2 Y scroll in room in pixels? (up = positive)
    dl $7E0921 : db $02 : dw $0100 ; BG2 X scroll offset due to room transitions (Translates between Layer 2 scroll and BG2 scroll)
    dl $7E0923 : db $02 : dw $FF00 ; BG2 Y scroll offset due to room transitions (Translates between Layer 2 scroll and BG2 scroll)
    dl $7E09A2 : db $02 : dw $5004 ; Equipped Items
    dl $7E09A4 : db $02 : dw $5004 ; Collected Items
    dl $7E09C2 : db $02 : dw $0049 ; Health
    dl $7E0A1C : db $02 : dw $0041 ; Samus position/state
    dl $7E0A1E : db $02 : dw $0404 ; More position/state
    dl $7E0AF6 : db $02 : dw $0037 ; Samus X
    dl $7E0AFA : db $02 : dw $0149 ; Samus Y
    dl $7ED880 : db $02 : dw $0103 ; Events, Items, Doors
    dl $7ED91A : db $02 : dw $0017 ; Events, Items, Doors
    dw #$FFFF
.after

preset_SZM101_varia_super_room_entry:
    dw #preset_SZM101_varia_post_grapple ; Varia: Post Grapple
    dl $7E078D : db $02 : dw $BF38 ; DDB
    dl $7E078F : db $02 : dw $0000 ; DoorOut Index
    dl $7E079B : db $02 : dw $99F9 ; MDB
    dl $7E07C3 : db $02 : dw $C629 ; GFX Pointers
    dl $7E07C5 : db $02 : dw $5DBA ; GFX Pointers
    dl $7E07C7 : db $02 : dw $C2AE ; GFX Pointers
    dl $7E07F3 : db $02 : dw $0009 ; Music Bank
    dl $7E07F5 : db $02 : dw $0006 ; Music Track
    dl $7E090F : db $02 : dw $4000 ; Screen subpixel X position.
    dl $7E0911 : db $02 : dw $0700 ; Screen X position in pixels
    dl $7E0913 : db $02 : dw $F400 ; Screen subpixel Y position
    dl $7E0915 : db $02 : dw $0000 ; Screen Y position in pixels
    dl $7E0917 : db $02 : dw $0540 ; Layer 2 X scroll in room in pixels?
    dl $7E0919 : db $02 : dw $0000 ; Layer 2 Y scroll in room in pixels? (up = positive)
    dl $7E0921 : db $02 : dw $F800 ; BG2 X scroll offset due to room transitions (Translates between Layer 2 scroll and BG2 scroll)
    dl $7E0923 : db $02 : dw $0000 ; BG2 Y scroll offset due to room transitions (Translates between Layer 2 scroll and BG2 scroll)
    dl $7E09C2 : db $02 : dw $004E ; Health
    dl $7E0A1C : db $02 : dw $0002 ; Samus position/state
    dl $7E0A1E : db $02 : dw $0004 ; More position/state
    dl $7E0AF6 : db $02 : dw $07C9 ; Samus X
    dl $7E0AFA : db $02 : dw $008B ; Samus Y
    dl $7ED91A : db $02 : dw $001C ; Events, Items, Doors
    dw #$FFFF
.after

preset_SZM101_varia_super_ceiling_bomb_jump:
    dw #preset_SZM101_varia_super_room_entry ; Varia: Super Room Entry
    dl $7E090F : db $02 : dw $0000 ; Screen subpixel X position.
    dl $7E0911 : db $02 : dw $0175 ; Screen X position in pixels
    dl $7E0913 : db $02 : dw $9002 ; Screen subpixel Y position
    dl $7E0917 : db $02 : dw $0117 ; Layer 2 X scroll in room in pixels?
    dl $7E09C2 : db $02 : dw $00C7 ; Health
    dl $7E09C4 : db $02 : dw $00C7 ; Max health
    dl $7E0A1C : db $02 : dw $0041 ; Samus position/state
    dl $7E0A1E : db $02 : dw $0404 ; More position/state
    dl $7E0AF6 : db $02 : dw $0206 ; Samus X
    dl $7E0AFA : db $02 : dw $0049 ; Samus Y
    dl $7ED87C : db $02 : dw $0108 ; Events, Items, Doors
    dw #$FFFF
.after

preset_SZM101_varia_reserve_kihunters:
    dw #preset_SZM101_varia_super_ceiling_bomb_jump ; Varia: Super Ceiling Bomb Jump
    dl $7E090F : db $02 : dw $D000 ; Screen subpixel X position.
    dl $7E0911 : db $02 : dw $0000 ; Screen X position in pixels
    dl $7E0913 : db $02 : dw $0000 ; Screen subpixel Y position
    dl $7E0915 : db $02 : dw $011B ; Screen Y position in pixels
    dl $7E0917 : db $02 : dw $0000 ; Layer 2 X scroll in room in pixels?
    dl $7E0919 : db $02 : dw $00D4 ; Layer 2 Y scroll in room in pixels? (up = positive)
    dl $7E09CA : db $02 : dw $0002 ; Supers
    dl $7E09CC : db $02 : dw $0002 ; Max supers
    dl $7E0A1C : db $02 : dw $0002 ; Samus position/state
    dl $7E0A1E : db $02 : dw $0004 ; More position/state
    dl $7E0AF6 : db $02 : dw $0046 ; Samus X
    dl $7E0AFA : db $02 : dw $018B ; Samus Y
    dl $7ED874 : db $02 : dw $4000 ; Events, Items, Doors
    dw #$FFFF
.after

preset_SZM101_varia_shaft_top_2:
    dw #preset_SZM101_varia_reserve_kihunters ; Varia: Reserve KiHunters
    dl $7E078D : db $02 : dw $908A ; DDB
    dl $7E078F : db $02 : dw $0001 ; DoorOut Index
    dl $7E079B : db $02 : dw $8148 ; MDB
    dl $7E07C5 : db $02 : dw $7CBA ; GFX Pointers
    dl $7E07C7 : db $02 : dw $C2AD ; GFX Pointers
    dl $7E07F3 : db $02 : dw $0006 ; Music Bank
    dl $7E07F5 : db $02 : dw $0007 ; Music Track
    dl $7E090F : db $02 : dw $E000 ; Screen subpixel X position.
    dl $7E0913 : db $02 : dw $B400 ; Screen subpixel Y position
    dl $7E0915 : db $02 : dw $0000 ; Screen Y position in pixels
    dl $7E0919 : db $02 : dw $0000 ; Layer 2 Y scroll in room in pixels? (up = positive)
    dl $7E0921 : db $02 : dw $0100 ; BG2 X scroll offset due to room transitions (Translates between Layer 2 scroll and BG2 scroll)
    dl $7E09C0 : db $02 : dw $0001 ; Manual/Auto reserve tank
    dl $7E09C6 : db $02 : dw $0007 ; Missiles
    dl $7E09D4 : db $02 : dw $0064 ; Max reserves
    dl $7E0A1C : db $02 : dw $0001 ; Samus position/state
    dl $7E0A1E : db $02 : dw $0008 ; More position/state
    dl $7E0AF6 : db $02 : dw $0057 ; Samus X
    dl $7E0AFA : db $02 : dw $008B ; Samus Y
    dl $7ED87E : db $02 : dw $1000 ; Events, Items, Doors
    dl $7ED91A : db $02 : dw $0020 ; Events, Items, Doors
    dw #$FFFF
.after

preset_SZM101_varia_robot_clip_again:
    dw #preset_SZM101_varia_shaft_top_2 ; Varia: Shaft Top
    dl $7E078D : db $02 : dw $C018 ; DDB
    dl $7E078F : db $02 : dw $0002 ; DoorOut Index
    dl $7E079B : db $02 : dw $A3DD ; MDB
    dl $7E079F : db $02 : dw $0001 ; Region
    dl $7E07C3 : db $02 : dw $E6B0 ; GFX Pointers
    dl $7E07C5 : db $02 : dw $64BB ; GFX Pointers
    dl $7E07C7 : db $02 : dw $C2B2 ; GFX Pointers
    dl $7E07F3 : db $02 : dw $000F ; Music Bank
    dl $7E07F5 : db $02 : dw $0005 ; Music Track
    dl $7E090F : db $02 : dw $3000 ; Screen subpixel X position.
    dl $7E0913 : db $02 : dw $5C00 ; Screen subpixel Y position
    dl $7E09C6 : db $02 : dw $000A ; Missiles
    dl $7E09D6 : db $02 : dw $0014 ; Reserves
    dl $7E0AF6 : db $02 : dw $00C9 ; Samus X
    dl $7ED91A : db $02 : dw $0026 ; Events, Items, Doors
    dw #$FFFF
.after

preset_SZM101_varia_acid_dive:
    dw #preset_SZM101_varia_robot_clip_again ; Varia: Robot Clip Again
    dl $7E078D : db $02 : dw $9102 ; DDB
    dl $7E078F : db $02 : dw $0001 ; DoorOut Index
    dl $7E079B : db $02 : dw $A3AE ; MDB
    dl $7E090F : db $02 : dw $E000 ; Screen subpixel X position.
    dl $7E0911 : db $02 : dw $0200 ; Screen X position in pixels
    dl $7E0913 : db $02 : dw $0000 ; Screen subpixel Y position
    dl $7E0915 : db $02 : dw $001B ; Screen Y position in pixels
    dl $7E0917 : db $02 : dw $0200 ; Layer 2 X scroll in room in pixels?
    dl $7E0919 : db $02 : dw $001B ; Layer 2 Y scroll in room in pixels? (up = positive)
    dl $7E0923 : db $02 : dw $FD00 ; BG2 Y scroll offset due to room transitions (Translates between Layer 2 scroll and BG2 scroll)
    dl $7E09C6 : db $02 : dw $0009 ; Missiles
    dl $7E09D6 : db $02 : dw $0064 ; Reserves
    dl $7E0AF6 : db $02 : dw $0292 ; Samus X
    dl $7E0AFA : db $02 : dw $009B ; Samus Y
    dl $7ED8C4 : db $02 : dw $0040 ; Events, Items, Doors
    dw #$FFFF
.after

preset_SZM101_varia_secret_ceiling:
    dw #preset_SZM101_varia_acid_dive ; Varia: Acid Dive
    dl $7E078D : db $02 : dw $B194 ; DDB
    dl $7E078F : db $02 : dw $0003 ; DoorOut Index
    dl $7E079B : db $02 : dw $990D ; MDB
    dl $7E07C3 : db $02 : dw $A5AA ; GFX Pointers
    dl $7E07C5 : db $02 : dw $5FBC ; GFX Pointers
    dl $7E07C7 : db $02 : dw $C2B3 ; GFX Pointers
    dl $7E090F : db $02 : dw $7000 ; Screen subpixel X position.
    dl $7E0911 : db $02 : dw $0500 ; Screen X position in pixels
    dl $7E0915 : db $02 : dw $00ED ; Screen Y position in pixels
    dl $7E0917 : db $02 : dw $0500 ; Layer 2 X scroll in room in pixels?
    dl $7E0919 : db $02 : dw $00B1 ; Layer 2 Y scroll in room in pixels? (up = positive)
    dl $7E0923 : db $02 : dw $0000 ; BG2 Y scroll offset due to room transitions (Translates between Layer 2 scroll and BG2 scroll)
    dl $7E09C2 : db $02 : dw $000A ; Health
    dl $7E09C4 : db $02 : dw $00F9 ; Max health
    dl $7E09C6 : db $02 : dw $000A ; Missiles
    dl $7E0AF6 : db $02 : dw $05CC ; Samus X
    dl $7E0AFA : db $02 : dw $018B ; Samus Y
    dl $7ED87C : db $02 : dw $010C ; Events, Items, Doors
    dl $7ED91A : db $02 : dw $0027 ; Events, Items, Doors
    dw #$FFFF
.after

preset_SZM101_power_bombs_varia_exit:
    dw #preset_SZM101_varia_secret_ceiling ; Varia: Secret Ceiling
    dl $7E078D : db $02 : dw $8ADE ; DDB
    dl $7E078F : db $02 : dw $0000 ; DoorOut Index
    dl $7E079B : db $02 : dw $A051 ; MDB
    dl $7E07F5 : db $02 : dw $0003 ; Music Track
    dl $7E090F : db $02 : dw $8000 ; Screen subpixel X position.
    dl $7E0911 : db $02 : dw $0000 ; Screen X position in pixels
    dl $7E0913 : db $02 : dw $C000 ; Screen subpixel Y position
    dl $7E0915 : db $02 : dw $0000 ; Screen Y position in pixels
    dl $7E0917 : db $02 : dw $0000 ; Layer 2 X scroll in room in pixels?
    dl $7E0919 : db $02 : dw $0000 ; Layer 2 Y scroll in room in pixels? (up = positive)
    dl $7E0921 : db $02 : dw $FF00 ; BG2 X scroll offset due to room transitions (Translates between Layer 2 scroll and BG2 scroll)
    dl $7E09A2 : db $02 : dw $5005 ; Equipped Items
    dl $7E09A4 : db $02 : dw $5005 ; Collected Items
    dl $7E09C2 : db $02 : dw $0028 ; Health
    dl $7E09C6 : db $02 : dw $000E ; Missiles
    dl $7E09C8 : db $02 : dw $000F ; Max missiles
    dl $7E0AF6 : db $02 : dw $007A ; Samus X
    dl $7E0AFA : db $02 : dw $008B ; Samus Y
    dl $7ED870 : db $02 : dw $0084 ; Events, Items, Doors
    dl $7ED880 : db $02 : dw $0123 ; Events, Items, Doors
    dl $7ED8C6 : db $02 : dw $4000 ; Events, Items, Doors
    dl $7ED91A : db $02 : dw $002A ; Events, Items, Doors
    dw #$FFFF
.after

preset_SZM101_power_bombs_etank_short_mock:
    dw #preset_SZM101_power_bombs_varia_exit ; Power Bombs: Varia Exit
    dl $7E078D : db $02 : dw $A384 ; DDB
    dl $7E078F : db $02 : dw $0001 ; DoorOut Index
    dl $7E079B : db $02 : dw $9BC8 ; MDB
    dl $7E07F5 : db $02 : dw $0005 ; Music Track
    dl $7E090F : db $02 : dw $0000 ; Screen subpixel X position.
    dl $7E0911 : db $02 : dw $0415 ; Screen X position in pixels
    dl $7E0913 : db $02 : dw $1800 ; Screen subpixel Y position
    dl $7E0915 : db $02 : dw $009A ; Screen Y position in pixels
    dl $7E0917 : db $02 : dw $0415 ; Layer 2 X scroll in room in pixels?
    dl $7E0919 : db $02 : dw $009A ; Layer 2 Y scroll in room in pixels? (up = positive)
    dl $7E0921 : db $02 : dw $0100 ; BG2 X scroll offset due to room transitions (Translates between Layer 2 scroll and BG2 scroll)
    dl $7E09C2 : db $02 : dw $0016 ; Health
    dl $7E09C6 : db $02 : dw $0013 ; Missiles
    dl $7E09C8 : db $02 : dw $0014 ; Max missiles
    dl $7E0AF6 : db $02 : dw $0475 ; Samus X
    dl $7E0AFA : db $02 : dw $012B ; Samus Y
    dl $7ED870 : db $02 : dw $0184 ; Events, Items, Doors
    dl $7ED91A : db $02 : dw $002E ; Events, Items, Doors
    dw #$FFFF
.after

preset_SZM101_power_bombs_chozo_etank:
    dw #preset_SZM101_power_bombs_etank_short_mock ; Power Bombs: Etank Short Mock
    dl $7E078D : db $02 : dw $8D5A ; DDB
    dl $7E079B : db $02 : dw $A322 ; MDB
    dl $7E07C3 : db $02 : dw $E6B0 ; GFX Pointers
    dl $7E07C5 : db $02 : dw $64BB ; GFX Pointers
    dl $7E07C7 : db $02 : dw $C2B2 ; GFX Pointers
    dl $7E090F : db $02 : dw $D000 ; Screen subpixel X position.
    dl $7E0911 : db $02 : dw $0000 ; Screen X position in pixels
    dl $7E0913 : db $02 : dw $F800 ; Screen subpixel Y position
    dl $7E0915 : db $02 : dw $0709 ; Screen Y position in pixels
    dl $7E0917 : db $02 : dw $0000 ; Layer 2 X scroll in room in pixels?
    dl $7E0919 : db $02 : dw $0709 ; Layer 2 Y scroll in room in pixels? (up = positive)
    dl $7E0923 : db $02 : dw $FD00 ; BG2 Y scroll offset due to room transitions (Translates between Layer 2 scroll and BG2 scroll)
    dl $7E09C2 : db $02 : dw $011F ; Health
    dl $7E09C4 : db $02 : dw $012B ; Max health
    dl $7E09C6 : db $02 : dw $0012 ; Missiles
    dl $7E0A1C : db $02 : dw $0002 ; Samus position/state
    dl $7E0A1E : db $02 : dw $0004 ; More position/state
    dl $7E0AF6 : db $02 : dw $008D ; Samus X
    dl $7E0AFA : db $02 : dw $078B ; Samus Y
    dl $7ED87C : db $02 : dw $011C ; Events, Items, Doors
    dl $7ED8C4 : db $02 : dw $0050 ; Events, Items, Doors
    dl $7ED91A : db $02 : dw $002F ; Events, Items, Doors
    dw #$FFFF
.after

preset_SZM101_power_bombs_un_elevator:
    dw #preset_SZM101_power_bombs_chozo_etank ; Power Bombs: Chozo Etank
    dl $7E078D : db $02 : dw $8B1A ; DDB
    dl $7E078F : db $02 : dw $0003 ; DoorOut Index
    dl $7E079B : db $02 : dw $A6A1 ; MDB
    dl $7E07F3 : db $02 : dw $0012 ; Music Bank
    dl $7E07F5 : db $02 : dw $0003 ; Music Track
    dl $7E090F : db $02 : dw $7000 ; Screen subpixel X position.
    dl $7E0913 : db $02 : dw $5000 ; Screen subpixel Y position
    dl $7E0915 : db $02 : dw $0000 ; Screen Y position in pixels
    dl $7E0919 : db $02 : dw $0000 ; Layer 2 Y scroll in room in pixels? (up = positive)
    dl $7E0921 : db $02 : dw $FB00 ; BG2 X scroll offset due to room transitions (Translates between Layer 2 scroll and BG2 scroll)
    dl $7E0923 : db $02 : dw $0000 ; BG2 Y scroll offset due to room transitions (Translates between Layer 2 scroll and BG2 scroll)
    dl $7E09C2 : db $02 : dw $0158 ; Health
    dl $7E09C4 : db $02 : dw $015D ; Max health
    dl $7E0AF6 : db $02 : dw $0081 ; Samus X
    dl $7E0AFA : db $02 : dw $008B ; Samus Y
    dl $7ED87C : db $02 : dw $011E ; Events, Items, Doors
    dl $7ED91A : db $02 : dw $0031 ; Events, Items, Doors
    dw #$FFFF
.after

preset_SZM101_power_bombs_shot_block_wall:
    dw #preset_SZM101_power_bombs_un_elevator ; Power Bombs: UN Elevator
    dl $7E078D : db $02 : dw $9246 ; DDB
    dl $7E078F : db $02 : dw $0005 ; DoorOut Index
    dl $7E079B : db $02 : dw $A7DE ; MDB
    dl $7E079F : db $02 : dw $0002 ; Region
    dl $7E07C3 : db $02 : dw $C3F9 ; GFX Pointers
    dl $7E07C5 : db $02 : dw $BBBD ; GFX Pointers
    dl $7E07C7 : db $02 : dw $C2B6 ; GFX Pointers
    dl $7E07F3 : db $02 : dw $0015 ; Music Bank
    dl $7E07F5 : db $02 : dw $0005 ; Music Track
    dl $7E090F : db $02 : dw $4000 ; Screen subpixel X position.
    dl $7E0913 : db $02 : dw $0000 ; Screen subpixel Y position
    dl $7E0915 : db $02 : dw $0422 ; Screen Y position in pixels
    dl $7E0919 : db $02 : dw $0422 ; Layer 2 Y scroll in room in pixels? (up = positive)
    dl $7E0921 : db $02 : dw $0000 ; BG2 X scroll offset due to room transitions (Translates between Layer 2 scroll and BG2 scroll)
    dl $7E0923 : db $02 : dw $00E0 ; BG2 Y scroll offset due to room transitions (Translates between Layer 2 scroll and BG2 scroll)
    dl $7E09CA : db $02 : dw $0001 ; Supers
    dl $7E0AF6 : db $02 : dw $0025 ; Samus X
    dl $7E0AFA : db $02 : dw $048B ; Samus Y
    dl $7ED91A : db $02 : dw $0033 ; Events, Items, Doors
    dw #$FFFF
.after

preset_SZM101_power_bombs_lava_dive_farm:
    dw #preset_SZM101_power_bombs_shot_block_wall ; Power Bombs: Shot Block Wall
    dl $7E078D : db $02 : dw $9306 ; DDB
    dl $7E078F : db $02 : dw $0007 ; DoorOut Index
    dl $7E079B : db $02 : dw $A865 ; MDB
    dl $7E090F : db $02 : dw $3001 ; Screen subpixel X position.
    dl $7E0913 : db $02 : dw $1802 ; Screen subpixel Y position
    dl $7E0915 : db $02 : dw $0000 ; Screen Y position in pixels
    dl $7E0919 : db $02 : dw $0000 ; Layer 2 Y scroll in room in pixels? (up = positive)
    dl $7E0921 : db $02 : dw $FB00 ; BG2 X scroll offset due to room transitions (Translates between Layer 2 scroll and BG2 scroll)
    dl $7E0923 : db $02 : dw $0000 ; BG2 Y scroll offset due to room transitions (Translates between Layer 2 scroll and BG2 scroll)
    dl $7E09C2 : db $02 : dw $015D ; Health
    dl $7E0A1C : db $02 : dw $0041 ; Samus position/state
    dl $7E0A1E : db $02 : dw $0404 ; More position/state
    dl $7E0AF6 : db $02 : dw $0045 ; Samus X
    dl $7E0AFA : db $02 : dw $0069 ; Samus Y
    dw #$FFFF
.after

preset_SZM101_power_bombs_lava_dive_etank:
    dw #preset_SZM101_power_bombs_lava_dive_farm ; Power Bombs: Lava Dive Farm
    dl $7E078D : db $02 : dw $B080 ; DDB
    dl $7E078F : db $02 : dw $0001 ; DoorOut Index
    dl $7E079B : db $02 : dw $AC5A ; MDB
    dl $7E090F : db $02 : dw $5000 ; Screen subpixel X position.
    dl $7E0911 : db $02 : dw $000D ; Screen X position in pixels
    dl $7E0913 : db $02 : dw $FC00 ; Screen subpixel Y position
    dl $7E0915 : db $02 : dw $0400 ; Screen Y position in pixels
    dl $7E0917 : db $02 : dw $000D ; Layer 2 X scroll in room in pixels?
    dl $7E0919 : db $02 : dw $0400 ; Layer 2 Y scroll in room in pixels? (up = positive)
    dl $7E0921 : db $02 : dw $0100 ; BG2 X scroll offset due to room transitions (Translates between Layer 2 scroll and BG2 scroll)
    dl $7E0923 : db $02 : dw $FD00 ; BG2 Y scroll offset due to room transitions (Translates between Layer 2 scroll and BG2 scroll)
    dl $7E09C2 : db $02 : dw $0090 ; Health
    dl $7E09C6 : db $02 : dw $0019 ; Missiles
    dl $7E09C8 : db $02 : dw $0019 ; Max missiles
    dl $7E09CA : db $02 : dw $0002 ; Supers
    dl $7E0A1C : db $02 : dw $0002 ; Samus position/state
    dl $7E0A1E : db $02 : dw $0004 ; More position/state
    dl $7E0AF6 : db $02 : dw $0096 ; Samus X
    dl $7E0AFA : db $02 : dw $048B ; Samus Y
    dl $7ED872 : db $02 : dw $0101 ; Events, Items, Doors
    dl $7ED91A : db $02 : dw $0037 ; Events, Items, Doors
    dw #$FFFF
.after

preset_SZM101_power_bombs_big_hopper_empty_shaft:
    dw #preset_SZM101_power_bombs_lava_dive_etank ; Power Bombs: Lava Dive Etank
    dl $7E078D : db $02 : dw $94E6 ; DDB
    dl $7E078F : db $02 : dw $0000 ; DoorOut Index
    dl $7E079B : db $02 : dw $B07A ; MDB
    dl $7E079F : db $02 : dw $0001 ; Region
    dl $7E07C3 : db $02 : dw $A5AA ; GFX Pointers
    dl $7E07C5 : db $02 : dw $5FBC ; GFX Pointers
    dl $7E07C7 : db $02 : dw $C2B3 ; GFX Pointers
    dl $7E07F5 : db $02 : dw $0003 ; Music Track
    dl $7E090F : db $02 : dw $C000 ; Screen subpixel X position.
    dl $7E0911 : db $02 : dw $0000 ; Screen X position in pixels
    dl $7E0913 : db $02 : dw $0000 ; Screen subpixel Y position
    dl $7E0915 : db $02 : dw $0000 ; Screen Y position in pixels
    dl $7E0917 : db $02 : dw $0000 ; Layer 2 X scroll in room in pixels?
    dl $7E0919 : db $02 : dw $0000 ; Layer 2 Y scroll in room in pixels? (up = positive)
    dl $7E0921 : db $02 : dw $FF00 ; BG2 X scroll offset due to room transitions (Translates between Layer 2 scroll and BG2 scroll)
    dl $7E0923 : db $02 : dw $0000 ; BG2 Y scroll offset due to room transitions (Translates between Layer 2 scroll and BG2 scroll)
    dl $7E09C2 : db $02 : dw $00D4 ; Health
    dl $7E09C4 : db $02 : dw $018F ; Max health
    dl $7E09C6 : db $02 : dw $0017 ; Missiles
    dl $7E0A1C : db $02 : dw $0041 ; Samus position/state
    dl $7E0A1E : db $02 : dw $0404 ; More position/state
    dl $7E0AF6 : db $02 : dw $00B5 ; Samus X
    dl $7E0AFA : db $02 : dw $0099 ; Samus Y
    dl $7ED87C : db $02 : dw $811E ; Events, Items, Doors
    dl $7ED91A : db $02 : dw $0038 ; Events, Items, Doors
    dw #$FFFF
.after

preset_SZM101_power_bombs_speed_room:
    dw #preset_SZM101_power_bombs_big_hopper_empty_shaft ; Power Bombs: Big Hopper Empty Shaft
    dl $7E078D : db $02 : dw $97AA ; DDB
    dl $7E079B : db $02 : dw $ACF0 ; MDB
    dl $7E07C3 : db $02 : dw $E6B0 ; GFX Pointers
    dl $7E07C5 : db $02 : dw $64BB ; GFX Pointers
    dl $7E07C7 : db $02 : dw $C2B2 ; GFX Pointers
    dl $7E07F3 : db $02 : dw $0012 ; Music Bank
    dl $7E07F5 : db $02 : dw $0005 ; Music Track
    dl $7E090F : db $02 : dw $0000 ; Screen subpixel X position.
    dl $7E0913 : db $02 : dw $7000 ; Screen subpixel Y position
    dl $7E0915 : db $02 : dw $0400 ; Screen Y position in pixels
    dl $7E0919 : db $02 : dw $0400 ; Layer 2 Y scroll in room in pixels? (up = positive)
    dl $7E0921 : db $02 : dw $FA00 ; BG2 X scroll offset due to room transitions (Translates between Layer 2 scroll and BG2 scroll)
    dl $7E09C2 : db $02 : dw $0043 ; Health
    dl $7E0A1C : db $02 : dw $0002 ; Samus position/state
    dl $7E0A1E : db $02 : dw $0004 ; More position/state
    dl $7E0AF6 : db $02 : dw $0093 ; Samus X
    dl $7E0AFA : db $02 : dw $049B ; Samus Y
    dl $7ED91A : db $02 : dw $0039 ; Events, Items, Doors
    dw #$FFFF
.after

preset_SZM101_power_bombs_big_hopper_ramps:
    dw #preset_SZM101_power_bombs_speed_room ; Power Bombs: Speed Room
    dl $7E078D : db $02 : dw $B0B0 ; DDB
    dl $7E078F : db $02 : dw $0001 ; DoorOut Index
    dl $7E079B : db $02 : dw $AD1B ; MDB
    dl $7E07C3 : db $02 : dw $A5AA ; GFX Pointers
    dl $7E07C5 : db $02 : dw $5FBC ; GFX Pointers
    dl $7E07C7 : db $02 : dw $C2B3 ; GFX Pointers
    dl $7E07F5 : db $02 : dw $0003 ; Music Track
    dl $7E090F : db $02 : dw $4000 ; Screen subpixel X position.
    dl $7E0911 : db $02 : dw $0100 ; Screen X position in pixels
    dl $7E0913 : db $02 : dw $A800 ; Screen subpixel Y position
    dl $7E0915 : db $02 : dw $0100 ; Screen Y position in pixels
    dl $7E0917 : db $02 : dw $0100 ; Layer 2 X scroll in room in pixels?
    dl $7E0919 : db $02 : dw $0100 ; Layer 2 Y scroll in room in pixels? (up = positive)
    dl $7E0921 : db $02 : dw $FE00 ; BG2 X scroll offset due to room transitions (Translates between Layer 2 scroll and BG2 scroll)
    dl $7E0923 : db $02 : dw $FF00 ; BG2 Y scroll offset due to room transitions (Translates between Layer 2 scroll and BG2 scroll)
    dl $7E09A2 : db $02 : dw $7005 ; Equipped Items
    dl $7E09A4 : db $02 : dw $7005 ; Collected Items
    dl $7E09C2 : db $02 : dw $018F ; Health
    dl $7E09C6 : db $02 : dw $0019 ; Missiles
    dl $7E09CA : db $02 : dw $0004 ; Supers
    dl $7E09CC : db $02 : dw $0004 ; Max supers
    dl $7E0A1C : db $02 : dw $0001 ; Samus position/state
    dl $7E0A1E : db $02 : dw $0008 ; More position/state
    dl $7E0AF6 : db $02 : dw $0175 ; Samus X
    dl $7E0AFA : db $02 : dw $019B ; Samus Y
    dl $7ED820 : db $02 : dw $0001 ; Events, Items, Doors
    dl $7ED878 : db $02 : dw $0001 ; Events, Items, Doors
    dl $7ED880 : db $02 : dw $0163 ; Events, Items, Doors
    dl $7ED8CE : db $02 : dw $4000 ; Events, Items, Doors
    dl $7ED91A : db $02 : dw $003B ; Events, Items, Doors
    dw #$FFFF
.after

preset_SZM101_power_bombs_maglodite_lava_dive:
    dw #preset_SZM101_power_bombs_big_hopper_ramps ; Power Bombs: Big Hopper Ramps
    dl $7E078D : db $02 : dw $B0BC ; DDB
    dl $7E078F : db $02 : dw $0002 ; DoorOut Index
    dl $7E079B : db $02 : dw $B07A ; MDB
    dl $7E090F : db $02 : dw $4400 ; Screen subpixel X position.
    dl $7E0911 : db $02 : dw $0000 ; Screen X position in pixels
    dl $7E0913 : db $02 : dw $F400 ; Screen subpixel Y position
    dl $7E0915 : db $02 : dw $001B ; Screen Y position in pixels
    dl $7E0917 : db $02 : dw $0000 ; Layer 2 X scroll in room in pixels?
    dl $7E0919 : db $02 : dw $001B ; Layer 2 Y scroll in room in pixels? (up = positive)
    dl $7E0921 : db $02 : dw $0100 ; BG2 X scroll offset due to room transitions (Translates between Layer 2 scroll and BG2 scroll)
    dl $7E0923 : db $02 : dw $FD00 ; BG2 Y scroll offset due to room transitions (Translates between Layer 2 scroll and BG2 scroll)
    dl $7E09C2 : db $02 : dw $014E ; Health
    dl $7E09CA : db $02 : dw $0006 ; Supers
    dl $7E09CC : db $02 : dw $0006 ; Max supers
    dl $7E0AF6 : db $02 : dw $00B5 ; Samus X
    dl $7E0AFA : db $02 : dw $008B ; Samus Y
    dl $7ED876 : db $02 : dw $8000 ; Events, Items, Doors
    dl $7ED91A : db $02 : dw $003C ; Events, Items, Doors
    dw #$FFFF
.after

preset_SZM101_power_bombs_springball_room_:
    dw #preset_SZM101_power_bombs_maglodite_lava_dive ; Power Bombs: Maglodite Lava Dive
    dl $7E078D : db $02 : dw $9786 ; DDB
    dl $7E078F : db $02 : dw $0000 ; DoorOut Index
    dl $7E079B : db $02 : dw $AC5A ; MDB
    dl $7E079F : db $02 : dw $0002 ; Region
    dl $7E07C3 : db $02 : dw $C3F9 ; GFX Pointers
    dl $7E07C5 : db $02 : dw $BBBD ; GFX Pointers
    dl $7E07C7 : db $02 : dw $C2B6 ; GFX Pointers
    dl $7E07F3 : db $02 : dw $0015 ; Music Bank
    dl $7E07F5 : db $02 : dw $0005 ; Music Track
    dl $7E090F : db $02 : dw $0300 ; Screen subpixel X position.
    dl $7E0911 : db $02 : dw $0500 ; Screen X position in pixels
    dl $7E0913 : db $02 : dw $0000 ; Screen subpixel Y position
    dl $7E0915 : db $02 : dw $024C ; Screen Y position in pixels
    dl $7E0917 : db $02 : dw $0500 ; Layer 2 X scroll in room in pixels?
    dl $7E0919 : db $02 : dw $024C ; Layer 2 Y scroll in room in pixels? (up = positive)
    dl $7E0923 : db $02 : dw $FC00 ; BG2 Y scroll offset due to room transitions (Translates between Layer 2 scroll and BG2 scroll)
    dl $7E09C2 : db $02 : dw $0134 ; Health
    dl $7E0A1C : db $02 : dw $0089 ; Samus position/state
    dl $7E0A1E : db $02 : dw $1508 ; More position/state
    dl $7E0AF6 : db $02 : dw $05DB ; Samus X
    dl $7E0AFA : db $02 : dw $02BB ; Samus Y
    dl $7ED91A : db $02 : dw $003E ; Events, Items, Doors
    dw #$FFFF
.after

preset_SZM101_power_bombs_spikesuit:
    dw #preset_SZM101_power_bombs_springball_room_ ; Power Bombs: Springball Room 
    dl $7E078D : db $02 : dw $AFFC ; DDB
    dl $7E079B : db $02 : dw $AB07 ; MDB
    dl $7E090F : db $02 : dw $B000 ; Screen subpixel X position.
    dl $7E0911 : db $02 : dw $0000 ; Screen X position in pixels
    dl $7E0915 : db $02 : dw $0400 ; Screen Y position in pixels
    dl $7E0917 : db $02 : dw $0000 ; Layer 2 X scroll in room in pixels?
    dl $7E0919 : db $02 : dw $0300 ; Layer 2 Y scroll in room in pixels? (up = positive)
    dl $7E0923 : db $02 : dw $FD00 ; BG2 Y scroll offset due to room transitions (Translates between Layer 2 scroll and BG2 scroll)
    dl $7E09C6 : db $02 : dw $0018 ; Missiles
    dl $7E0A1C : db $02 : dw $0001 ; Samus position/state
    dl $7E0A1E : db $02 : dw $0008 ; More position/state
    dl $7E0AF6 : db $02 : dw $00C4 ; Samus X
    dl $7E0AFA : db $02 : dw $048B ; Samus Y
    dl $7ED91A : db $02 : dw $0040 ; Events, Items, Doors
    dw #$FFFF
.after

preset_SZM101_power_bombs_morph_gauntlet:
    dw #preset_SZM101_power_bombs_spikesuit ; Power Bombs: Spikesuit
    dl $7E078D : db $02 : dw $9276 ; DDB
    dl $7E079B : db $02 : dw $AEDF ; MDB
    dl $7E07C5 : db $02 : dw $E4BD ; GFX Pointers
    dl $7E07C7 : db $02 : dw $C2B5 ; GFX Pointers
    dl $7E090F : db $02 : dw $C000 ; Screen subpixel X position.
    dl $7E0913 : db $02 : dw $4000 ; Screen subpixel Y position
    dl $7E0915 : db $02 : dw $011F ; Screen Y position in pixels
    dl $7E0919 : db $02 : dw $011F ; Layer 2 Y scroll in room in pixels? (up = positive)
    dl $7E0923 : db $02 : dw $FF00 ; BG2 Y scroll offset due to room transitions (Translates between Layer 2 scroll and BG2 scroll)
    dl $7E09C2 : db $02 : dw $00CB ; Health
    dl $7E0A1C : db $02 : dw $001D ; Samus position/state
    dl $7E0A1E : db $02 : dw $0408 ; More position/state
    dl $7E0A68 : db $02 : dw $0001 ; Flash suit
    dl $7E0AF6 : db $02 : dw $0097 ; Samus X
    dl $7E0AFA : db $02 : dw $01D9 ; Samus Y
    dw #$FFFF
.after

preset_SZM101_upper_norfair_leaving_power_bomb_room:
    dw #preset_SZM101_power_bombs_morph_gauntlet ; Power Bombs: Morph Gauntlet
    dl $7E078D : db $02 : dw $B1F4 ; DDB
    dl $7E078F : db $02 : dw $0002 ; DoorOut Index
    dl $7E079B : db $02 : dw $ADAD ; MDB
    dl $7E090F : db $02 : dw $CE80 ; Screen subpixel X position.
    dl $7E0913 : db $02 : dw $0000 ; Screen subpixel Y position
    dl $7E0915 : db $02 : dw $00FC ; Screen Y position in pixels
    dl $7E0919 : db $02 : dw $00FC ; Layer 2 Y scroll in room in pixels? (up = positive)
    dl $7E09C2 : db $02 : dw $00F0 ; Health
    dl $7E09CA : db $02 : dw $0005 ; Supers
    dl $7E09CE : db $02 : dw $0002 ; Pbs
    dl $7E09D0 : db $02 : dw $0002 ; Max pbs
    dl $7E0A1C : db $02 : dw $0002 ; Samus position/state
    dl $7E0A1E : db $02 : dw $0004 ; More position/state
    dl $7E0A68 : db $02 : dw $0000 ; Flash suit
    dl $7E0AF6 : db $02 : dw $0031 ; Samus X
    dl $7E0AFA : db $02 : dw $018B ; Samus Y
    dl $7E0B3F : db $02 : dw $0004 ; Blue suit
    dl $7ED878 : db $02 : dw $4001 ; Events, Items, Doors
    dl $7ED8C6 : db $02 : dw $4020 ; Events, Items, Doors
    dl $7ED91A : db $02 : dw $0041 ; Events, Items, Doors
    dw #$FFFF
.after

preset_SZM101_upper_norfair_pre_ice:
    dw #preset_SZM101_upper_norfair_leaving_power_bomb_room ; Upper Norfair: Leaving Power Bomb Room
    dl $7E078D : db $02 : dw $970E ; DDB
    dl $7E078F : db $02 : dw $0000 ; DoorOut Index
    dl $7E079B : db $02 : dw $A923 ; MDB
    dl $7E07C5 : db $02 : dw $BBBD ; GFX Pointers
    dl $7E07C7 : db $02 : dw $C2B6 ; GFX Pointers
    dl $7E090F : db $02 : dw $6000 ; Screen subpixel X position.
    dl $7E0915 : db $02 : dw $001D ; Screen Y position in pixels
    dl $7E0919 : db $02 : dw $001D ; Layer 2 Y scroll in room in pixels? (up = positive)
    dl $7E0923 : db $02 : dw $F800 ; BG2 Y scroll offset due to room transitions (Translates between Layer 2 scroll and BG2 scroll)
    dl $7E09C2 : db $02 : dw $00E6 ; Health
    dl $7E09CA : db $02 : dw $0006 ; Supers
    dl $7E0AF6 : db $02 : dw $0082 ; Samus X
    dl $7E0AFA : db $02 : dw $008B ; Samus Y
    dl $7E0B3F : db $02 : dw $0000 ; Blue suit
    dl $7ED91A : db $02 : dw $0042 ; Events, Items, Doors
    dw #$FFFF
.after

preset_SZM101_upper_norfair_leaving_ice:
    dw #preset_SZM101_upper_norfair_pre_ice ; Upper Norfair: Pre Ice
    dl $7E078D : db $02 : dw $96AE ; DDB
    dl $7E079B : db $02 : dw $AC83 ; MDB
    dl $7E07F5 : db $02 : dw $0003 ; Music Track
    dl $7E090F : db $02 : dw $8180 ; Screen subpixel X position.
    dl $7E0911 : db $02 : dw $0100 ; Screen X position in pixels
    dl $7E0913 : db $02 : dw $B800 ; Screen subpixel Y position
    dl $7E0915 : db $02 : dw $0000 ; Screen Y position in pixels
    dl $7E0917 : db $02 : dw $0100 ; Layer 2 X scroll in room in pixels?
    dl $7E0919 : db $02 : dw $0000 ; Layer 2 Y scroll in room in pixels? (up = positive)
    dl $7E0921 : db $02 : dw $FE00 ; BG2 X scroll offset due to room transitions (Translates between Layer 2 scroll and BG2 scroll)
    dl $7E0923 : db $02 : dw $0000 ; BG2 Y scroll offset due to room transitions (Translates between Layer 2 scroll and BG2 scroll)
    dl $7E09A6 : db $02 : dw $0002 ; Beams
    dl $7E09A8 : db $02 : dw $0002 ; Beams
    dl $7E09C6 : db $02 : dw $0017 ; Missiles
    dl $7E09CA : db $02 : dw $0005 ; Supers
    dl $7E0A1C : db $02 : dw $0001 ; Samus position/state
    dl $7E0A1E : db $02 : dw $0008 ; More position/state
    dl $7E0AF6 : db $02 : dw $0192 ; Samus X
    dl $7ED880 : db $02 : dw $01E3 ; Events, Items, Doors
    dl $7ED8C4 : db $02 : dw $2050 ; Events, Items, Doors
    dl $7ED8C6 : db $02 : dw $40A0 ; Events, Items, Doors
    dl $7ED91A : db $02 : dw $0043 ; Events, Items, Doors
    dw #$FFFF
.after

preset_SZM101_upper_norfair_baby_croc_supers:
    dw #preset_SZM101_upper_norfair_leaving_ice ; Upper Norfair: Leaving Ice
    dl $7E078D : db $02 : dw $96BA ; DDB
    dl $7E078F : db $02 : dw $0001 ; DoorOut Index
    dl $7E079B : db $02 : dw $A923 ; MDB
    dl $7E07F5 : db $02 : dw $0005 ; Music Track
    dl $7E090F : db $02 : dw $7D80 ; Screen subpixel X position.
    dl $7E0911 : db $02 : dw $0000 ; Screen X position in pixels
    dl $7E0913 : db $02 : dw $0000 ; Screen subpixel Y position
    dl $7E0915 : db $02 : dw $0324 ; Screen Y position in pixels
    dl $7E0917 : db $02 : dw $0000 ; Layer 2 X scroll in room in pixels?
    dl $7E0919 : db $02 : dw $0324 ; Layer 2 Y scroll in room in pixels? (up = positive)
    dl $7E0921 : db $02 : dw $0100 ; BG2 X scroll offset due to room transitions (Translates between Layer 2 scroll and BG2 scroll)
    dl $7E09C2 : db $02 : dw $00E1 ; Health
    dl $7E09CA : db $02 : dw $0006 ; Supers
    dl $7E09CC : db $02 : dw $0008 ; Max supers
    dl $7E0A1C : db $02 : dw $0002 ; Samus position/state
    dl $7E0A1E : db $02 : dw $0004 ; More position/state
    dl $7E0AF6 : db $02 : dw $0031 ; Samus X
    dl $7E0AFA : db $02 : dw $0394 ; Samus Y
    dl $7ED876 : db $02 : dw $A000 ; Events, Items, Doors
    dl $7ED91A : db $02 : dw $0044 ; Events, Items, Doors
    dw #$FFFF
.after

preset_SZM101_upper_norfair_pre_hi_jump:
    dw #preset_SZM101_upper_norfair_baby_croc_supers ; Upper Norfair: Baby Croc Supers
    dl $7E078D : db $02 : dw $93BA ; DDB
    dl $7E078F : db $02 : dw $0002 ; DoorOut Index
    dl $7E079B : db $02 : dw $AD5E ; MDB
    dl $7E090F : db $02 : dw $0080 ; Screen subpixel X position.
    dl $7E0911 : db $02 : dw $0300 ; Screen X position in pixels
    dl $7E0915 : db $02 : dw $0411 ; Screen Y position in pixels
    dl $7E0917 : db $02 : dw $0300 ; Layer 2 X scroll in room in pixels?
    dl $7E0919 : db $02 : dw $0411 ; Layer 2 Y scroll in room in pixels? (up = positive)
    dl $7E0921 : db $02 : dw $FC00 ; BG2 X scroll offset due to room transitions (Translates between Layer 2 scroll and BG2 scroll)
    dl $7E0923 : db $02 : dw $FF00 ; BG2 Y scroll offset due to room transitions (Translates between Layer 2 scroll and BG2 scroll)
    dl $7E09C2 : db $02 : dw $01C1 ; Health
    dl $7E09C4 : db $02 : dw $01C1 ; Max health
    dl $7E09CA : db $02 : dw $0007 ; Supers
    dl $7E09CC : db $02 : dw $000A ; Max supers
    dl $7E0A1C : db $02 : dw $0001 ; Samus position/state
    dl $7E0A1E : db $02 : dw $0008 ; More position/state
    dl $7E0A68 : db $02 : dw $0000 ; Flash suit
    dl $7E0AF6 : db $02 : dw $03D1 ; Samus X
    dl $7E0AFA : db $02 : dw $0484 ; Samus Y
    dl $7E0B3F : db $02 : dw $0004 ; Blue suit
    dl $7ED878 : db $02 : dw $4003 ; Events, Items, Doors
    dl $7ED87C : db $02 : dw $A11E ; Events, Items, Doors
    dl $7ED91A : db $02 : dw $0046 ; Events, Items, Doors
    dw #$FFFF
.after

preset_SZM101_upper_norfair_leaving_hi_jump:
    dw #preset_SZM101_upper_norfair_pre_hi_jump ; Upper Norfair: Pre Hi Jump
    dl $7E078D : db $02 : dw $93AE ; DDB
    dl $7E078F : db $02 : dw $0001 ; DoorOut Index
    dl $7E079B : db $02 : dw $A9E5 ; MDB
    dl $7E07F5 : db $02 : dw $0003 ; Music Track
    dl $7E090F : db $02 : dw $1400 ; Screen subpixel X position.
    dl $7E0911 : db $02 : dw $0000 ; Screen X position in pixels
    dl $7E0915 : db $02 : dw $000B ; Screen Y position in pixels
    dl $7E0917 : db $02 : dw $0000 ; Layer 2 X scroll in room in pixels?
    dl $7E0919 : db $02 : dw $0008 ; Layer 2 Y scroll in room in pixels? (up = positive)
    dl $7E0921 : db $02 : dw $0100 ; BG2 X scroll offset due to room transitions (Translates between Layer 2 scroll and BG2 scroll)
    dl $7E0923 : db $02 : dw $0000 ; BG2 Y scroll offset due to room transitions (Translates between Layer 2 scroll and BG2 scroll)
    dl $7E09A2 : db $02 : dw $7105 ; Equipped Items
    dl $7E09A4 : db $02 : dw $7105 ; Collected Items
    dl $7E09C6 : db $02 : dw $0016 ; Missiles
    dl $7E0A1C : db $02 : dw $0002 ; Samus position/state
    dl $7E0A1E : db $02 : dw $0004 ; More position/state
    dl $7E0AF6 : db $02 : dw $0098 ; Samus X
    dl $7E0AFA : db $02 : dw $007B ; Samus Y
    dl $7ED880 : db $02 : dw $01F3 ; Events, Items, Doors
    dl $7ED8C4 : db $02 : dw $A050 ; Events, Items, Doors
    dl $7ED91A : db $02 : dw $0048 ; Events, Items, Doors
    dw #$FFFF
.after

preset_SZM101_upper_norfair_springball:
    dw #preset_SZM101_upper_norfair_leaving_hi_jump ; Upper Norfair: Leaving Hi Jump
    dl $7E078D : db $02 : dw $9282 ; DDB
    dl $7E079B : db $02 : dw $AB07 ; MDB
    dl $7E07F5 : db $02 : dw $0005 ; Music Track
    dl $7E090F : db $02 : dw $F000 ; Screen subpixel X position.
    dl $7E0915 : db $02 : dw $0000 ; Screen Y position in pixels
    dl $7E0919 : db $02 : dw $0000 ; Layer 2 Y scroll in room in pixels? (up = positive)
    dl $7E0921 : db $02 : dw $FF00 ; BG2 X scroll offset due to room transitions (Translates between Layer 2 scroll and BG2 scroll)
    dl $7E0923 : db $02 : dw $FC00 ; BG2 Y scroll offset due to room transitions (Translates between Layer 2 scroll and BG2 scroll)
    dl $7E09C2 : db $02 : dw $019E ; Health
    dl $7E09CA : db $02 : dw $0009 ; Supers
    dl $7E0AF6 : db $02 : dw $003D ; Samus X
    dl $7E0AFA : db $02 : dw $008B ; Samus Y
    dl $7E0B3F : db $02 : dw $0000 ; Blue suit
    dl $7ED91A : db $02 : dw $0049 ; Events, Items, Doors
    dw #$FFFF
.after

preset_SZM101_upper_norfair_big_dessgeegas:
    dw #preset_SZM101_upper_norfair_springball ; Upper Norfair: Springball
    dl $7E078D : db $02 : dw $949E ; DDB
    dl $7E078F : db $02 : dw $0003 ; DoorOut Index
    dl $7E079B : db $02 : dw $ADDE ; MDB
    dl $7E090F : db $02 : dw $1C00 ; Screen subpixel X position.
    dl $7E0911 : db $02 : dw $0220 ; Screen X position in pixels
    dl $7E0913 : db $02 : dw $9800 ; Screen subpixel Y position
    dl $7E0915 : db $02 : dw $0500 ; Screen Y position in pixels
    dl $7E0917 : db $02 : dw $0220 ; Layer 2 X scroll in room in pixels?
    dl $7E0919 : db $02 : dw $0500 ; Layer 2 Y scroll in room in pixels? (up = positive)
    dl $7E0921 : db $02 : dw $F900 ; BG2 X scroll offset due to room transitions (Translates between Layer 2 scroll and BG2 scroll)
    dl $7E0923 : db $02 : dw $0000 ; BG2 Y scroll offset due to room transitions (Translates between Layer 2 scroll and BG2 scroll)
    dl $7E09A2 : db $02 : dw $7107 ; Equipped Items
    dl $7E09A4 : db $02 : dw $7107 ; Collected Items
    dl $7E09C2 : db $02 : dw $01BC ; Health
    dl $7E09C6 : db $02 : dw $0006 ; Missiles
    dl $7E09CE : db $02 : dw $0004 ; Pbs
    dl $7E09D0 : db $02 : dw $0004 ; Max pbs
    dl $7E0A1C : db $02 : dw $0001 ; Samus position/state
    dl $7E0A1E : db $02 : dw $0008 ; More position/state
    dl $7E0AF6 : db $02 : dw $0298 ; Samus X
    dl $7E0AFA : db $02 : dw $057B ; Samus Y
    dl $7ED878 : db $02 : dw $C003 ; Events, Items, Doors
    dl $7ED880 : db $02 : dw $41F3 ; Events, Items, Doors
    dl $7ED91A : db $02 : dw $004B ; Events, Items, Doors
    dw #$FFFF
.after

preset_SZM101_upper_norfair_wave_block_pit:
    dw #preset_SZM101_upper_norfair_big_dessgeegas ; Upper Norfair: Big Dessgeegas
    dl $7E078D : db $02 : dw $B248 ; DDB
    dl $7E078F : db $02 : dw $0001 ; DoorOut Index
    dl $7E079B : db $02 : dw $B1BB ; MDB
    dl $7E07C5 : db $02 : dw $E4BD ; GFX Pointers
    dl $7E07C7 : db $02 : dw $C2B5 ; GFX Pointers
    dl $7E090F : db $02 : dw $6780 ; Screen subpixel X position.
    dl $7E0911 : db $02 : dw $0000 ; Screen X position in pixels
    dl $7E0913 : db $02 : dw $F000 ; Screen subpixel Y position
    dl $7E0915 : db $02 : dw $0000 ; Screen Y position in pixels
    dl $7E0917 : db $02 : dw $0000 ; Layer 2 X scroll in room in pixels?
    dl $7E0919 : db $02 : dw $0000 ; Layer 2 Y scroll in room in pixels? (up = positive)
    dl $7E0921 : db $02 : dw $0100 ; BG2 X scroll offset due to room transitions (Translates between Layer 2 scroll and BG2 scroll)
    dl $7E09C2 : db $02 : dw $018A ; Health
    dl $7E09CA : db $02 : dw $0008 ; Supers
    dl $7E0AF6 : db $02 : dw $0039 ; Samus X
    dl $7E0AFA : db $02 : dw $008B ; Samus Y
    dl $7ED8C6 : db $02 : dw $40E0 ; Events, Items, Doors
    dl $7ED91A : db $02 : dw $004F ; Events, Items, Doors
    dw #$FFFF
.after

preset_SZM101_upper_norfair_exiting_wave:
    dw #preset_SZM101_upper_norfair_wave_block_pit ; Upper Norfair: Wave Block Pit
    dl $7E078D : db $02 : dw $8C0A ; DDB
    dl $7E079B : db $02 : dw $A815 ; MDB
    dl $7E090F : db $02 : dw $9400 ; Screen subpixel X position.
    dl $7E0911 : db $02 : dw $0500 ; Screen X position in pixels
    dl $7E0913 : db $02 : dw $0000 ; Screen subpixel Y position
    dl $7E0917 : db $02 : dw $0500 ; Layer 2 X scroll in room in pixels?
    dl $7E0921 : db $02 : dw $F900 ; BG2 X scroll offset due to room transitions (Translates between Layer 2 scroll and BG2 scroll)
    dl $7E09A6 : db $02 : dw $0003 ; Beams
    dl $7E09A8 : db $02 : dw $0003 ; Beams
    dl $7E09CA : db $02 : dw $0009 ; Supers
    dl $7E0AF6 : db $02 : dw $0547 ; Samus X
    dl $7ED880 : db $02 : dw $43F3 ; Events, Items, Doors
    dl $7ED8C4 : db $02 : dw $B050 ; Events, Items, Doors
    dl $7ED91A : db $02 : dw $0053 ; Events, Items, Doors
    dw #$FFFF
.after

preset_SZM101_upper_norfair_missiles_below_wave:
    dw #preset_SZM101_upper_norfair_exiting_wave ; Upper Norfair: Exiting Wave
    dl $7E078D : db $02 : dw $B260 ; DDB
    dl $7E078F : db $02 : dw $0003 ; DoorOut Index
    dl $7E079B : db $02 : dw $A788 ; MDB
    dl $7E090F : db $02 : dw $C000 ; Screen subpixel X position.
    dl $7E0911 : db $02 : dw $00EB ; Screen X position in pixels
    dl $7E0913 : db $02 : dw $5000 ; Screen subpixel Y position
    dl $7E0915 : db $02 : dw $030D ; Screen Y position in pixels
    dl $7E0917 : db $02 : dw $00B0 ; Layer 2 X scroll in room in pixels?
    dl $7E0919 : db $02 : dw $0249 ; Layer 2 Y scroll in room in pixels? (up = positive)
    dl $7E0921 : db $02 : dw $0100 ; BG2 X scroll offset due to room transitions (Translates between Layer 2 scroll and BG2 scroll)
    dl $7E09CA : db $02 : dw $0007 ; Supers
    dl $7E09CE : db $02 : dw $0003 ; Pbs
    dl $7E0A1C : db $02 : dw $0002 ; Samus position/state
    dl $7E0A1E : db $02 : dw $0004 ; More position/state
    dl $7E0AF6 : db $02 : dw $0186 ; Samus X
    dl $7E0AFA : db $02 : dw $037B ; Samus Y
    dw #$FFFF
.after

preset_SZM101_upper_norfair_wave_wave_gate:
    dw #preset_SZM101_upper_norfair_missiles_below_wave ; Upper Norfair: Missiles Below Wave
    dl $7E078D : db $02 : dw $B26C ; DDB
    dl $7E078F : db $02 : dw $0004 ; DoorOut Index
    dl $7E0911 : db $02 : dw $0000 ; Screen X position in pixels
    dl $7E0913 : db $02 : dw $F400 ; Screen subpixel Y position
    dl $7E0915 : db $02 : dw $011C ; Screen Y position in pixels
    dl $7E0917 : db $02 : dw $0000 ; Layer 2 X scroll in room in pixels?
    dl $7E0919 : db $02 : dw $00D5 ; Layer 2 Y scroll in room in pixels? (up = positive)
    dl $7E0923 : db $02 : dw $FD00 ; BG2 Y scroll offset due to room transitions (Translates between Layer 2 scroll and BG2 scroll)
    dl $7E09C2 : db $02 : dw $01C1 ; Health
    dl $7E09C6 : db $02 : dw $0016 ; Missiles
    dl $7E09C8 : db $02 : dw $001E ; Max missiles
    dl $7E09CA : db $02 : dw $0009 ; Supers
    dl $7E09CE : db $02 : dw $0004 ; Pbs
    dl $7E0AF6 : db $02 : dw $004C ; Samus X
    dl $7E0AFA : db $02 : dw $018B ; Samus Y
    dl $7ED872 : db $02 : dw $0181 ; Events, Items, Doors
    dl $7ED91A : db $02 : dw $0057 ; Events, Items, Doors
    dw #$FFFF
.after

preset_SZM101_upper_norfair_super_blockade:
    dw #preset_SZM101_upper_norfair_wave_wave_gate ; Upper Norfair: Wave Wave Gate
    dl $7E078D : db $02 : dw $B254 ; DDB
    dl $7E078F : db $02 : dw $0002 ; DoorOut Index
    dl $7E079B : db $02 : dw $AFCE ; MDB
    dl $7E090F : db $02 : dw $4000 ; Screen subpixel X position.
    dl $7E0913 : db $02 : dw $D3FF ; Screen subpixel Y position
    dl $7E0915 : db $02 : dw $011B ; Screen Y position in pixels
    dl $7E0919 : db $02 : dw $011B ; Layer 2 Y scroll in room in pixels? (up = positive)
    dl $7E0921 : db $02 : dw $0000 ; BG2 X scroll offset due to room transitions (Translates between Layer 2 scroll and BG2 scroll)
    dl $7E0923 : db $02 : dw $00E0 ; BG2 Y scroll offset due to room transitions (Translates between Layer 2 scroll and BG2 scroll)
    dl $7E09C6 : db $02 : dw $001A ; Missiles
    dl $7E09CA : db $02 : dw $000A ; Supers
    dl $7E0AF6 : db $02 : dw $0031 ; Samus X
    dl $7ED91A : db $02 : dw $005B ; Events, Items, Doors
    dw #$FFFF
.after

preset_SZM101_upper_norfair_acid_party:
    dw #preset_SZM101_upper_norfair_super_blockade ; Upper Norfair: Super Blockade
    dl $7E078D : db $02 : dw $B278 ; DDB
    dl $7E078F : db $02 : dw $0005 ; DoorOut Index
    dl $7E090F : db $02 : dw $3000 ; Screen subpixel X position.
    dl $7E0913 : db $02 : dw $4800 ; Screen subpixel Y position
    dl $7E0915 : db $02 : dw $01FC ; Screen Y position in pixels
    dl $7E0919 : db $02 : dw $01FC ; Layer 2 Y scroll in room in pixels? (up = positive)
    dl $7E0921 : db $02 : dw $0100 ; BG2 X scroll offset due to room transitions (Translates between Layer 2 scroll and BG2 scroll)
    dl $7E0923 : db $02 : dw $FF00 ; BG2 Y scroll offset due to room transitions (Translates between Layer 2 scroll and BG2 scroll)
    dl $7E09C2 : db $02 : dw $01B6 ; Health
    dl $7E09C6 : db $02 : dw $0023 ; Missiles
    dl $7E09C8 : db $02 : dw $0023 ; Max missiles
    dl $7E09CA : db $02 : dw $0004 ; Supers
    dl $7E09CE : db $02 : dw $0006 ; Pbs
    dl $7E09D0 : db $02 : dw $0006 ; Max pbs
    dl $7E0A1C : db $02 : dw $0001 ; Samus position/state
    dl $7E0A1E : db $02 : dw $0008 ; More position/state
    dl $7E0AF6 : db $02 : dw $00BA ; Samus X
    dl $7E0AFA : db $02 : dw $028B ; Samus Y
    dl $7ED872 : db $02 : dw $0981 ; Events, Items, Doors
    dl $7ED878 : db $02 : dw $D003 ; Events, Items, Doors
    dl $7ED91A : db $02 : dw $005F ; Events, Items, Doors
    dw #$FFFF
.after

preset_SZM101_upper_norfair_save_room_secret:
    dw #preset_SZM101_upper_norfair_acid_party ; Upper Norfair: Acid Party
    dl $7E078D : db $02 : dw $9606 ; DDB
    dl $7E078F : db $02 : dw $0000 ; DoorOut Index
    dl $7E079B : db $02 : dw $AC2B ; MDB
    dl $7E090F : db $02 : dw $0000 ; Screen subpixel X position.
    dl $7E0913 : db $02 : dw $F400 ; Screen subpixel Y position
    dl $7E0915 : db $02 : dw $00FB ; Screen Y position in pixels
    dl $7E0919 : db $02 : dw $00FB ; Layer 2 Y scroll in room in pixels? (up = positive)
    dl $7E0921 : db $02 : dw $FF00 ; BG2 X scroll offset due to room transitions (Translates between Layer 2 scroll and BG2 scroll)
    dl $7E0923 : db $02 : dw $FD00 ; BG2 Y scroll offset due to room transitions (Translates between Layer 2 scroll and BG2 scroll)
    dl $7E09C2 : db $02 : dw $0141 ; Health
    dl $7E09C6 : db $02 : dw $0028 ; Missiles
    dl $7E09C8 : db $02 : dw $0028 ; Max missiles
    dl $7E09CA : db $02 : dw $0008 ; Supers
    dl $7E09CE : db $02 : dw $0004 ; Pbs
    dl $7E0AF6 : db $02 : dw $00C4 ; Samus X
    dl $7E0AFA : db $02 : dw $018B ; Samus Y
    dl $7ED874 : db $02 : dw $4100 ; Events, Items, Doors
    dl $7ED91A : db $02 : dw $0061 ; Events, Items, Doors
    dw #$FFFF
.after

preset_SZM101_upper_norfair_reserve_tank_spark:
    dw #preset_SZM101_upper_norfair_save_room_secret ; Upper Norfair: Save Room Secret
    dl $7E078D : db $02 : dw $BDC8 ; DDB
    dl $7E078F : db $02 : dw $0001 ; DoorOut Index
    dl $7E079B : db $02 : dw $891D ; MDB
    dl $7E07C3 : db $02 : dw $A5AA ; GFX Pointers
    dl $7E07C5 : db $02 : dw $47BC ; GFX Pointers
    dl $7E07C7 : db $02 : dw $C2B4 ; GFX Pointers
    dl $7E07F5 : db $02 : dw $0003 ; Music Track
    dl $7E0911 : db $02 : dw $013B ; Screen X position in pixels
    dl $7E0913 : db $02 : dw $83FE ; Screen subpixel Y position
    dl $7E0915 : db $02 : dw $0098 ; Screen Y position in pixels
    dl $7E0917 : db $02 : dw $013B ; Layer 2 X scroll in room in pixels?
    dl $7E0919 : db $02 : dw $0098 ; Layer 2 Y scroll in room in pixels? (up = positive)
    dl $7E0921 : db $02 : dw $0000 ; BG2 X scroll offset due to room transitions (Translates between Layer 2 scroll and BG2 scroll)
    dl $7E0923 : db $02 : dw $0000 ; BG2 Y scroll offset due to room transitions (Translates between Layer 2 scroll and BG2 scroll)
    dl $7E0A1C : db $02 : dw $0027 ; Samus position/state
    dl $7E0A1E : db $02 : dw $0508 ; More position/state
    dl $7E0AF6 : db $02 : dw $019B ; Samus X
    dl $7E0AFA : db $02 : dw $0110 ; Samus Y
    dw #$FFFF
.after

preset_SZM101_lower_norfair_elevator_entry:
    dw #preset_SZM101_upper_norfair_reserve_tank_spark ; Upper Norfair: Reserve Tank Spark
    dl $7E078D : db $02 : dw $BCFC ; DDB
    dl $7E078F : db $02 : dw $0002 ; DoorOut Index
    dl $7E090F : db $02 : dw $7000 ; Screen subpixel X position.
    dl $7E0911 : db $02 : dw $0000 ; Screen X position in pixels
    dl $7E0913 : db $02 : dw $3C00 ; Screen subpixel Y position
    dl $7E0915 : db $02 : dw $0100 ; Screen Y position in pixels
    dl $7E0917 : db $02 : dw $0000 ; Layer 2 X scroll in room in pixels?
    dl $7E0919 : db $02 : dw $0100 ; Layer 2 Y scroll in room in pixels? (up = positive)
    dl $7E0921 : db $02 : dw $FE00 ; BG2 X scroll offset due to room transitions (Translates between Layer 2 scroll and BG2 scroll)
    dl $7E0923 : db $02 : dw $00E0 ; BG2 Y scroll offset due to room transitions (Translates between Layer 2 scroll and BG2 scroll)
    dl $7E09D4 : db $02 : dw $00C8 ; Max reserves
    dl $7E0A1C : db $02 : dw $0002 ; Samus position/state
    dl $7E0A1E : db $02 : dw $0004 ; More position/state
    dl $7E0AF6 : db $02 : dw $007F ; Samus X
    dl $7E0AFA : db $02 : dw $018B ; Samus Y
    dl $7ED87E : db $02 : dw $5000 ; Events, Items, Doors
    dl $7ED91A : db $02 : dw $0062 ; Events, Items, Doors
    dw #$FFFF
.after

preset_SZM101_lower_norfair_save_room_short_charge:
    dw #preset_SZM101_lower_norfair_elevator_entry ; Lower Norfair: Elevator Entry
    dl $7E078D : db $02 : dw $B20C ; DDB
    dl $7E078F : db $02 : dw $0003 ; DoorOut Index
    dl $7E079B : db $02 : dw $B236 ; MDB
    dl $7E07C3 : db $02 : dw $C3F9 ; GFX Pointers
    dl $7E07C5 : db $02 : dw $E4BD ; GFX Pointers
    dl $7E07C7 : db $02 : dw $C2B5 ; GFX Pointers
    dl $7E07F3 : db $02 : dw $0018 ; Music Bank
    dl $7E07F5 : db $02 : dw $0005 ; Music Track
    dl $7E090F : db $02 : dw $5000 ; Screen subpixel X position.
    dl $7E0913 : db $02 : dw $0000 ; Screen subpixel Y position
    dl $7E0915 : db $02 : dw $011D ; Screen Y position in pixels
    dl $7E0919 : db $02 : dw $011D ; Layer 2 Y scroll in room in pixels? (up = positive)
    dl $7E0921 : db $02 : dw $FC00 ; BG2 X scroll offset due to room transitions (Translates between Layer 2 scroll and BG2 scroll)
    dl $7E09C2 : db $02 : dw $010F ; Health
    dl $7E09CA : db $02 : dw $0007 ; Supers
    dl $7E09CE : db $02 : dw $0006 ; Pbs
    dl $7E0AF6 : db $02 : dw $0051 ; Samus X
    dl $7ED8C6 : db $02 : dw $41E0 ; Events, Items, Doors
    dw #$FFFF
.after

preset_SZM101_lower_norfair_reverse_long_spark:
    dw #preset_SZM101_lower_norfair_save_room_short_charge ; Lower Norfair: Save Room Short Charge
    dl $7E078D : db $02 : dw $991E ; DDB
    dl $7E078F : db $02 : dw $0000 ; DoorOut Index
    dl $7E079B : db $02 : dw $B051 ; MDB
    dl $7E090F : db $02 : dw $7FFF ; Screen subpixel X position.
    dl $7E0913 : db $02 : dw $4C00 ; Screen subpixel Y position
    dl $7E0915 : db $02 : dw $001C ; Screen Y position in pixels
    dl $7E0919 : db $02 : dw $0015 ; Layer 2 Y scroll in room in pixels? (up = positive)
    dl $7E0921 : db $02 : dw $0100 ; BG2 X scroll offset due to room transitions (Translates between Layer 2 scroll and BG2 scroll)
    dl $7E0923 : db $02 : dw $0000 ; BG2 Y scroll offset due to room transitions (Translates between Layer 2 scroll and BG2 scroll)
    dl $7E09C2 : db $02 : dw $01EC ; Health
    dl $7E09C4 : db $02 : dw $01F3 ; Max health
    dl $7E09C6 : db $02 : dw $0029 ; Missiles
    dl $7E09C8 : db $02 : dw $002D ; Max missiles
    dl $7E09CA : db $02 : dw $000B ; Supers
    dl $7E09CC : db $02 : dw $000C ; Max supers
    dl $7E09CE : db $02 : dw $0005 ; Pbs
    dl $7E0A1C : db $02 : dw $0001 ; Samus position/state
    dl $7E0A1E : db $02 : dw $0008 ; More position/state
    dl $7E0AF6 : db $02 : dw $00D2 ; Samus X
    dl $7E0AFA : db $02 : dw $008B ; Samus Y
    dl $7ED872 : db $02 : dw $4981 ; Events, Items, Doors
    dl $7ED878 : db $02 : dw $D00B ; Events, Items, Doors
    dl $7ED87E : db $02 : dw $5004 ; Events, Items, Doors
    dl $7ED91A : db $02 : dw $0066 ; Events, Items, Doors
    dw #$FFFF
.after

preset_SZM101_lower_norfair_tight_short_charge:
    dw #preset_SZM101_lower_norfair_reverse_long_spark ; Lower Norfair: Reverse Long Spark
    dl $7E078D : db $02 : dw $B290 ; DDB
    dl $7E078F : db $02 : dw $0002 ; DoorOut Index
    dl $7E079B : db $02 : dw $B4AD ; MDB
    dl $7E090F : db $02 : dw $F000 ; Screen subpixel X position.
    dl $7E0913 : db $02 : dw $0000 ; Screen subpixel Y position
    dl $7E0915 : db $02 : dw $011D ; Screen Y position in pixels
    dl $7E0919 : db $02 : dw $00D5 ; Layer 2 Y scroll in room in pixels? (up = positive)
    dl $7E0921 : db $02 : dw $0000 ; BG2 X scroll offset due to room transitions (Translates between Layer 2 scroll and BG2 scroll)
    dl $7E0923 : db $02 : dw $00E0 ; BG2 Y scroll offset due to room transitions (Translates between Layer 2 scroll and BG2 scroll)
    dl $7E09C2 : db $02 : dw $01F3 ; Health
    dl $7E09C6 : db $02 : dw $0021 ; Missiles
    dl $7E09CA : db $02 : dw $000C ; Supers
    dl $7E09D0 : db $02 : dw $0008 ; Max pbs
    dl $7E09D6 : db $02 : dw $007B ; Reserves
    dl $7E0A1C : db $02 : dw $0002 ; Samus position/state
    dl $7E0A1E : db $02 : dw $0004 ; More position/state
    dl $7E0AF6 : db $02 : dw $0025 ; Samus X
    dl $7E0AFA : db $02 : dw $018B ; Samus Y
    dl $7ED87A : db $02 : dw $0022 ; Events, Items, Doors
    dl $7ED91A : db $02 : dw $0067 ; Events, Items, Doors
    dw #$FFFF
.after

preset_SZM101_lower_norfair_crumble_bridge_supers:
    dw #preset_SZM101_lower_norfair_tight_short_charge ; Lower Norfair: Tight Short Charge
    dl $7E078D : db $02 : dw $BD8C ; DDB
    dl $7E078F : db $02 : dw $0000 ; DoorOut Index
    dl $7E090F : db $02 : dw $FFFF ; Screen subpixel X position.
    dl $7E0913 : db $02 : dw $3800 ; Screen subpixel Y position
    dl $7E0915 : db $02 : dw $0600 ; Screen Y position in pixels
    dl $7E0919 : db $02 : dw $0480 ; Layer 2 Y scroll in room in pixels? (up = positive)
    dl $7E0921 : db $02 : dw $FF00 ; BG2 X scroll offset due to room transitions (Translates between Layer 2 scroll and BG2 scroll)
    dl $7E0923 : db $02 : dw $FD00 ; BG2 Y scroll offset due to room transitions (Translates between Layer 2 scroll and BG2 scroll)
    dl $7E09C2 : db $02 : dw $0190 ; Health
    dl $7E09C6 : db $02 : dw $002A ; Missiles
    dl $7E09C8 : db $02 : dw $0037 ; Max missiles
    dl $7E09CE : db $02 : dw $0008 ; Pbs
    dl $7E09D6 : db $02 : dw $0099 ; Reserves
    dl $7E0A1C : db $02 : dw $0001 ; Samus position/state
    dl $7E0A1E : db $02 : dw $0008 ; More position/state
    dl $7E0AF6 : db $02 : dw $00DB ; Samus X
    dl $7E0AFA : db $02 : dw $068B ; Samus Y
    dl $7ED872 : db $02 : dw $6981 ; Events, Items, Doors
    dl $7ED874 : db $02 : dw $4102 ; Events, Items, Doors
    dl $7ED91A : db $02 : dw $006B ; Events, Items, Doors
    dw #$FFFF
.after

preset_SZM101_lower_norfair_firefleas:
    dw #preset_SZM101_lower_norfair_crumble_bridge_supers ; Lower Norfair: Crumble Bridge Supers
    dl $7E078D : db $02 : dw $9336 ; DDB
    dl $7E078F : db $02 : dw $0003 ; DoorOut Index
    dl $7E079B : db $02 : dw $B4E5 ; MDB
    dl $7E090F : db $02 : dw $C000 ; Screen subpixel X position.
    dl $7E0913 : db $02 : dw $C3FE ; Screen subpixel Y position
    dl $7E0915 : db $02 : dw $0017 ; Screen Y position in pixels
    dl $7E0919 : db $02 : dw $0011 ; Layer 2 Y scroll in room in pixels? (up = positive)
    dl $7E0921 : db $02 : dw $FA00 ; BG2 X scroll offset due to room transitions (Translates between Layer 2 scroll and BG2 scroll)
    dl $7E09C2 : db $02 : dw $00FA ; Health
    dl $7E09C6 : db $02 : dw $0027 ; Missiles
    dl $7E09CA : db $02 : dw $000D ; Supers
    dl $7E09CC : db $02 : dw $000E ; Max supers
    dl $7E0A1C : db $02 : dw $0002 ; Samus position/state
    dl $7E0A1E : db $02 : dw $0004 ; More position/state
    dl $7E0AF6 : db $02 : dw $0089 ; Samus X
    dl $7E0AFA : db $02 : dw $008B ; Samus Y
    dl $7ED878 : db $02 : dw $D02B ; Events, Items, Doors
    dl $7ED91A : db $02 : dw $006F ; Events, Items, Doors
    dw #$FFFF
.after

preset_SZM101_lower_norfair_spikey_mistep:
    dw #preset_SZM101_lower_norfair_firefleas ; Lower Norfair: FireFleas
    dl $7E078D : db $02 : dw $99D2 ; DDB
    dl $7E078F : db $02 : dw $0000 ; DoorOut Index
    dl $7E079B : db $02 : dw $B3A5 ; MDB
    dl $7E090F : db $02 : dw $8D40 ; Screen subpixel X position.
    dl $7E0913 : db $02 : dw $0000 ; Screen subpixel Y position
    dl $7E0915 : db $02 : dw $0100 ; Screen Y position in pixels
    dl $7E0919 : db $02 : dw $00C0 ; Layer 2 Y scroll in room in pixels? (up = positive)
    dl $7E0921 : db $02 : dw $FF00 ; BG2 X scroll offset due to room transitions (Translates between Layer 2 scroll and BG2 scroll)
    dl $7E0923 : db $02 : dw $FF00 ; BG2 Y scroll offset due to room transitions (Translates between Layer 2 scroll and BG2 scroll)
    dl $7E09C2 : db $02 : dw $0225 ; Health
    dl $7E09C4 : db $02 : dw $0225 ; Max health
    dl $7E09CA : db $02 : dw $000C ; Supers
    dl $7E0AF6 : db $02 : dw $0025 ; Samus X
    dl $7E0AFA : db $02 : dw $018B ; Samus Y
    dl $7ED87E : db $02 : dw $5006 ; Events, Items, Doors
    dl $7ED8C6 : db $02 : dw $43E0 ; Events, Items, Doors
    dl $7ED91A : db $02 : dw $0070 ; Events, Items, Doors
    dw #$FFFF
.after

preset_SZM101_lower_norfair_fallen_hero_super:
    dw #preset_SZM101_lower_norfair_spikey_mistep ; Lower Norfair: Spikey Mistep
    dl $7E078D : db $02 : dw $9906 ; DDB
    dl $7E078F : db $02 : dw $0003 ; DoorOut Index
    dl $7E079B : db $02 : dw $B585 ; MDB
    dl $7E090F : db $02 : dw $2000 ; Screen subpixel X position.
    dl $7E0911 : db $02 : dw $0200 ; Screen X position in pixels
    dl $7E0915 : db $02 : dw $00B9 ; Screen Y position in pixels
    dl $7E0917 : db $02 : dw $0200 ; Layer 2 X scroll in room in pixels?
    dl $7E0919 : db $02 : dw $00B9 ; Layer 2 Y scroll in room in pixels? (up = positive)
    dl $7E0921 : db $02 : dw $FD00 ; BG2 X scroll offset due to room transitions (Translates between Layer 2 scroll and BG2 scroll)
    dl $7E0923 : db $02 : dw $0000 ; BG2 Y scroll offset due to room transitions (Translates between Layer 2 scroll and BG2 scroll)
    dl $7E09C2 : db $02 : dw $01B7 ; Health
    dl $7E09C6 : db $02 : dw $001F ; Missiles
    dl $7E09C8 : db $02 : dw $003C ; Max missiles
    dl $7E09CA : db $02 : dw $000B ; Supers
    dl $7E09CE : db $02 : dw $0007 ; Pbs
    dl $7E0A1C : db $02 : dw $0001 ; Samus position/state
    dl $7E0A1E : db $02 : dw $0008 ; More position/state
    dl $7E0AF6 : db $02 : dw $02DB ; Samus X
    dl $7E0AFA : db $02 : dw $012B ; Samus Y
    dl $7ED874 : db $02 : dw $4103 ; Events, Items, Doors
    dl $7ED91A : db $02 : dw $0075 ; Events, Items, Doors
    dw #$FFFF
.after

preset_SZM101_lower_norfair_morph_maze_pipes:
    dw #preset_SZM101_lower_norfair_fallen_hero_super ; Lower Norfair: Fallen Hero Super
    dl $7E078D : db $02 : dw $9A0E ; DDB
    dl $7E079B : db $02 : dw $B3A5 ; MDB
    dl $7E090F : db $02 : dw $4000 ; Screen subpixel X position.
    dl $7E0911 : db $02 : dw $0000 ; Screen X position in pixels
    dl $7E0913 : db $02 : dw $B400 ; Screen subpixel Y position
    dl $7E0915 : db $02 : dw $0600 ; Screen Y position in pixels
    dl $7E0917 : db $02 : dw $0000 ; Layer 2 X scroll in room in pixels?
    dl $7E0919 : db $02 : dw $0480 ; Layer 2 Y scroll in room in pixels? (up = positive)
    dl $7E0921 : db $02 : dw $0100 ; BG2 X scroll offset due to room transitions (Translates between Layer 2 scroll and BG2 scroll)
    dl $7E0923 : db $02 : dw $FA00 ; BG2 Y scroll offset due to room transitions (Translates between Layer 2 scroll and BG2 scroll)
    dl $7E09C2 : db $02 : dw $0199 ; Health
    dl $7E09CA : db $02 : dw $0006 ; Supers
    dl $7E0A1C : db $02 : dw $007A ; Samus position/state
    dl $7E0A1E : db $02 : dw $1104 ; More position/state
    dl $7E0AF6 : db $02 : dw $0023 ; Samus X
    dl $7E0AFA : db $02 : dw $06B9 ; Samus Y
    dl $7ED91A : db $02 : dw $0079 ; Events, Items, Doors
    dw #$FFFF
.after

preset_SZM101_lower_norfair_build_your_speedway:
    dw #preset_SZM101_lower_norfair_morph_maze_pipes ; Lower Norfair: morph maze pipes
    dl $7E078D : db $02 : dw $9966 ; DDB
    dl $7E078F : db $02 : dw $0001 ; DoorOut Index
    dl $7E079B : db $02 : dw $AAB5 ; MDB
    dl $7E07C3 : db $02 : dw $860B ; GFX Pointers
    dl $7E07C5 : db $02 : dw $21C0 ; GFX Pointers
    dl $7E07C7 : db $02 : dw $C2C0 ; GFX Pointers
    dl $7E090F : db $02 : dw $C53F ; Screen subpixel X position.
    dl $7E0913 : db $02 : dw $0000 ; Screen subpixel Y position
    dl $7E0915 : db $02 : dw $0000 ; Screen Y position in pixels
    dl $7E0919 : db $02 : dw $0000 ; Layer 2 Y scroll in room in pixels? (up = positive)
    dl $7E0923 : db $02 : dw $0000 ; BG2 Y scroll offset due to room transitions (Translates between Layer 2 scroll and BG2 scroll)
    dl $7E09C2 : db $02 : dw $0167 ; Health
    dl $7E09C6 : db $02 : dw $001C ; Missiles
    dl $7E09C8 : db $02 : dw $0041 ; Max missiles
    dl $7E09CA : db $02 : dw $0007 ; Supers
    dl $7E09CC : db $02 : dw $0010 ; Max supers
    dl $7E09CE : db $02 : dw $0006 ; Pbs
    dl $7E0A1C : db $02 : dw $0001 ; Samus position/state
    dl $7E0A1E : db $02 : dw $0008 ; More position/state
    dl $7E0AF6 : db $02 : dw $002F ; Samus X
    dl $7E0AFA : db $02 : dw $008B ; Samus Y
    dl $7ED872 : db $02 : dw $E981 ; Events, Items, Doors
    dl $7ED878 : db $02 : dw $D03B ; Events, Items, Doors
    dl $7ED91A : db $02 : dw $007C ; Events, Items, Doors
    dw #$FFFF
.after

preset_SZM101_lower_norfair_monster_elevator:
    dw #preset_SZM101_lower_norfair_build_your_speedway ; Lower Norfair: Build Your Speedway
    dl $7E078D : db $02 : dw $9A86 ; DDB
    dl $7E078F : db $02 : dw $0002 ; DoorOut Index
    dl $7E079B : db $02 : dw $B5D5 ; MDB
    dl $7E07C3 : db $02 : dw $C3F9 ; GFX Pointers
    dl $7E07C5 : db $02 : dw $E4BD ; GFX Pointers
    dl $7E07C7 : db $02 : dw $C2B5 ; GFX Pointers
    dl $7E090F : db $02 : dw $DC00 ; Screen subpixel X position.
    dl $7E0911 : db $02 : dw $0400 ; Screen X position in pixels
    dl $7E0913 : db $02 : dw $1C00 ; Screen subpixel Y position
    dl $7E0917 : db $02 : dw $0400 ; Layer 2 X scroll in room in pixels?
    dl $7E0921 : db $02 : dw $FA00 ; BG2 X scroll offset due to room transitions (Translates between Layer 2 scroll and BG2 scroll)
    dl $7E0923 : db $02 : dw $FD00 ; BG2 Y scroll offset due to room transitions (Translates between Layer 2 scroll and BG2 scroll)
    dl $7E09C2 : db $02 : dw $0225 ; Health
    dl $7E09C4 : db $02 : dw $0257 ; Max health
    dl $7E09C6 : db $02 : dw $001B ; Missiles
    dl $7E09CA : db $02 : dw $0009 ; Supers
    dl $7E0A1C : db $02 : dw $0002 ; Samus position/state
    dl $7E0A1E : db $02 : dw $0004 ; More position/state
    dl $7E0AF6 : db $02 : dw $0456 ; Samus X
    dl $7ED842 : db $02 : dw $0100 ; Events, Items, Doors
    dl $7ED844 : db $02 : dw $0100 ; Events, Items, Doors
    dl $7ED87E : db $02 : dw $500E ; Events, Items, Doors
    dl $7ED8C6 : db $02 : dw $43E4 ; Events, Items, Doors
    dl $7ED91A : db $02 : dw $007F ; Events, Items, Doors
    dw #$FFFF
.after

preset_SZM101_lower_norfair_goldbat_spark:
    dw #preset_SZM101_lower_norfair_monster_elevator ; Lower Norfair: Monster Elevator
    dl $7E078D : db $02 : dw $B35C ; DDB
    dl $7E078F : db $02 : dw $0001 ; DoorOut Index
    dl $7E079B : db $02 : dw $B656 ; MDB
    dl $7E090F : db $02 : dw $AFFF ; Screen subpixel X position.
    dl $7E0911 : db $02 : dw $0200 ; Screen X position in pixels
    dl $7E0913 : db $02 : dw $2000 ; Screen subpixel Y position
    dl $7E0915 : db $02 : dw $0700 ; Screen Y position in pixels
    dl $7E0917 : db $02 : dw $0200 ; Layer 2 X scroll in room in pixels?
    dl $7E0919 : db $02 : dw $0700 ; Layer 2 Y scroll in room in pixels? (up = positive)
    dl $7E0921 : db $02 : dw $FD00 ; BG2 X scroll offset due to room transitions (Translates between Layer 2 scroll and BG2 scroll)
    dl $7E0923 : db $02 : dw $FB00 ; BG2 Y scroll offset due to room transitions (Translates between Layer 2 scroll and BG2 scroll)
    dl $7E09CE : db $02 : dw $0005 ; Pbs
    dl $7E0AF6 : db $02 : dw $02C5 ; Samus X
    dl $7E0AFA : db $02 : dw $078B ; Samus Y
    dl $7ED91A : db $02 : dw $0080 ; Events, Items, Doors
    dw #$FFFF
.after

preset_SZM101_lower_norfair_awful_chain_spark:
    dw #preset_SZM101_lower_norfair_goldbat_spark ; Lower Norfair: Goldbat Spark
    dl $7E078D : db $02 : dw $9AAA ; DDB
    dl $7E078F : db $02 : dw $0002 ; DoorOut Index
    dl $7E079B : db $02 : dw $B5D5 ; MDB
    dl $7E090F : db $02 : dw $A000 ; Screen subpixel X position.
    dl $7E0911 : db $02 : dw $0800 ; Screen X position in pixels
    dl $7E0913 : db $02 : dw $B400 ; Screen subpixel Y position
    dl $7E0915 : db $02 : dw $0000 ; Screen Y position in pixels
    dl $7E0917 : db $02 : dw $0800 ; Layer 2 X scroll in room in pixels?
    dl $7E0919 : db $02 : dw $0000 ; Layer 2 Y scroll in room in pixels? (up = positive)
    dl $7E0921 : db $02 : dw $F800 ; BG2 X scroll offset due to room transitions (Translates between Layer 2 scroll and BG2 scroll)
    dl $7E0923 : db $02 : dw $00E0 ; BG2 Y scroll offset due to room transitions (Translates between Layer 2 scroll and BG2 scroll)
    dl $7E09C2 : db $02 : dw $01C1 ; Health
    dl $7E09C6 : db $02 : dw $0020 ; Missiles
    dl $7E09C8 : db $02 : dw $0046 ; Max missiles
    dl $7E09CA : db $02 : dw $000A ; Supers
    dl $7E09CE : db $02 : dw $0006 ; Pbs
    dl $7E09D0 : db $02 : dw $000A ; Max pbs
    dl $7E0A1C : db $02 : dw $0001 ; Samus position/state
    dl $7E0A1E : db $02 : dw $0008 ; More position/state
    dl $7E0AF6 : db $02 : dw $08D4 ; Samus X
    dl $7E0AFA : db $02 : dw $008B ; Samus Y
    dl $7ED874 : db $02 : dw $4107 ; Events, Items, Doors
    dl $7ED87A : db $02 : dw $0026 ; Events, Items, Doors
    dl $7ED91A : db $02 : dw $0088 ; Events, Items, Doors
    dw #$FFFF
.after

preset_SZM101_lower_norfair_chain_spark_puzzle:
    dw #preset_SZM101_lower_norfair_awful_chain_spark ; Lower Norfair: Awful Chain Spark
    dl $7E078D : db $02 : dw $B374 ; DDB
    dl $7E078F : db $02 : dw $0003 ; DoorOut Index
    dl $7E079B : db $02 : dw $B6EE ; MDB
    dl $7E090F : db $02 : dw $0F00 ; Screen subpixel X position.
    dl $7E0911 : db $02 : dw $0200 ; Screen X position in pixels
    dl $7E0913 : db $02 : dw $B800 ; Screen subpixel Y position
    dl $7E0915 : db $02 : dw $0700 ; Screen Y position in pixels
    dl $7E0917 : db $02 : dw $0200 ; Layer 2 X scroll in room in pixels?
    dl $7E0919 : db $02 : dw $0700 ; Layer 2 Y scroll in room in pixels? (up = positive)
    dl $7E0921 : db $02 : dw $0100 ; BG2 X scroll offset due to room transitions (Translates between Layer 2 scroll and BG2 scroll)
    dl $7E0923 : db $02 : dw $FA00 ; BG2 Y scroll offset due to room transitions (Translates between Layer 2 scroll and BG2 scroll)
    dl $7E09C2 : db $02 : dw $01E4 ; Health
    dl $7E09C6 : db $02 : dw $001B ; Missiles
    dl $7E09CA : db $02 : dw $0008 ; Supers
    dl $7E0AF6 : db $02 : dw $02DB ; Samus X
    dl $7E0AFA : db $02 : dw $078B ; Samus Y
    dw #$FFFF
.after

preset_SZM101_lower_norfair_leaving_spark_puzzle:
    dw #preset_SZM101_lower_norfair_chain_spark_puzzle ; Lower Norfair: Chain Spark Puzzle
    dl $7E078D : db $02 : dw $B2FC ; DDB
    dl $7E078F : db $02 : dw $0005 ; DoorOut Index
    dl $7E079B : db $02 : dw $A618 ; MDB
    dl $7E090F : db $02 : dw $7800 ; Screen subpixel X position.
    dl $7E0911 : db $02 : dw $0000 ; Screen X position in pixels
    dl $7E0913 : db $02 : dw $0400 ; Screen subpixel Y position
    dl $7E0915 : db $02 : dw $0000 ; Screen Y position in pixels
    dl $7E0917 : db $02 : dw $0000 ; Layer 2 X scroll in room in pixels?
    dl $7E0919 : db $02 : dw $0000 ; Layer 2 Y scroll in room in pixels? (up = positive)
    dl $7E0923 : db $02 : dw $FE00 ; BG2 Y scroll offset due to room transitions (Translates between Layer 2 scroll and BG2 scroll)
    dl $7E09C6 : db $02 : dw $0020 ; Missiles
    dl $7E09C8 : db $02 : dw $004B ; Max missiles
    dl $7E09CA : db $02 : dw $000A ; Supers
    dl $7E09CC : db $02 : dw $0012 ; Max supers
    dl $7E0A1C : db $02 : dw $0002 ; Samus position/state
    dl $7E0A1E : db $02 : dw $0004 ; More position/state
    dl $7E0AF6 : db $02 : dw $0040 ; Samus X
    dl $7E0AFA : db $02 : dw $00BB ; Samus Y
    dl $7ED872 : db $02 : dw $E9A1 ; Events, Items, Doors
    dl $7ED876 : db $02 : dw $A200 ; Events, Items, Doors
    dl $7ED91A : db $02 : dw $008A ; Events, Items, Doors
    dw #$FFFF
.after

preset_SZM101_lower_norfair_screw_attack:
    dw #preset_SZM101_lower_norfair_leaving_spark_puzzle ; Lower Norfair: Leaving Spark Puzzle
    dl $7E078D : db $02 : dw $99AE ; DDB
    dl $7E078F : db $02 : dw $0000 ; DoorOut Index
    dl $7E079B : db $02 : dw $B656 ; MDB
    dl $7E090F : db $02 : dw $2801 ; Screen subpixel X position.
    dl $7E0911 : db $02 : dw $0200 ; Screen X position in pixels
    dl $7E0913 : db $02 : dw $0000 ; Screen subpixel Y position
    dl $7E0915 : db $02 : dw $007C ; Screen Y position in pixels
    dl $7E0917 : db $02 : dw $0200 ; Layer 2 X scroll in room in pixels?
    dl $7E0919 : db $02 : dw $007C ; Layer 2 Y scroll in room in pixels? (up = positive)
    dl $7E0921 : db $02 : dw $FD00 ; BG2 X scroll offset due to room transitions (Translates between Layer 2 scroll and BG2 scroll)
    dl $7E0923 : db $02 : dw $0000 ; BG2 Y scroll offset due to room transitions (Translates between Layer 2 scroll and BG2 scroll)
    dl $7E09C2 : db $02 : dw $01EE ; Health
    dl $7E09C6 : db $02 : dw $001F ; Missiles
    dl $7E09CA : db $02 : dw $0008 ; Supers
    dl $7E0AF6 : db $02 : dw $0225 ; Samus X
    dl $7E0AFA : db $02 : dw $00EB ; Samus Y
    dl $7ED8C4 : db $02 : dw $B150 ; Events, Items, Doors
    dl $7ED91A : db $02 : dw $008C ; Events, Items, Doors
    dw #$FFFF
.after

preset_SZM101_lower_norfair_chain_spark_out_of_ln:
    dw #preset_SZM101_lower_norfair_screw_attack ; Lower Norfair: Screw Attack
    dl $7E078D : db $02 : dw $B398 ; DDB
    dl $7E078F : db $02 : dw $0001 ; DoorOut Index
    dl $7E079B : db $02 : dw $B510 ; MDB
    dl $7E090F : db $02 : dw $0000 ; Screen subpixel X position.
    dl $7E0911 : db $02 : dw $03CE ; Screen X position in pixels
    dl $7E0913 : db $02 : dw $9000 ; Screen subpixel Y position
    dl $7E0915 : db $02 : dw $0011 ; Screen Y position in pixels
    dl $7E0917 : db $02 : dw $03CE ; Layer 2 X scroll in room in pixels?
    dl $7E0919 : db $02 : dw $0011 ; Layer 2 Y scroll in room in pixels? (up = positive)
    dl $7E0921 : db $02 : dw $0100 ; BG2 X scroll offset due to room transitions (Translates between Layer 2 scroll and BG2 scroll)
    dl $7E09CE : db $02 : dw $0007 ; Pbs
    dl $7E09D0 : db $02 : dw $000C ; Max pbs
    dl $7E0A1C : db $02 : dw $0001 ; Samus position/state
    dl $7E0A1E : db $02 : dw $0008 ; More position/state
    dl $7E0AF6 : db $02 : dw $042E ; Samus X
    dl $7E0AFA : db $02 : dw $0093 ; Samus Y
    dl $7ED87A : db $02 : dw $00A6 ; Events, Items, Doors
    dl $7ED880 : db $02 : dw $C3F3 ; Events, Items, Doors
    dl $7ED91A : db $02 : dw $008F ; Events, Items, Doors
    dw #$FFFF
.after

preset_SZM101_cleanup_1_caterpiller_short_charge:
    dw #preset_SZM101_lower_norfair_chain_spark_out_of_ln ; Lower Norfair: Chain Spark Out Of LN
    dl $7E078D : db $02 : dw $986A ; DDB
    dl $7E078F : db $02 : dw $0002 ; DoorOut Index
    dl $7E079B : db $02 : dw $891D ; MDB
    dl $7E07C3 : db $02 : dw $A5AA ; GFX Pointers
    dl $7E07C5 : db $02 : dw $47BC ; GFX Pointers
    dl $7E07C7 : db $02 : dw $C2B4 ; GFX Pointers
    dl $7E07F5 : db $02 : dw $0003 ; Music Track
    dl $7E090F : db $02 : dw $1000 ; Screen subpixel X position.
    dl $7E0911 : db $02 : dw $0000 ; Screen X position in pixels
    dl $7E0913 : db $02 : dw $C000 ; Screen subpixel Y position
    dl $7E0915 : db $02 : dw $0100 ; Screen Y position in pixels
    dl $7E0917 : db $02 : dw $0000 ; Layer 2 X scroll in room in pixels?
    dl $7E0919 : db $02 : dw $0100 ; Layer 2 Y scroll in room in pixels? (up = positive)
    dl $7E0921 : db $02 : dw $0000 ; BG2 X scroll offset due to room transitions (Translates between Layer 2 scroll and BG2 scroll)
    dl $7E0923 : db $02 : dw $FE00 ; BG2 Y scroll offset due to room transitions (Translates between Layer 2 scroll and BG2 scroll)
    dl $7E09C2 : db $02 : dw $01DA ; Health
    dl $7E09C6 : db $02 : dw $0036 ; Missiles
    dl $7E09CA : db $02 : dw $000F ; Supers
    dl $7E09CE : db $02 : dw $0009 ; Pbs
    dl $7E0A1C : db $02 : dw $0002 ; Samus position/state
    dl $7E0A1E : db $02 : dw $0004 ; More position/state
    dl $7E0AF6 : db $02 : dw $007A ; Samus X
    dl $7E0AFA : db $02 : dw $018B ; Samus Y
    dw #$FFFF
.after

preset_SZM101_cleanup_1_solid_cacatacs:
    dw #preset_SZM101_cleanup_1_caterpiller_short_charge ; Cleanup 1: Caterpiller Short Charge
    dl $7E078D : db $02 : dw $B224 ; DDB
    dl $7E078F : db $02 : dw $0003 ; DoorOut Index
    dl $7E079B : db $02 : dw $B106 ; MDB
    dl $7E07C3 : db $02 : dw $C3F9 ; GFX Pointers
    dl $7E07C5 : db $02 : dw $E4BD ; GFX Pointers
    dl $7E07C7 : db $02 : dw $C2B5 ; GFX Pointers
    dl $7E07F3 : db $02 : dw $0015 ; Music Bank
    dl $7E07F5 : db $02 : dw $0005 ; Music Track
    dl $7E090F : db $02 : dw $8000 ; Screen subpixel X position.
    dl $7E0911 : db $02 : dw $0028 ; Screen X position in pixels
    dl $7E0913 : db $02 : dw $2400 ; Screen subpixel Y position
    dl $7E0915 : db $02 : dw $0000 ; Screen Y position in pixels
    dl $7E0917 : db $02 : dw $0028 ; Layer 2 X scroll in room in pixels?
    dl $7E0919 : db $02 : dw $0000 ; Layer 2 Y scroll in room in pixels? (up = positive)
    dl $7E0921 : db $02 : dw $F800 ; BG2 X scroll offset due to room transitions (Translates between Layer 2 scroll and BG2 scroll)
    dl $7E0923 : db $02 : dw $0000 ; BG2 Y scroll offset due to room transitions (Translates between Layer 2 scroll and BG2 scroll)
    dl $7E09C2 : db $02 : dw $0275 ; Health
    dl $7E09C4 : db $02 : dw $0289 ; Max health
    dl $7E0AF6 : db $02 : dw $00A0 ; Samus X
    dl $7E0AFA : db $02 : dw $007B ; Samus Y
    dl $7ED87E : db $02 : dw $500F ; Events, Items, Doors
    dl $7ED91A : db $02 : dw $00A2 ; Events, Items, Doors
    dw #$FFFF
.after

preset_SZM101_cleanup_1_spikesuit_hallway:
    dw #preset_SZM101_cleanup_1_solid_cacatacs ; Cleanup 1: Solid Cacatacs
    dl $7E078D : db $02 : dw $B1DC ; DDB
    dl $7E078F : db $02 : dw $0000 ; DoorOut Index
    dl $7E079B : db $02 : dw $AEDF ; MDB
    dl $7E090F : db $02 : dw $A000 ; Screen subpixel X position.
    dl $7E0911 : db $02 : dw $0000 ; Screen X position in pixels
    dl $7E0913 : db $02 : dw $8400 ; Screen subpixel Y position
    dl $7E0915 : db $02 : dw $00ED ; Screen Y position in pixels
    dl $7E0917 : db $02 : dw $0000 ; Layer 2 X scroll in room in pixels?
    dl $7E0919 : db $02 : dw $00ED ; Layer 2 Y scroll in room in pixels? (up = positive)
    dl $7E0921 : db $02 : dw $0000 ; BG2 X scroll offset due to room transitions (Translates between Layer 2 scroll and BG2 scroll)
    dl $7E0923 : db $02 : dw $FE00 ; BG2 Y scroll offset due to room transitions (Translates between Layer 2 scroll and BG2 scroll)
    dl $7E09CA : db $02 : dw $0012 ; Supers
    dl $7E09CE : db $02 : dw $000B ; Pbs
    dl $7E0AF6 : db $02 : dw $00B1 ; Samus X
    dl $7E0AFA : db $02 : dw $018B ; Samus Y
    dl $7ED91A : db $02 : dw $00A3 ; Events, Items, Doors
    dw #$FFFF
.after

preset_SZM101_cleanup_1_chasm_supers:
    dw #preset_SZM101_cleanup_1_spikesuit_hallway ; Cleanup 1: Spikesuit Hallway
    dl $7E078D : db $02 : dw $9486 ; DDB
    dl $7E078F : db $02 : dw $0001 ; DoorOut Index
    dl $7E079B : db $02 : dw $ADDE ; MDB
    dl $7E07C5 : db $02 : dw $BBBD ; GFX Pointers
    dl $7E07C7 : db $02 : dw $C2B6 ; GFX Pointers
    dl $7E090F : db $02 : dw $6000 ; Screen subpixel X position.
    dl $7E0911 : db $02 : dw $01D2 ; Screen X position in pixels
    dl $7E0913 : db $02 : dw $0000 ; Screen subpixel Y position
    dl $7E0915 : db $02 : dw $000B ; Screen Y position in pixels
    dl $7E0917 : db $02 : dw $01D2 ; Layer 2 X scroll in room in pixels?
    dl $7E0919 : db $02 : dw $000B ; Layer 2 Y scroll in room in pixels? (up = positive)
    dl $7E0921 : db $02 : dw $F900 ; BG2 X scroll offset due to room transitions (Translates between Layer 2 scroll and BG2 scroll)
    dl $7E0923 : db $02 : dw $FD00 ; BG2 Y scroll offset due to room transitions (Translates between Layer 2 scroll and BG2 scroll)
    dl $7E09C2 : db $02 : dw $0289 ; Health
    dl $7E09C6 : db $02 : dw $0035 ; Missiles
    dl $7E09D6 : db $02 : dw $00A3 ; Reserves
    dl $7E0AF6 : db $02 : dw $024A ; Samus X
    dl $7E0AFA : db $02 : dw $007B ; Samus Y
    dl $7ED91A : db $02 : dw $00A5 ; Events, Items, Doors
    dw #$FFFF
.after

preset_SZM101_cleanup_1_speed_keep_descent:
    dw #preset_SZM101_cleanup_1_chasm_supers ; Cleanup 1: Chasm Supers
    dl $7E078D : db $02 : dw $976E ; DDB
    dl $7E078F : db $02 : dw $0000 ; DoorOut Index
    dl $7E079B : db $02 : dw $A6E2 ; MDB
    dl $7E079F : db $02 : dw $0001 ; Region
    dl $7E07C3 : db $02 : dw $A5AA ; GFX Pointers
    dl $7E07C5 : db $02 : dw $5FBC ; GFX Pointers
    dl $7E07C7 : db $02 : dw $C2B3 ; GFX Pointers
    dl $7E07F3 : db $02 : dw $0012 ; Music Bank
    dl $7E090F : db $02 : dw $0000 ; Screen subpixel X position.
    dl $7E0911 : db $02 : dw $00D2 ; Screen X position in pixels
    dl $7E0913 : db $02 : dw $B7FF ; Screen subpixel Y position
    dl $7E0915 : db $02 : dw $0000 ; Screen Y position in pixels
    dl $7E0917 : db $02 : dw $00D2 ; Layer 2 X scroll in room in pixels?
    dl $7E0919 : db $02 : dw $0000 ; Layer 2 Y scroll in room in pixels? (up = positive)
    dl $7E0921 : db $02 : dw $FE00 ; BG2 X scroll offset due to room transitions (Translates between Layer 2 scroll and BG2 scroll)
    dl $7E0923 : db $02 : dw $0000 ; BG2 Y scroll offset due to room transitions (Translates between Layer 2 scroll and BG2 scroll)
    dl $7E09CC : db $02 : dw $0014 ; Max supers
    dl $7E09CE : db $02 : dw $000A ; Pbs
    dl $7E0AF6 : db $02 : dw $0172 ; Samus X
    dl $7E0AFA : db $02 : dw $009B ; Samus Y
    dl $7ED876 : db $02 : dw $E200 ; Events, Items, Doors
    dl $7ED8C6 : db $02 : dw $43F4 ; Events, Items, Doors
    dl $7ED91A : db $02 : dw $00A8 ; Events, Items, Doors
    dw #$FFFF
.after

preset_SZM101_cleanup_1_hole_in_the_wall_missiles:
    dw #preset_SZM101_cleanup_1_speed_keep_descent ; Cleanup 1: Speed Keep Descent
    dl $7E078D : db $02 : dw $8BCE ; DDB
    dl $7E079B : db $02 : dw $A253 ; MDB
    dl $7E090F : db $02 : dw $B001 ; Screen subpixel X position.
    dl $7E0911 : db $02 : dw $0000 ; Screen X position in pixels
    dl $7E0913 : db $02 : dw $0000 ; Screen subpixel Y position
    dl $7E0915 : db $02 : dw $091A ; Screen Y position in pixels
    dl $7E0917 : db $02 : dw $0000 ; Layer 2 X scroll in room in pixels?
    dl $7E0919 : db $02 : dw $091A ; Layer 2 Y scroll in room in pixels? (up = positive)
    dl $7E0921 : db $02 : dw $FF00 ; BG2 X scroll offset due to room transitions (Translates between Layer 2 scroll and BG2 scroll)
    dl $7E0923 : db $02 : dw $FD00 ; BG2 Y scroll offset due to room transitions (Translates between Layer 2 scroll and BG2 scroll)
    dl $7E09C2 : db $02 : dw $02BB ; Health
    dl $7E09C4 : db $02 : dw $02BB ; Max health
    dl $7E09CE : db $02 : dw $0009 ; Pbs
    dl $7E0AF6 : db $02 : dw $002F ; Samus X
    dl $7E0AFA : db $02 : dw $098B ; Samus Y
    dl $7ED87C : db $02 : dw $A31E ; Events, Items, Doors
    dl $7ED91A : db $02 : dw $00A9 ; Events, Items, Doors
    dw #$FFFF
.after

preset_SZM101_cleanup_1_eticoon_entry:
    dw #preset_SZM101_cleanup_1_hole_in_the_wall_missiles ; Cleanup 1: Hole In The Wall Missiles
    dl $7E078D : db $02 : dw $B104 ; DDB
    dl $7E078F : db $02 : dw $0003 ; DoorOut Index
    dl $7E079B : db $02 : dw $A641 ; MDB
    dl $7E090F : db $02 : dw $8000 ; Screen subpixel X position.
    dl $7E0911 : db $02 : dw $0300 ; Screen X position in pixels
    dl $7E0915 : db $02 : dw $0012 ; Screen Y position in pixels
    dl $7E0917 : db $02 : dw $0240 ; Layer 2 X scroll in room in pixels?
    dl $7E0919 : db $02 : dw $0012 ; Layer 2 Y scroll in room in pixels? (up = positive)
    dl $7E0921 : db $02 : dw $FC00 ; BG2 X scroll offset due to room transitions (Translates between Layer 2 scroll and BG2 scroll)
    dl $7E0923 : db $02 : dw $FE00 ; BG2 Y scroll offset due to room transitions (Translates between Layer 2 scroll and BG2 scroll)
    dl $7E09C2 : db $02 : dw $02B1 ; Health
    dl $7E09C6 : db $02 : dw $003B ; Missiles
    dl $7E09C8 : db $02 : dw $0050 ; Max missiles
    dl $7E09D6 : db $02 : dw $00B7 ; Reserves
    dl $7E0A1C : db $02 : dw $0001 ; Samus position/state
    dl $7E0A1E : db $02 : dw $0008 ; More position/state
    dl $7E0AF6 : db $02 : dw $0364 ; Samus X
    dl $7E0AFA : db $02 : dw $009B ; Samus Y
    dl $7ED872 : db $02 : dw $E9A5 ; Events, Items, Doors
    dl $7ED91A : db $02 : dw $00AB ; Events, Items, Doors
    dw #$FFFF
.after

preset_SZM101_cleanup_1_super_door_over_crumples:
    dw #preset_SZM101_cleanup_1_eticoon_entry ; Cleanup 1: Eticoon Entry
    dl $7E078D : db $02 : dw $8D42 ; DDB
    dl $7E078F : db $02 : dw $0001 ; DoorOut Index
    dl $7E079B : db $02 : dw $9AD9 ; MDB
    dl $7E0911 : db $02 : dw $0100 ; Screen X position in pixels
    dl $7E0915 : db $02 : dw $061D ; Screen Y position in pixels
    dl $7E0917 : db $02 : dw $0100 ; Layer 2 X scroll in room in pixels?
    dl $7E0919 : db $02 : dw $061D ; Layer 2 Y scroll in room in pixels? (up = positive)
    dl $7E0921 : db $02 : dw $FF00 ; BG2 X scroll offset due to room transitions (Translates between Layer 2 scroll and BG2 scroll)
    dl $7E0923 : db $02 : dw $F500 ; BG2 Y scroll offset due to room transitions (Translates between Layer 2 scroll and BG2 scroll)
    dl $7E09CE : db $02 : dw $000A ; Pbs
    dl $7E09D0 : db $02 : dw $000E ; Max pbs
    dl $7E0A1C : db $02 : dw $0002 ; Samus position/state
    dl $7E0A1E : db $02 : dw $0004 ; More position/state
    dl $7E0AF6 : db $02 : dw $0163 ; Samus X
    dl $7E0AFA : db $02 : dw $068B ; Samus Y
    dl $7ED878 : db $02 : dw $D23B ; Events, Items, Doors
    dl $7ED91A : db $02 : dw $00AD ; Events, Items, Doors
    dw #$FFFF
.after

preset_SZM101_cleanup_1_crumble_pillers:
    dw #preset_SZM101_cleanup_1_super_door_over_crumples ; Cleanup 1: Super Door Over Crumples
    dl $7E078D : db $02 : dw $8D12 ; DDB
    dl $7E078F : db $02 : dw $000A ; DoorOut Index
    dl $7E079B : db $02 : dw $A011 ; MDB
    dl $7E07C3 : db $02 : dw $E6B0 ; GFX Pointers
    dl $7E07C5 : db $02 : dw $64BB ; GFX Pointers
    dl $7E07C7 : db $02 : dw $C2B2 ; GFX Pointers
    dl $7E090F : db $02 : dw $CB80 ; Screen subpixel X position.
    dl $7E0911 : db $02 : dw $0000 ; Screen X position in pixels
    dl $7E0913 : db $02 : dw $B400 ; Screen subpixel Y position
    dl $7E0915 : db $02 : dw $01E2 ; Screen Y position in pixels
    dl $7E0917 : db $02 : dw $0000 ; Layer 2 X scroll in room in pixels?
    dl $7E0919 : db $02 : dw $0169 ; Layer 2 Y scroll in room in pixels? (up = positive)
    dl $7E0921 : db $02 : dw $FD00 ; BG2 X scroll offset due to room transitions (Translates between Layer 2 scroll and BG2 scroll)
    dl $7E0923 : db $02 : dw $0000 ; BG2 Y scroll offset due to room transitions (Translates between Layer 2 scroll and BG2 scroll)
    dl $7E09C2 : db $02 : dw $02DE ; Health
    dl $7E09C4 : db $02 : dw $02ED ; Max health
    dl $7E09C6 : db $02 : dw $0037 ; Missiles
    dl $7E09CA : db $02 : dw $0011 ; Supers
    dl $7E09CE : db $02 : dw $000C ; Pbs
    dl $7E0A1C : db $02 : dw $0001 ; Samus position/state
    dl $7E0A1E : db $02 : dw $0008 ; More position/state
    dl $7E0AF6 : db $02 : dw $0027 ; Samus X
    dl $7E0AFA : db $02 : dw $028B ; Samus Y
    dl $7ED87C : db $02 : dw $A35E ; Events, Items, Doors
    dl $7ED8C2 : db $02 : dw $00E0 ; Events, Items, Doors
    dl $7ED91A : db $02 : dw $00AF ; Events, Items, Doors
    dw #$FFFF
.after

preset_SZM101_cleanup_1_post_sporespawn_room:
    dw #preset_SZM101_cleanup_1_crumble_pillers ; Cleanup 1: Crumble Pillers
    dl $7E078D : db $02 : dw $8EFE ; DDB
    dl $7E078F : db $02 : dw $0000 ; DoorOut Index
    dl $7E090F : db $02 : dw $C000 ; Screen subpixel X position.
    dl $7E0913 : db $02 : dw $63FF ; Screen subpixel Y position
    dl $7E0915 : db $02 : dw $0108 ; Screen Y position in pixels
    dl $7E0919 : db $02 : dw $00C6 ; Layer 2 Y scroll in room in pixels? (up = positive)
    dl $7E0921 : db $02 : dw $FF00 ; BG2 X scroll offset due to room transitions (Translates between Layer 2 scroll and BG2 scroll)
    dl $7E0923 : db $02 : dw $FE00 ; BG2 Y scroll offset due to room transitions (Translates between Layer 2 scroll and BG2 scroll)
    dl $7E09C2 : db $02 : dw $02E3 ; Health
    dl $7E09CA : db $02 : dw $0013 ; Supers
    dl $7E09CC : db $02 : dw $0016 ; Max supers
    dl $7E0A1C : db $02 : dw $0002 ; Samus position/state
    dl $7E0A1E : db $02 : dw $0004 ; More position/state
    dl $7E0AF6 : db $02 : dw $004D ; Samus X
    dl $7E0AFA : db $02 : dw $018B ; Samus Y
    dl $7ED876 : db $02 : dw $E208 ; Events, Items, Doors
    dl $7ED91A : db $02 : dw $00B1 ; Events, Items, Doors
    dw #$FFFF
.after

preset_SZM101_cleanup_1_spazer:
    dw #preset_SZM101_cleanup_1_post_sporespawn_room ; Cleanup 1: Post Sporespawn Room
    dl $7E078D : db $02 : dw $8F2E ; DDB
    dl $7E079B : db $02 : dw $9E52 ; MDB
    dl $7E07C3 : db $02 : dw $A5AA ; GFX Pointers
    dl $7E07C5 : db $02 : dw $5FBC ; GFX Pointers
    dl $7E07C7 : db $02 : dw $C2B3 ; GFX Pointers
    dl $7E090F : db $02 : dw $0000 ; Screen subpixel X position.
    dl $7E0911 : db $02 : dw $0051 ; Screen X position in pixels
    dl $7E0913 : db $02 : dw $F800 ; Screen subpixel Y position
    dl $7E0915 : db $02 : dw $012C ; Screen Y position in pixels
    dl $7E0917 : db $02 : dw $0051 ; Layer 2 X scroll in room in pixels?
    dl $7E0919 : db $02 : dw $012C ; Layer 2 Y scroll in room in pixels? (up = positive)
    dl $7E0921 : db $02 : dw $F900 ; BG2 X scroll offset due to room transitions (Translates between Layer 2 scroll and BG2 scroll)
    dl $7E0923 : db $02 : dw $FD00 ; BG2 Y scroll offset due to room transitions (Translates between Layer 2 scroll and BG2 scroll)
    dl $7E09C2 : db $02 : dw $02BB ; Health
    dl $7E09C6 : db $02 : dw $003C ; Missiles
    dl $7E09C8 : db $02 : dw $0055 ; Max missiles
    dl $7E0AF6 : db $02 : dw $00F1 ; Samus X
    dl $7E0AFA : db $02 : dw $019B ; Samus Y
    dl $7ED870 : db $02 : dw $1184 ; Events, Items, Doors
    dl $7ED91A : db $02 : dw $00B2 ; Events, Items, Doors
    dw #$FFFF
.after

preset_SZM101_cleanup_1_spazer_exit:
    dw #preset_SZM101_cleanup_1_spazer ; Cleanup 1: Spazer
    dl $7E078D : db $02 : dw $8E7A ; DDB
    dl $7E079B : db $02 : dw $A4DA ; MDB
    dl $7E090F : db $02 : dw $E000 ; Screen subpixel X position.
    dl $7E0911 : db $02 : dw $0000 ; Screen X position in pixels
    dl $7E0913 : db $02 : dw $FC00 ; Screen subpixel Y position
    dl $7E0915 : db $02 : dw $0200 ; Screen Y position in pixels
    dl $7E0917 : db $02 : dw $0000 ; Layer 2 X scroll in room in pixels?
    dl $7E0919 : db $02 : dw $0200 ; Layer 2 Y scroll in room in pixels? (up = positive)
    dl $7E0921 : db $02 : dw $FE00 ; BG2 X scroll offset due to room transitions (Translates between Layer 2 scroll and BG2 scroll)
    dl $7E0923 : db $02 : dw $0000 ; BG2 Y scroll offset due to room transitions (Translates between Layer 2 scroll and BG2 scroll)
    dl $7E09A6 : db $02 : dw $0007 ; Beams
    dl $7E09A8 : db $02 : dw $0007 ; Beams
    dl $7E09C6 : db $02 : dw $0044 ; Missiles
    dl $7E09C8 : db $02 : dw $005F ; Max missiles
    dl $7E09CA : db $02 : dw $0011 ; Supers
    dl $7E0AF6 : db $02 : dw $0075 ; Samus X
    dl $7E0AFA : db $02 : dw $029B ; Samus Y
    dl $7ED872 : db $02 : dw $E9BD ; Events, Items, Doors
    dl $7ED880 : db $02 : dw $C3FB ; Events, Items, Doors
    dl $7ED8C2 : db $02 : dw $40E0 ; Events, Items, Doors
    dl $7ED8C4 : db $02 : dw $B950 ; Events, Items, Doors
    dl $7ED91A : db $02 : dw $00B5 ; Events, Items, Doors
    dw #$FFFF
.after

preset_SZM101_cleanup_1_leaving_tourian:
    dw #preset_SZM101_cleanup_1_spazer_exit ; Cleanup 1: Spazer Exit
    dl $7E078D : db $02 : dw $AA5C ; DDB
    dl $7E078F : db $02 : dw $0001 ; DoorOut Index
    dl $7E079B : db $02 : dw $83E8 ; MDB
    dl $7E07C3 : db $02 : dw $E6B0 ; GFX Pointers
    dl $7E07C5 : db $02 : dw $64BB ; GFX Pointers
    dl $7E07C7 : db $02 : dw $C2B2 ; GFX Pointers
    dl $7E090F : db $02 : dw $2000 ; Screen subpixel X position.
    dl $7E0913 : db $02 : dw $0000 ; Screen subpixel Y position
    dl $7E0921 : db $02 : dw $0000 ; BG2 X scroll offset due to room transitions (Translates between Layer 2 scroll and BG2 scroll)
    dl $7E0923 : db $02 : dw $00E0 ; BG2 Y scroll offset due to room transitions (Translates between Layer 2 scroll and BG2 scroll)
    dl $7E09C2 : db $02 : dw $0243 ; Health
    dl $7E09CA : db $02 : dw $0010 ; Supers
    dl $7E09CE : db $02 : dw $000A ; Pbs
    dl $7E0A1C : db $02 : dw $009B ; Samus position/state
    dl $7E0A1E : db $02 : dw $0000 ; More position/state
    dl $7E0AF6 : db $02 : dw $0080 ; Samus X
    dl $7E0AFA : db $02 : dw $02A8 ; Samus Y
    dl $7ED822 : db $02 : dw $0020 ; Events, Items, Doors
    dl $7ED880 : db $02 : dw $F3FB ; Events, Items, Doors
    dl $7ED8C8 : db $02 : dw $0001 ; Events, Items, Doors
    dl $7ED91A : db $02 : dw $00BA ; Events, Items, Doors
    dw #$FFFF
.after

preset_SZM101_cleanup_1_bomb_hole_missiles:
    dw #preset_SZM101_cleanup_1_leaving_tourian ; Cleanup 1: Leaving Tourian
    dl $7E078D : db $02 : dw $B684 ; DDB
    dl $7E079B : db $02 : dw $9D19 ; MDB
    dl $7E090F : db $02 : dw $6980 ; Screen subpixel X position.
    dl $7E0911 : db $02 : dw $0100 ; Screen X position in pixels
    dl $7E0913 : db $02 : dw $0800 ; Screen subpixel Y position
    dl $7E0915 : db $02 : dw $0119 ; Screen Y position in pixels
    dl $7E0917 : db $02 : dw $00C0 ; Layer 2 X scroll in room in pixels?
    dl $7E0919 : db $02 : dw $00D2 ; Layer 2 Y scroll in room in pixels? (up = positive)
    dl $7E0921 : db $02 : dw $0100 ; BG2 X scroll offset due to room transitions (Translates between Layer 2 scroll and BG2 scroll)
    dl $7E0923 : db $02 : dw $FD00 ; BG2 Y scroll offset due to room transitions (Translates between Layer 2 scroll and BG2 scroll)
    dl $7E09C2 : db $02 : dw $031F ; Health
    dl $7E09C4 : db $02 : dw $031F ; Max health
    dl $7E09CA : db $02 : dw $000E ; Supers
    dl $7E09CE : db $02 : dw $0008 ; Pbs
    dl $7E0A1C : db $02 : dw $0002 ; Samus position/state
    dl $7E0A1E : db $02 : dw $0004 ; More position/state
    dl $7E0AF6 : db $02 : dw $014E ; Samus X
    dl $7E0AFA : db $02 : dw $0193 ; Samus Y
    dl $7ED87C : db $02 : dw $A75E ; Events, Items, Doors
    dl $7ED91A : db $02 : dw $00BD ; Events, Items, Doors
    dw #$FFFF
.after

preset_SZM101_cleanup_1_mini_kraid_big_lag:
    dw #preset_SZM101_cleanup_1_bomb_hole_missiles ; Cleanup 1: Bomb Hole Missiles
    dl $7E078D : db $02 : dw $9132 ; DDB
    dl $7E078F : db $02 : dw $0000 ; DoorOut Index
    dl $7E090F : db $02 : dw $0000 ; Screen subpixel X position.
    dl $7E0911 : db $02 : dw $0614 ; Screen X position in pixels
    dl $7E0913 : db $02 : dw $0000 ; Screen subpixel Y position
    dl $7E0915 : db $02 : dw $0411 ; Screen Y position in pixels
    dl $7E0917 : db $02 : dw $048F ; Layer 2 X scroll in room in pixels?
    dl $7E0919 : db $02 : dw $030C ; Layer 2 Y scroll in room in pixels? (up = positive)
    dl $7E0921 : db $02 : dw $F700 ; BG2 X scroll offset due to room transitions (Translates between Layer 2 scroll and BG2 scroll)
    dl $7E0923 : db $02 : dw $FE00 ; BG2 Y scroll offset due to room transitions (Translates between Layer 2 scroll and BG2 scroll)
    dl $7E09C6 : db $02 : dw $004E ; Missiles
    dl $7E09C8 : db $02 : dw $0069 ; Max missiles
    dl $7E09CA : db $02 : dw $000C ; Supers
    dl $7E09CC : db $02 : dw $0010 ; Max supers
    dl $7E09CE : db $02 : dw $0009 ; Pbs
    dl $7E09D6 : db $02 : dw $00C8 ; Reserves
    dl $7E0AF6 : db $02 : dw $06B4 ; Samus X
    dl $7E0AFA : db $02 : dw $0481 ; Samus Y
    dl $7ED870 : db $02 : dw $1784 ; Events, Items, Doors
    dl $7ED876 : db $02 : dw $E308 ; Events, Items, Doors
    dl $7ED8C2 : db $02 : dw $50E0 ; Events, Items, Doors
    dl $7ED91A : db $02 : dw $00C3 ; Events, Items, Doors
    dw #$FFFF
.after

preset_SZM101_cleanup_1_pink_room_exit_spark:
    dw #preset_SZM101_cleanup_1_mini_kraid_big_lag ; Cleanup 1: Mini Kraid Big Lag
    dl $7E078D : db $02 : dw $AFCC ; DDB
    dl $7E078F : db $02 : dw $0003 ; DoorOut Index
    dl $7E079B : db $02 : dw $9CB3 ; MDB
    dl $7E090F : db $02 : dw $F97F ; Screen subpixel X position.
    dl $7E0911 : db $02 : dw $0900 ; Screen X position in pixels
    dl $7E0915 : db $02 : dw $0000 ; Screen Y position in pixels
    dl $7E0917 : db $02 : dw $0900 ; Layer 2 X scroll in room in pixels?
    dl $7E0919 : db $02 : dw $0000 ; Layer 2 Y scroll in room in pixels? (up = positive)
    dl $7E0921 : db $02 : dw $F800 ; BG2 X scroll offset due to room transitions (Translates between Layer 2 scroll and BG2 scroll)
    dl $7E0923 : db $02 : dw $0000 ; BG2 Y scroll offset due to room transitions (Translates between Layer 2 scroll and BG2 scroll)
    dl $7E09C2 : db $02 : dw $0315 ; Health
    dl $7E09C6 : db $02 : dw $0051 ; Missiles
    dl $7E09C8 : db $02 : dw $006E ; Max missiles
    dl $7E09CA : db $02 : dw $0015 ; Supers
    dl $7E09CE : db $02 : dw $000B ; Pbs
    dl $7E09D0 : db $02 : dw $0010 ; Max pbs
    dl $7E0A1C : db $02 : dw $0001 ; Samus position/state
    dl $7E0A1E : db $02 : dw $0008 ; More position/state
    dl $7E0AF6 : db $02 : dw $0942 ; Samus X
    dl $7E0AFA : db $02 : dw $008D ; Samus Y
    dl $7ED874 : db $02 : dw $4187 ; Events, Items, Doors
    dl $7ED878 : db $02 : dw $D63B ; Events, Items, Doors
    dl $7ED91A : db $02 : dw $00C6 ; Events, Items, Doors
    dw #$FFFF
.after

preset_SZM101_chozodia_elevator_top:
    dw #preset_SZM101_cleanup_1_pink_room_exit_spark ; Cleanup 1: Pink Room Exit Spark
    dl $7E078D : db $02 : dw $8CA6 ; DDB
    dl $7E078F : db $02 : dw $0002 ; DoorOut Index
    dl $7E079B : db $02 : dw $88D7 ; MDB
    dl $7E07C3 : db $02 : dw $A5AA ; GFX Pointers
    dl $7E07C5 : db $02 : dw $5FBC ; GFX Pointers
    dl $7E07C7 : db $02 : dw $C2B3 ; GFX Pointers
    dl $7E07F5 : db $02 : dw $0003 ; Music Track
    dl $7E090F : db $02 : dw $C000 ; Screen subpixel X position.
    dl $7E0911 : db $02 : dw $0000 ; Screen X position in pixels
    dl $7E0913 : db $02 : dw $C000 ; Screen subpixel Y position
    dl $7E0917 : db $02 : dw $0000 ; Layer 2 X scroll in room in pixels?
    dl $7E0921 : db $02 : dw $0000 ; BG2 X scroll offset due to room transitions (Translates between Layer 2 scroll and BG2 scroll)
    dl $7E0923 : db $02 : dw $FF00 ; BG2 Y scroll offset due to room transitions (Translates between Layer 2 scroll and BG2 scroll)
    dl $7E0A1C : db $02 : dw $0002 ; Samus position/state
    dl $7E0A1E : db $02 : dw $0004 ; More position/state
    dl $7E0AF6 : db $02 : dw $007D ; Samus X
    dl $7E0AFA : db $02 : dw $008B ; Samus Y
    dl $7ED91A : db $02 : dw $00C8 ; Events, Items, Doors
    dw #$FFFF
.after

preset_SZM101_chozodia_robot_clip_with_speed:
    dw #preset_SZM101_chozodia_elevator_top ; Chozodia: Elevator Top
    dl $7E078D : db $02 : dw $8FEE ; DDB
    dl $7E078F : db $02 : dw $0001 ; DoorOut Index
    dl $7E079B : db $02 : dw $A130 ; MDB
    dl $7E07C3 : db $02 : dw $E6B0 ; GFX Pointers
    dl $7E07C5 : db $02 : dw $64BB ; GFX Pointers
    dl $7E07C7 : db $02 : dw $C2B2 ; GFX Pointers
    dl $7E07F3 : db $02 : dw $000F ; Music Bank
    dl $7E07F5 : db $02 : dw $0005 ; Music Track
    dl $7E090F : db $02 : dw $A000 ; Screen subpixel X position.
    dl $7E0911 : db $02 : dw $0100 ; Screen X position in pixels
    dl $7E0913 : db $02 : dw $0000 ; Screen subpixel Y position
    dl $7E0915 : db $02 : dw $041D ; Screen Y position in pixels
    dl $7E0917 : db $02 : dw $0100 ; Layer 2 X scroll in room in pixels?
    dl $7E0919 : db $02 : dw $041D ; Layer 2 Y scroll in room in pixels? (up = positive)
    dl $7E0923 : db $02 : dw $FA00 ; BG2 Y scroll offset due to room transitions (Translates between Layer 2 scroll and BG2 scroll)
    dl $7E09C2 : db $02 : dw $030F ; Health
    dl $7E09C6 : db $02 : dw $0057 ; Missiles
    dl $7E09C8 : db $02 : dw $0073 ; Max missiles
    dl $7E09CA : db $02 : dw $0017 ; Supers
    dl $7E09CC : db $02 : dw $001A ; Max supers
    dl $7E0A1C : db $02 : dw $0001 ; Samus position/state
    dl $7E0A1E : db $02 : dw $0008 ; More position/state
    dl $7E0AF6 : db $02 : dw $01A5 ; Samus X
    dl $7E0AFA : db $02 : dw $048B ; Samus Y
    dl $7ED874 : db $02 : dw $41C7 ; Events, Items, Doors
    dl $7ED876 : db $02 : dw $E328 ; Events, Items, Doors
    dl $7ED91A : db $02 : dw $00CD ; Events, Items, Doors
    dw #$FFFF
.after

preset_SZM101_chozodia_charge_entry:
    dw #preset_SZM101_chozodia_robot_clip_with_speed ; Chozodia: Robot Clip With Speed
    dl $7E078D : db $02 : dw $B1A0 ; DDB
    dl $7E078F : db $02 : dw $0004 ; DoorOut Index
    dl $7E090F : db $02 : dw $1000 ; Screen subpixel X position.
    dl $7E0913 : db $02 : dw $FC00 ; Screen subpixel Y position
    dl $7E0915 : db $02 : dw $021D ; Screen Y position in pixels
    dl $7E0919 : db $02 : dw $021D ; Layer 2 Y scroll in room in pixels? (up = positive)
    dl $7E0921 : db $02 : dw $FD00 ; BG2 X scroll offset due to room transitions (Translates between Layer 2 scroll and BG2 scroll)
    dl $7E0923 : db $02 : dw $FF00 ; BG2 Y scroll offset due to room transitions (Translates between Layer 2 scroll and BG2 scroll)
    dl $7E09C2 : db $02 : dw $0301 ; Health
    dl $7E09C6 : db $02 : dw $005A ; Missiles
    dl $7E09C8 : db $02 : dw $0078 ; Max missiles
    dl $7E09CE : db $02 : dw $000A ; Pbs
    dl $7E0A1C : db $02 : dw $0002 ; Samus position/state
    dl $7E0A1E : db $02 : dw $0004 ; More position/state
    dl $7E0AF6 : db $02 : dw $013E ; Samus X
    dl $7E0AFA : db $02 : dw $028B ; Samus Y
    dl $7ED874 : db $02 : dw $41E7 ; Events, Items, Doors
    dl $7ED8C4 : db $02 : dw $B9D1 ; Events, Items, Doors
    dl $7ED91A : db $02 : dw $00D0 ; Events, Items, Doors
    dw #$FFFF
.after

preset_SZM101_chozodia_charge_entry_exit:
    dw #preset_SZM101_chozodia_charge_entry ; Chozodia: Charge Entry
    dl $7E078D : db $02 : dw $8C9A ; DDB
    dl $7E078F : db $02 : dw $0000 ; DoorOut Index
    dl $7E079B : db $02 : dw $9461 ; MDB
    dl $7E07F5 : db $02 : dw $0003 ; Music Track
    dl $7E090F : db $02 : dw $E000 ; Screen subpixel X position.
    dl $7E0911 : db $02 : dw $0200 ; Screen X position in pixels
    dl $7E0913 : db $02 : dw $3000 ; Screen subpixel Y position
    dl $7E0915 : db $02 : dw $0100 ; Screen Y position in pixels
    dl $7E0917 : db $02 : dw $0180 ; Layer 2 X scroll in room in pixels?
    dl $7E0919 : db $02 : dw $00C0 ; Layer 2 Y scroll in room in pixels? (up = positive)
    dl $7E0921 : db $02 : dw $0100 ; BG2 X scroll offset due to room transitions (Translates between Layer 2 scroll and BG2 scroll)
    dl $7E09A6 : db $02 : dw $1007 ; Beams
    dl $7E09A8 : db $02 : dw $1007 ; Beams
    dl $7E0A1C : db $02 : dw $0001 ; Samus position/state
    dl $7E0A1E : db $02 : dw $0008 ; More position/state
    dl $7E0AF6 : db $02 : dw $02CE ; Samus X
    dl $7E0AFA : db $02 : dw $018B ; Samus Y
    dl $7ED880 : db $02 : dw $F3FF ; Events, Items, Doors
    dl $7ED8CC : db $02 : dw $0001 ; Events, Items, Doors
    dl $7ED91A : db $02 : dw $00D1 ; Events, Items, Doors
    dw #$FFFF
.after

preset_SZM101_chozodia_shoot_the_floor:
    dw #preset_SZM101_chozodia_charge_entry_exit ; Chozodia: Charge Entry Exit
    dl $7E078D : db $02 : dw $B188 ; DDB
    dl $7E078F : db $02 : dw $0002 ; DoorOut Index
    dl $7E079B : db $02 : dw $B139 ; MDB
    dl $7E07C3 : db $02 : dw $A5AA ; GFX Pointers
    dl $7E07C5 : db $02 : dw $5FBC ; GFX Pointers
    dl $7E07C7 : db $02 : dw $C2B3 ; GFX Pointers
    dl $7E07F5 : db $02 : dw $0005 ; Music Track
    dl $7E090F : db $02 : dw $FC00 ; Screen subpixel X position.
    dl $7E0911 : db $02 : dw $0300 ; Screen X position in pixels
    dl $7E0913 : db $02 : dw $9000 ; Screen subpixel Y position
    dl $7E0917 : db $02 : dw $0240 ; Layer 2 X scroll in room in pixels?
    dl $7E0923 : db $02 : dw $0000 ; BG2 Y scroll offset due to room transitions (Translates between Layer 2 scroll and BG2 scroll)
    dl $7E09C2 : db $02 : dw $02EA ; Health
    dl $7E09CA : db $02 : dw $0015 ; Supers
    dl $7E0AF6 : db $02 : dw $03BF ; Samus X
    dl $7E0AFA : db $02 : dw $0194 ; Samus Y
    dl $7ED91A : db $02 : dw $00D7 ; Events, Items, Doors
    dw #$FFFF
.after

preset_SZM101_chozodia_map_room:
    dw #preset_SZM101_chozodia_shoot_the_floor ; Chozodia: Shoot The Floor
    dl $7E078D : db $02 : dw $911A ; DDB
    dl $7E078F : db $02 : dw $0001 ; DoorOut Index
    dl $7E079B : db $02 : dw $9994 ; MDB
    dl $7E07C3 : db $02 : dw $860B ; GFX Pointers
    dl $7E07C5 : db $02 : dw $21C0 ; GFX Pointers
    dl $7E07C7 : db $02 : dw $C2C0 ; GFX Pointers
    dl $7E090F : db $02 : dw $C000 ; Screen subpixel X position.
    dl $7E0911 : db $02 : dw $0000 ; Screen X position in pixels
    dl $7E0913 : db $02 : dw $C000 ; Screen subpixel Y position
    dl $7E0915 : db $02 : dw $0000 ; Screen Y position in pixels
    dl $7E0917 : db $02 : dw $0000 ; Layer 2 X scroll in room in pixels?
    dl $7E0919 : db $02 : dw $0000 ; Layer 2 Y scroll in room in pixels? (up = positive)
    dl $7E09C6 : db $02 : dw $005E ; Missiles
    dl $7E09C8 : db $02 : dw $007D ; Max missiles
    dl $7E0AF6 : db $02 : dw $00A7 ; Samus X
    dl $7E0AFA : db $02 : dw $009B ; Samus Y
    dl $7ED872 : db $02 : dw $E9FD ; Events, Items, Doors
    dl $7ED8C4 : db $02 : dw $BBD1 ; Events, Items, Doors
    dl $7ED91A : db $02 : dw $00D8 ; Events, Items, Doors
    dw #$FFFF
.after

preset_SZM101_chozodia_white_room_etank:
    dw #preset_SZM101_chozodia_map_room ; Chozodia: Map Room
    dl $7E078D : db $02 : dw $9012 ; DDB
    dl $7E078F : db $02 : dw $0000 ; DoorOut Index
    dl $7E079B : db $02 : dw $A471 ; MDB
    dl $7E07C3 : db $02 : dw $A5AA ; GFX Pointers
    dl $7E07C5 : db $02 : dw $5FBC ; GFX Pointers
    dl $7E07C7 : db $02 : dw $C2B3 ; GFX Pointers
    dl $7E090F : db $02 : dw $0200 ; Screen subpixel X position.
    dl $7E0911 : db $02 : dw $0100 ; Screen X position in pixels
    dl $7E0913 : db $02 : dw $BC00 ; Screen subpixel Y position
    dl $7E0915 : db $02 : dw $0022 ; Screen Y position in pixels
    dl $7E0917 : db $02 : dw $00C0 ; Layer 2 X scroll in room in pixels?
    dl $7E0919 : db $02 : dw $0019 ; Layer 2 Y scroll in room in pixels? (up = positive)
    dl $7E0923 : db $02 : dw $FF00 ; BG2 Y scroll offset due to room transitions (Translates between Layer 2 scroll and BG2 scroll)
    dl $7E09C2 : db $02 : dw $015B ; Health
    dl $7E09C6 : db $02 : dw $0060 ; Missiles
    dl $7E09D0 : db $02 : dw $0012 ; Max pbs
    dl $7E0AF6 : db $02 : dw $01C9 ; Samus X
    dl $7E0AFA : db $02 : dw $0092 ; Samus Y
    dl $7ED878 : db $02 : dw $DE3B ; Events, Items, Doors
    dl $7ED8C4 : db $02 : dw $BFD1 ; Events, Items, Doors
    dl $7ED91A : db $02 : dw $00D9 ; Events, Items, Doors
    dw #$FFFF
.after

preset_SZM101_chozodia_ship_entry_chain_spark:
    dw #preset_SZM101_chozodia_white_room_etank ; Chozodia: White Room Etank
    dl $7E078D : db $02 : dw $8AF6 ; DDB
    dl $7E079B : db $02 : dw $98E2 ; MDB
    dl $7E079F : db $02 : dw $0000 ; Region
    dl $7E07C3 : db $02 : dw $F911 ; GFX Pointers
    dl $7E07C5 : db $02 : dw $43BA ; GFX Pointers
    dl $7E07C7 : db $02 : dw $C2AF ; GFX Pointers
    dl $7E07F3 : db $02 : dw $0009 ; Music Bank
    dl $7E07F5 : db $02 : dw $0006 ; Music Track
    dl $7E090F : db $02 : dw $7000 ; Screen subpixel X position.
    dl $7E0911 : db $02 : dw $01F5 ; Screen X position in pixels
    dl $7E0913 : db $02 : dw $6801 ; Screen subpixel Y position
    dl $7E0915 : db $02 : dw $011F ; Screen Y position in pixels
    dl $7E0917 : db $02 : dw $0177 ; Layer 2 X scroll in room in pixels?
    dl $7E0919 : db $02 : dw $00D7 ; Layer 2 Y scroll in room in pixels? (up = positive)
    dl $7E0921 : db $02 : dw $FE00 ; BG2 X scroll offset due to room transitions (Translates between Layer 2 scroll and BG2 scroll)
    dl $7E0923 : db $02 : dw $FE00 ; BG2 Y scroll offset due to room transitions (Translates between Layer 2 scroll and BG2 scroll)
    dl $7E09C2 : db $02 : dw $0351 ; Health
    dl $7E09C4 : db $02 : dw $0351 ; Max health
    dl $7E09CE : db $02 : dw $0009 ; Pbs
    dl $7E0AF6 : db $02 : dw $0272 ; Samus X
    dl $7E0AFA : db $02 : dw $01BB ; Samus Y
    dl $7ED87C : db $02 : dw $E75E ; Events, Items, Doors
    dl $7ED91A : db $02 : dw $00DC ; Events, Items, Doors
    dw #$FFFF
.after

preset_SZM101_chozodia_waterway_speedkeep:
    dw #preset_SZM101_chozodia_ship_entry_chain_spark ; Chozodia: Ship Entry Chain Spark
    dl $7E078D : db $02 : dw $B9F0 ; DDB
    dl $7E078F : db $02 : dw $0003 ; DoorOut Index
    dl $7E079B : db $02 : dw $87B7 ; MDB
    dl $7E079F : db $02 : dw $0003 ; Region
    dl $7E07C3 : db $02 : dw $E78D ; GFX Pointers
    dl $7E07C5 : db $02 : dw $2EBE ; GFX Pointers
    dl $7E07C7 : db $02 : dw $C2B9 ; GFX Pointers
    dl $7E07F3 : db $02 : dw $0030 ; Music Bank
    dl $7E090F : db $02 : dw $8000 ; Screen subpixel X position.
    dl $7E0911 : db $02 : dw $0100 ; Screen X position in pixels
    dl $7E0913 : db $02 : dw $E3FF ; Screen subpixel Y position
    dl $7E0915 : db $02 : dw $020B ; Screen Y position in pixels
    dl $7E0917 : db $02 : dw $0100 ; Layer 2 X scroll in room in pixels?
    dl $7E0919 : db $02 : dw $020B ; Layer 2 Y scroll in room in pixels? (up = positive)
    dl $7E0921 : db $02 : dw $0100 ; BG2 X scroll offset due to room transitions (Translates between Layer 2 scroll and BG2 scroll)
    dl $7E0923 : db $02 : dw $FF00 ; BG2 Y scroll offset due to room transitions (Translates between Layer 2 scroll and BG2 scroll)
    dl $7E09CE : db $02 : dw $0008 ; Pbs
    dl $7E0A1C : db $02 : dw $0079 ; Samus position/state
    dl $7E0A1E : db $02 : dw $1108 ; More position/state
    dl $7E0AF6 : db $02 : dw $01E4 ; Samus X
    dl $7E0AFA : db $02 : dw $0299 ; Samus Y
    dl $7ED91A : db $02 : dw $00DD ; Events, Items, Doors
    dw #$FFFF
.after

preset_SZM101_chozodia_chozodia_speedkeep:
    dw #preset_SZM101_chozodia_waterway_speedkeep ; Chozodia: Waterway Speedkeep
    dl $7E078D : db $02 : dw $A6A8 ; DDB
    dl $7E078F : db $02 : dw $0000 ; DoorOut Index
    dl $7E079B : db $02 : dw $D78F ; MDB
    dl $7E079F : db $02 : dw $0004 ; Region
    dl $7E07C3 : db $02 : dw $F911 ; GFX Pointers
    dl $7E07C5 : db $02 : dw $43BA ; GFX Pointers
    dl $7E07C7 : db $02 : dw $C2AF ; GFX Pointers
    dl $7E07F3 : db $02 : dw $001B ; Music Bank
    dl $7E090F : db $02 : dw $0000 ; Screen subpixel X position.
    dl $7E0911 : db $02 : dw $011D ; Screen X position in pixels
    dl $7E0913 : db $02 : dw $F400 ; Screen subpixel Y position
    dl $7E0915 : db $02 : dw $0004 ; Screen Y position in pixels
    dl $7E0917 : db $02 : dw $011D ; Layer 2 X scroll in room in pixels?
    dl $7E0919 : db $02 : dw $0003 ; Layer 2 Y scroll in room in pixels? (up = positive)
    dl $7E0921 : db $02 : dw $FD00 ; BG2 X scroll offset due to room transitions (Translates between Layer 2 scroll and BG2 scroll)
    dl $7E09C2 : db $02 : dw $0329 ; Health
    dl $7E0A1C : db $02 : dw $0002 ; Samus position/state
    dl $7E0A1E : db $02 : dw $0004 ; More position/state
    dl $7E0AF6 : db $02 : dw $01BD ; Samus X
    dl $7E0AFA : db $02 : dw $008B ; Samus Y
    dl $7ED91A : db $02 : dw $00E1 ; Events, Items, Doors
    dw #$FFFF
.after

preset_SZM101_chozodia_bang:
    dw #preset_SZM101_chozodia_chozodia_speedkeep ; Chozodia: Chozodia Speedkeep
    dl $7E078D : db $02 : dw $A5C4 ; DDB
    dl $7E078F : db $02 : dw $0003 ; DoorOut Index
    dl $7E079B : db $02 : dw $D1A3 ; MDB
    dl $7E0911 : db $02 : dw $02F2 ; Screen X position in pixels
    dl $7E0913 : db $02 : dw $3800 ; Screen subpixel Y position
    dl $7E0915 : db $02 : dw $011F ; Screen Y position in pixels
    dl $7E0917 : db $02 : dw $02F2 ; Layer 2 X scroll in room in pixels?
    dl $7E0919 : db $02 : dw $00D7 ; Layer 2 Y scroll in room in pixels? (up = positive)
    dl $7E0921 : db $02 : dw $0000 ; BG2 X scroll offset due to room transitions (Translates between Layer 2 scroll and BG2 scroll)
    dl $7E0923 : db $02 : dw $00E0 ; BG2 Y scroll offset due to room transitions (Translates between Layer 2 scroll and BG2 scroll)
    dl $7E09CE : db $02 : dw $000B ; Pbs
    dl $7E0A1C : db $02 : dw $0027 ; Samus position/state
    dl $7E0A1E : db $02 : dw $0508 ; More position/state
    dl $7E0AF6 : db $02 : dw $0352 ; Samus X
    dl $7E0AFA : db $02 : dw $01CA ; Samus Y
    dw #$FFFF
.after

preset_SZM101_chozodia_botwoon:
    dw #preset_SZM101_chozodia_bang ; Chozodia: Bang
    dl $7E078D : db $02 : dw $C0AC ; DDB
    dl $7E078F : db $02 : dw $0001 ; DoorOut Index
    dl $7E079B : db $02 : dw $8CAA ; MDB
    dl $7E07C5 : db $02 : dw $15BA ; GFX Pointers
    dl $7E07C7 : db $02 : dw $C2B0 ; GFX Pointers
    dl $7E090F : db $02 : dw $DC00 ; Screen subpixel X position.
    dl $7E0911 : db $02 : dw $0100 ; Screen X position in pixels
    dl $7E0913 : db $02 : dw $5C00 ; Screen subpixel Y position
    dl $7E0915 : db $02 : dw $0000 ; Screen Y position in pixels
    dl $7E0917 : db $02 : dw $0100 ; Layer 2 X scroll in room in pixels?
    dl $7E0919 : db $02 : dw $0000 ; Layer 2 Y scroll in room in pixels? (up = positive)
    dl $7E0921 : db $02 : dw $0100 ; BG2 X scroll offset due to room transitions (Translates between Layer 2 scroll and BG2 scroll)
    dl $7E0923 : db $02 : dw $0000 ; BG2 Y scroll offset due to room transitions (Translates between Layer 2 scroll and BG2 scroll)
    dl $7E09A6 : db $02 : dw $1001 ; Beams
    dl $7E09C2 : db $02 : dw $02ED ; Health
    dl $7E09C6 : db $02 : dw $0062 ; Missiles
    dl $7E09CE : db $02 : dw $0009 ; Pbs
    dl $7E0A1C : db $02 : dw $0001 ; Samus position/state
    dl $7E0A1E : db $02 : dw $0008 ; More position/state
    dl $7E0AF6 : db $02 : dw $01B8 ; Samus X
    dl $7E0AFA : db $02 : dw $00AB ; Samus Y
    dl $7ED8CA : db $02 : dw $0A00 ; Events, Items, Doors
    dl $7ED91A : db $02 : dw $00E2 ; Events, Items, Doors
    dw #$FFFF
.after

preset_SZM101_chozodia_gravity:
    dw #preset_SZM101_chozodia_botwoon ; Chozodia: Botwoon
    dl $7E078D : db $02 : dw $BCCC ; DDB
    dl $7E079B : db $02 : dw $D95E ; MDB
    dl $7E07F5 : db $02 : dw $0003 ; Music Track
    dl $7E090F : db $02 : dw $AC00 ; Screen subpixel X position.
    dl $7E0911 : db $02 : dw $0000 ; Screen X position in pixels
    dl $7E0913 : db $02 : dw $9800 ; Screen subpixel Y position
    dl $7E0915 : db $02 : dw $0300 ; Screen Y position in pixels
    dl $7E0917 : db $02 : dw $0000 ; Layer 2 X scroll in room in pixels?
    dl $7E0919 : db $02 : dw $0300 ; Layer 2 Y scroll in room in pixels? (up = positive)
    dl $7E0923 : db $02 : dw $FD00 ; BG2 Y scroll offset due to room transitions (Translates between Layer 2 scroll and BG2 scroll)
    dl $7E09C2 : db $02 : dw $0122 ; Health
    dl $7E09C6 : db $02 : dw $001A ; Missiles
    dl $7E09CA : db $02 : dw $000F ; Supers
    dl $7E09CE : db $02 : dw $0007 ; Pbs
    dl $7E09D6 : db $02 : dw $0000 ; Reserves
    dl $7E0A1C : db $02 : dw $0002 ; Samus position/state
    dl $7E0A1E : db $02 : dw $0004 ; More position/state
    dl $7E0AF6 : db $02 : dw $0030 ; Samus X
    dl $7E0AFA : db $02 : dw $038B ; Samus Y
    dl $7ED82C : db $02 : dw $0002 ; Events, Items, Doors
    dl $7ED8CA : db $02 : dw $0E00 ; Events, Items, Doors
    dw #$FFFF
.after

preset_SZM101_chozodia_pb_speedball:
    dw #preset_SZM101_chozodia_gravity ; Chozodia: Gravity
    dl $7E07F3 : db $02 : dw $000C ; Music Bank
    dl $7E090F : db $02 : dw $4000 ; Screen subpixel X position.
    dl $7E0911 : db $02 : dw $0100 ; Screen X position in pixels
    dl $7E0913 : db $02 : dw $0000 ; Screen subpixel Y position
    dl $7E0915 : db $02 : dw $001D ; Screen Y position in pixels
    dl $7E0917 : db $02 : dw $0100 ; Layer 2 X scroll in room in pixels?
    dl $7E0919 : db $02 : dw $001D ; Layer 2 Y scroll in room in pixels? (up = positive)
    dl $7E09A2 : db $02 : dw $732F ; Equipped Items
    dl $7E09A4 : db $02 : dw $732F ; Collected Items
    dl $7E09A6 : db $02 : dw $1009 ; Beams
    dl $7E09A8 : db $02 : dw $100F ; Beams
    dl $7E09CE : db $02 : dw $0007 ; Pbs
    dl $7E0A1C : db $02 : dw $0001 ; Samus position/state
    dl $7E0A1E : db $02 : dw $0008 ; More position/state
    dl $7E0AF6 : db $02 : dw $01C1 ; Samus X
    dl $7E0AFA : db $02 : dw $008B ; Samus Y
    dl $7ED880 : db $02 : dw $FBFF ; Events, Items, Doors
    dl $7ED91A : db $02 : dw $00E3 ; Events, Items, Doors
    dw #$FFFF
.after

preset_SZM101_chozodia_tricky_chain_spark:
    dw #preset_SZM101_chozodia_pb_speedball ; Chozodia: PB Speedball
    dl $7E078D : db $02 : dw $BC90 ; DDB
    dl $7E078F : db $02 : dw $0003 ; DoorOut Index
    dl $7E079B : db $02 : dw $D72A ; MDB
    dl $7E07C5 : db $02 : dw $43BA ; GFX Pointers
    dl $7E07C7 : db $02 : dw $C2AF ; GFX Pointers
    dl $7E07F5 : db $02 : dw $0005 ; Music Track
    dl $7E090F : db $02 : dw $3000 ; Screen subpixel X position.
    dl $7E0911 : db $02 : dw $0000 ; Screen X position in pixels
    dl $7E0915 : db $02 : dw $0700 ; Screen Y position in pixels
    dl $7E0917 : db $02 : dw $0000 ; Layer 2 X scroll in room in pixels?
    dl $7E0919 : db $02 : dw $0700 ; Layer 2 Y scroll in room in pixels? (up = positive)
    dl $7E0923 : db $02 : dw $F900 ; BG2 Y scroll offset due to room transitions (Translates between Layer 2 scroll and BG2 scroll)
    dl $7E09C2 : db $02 : dw $0104 ; Health
    dl $7E09CE : db $02 : dw $000A ; Pbs
    dl $7E09D0 : db $02 : dw $0014 ; Max pbs
    dl $7E0AF6 : db $02 : dw $0038 ; Samus X
    dl $7E0AFA : db $02 : dw $078B ; Samus Y
    dl $7ED87A : db $02 : dw $40A6 ; Events, Items, Doors
    dl $7ED91A : db $02 : dw $00E4 ; Events, Items, Doors
    dw #$FFFF
.after

preset_SZM101_chozodia_gold_torizo:
    dw #preset_SZM101_chozodia_tricky_chain_spark ; Chozodia: Tricky Chain Spark
    dl $7E078D : db $02 : dw $C1F8 ; DDB
    dl $7E078F : db $02 : dw $0002 ; DoorOut Index
    dl $7E079B : db $02 : dw $8DCC ; MDB
    dl $7E07C5 : db $02 : dw $15BA ; GFX Pointers
    dl $7E07C7 : db $02 : dw $C2B0 ; GFX Pointers
    dl $7E090F : db $02 : dw $7000 ; Screen subpixel X position.
    dl $7E0913 : db $02 : dw $B800 ; Screen subpixel Y position
    dl $7E0915 : db $02 : dw $0000 ; Screen Y position in pixels
    dl $7E0919 : db $02 : dw $0000 ; Layer 2 Y scroll in room in pixels? (up = positive)
    dl $7E0921 : db $02 : dw $FF00 ; BG2 X scroll offset due to room transitions (Translates between Layer 2 scroll and BG2 scroll)
    dl $7E0923 : db $02 : dw $0000 ; BG2 Y scroll offset due to room transitions (Translates between Layer 2 scroll and BG2 scroll)
    dl $7E09A6 : db $02 : dw $100B ; Beams
    dl $7E09C2 : db $02 : dw $0351 ; Health
    dl $7E09C6 : db $02 : dw $007D ; Missiles
    dl $7E09CA : db $02 : dw $0002 ; Supers
    dl $7E09CC : db $02 : dw $001C ; Max supers
    dl $7E0A1C : db $02 : dw $0002 ; Samus position/state
    dl $7E0A1E : db $02 : dw $0004 ; More position/state
    dl $7E0AF6 : db $02 : dw $002C ; Samus X
    dl $7E0AFA : db $02 : dw $00AB ; Samus Y
    dl $7ED876 : db $02 : dw $EB28 ; Events, Items, Doors
    dl $7ED91A : db $02 : dw $00E5 ; Events, Items, Doors
    dw #$FFFF
.after

preset_SZM101_chozodia_reflector_puzzle:
    dw #preset_SZM101_chozodia_gold_torizo ; Chozodia: Gold Torizo
    dl $7E078D : db $02 : dw $A2C4 ; DDB
    dl $7E078F : db $02 : dw $0000 ; DoorOut Index
    dl $7E079B : db $02 : dw $B283 ; MDB
    dl $7E07F3 : db $02 : dw $0024 ; Music Bank
    dl $7E07F5 : db $02 : dw $0003 ; Music Track
    dl $7E090F : db $02 : dw $E000 ; Screen subpixel X position.
    dl $7E0913 : db $02 : dw $1000 ; Screen subpixel Y position
    dl $7E0915 : db $02 : dw $01FC ; Screen Y position in pixels
    dl $7E0919 : db $02 : dw $01FC ; Layer 2 Y scroll in room in pixels? (up = positive)
    dl $7E0921 : db $02 : dw $FE00 ; BG2 X scroll offset due to room transitions (Translates between Layer 2 scroll and BG2 scroll)
    dl $7E0923 : db $02 : dw $FF00 ; BG2 Y scroll offset due to room transitions (Translates between Layer 2 scroll and BG2 scroll)
    dl $7E09C2 : db $02 : dw $02B0 ; Health
    dl $7E09CE : db $02 : dw $000B ; Pbs
    dl $7E09D0 : db $02 : dw $0016 ; Max pbs
    dl $7E0AF6 : db $02 : dw $0024 ; Samus X
    dl $7E0AFA : db $02 : dw $028B ; Samus Y
    dl $7ED82C : db $02 : dw $0006 ; Events, Items, Doors
    dl $7ED87A : db $02 : dw $42A6 ; Events, Items, Doors
    dl $7ED8CA : db $02 : dw $0F00 ; Events, Items, Doors
    dl $7ED91A : db $02 : dw $00E7 ; Events, Items, Doors
    dw #$FFFF
.after

preset_SZM101_chozodia_lost_maze_down:
    dw #preset_SZM101_chozodia_reflector_puzzle ; Chozodia: Reflector Puzzle
    dl $7E078D : db $02 : dw $BD80 ; DDB
    dl $7E078F : db $02 : dw $0002 ; DoorOut Index
    dl $7E079B : db $02 : dw $D1A3 ; MDB
    dl $7E07C5 : db $02 : dw $43BA ; GFX Pointers
    dl $7E07C7 : db $02 : dw $C2AF ; GFX Pointers
    dl $7E07F3 : db $02 : dw $000C ; Music Bank
    dl $7E07F5 : db $02 : dw $0005 ; Music Track
    dl $7E090F : db $02 : dw $E500 ; Screen subpixel X position.
    dl $7E0913 : db $02 : dw $0000 ; Screen subpixel Y position
    dl $7E0915 : db $02 : dw $031B ; Screen Y position in pixels
    dl $7E0919 : db $02 : dw $0254 ; Layer 2 Y scroll in room in pixels? (up = positive)
    dl $7E0921 : db $02 : dw $FC00 ; BG2 X scroll offset due to room transitions (Translates between Layer 2 scroll and BG2 scroll)
    dl $7E0923 : db $02 : dw $0000 ; BG2 Y scroll offset due to room transitions (Translates between Layer 2 scroll and BG2 scroll)
    dl $7E09C2 : db $02 : dw $02E9 ; Health
    dl $7E09C6 : db $02 : dw $0079 ; Missiles
    dl $7E09CE : db $02 : dw $000E ; Pbs
    dl $7E0AF6 : db $02 : dw $0026 ; Samus X
    dl $7E0AFA : db $02 : dw $038B ; Samus Y
    dl $7ED8CE : db $02 : dw $4800 ; Events, Items, Doors
    dw #$FFFF
.after

preset_SZM101_chozodia_big_space_boost:
    dw #preset_SZM101_chozodia_lost_maze_down ; Chozodia: Lost Maze Down
    dl $7E078D : db $02 : dw $A42C ; DDB
    dl $7E078F : db $02 : dw $0000 ; DoorOut Index
    dl $7E079B : db $02 : dw $D845 ; MDB
    dl $7E090F : db $02 : dw $8000 ; Screen subpixel X position.
    dl $7E0911 : db $02 : dw $00E2 ; Screen X position in pixels
    dl $7E0913 : db $02 : dw $7FFF ; Screen subpixel Y position
    dl $7E0915 : db $02 : dw $02ED ; Screen Y position in pixels
    dl $7E0917 : db $02 : dw $00E2 ; Layer 2 X scroll in room in pixels?
    dl $7E0919 : db $02 : dw $02ED ; Layer 2 Y scroll in room in pixels? (up = positive)
    dl $7E0921 : db $02 : dw $FE00 ; BG2 X scroll offset due to room transitions (Translates between Layer 2 scroll and BG2 scroll)
    dl $7E0923 : db $02 : dw $FD00 ; BG2 Y scroll offset due to room transitions (Translates between Layer 2 scroll and BG2 scroll)
    dl $7E09C2 : db $02 : dw $0383 ; Health
    dl $7E09C4 : db $02 : dw $0383 ; Max health
    dl $7E09CE : db $02 : dw $0012 ; Pbs
    dl $7E0AF6 : db $02 : dw $0182 ; Samus X
    dl $7E0AFA : db $02 : dw $036B ; Samus Y
    dl $7ED87E : db $02 : dw $580F ; Events, Items, Doors
    dl $7ED91A : db $02 : dw $00E8 ; Events, Items, Doors
    dw #$FFFF
.after

preset_SZM101_tourian_kihunter_elevator:
    dw #preset_SZM101_chozodia_big_space_boost ; Chozodia: Big Space Boost
    dl $7E078D : db $02 : dw $90BA ; DDB
    dl $7E078F : db $02 : dw $0002 ; DoorOut Index
    dl $7E079B : db $02 : dw $962A ; MDB
    dl $7E079F : db $02 : dw $0000 ; Region
    dl $7E07F3 : db $02 : dw $000F ; Music Bank
    dl $7E07F5 : db $02 : dw $0003 ; Music Track
    dl $7E090F : db $02 : dw $5000 ; Screen subpixel X position.
    dl $7E0911 : db $02 : dw $0000 ; Screen X position in pixels
    dl $7E0913 : db $02 : dw $5400 ; Screen subpixel Y position
    dl $7E0915 : db $02 : dw $0000 ; Screen Y position in pixels
    dl $7E0917 : db $02 : dw $0000 ; Layer 2 X scroll in room in pixels?
    dl $7E0919 : db $02 : dw $0000 ; Layer 2 Y scroll in room in pixels? (up = positive)
    dl $7E0921 : db $02 : dw $0000 ; BG2 X scroll offset due to room transitions (Translates between Layer 2 scroll and BG2 scroll)
    dl $7E0923 : db $02 : dw $FF00 ; BG2 Y scroll offset due to room transitions (Translates between Layer 2 scroll and BG2 scroll)
    dl $7E09C2 : db $02 : dw $0381 ; Health
    dl $7E0AF6 : db $02 : dw $007F ; Samus X
    dl $7E0AFA : db $02 : dw $005B ; Samus Y
    dl $7ED91A : db $02 : dw $00E9 ; Events, Items, Doors
    dw #$FFFF
.after

preset_SZM101_tourian_pancake_missiles:
    dw #preset_SZM101_tourian_kihunter_elevator ; Tourian: Kihunter Elevator
    dl $7E078D : db $02 : dw $B3F8 ; DDB
    dl $7E079B : db $02 : dw $9552 ; MDB
    dl $7E07F3 : db $02 : dw $0009 ; Music Bank
    dl $7E07F5 : db $02 : dw $0006 ; Music Track
    dl $7E090F : db $02 : dw $A000 ; Screen subpixel X position.
    dl $7E0913 : db $02 : dw $0000 ; Screen subpixel Y position
    dl $7E0921 : db $02 : dw $0100 ; BG2 X scroll offset due to room transitions (Translates between Layer 2 scroll and BG2 scroll)
    dl $7E0923 : db $02 : dw $0000 ; BG2 Y scroll offset due to room transitions (Translates between Layer 2 scroll and BG2 scroll)
    dl $7E09C2 : db $02 : dw $0383 ; Health
    dl $7E09CE : db $02 : dw $0014 ; Pbs
    dl $7E09D6 : db $02 : dw $0030 ; Reserves
    dl $7E0AF6 : db $02 : dw $0035 ; Samus X
    dl $7E0AFA : db $02 : dw $008B ; Samus Y
    dl $7ED91A : db $02 : dw $00EA ; Events, Items, Doors
    dw #$FFFF
.after

preset_SZM101_tourian_landing_site_spark:
    dw #preset_SZM101_tourian_pancake_missiles ; Tourian: Pancake Missiles
    dl $7E078D : db $02 : dw $BF8C ; DDB
    dl $7E079B : db $02 : dw $91F8 ; MDB
    dl $7E07C3 : db $02 : dw $C629 ; GFX Pointers
    dl $7E07C5 : db $02 : dw $7CBA ; GFX Pointers
    dl $7E07C7 : db $02 : dw $C2AD ; GFX Pointers
    dl $7E07F3 : db $02 : dw $0006 ; Music Bank
    dl $7E07F5 : db $02 : dw $0007 ; Music Track
    dl $7E090F : db $02 : dw $0000 ; Screen subpixel X position.
    dl $7E0911 : db $02 : dw $07A1 ; Screen X position in pixels
    dl $7E0913 : db $02 : dw $1800 ; Screen subpixel Y position
    dl $7E0915 : db $02 : dw $0123 ; Screen Y position in pixels
    dl $7E0917 : db $02 : dw $05B8 ; Layer 2 X scroll in room in pixels?
    dl $7E0919 : db $02 : dw $00DA ; Layer 2 Y scroll in room in pixels? (up = positive)
    dl $7E0921 : db $02 : dw $F700 ; BG2 X scroll offset due to room transitions (Translates between Layer 2 scroll and BG2 scroll)
    dl $7E0923 : db $02 : dw $FF00 ; BG2 Y scroll offset due to room transitions (Translates between Layer 2 scroll and BG2 scroll)
    dl $7E09C6 : db $02 : dw $0085 ; Missiles
    dl $7E09C8 : db $02 : dw $0087 ; Max missiles
    dl $7E09CA : db $02 : dw $000E ; Supers
    dl $7E09D6 : db $02 : dw $0073 ; Reserves
    dl $7E0A68 : db $02 : dw $0096 ; Flash suit
    dl $7E0AF6 : db $02 : dw $0841 ; Samus X
    dl $7E0AFA : db $02 : dw $01BB ; Samus Y
    dl $7ED870 : db $02 : dw $17C6 ; Events, Items, Doors
    dl $7ED91A : db $02 : dw $00F8 ; Events, Items, Doors
    dw #$FFFF
.after

preset_SZM101_tourian_morph_room:
    dw #preset_SZM101_tourian_landing_site_spark ; Tourian: Landing Site Spark
    dl $7E078D : db $02 : dw $B1B8 ; DDB
    dl $7E078F : db $02 : dw $0000 ; DoorOut Index
    dl $7E079B : db $02 : dw $8190 ; MDB
    dl $7E079F : db $02 : dw $0001 ; Region
    dl $7E07C3 : db $02 : dw $E6B0 ; GFX Pointers
    dl $7E07C5 : db $02 : dw $64BB ; GFX Pointers
    dl $7E07C7 : db $02 : dw $C2B2 ; GFX Pointers
    dl $7E07F3 : db $02 : dw $000F ; Music Bank
    dl $7E07F5 : db $02 : dw $0005 ; Music Track
    dl $7E0911 : db $02 : dw $02E5 ; Screen X position in pixels
    dl $7E0913 : db $02 : dw $87FF ; Screen subpixel Y position
    dl $7E0915 : db $02 : dw $0200 ; Screen Y position in pixels
    dl $7E0917 : db $02 : dw $02E5 ; Layer 2 X scroll in room in pixels?
    dl $7E0919 : db $02 : dw $0200 ; Layer 2 Y scroll in room in pixels? (up = positive)
    dl $7E0921 : db $02 : dw $FA00 ; BG2 X scroll offset due to room transitions (Translates between Layer 2 scroll and BG2 scroll)
    dl $7E0923 : db $02 : dw $FE00 ; BG2 Y scroll offset due to room transitions (Translates between Layer 2 scroll and BG2 scroll)
    dl $7E09C6 : db $02 : dw $008C ; Missiles
    dl $7E09C8 : db $02 : dw $008C ; Max missiles
    dl $7E09CA : db $02 : dw $000E ; Supers
    dl $7E09CE : db $02 : dw $0018 ; Pbs
    dl $7E09D0 : db $02 : dw $0018 ; Max pbs
    dl $7E09D6 : db $02 : dw $00C8 ; Reserves
    dl $7E0A68 : db $02 : dw $0000 ; Flash suit
    dl $7E0AF6 : db $02 : dw $0385 ; Samus X
    dl $7E0AFA : db $02 : dw $02AB ; Samus Y
    dl $7ED870 : db $02 : dw $17C7 ; Events, Items, Doors
    dl $7ED878 : db $02 : dw $DF3B ; Events, Items, Doors
    dl $7ED8C2 : db $02 : dw $50E2 ; Events, Items, Doors
    dl $7ED91A : db $02 : dw $0105 ; Events, Items, Doors
    dw #$FFFF
.after

preset_SZM101_tourian_ninja_pirate_fall:
    dw #preset_SZM101_tourian_morph_room ; Tourian: Morph Room
    dl $7E078D : db $02 : dw $91C2 ; DDB
    dl $7E078F : db $02 : dw $0002 ; DoorOut Index
    dl $7E079B : db $02 : dw $DC65 ; MDB
    dl $7E079F : db $02 : dw $0005 ; Region
    dl $7E07C3 : db $02 : dw $F300 ; GFX Pointers
    dl $7E07C5 : db $02 : dw $EDE4 ; GFX Pointers
    dl $7E07C7 : db $02 : dw $C2BA ; GFX Pointers
    dl $7E07F3 : db $02 : dw $001E ; Music Bank
    dl $7E090F : db $02 : dw $A000 ; Screen subpixel X position.
    dl $7E0911 : db $02 : dw $0100 ; Screen X position in pixels
    dl $7E0913 : db $02 : dw $EBFF ; Screen subpixel Y position
    dl $7E0915 : db $02 : dw $0400 ; Screen Y position in pixels
    dl $7E0917 : db $02 : dw $0100 ; Layer 2 X scroll in room in pixels?
    dl $7E0919 : db $02 : dw $0400 ; Layer 2 Y scroll in room in pixels? (up = positive)
    dl $7E0921 : db $02 : dw $FE00 ; BG2 X scroll offset due to room transitions (Translates between Layer 2 scroll and BG2 scroll)
    dl $7E0923 : db $02 : dw $0000 ; BG2 Y scroll offset due to room transitions (Translates between Layer 2 scroll and BG2 scroll)
    dl $7E09C2 : db $02 : dw $034A ; Health
    dl $7E09CA : db $02 : dw $0004 ; Supers
    dl $7E0AF6 : db $02 : dw $0139 ; Samus X
    dl $7E0AFA : db $02 : dw $048B ; Samus Y
    dl $7ED87A : db $02 : dw $4286 ; Events, Items, Doors
    dl $7ED88E : db $02 : dw $0001 ; Events, Items, Doors
    dl $7ED890 : db $02 : dw $0001 ; Events, Items, Doors
    dl $7ED8C8 : db $02 : dw $0181 ; Events, Items, Doors
    dw #$FFFF
.after

preset_SZM101_tourian_xray:
    dw #preset_SZM101_tourian_ninja_pirate_fall ; Tourian: Ninja Pirate Fall
    dl $7E078D : db $02 : dw $AA14 ; DDB
    dl $7E078F : db $02 : dw $0001 ; DoorOut Index
    dl $7E079B : db $02 : dw $DBCD ; MDB
    dl $7E090F : db $02 : dw $5000 ; Screen subpixel X position.
    dl $7E0911 : db $02 : dw $0000 ; Screen X position in pixels
    dl $7E0913 : db $02 : dw $F400 ; Screen subpixel Y position
    dl $7E0915 : db $02 : dw $0200 ; Screen Y position in pixels
    dl $7E0917 : db $02 : dw $0000 ; Layer 2 X scroll in room in pixels?
    dl $7E0919 : db $02 : dw $0200 ; Layer 2 Y scroll in room in pixels? (up = positive)
    dl $7E0921 : db $02 : dw $0100 ; BG2 X scroll offset due to room transitions (Translates between Layer 2 scroll and BG2 scroll)
    dl $7E09C2 : db $02 : dw $036A ; Health
    dl $7E09CA : db $02 : dw $0006 ; Supers
    dl $7E09CE : db $02 : dw $0017 ; Pbs
    dl $7E0A1C : db $02 : dw $0001 ; Samus position/state
    dl $7E0A1E : db $02 : dw $0008 ; More position/state
    dl $7E0AF6 : db $02 : dw $00BE ; Samus X
    dl $7E0AFA : db $02 : dw $028B ; Samus Y
    dl $7ED848 : db $02 : dw $0100 ; Events, Items, Doors
    dl $7ED8C8 : db $02 : dw $03F1 ; Events, Items, Doors
    dw #$FFFF
.after

preset_SZM101_tourian_xray_standup_clip:
    dw #preset_SZM101_tourian_xray ; Tourian: Xray
    dl $7E078D : db $02 : dw $B4D4 ; DDB
    dl $7E078F : db $02 : dw $0002 ; DoorOut Index
    dl $7E079B : db $02 : dw $CBD5 ; MDB
    dl $7E090F : db $02 : dw $A000 ; Screen subpixel X position.
    dl $7E0913 : db $02 : dw $D000 ; Screen subpixel Y position
    dl $7E0915 : db $02 : dw $0047 ; Screen Y position in pixels
    dl $7E0919 : db $02 : dw $0035 ; Layer 2 Y scroll in room in pixels? (up = positive)
    dl $7E09A2 : db $02 : dw $F32F ; Equipped Items
    dl $7E09A4 : db $02 : dw $F32F ; Collected Items
    dl $7E09C2 : db $02 : dw $03B5 ; Health
    dl $7E09C4 : db $02 : dw $03B5 ; Max health
    dl $7E09CA : db $02 : dw $000A ; Supers
    dl $7E09CE : db $02 : dw $001A ; Pbs
    dl $7E09D0 : db $02 : dw $001A ; Max pbs
    dl $7E0A1C : db $02 : dw $0002 ; Samus position/state
    dl $7E0A1E : db $02 : dw $0004 ; More position/state
    dl $7E0AF6 : db $02 : dw $0039 ; Samus X
    dl $7E0AFA : db $02 : dw $00BB ; Samus Y
    dl $7ED84A : db $02 : dw $0100 ; Events, Items, Doors
    dl $7ED87A : db $02 : dw $42A6 ; Events, Items, Doors
    dl $7ED87E : db $02 : dw $581F ; Events, Items, Doors
    dl $7ED880 : db $02 : dw $FFFF ; Events, Items, Doors
    dl $7ED91A : db $02 : dw $0112 ; Events, Items, Doors
    dw #$FFFF
.after

preset_SZM101_tourian_blind_speedkeep:
    dw #preset_SZM101_tourian_xray_standup_clip ; Tourian: Xray Standup Clip
    dl $7E078D : db $02 : dw $9A56 ; DDB
    dl $7E078F : db $02 : dw $0001 ; DoorOut Index
    dl $7E079B : db $02 : dw $DB31 ; MDB
    dl $7E090F : db $02 : dw $0000 ; Screen subpixel X position.
    dl $7E0913 : db $02 : dw $63FF ; Screen subpixel Y position
    dl $7E0915 : db $02 : dw $0200 ; Screen Y position in pixels
    dl $7E0919 : db $02 : dw $0200 ; Layer 2 Y scroll in room in pixels? (up = positive)
    dl $7E09C2 : db $02 : dw $038D ; Health
    dl $7E09CE : db $02 : dw $001B ; Pbs
    dl $7E09D0 : db $02 : dw $001E ; Max pbs
    dl $7E0A1C : db $02 : dw $0001 ; Samus position/state
    dl $7E0A1E : db $02 : dw $0008 ; More position/state
    dl $7E0AF6 : db $02 : dw $00C3 ; Samus X
    dl $7E0AFA : db $02 : dw $028B ; Samus Y
    dl $7ED87A : db $02 : dw $42EE ; Events, Items, Doors
    dl $7ED90C : db $02 : dw $0100 ; Events, Items, Doors
    dl $7ED91A : db $02 : dw $0115 ; Events, Items, Doors
    dw #$FFFF
.after

preset_SZM101_tourian_metroids:
    dw #preset_SZM101_tourian_blind_speedkeep ; Tourian: Blind Speedkeep
    dl $7E078D : db $02 : dw $B4D4 ; DDB
    dl $7E078F : db $02 : dw $0002 ; DoorOut Index
    dl $7E079B : db $02 : dw $CBD5 ; MDB
    dl $7E090F : db $02 : dw $B001 ; Screen subpixel X position.
    dl $7E0913 : db $02 : dw $1BFF ; Screen subpixel Y position
    dl $7E0915 : db $02 : dw $01FE ; Screen Y position in pixels
    dl $7E0919 : db $02 : dw $017E ; Layer 2 Y scroll in room in pixels? (up = positive)
    dl $7E09C2 : db $02 : dw $039C ; Health
    dl $7E09C6 : db $02 : dw $0091 ; Missiles
    dl $7E09C8 : db $02 : dw $0091 ; Max missiles
    dl $7E09CA : db $02 : dw $000B ; Supers
    dl $7E09CC : db $02 : dw $001E ; Max supers
    dl $7E0A1C : db $02 : dw $0002 ; Samus position/state
    dl $7E0A1E : db $02 : dw $0004 ; More position/state
    dl $7E0AF6 : db $02 : dw $0028 ; Samus X
    dl $7ED874 : db $02 : dw $41EF ; Events, Items, Doors
    dl $7ED878 : db $02 : dw $DF7B ; Events, Items, Doors
    dl $7ED91A : db $02 : dw $0117 ; Events, Items, Doors
    dw #$FFFF
.after

preset_SZM101_tourian_mother_brain:
    dw #preset_SZM101_tourian_metroids ; Tourian: Metroids
    dl $7E078D : db $02 : dw $A9CC ; DDB
    dl $7E078F : db $02 : dw $0001 ; DoorOut Index
    dl $7E079B : db $02 : dw $CAAE ; MDB
    dl $7E090F : db $02 : dw $4000 ; Screen subpixel X position.
    dl $7E0913 : db $02 : dw $6400 ; Screen subpixel Y position
    dl $7E0915 : db $02 : dw $0000 ; Screen Y position in pixels
    dl $7E0919 : db $02 : dw $0000 ; Layer 2 Y scroll in room in pixels? (up = positive)
    dl $7E0921 : db $02 : dw $FC00 ; BG2 X scroll offset due to room transitions (Translates between Layer 2 scroll and BG2 scroll)
    dl $7E09C2 : db $02 : dw $03B5 ; Health
    dl $7E09CA : db $02 : dw $001E ; Supers
    dl $7E09CE : db $02 : dw $001E ; Pbs
    dl $7E0AF6 : db $02 : dw $0039 ; Samus X
    dl $7E0AFA : db $02 : dw $00AB ; Samus Y
    dl $7ED8C6 : db $02 : dw $57F4 ; Events, Items, Doors
    dw #$FFFF
.after

preset_SZM101_tourian_elevator_breakdown:
    dw #preset_SZM101_tourian_mother_brain ; Tourian: Mother Brain
    dl $7E078D : db $02 : dw $B588 ; DDB
    dl $7E078F : db $02 : dw $0005 ; DoorOut Index
    dl $7E079B : db $02 : dw $8320 ; MDB
    dl $7E07F3 : db $02 : dw $0024 ; Music Bank
    dl $7E07F5 : db $02 : dw $0007 ; Music Track
    dl $7E0913 : db $02 : dw $0000 ; Screen subpixel Y position
    dl $7E0915 : db $02 : dw $001F ; Screen Y position in pixels
    dl $7E0919 : db $02 : dw $001F ; Layer 2 Y scroll in room in pixels? (up = positive)
    dl $7E0921 : db $02 : dw $0000 ; BG2 X scroll offset due to room transitions (Translates between Layer 2 scroll and BG2 scroll)
    dl $7E0923 : db $02 : dw $FF00 ; BG2 Y scroll offset due to room transitions (Translates between Layer 2 scroll and BG2 scroll)
    dl $7E09C2 : db $02 : dw $0312 ; Health
    dl $7E09C6 : db $02 : dw $003A ; Missiles
    dl $7E09CA : db $02 : dw $0017 ; Supers
    dl $7E0A1C : db $02 : dw $009B ; Samus position/state
    dl $7E0A1E : db $02 : dw $0000 ; More position/state
    dl $7E0AF6 : db $02 : dw $0080 ; Samus X
    dl $7E0AFA : db $02 : dw $00A9 ; Samus Y
    dl $7ED820 : db $02 : dw $4125 ; Events, Items, Doors
    dl $7ED8CC : db $02 : dw $0003 ; Events, Items, Doors
    dl $7ED90C : db $02 : dw $FF00 ; Events, Items, Doors
    dw #$FFFF
.after

preset_SZM101_tourian_back_of_gauntlet_missiles:
    dw #preset_SZM101_tourian_elevator_breakdown ; Tourian: Elevator Breakdown
    dl $7E078D : db $02 : dw $B5B0 ; DDB
    dl $7E078F : db $02 : dw $0000 ; DoorOut Index
    dl $7E079B : db $02 : dw $92B3 ; MDB
    dl $7E079F : db $02 : dw $0000 ; Region
    dl $7E07C3 : db $02 : dw $D414 ; GFX Pointers
    dl $7E07C5 : db $02 : dw $C1BF ; GFX Pointers
    dl $7E07C7 : db $02 : dw $C2BB ; GFX Pointers
    dl $7E090F : db $02 : dw $A000 ; Screen subpixel X position.
    dl $7E0913 : db $02 : dw $9C00 ; Screen subpixel Y position
    dl $7E0915 : db $02 : dw $0000 ; Screen Y position in pixels
    dl $7E0919 : db $02 : dw $0000 ; Layer 2 Y scroll in room in pixels? (up = positive)
    dl $7E0921 : db $02 : dw $FB00 ; BG2 X scroll offset due to room transitions (Translates between Layer 2 scroll and BG2 scroll)
    dl $7E0923 : db $02 : dw $0000 ; BG2 Y scroll offset due to room transitions (Translates between Layer 2 scroll and BG2 scroll)
    dl $7E09C2 : db $02 : dw $03E7 ; Health
    dl $7E09C4 : db $02 : dw $03E7 ; Max health
    dl $7E09C6 : db $02 : dw $0039 ; Missiles
    dl $7E09CA : db $02 : dw $0016 ; Supers
    dl $7E09CE : db $02 : dw $001C ; Pbs
    dl $7E0A1C : db $02 : dw $0002 ; Samus position/state
    dl $7E0A1E : db $02 : dw $0004 ; More position/state
    dl $7E0A68 : db $02 : dw $0081 ; Flash suit
    dl $7E0AF6 : db $02 : dw $002E ; Samus X
    dl $7E0AFA : db $02 : dw $008B ; Samus Y
    dl $7ED87E : db $02 : dw $5C1F ; Events, Items, Doors
    dl $7ED91A : db $02 : dw $0118 ; Events, Items, Doors
    dw #$FFFF
.after

preset_SZM101_tourian_parlor:
    dw #preset_SZM101_tourian_back_of_gauntlet_missiles ; Tourian: Back Of Gauntlet Missiles
    dl $7E078D : db $02 : dw $8EF2 ; DDB
    dl $7E078F : db $02 : dw $0001 ; DoorOut Index
    dl $7E079B : db $02 : dw $92FD ; MDB
    dl $7E07C3 : db $02 : dw $C629 ; GFX Pointers
    dl $7E07C5 : db $02 : dw $7CBA ; GFX Pointers
    dl $7E07C7 : db $02 : dw $C2AD ; GFX Pointers
    dl $7E07F3 : db $02 : dw $0006 ; Music Bank
    dl $7E090F : db $02 : dw $0000 ; Screen subpixel X position.
    dl $7E0911 : db $02 : dw $0032 ; Screen X position in pixels
    dl $7E0913 : db $02 : dw $0000 ; Screen subpixel Y position
    dl $7E0915 : db $02 : dw $0100 ; Screen Y position in pixels
    dl $7E0917 : db $02 : dw $0025 ; Layer 2 X scroll in room in pixels?
    dl $7E0919 : db $02 : dw $00C0 ; Layer 2 Y scroll in room in pixels? (up = positive)
    dl $7E0921 : db $02 : dw $0100 ; BG2 X scroll offset due to room transitions (Translates between Layer 2 scroll and BG2 scroll)
    dl $7E0923 : db $02 : dw $FF00 ; BG2 Y scroll offset due to room transitions (Translates between Layer 2 scroll and BG2 scroll)
    dl $7E09C2 : db $02 : dw $0419 ; Health
    dl $7E09C4 : db $02 : dw $0419 ; Max health
    dl $7E09C6 : db $02 : dw $0043 ; Missiles
    dl $7E09C8 : db $02 : dw $009B ; Max missiles
    dl $7E09CA : db $02 : dw $0015 ; Supers
    dl $7E0A1C : db $02 : dw $0001 ; Samus position/state
    dl $7E0A1E : db $02 : dw $0008 ; More position/state
    dl $7E0A68 : db $02 : dw $00BC ; Flash suit
    dl $7E0AF6 : db $02 : dw $0092 ; Samus X
    dl $7E0AFA : db $02 : dw $0189 ; Samus Y
    dl $7ED820 : db $02 : dw $0125 ; Events, Items, Doors
    dl $7ED828 : db $02 : dw $0005 ; Events, Items, Doors
    dl $7ED870 : db $02 : dw $17DF ; Events, Items, Doors
    dl $7ED87C : db $02 : dw $E77E ; Events, Items, Doors
    dl $7ED91A : db $02 : dw $011D ; Events, Items, Doors
    dw #$FFFF
.after

preset_SZM101_tourian_parlor_fall:
    dw #preset_SZM101_tourian_parlor ; Tourian: Parlor
    dl $7E078D : db $02 : dw $B4B0 ; DDB
    dl $7E078F : db $02 : dw $0004 ; DoorOut Index
    dl $7E0911 : db $02 : dw $0100 ; Screen X position in pixels
    dl $7E0913 : db $02 : dw $0800 ; Screen subpixel Y position
    dl $7E0915 : db $02 : dw $0199 ; Screen Y position in pixels
    dl $7E0917 : db $02 : dw $00C0 ; Layer 2 X scroll in room in pixels?
    dl $7E0919 : db $02 : dw $0132 ; Layer 2 Y scroll in room in pixels? (up = positive)
    dl $7E0921 : db $02 : dw $FB00 ; BG2 X scroll offset due to room transitions (Translates between Layer 2 scroll and BG2 scroll)
    dl $7E09CE : db $02 : dw $001D ; Pbs
    dl $7E09D0 : db $02 : dw $0020 ; Max pbs
    dl $7E0A1C : db $02 : dw $007A ; Samus position/state
    dl $7E0A1E : db $02 : dw $1104 ; More position/state
    dl $7E0A68 : db $02 : dw $0000 ; Flash suit
    dl $7E0AF6 : db $02 : dw $0179 ; Samus X
    dl $7E0AFA : db $02 : dw $0209 ; Samus Y
    dl $7ED840 : db $02 : dw $0100 ; Events, Items, Doors
    dl $7ED878 : db $02 : dw $DFFB ; Events, Items, Doors
    dl $7ED91A : db $02 : dw $0120 ; Events, Items, Doors
    dw #$FFFF
.after

preset_SZM101_tourian_phantoon:
    dw #preset_SZM101_tourian_parlor_fall ; Tourian: Parlor Fall
    dl $7E078D : db $02 : dw $B5E8 ; DDB
    dl $7E078F : db $02 : dw $0003 ; DoorOut Index
    dl $7E079B : db $02 : dw $96BA ; MDB
    dl $7E079F : db $02 : dw $0005 ; Region
    dl $7E07C3 : db $02 : dw $B004 ; GFX Pointers
    dl $7E07C5 : db $02 : dw $E3C0 ; GFX Pointers
    dl $7E07C7 : db $02 : dw $C2C1 ; GFX Pointers
    dl $7E090F : db $02 : dw $9000 ; Screen subpixel X position.
    dl $7E0913 : db $02 : dw $5000 ; Screen subpixel Y position
    dl $7E0915 : db $02 : dw $0A00 ; Screen Y position in pixels
    dl $7E0917 : db $02 : dw $0100 ; Layer 2 X scroll in room in pixels?
    dl $7E0919 : db $02 : dw $0A00 ; Layer 2 Y scroll in room in pixels? (up = positive)
    dl $7E0921 : db $02 : dw $FF00 ; BG2 X scroll offset due to room transitions (Translates between Layer 2 scroll and BG2 scroll)
    dl $7E0923 : db $02 : dw $00E0 ; BG2 Y scroll offset due to room transitions (Translates between Layer 2 scroll and BG2 scroll)
    dl $7E09CA : db $02 : dw $0014 ; Supers
    dl $7E0A1C : db $02 : dw $0001 ; Samus position/state
    dl $7E0A1E : db $02 : dw $0008 ; More position/state
    dl $7E0AF6 : db $02 : dw $01D0 ; Samus X
    dl $7E0AFA : db $02 : dw $0A8B ; Samus Y
    dl $7ED8CE : db $02 : dw $4810 ; Events, Items, Doors
    dw #$FFFF
.after

preset_SZM101_tourian_ninja_pirates:
    dw #preset_SZM101_tourian_phantoon ; Tourian: Phantoon
    dl $7E078D : db $02 : dw $A264 ; DDB
    dl $7E078F : db $02 : dw $0000 ; DoorOut Index
    dl $7E079B : db $02 : dw $DEA7 ; MDB
    dl $7E07C3 : db $02 : dw $F300 ; GFX Pointers
    dl $7E07C5 : db $02 : dw $EDE4 ; GFX Pointers
    dl $7E07C7 : db $02 : dw $C2BA ; GFX Pointers
    dl $7E07F3 : db $02 : dw $001E ; Music Bank
    dl $7E07F5 : db $02 : dw $0005 ; Music Track
    dl $7E090F : db $02 : dw $7000 ; Screen subpixel X position.
    dl $7E0911 : db $02 : dw $0000 ; Screen X position in pixels
    dl $7E0913 : db $02 : dw $0000 ; Screen subpixel Y position
    dl $7E0915 : db $02 : dw $00FD ; Screen Y position in pixels
    dl $7E0917 : db $02 : dw $0000 ; Layer 2 X scroll in room in pixels?
    dl $7E0919 : db $02 : dw $00BD ; Layer 2 Y scroll in room in pixels? (up = positive)
    dl $7E0921 : db $02 : dw $FA00 ; BG2 X scroll offset due to room transitions (Translates between Layer 2 scroll and BG2 scroll)
    dl $7E0923 : db $02 : dw $0000 ; BG2 Y scroll offset due to room transitions (Translates between Layer 2 scroll and BG2 scroll)
    dl $7E09A2 : db $02 : dw $F30F ; Equipped Items
    dl $7E09C2 : db $02 : dw $00EE ; Health
    dl $7E09C6 : db $02 : dw $0049 ; Missiles
    dl $7E09CA : db $02 : dw $0016 ; Supers
    dl $7E09CE : db $02 : dw $0020 ; Pbs
    dl $7E09D6 : db $02 : dw $0000 ; Reserves
    dl $7E0A1C : db $02 : dw $0002 ; Samus position/state
    dl $7E0A1E : db $02 : dw $0004 ; More position/state
    dl $7E0A68 : db $02 : dw $0001 ; Flash suit
    dl $7E0AF6 : db $02 : dw $0079 ; Samus X
    dl $7E0AFA : db $02 : dw $016B ; Samus Y
    dl $7ED82C : db $02 : dw $0106 ; Events, Items, Doors
    dl $7ED8C2 : db $02 : dw $50F2 ; Events, Items, Doors
    dl $7ED8C8 : db $02 : dw $03F3 ; Events, Items, Doors
    dl $7ED8CE : db $02 : dw $4910 ; Events, Items, Doors
    dw #$FFFF
.after

preset_SZM101_tourian_vault_missile:
    dw #preset_SZM101_tourian_ninja_pirates ; Tourian: Ninja Pirates
    dl $7E078D : db $02 : dw $AAF8 ; DDB
    dl $7E079B : db $02 : dw $DE4D ; MDB
    dl $7E090F : db $02 : dw $3FFF ; Screen subpixel X position.
    dl $7E0911 : db $02 : dw $0200 ; Screen X position in pixels
    dl $7E0913 : db $02 : dw $E800 ; Screen subpixel Y position
    dl $7E0915 : db $02 : dw $0000 ; Screen Y position in pixels
    dl $7E0917 : db $02 : dw $0180 ; Layer 2 X scroll in room in pixels?
    dl $7E0919 : db $02 : dw $0000 ; Layer 2 Y scroll in room in pixels? (up = positive)
    dl $7E0921 : db $02 : dw $0000 ; BG2 X scroll offset due to room transitions (Translates between Layer 2 scroll and BG2 scroll)
    dl $7E0923 : db $02 : dw $FF00 ; BG2 Y scroll offset due to room transitions (Translates between Layer 2 scroll and BG2 scroll)
    dl $7E09CA : db $02 : dw $0015 ; Supers
    dl $7E0A68 : db $02 : dw $0000 ; Flash suit
    dl $7E0AF6 : db $02 : dw $02D0 ; Samus X
    dl $7E0AFA : db $02 : dw $008B ; Samus Y
    dl $7ED8C8 : db $02 : dw $03F7 ; Events, Items, Doors
    dw #$FFFF
.after

preset_SZM101_tourian_ninja_pirate_room:
    dw #preset_SZM101_tourian_vault_missile ; Tourian: Vault Missile
    dl $7E078D : db $02 : dw $A48C ; DDB
    dl $7E090F : db $02 : dw $0000 ; Screen subpixel X position.
    dl $7E0911 : db $02 : dw $000B ; Screen X position in pixels
    dl $7E0913 : db $02 : dw $F800 ; Screen subpixel Y position
    dl $7E0915 : db $02 : dw $001F ; Screen Y position in pixels
    dl $7E0917 : db $02 : dw $0008 ; Layer 2 X scroll in room in pixels?
    dl $7E0919 : db $02 : dw $0017 ; Layer 2 Y scroll in room in pixels? (up = positive)
    dl $7E0921 : db $02 : dw $FD00 ; BG2 X scroll offset due to room transitions (Translates between Layer 2 scroll and BG2 scroll)
    dl $7E0923 : db $02 : dw $0000 ; BG2 Y scroll offset due to room transitions (Translates between Layer 2 scroll and BG2 scroll)
    dl $7E09A2 : db $02 : dw $F32F ; Equipped Items
    dl $7E09C2 : db $02 : dw $040A ; Health
    dl $7E09C6 : db $02 : dw $0042 ; Missiles
    dl $7E09C8 : db $02 : dw $00A0 ; Max missiles
    dl $7E09CA : db $02 : dw $000F ; Supers
    dl $7E09CE : db $02 : dw $0015 ; Pbs
    dl $7E09D6 : db $02 : dw $00C8 ; Reserves
    dl $7E0AF6 : db $02 : dw $00AB ; Samus X
    dl $7ED872 : db $02 : dw $E9FF ; Events, Items, Doors
    dl $7ED8CE : db $02 : dw $5910 ; Events, Items, Doors
    dl $7ED91A : db $02 : dw $0122 ; Events, Items, Doors
    dw #$FFFF
.after

preset_SZM101_tourian_under_mb_speedkeep:
    dw #preset_SZM101_tourian_ninja_pirate_room ; Tourian: Ninja Pirate Room
    dl $7E078D : db $02 : dw $AB1C ; DDB
    dl $7E078F : db $02 : dw $0001 ; DoorOut Index
    dl $7E079B : db $02 : dw $DEDE ; MDB
    dl $7E090F : db $02 : dw $A000 ; Screen subpixel X position.
    dl $7E0911 : db $02 : dw $00ED ; Screen X position in pixels
    dl $7E0913 : db $02 : dw $CC00 ; Screen subpixel Y position
    dl $7E0915 : db $02 : dw $0117 ; Screen Y position in pixels
    dl $7E0917 : db $02 : dw $00B1 ; Layer 2 X scroll in room in pixels?
    dl $7E0919 : db $02 : dw $00D1 ; Layer 2 Y scroll in room in pixels? (up = positive)
    dl $7E0921 : db $02 : dw $0100 ; BG2 X scroll offset due to room transitions (Translates between Layer 2 scroll and BG2 scroll)
    dl $7E0923 : db $02 : dw $FD00 ; BG2 Y scroll offset due to room transitions (Translates between Layer 2 scroll and BG2 scroll)
    dl $7E09C6 : db $02 : dw $0044 ; Missiles
    dl $7E0A1C : db $02 : dw $0001 ; Samus position/state
    dl $7E0A1E : db $02 : dw $0008 ; More position/state
    dl $7E0AF6 : db $02 : dw $0153 ; Samus X
    dl $7E0AFA : db $02 : dw $018B ; Samus Y
    dw #$FFFF
.after

preset_SZM101_tourian_metroids_forward:
    dw #preset_SZM101_tourian_under_mb_speedkeep ; Tourian: Under MB speedkeep
    dl $7E078D : db $02 : dw $BE40 ; DDB
    dl $7E078F : db $02 : dw $0000 ; DoorOut Index
    dl $7E079B : db $02 : dw $96BA ; MDB
    dl $7E07C3 : db $02 : dw $B004 ; GFX Pointers
    dl $7E07C5 : db $02 : dw $E3C0 ; GFX Pointers
    dl $7E07C7 : db $02 : dw $C2C1 ; GFX Pointers
    dl $7E07F3 : db $02 : dw $0006 ; Music Bank
    dl $7E07F5 : db $02 : dw $0007 ; Music Track
    dl $7E090F : db $02 : dw $3E00 ; Screen subpixel X position.
    dl $7E0911 : db $02 : dw $0200 ; Screen X position in pixels
    dl $7E0913 : db $02 : dw $9C00 ; Screen subpixel Y position
    dl $7E0915 : db $02 : dw $0900 ; Screen Y position in pixels
    dl $7E0917 : db $02 : dw $0200 ; Layer 2 X scroll in room in pixels?
    dl $7E0919 : db $02 : dw $0900 ; Layer 2 Y scroll in room in pixels? (up = positive)
    dl $7E0921 : db $02 : dw $FE00 ; BG2 X scroll offset due to room transitions (Translates between Layer 2 scroll and BG2 scroll)
    dl $7E0923 : db $02 : dw $F600 ; BG2 Y scroll offset due to room transitions (Translates between Layer 2 scroll and BG2 scroll)
    dl $7E09C2 : db $02 : dw $03A6 ; Health
    dl $7E09CE : db $02 : dw $0019 ; Pbs
    dl $7E09D0 : db $02 : dw $0022 ; Max pbs
    dl $7E0AF6 : db $02 : dw $02CC ; Samus X
    dl $7E0AFA : db $02 : dw $098B ; Samus Y
    dl $7ED87A : db $02 : dw $42FE ; Events, Items, Doors
    dl $7ED91A : db $02 : dw $0123 ; Events, Items, Doors
    dw #$FFFF
.after

preset_SZM101_tourian_metroids_backward:
    dw #preset_SZM101_tourian_metroids_forward ; Tourian: Metroids Forward
    dl $7E078D : db $02 : dw $B510 ; DDB
    dl $7E078F : db $02 : dw $0004 ; DoorOut Index
    dl $7E079B : db $02 : dw $CD5C ; MDB
    dl $7E07C5 : db $02 : dw $04C0 ; GFX Pointers
    dl $7E090F : db $02 : dw $0000 ; Screen subpixel X position.
    dl $7E0911 : db $02 : dw $0100 ; Screen X position in pixels
    dl $7E0913 : db $02 : dw $0000 ; Screen subpixel Y position
    dl $7E0915 : db $02 : dw $0109 ; Screen Y position in pixels
    dl $7E0917 : db $02 : dw $0100 ; Layer 2 X scroll in room in pixels?
    dl $7E0919 : db $02 : dw $0109 ; Layer 2 Y scroll in room in pixels? (up = positive)
    dl $7E0923 : db $02 : dw $FF00 ; BG2 Y scroll offset due to room transitions (Translates between Layer 2 scroll and BG2 scroll)
    dl $7E09C2 : db $02 : dw $03A7 ; Health
    dl $7E09C6 : db $02 : dw $004F ; Missiles
    dl $7E09C8 : db $02 : dw $00A5 ; Max missiles
    dl $7E09CA : db $02 : dw $0014 ; Supers
    dl $7E09CE : db $02 : dw $0021 ; Pbs
    dl $7E0A1C : db $02 : dw $0079 ; Samus position/state
    dl $7E0A1E : db $02 : dw $1108 ; More position/state
    dl $7E0AF6 : db $02 : dw $01E7 ; Samus X
    dl $7E0AFA : db $02 : dw $0179 ; Samus Y
    dl $7ED874 : db $02 : dw $41FF ; Events, Items, Doors
    dl $7ED8C6 : db $02 : dw $77F4 ; Events, Items, Doors
    dl $7ED91A : db $02 : dw $0127 ; Events, Items, Doors
    dw #$FFFF
.after

preset_SZM101_tourian_tourian_escape:
    dw #preset_SZM101_tourian_metroids_backward ; Tourian: Metroids Backward
    dl $7E078D : db $02 : dw $B6E4 ; DDB
    dl $7E078F : db $02 : dw $0002 ; DoorOut Index
    dl $7E079B : db $02 : dw $96BA ; MDB
    dl $7E07C5 : db $02 : dw $E3C0 ; GFX Pointers
    dl $7E090F : db $02 : dw $E000 ; Screen subpixel X position.
    dl $7E0911 : db $02 : dw $0000 ; Screen X position in pixels
    dl $7E0913 : db $02 : dw $E7FF ; Screen subpixel Y position
    dl $7E0915 : db $02 : dw $0A00 ; Screen Y position in pixels
    dl $7E0917 : db $02 : dw $0000 ; Layer 2 X scroll in room in pixels?
    dl $7E0919 : db $02 : dw $0A00 ; Layer 2 Y scroll in room in pixels? (up = positive)
    dl $7E0921 : db $02 : dw $FD00 ; BG2 X scroll offset due to room transitions (Translates between Layer 2 scroll and BG2 scroll)
    dl $7E0923 : db $02 : dw $F700 ; BG2 Y scroll offset due to room transitions (Translates between Layer 2 scroll and BG2 scroll)
    dl $7E09C2 : db $02 : dw $035E ; Health
    dl $7E0A1C : db $02 : dw $0002 ; Samus position/state
    dl $7E0A1E : db $02 : dw $0004 ; More position/state
    dl $7E0AF6 : db $02 : dw $002B ; Samus X
    dl $7E0AFA : db $02 : dw $0A8B ; Samus Y
    dl $7ED91A : db $02 : dw $0129 ; Events, Items, Doors
    dw #$FFFF
.after

preset_SZM101_cleanup_2_brinstar_secret_item:
    dw #preset_SZM101_tourian_tourian_escape ; Tourian: Tourian Escape
    dl $7E078D : db $02 : dw $AA5C ; DDB
    dl $7E078F : db $02 : dw $0001 ; DoorOut Index
    dl $7E079B : db $02 : dw $83E8 ; MDB
    dl $7E079F : db $02 : dw $0001 ; Region
    dl $7E07C3 : db $02 : dw $E6B0 ; GFX Pointers
    dl $7E07C5 : db $02 : dw $64BB ; GFX Pointers
    dl $7E07C7 : db $02 : dw $C2B2 ; GFX Pointers
    dl $7E07F3 : db $02 : dw $0012 ; Music Bank
    dl $7E07F5 : db $02 : dw $0005 ; Music Track
    dl $7E090F : db $02 : dw $7000 ; Screen subpixel X position.
    dl $7E0913 : db $02 : dw $0000 ; Screen subpixel Y position
    dl $7E0915 : db $02 : dw $0200 ; Screen Y position in pixels
    dl $7E0919 : db $02 : dw $0200 ; Layer 2 Y scroll in room in pixels? (up = positive)
    dl $7E0921 : db $02 : dw $0000 ; BG2 X scroll offset due to room transitions (Translates between Layer 2 scroll and BG2 scroll)
    dl $7E0923 : db $02 : dw $00E0 ; BG2 Y scroll offset due to room transitions (Translates between Layer 2 scroll and BG2 scroll)
    dl $7E09CA : db $02 : dw $0013 ; Supers
    dl $7E0A1C : db $02 : dw $009B ; Samus position/state
    dl $7E0A1E : db $02 : dw $0000 ; More position/state
    dl $7E0AF6 : db $02 : dw $0080 ; Samus X
    dl $7E0AFA : db $02 : dw $02A8 ; Samus Y
    dl $7ED91A : db $02 : dw $012B ; Events, Items, Doors
    dw #$FFFF
.after

preset_SZM101_cleanup_2_mini_kraid_long_room:
    dw #preset_SZM101_cleanup_2_brinstar_secret_item ; Cleanup 2: Brinstar Secret Item
    dl $7E078D : db $02 : dw $9072 ; DDB
    dl $7E078F : db $02 : dw $0000 ; DoorOut Index
    dl $7E079B : db $02 : dw $A4B1 ; MDB
    dl $7E07C3 : db $02 : dw $A5AA ; GFX Pointers
    dl $7E07C5 : db $02 : dw $5FBC ; GFX Pointers
    dl $7E07C7 : db $02 : dw $C2B3 ; GFX Pointers
    dl $7E090F : db $02 : dw $9000 ; Screen subpixel X position.
    dl $7E0913 : db $02 : dw $2800 ; Screen subpixel Y position
    dl $7E0915 : db $02 : dw $0900 ; Screen Y position in pixels
    dl $7E0919 : db $02 : dw $0900 ; Layer 2 Y scroll in room in pixels? (up = positive)
    dl $7E0921 : db $02 : dw $0100 ; BG2 X scroll offset due to room transitions (Translates between Layer 2 scroll and BG2 scroll)
    dl $7E0923 : db $02 : dw $FC00 ; BG2 Y scroll offset due to room transitions (Translates between Layer 2 scroll and BG2 scroll)
    dl $7E09CA : db $02 : dw $0015 ; Supers
    dl $7E09CC : db $02 : dw $0020 ; Max supers
    dl $7E09CE : db $02 : dw $0020 ; Pbs
    dl $7E0A1C : db $02 : dw $0001 ; Samus position/state
    dl $7E0A1E : db $02 : dw $0008 ; More position/state
    dl $7E0AF6 : db $02 : dw $00C4 ; Samus X
    dl $7E0AFA : db $02 : dw $098B ; Samus Y
    dl $7ED876 : db $02 : dw $EBA8 ; Events, Items, Doors
    dl $7ED91A : db $02 : dw $012E ; Events, Items, Doors
    dw #$FFFF
.after

preset_SZM101_cleanup_2_mini_kraid_boss_fight:
    dw #preset_SZM101_cleanup_2_mini_kraid_long_room ; Cleanup 2: Mini Kraid Long Room
    dl $7E078D : db $02 : dw $AFB4 ; DDB
    dl $7E078F : db $02 : dw $0001 ; DoorOut Index
    dl $7E079B : db $02 : dw $9CB3 ; MDB
    dl $7E07C3 : db $02 : dw $E6B0 ; GFX Pointers
    dl $7E07C5 : db $02 : dw $64BB ; GFX Pointers
    dl $7E07C7 : db $02 : dw $C2B2 ; GFX Pointers
    dl $7E090F : db $02 : dw $E680 ; Screen subpixel X position.
    dl $7E0911 : db $02 : dw $0B00 ; Screen X position in pixels
    dl $7E0913 : db $02 : dw $C400 ; Screen subpixel Y position
    dl $7E0915 : db $02 : dw $0300 ; Screen Y position in pixels
    dl $7E0917 : db $02 : dw $0B00 ; Layer 2 X scroll in room in pixels?
    dl $7E0919 : db $02 : dw $0300 ; Layer 2 Y scroll in room in pixels? (up = positive)
    dl $7E0921 : db $02 : dw $F800 ; BG2 X scroll offset due to room transitions (Translates between Layer 2 scroll and BG2 scroll)
    dl $7E0923 : db $02 : dw $FE00 ; BG2 Y scroll offset due to room transitions (Translates between Layer 2 scroll and BG2 scroll)
    dl $7E09C2 : db $02 : dw $035D ; Health
    dl $7E09CA : db $02 : dw $001F ; Supers
    dl $7E0A1C : db $02 : dw $0002 ; Samus position/state
    dl $7E0A1E : db $02 : dw $0004 ; More position/state
    dl $7E0AF6 : db $02 : dw $0B31 ; Samus X
    dl $7E0AFA : db $02 : dw $0389 ; Samus Y
    dl $7ED8C2 : db $02 : dw $52F2 ; Events, Items, Doors
    dl $7ED8CE : db $02 : dw $5950 ; Events, Items, Doors
    dl $7ED91A : db $02 : dw $0131 ; Events, Items, Doors
    dw #$FFFF
.after

preset_SZM101_cleanup_2_kraid:
    dw #preset_SZM101_cleanup_2_mini_kraid_boss_fight ; Cleanup 2: Mini Kraid Boss Fight
    dl $7E078D : db $02 : dw $9192 ; DDB
    dl $7E078F : db $02 : dw $0000 ; DoorOut Index
    dl $7E079B : db $02 : dw $A641 ; MDB
    dl $7E07C3 : db $02 : dw $A5AA ; GFX Pointers
    dl $7E07C5 : db $02 : dw $5FBC ; GFX Pointers
    dl $7E07C7 : db $02 : dw $C2B3 ; GFX Pointers
    dl $7E07F3 : db $02 : dw $0027 ; Music Bank
    dl $7E07F5 : db $02 : dw $0006 ; Music Track
    dl $7E090F : db $02 : dw $4000 ; Screen subpixel X position.
    dl $7E0911 : db $02 : dw $0000 ; Screen X position in pixels
    dl $7E0913 : db $02 : dw $13FF ; Screen subpixel Y position
    dl $7E0915 : db $02 : dw $07D2 ; Screen Y position in pixels
    dl $7E0917 : db $02 : dw $0000 ; Layer 2 X scroll in room in pixels?
    dl $7E0919 : db $02 : dw $07D2 ; Layer 2 Y scroll in room in pixels? (up = positive)
    dl $7E0921 : db $02 : dw $FF00 ; BG2 X scroll offset due to room transitions (Translates between Layer 2 scroll and BG2 scroll)
    dl $7E0923 : db $02 : dw $FA00 ; BG2 Y scroll offset due to room transitions (Translates between Layer 2 scroll and BG2 scroll)
    dl $7E09C2 : db $02 : dw $0442 ; Health
    dl $7E09C4 : db $02 : dw $044B ; Max health
    dl $7E0A1C : db $02 : dw $0027 ; Samus position/state
    dl $7E0A1E : db $02 : dw $0508 ; More position/state
    dl $7E0AF6 : db $02 : dw $00D0 ; Samus X
    dl $7E0AFA : db $02 : dw $0849 ; Samus Y
    dl $7ED87C : db $02 : dw $EF7E ; Events, Items, Doors
    dl $7ED91A : db $02 : dw $0133 ; Events, Items, Doors
    dw #$FFFF
.after

preset_SZM101_cleanup_2_pink_hopper_spark:
    dw #preset_SZM101_cleanup_2_kraid ; Cleanup 2: Kraid
    dl $7E078D : db $02 : dw $AFCC ; DDB
    dl $7E078F : db $02 : dw $0003 ; DoorOut Index
    dl $7E079B : db $02 : dw $9CB3 ; MDB
    dl $7E07C3 : db $02 : dw $E6B0 ; GFX Pointers
    dl $7E07C5 : db $02 : dw $64BB ; GFX Pointers
    dl $7E07C7 : db $02 : dw $C2B2 ; GFX Pointers
    dl $7E07F3 : db $02 : dw $0012 ; Music Bank
    dl $7E07F5 : db $02 : dw $0005 ; Music Track
    dl $7E090F : db $02 : dw $C000 ; Screen subpixel X position.
    dl $7E0911 : db $02 : dw $0915 ; Screen X position in pixels
    dl $7E0913 : db $02 : dw $0000 ; Screen subpixel Y position
    dl $7E0915 : db $02 : dw $0000 ; Screen Y position in pixels
    dl $7E0917 : db $02 : dw $0915 ; Layer 2 X scroll in room in pixels?
    dl $7E0919 : db $02 : dw $0000 ; Layer 2 Y scroll in room in pixels? (up = positive)
    dl $7E0921 : db $02 : dw $F800 ; BG2 X scroll offset due to room transitions (Translates between Layer 2 scroll and BG2 scroll)
    dl $7E0923 : db $02 : dw $0000 ; BG2 Y scroll offset due to room transitions (Translates between Layer 2 scroll and BG2 scroll)
    dl $7E09C2 : db $02 : dw $042C ; Health
    dl $7E09C6 : db $02 : dw $0055 ; Missiles
    dl $7E09CA : db $02 : dw $001D ; Supers
    dl $7E09CE : db $02 : dw $0022 ; Pbs
    dl $7E0A1C : db $02 : dw $0001 ; Samus position/state
    dl $7E0A1E : db $02 : dw $0008 ; More position/state
    dl $7E0AF6 : db $02 : dw $0975 ; Samus X
    dl $7E0AFA : db $02 : dw $009B ; Samus Y
    dl $7ED828 : db $02 : dw $0105 ; Events, Items, Doors
    dl $7ED8CE : db $02 : dw $5D50 ; Events, Items, Doors
    dl $7ED91A : db $02 : dw $0135 ; Events, Items, Doors
    dw #$FFFF
.after

preset_SZM101_cleanup_2_reserve_room:
    dw #preset_SZM101_cleanup_2_pink_hopper_spark ; Cleanup 2: Pink Hopper Spark
    dl $7E078D : db $02 : dw $B0E0 ; DDB
    dl $7E078F : db $02 : dw $0000 ; DoorOut Index
    dl $7E079B : db $02 : dw $A253 ; MDB
    dl $7E07C3 : db $02 : dw $A5AA ; GFX Pointers
    dl $7E07C5 : db $02 : dw $5FBC ; GFX Pointers
    dl $7E07C7 : db $02 : dw $C2B3 ; GFX Pointers
    dl $7E090F : db $02 : dw $6000 ; Screen subpixel X position.
    dl $7E0911 : db $02 : dw $0000 ; Screen X position in pixels
    dl $7E0915 : db $02 : dw $021D ; Screen Y position in pixels
    dl $7E0917 : db $02 : dw $0000 ; Layer 2 X scroll in room in pixels?
    dl $7E0919 : db $02 : dw $021D ; Layer 2 Y scroll in room in pixels? (up = positive)
    dl $7E0921 : db $02 : dw $0100 ; BG2 X scroll offset due to room transitions (Translates between Layer 2 scroll and BG2 scroll)
    dl $7E0923 : db $02 : dw $F700 ; BG2 Y scroll offset due to room transitions (Translates between Layer 2 scroll and BG2 scroll)
    dl $7E0A1C : db $02 : dw $0002 ; Samus position/state
    dl $7E0A1E : db $02 : dw $0004 ; More position/state
    dl $7E0AF6 : db $02 : dw $0035 ; Samus X
    dl $7E0AFA : db $02 : dw $028B ; Samus Y
    dl $7ED91A : db $02 : dw $0138 ; Events, Items, Doors
    dw #$FFFF
.after

preset_SZM101_cleanup_2_below_reserve_room:
    dw #preset_SZM101_cleanup_2_reserve_room ; Cleanup 2: Reserve Room
    dl $7E078D : db $02 : dw $8D66 ; DDB
    dl $7E090F : db $02 : dw $C000 ; Screen subpixel X position.
    dl $7E0913 : db $02 : dw $CC00 ; Screen subpixel Y position
    dl $7E0915 : db $02 : dw $0300 ; Screen Y position in pixels
    dl $7E0919 : db $02 : dw $0300 ; Layer 2 Y scroll in room in pixels? (up = positive)
    dl $7E0923 : db $02 : dw $FE00 ; BG2 Y scroll offset due to room transitions (Translates between Layer 2 scroll and BG2 scroll)
    dl $7E09CA : db $02 : dw $001F ; Supers
    dl $7E09CC : db $02 : dw $0022 ; Max supers
    dl $7E09CE : db $02 : dw $0021 ; Pbs
    dl $7E09D4 : db $02 : dw $012C ; Max reserves
    dl $7E0AF6 : db $02 : dw $0047 ; Samus X
    dl $7E0AFA : db $02 : dw $038B ; Samus Y
    dl $7ED876 : db $02 : dw $EBA9 ; Events, Items, Doors
    dl $7ED87E : db $02 : dw $7C1F ; Events, Items, Doors
    dl $7ED91A : db $02 : dw $013B ; Events, Items, Doors
    dw #$FFFF
.after

preset_SZM101_cleanup_2_sporespawn_ice_bridge:
    dw #preset_SZM101_cleanup_2_below_reserve_room ; Cleanup 2: Below Reserve Room
    dl $7E078D : db $02 : dw $8E32 ; DDB
    dl $7E079B : db $02 : dw $9AD9 ; MDB
    dl $7E090F : db $02 : dw $5001 ; Screen subpixel X position.
    dl $7E0913 : db $02 : dw $B3FF ; Screen subpixel Y position
    dl $7E0915 : db $02 : dw $051A ; Screen Y position in pixels
    dl $7E0919 : db $02 : dw $051A ; Layer 2 Y scroll in room in pixels? (up = positive)
    dl $7E0921 : db $02 : dw $FF00 ; BG2 X scroll offset due to room transitions (Translates between Layer 2 scroll and BG2 scroll)
    dl $7E0923 : db $02 : dw $FB00 ; BG2 Y scroll offset due to room transitions (Translates between Layer 2 scroll and BG2 scroll)
    dl $7E09C2 : db $02 : dw $03FC ; Health
    dl $7E09C6 : db $02 : dw $005A ; Missiles
    dl $7E09C8 : db $02 : dw $00AA ; Max missiles
    dl $7E0AF6 : db $02 : dw $0028 ; Samus X
    dl $7E0AFA : db $02 : dw $058B ; Samus Y
    dl $7ED870 : db $02 : dw $1FDF ; Events, Items, Doors
    dl $7ED91A : db $02 : dw $013D ; Events, Items, Doors
    dw #$FFFF
.after

preset_SZM101_cleanup_2_sporespawn_exit:
    dw #preset_SZM101_cleanup_2_sporespawn_ice_bridge ; Cleanup 2: SporeSpawn Ice Bridge
    dl $7E078D : db $02 : dw $8B26 ; DDB
    dl $7E079B : db $02 : dw $9DC7 ; MDB
    dl $7E07F3 : db $02 : dw $002A ; Music Bank
    dl $7E090F : db $02 : dw $A000 ; Screen subpixel X position.
    dl $7E0913 : db $02 : dw $0000 ; Screen subpixel Y position
    dl $7E0915 : db $02 : dw $021C ; Screen Y position in pixels
    dl $7E0919 : db $02 : dw $021C ; Layer 2 Y scroll in room in pixels? (up = positive)
    dl $7E0923 : db $02 : dw $FE00 ; BG2 Y scroll offset due to room transitions (Translates between Layer 2 scroll and BG2 scroll)
    dl $7E09C2 : db $02 : dw $0432 ; Health
    dl $7E09C6 : db $02 : dw $006A ; Missiles
    dl $7E09CA : db $02 : dw $0023 ; Supers
    dl $7E09CC : db $02 : dw $0024 ; Max supers
    dl $7E09CE : db $02 : dw $0022 ; Pbs
    dl $7E0A1C : db $02 : dw $0001 ; Samus position/state
    dl $7E0A1E : db $02 : dw $0008 ; More position/state
    dl $7E0AF6 : db $02 : dw $00B9 ; Samus X
    dl $7E0AFA : db $02 : dw $028B ; Samus Y
    dl $7ED828 : db $02 : dw $0305 ; Events, Items, Doors
    dl $7ED876 : db $02 : dw $EBAD ; Events, Items, Doors
    dl $7ED8C2 : db $02 : dw $72F2 ; Events, Items, Doors
    dl $7ED91A : db $02 : dw $013E ; Events, Items, Doors
    dw #$FFFF
.after

preset_SZM101_cleanup_2_kraid_mouth_missile:
    dw #preset_SZM101_cleanup_2_sporespawn_exit ; Cleanup 2: SporeSpawn Exit
    dl $7E078D : db $02 : dw $8FA6 ; DDB
    dl $7E078F : db $02 : dw $0002 ; DoorOut Index
    dl $7E079B : db $02 : dw $88D7 ; MDB
    dl $7E07F3 : db $02 : dw $0012 ; Music Bank
    dl $7E07F5 : db $02 : dw $0003 ; Music Track
    dl $7E090F : db $02 : dw $3000 ; Screen subpixel X position.
    dl $7E0913 : db $02 : dw $5000 ; Screen subpixel Y position
    dl $7E0915 : db $02 : dw $0000 ; Screen Y position in pixels
    dl $7E0919 : db $02 : dw $0000 ; Layer 2 Y scroll in room in pixels? (up = positive)
    dl $7E0923 : db $02 : dw $0000 ; BG2 Y scroll offset due to room transitions (Translates between Layer 2 scroll and BG2 scroll)
    dl $7E09C2 : db $02 : dw $0426 ; Health
    dl $7E09C6 : db $02 : dw $006F ; Missiles
    dl $7E09C8 : db $02 : dw $00AF ; Max missiles
    dl $7E0AF6 : db $02 : dw $0084 ; Samus X
    dl $7E0AFA : db $02 : dw $008B ; Samus Y
    dl $7ED870 : db $02 : dw $9FDF ; Events, Items, Doors
    dl $7ED91A : db $02 : dw $0142 ; Events, Items, Doors
    dw #$FFFF
.after

preset_SZM101_cleanup_2_etank_chain_spark:
    dw #preset_SZM101_cleanup_2_kraid_mouth_missile ; Cleanup 2: Kraid Mouth Missile
    dl $7E078D : db $02 : dw $9702 ; DDB
    dl $7E078F : db $02 : dw $0003 ; DoorOut Index
    dl $7E079B : db $02 : dw $A2F7 ; MDB
    dl $7E07C3 : db $02 : dw $E6B0 ; GFX Pointers
    dl $7E07C5 : db $02 : dw $64BB ; GFX Pointers
    dl $7E07C7 : db $02 : dw $C2B2 ; GFX Pointers
    dl $7E07F3 : db $02 : dw $000F ; Music Bank
    dl $7E07F5 : db $02 : dw $0005 ; Music Track
    dl $7E090F : db $02 : dw $8000 ; Screen subpixel X position.
    dl $7E0913 : db $02 : dw $0000 ; Screen subpixel Y position
    dl $7E0915 : db $02 : dw $001D ; Screen Y position in pixels
    dl $7E0919 : db $02 : dw $0015 ; Layer 2 Y scroll in room in pixels? (up = positive)
    dl $7E0923 : db $02 : dw $FE00 ; BG2 Y scroll offset due to room transitions (Translates between Layer 2 scroll and BG2 scroll)
    dl $7E09C2 : db $02 : dw $040E ; Health
    dl $7E09C6 : db $02 : dw $0074 ; Missiles
    dl $7E09C8 : db $02 : dw $00B4 ; Max missiles
    dl $7E0AF6 : db $02 : dw $00C6 ; Samus X
    dl $7ED870 : db $02 : dw $DFDF ; Events, Items, Doors
    dl $7ED91A : db $02 : dw $0143 ; Events, Items, Doors
    dw #$FFFF
.after

preset_SZM101_cleanup_2_slick_space_boost:
    dw #preset_SZM101_cleanup_2_etank_chain_spark ; Cleanup 2: Etank Chain Spark
    dl $7E078D : db $02 : dw $C1B4 ; DDB
    dl $7E078F : db $02 : dw $0006 ; DoorOut Index
    dl $7E079B : db $02 : dw $A3AE ; MDB
    dl $7E090F : db $02 : dw $E000 ; Screen subpixel X position.
    dl $7E0911 : db $02 : dw $0100 ; Screen X position in pixels
    dl $7E0915 : db $02 : dw $0600 ; Screen Y position in pixels
    dl $7E0917 : db $02 : dw $0100 ; Layer 2 X scroll in room in pixels?
    dl $7E0919 : db $02 : dw $0600 ; Layer 2 Y scroll in room in pixels? (up = positive)
    dl $7E0921 : db $02 : dw $0100 ; BG2 X scroll offset due to room transitions (Translates between Layer 2 scroll and BG2 scroll)
    dl $7E0923 : db $02 : dw $FA00 ; BG2 Y scroll offset due to room transitions (Translates between Layer 2 scroll and BG2 scroll)
    dl $7E09C2 : db $02 : dw $047D ; Health
    dl $7E09C4 : db $02 : dw $047D ; Max health
    dl $7E09C6 : db $02 : dw $0075 ; Missiles
    dl $7E0A1C : db $02 : dw $008D ; Samus position/state
    dl $7E0A1E : db $02 : dw $0E04 ; More position/state
    dl $7E0A68 : db $02 : dw $00D5 ; Flash suit
    dl $7E0AF6 : db $02 : dw $016F ; Samus X
    dl $7E0AFA : db $02 : dw $069B ; Samus Y
    dl $7ED87C : db $02 : dw $EFFE ; Events, Items, Doors
    dl $7ED91A : db $02 : dw $0148 ; Events, Items, Doors
    dw #$FFFF
.after

preset_SZM101_cleanup_2_rock_pipes:
    dw #preset_SZM101_cleanup_2_slick_space_boost ; Cleanup 2: Slick Space Boost
    dl $7E078D : db $02 : dw $9246 ; DDB
    dl $7E078F : db $02 : dw $0005 ; DoorOut Index
    dl $7E079B : db $02 : dw $A7DE ; MDB
    dl $7E079F : db $02 : dw $0002 ; Region
    dl $7E07C3 : db $02 : dw $C3F9 ; GFX Pointers
    dl $7E07C5 : db $02 : dw $BBBD ; GFX Pointers
    dl $7E07C7 : db $02 : dw $C2B6 ; GFX Pointers
    dl $7E07F3 : db $02 : dw $0015 ; Music Bank
    dl $7E090F : db $02 : dw $BFFF ; Screen subpixel X position.
    dl $7E0911 : db $02 : dw $0000 ; Screen X position in pixels
    dl $7E0915 : db $02 : dw $0321 ; Screen Y position in pixels
    dl $7E0917 : db $02 : dw $0000 ; Layer 2 X scroll in room in pixels?
    dl $7E0919 : db $02 : dw $0321 ; Layer 2 Y scroll in room in pixels? (up = positive)
    dl $7E0921 : db $02 : dw $0000 ; BG2 X scroll offset due to room transitions (Translates between Layer 2 scroll and BG2 scroll)
    dl $7E0923 : db $02 : dw $00E0 ; BG2 Y scroll offset due to room transitions (Translates between Layer 2 scroll and BG2 scroll)
    dl $7E09A6 : db $02 : dw $1009 ; Beams
    dl $7E09C6 : db $02 : dw $007A ; Missiles
    dl $7E09C8 : db $02 : dw $00B9 ; Max missiles
    dl $7E0A1C : db $02 : dw $0001 ; Samus position/state
    dl $7E0A1E : db $02 : dw $0008 ; More position/state
    dl $7E0A68 : db $02 : dw $0000 ; Flash suit
    dl $7E0AF6 : db $02 : dw $00C2 ; Samus X
    dl $7E0AFA : db $02 : dw $038B ; Samus Y
    dl $7ED870 : db $02 : dw $FFDF ; Events, Items, Doors
    dl $7ED8BA : db $02 : dw $0001 ; Events, Items, Doors
    dl $7ED91A : db $02 : dw $014C ; Events, Items, Doors
    dw #$FFFF
.after

preset_SZM101_cleanup_2_maze_skip:
    dw #preset_SZM101_cleanup_2_rock_pipes ; Cleanup 2: Rock Pipes
    dl $7E078D : db $02 : dw $9672 ; DDB
    dl $7E078F : db $02 : dw $0001 ; DoorOut Index
    dl $7E079B : db $02 : dw $ACB3 ; MDB
    dl $7E090F : db $02 : dw $F680 ; Screen subpixel X position.
    dl $7E0911 : db $02 : dw $0100 ; Screen X position in pixels
    dl $7E0915 : db $02 : dw $0103 ; Screen Y position in pixels
    dl $7E0917 : db $02 : dw $00C0 ; Layer 2 X scroll in room in pixels?
    dl $7E0919 : db $02 : dw $00C2 ; Layer 2 Y scroll in room in pixels? (up = positive)
    dl $7E0921 : db $02 : dw $0100 ; BG2 X scroll offset due to room transitions (Translates between Layer 2 scroll and BG2 scroll)
    dl $7E0923 : db $02 : dw $FF00 ; BG2 Y scroll offset due to room transitions (Translates between Layer 2 scroll and BG2 scroll)
    dl $7E09C2 : db $02 : dw $04AB ; Health
    dl $7E09C4 : db $02 : dw $04AF ; Max health
    dl $7E09D0 : db $02 : dw $0024 ; Max pbs
    dl $7E0AF6 : db $02 : dw $01D7 ; Samus X
    dl $7E0AFA : db $02 : dw $018B ; Samus Y
    dl $7ED846 : db $02 : dw $0100 ; Events, Items, Doors
    dl $7ED87A : db $02 : dw $42FF ; Events, Items, Doors
    dl $7ED87C : db $02 : dw $FFFE ; Events, Items, Doors
    dl $7ED91A : db $02 : dw $014F ; Events, Items, Doors
    dw #$FFFF
.after

preset_SZM101_cleanup_2_crocs_hideaway:
    dw #preset_SZM101_cleanup_2_maze_skip ; Cleanup 2: Maze Skip
    dl $7E078D : db $02 : dw $9576 ; DDB
    dl $7E078F : db $02 : dw $0003 ; DoorOut Index
    dl $7E079B : db $02 : dw $AE07 ; MDB
    dl $7E090F : db $02 : dw $5400 ; Screen subpixel X position.
    dl $7E0911 : db $02 : dw $0300 ; Screen X position in pixels
    dl $7E0913 : db $02 : dw $2800 ; Screen subpixel Y position
    dl $7E0915 : db $02 : dw $0000 ; Screen Y position in pixels
    dl $7E0917 : db $02 : dw $0240 ; Layer 2 X scroll in room in pixels?
    dl $7E0919 : db $02 : dw $0000 ; Layer 2 Y scroll in room in pixels? (up = positive)
    dl $7E0923 : db $02 : dw $0000 ; BG2 Y scroll offset due to room transitions (Translates between Layer 2 scroll and BG2 scroll)
    dl $7E09C2 : db $02 : dw $0497 ; Health
    dl $7E09CA : db $02 : dw $0026 ; Supers
    dl $7E09CC : db $02 : dw $0026 ; Max supers
    dl $7E09CE : db $02 : dw $0021 ; Pbs
    dl $7E0AF6 : db $02 : dw $03CB ; Samus X
    dl $7E0AFA : db $02 : dw $008B ; Samus Y
    dl $7ED878 : db $02 : dw $DFFF ; Events, Items, Doors
    dl $7ED91A : db $02 : dw $0150 ; Events, Items, Doors
    dw #$FFFF
.after

preset_SZM101_cleanup_2_crocomire:
    dw #preset_SZM101_cleanup_2_crocs_hideaway ; Cleanup 2: Croc's Hideaway
    dl $7E078D : db $02 : dw $BECC ; DDB
    dl $7E078F : db $02 : dw $0001 ; DoorOut Index
    dl $7E079B : db $02 : dw $A8F8 ; MDB
    dl $7E090F : db $02 : dw $E000 ; Screen subpixel X position.
    dl $7E0911 : db $02 : dw $0041 ; Screen X position in pixels
    dl $7E0913 : db $02 : dw $1000 ; Screen subpixel Y position
    dl $7E0915 : db $02 : dw $001F ; Screen Y position in pixels
    dl $7E0917 : db $02 : dw $0030 ; Layer 2 X scroll in room in pixels?
    dl $7E0919 : db $02 : dw $0017 ; Layer 2 Y scroll in room in pixels? (up = positive)
    dl $7E0921 : db $02 : dw $FA00 ; BG2 X scroll offset due to room transitions (Translates between Layer 2 scroll and BG2 scroll)
    dl $7E09C2 : db $02 : dw $047C ; Health
    dl $7E09C6 : db $02 : dw $007F ; Missiles
    dl $7E09C8 : db $02 : dw $00BE ; Max missiles
    dl $7E09CE : db $02 : dw $0020 ; Pbs
    dl $7E0A1C : db $02 : dw $0002 ; Samus position/state
    dl $7E0A1E : db $02 : dw $0004 ; More position/state
    dl $7E0AF6 : db $02 : dw $00AC ; Samus X
    dl $7E0AFA : db $02 : dw $00AB ; Samus Y
    dl $7ED872 : db $02 : dw $EDFF ; Events, Items, Doors
    dl $7ED91A : db $02 : dw $0153 ; Events, Items, Doors
    dw #$FFFF
.after

preset_SZM101_cleanup_2_broken_grapple_blocks:
    dw #preset_SZM101_cleanup_2_crocomire ; Cleanup 2: Crocomire
    dl $7E078D : db $02 : dw $8DA2 ; DDB
    dl $7E078F : db $02 : dw $0000 ; DoorOut Index
    dl $7E079B : db $02 : dw $A7DE ; MDB
    dl $7E090F : db $02 : dw $AC80 ; Screen subpixel X position.
    dl $7E0911 : db $02 : dw $0000 ; Screen X position in pixels
    dl $7E0913 : db $02 : dw $0000 ; Screen subpixel Y position
    dl $7E0915 : db $02 : dw $031B ; Screen Y position in pixels
    dl $7E0917 : db $02 : dw $0000 ; Layer 2 X scroll in room in pixels?
    dl $7E0919 : db $02 : dw $031B ; Layer 2 Y scroll in room in pixels? (up = positive)
    dl $7E0921 : db $02 : dw $FF00 ; BG2 X scroll offset due to room transitions (Translates between Layer 2 scroll and BG2 scroll)
    dl $7E0923 : db $02 : dw $FA00 ; BG2 Y scroll offset due to room transitions (Translates between Layer 2 scroll and BG2 scroll)
    dl $7E09C2 : db $02 : dw $0488 ; Health
    dl $7E09C6 : db $02 : dw $0081 ; Missiles
    dl $7E09CA : db $02 : dw $0028 ; Supers
    dl $7E09CC : db $02 : dw $0028 ; Max supers
    dl $7E0AF6 : db $02 : dw $004F ; Samus X
    dl $7E0AFA : db $02 : dw $038B ; Samus Y
    dl $7ED82A : db $02 : dw $0102 ; Events, Items, Doors
    dl $7ED876 : db $02 : dw $FBAD ; Events, Items, Doors
    dl $7ED8C6 : db $02 : dw $77F5 ; Events, Items, Doors
    dl $7ED91A : db $02 : dw $0155 ; Events, Items, Doors
    dw #$FFFF
.after

preset_SZM101_cleanup_2_lava_dive_pbs:
    dw #preset_SZM101_cleanup_2_broken_grapple_blocks ; Cleanup 2: Broken Grapple Blocks
    dl $7E078D : db $02 : dw $94B6 ; DDB
    dl $7E079B : db $02 : dw $AA82 ; MDB
    dl $7E090F : db $02 : dw $F400 ; Screen subpixel X position.
    dl $7E0913 : db $02 : dw $2400 ; Screen subpixel Y position
    dl $7E0915 : db $02 : dw $0400 ; Screen Y position in pixels
    dl $7E0919 : db $02 : dw $0400 ; Layer 2 Y scroll in room in pixels? (up = positive)
    dl $7E0923 : db $02 : dw $FD00 ; BG2 Y scroll offset due to room transitions (Translates between Layer 2 scroll and BG2 scroll)
    dl $7E09C2 : db $02 : dw $0474 ; Health
    dl $7E09C6 : db $02 : dw $0087 ; Missiles
    dl $7E09C8 : db $02 : dw $00C3 ; Max missiles
    dl $7E0A1C : db $02 : dw $0001 ; Samus position/state
    dl $7E0A1E : db $02 : dw $0008 ; More position/state
    dl $7E0AF6 : db $02 : dw $00CB ; Samus X
    dl $7E0AFA : db $02 : dw $048B ; Samus Y
    dl $7ED872 : db $02 : dw $FDFF ; Events, Items, Doors
    dl $7ED8C6 : db $02 : dw $77FD ; Events, Items, Doors
    dl $7ED91A : db $02 : dw $0156 ; Events, Items, Doors
    dw #$FFFF
.after

preset_SZM101_cleanup_2_super_gate_shot:
    dw #preset_SZM101_cleanup_2_lava_dive_pbs ; Cleanup 2: Lava Dive PBs
    dl $7E078D : db $02 : dw $944A ; DDB
    dl $7E078F : db $02 : dw $0003 ; DoorOut Index
    dl $7E079B : db $02 : dw $95D4 ; MDB
    dl $7E079F : db $02 : dw $0000 ; Region
    dl $7E07C3 : db $02 : dw $C629 ; GFX Pointers
    dl $7E07C5 : db $02 : dw $5DBA ; GFX Pointers
    dl $7E07C7 : db $02 : dw $C2AE ; GFX Pointers
    dl $7E07F3 : db $02 : dw $0009 ; Music Bank
    dl $7E07F5 : db $02 : dw $0006 ; Music Track
    dl $7E090F : db $02 : dw $0000 ; Screen subpixel X position.
    dl $7E0913 : db $02 : dw $C000 ; Screen subpixel Y position
    dl $7E0915 : db $02 : dw $0000 ; Screen Y position in pixels
    dl $7E0919 : db $02 : dw $0000 ; Layer 2 Y scroll in room in pixels? (up = positive)
    dl $7E0921 : db $02 : dw $0000 ; BG2 X scroll offset due to room transitions (Translates between Layer 2 scroll and BG2 scroll)
    dl $7E0923 : db $02 : dw $FF00 ; BG2 Y scroll offset due to room transitions (Translates between Layer 2 scroll and BG2 scroll)
    dl $7E09C6 : db $02 : dw $008C ; Missiles
    dl $7E09C8 : db $02 : dw $00C8 ; Max missiles
    dl $7E09CA : db $02 : dw $0027 ; Supers
    dl $7E09CE : db $02 : dw $0021 ; Pbs
    dl $7E09D0 : db $02 : dw $0026 ; Max pbs
    dl $7E0AF6 : db $02 : dw $0082 ; Samus X
    dl $7E0AFA : db $02 : dw $008B ; Samus Y
    dl $7ED872 : db $02 : dw $FFFF ; Events, Items, Doors
    dl $7ED878 : db $02 : dw $FFFF ; Events, Items, Doors
    dl $7ED91A : db $02 : dw $0158 ; Events, Items, Doors
    dw #$FFFF
.after

preset_SZM101_cleanup_2_breakable_chozo:
    dw #preset_SZM101_cleanup_2_super_gate_shot ; Cleanup 2: Super Gate Shot
    dl $7E078D : db $02 : dw $BF68 ; DDB
    dl $7E078F : db $02 : dw $0004 ; DoorOut Index
    dl $7E079B : db $02 : dw $C310 ; MDB
    dl $7E07C5 : db $02 : dw $7CBA ; GFX Pointers
    dl $7E07C7 : db $02 : dw $C2AD ; GFX Pointers
    dl $7E07F3 : db $02 : dw $0006 ; Music Bank
    dl $7E07F5 : db $02 : dw $0007 ; Music Track
    dl $7E090F : db $02 : dw $C000 ; Screen subpixel X position.
    dl $7E0911 : db $02 : dw $0100 ; Screen X position in pixels
    dl $7E0913 : db $02 : dw $0000 ; Screen subpixel Y position
    dl $7E0915 : db $02 : dw $02FA ; Screen Y position in pixels
    dl $7E0917 : db $02 : dw $0100 ; Layer 2 X scroll in room in pixels?
    dl $7E0919 : db $02 : dw $02FA ; Layer 2 Y scroll in room in pixels? (up = positive)
    dl $7E0921 : db $02 : dw $0100 ; BG2 X scroll offset due to room transitions (Translates between Layer 2 scroll and BG2 scroll)
    dl $7E0923 : db $02 : dw $0000 ; BG2 Y scroll offset due to room transitions (Translates between Layer 2 scroll and BG2 scroll)
    dl $7E09C2 : db $02 : dw $0471 ; Health
    dl $7E09C6 : db $02 : dw $0091 ; Missiles
    dl $7E09C8 : db $02 : dw $00CD ; Max missiles
    dl $7E09CA : db $02 : dw $0028 ; Supers
    dl $7E09CC : db $02 : dw $002A ; Max supers
    dl $7E09CE : db $02 : dw $0022 ; Pbs
    dl $7E0AF6 : db $02 : dw $0197 ; Samus X
    dl $7E0AFA : db $02 : dw $038B ; Samus Y
    dl $7ED870 : db $02 : dw $FFFF ; Events, Items, Doors
    dl $7ED874 : db $02 : dw $C1FF ; Events, Items, Doors
    dl $7ED91A : db $02 : dw $015D ; Events, Items, Doors
    dw #$FFFF
.after

preset_SZM101_pirate_ship_ridley_shortest_charge:
    dw #preset_SZM101_cleanup_2_breakable_chozo ; Cleanup 2: Breakable Chozo
    dl $7E078D : db $02 : dw $AEDC ; DDB
    dl $7E078F : db $02 : dw $0005 ; DoorOut Index
    dl $7E079B : db $02 : dw $B40A ; MDB
    dl $7E079F : db $02 : dw $0003 ; Region
    dl $7E07C3 : db $02 : dw $B130 ; GFX Pointers
    dl $7E07C5 : db $02 : dw $3CBE ; GFX Pointers
    dl $7E07C7 : db $02 : dw $C2B8 ; GFX Pointers
    dl $7E090F : db $02 : dw $0000 ; Screen subpixel X position.
    dl $7E0911 : db $02 : dw $00B0 ; Screen X position in pixels
    dl $7E0913 : db $02 : dw $6800 ; Screen subpixel Y position
    dl $7E0915 : db $02 : dw $016C ; Screen Y position in pixels
    dl $7E0917 : db $02 : dw $00B0 ; Layer 2 X scroll in room in pixels?
    dl $7E0919 : db $02 : dw $016C ; Layer 2 Y scroll in room in pixels? (up = positive)
    dl $7E0921 : db $02 : dw $FF00 ; BG2 X scroll offset due to room transitions (Translates between Layer 2 scroll and BG2 scroll)
    dl $7E0923 : db $02 : dw $FB00 ; BG2 Y scroll offset due to room transitions (Translates between Layer 2 scroll and BG2 scroll)
    dl $7E09C2 : db $02 : dw $045D ; Health
    dl $7E09CA : db $02 : dw $0026 ; Supers
    dl $7E09CE : db $02 : dw $0021 ; Pbs
    dl $7E0A1C : db $02 : dw $0002 ; Samus position/state
    dl $7E0A1E : db $02 : dw $0004 ; More position/state
    dl $7E0AF6 : db $02 : dw $0150 ; Samus X
    dl $7E0AFA : db $02 : dw $01FB ; Samus Y
    dl $7ED91A : db $02 : dw $0161 ; Events, Items, Doors
    dw #$FFFF
.after

preset_SZM101_pirate_ship_ridley_inside_outside_spark:
    dw #preset_SZM101_pirate_ship_ridley_shortest_charge ; Pirate Ship Ridley: Shortest Charge
    dl $7E0911 : db $02 : dw $03EB ; Screen X position in pixels
    dl $7E0913 : db $02 : dw $0000 ; Screen subpixel Y position
    dl $7E0915 : db $02 : dw $003A ; Screen Y position in pixels
    dl $7E0917 : db $02 : dw $03EB ; Layer 2 X scroll in room in pixels?
    dl $7E0919 : db $02 : dw $003A ; Layer 2 Y scroll in room in pixels? (up = positive)
    dl $7E09C6 : db $02 : dw $0096 ; Missiles
    dl $7E09C8 : db $02 : dw $00D2 ; Max missiles
    dl $7E0A1C : db $02 : dw $0001 ; Samus position/state
    dl $7E0A1E : db $02 : dw $0008 ; More position/state
    dl $7E0AF6 : db $02 : dw $044B ; Samus X
    dl $7E0AFA : db $02 : dw $00AB ; Samus Y
    dl $7ED874 : db $02 : dw $C5FF ; Events, Items, Doors
    dw #$FFFF
.after

preset_SZM101_pirate_ship_ridley_plasma_sba:
    dw #preset_SZM101_pirate_ship_ridley_inside_outside_spark ; Pirate Ship Ridley: Inside Outside Spark
    dl $7E078D : db $02 : dw $A51C ; DDB
    dl $7E078F : db $02 : dw $0003 ; DoorOut Index
    dl $7E079B : db $02 : dw $C2B0 ; MDB
    dl $7E07F3 : db $02 : dw $000C ; Music Bank
    dl $7E07F5 : db $02 : dw $0005 ; Music Track
    dl $7E090F : db $02 : dw $F380 ; Screen subpixel X position.
    dl $7E0911 : db $02 : dw $0000 ; Screen X position in pixels
    dl $7E0913 : db $02 : dw $4C00 ; Screen subpixel Y position
    dl $7E0915 : db $02 : dw $02B7 ; Screen Y position in pixels
    dl $7E0917 : db $02 : dw $0000 ; Layer 2 X scroll in room in pixels?
    dl $7E0919 : db $02 : dw $02B7 ; Layer 2 Y scroll in room in pixels? (up = positive)
    dl $7E0921 : db $02 : dw $FD00 ; BG2 X scroll offset due to room transitions (Translates between Layer 2 scroll and BG2 scroll)
    dl $7E0923 : db $02 : dw $FC00 ; BG2 Y scroll offset due to room transitions (Translates between Layer 2 scroll and BG2 scroll)
    dl $7E09C2 : db $02 : dw $04E1 ; Health
    dl $7E09C4 : db $02 : dw $04E1 ; Max health
    dl $7E09CA : db $02 : dw $0027 ; Supers
    dl $7E09CC : db $02 : dw $002C ; Max supers
    dl $7E0A1C : db $02 : dw $0002 ; Samus position/state
    dl $7E0A1E : db $02 : dw $0004 ; More position/state
    dl $7E0AF6 : db $02 : dw $0030 ; Samus X
    dl $7E0AFA : db $02 : dw $032B ; Samus Y
    dl $7ED822 : db $02 : dw $0021 ; Events, Items, Doors
    dl $7ED876 : db $02 : dw $FBBD ; Events, Items, Doors
    dl $7ED87E : db $02 : dw $7C9F ; Events, Items, Doors
    dl $7ED91A : db $02 : dw $0163 ; Events, Items, Doors
    dw #$FFFF
.after

preset_SZM101_pirate_ship_ridley_super_speed_space_jump:
    dw #preset_SZM101_pirate_ship_ridley_plasma_sba ; Pirate Ship Ridley: Plasma SBA
    dl $7E078D : db $02 : dw $BAF8 ; DDB
    dl $7E078F : db $02 : dw $0004 ; DoorOut Index
    dl $7E079B : db $02 : dw $93FE ; MDB
    dl $7E090F : db $02 : dw $0000 ; Screen subpixel X position.
    dl $7E0911 : db $02 : dw $0729 ; Screen X position in pixels
    dl $7E0913 : db $02 : dw $0000 ; Screen subpixel Y position
    dl $7E0915 : db $02 : dw $0001 ; Screen Y position in pixels
    dl $7E0917 : db $02 : dw $0729 ; Layer 2 X scroll in room in pixels?
    dl $7E0919 : db $02 : dw $0001 ; Layer 2 Y scroll in room in pixels? (up = positive)
    dl $7E0921 : db $02 : dw $0000 ; BG2 X scroll offset due to room transitions (Translates between Layer 2 scroll and BG2 scroll)
    dl $7E09CE : db $02 : dw $0022 ; Pbs
    dl $7E09D0 : db $02 : dw $0028 ; Max pbs
    dl $7E0AF6 : db $02 : dw $07C9 ; Samus X
    dl $7E0AFA : db $02 : dw $008B ; Samus Y
    dl $7ED87A : db $02 : dw $62FF ; Events, Items, Doors
    dl $7ED8CA : db $02 : dw $0F10 ; Events, Items, Doors
    dl $7ED91A : db $02 : dw $0164 ; Events, Items, Doors
    dw #$FFFF
.after

preset_SZM101_pirate_ship_ridley_kihunter_zoo:
    dw #preset_SZM101_pirate_ship_ridley_super_speed_space_jump ; Pirate Ship Ridley: Super Speed Space Jump
    dl $7E078D : db $02 : dw $A3CC ; DDB
    dl $7E079B : db $02 : dw $C0E4 ; MDB
    dl $7E0911 : db $02 : dw $01F0 ; Screen X position in pixels
    dl $7E0913 : db $02 : dw $0C00 ; Screen subpixel Y position
    dl $7E0915 : db $02 : dw $0300 ; Screen Y position in pixels
    dl $7E0917 : db $02 : dw $01F0 ; Layer 2 X scroll in room in pixels?
    dl $7E0919 : db $02 : dw $0300 ; Layer 2 Y scroll in room in pixels? (up = positive)
    dl $7E0921 : db $02 : dw $0100 ; BG2 X scroll offset due to room transitions (Translates between Layer 2 scroll and BG2 scroll)
    dl $7E0923 : db $02 : dw $FF00 ; BG2 Y scroll offset due to room transitions (Translates between Layer 2 scroll and BG2 scroll)
    dl $7E09C2 : db $02 : dw $04D8 ; Health
    dl $7E09C6 : db $02 : dw $0098 ; Missiles
    dl $7E09CA : db $02 : dw $0021 ; Supers
    dl $7E09CE : db $02 : dw $0023 ; Pbs
    dl $7E09D0 : db $02 : dw $002A ; Max pbs
    dl $7E0A1C : db $02 : dw $0001 ; Samus position/state
    dl $7E0A1E : db $02 : dw $0008 ; More position/state
    dl $7E0AF6 : db $02 : dw $0250 ; Samus X
    dl $7E0AFA : db $02 : dw $03AB ; Samus Y
    dl $7E0B3F : db $02 : dw $0004 ; Blue suit
    dl $7ED87A : db $02 : dw $E2FF ; Events, Items, Doors
    dl $7ED91A : db $02 : dw $0165 ; Events, Items, Doors
    dw #$FFFF
.after

preset_SZM101_pirate_ship_ridley_under_the_ship:
    dw #preset_SZM101_pirate_ship_ridley_kihunter_zoo ; Pirate Ship Ridley: Kihunter Zoo
    dl $7E078D : db $02 : dw $A564 ; DDB
    dl $7E078F : db $02 : dw $0000 ; DoorOut Index
    dl $7E0911 : db $02 : dw $016E ; Screen X position in pixels
    dl $7E0913 : db $02 : dw $9BFF ; Screen subpixel Y position
    dl $7E0915 : db $02 : dw $0222 ; Screen Y position in pixels
    dl $7E0917 : db $02 : dw $016E ; Layer 2 X scroll in room in pixels?
    dl $7E0919 : db $02 : dw $0222 ; Layer 2 Y scroll in room in pixels? (up = positive)
    dl $7E0921 : db $02 : dw $FD00 ; BG2 X scroll offset due to room transitions (Translates between Layer 2 scroll and BG2 scroll)
    dl $7E0923 : db $02 : dw $FD00 ; BG2 Y scroll offset due to room transitions (Translates between Layer 2 scroll and BG2 scroll)
    dl $7E09CA : db $02 : dw $0023 ; Supers
    dl $7E09CC : db $02 : dw $002E ; Max supers
    dl $7E09CE : db $02 : dw $0020 ; Pbs
    dl $7E09D4 : db $02 : dw $0190 ; Max reserves
    dl $7E0A1C : db $02 : dw $0002 ; Samus position/state
    dl $7E0A1E : db $02 : dw $0004 ; More position/state
    dl $7E0AF6 : db $02 : dw $020E ; Samus X
    dl $7E0AFA : db $02 : dw $02AB ; Samus Y
    dl $7E0B3F : db $02 : dw $0000 ; Blue suit
    dl $7ED876 : db $02 : dw $FFBD ; Events, Items, Doors
    dl $7ED87E : db $02 : dw $FC9F ; Events, Items, Doors
    dl $7ED8CA : db $02 : dw $0F50 ; Events, Items, Doors
    dl $7ED91A : db $02 : dw $0168 ; Events, Items, Doors
    dw #$FFFF
.after

preset_SZM101_pirate_ship_ridley_tease_pbs:
    dw #preset_SZM101_pirate_ship_ridley_under_the_ship ; Pirate Ship Ridley: Under The Ship
    dl $7E078D : db $02 : dw $BAA4 ; DDB
    dl $7E078F : db $02 : dw $0002 ; DoorOut Index
    dl $7E079B : db $02 : dw $D16D ; MDB
    dl $7E079F : db $02 : dw $0004 ; Region
    dl $7E07C3 : db $02 : dw $F911 ; GFX Pointers
    dl $7E07C5 : db $02 : dw $15BA ; GFX Pointers
    dl $7E07C7 : db $02 : dw $C2B0 ; GFX Pointers
    dl $7E090F : db $02 : dw $8F80 ; Screen subpixel X position.
    dl $7E0911 : db $02 : dw $0600 ; Screen X position in pixels
    dl $7E0913 : db $02 : dw $2800 ; Screen subpixel Y position
    dl $7E0915 : db $02 : dw $0100 ; Screen Y position in pixels
    dl $7E0917 : db $02 : dw $0480 ; Layer 2 X scroll in room in pixels?
    dl $7E0919 : db $02 : dw $0100 ; Layer 2 Y scroll in room in pixels? (up = positive)
    dl $7E0921 : db $02 : dw $0100 ; BG2 X scroll offset due to room transitions (Translates between Layer 2 scroll and BG2 scroll)
    dl $7E0923 : db $02 : dw $0000 ; BG2 Y scroll offset due to room transitions (Translates between Layer 2 scroll and BG2 scroll)
    dl $7E09C2 : db $02 : dw $04C9 ; Health
    dl $7E0A1C : db $02 : dw $0001 ; Samus position/state
    dl $7E0A1E : db $02 : dw $0008 ; More position/state
    dl $7E0AF6 : db $02 : dw $06CB ; Samus X
    dl $7E0AFA : db $02 : dw $018B ; Samus Y
    dl $7ED91A : db $02 : dw $0169 ; Events, Items, Doors
    dw #$FFFF
.after

preset_SZM101_pirate_ship_ridley_flappy_birds:
    dw #preset_SZM101_pirate_ship_ridley_tease_pbs ; Pirate Ship Ridley: Tease PBs
    dl $7E078D : db $02 : dw $A21C ; DDB
    dl $7E078F : db $02 : dw $0003 ; DoorOut Index
    dl $7E079B : db $02 : dw $8B64 ; MDB
    dl $7E090F : db $02 : dw $0000 ; Screen subpixel X position.
    dl $7E0911 : db $02 : dw $0118 ; Screen X position in pixels
    dl $7E0913 : db $02 : dw $0000 ; Screen subpixel Y position
    dl $7E0915 : db $02 : dw $032B ; Screen Y position in pixels
    dl $7E0917 : db $02 : dw $00D2 ; Layer 2 X scroll in room in pixels?
    dl $7E0919 : db $02 : dw $0260 ; Layer 2 Y scroll in room in pixels? (up = positive)
    dl $7E0921 : db $02 : dw $0000 ; BG2 X scroll offset due to room transitions (Translates between Layer 2 scroll and BG2 scroll)
    dl $7E09C2 : db $02 : dw $04E1 ; Health
    dl $7E09D6 : db $02 : dw $00CE ; Reserves
    dl $7E0A1C : db $02 : dw $0002 ; Samus position/state
    dl $7E0A1E : db $02 : dw $0004 ; More position/state
    dl $7E0A68 : db $02 : dw $0021 ; Flash suit
    dl $7E0AF6 : db $02 : dw $01B8 ; Samus X
    dl $7E0AFA : db $02 : dw $039B ; Samus Y
    dl $7ED890 : db $02 : dw $0101 ; Events, Items, Doors
    dl $7ED91A : db $02 : dw $016C ; Events, Items, Doors
    dw #$FFFF
.after

preset_SZM101_pirate_ship_ridley_flappy_exit:
    dw #preset_SZM101_pirate_ship_ridley_flappy_birds ; Pirate Ship Ridley: Flappy Birds
    dl $7E078D : db $02 : dw $B870 ; DDB
    dl $7E078F : db $02 : dw $0002 ; DoorOut Index
    dl $7E079B : db $02 : dw $D055 ; MDB
    dl $7E090F : db $02 : dw $D000 ; Screen subpixel X position.
    dl $7E0911 : db $02 : dw $0E00 ; Screen X position in pixels
    dl $7E0913 : db $02 : dw $7C00 ; Screen subpixel Y position
    dl $7E0915 : db $02 : dw $001B ; Screen Y position in pixels
    dl $7E0917 : db $02 : dw $0E00 ; Layer 2 X scroll in room in pixels?
    dl $7E0919 : db $02 : dw $001B ; Layer 2 Y scroll in room in pixels? (up = positive)
    dl $7E0921 : db $02 : dw $F100 ; BG2 X scroll offset due to room transitions (Translates between Layer 2 scroll and BG2 scroll)
    dl $7E09C6 : db $02 : dw $009D ; Missiles
    dl $7E09C8 : db $02 : dw $00D7 ; Max missiles
    dl $7E0A1C : db $02 : dw $0001 ; Samus position/state
    dl $7E0A1E : db $02 : dw $0008 ; More position/state
    dl $7E0A68 : db $02 : dw $0083 ; Flash suit
    dl $7E0AF6 : db $02 : dw $0EC1 ; Samus X
    dl $7E0AFA : db $02 : dw $008B ; Samus Y
    dl $7ED874 : db $02 : dw $E5FF ; Events, Items, Doors
    dl $7ED91A : db $02 : dw $016D ; Events, Items, Doors
    dw #$FFFF
.after

preset_SZM101_pirate_ship_ridley_tube_break:
    dw #preset_SZM101_pirate_ship_ridley_flappy_exit ; Pirate Ship Ridley: Flappy Exit
    dl $7E078D : db $02 : dw $A414 ; DDB
    dl $7E078F : db $02 : dw $0000 ; DoorOut Index
    dl $7E079B : db $02 : dw $CE8A ; MDB
    dl $7E07C5 : db $02 : dw $43BA ; GFX Pointers
    dl $7E07C7 : db $02 : dw $C2AF ; GFX Pointers
    dl $7E090F : db $02 : dw $0000 ; Screen subpixel X position.
    dl $7E0911 : db $02 : dw $000B ; Screen X position in pixels
    dl $7E0915 : db $02 : dw $0300 ; Screen Y position in pixels
    dl $7E0917 : db $02 : dw $000B ; Layer 2 X scroll in room in pixels?
    dl $7E0919 : db $02 : dw $0300 ; Layer 2 Y scroll in room in pixels? (up = positive)
    dl $7E0921 : db $02 : dw $FC00 ; BG2 X scroll offset due to room transitions (Translates between Layer 2 scroll and BG2 scroll)
    dl $7E0923 : db $02 : dw $FE00 ; BG2 Y scroll offset due to room transitions (Translates between Layer 2 scroll and BG2 scroll)
    dl $7E09C2 : db $02 : dw $0545 ; Health
    dl $7E09C4 : db $02 : dw $0545 ; Max health
    dl $7E09C6 : db $02 : dw $00A2 ; Missiles
    dl $7E09C8 : db $02 : dw $00DC ; Max missiles
    dl $7E09CA : db $02 : dw $0022 ; Supers
    dl $7E09CE : db $02 : dw $001E ; Pbs
    dl $7E09D6 : db $02 : dw $00D8 ; Reserves
    dl $7E0A1C : db $02 : dw $0002 ; Samus position/state
    dl $7E0A1E : db $02 : dw $0004 ; More position/state
    dl $7E0A68 : db $02 : dw $0000 ; Flash suit
    dl $7E0AF6 : db $02 : dw $007F ; Samus X
    dl $7E0AFA : db $02 : dw $038B ; Samus Y
    dl $7ED874 : db $02 : dw $EDFF ; Events, Items, Doors
    dl $7ED87E : db $02 : dw $FF9F ; Events, Items, Doors
    dl $7ED91A : db $02 : dw $0174 ; Events, Items, Doors
    dw #$FFFF
.after

preset_SZM101_pirate_ship_ridley_kihopper_ramp_down:
    dw #preset_SZM101_pirate_ship_ridley_tube_break ; Pirate Ship Ridley: Tube Break
    dl $7E078D : db $02 : dw $A78C ; DDB
    dl $7E078F : db $02 : dw $0001 ; DoorOut Index
    dl $7E079B : db $02 : dw $8852 ; MDB
    dl $7E079F : db $02 : dw $0003 ; Region
    dl $7E07C3 : db $02 : dw $E78D ; GFX Pointers
    dl $7E07C5 : db $02 : dw $2EBE ; GFX Pointers
    dl $7E07C7 : db $02 : dw $C2B9 ; GFX Pointers
    dl $7E090F : db $02 : dw $F000 ; Screen subpixel X position.
    dl $7E0911 : db $02 : dw $0300 ; Screen X position in pixels
    dl $7E0913 : db $02 : dw $0800 ; Screen subpixel Y position
    dl $7E0915 : db $02 : dw $0200 ; Screen Y position in pixels
    dl $7E0917 : db $02 : dw $0300 ; Layer 2 X scroll in room in pixels?
    dl $7E0919 : db $02 : dw $0200 ; Layer 2 Y scroll in room in pixels? (up = positive)
    dl $7E09CA : db $02 : dw $0024 ; Supers
    dl $7E09CC : db $02 : dw $0030 ; Max supers
    dl $7E09CE : db $02 : dw $001D ; Pbs
    dl $7E0A1C : db $02 : dw $0001 ; Samus position/state
    dl $7E0A1E : db $02 : dw $0008 ; More position/state
    dl $7E0AF6 : db $02 : dw $0383 ; Samus X
    dl $7E0AFA : db $02 : dw $02AB ; Samus Y
    dl $7ED820 : db $02 : dw $0925 ; Events, Items, Doors
    dl $7ED876 : db $02 : dw $FFBF ; Events, Items, Doors
    dl $7ED91A : db $02 : dw $0176 ; Events, Items, Doors
    dw #$FFFF
.after

preset_SZM101_pirate_ship_ridley_worker_robot_roadblock:
    dw #preset_SZM101_pirate_ship_ridley_kihopper_ramp_down ; Pirate Ship Ridley: Kihopper Ramp Down
    dl $7E078D : db $02 : dw $8E9E ; DDB
    dl $7E078F : db $02 : dw $0000 ; DoorOut Index
    dl $7E079B : db $02 : dw $8F90 ; MDB
    dl $7E07C3 : db $02 : dw $B130 ; GFX Pointers
    dl $7E07C5 : db $02 : dw $3CBE ; GFX Pointers
    dl $7E07C7 : db $02 : dw $C2B8 ; GFX Pointers
    dl $7E090F : db $02 : dw $4000 ; Screen subpixel X position.
    dl $7E0911 : db $02 : dw $0100 ; Screen X position in pixels
    dl $7E0913 : db $02 : dw $0000 ; Screen subpixel Y position
    dl $7E0915 : db $02 : dw $04E3 ; Screen Y position in pixels
    dl $7E0917 : db $02 : dw $0100 ; Layer 2 X scroll in room in pixels?
    dl $7E0919 : db $02 : dw $04E3 ; Layer 2 Y scroll in room in pixels? (up = positive)
    dl $7E0921 : db $02 : dw $FE00 ; BG2 X scroll offset due to room transitions (Translates between Layer 2 scroll and BG2 scroll)
    dl $7E09CA : db $02 : dw $0023 ; Supers
    dl $7E09D0 : db $02 : dw $002C ; Max pbs
    dl $7E0AF6 : db $02 : dw $01DB ; Samus X
    dl $7E0AFA : db $02 : dw $054B ; Samus Y
    dl $7ED87A : db $02 : dw $F2FF ; Events, Items, Doors
    dl $7ED91A : db $02 : dw $0177 ; Events, Items, Doors
    dw #$FFFF
.after

preset_SZM101_pirate_ship_ridley_under_the_ship_2:
    dw #preset_SZM101_pirate_ship_ridley_worker_robot_roadblock ; Pirate Ship Ridley: Worker Robot Roadblock
    dl $7E078D : db $02 : dw $A6C0 ; DDB
    dl $7E090F : db $02 : dw $B000 ; Screen subpixel X position.
    dl $7E0911 : db $02 : dw $00DD ; Screen X position in pixels
    dl $7E0915 : db $02 : dw $022D ; Screen Y position in pixels
    dl $7E0917 : db $02 : dw $00DD ; Layer 2 X scroll in room in pixels?
    dl $7E0919 : db $02 : dw $022D ; Layer 2 Y scroll in room in pixels? (up = positive)
    dl $7E0923 : db $02 : dw $FB00 ; BG2 Y scroll offset due to room transitions (Translates between Layer 2 scroll and BG2 scroll)
    dl $7E09C6 : db $02 : dw $00A4 ; Missiles
    dl $7E09CE : db $02 : dw $001F ; Pbs
    dl $7E09D0 : db $02 : dw $002E ; Max pbs
    dl $7E09D6 : db $02 : dw $0114 ; Reserves
    dl $7E0AF6 : db $02 : dw $013D ; Samus X
    dl $7E0AFA : db $02 : dw $029B ; Samus Y
    dl $7ED822 : db $02 : dw $0020 ; Events, Items, Doors
    dl $7ED87A : db $02 : dw $F6FF ; Events, Items, Doors
    dl $7ED91A : db $02 : dw $017B ; Events, Items, Doors
    dw #$FFFF
.after

preset_SZM101_pirate_ship_ridley_the_lazer_part:
    dw #preset_SZM101_pirate_ship_ridley_under_the_ship_2 ; Pirate Ship Ridley: Under the Ship 2
    dl $7E078D : db $02 : dw $BBF4 ; DDB
    dl $7E078F : db $02 : dw $0004 ; DoorOut Index
    dl $7E079B : db $02 : dw $85A0 ; MDB
    dl $7E07C3 : db $02 : dw $E78D ; GFX Pointers
    dl $7E07C5 : db $02 : dw $2EBE ; GFX Pointers
    dl $7E07C7 : db $02 : dw $C2B9 ; GFX Pointers
    dl $7E090F : db $02 : dw $E000 ; Screen subpixel X position.
    dl $7E0911 : db $02 : dw $0258 ; Screen X position in pixels
    dl $7E0913 : db $02 : dw $FFFF ; Screen subpixel Y position
    dl $7E0915 : db $02 : dw $021F ; Screen Y position in pixels
    dl $7E0917 : db $02 : dw $0258 ; Layer 2 X scroll in room in pixels?
    dl $7E0919 : db $02 : dw $021F ; Layer 2 Y scroll in room in pixels? (up = positive)
    dl $7E0923 : db $02 : dw $FD00 ; BG2 Y scroll offset due to room transitions (Translates between Layer 2 scroll and BG2 scroll)
    dl $7E09CA : db $02 : dw $0027 ; Supers
    dl $7E09CC : db $02 : dw $0032 ; Max supers
    dl $7E09CE : db $02 : dw $001E ; Pbs
    dl $7E09D6 : db $02 : dw $011E ; Reserves
    dl $7E0AF6 : db $02 : dw $02F7 ; Samus X
    dl $7E0AFA : db $02 : dw $02CB ; Samus Y
    dl $7ED876 : db $02 : dw $FFFF ; Events, Items, Doors
    dl $7ED91A : db $02 : dw $017E ; Events, Items, Doors
    dw #$FFFF
.after

preset_SZM101_pirate_ship_ridley_lazer_save_room:
    dw #preset_SZM101_pirate_ship_ridley_the_lazer_part ; Pirate Ship Ridley: The Lazer Part
    dl $7E078D : db $02 : dw $A87C ; DDB
    dl $7E078F : db $02 : dw $0000 ; DoorOut Index
    dl $7E079B : db $02 : dw $C280 ; MDB
    dl $7E090F : db $02 : dw $D000 ; Screen subpixel X position.
    dl $7E0911 : db $02 : dw $0000 ; Screen X position in pixels
    dl $7E0913 : db $02 : dw $CC00 ; Screen subpixel Y position
    dl $7E0915 : db $02 : dw $0100 ; Screen Y position in pixels
    dl $7E0917 : db $02 : dw $0000 ; Layer 2 X scroll in room in pixels?
    dl $7E0919 : db $02 : dw $0100 ; Layer 2 Y scroll in room in pixels? (up = positive)
    dl $7E0921 : db $02 : dw $0100 ; BG2 X scroll offset due to room transitions (Translates between Layer 2 scroll and BG2 scroll)
    dl $7E0923 : db $02 : dw $FF00 ; BG2 Y scroll offset due to room transitions (Translates between Layer 2 scroll and BG2 scroll)
    dl $7E09CA : db $02 : dw $0025 ; Supers
    dl $7E0A1C : db $02 : dw $0002 ; Samus position/state
    dl $7E0A1E : db $02 : dw $0004 ; More position/state
    dl $7E0AF6 : db $02 : dw $0035 ; Samus X
    dl $7E0AFA : db $02 : dw $018B ; Samus Y
    dw #$FFFF
.after

preset_SZM101_pirate_ship_ridley_spaceboost_etank:
    dw #preset_SZM101_pirate_ship_ridley_lazer_save_room ; Pirate Ship Ridley: Lazer Save Room
    dl $7E078D : db $02 : dw $B780 ; DDB
    dl $7E078F : db $02 : dw $0002 ; DoorOut Index
    dl $7E079B : db $02 : dw $D461 ; MDB
    dl $7E090F : db $02 : dw $3000 ; Screen subpixel X position.
    dl $7E0911 : db $02 : dw $0400 ; Screen X position in pixels
    dl $7E0913 : db $02 : dw $9FFF ; Screen subpixel Y position
    dl $7E0915 : db $02 : dw $001F ; Screen Y position in pixels
    dl $7E0917 : db $02 : dw $0400 ; Layer 2 X scroll in room in pixels?
    dl $7E0919 : db $02 : dw $001F ; Layer 2 Y scroll in room in pixels? (up = positive)
    dl $7E0921 : db $02 : dw $FC00 ; BG2 X scroll offset due to room transitions (Translates between Layer 2 scroll and BG2 scroll)
    dl $7E09CA : db $02 : dw $0024 ; Supers
    dl $7E0A1C : db $02 : dw $0001 ; Samus position/state
    dl $7E0A1E : db $02 : dw $0008 ; More position/state
    dl $7E0AF6 : db $02 : dw $0478 ; Samus X
    dl $7E0AFA : db $02 : dw $009B ; Samus Y
    dl $7ED91A : db $02 : dw $017F ; Events, Items, Doors
    dw #$FFFF
.after

preset_SZM101_pirate_ship_ridley_two_gate:
    dw #preset_SZM101_pirate_ship_ridley_spaceboost_etank ; Pirate Ship Ridley: SpaceBoost Etank
    dl $7E078D : db $02 : dw $A648 ; DDB
    dl $7E078F : db $02 : dw $0001 ; DoorOut Index
    dl $7E079B : db $02 : dw $9F11 ; MDB
    dl $7E090F : db $02 : dw $B000 ; Screen subpixel X position.
    dl $7E0911 : db $02 : dw $0048 ; Screen X position in pixels
    dl $7E0913 : db $02 : dw $BFFF ; Screen subpixel Y position
    dl $7E0915 : db $02 : dw $0000 ; Screen Y position in pixels
    dl $7E0917 : db $02 : dw $0048 ; Layer 2 X scroll in room in pixels?
    dl $7E0919 : db $02 : dw $0000 ; Layer 2 Y scroll in room in pixels? (up = positive)
    dl $7E0921 : db $02 : dw $0000 ; BG2 X scroll offset due to room transitions (Translates between Layer 2 scroll and BG2 scroll)
    dl $7E0923 : db $02 : dw $FC00 ; BG2 Y scroll offset due to room transitions (Translates between Layer 2 scroll and BG2 scroll)
    dl $7E09A6 : db $02 : dw $100B ; Beams
    dl $7E09C2 : db $02 : dw $0577 ; Health
    dl $7E09C4 : db $02 : dw $0577 ; Max health
    dl $7E09CA : db $02 : dw $0025 ; Supers
    dl $7E0AF6 : db $02 : dw $00C7 ; Samus X
    dl $7E0AFA : db $02 : dw $008B ; Samus Y
    dl $7ED87E : db $02 : dw $FFDF ; Events, Items, Doors
    dw #$FFFF
.after

preset_SZM101_pirate_ship_ridley_ridley:
    dw #preset_SZM101_pirate_ship_ridley_two_gate ; Pirate Ship Ridley: Two Gate
    dl $7E078D : db $02 : dw $B72C ; DDB
    dl $7E078F : db $02 : dw $0003 ; DoorOut Index
    dl $7E079B : db $02 : dw $8091 ; MDB
    dl $7E079F : db $02 : dw $0002 ; Region
    dl $7E07C3 : db $02 : dw $C3F9 ; GFX Pointers
    dl $7E07C5 : db $02 : dw $E4BD ; GFX Pointers
    dl $7E07C7 : db $02 : dw $C2B5 ; GFX Pointers
    dl $7E07F5 : db $02 : dw $0003 ; Music Track
    dl $7E090F : db $02 : dw $7000 ; Screen subpixel X position.
    dl $7E0911 : db $02 : dw $0100 ; Screen X position in pixels
    dl $7E0913 : db $02 : dw $FC00 ; Screen subpixel Y position
    dl $7E0917 : db $02 : dw $0100 ; Layer 2 X scroll in room in pixels?
    dl $7E0923 : db $02 : dw $00E0 ; BG2 Y scroll offset due to room transitions (Translates between Layer 2 scroll and BG2 scroll)
    dl $7E09C2 : db $02 : dw $05DB ; Health
    dl $7E09C4 : db $02 : dw $05DB ; Max health
    dl $7E09C6 : db $02 : dw $00A9 ; Missiles
    dl $7E09C8 : db $02 : dw $00E1 ; Max missiles
    dl $7E09CA : db $02 : dw $0028 ; Supers
    dl $7E09CE : db $02 : dw $001D ; Pbs
    dl $7E0AF6 : db $02 : dw $01C4 ; Samus X
    dl $7ED874 : db $02 : dw $FDFF ; Events, Items, Doors
    dl $7ED87C : db $02 : dw $FFFF ; Events, Items, Doors
    dl $7ED87E : db $02 : dw $FFFF ; Events, Items, Doors
    dl $7ED8CE : db $02 : dw $7D50 ; Events, Items, Doors
    dl $7ED8F0 : db $02 : dw $0001 ; Events, Items, Doors
    dl $7ED91A : db $02 : dw $0182 ; Events, Items, Doors
    dw #$FFFF
.after

preset_SZM101_pirate_ship_draygon_leaving_ridley:
    dw #preset_SZM101_pirate_ship_ridley_ridley ; Pirate Ship Ridley: Ridley
    dl $7E078D : db $02 : dw $983A ; DDB
    dl $7E078F : db $02 : dw $0000 ; DoorOut Index
    dl $7E079B : db $02 : dw $B32E ; MDB
    dl $7E07F3 : db $02 : dw $0024 ; Music Bank
    dl $7E090F : db $02 : dw $D001 ; Screen subpixel X position.
    dl $7E0911 : db $02 : dw $0000 ; Screen X position in pixels
    dl $7E0913 : db $02 : dw $DC00 ; Screen subpixel Y position
    dl $7E0915 : db $02 : dw $011F ; Screen Y position in pixels
    dl $7E0917 : db $02 : dw $0000 ; Layer 2 X scroll in room in pixels?
    dl $7E0919 : db $02 : dw $00D7 ; Layer 2 Y scroll in room in pixels? (up = positive)
    dl $7E0921 : db $02 : dw $0100 ; BG2 X scroll offset due to room transitions (Translates between Layer 2 scroll and BG2 scroll)
    dl $7E0923 : db $02 : dw $FF00 ; BG2 Y scroll offset due to room transitions (Translates between Layer 2 scroll and BG2 scroll)
    dl $7E09C6 : db $02 : dw $00AF ; Missiles
    dl $7E09CA : db $02 : dw $001D ; Supers
    dl $7E09CE : db $02 : dw $001F ; Pbs
    dl $7E09D6 : db $02 : dw $012C ; Reserves
    dl $7E0A1C : db $02 : dw $0002 ; Samus position/state
    dl $7E0A1E : db $02 : dw $0004 ; More position/state
    dl $7E0AF6 : db $02 : dw $003F ; Samus X
    dl $7E0AFA : db $02 : dw $019B ; Samus Y
    dl $7ED82A : db $02 : dw $0103 ; Events, Items, Doors
    dl $7ED8CE : db $02 : dw $7F50 ; Events, Items, Doors
    dw #$FFFF
.after

preset_SZM101_pirate_ship_draygon_gunship_room:
    dw #preset_SZM101_pirate_ship_draygon_leaving_ridley ; Pirate Ship Draygon: Leaving Ridley
    dl $7E078D : db $02 : dw $8EC2 ; DDB
    dl $7E079B : db $02 : dw $E021 ; MDB
    dl $7E079F : db $02 : dw $0003 ; Region
    dl $7E07C3 : db $02 : dw $E78D ; GFX Pointers
    dl $7E07C5 : db $02 : dw $2EBE ; GFX Pointers
    dl $7E07C7 : db $02 : dw $C2B9 ; GFX Pointers
    dl $7E07F3 : db $02 : dw $000C ; Music Bank
    dl $7E07F5 : db $02 : dw $0005 ; Music Track
    dl $7E090F : db $02 : dw $F001 ; Screen subpixel X position.
    dl $7E0913 : db $02 : dw $8000 ; Screen subpixel Y position
    dl $7E0915 : db $02 : dw $01FA ; Screen Y position in pixels
    dl $7E0919 : db $02 : dw $01FA ; Layer 2 Y scroll in room in pixels? (up = positive)
    dl $7E0921 : db $02 : dw $FF00 ; BG2 X scroll offset due to room transitions (Translates between Layer 2 scroll and BG2 scroll)
    dl $7E0923 : db $02 : dw $FE00 ; BG2 Y scroll offset due to room transitions (Translates between Layer 2 scroll and BG2 scroll)
    dl $7E0A1C : db $02 : dw $0001 ; Samus position/state
    dl $7E0A1E : db $02 : dw $0008 ; More position/state
    dl $7E0AF6 : db $02 : dw $00CF ; Samus X
    dl $7E0AFA : db $02 : dw $028B ; Samus Y
    dl $7ED822 : db $02 : dw $0021 ; Events, Items, Doors
    dl $7ED91A : db $02 : dw $0184 ; Events, Items, Doors
    dw #$FFFF
.after

preset_SZM101_pirate_ship_draygon_underground_path:
    dw #preset_SZM101_pirate_ship_draygon_gunship_room ; Pirate Ship Draygon: Gunship Room
    dl $7E078D : db $02 : dw $8EDA ; DDB
    dl $7E078F : db $02 : dw $0002 ; DoorOut Index
    dl $7E079B : db $02 : dw $9F11 ; MDB
    dl $7E090F : db $02 : dw $0000 ; Screen subpixel X position.
    dl $7E0913 : db $02 : dw $1800 ; Screen subpixel Y position
    dl $7E0915 : db $02 : dw $0300 ; Screen Y position in pixels
    dl $7E0919 : db $02 : dw $0300 ; Layer 2 Y scroll in room in pixels? (up = positive)
    dl $7E0921 : db $02 : dw $0100 ; BG2 X scroll offset due to room transitions (Translates between Layer 2 scroll and BG2 scroll)
    dl $7E09C2 : db $02 : dw $0577 ; Health
    dl $7E09D0 : db $02 : dw $0030 ; Max pbs
    dl $7E0AF6 : db $02 : dw $0060 ; Samus X
    dl $7E0AFA : db $02 : dw $039B ; Samus Y
    dl $7ED87A : db $02 : dw $F7FF ; Events, Items, Doors
    dl $7ED91A : db $02 : dw $0185 ; Events, Items, Doors
    dw #$FFFF
.after

preset_SZM101_pirate_ship_draygon_green_lazers:
    dw #preset_SZM101_pirate_ship_draygon_underground_path ; Pirate Ship Draygon: Underground Path
    dl $7E078D : db $02 : dw $B798 ; DDB
    dl $7E078F : db $02 : dw $0001 ; DoorOut Index
    dl $7E079B : db $02 : dw $9879 ; MDB
    dl $7E090F : db $02 : dw $3000 ; Screen subpixel X position.
    dl $7E0913 : db $02 : dw $B800 ; Screen subpixel Y position
    dl $7E0915 : db $02 : dw $0000 ; Screen Y position in pixels
    dl $7E0919 : db $02 : dw $0000 ; Layer 2 Y scroll in room in pixels? (up = positive)
    dl $7E0923 : db $02 : dw $0000 ; BG2 Y scroll offset due to room transitions (Translates between Layer 2 scroll and BG2 scroll)
    dl $7E09C2 : db $02 : dw $0538 ; Health
    dl $7E09C6 : db $02 : dw $00B1 ; Missiles
    dl $7E09CE : db $02 : dw $001E ; Pbs
    dl $7E0A1C : db $02 : dw $0002 ; Samus position/state
    dl $7E0A1E : db $02 : dw $0004 ; More position/state
    dl $7E0AF6 : db $02 : dw $009B ; Samus X
    dl $7E0AFA : db $02 : dw $008B ; Samus Y
    dw #$FFFF
.after

preset_SZM101_pirate_ship_draygon_jetpack_pirates:
    dw #preset_SZM101_pirate_ship_draygon_green_lazers ; Pirate Ship Draygon: Green Lazers
    dl $7E078D : db $02 : dw $AEE8 ; DDB
    dl $7E078F : db $02 : dw $0000 ; DoorOut Index
    dl $7E079B : db $02 : dw $CE40 ; MDB
    dl $7E090F : db $02 : dw $AFFF ; Screen subpixel X position.
    dl $7E0911 : db $02 : dw $0100 ; Screen X position in pixels
    dl $7E0913 : db $02 : dw $9000 ; Screen subpixel Y position
    dl $7E0915 : db $02 : dw $0008 ; Screen Y position in pixels
    dl $7E0917 : db $02 : dw $0100 ; Layer 2 X scroll in room in pixels?
    dl $7E0919 : db $02 : dw $0008 ; Layer 2 Y scroll in room in pixels? (up = positive)
    dl $7E0921 : db $02 : dw $FE00 ; BG2 X scroll offset due to room transitions (Translates between Layer 2 scroll and BG2 scroll)
    dl $7E0923 : db $02 : dw $FE00 ; BG2 Y scroll offset due to room transitions (Translates between Layer 2 scroll and BG2 scroll)
    dl $7E09C2 : db $02 : dw $0529 ; Health
    dl $7E0A1C : db $02 : dw $0001 ; Samus position/state
    dl $7E0A1E : db $02 : dw $0008 ; More position/state
    dl $7E0AF6 : db $02 : dw $01C9 ; Samus X
    dw #$FFFF
.after

preset_SZM101_pirate_ship_draygon_one_try_lazer_skip:
    dw #preset_SZM101_pirate_ship_draygon_jetpack_pirates ; Pirate Ship Draygon: Jetpack Pirates
    dl $7E078D : db $02 : dw $B7A4 ; DDB
    dl $7E078F : db $02 : dw $0002 ; DoorOut Index
    dl $7E079B : db $02 : dw $8A31 ; MDB
    dl $7E090F : db $02 : dw $0000 ; Screen subpixel X position.
    dl $7E0913 : db $02 : dw $6800 ; Screen subpixel Y position
    dl $7E0915 : db $02 : dw $001D ; Screen Y position in pixels
    dl $7E0919 : db $02 : dw $001D ; Layer 2 Y scroll in room in pixels? (up = positive)
    dl $7E0921 : db $02 : dw $0100 ; BG2 X scroll offset due to room transitions (Translates between Layer 2 scroll and BG2 scroll)
    dl $7E0923 : db $02 : dw $FF00 ; BG2 Y scroll offset due to room transitions (Translates between Layer 2 scroll and BG2 scroll)
    dl $7E09C2 : db $02 : dw $0493 ; Health
    dl $7E09C6 : db $02 : dw $00B3 ; Missiles
    dl $7E0AF6 : db $02 : dw $01B1 ; Samus X
    dl $7ED8CA : db $02 : dw $0FD0 ; Events, Items, Doors
    dw #$FFFF
.after

preset_SZM101_pirate_ship_draygon_draygon:
    dw #preset_SZM101_pirate_ship_draygon_one_try_lazer_skip ; Pirate Ship Draygon: One Try Lazer Skip
    dl $7E078D : db $02 : dw $A4E0 ; DDB
    dl $7E078F : db $02 : dw $0001 ; DoorOut Index
    dl $7E079B : db $02 : dw $8B12 ; MDB
    dl $7E090F : db $02 : dw $F5FF ; Screen subpixel X position.
    dl $7E0911 : db $02 : dw $0000 ; Screen X position in pixels
    dl $7E0913 : db $02 : dw $C800 ; Screen subpixel Y position
    dl $7E0915 : db $02 : dw $0000 ; Screen Y position in pixels
    dl $7E0917 : db $02 : dw $0000 ; Layer 2 X scroll in room in pixels?
    dl $7E0919 : db $02 : dw $0000 ; Layer 2 Y scroll in room in pixels? (up = positive)
    dl $7E0923 : db $02 : dw $0000 ; BG2 Y scroll offset due to room transitions (Translates between Layer 2 scroll and BG2 scroll)
    dl $7E09C2 : db $02 : dw $048D ; Health
    dl $7E09C6 : db $02 : dw $00B7 ; Missiles
    dl $7E09CA : db $02 : dw $0022 ; Supers
    dl $7E09CE : db $02 : dw $001F ; Pbs
    dl $7E09D0 : db $02 : dw $0032 ; Max pbs
    dl $7E0AF6 : db $02 : dw $00C5 ; Samus X
    dl $7ED82A : db $02 : dw $0003 ; Events, Items, Doors
    dl $7ED87A : db $02 : dw $FFFF ; Events, Items, Doors
    dl $7ED8CE : db $02 : dw $7F52 ; Events, Items, Doors
    dl $7ED91A : db $02 : dw $0186 ; Events, Items, Doors
    dw #$FFFF
.after

preset_SZM101_pirate_ship_draygon_boss_missile:
    dw #preset_SZM101_pirate_ship_draygon_draygon ; Pirate Ship Draygon: Draygon
    dl $7E078D : db $02 : dw $AA44 ; DDB
    dl $7E079B : db $02 : dw $DA60 ; MDB
    dl $7E07C3 : db $02 : dw $9DEA ; GFX Pointers
    dl $7E07C5 : db $02 : dw $2CBF ; GFX Pointers
    dl $7E07C7 : db $02 : dw $C2BA ; GFX Pointers
    dl $7E07F3 : db $02 : dw $0024 ; Music Bank
    dl $7E07F5 : db $02 : dw $0003 ; Music Track
    dl $7E090F : db $02 : dw $6000 ; Screen subpixel X position.
    dl $7E0911 : db $02 : dw $0100 ; Screen X position in pixels
    dl $7E0913 : db $02 : dw $0000 ; Screen subpixel Y position
    dl $7E0915 : db $02 : dw $001D ; Screen Y position in pixels
    dl $7E0917 : db $02 : dw $0001 ; Layer 2 X scroll in room in pixels?
    dl $7E0923 : db $02 : dw $FF00 ; BG2 Y scroll offset due to room transitions (Translates between Layer 2 scroll and BG2 scroll)
    dl $7E09C2 : db $02 : dw $0190 ; Health
    dl $7E09C6 : db $02 : dw $0022 ; Missiles
    dl $7E09CA : db $02 : dw $0012 ; Supers
    dl $7E09CE : db $02 : dw $0029 ; Pbs
    dl $7E0AF6 : db $02 : dw $01C3 ; Samus X
    dl $7ED82A : db $02 : dw $0103 ; Events, Items, Doors
    dl $7ED848 : db $02 : dw $0101 ; Events, Items, Doors
    dl $7ED8B2 : db $02 : dw $0002 ; Events, Items, Doors
    dl $7ED91A : db $02 : dw $0188 ; Events, Items, Doors
    dw #$FFFF
.after

preset_SZM101_pirate_ship_draygon_four_key_shutters:
    dw #preset_SZM101_pirate_ship_draygon_boss_missile ; Pirate Ship Draygon: Boss Missile
    dl $7E078D : db $02 : dw $BFDC ; DDB
    dl $7E079B : db $02 : dw $BD50 ; MDB
    dl $7E07C3 : db $02 : dw $E78D ; GFX Pointers
    dl $7E07C5 : db $02 : dw $2EBE ; GFX Pointers
    dl $7E07C7 : db $02 : dw $C2B9 ; GFX Pointers
    dl $7E07F5 : db $02 : dw $0007 ; Music Track
    dl $7E090F : db $02 : dw $E000 ; Screen subpixel X position.
    dl $7E0911 : db $02 : dw $0000 ; Screen X position in pixels
    dl $7E0913 : db $02 : dw $2800 ; Screen subpixel Y position
    dl $7E0915 : db $02 : dw $0100 ; Screen Y position in pixels
    dl $7E0917 : db $02 : dw $0000 ; Layer 2 X scroll in room in pixels?
    dl $7E0919 : db $02 : dw $0100 ; Layer 2 Y scroll in room in pixels? (up = positive)
    dl $7E0921 : db $02 : dw $0000 ; BG2 X scroll offset due to room transitions (Translates between Layer 2 scroll and BG2 scroll)
    dl $7E0923 : db $02 : dw $FFE0 ; BG2 Y scroll offset due to room transitions (Translates between Layer 2 scroll and BG2 scroll)
    dl $7E09C6 : db $02 : dw $0027 ; Missiles
    dl $7E09C8 : db $02 : dw $00E6 ; Max missiles
    dl $7E0A1C : db $02 : dw $0002 ; Samus position/state
    dl $7E0A1E : db $02 : dw $0004 ; More position/state
    dl $7E0AF6 : db $02 : dw $0035 ; Samus X
    dl $7E0AFA : db $02 : dw $018B ; Samus Y
    dl $7ED820 : db $02 : dw $4925 ; Events, Items, Doors
    dl $7ED82A : db $02 : dw $0303 ; Events, Items, Doors
    dl $7ED882 : db $02 : dw $0001 ; Events, Items, Doors
    dl $7ED91A : db $02 : dw $0189 ; Events, Items, Doors
    dw #$FFFF
.after

preset_SZM101_pirate_ship_draygon_ninja_pirates_2:
    dw #preset_SZM101_pirate_ship_draygon_four_key_shutters ; Pirate Ship Draygon: Four Key Shutters
    dl $7E078D : db $02 : dw $BB88 ; DDB
    dl $7E078F : db $02 : dw $0000 ; DoorOut Index
    dl $7E079B : db $02 : dw $CE40 ; MDB
    dl $7E090F : db $02 : dw $3000 ; Screen subpixel X position.
    dl $7E0911 : db $02 : dw $0095 ; Screen X position in pixels
    dl $7E0915 : db $02 : dw $0200 ; Screen Y position in pixels
    dl $7E0917 : db $02 : dw $0095 ; Layer 2 X scroll in room in pixels?
    dl $7E0919 : db $02 : dw $0200 ; Layer 2 Y scroll in room in pixels? (up = positive)
    dl $7E0921 : db $02 : dw $FE00 ; BG2 X scroll offset due to room transitions (Translates between Layer 2 scroll and BG2 scroll)
    dl $7E0923 : db $02 : dw $0000 ; BG2 Y scroll offset due to room transitions (Translates between Layer 2 scroll and BG2 scroll)
    dl $7E09C6 : db $02 : dw $0029 ; Missiles
    dl $7E09CA : db $02 : dw $0011 ; Supers
    dl $7E0A1C : db $02 : dw $0001 ; Samus position/state
    dl $7E0A1E : db $02 : dw $0008 ; More position/state
    dl $7E0AF6 : db $02 : dw $012E ; Samus X
    dl $7E0AFA : db $02 : dw $027B ; Samus Y
    dw #$FFFF
.after

preset_SZM101_pirate_ship_draygon_in_the_way_blocks:
    dw #preset_SZM101_pirate_ship_draygon_ninja_pirates_2 ; Pirate Ship Draygon: Ninja Pirates
    dl $7E078D : db $02 : dw $B834 ; DDB
    dl $7E078F : db $02 : dw $0001 ; DoorOut Index
    dl $7E079B : db $02 : dw $DFD7 ; MDB
    dl $7E090F : db $02 : dw $5FFF ; Screen subpixel X position.
    dl $7E0911 : db $02 : dw $0000 ; Screen X position in pixels
    dl $7E0917 : db $02 : dw $0000 ; Layer 2 X scroll in room in pixels?
    dl $7E0919 : db $02 : dw $0180 ; Layer 2 Y scroll in room in pixels? (up = positive)
    dl $7E09D6 : db $02 : dw $0000 ; Reserves
    dl $7E0A1C : db $02 : dw $0002 ; Samus position/state
    dl $7E0A1E : db $02 : dw $0004 ; More position/state
    dl $7E0AF6 : db $02 : dw $003C ; Samus X
    dl $7E0AFA : db $02 : dw $028B ; Samus Y
    dl $7ED8C8 : db $02 : dw $13F7 ; Events, Items, Doors
    dw #$FFFF
.after

preset_SZM101_pirate_ship_draygon_animal_room:
    dw #preset_SZM101_pirate_ship_draygon_in_the_way_blocks ; Pirate Ship Draygon: In The Way Blocks
    dl $7E078D : db $02 : dw $BA80 ; DDB
    dl $7E078F : db $02 : dw $0004 ; DoorOut Index
    dl $7E079B : db $02 : dw $D5EC ; MDB
    dl $7E090F : db $02 : dw $3000 ; Screen subpixel X position.
    dl $7E0913 : db $02 : dw $D800 ; Screen subpixel Y position
    dl $7E0915 : db $02 : dw $0000 ; Screen Y position in pixels
    dl $7E0919 : db $02 : dw $0000 ; Layer 2 Y scroll in room in pixels? (up = positive)
    dl $7E0921 : db $02 : dw $0000 ; BG2 X scroll offset due to room transitions (Translates between Layer 2 scroll and BG2 scroll)
    dl $7E0923 : db $02 : dw $00E0 ; BG2 Y scroll offset due to room transitions (Translates between Layer 2 scroll and BG2 scroll)
    dl $7E09CE : db $02 : dw $0028 ; Pbs
    dl $7E0AF6 : db $02 : dw $0025 ; Samus X
    dl $7E0AFA : db $02 : dw $00BB ; Samus Y
    dl $7ED820 : db $02 : dw $C925 ; Events, Items, Doors
    dl $7ED8B2 : db $02 : dw $1002 ; Events, Items, Doors
    dl $7ED91A : db $02 : dw $018A ; Events, Items, Doors
    dw #$FFFF
.after

preset_SZM101_pirate_ship_draygon_crash_room:
    dw #preset_SZM101_pirate_ship_draygon_animal_room ; Pirate Ship Draygon: Animal Room
    dl $7E078D : db $02 : dw $A8A0 ; DDB
    dl $7E078F : db $02 : dw $0000 ; DoorOut Index
    dl $7E079B : db $02 : dw $8852 ; MDB
    dl $7E090F : db $02 : dw $6000 ; Screen subpixel X position.
    dl $7E0913 : db $02 : dw $3800 ; Screen subpixel Y position
    dl $7E0915 : db $02 : dw $01FF ; Screen Y position in pixels
    dl $7E0919 : db $02 : dw $01FF ; Layer 2 Y scroll in room in pixels? (up = positive)
    dl $7E0921 : db $02 : dw $FF00 ; BG2 X scroll offset due to room transitions (Translates between Layer 2 scroll and BG2 scroll)
    dl $7E0923 : db $02 : dw $FD00 ; BG2 Y scroll offset due to room transitions (Translates between Layer 2 scroll and BG2 scroll)
    dl $7E0AF6 : db $02 : dw $0056 ; Samus X
    dl $7E0AFA : db $02 : dw $028B ; Samus Y
    dl $7ED91A : db $02 : dw $018B ; Events, Items, Doors
    dw #$FFFF
.after

preset_SZM101_pirate_ship_draygon_dachora_room:
    dw #preset_SZM101_pirate_ship_draygon_crash_room ; Pirate Ship Draygon: Crash Room
    dl $7E078D : db $02 : dw $BA08 ; DDB
    dl $7E078F : db $02 : dw $0005 ; DoorOut Index
    dl $7E079B : db $02 : dw $E0B5 ; MDB
    dl $7E090F : db $02 : dw $4000 ; Screen subpixel X position.
    dl $7E0911 : db $02 : dw $0068 ; Screen X position in pixels
    dl $7E0913 : db $02 : dw $6400 ; Screen subpixel Y position
    dl $7E0915 : db $02 : dw $0000 ; Screen Y position in pixels
    dl $7E0917 : db $02 : dw $0068 ; Layer 2 X scroll in room in pixels?
    dl $7E0919 : db $02 : dw $0000 ; Layer 2 Y scroll in room in pixels? (up = positive)
    dl $7E0921 : db $02 : dw $FD00 ; BG2 X scroll offset due to room transitions (Translates between Layer 2 scroll and BG2 scroll)
    dl $7E0923 : db $02 : dw $FE00 ; BG2 Y scroll offset due to room transitions (Translates between Layer 2 scroll and BG2 scroll)
    dl $7E0A1C : db $02 : dw $0001 ; Samus position/state
    dl $7E0A1E : db $02 : dw $0008 ; More position/state
    dl $7E0AF6 : db $02 : dw $00F6 ; Samus X
    dl $7E0AFA : db $02 : dw $008B ; Samus Y
    dw #$FFFF
.after

preset_SZM101_pirate_ship_draygon_white_pirates:
    dw #preset_SZM101_pirate_ship_draygon_dachora_room ; Pirate Ship Draygon: Dachora Room
    dl $7E078D : db $02 : dw $AB58 ; DDB
    dl $7E078F : db $02 : dw $0000 ; DoorOut Index
    dl $7E079B : db $02 : dw $896D ; MDB
    dl $7E0911 : db $02 : dw $0214 ; Screen X position in pixels
    dl $7E0913 : db $02 : dw $9800 ; Screen subpixel Y position
    dl $7E0917 : db $02 : dw $0214 ; Layer 2 X scroll in room in pixels?
    dl $7E0921 : db $02 : dw $0100 ; BG2 X scroll offset due to room transitions (Translates between Layer 2 scroll and BG2 scroll)
    dl $7E0923 : db $02 : dw $FC00 ; BG2 Y scroll offset due to room transitions (Translates between Layer 2 scroll and BG2 scroll)
    dl $7E09C6 : db $02 : dw $002E ; Missiles
    dl $7E09C8 : db $02 : dw $00EB ; Max missiles
    dl $7E0AF6 : db $02 : dw $0285 ; Samus X
    dl $7ED874 : db $02 : dw $FFFF ; Events, Items, Doors
    dl $7ED91A : db $02 : dw $018C ; Events, Items, Doors
    dw #$FFFF
.after
