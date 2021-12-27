
preset_redesign_crateria_ceres_elevator:
    dw #$0000
    dl $7E078B : db $02 : dw $0000 ; Elevator Index
    dl $7E078D : db $02 : dw $AB58 ; DDB
    dl $7E078F : db $02 : dw $0000 ; DoorOut Index
    dl $7E079B : db $02 : dw $DF45 ; MDB
    dl $7E079F : db $02 : dw $0006 ; Region
    dl $7E07C3 : db $02 : dw $E22A ; GFX Pointers
    dl $7E07C5 : db $02 : dw $04C0 ; GFX Pointers
    dl $7E07C7 : db $02 : dw $C2C1 ; GFX Pointers
    dl $7E07F3 : db $02 : dw $002D ; Music Bank
    dl $7E07F5 : db $02 : dw $0006 ; Music Track
    dl $7E090F : db $02 : dw $0000 ; Screen subpixel X position.
    dl $7E0911 : db $02 : dw $0000 ; Screen X position in pixels
    dl $7E0913 : db $02 : dw $0000 ; Screen subpixel Y position
    dl $7E0915 : db $02 : dw $0000 ; Screen Y position in pixels
    dl $7E0917 : db $02 : dw $0000 ; Layer 2 X scroll in room in pixels?
    dl $7E0919 : db $02 : dw $0000 ; Layer 2 Y scroll in room in pixels? (up = positive)
    dl $7E0921 : db $02 : dw $0000 ; BG2 X scroll offset due to room transitions (Translates between Layer 2 scroll and BG2 scroll)
    dl $7E0923 : db $02 : dw $0000 ; BG2 Y scroll offset due to room transitions (Translates between Layer 2 scroll and BG2 scroll)
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
    dl $7E0A1C : db $02 : dw $0000 ; Samus position/state
    dl $7E0A1E : db $02 : dw $0000 ; More position/state
    dl $7E0A68 : db $02 : dw $0000 ; Flash suit
    dl $7E0A76 : db $02 : dw $0000 ; Hyper beam
    dl $7E0AF6 : db $02 : dw $0080 ; Samus X
    dl $7E0AFA : db $02 : dw $0048 ; Samus Y
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
    dl $7ED82A : db $02 : dw $0000 ; Events, Items, Doors
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
    dl $7ED914 : db $02 : dw $001F ; Events, Items, Doors
    dl $7ED916 : db $02 : dw $0000 ; Events, Items, Doors
    dl $7ED918 : db $02 : dw $0006 ; Events, Items, Doors
    dl $7ED91A : db $02 : dw $0000 ; Events, Items, Doors
    dl $7ED91C : db $02 : dw $0000 ; Events, Items, Doors
    dl $7ED91E : db $02 : dw $0000 ; Events, Items, Doors
    dw #$FFFF
.after

preset_redesign_crateria_magnet_stairs_escape:
    dw #preset_redesign_crateria_ceres_elevator ; Crateria: Ceres Elevator
    dl $7E078D : db $02 : dw $ABA0 ; DDB
    dl $7E079B : db $02 : dw $E021 ; MDB
    dl $7E07C3 : db $02 : dw $B004 ; GFX Pointers
    dl $7E07C5 : db $02 : dw $E3C0 ; GFX Pointers
    dl $7E07F3 : db $02 : dw $0024 ; Music Bank
    dl $7E07F5 : db $02 : dw $0007 ; Music Track
    dl $7E090F : db $02 : dw $C400 ; Screen subpixel X position.
    dl $7E0913 : db $02 : dw $5400 ; Screen subpixel Y position
    dl $7E0921 : db $02 : dw $FE00 ; BG2 X scroll offset due to room transitions (Translates between Layer 2 scroll and BG2 scroll)
    dl $7E093F : db $02 : dw $0002 ; Ceres escape flag
    dl $7E09C2 : db $02 : dw $0018 ; Health
    dl $7E0A1C : db $02 : dw $0002 ; Samus position/state
    dl $7E0A1E : db $02 : dw $0004 ; More position/state
    dl $7E0AF6 : db $02 : dw $0043 ; Samus X
    dl $7E0AFA : db $02 : dw $0097 ; Samus Y
    dl $7ED82E : db $02 : dw $0001 ; Events, Items, Doors
    dw #$FFFF
.after

preset_redesign_crateria_landing_site:
    dw #preset_redesign_crateria_magnet_stairs_escape ; Crateria: Magnet Stairs Escape
    dl $7E078D : db $02 : dw $88FE ; DDB
    dl $7E079B : db $02 : dw $91F8 ; MDB
    dl $7E079F : db $02 : dw $0000 ; Region
    dl $7E07C3 : db $02 : dw $C629 ; GFX Pointers
    dl $7E07C5 : db $02 : dw $7CBA ; GFX Pointers
    dl $7E07C7 : db $02 : dw $C2AD ; GFX Pointers
    dl $7E07F3 : db $02 : dw $0006 ; Music Bank
    dl $7E07F5 : db $02 : dw $0005 ; Music Track
    dl $7E090F : db $02 : dw $5000 ; Screen subpixel X position.
    dl $7E0911 : db $02 : dw $0400 ; Screen X position in pixels
    dl $7E0913 : db $02 : dw $0000 ; Screen subpixel Y position
    dl $7E0915 : db $02 : dw $03D0 ; Screen Y position in pixels
    dl $7E0917 : db $02 : dw $0300 ; Layer 2 X scroll in room in pixels?
    dl $7E0919 : db $02 : dw $02DC ; Layer 2 Y scroll in room in pixels? (up = positive)
    dl $7E0921 : db $02 : dw $0300 ; BG2 X scroll offset due to room transitions (Translates between Layer 2 scroll and BG2 scroll)
    dl $7E093F : db $02 : dw $0000 ; Ceres escape flag
    dl $7E09C2 : db $02 : dw $0063 ; Health
    dl $7E0A1C : db $02 : dw $0000 ; Samus position/state
    dl $7E0A1E : db $02 : dw $0000 ; More position/state
    dl $7E0AF6 : db $02 : dw $0481 ; Samus X
    dl $7E0AFA : db $02 : dw $0440 ; Samus Y
    dl $7ED7F8 : db $02 : dw $001E ; SRAM copy
    dl $7ED7FA : db $02 : dw $0012 ; SRAM copy
    dl $7ED7FC : db $02 : dw $0001 ; SRAM copy
    dl $7ED8F8 : db $02 : dw $0001 ; Events, Items, Doors
    dl $7ED914 : db $02 : dw $0005 ; Events, Items, Doors
    dl $7ED918 : db $02 : dw $0000 ; Events, Items, Doors
    dl $7ED91A : db $02 : dw $0001 ; Events, Items, Doors
    dl $7ED91C : db $02 : dw $0020 ; Events, Items, Doors
    dw #$FFFF
.after

preset_redesign_crateria_ledge_room:
    dw #preset_redesign_crateria_landing_site ; Crateria: Landing Site
    dl $7E078D : db $02 : dw $8976 ; DDB
    dl $7E078F : db $02 : dw $0002 ; DoorOut Index
    dl $7E079B : db $02 : dw $96BA ; MDB
    dl $7E090F : db $02 : dw $E800 ; Screen subpixel X position.
    dl $7E0911 : db $02 : dw $0800 ; Screen X position in pixels
    dl $7E0913 : db $02 : dw $7A00 ; Screen subpixel Y position
    dl $7E0915 : db $02 : dw $011F ; Screen Y position in pixels
    dl $7E0917 : db $02 : dw $0600 ; Layer 2 X scroll in room in pixels?
    dl $7E0919 : db $02 : dw $00D7 ; Layer 2 Y scroll in room in pixels? (up = positive)
    dl $7E0921 : db $02 : dw $FD00 ; BG2 X scroll offset due to room transitions (Translates between Layer 2 scroll and BG2 scroll)
    dl $7E0A1C : db $02 : dw $0001 ; Samus position/state
    dl $7E0A1E : db $02 : dw $0008 ; More position/state
    dl $7E0AF6 : db $02 : dw $088E ; Samus X
    dl $7E0AFA : db $02 : dw $019B ; Samus Y
    dl $7ED91A : db $02 : dw $0007 ; Events, Items, Doors
    dw #$FFFF
.after

preset_redesign_crateria_leaving_morph:
    dw #preset_redesign_crateria_ledge_room ; Crateria: Ledge Room
    dl $7E078D : db $02 : dw $8ECE ; DDB
    dl $7E078F : db $02 : dw $0001 ; DoorOut Index
    dl $7E079B : db $02 : dw $CDF1 ; MDB
    dl $7E07F5 : db $02 : dw $0007 ; Music Track
    dl $7E090F : db $02 : dw $FC00 ; Screen subpixel X position.
    dl $7E0911 : db $02 : dw $0000 ; Screen X position in pixels
    dl $7E0913 : db $02 : dw $3800 ; Screen subpixel Y position
    dl $7E0917 : db $02 : dw $0000 ; Layer 2 X scroll in room in pixels?
    dl $7E0921 : db $02 : dw $0100 ; BG2 X scroll offset due to room transitions (Translates between Layer 2 scroll and BG2 scroll)
    dl $7E0923 : db $02 : dw $FF00 ; BG2 Y scroll offset due to room transitions (Translates between Layer 2 scroll and BG2 scroll)
    dl $7E09A2 : db $02 : dw $0004 ; Equipped Items
    dl $7E09A4 : db $02 : dw $0004 ; Collected Items
    dl $7E0A1C : db $02 : dw $0002 ; Samus position/state
    dl $7E0A1E : db $02 : dw $0004 ; More position/state
    dl $7E0AF6 : db $02 : dw $0086 ; Samus X
    dl $7ED87C : db $02 : dw $0200 ; Events, Items, Doors
    dl $7ED91A : db $02 : dw $000A ; Events, Items, Doors
    dw #$FFFF
.after

preset_redesign_crateria_pirate_ledge_room:
    dw #preset_redesign_crateria_leaving_morph ; Crateria: Leaving Morph
    dl $7E078D : db $02 : dw $8FA6 ; DDB
    dl $7E078F : db $02 : dw $0000 ; DoorOut Index
    dl $7E079B : db $02 : dw $9F11 ; MDB
    dl $7E090F : db $02 : dw $8000 ; Screen subpixel X position.
    dl $7E0913 : db $02 : dw $5000 ; Screen subpixel Y position
    dl $7E0915 : db $02 : dw $0303 ; Screen Y position in pixels
    dl $7E0919 : db $02 : dw $0242 ; Layer 2 Y scroll in room in pixels? (up = positive)
    dl $7E0923 : db $02 : dw $0000 ; BG2 Y scroll offset due to room transitions (Translates between Layer 2 scroll and BG2 scroll)
    dl $7E09C8 : db $02 : dw $0005 ; Max missiles
    dl $7E0AF6 : db $02 : dw $0030 ; Samus X
    dl $7E0AFA : db $02 : dw $038B ; Samus Y
    dl $7ED874 : db $02 : dw $8000 ; Events, Items, Doors
    dl $7ED8B4 : db $02 : dw $0800 ; Events, Items, Doors
    dl $7ED91A : db $02 : dw $000E ; Events, Items, Doors
    dw #$FFFF
.after

preset_redesign_crateria_scree_pit:
    dw #preset_redesign_crateria_pirate_ledge_room ; Crateria: Pirate Ledge Room
    dl $7E078D : db $02 : dw $8EDA ; DDB
    dl $7E078F : db $02 : dw $0002 ; DoorOut Index
    dl $7E079B : db $02 : dw $975C ; MDB
    dl $7E07F3 : db $02 : dw $0009 ; Music Bank
    dl $7E07F5 : db $02 : dw $0005 ; Music Track
    dl $7E090F : db $02 : dw $2000 ; Screen subpixel X position.
    dl $7E0913 : db $02 : dw $7BFF ; Screen subpixel Y position
    dl $7E0915 : db $02 : dw $0107 ; Screen Y position in pixels
    dl $7E0919 : db $02 : dw $00C5 ; Layer 2 Y scroll in room in pixels? (up = positive)
    dl $7E0921 : db $02 : dw $FC00 ; BG2 X scroll offset due to room transitions (Translates between Layer 2 scroll and BG2 scroll)
    dl $7E09C6 : db $02 : dw $0005 ; Missiles
    dl $7E0AF6 : db $02 : dw $002C ; Samus X
    dl $7E0AFA : db $02 : dw $018B ; Samus Y
    dl $7ED820 : db $02 : dw $0001 ; Events, Items, Doors
    dl $7ED8B2 : db $02 : dw $0001 ; Events, Items, Doors
    dl $7ED91A : db $02 : dw $000F ; Events, Items, Doors
    dw #$FFFF
.after

preset_redesign_crateria_preship_climb:
    dw #preset_redesign_crateria_scree_pit ; Crateria: Scree Pit
    dl $7E078D : db $02 : dw $8976 ; DDB
    dl $7E079B : db $02 : dw $96BA ; MDB
    dl $7E090F : db $02 : dw $8000 ; Screen subpixel X position.
    dl $7E0911 : db $02 : dw $01F3 ; Screen X position in pixels
    dl $7E0913 : db $02 : dw $0000 ; Screen subpixel Y position
    dl $7E0915 : db $02 : dw $002B ; Screen Y position in pixels
    dl $7E0917 : db $02 : dw $0176 ; Layer 2 X scroll in room in pixels?
    dl $7E0919 : db $02 : dw $0020 ; Layer 2 Y scroll in room in pixels? (up = positive)
    dl $7E0921 : db $02 : dw $FD00 ; BG2 X scroll offset due to room transitions (Translates between Layer 2 scroll and BG2 scroll)
    dl $7E0A1C : db $02 : dw $0001 ; Samus position/state
    dl $7E0A1E : db $02 : dw $0008 ; More position/state
    dl $7E0AF6 : db $02 : dw $0292 ; Samus X
    dl $7E0AFA : db $02 : dw $009B ; Samus Y
    dl $7ED91A : db $02 : dw $0016 ; Events, Items, Doors
    dw #$FFFF
.after

preset_redesign_crateria_scree_fall:
    dw #preset_redesign_crateria_preship_climb ; Crateria: Preship Climb
    dl $7E078D : db $02 : dw $895E ; DDB
    dl $7E078F : db $02 : dw $0000 ; DoorOut Index
    dl $7E079B : db $02 : dw $91F8 ; MDB
    dl $7E07F3 : db $02 : dw $0006 ; Music Bank
    dl $7E07F5 : db $02 : dw $0006 ; Music Track
    dl $7E090F : db $02 : dw $8C00 ; Screen subpixel X position.
    dl $7E0911 : db $02 : dw $0000 ; Screen X position in pixels
    dl $7E0915 : db $02 : dw $062C ; Screen Y position in pixels
    dl $7E0917 : db $02 : dw $0000 ; Layer 2 X scroll in room in pixels?
    dl $7E0919 : db $02 : dw $04A1 ; Layer 2 Y scroll in room in pixels? (up = positive)
    dl $7E0921 : db $02 : dw $FA00 ; BG2 X scroll offset due to room transitions (Translates between Layer 2 scroll and BG2 scroll)
    dl $7E0923 : db $02 : dw $F900 ; BG2 Y scroll offset due to room transitions (Translates between Layer 2 scroll and BG2 scroll)
    dl $7E0A1C : db $02 : dw $0002 ; Samus position/state
    dl $7E0A1E : db $02 : dw $0004 ; More position/state
    dl $7E0AF6 : db $02 : dw $0080 ; Samus X
    dl $7E0AFA : db $02 : dw $069C ; Samus Y
    dl $7ED91A : db $02 : dw $001C ; Events, Items, Doors
    dw #$FFFF
.after

preset_redesign_crateria_pirate_drop:
    dw #preset_redesign_crateria_scree_fall ; Crateria: Scree Fall
    dl $7E078D : db $02 : dw $8916 ; DDB
    dl $7E079B : db $02 : dw $9A90 ; MDB
    dl $7E07F3 : db $02 : dw $0009 ; Music Bank
    dl $7E07F5 : db $02 : dw $0005 ; Music Track
    dl $7E090F : db $02 : dw $0000 ; Screen subpixel X position.
    dl $7E0915 : db $02 : dw $0510 ; Screen Y position in pixels
    dl $7E0919 : db $02 : dw $03CC ; Layer 2 Y scroll in room in pixels? (up = positive)
    dl $7E0921 : db $02 : dw $FE00 ; BG2 X scroll offset due to room transitions (Translates between Layer 2 scroll and BG2 scroll)
    dl $7E0923 : db $02 : dw $FE00 ; BG2 Y scroll offset due to room transitions (Translates between Layer 2 scroll and BG2 scroll)
    dl $7E0AF6 : db $02 : dw $0061 ; Samus X
    dl $7E0AFA : db $02 : dw $058B ; Samus Y
    dl $7ED91A : db $02 : dw $001E ; Events, Items, Doors
    dw #$FFFF
.after

preset_redesign_bombs_brin_elevator_left:
    dw #preset_redesign_crateria_pirate_drop ; Crateria: Pirate Drop
    dl $7E078D : db $02 : dw $8C16 ; DDB
    dl $7E078F : db $02 : dw $0002 ; DoorOut Index
    dl $7E079B : db $02 : dw $9938 ; MDB
    dl $7E07F5 : db $02 : dw $0003 ; Music Track
    dl $7E090F : db $02 : dw $A000 ; Screen subpixel X position.
    dl $7E0913 : db $02 : dw $8E00 ; Screen subpixel Y position
    dl $7E0915 : db $02 : dw $0000 ; Screen Y position in pixels
    dl $7E0919 : db $02 : dw $0000 ; Layer 2 Y scroll in room in pixels? (up = positive)
    dl $7E0921 : db $02 : dw $FF00 ; BG2 X scroll offset due to room transitions (Translates between Layer 2 scroll and BG2 scroll)
    dl $7E0923 : db $02 : dw $0000 ; BG2 Y scroll offset due to room transitions (Translates between Layer 2 scroll and BG2 scroll)
    dl $7E09C2 : db $02 : dw $005E ; Health
    dl $7E0AF6 : db $02 : dw $007F ; Samus X
    dl $7E0AFA : db $02 : dw $008B ; Samus Y
    dl $7ED8B2 : db $02 : dw $0101 ; Events, Items, Doors
    dl $7ED91A : db $02 : dw $0021 ; Events, Items, Doors
    dw #$FFFF
.after

preset_redesign_bombs_pipe_bugs_down:
    dw #preset_redesign_bombs_brin_elevator_left ; Bombs: Brin Elevator Left
    dl $7E078D : db $02 : dw $8CBE ; DDB
    dl $7E079B : db $02 : dw $9FE5 ; MDB
    dl $7E079F : db $02 : dw $0001 ; Region
    dl $7E07C3 : db $02 : dw $E6B0 ; GFX Pointers
    dl $7E07C5 : db $02 : dw $64BB ; GFX Pointers
    dl $7E07C7 : db $02 : dw $C2B2 ; GFX Pointers
    dl $7E07F3 : db $02 : dw $000F ; Music Bank
    dl $7E07F5 : db $02 : dw $0005 ; Music Track
    dl $7E090F : db $02 : dw $0000 ; Screen subpixel X position.
    dl $7E0911 : db $02 : dw $0007 ; Screen X position in pixels
    dl $7E0913 : db $02 : dw $D600 ; Screen subpixel Y position
    dl $7E0917 : db $02 : dw $0005 ; Layer 2 X scroll in room in pixels?
    dl $7E0921 : db $02 : dw $FE00 ; BG2 X scroll offset due to room transitions (Translates between Layer 2 scroll and BG2 scroll)
    dl $7E09C6 : db $02 : dw $0000 ; Missiles
    dl $7E0AF6 : db $02 : dw $00A7 ; Samus X
    dl $7E0AFA : db $02 : dw $009B ; Samus Y
    dl $7ED8B2 : db $02 : dw $4101 ; Events, Items, Doors
    dl $7ED91A : db $02 : dw $0027 ; Events, Items, Doors
    dw #$FFFF
.after

preset_redesign_bombs_big_pink_down:
    dw #preset_redesign_bombs_pipe_bugs_down ; Bombs: Pipe Bugs Down
    dl $7E078D : db $02 : dw $8F22 ; DDB
    dl $7E078F : db $02 : dw $0001 ; DoorOut Index
    dl $7E079B : db $02 : dw $B741 ; MDB
    dl $7E090F : db $02 : dw $A400 ; Screen subpixel X position.
    dl $7E0911 : db $02 : dw $0059 ; Screen X position in pixels
    dl $7E0913 : db $02 : dw $7600 ; Screen subpixel Y position
    dl $7E0915 : db $02 : dw $021F ; Screen Y position in pixels
    dl $7E0917 : db $02 : dw $0042 ; Layer 2 X scroll in room in pixels?
    dl $7E0919 : db $02 : dw $0197 ; Layer 2 Y scroll in room in pixels? (up = positive)
    dl $7E09C2 : db $02 : dw $0063 ; Health
    dl $7E09C6 : db $02 : dw $0001 ; Missiles
    dl $7E0AF6 : db $02 : dw $00D9 ; Samus X
    dl $7E0AFA : db $02 : dw $02A2 ; Samus Y
    dl $7ED8BE : db $02 : dw $0004 ; Events, Items, Doors
    dw #$FFFF
.after

preset_redesign_bombs_sporespawn:
    dw #preset_redesign_bombs_big_pink_down ; Bombs: Big Pink Down
    dl $7E078D : db $02 : dw $8DDE ; DDB
    dl $7E078F : db $02 : dw $0002 ; DoorOut Index
    dl $7E079B : db $02 : dw $A130 ; MDB
    dl $7E090F : db $02 : dw $2000 ; Screen subpixel X position.
    dl $7E0911 : db $02 : dw $0000 ; Screen X position in pixels
    dl $7E0913 : db $02 : dw $5200 ; Screen subpixel Y position
    dl $7E0915 : db $02 : dw $0000 ; Screen Y position in pixels
    dl $7E0917 : db $02 : dw $0000 ; Layer 2 X scroll in room in pixels?
    dl $7E0919 : db $02 : dw $0000 ; Layer 2 Y scroll in room in pixels? (up = positive)
    dl $7E0921 : db $02 : dw $FC00 ; BG2 X scroll offset due to room transitions (Translates between Layer 2 scroll and BG2 scroll)
    dl $7E09C2 : db $02 : dw $0035 ; Health
    dl $7E09C6 : db $02 : dw $0000 ; Missiles
    dl $7E0AF6 : db $02 : dw $0030 ; Samus X
    dl $7E0AFA : db $02 : dw $008B ; Samus Y
    dl $7ED8B4 : db $02 : dw $0840 ; Events, Items, Doors
    dl $7ED8DA : db $02 : dw $0800 ; Events, Items, Doors
    dl $7ED91A : db $02 : dw $0028 ; Events, Items, Doors
    dw #$FFFF
.after

preset_redesign_bombs_walljump_boots:
    dw #preset_redesign_bombs_sporespawn ; Bombs: SporeSpawn
    dl $7E078D : db $02 : dw $8FBE ; DDB
    dl $7E078F : db $02 : dw $0001 ; DoorOut Index
    dl $7E079B : db $02 : dw $9DC7 ; MDB
    dl $7E07F3 : db $02 : dw $002A ; Music Bank
    dl $7E090F : db $02 : dw $8000 ; Screen subpixel X position.
    dl $7E0913 : db $02 : dw $E800 ; Screen subpixel Y position
    dl $7E0915 : db $02 : dw $021F ; Screen Y position in pixels
    dl $7E0919 : db $02 : dw $021F ; Layer 2 Y scroll in room in pixels? (up = positive)
    dl $7E0921 : db $02 : dw $FF00 ; BG2 X scroll offset due to room transitions (Translates between Layer 2 scroll and BG2 scroll)
    dl $7E0923 : db $02 : dw $FE00 ; BG2 Y scroll offset due to room transitions (Translates between Layer 2 scroll and BG2 scroll)
    dl $7E09C2 : db $02 : dw $0031 ; Health
    dl $7E09C6 : db $02 : dw $0002 ; Missiles
    dl $7E0A1C : db $02 : dw $0001 ; Samus position/state
    dl $7E0A1E : db $02 : dw $0008 ; More position/state
    dl $7E0AF6 : db $02 : dw $003D ; Samus X
    dl $7E0AFA : db $02 : dw $02CB ; Samus Y
    dl $7ED828 : db $02 : dw $0200 ; Events, Items, Doors
    dl $7ED91A : db $02 : dw $0029 ; Events, Items, Doors
    dw #$FFFF
.after

preset_redesign_bombs_big_pink_up:
    dw #preset_redesign_bombs_walljump_boots ; Bombs: WallJump Boots
    dl $7E078D : db $02 : dw $8E56 ; DDB
    dl $7E079B : db $02 : dw $9C5E ; MDB
    dl $7E07F3 : db $02 : dw $000F ; Music Bank
    dl $7E07F5 : db $02 : dw $0003 ; Music Track
    dl $7E090F : db $02 : dw $0000 ; Screen subpixel X position.
    dl $7E0911 : db $02 : dw $0200 ; Screen X position in pixels
    dl $7E0913 : db $02 : dw $B3FF ; Screen subpixel Y position
    dl $7E0915 : db $02 : dw $0600 ; Screen Y position in pixels
    dl $7E0917 : db $02 : dw $0180 ; Layer 2 X scroll in room in pixels?
    dl $7E0919 : db $02 : dw $0480 ; Layer 2 Y scroll in room in pixels? (up = positive)
    dl $7E0921 : db $02 : dw $0000 ; BG2 X scroll offset due to room transitions (Translates between Layer 2 scroll and BG2 scroll)
    dl $7E0923 : db $02 : dw $FBE0 ; BG2 Y scroll offset due to room transitions (Translates between Layer 2 scroll and BG2 scroll)
    dl $7E09A2 : db $02 : dw $0404 ; Equipped Items
    dl $7E09A4 : db $02 : dw $0404 ; Collected Items
    dl $7E09C2 : db $02 : dw $0040 ; Health
    dl $7E09C6 : db $02 : dw $0001 ; Missiles
    dl $7E0AF6 : db $02 : dw $02CD ; Samus X
    dl $7E0AFA : db $02 : dw $068B ; Samus Y
    dl $7ED874 : db $02 : dw $8020 ; Events, Items, Doors
    dl $7ED91A : db $02 : dw $002A ; Events, Items, Doors
    dw #$FFFF
.after

preset_redesign_bombs_pipe_bugs_up:
    dw #preset_redesign_bombs_big_pink_up ; Bombs: Big Pink Up
    dl $7E078D : db $02 : dw $A2D0 ; DDB
    dl $7E078F : db $02 : dw $0000 ; DoorOut Index
    dl $7E079B : db $02 : dw $9D19 ; MDB
    dl $7E07F5 : db $02 : dw $0005 ; Music Track
    dl $7E090F : db $02 : dw $E000 ; Screen subpixel X position.
    dl $7E0911 : db $02 : dw $0003 ; Screen X position in pixels
    dl $7E0913 : db $02 : dw $2000 ; Screen subpixel Y position
    dl $7E0915 : db $02 : dw $0000 ; Screen Y position in pixels
    dl $7E0917 : db $02 : dw $0002 ; Layer 2 X scroll in room in pixels?
    dl $7E0919 : db $02 : dw $0000 ; Layer 2 Y scroll in room in pixels? (up = positive)
    dl $7E0923 : db $02 : dw $00E0 ; BG2 Y scroll offset due to room transitions (Translates between Layer 2 scroll and BG2 scroll)
    dl $7E09C2 : db $02 : dw $0055 ; Health
    dl $7E09C6 : db $02 : dw $0005 ; Missiles
    dl $7E0AF6 : db $02 : dw $0087 ; Samus X
    dl $7E0AFA : db $02 : dw $009B ; Samus Y
    dl $7ED91A : db $02 : dw $002C ; Events, Items, Doors
    dw #$FFFF
.after

preset_redesign_bombs_brin_elevator_right:
    dw #preset_redesign_bombs_pipe_bugs_up ; Bombs: Pipe Bugs Up
    dl $7E078D : db $02 : dw $A2DC ; DDB
    dl $7E078F : db $02 : dw $0001 ; DoorOut Index
    dl $7E079B : db $02 : dw $9FE5 ; MDB
    dl $7E090F : db $02 : dw $B400 ; Screen subpixel X position.
    dl $7E0911 : db $02 : dw $0100 ; Screen X position in pixels
    dl $7E0913 : db $02 : dw $5200 ; Screen subpixel Y position
    dl $7E0917 : db $02 : dw $00C0 ; Layer 2 X scroll in room in pixels?
    dl $7E0921 : db $02 : dw $0100 ; BG2 X scroll offset due to room transitions (Translates between Layer 2 scroll and BG2 scroll)
    dl $7E0923 : db $02 : dw $0000 ; BG2 Y scroll offset due to room transitions (Translates between Layer 2 scroll and BG2 scroll)
    dl $7E09C2 : db $02 : dw $0063 ; Health
    dl $7E0AF6 : db $02 : dw $018C ; Samus X
    dl $7E0AFA : db $02 : dw $0095 ; Samus Y
    dw #$FFFF
.after

preset_redesign_bombs_kago_climb:
    dw #preset_redesign_bombs_brin_elevator_right ; Bombs: Brin Elevator Right
    dl $7E078D : db $02 : dw $8CA6 ; DDB
    dl $7E078F : db $02 : dw $0002 ; DoorOut Index
    dl $7E079B : db $02 : dw $9938 ; MDB
    dl $7E079F : db $02 : dw $0000 ; Region
    dl $7E07C3 : db $02 : dw $C629 ; GFX Pointers
    dl $7E07C5 : db $02 : dw $7CBA ; GFX Pointers
    dl $7E07C7 : db $02 : dw $C2AD ; GFX Pointers
    dl $7E07F3 : db $02 : dw $0009 ; Music Bank
    dl $7E07F5 : db $02 : dw $0003 ; Music Track
    dl $7E090F : db $02 : dw $A000 ; Screen subpixel X position.
    dl $7E0911 : db $02 : dw $0000 ; Screen X position in pixels
    dl $7E0913 : db $02 : dw $0000 ; Screen subpixel Y position
    dl $7E0915 : db $02 : dw $001B ; Screen Y position in pixels
    dl $7E0917 : db $02 : dw $0000 ; Layer 2 X scroll in room in pixels?
    dl $7E0919 : db $02 : dw $0014 ; Layer 2 Y scroll in room in pixels? (up = positive)
    dl $7E0921 : db $02 : dw $0000 ; BG2 X scroll offset due to room transitions (Translates between Layer 2 scroll and BG2 scroll)
    dl $7E0923 : db $02 : dw $FE00 ; BG2 Y scroll offset due to room transitions (Translates between Layer 2 scroll and BG2 scroll)
    dl $7E09C2 : db $02 : dw $004F ; Health
    dl $7E0AF6 : db $02 : dw $00B8 ; Samus X
    dl $7E0AFA : db $02 : dw $008B ; Samus Y
    dl $7ED91A : db $02 : dw $0032 ; Events, Items, Doors
    dw #$FFFF
.after

preset_redesign_bombs_green_pirate_climb:
    dw #preset_redesign_bombs_kago_climb ; Bombs: Kago Climb
    dl $7E078D : db $02 : dw $8BFE ; DDB
    dl $7E078F : db $02 : dw $0000 ; DoorOut Index
    dl $7E079B : db $02 : dw $9969 ; MDB
    dl $7E07F5 : db $02 : dw $0005 ; Music Track
    dl $7E090F : db $02 : dw $C000 ; Screen subpixel X position.
    dl $7E0921 : db $02 : dw $0100 ; BG2 X scroll offset due to room transitions (Translates between Layer 2 scroll and BG2 scroll)
    dl $7E0923 : db $02 : dw $FA00 ; BG2 Y scroll offset due to room transitions (Translates between Layer 2 scroll and BG2 scroll)
    dl $7E09C2 : db $02 : dw $005E ; Health
    dl $7E0A1C : db $02 : dw $0002 ; Samus position/state
    dl $7E0A1E : db $02 : dw $0004 ; More position/state
    dl $7E0AF6 : db $02 : dw $0068 ; Samus X
    dl $7E0AFA : db $02 : dw $009B ; Samus Y
    dl $7ED91A : db $02 : dw $0033 ; Events, Items, Doors
    dw #$FFFF
.after

preset_redesign_bombs_landing_site_2:
    dw #preset_redesign_bombs_green_pirate_climb ; Bombs: Green Pirate Climb
    dl $7E078D : db $02 : dw $8C3A ; DDB
    dl $7E079B : db $02 : dw $9A90 ; MDB
    dl $7E090F : db $02 : dw $F000 ; Screen subpixel X position.
    dl $7E0911 : db $02 : dw $0100 ; Screen X position in pixels
    dl $7E0913 : db $02 : dw $7600 ; Screen subpixel Y position
    dl $7E0915 : db $02 : dw $020D ; Screen Y position in pixels
    dl $7E0917 : db $02 : dw $00C0 ; Layer 2 X scroll in room in pixels?
    dl $7E0919 : db $02 : dw $0189 ; Layer 2 Y scroll in room in pixels? (up = positive)
    dl $7E0923 : db $02 : dw $FB00 ; BG2 Y scroll offset due to room transitions (Translates between Layer 2 scroll and BG2 scroll)
    dl $7E0A1C : db $02 : dw $0001 ; Samus position/state
    dl $7E0A1E : db $02 : dw $0008 ; More position/state
    dl $7E0AF6 : db $02 : dw $01C8 ; Samus X
    dl $7E0AFA : db $02 : dw $028B ; Samus Y
    dl $7ED91A : db $02 : dw $0037 ; Events, Items, Doors
    dw #$FFFF
.after

preset_redesign_bombs_final_boss:
    dw #preset_redesign_bombs_landing_site_2 ; Bombs: Landing Site
    dl $7E078D : db $02 : dw $8922 ; DDB
    dl $7E078F : db $02 : dw $0001 ; DoorOut Index
    dl $7E079B : db $02 : dw $92FD ; MDB
    dl $7E090F : db $02 : dw $8000 ; Screen subpixel X position.
    dl $7E0911 : db $02 : dw $0500 ; Screen X position in pixels
    dl $7E0913 : db $02 : dw $0000 ; Screen subpixel Y position
    dl $7E0915 : db $02 : dw $001F ; Screen Y position in pixels
    dl $7E0917 : db $02 : dw $03C0 ; Layer 2 X scroll in room in pixels?
    dl $7E0919 : db $02 : dw $0017 ; Layer 2 Y scroll in room in pixels? (up = positive)
    dl $7E0923 : db $02 : dw $0000 ; BG2 Y scroll offset due to room transitions (Translates between Layer 2 scroll and BG2 scroll)
    dl $7E09C6 : db $02 : dw $0004 ; Missiles
    dl $7E0AF6 : db $02 : dw $05C4 ; Samus X
    dl $7E0AFA : db $02 : dw $008B ; Samus Y
    dl $7ED8B0 : db $02 : dw $0002 ; Events, Items, Doors
    dl $7ED91A : db $02 : dw $003D ; Events, Items, Doors
    dw #$FFFF
.after

preset_redesign_bombs_ripper_fall:
    dw #preset_redesign_bombs_final_boss ; Bombs: Final Boss
    dl $7E078D : db $02 : dw $BF60 ; DDB
    dl $7E078F : db $02 : dw $0000 ; DoorOut Index
    dl $7E079B : db $02 : dw $F8BB ; MDB
    dl $7E07F3 : db $02 : dw $0006 ; Music Bank
    dl $7E07F5 : db $02 : dw $0006 ; Music Track
    dl $7E090F : db $02 : dw $C000 ; Screen subpixel X position.
    dl $7E0911 : db $02 : dw $08F7 ; Screen X position in pixels
    dl $7E0915 : db $02 : dw $0400 ; Screen Y position in pixels
    dl $7E0917 : db $02 : dw $047B ; Layer 2 X scroll in room in pixels?
    dl $7E0919 : db $02 : dw $0400 ; Layer 2 Y scroll in room in pixels? (up = positive)
    dl $7E0921 : db $02 : dw $F600 ; BG2 X scroll offset due to room transitions (Translates between Layer 2 scroll and BG2 scroll)
    dl $7E0923 : db $02 : dw $FC00 ; BG2 Y scroll offset due to room transitions (Translates between Layer 2 scroll and BG2 scroll)
    dl $7E0AF6 : db $02 : dw $0996 ; Samus X
    dl $7E0AFA : db $02 : dw $048B ; Samus Y
    dl $7ED91A : db $02 : dw $0041 ; Events, Items, Doors
    dw #$FFFF
.after

preset_redesign_bombs_walljump_climb:
    dw #preset_redesign_bombs_ripper_fall ; Bombs: Ripper Fall
    dl $7E078D : db $02 : dw $BF6C ; DDB
    dl $7E078F : db $02 : dw $0001 ; DoorOut Index
    dl $7E079B : db $02 : dw $CC27 ; MDB
    dl $7E07F3 : db $02 : dw $0009 ; Music Bank
    dl $7E07F5 : db $02 : dw $0005 ; Music Track
    dl $7E090F : db $02 : dw $1400 ; Screen subpixel X position.
    dl $7E0911 : db $02 : dw $0000 ; Screen X position in pixels
    dl $7E0915 : db $02 : dw $0200 ; Screen Y position in pixels
    dl $7E0917 : db $02 : dw $0000 ; Layer 2 X scroll in room in pixels?
    dl $7E0919 : db $02 : dw $0180 ; Layer 2 Y scroll in room in pixels? (up = positive)
    dl $7E0921 : db $02 : dw $0100 ; BG2 X scroll offset due to room transitions (Translates between Layer 2 scroll and BG2 scroll)
    dl $7E0923 : db $02 : dw $FE00 ; BG2 Y scroll offset due to room transitions (Translates between Layer 2 scroll and BG2 scroll)
    dl $7E09C2 : db $02 : dw $0059 ; Health
    dl $7E09C6 : db $02 : dw $0005 ; Missiles
    dl $7E0AF6 : db $02 : dw $00C8 ; Samus X
    dl $7E0AFA : db $02 : dw $028B ; Samus Y
    dl $7ED91A : db $02 : dw $0043 ; Events, Items, Doors
    dw #$FFFF
.after

preset_redesign_bombs_reflectors:
    dw #preset_redesign_bombs_walljump_climb ; Bombs: Walljump Climb
    dl $7E078D : db $02 : dw $BFFC ; DDB
    dl $7E078F : db $02 : dw $0003 ; DoorOut Index
    dl $7E079B : db $02 : dw $CC6F ; MDB
    dl $7E090F : db $02 : dw $D400 ; Screen subpixel X position.
    dl $7E0913 : db $02 : dw $D400 ; Screen subpixel Y position
    dl $7E0915 : db $02 : dw $0022 ; Screen Y position in pixels
    dl $7E0919 : db $02 : dw $0019 ; Layer 2 Y scroll in room in pixels? (up = positive)
    dl $7E0923 : db $02 : dw $0000 ; BG2 Y scroll offset due to room transitions (Translates between Layer 2 scroll and BG2 scroll)
    dl $7E09C2 : db $02 : dw $0054 ; Health
    dl $7E09C6 : db $02 : dw $0002 ; Missiles
    dl $7E0AF6 : db $02 : dw $00CC ; Samus X
    dl $7E0AFA : db $02 : dw $009B ; Samus Y
    dl $7ED8B0 : db $02 : dw $000A ; Events, Items, Doors
    dl $7ED91A : db $02 : dw $0047 ; Events, Items, Doors
    dw #$FFFF
.after

preset_redesign_bombs_bomb_torizo:
    dw #preset_redesign_bombs_reflectors ; Bombs: Reflectors
    dl $7E078D : db $02 : dw $C050 ; DDB
    dl $7E078F : db $02 : dw $0001 ; DoorOut Index
    dl $7E079B : db $02 : dw $92B3 ; MDB
    dl $7E090F : db $02 : dw $D800 ; Screen subpixel X position.
    dl $7E0911 : db $02 : dw $0400 ; Screen X position in pixels
    dl $7E0913 : db $02 : dw $0000 ; Screen subpixel Y position
    dl $7E0915 : db $02 : dw $001B ; Screen Y position in pixels
    dl $7E0917 : db $02 : dw $0300 ; Layer 2 X scroll in room in pixels?
    dl $7E0919 : db $02 : dw $0014 ; Layer 2 Y scroll in room in pixels? (up = positive)
    dl $7E0923 : db $02 : dw $FF00 ; BG2 Y scroll offset due to room transitions (Translates between Layer 2 scroll and BG2 scroll)
    dl $7E09C6 : db $02 : dw $0001 ; Missiles
    dl $7E0AF6 : db $02 : dw $04B9 ; Samus X
    dl $7E0AFA : db $02 : dw $00A2 ; Samus Y
    dl $7ED91A : db $02 : dw $0048 ; Events, Items, Doors
    dw #$FFFF
.after

preset_redesign_varia_reflectors_2:
    dw #preset_redesign_bombs_bomb_torizo ; Bombs: Bomb Torizo
    dl $7E078D : db $02 : dw $8946 ; DDB
    dl $7E078F : db $02 : dw $0000 ; DoorOut Index
    dl $7E079B : db $02 : dw $9804 ; MDB
    dl $7E07F3 : db $02 : dw $0024 ; Music Bank
    dl $7E07F5 : db $02 : dw $0003 ; Music Track
    dl $7E090F : db $02 : dw $E000 ; Screen subpixel X position.
    dl $7E0911 : db $02 : dw $0000 ; Screen X position in pixels
    dl $7E0913 : db $02 : dw $EA00 ; Screen subpixel Y position
    dl $7E0915 : db $02 : dw $011A ; Screen Y position in pixels
    dl $7E0917 : db $02 : dw $0000 ; Layer 2 X scroll in room in pixels?
    dl $7E0919 : db $02 : dw $00D3 ; Layer 2 Y scroll in room in pixels? (up = positive)
    dl $7E09A2 : db $02 : dw $1404 ; Equipped Items
    dl $7E09A4 : db $02 : dw $1404 ; Collected Items
    dl $7E09C2 : db $02 : dw $0046 ; Health
    dl $7E0A1C : db $02 : dw $0002 ; Samus position/state
    dl $7E0A1E : db $02 : dw $0004 ; More position/state
    dl $7E0AF6 : db $02 : dw $003B ; Samus X
    dl $7E0AFA : db $02 : dw $019B ; Samus Y
    dl $7ED828 : db $02 : dw $0204 ; Events, Items, Doors
    dl $7ED872 : db $02 : dw $0004 ; Events, Items, Doors
    dl $7ED8AA : db $02 : dw $8000 ; Events, Items, Doors
    dl $7ED8B2 : db $02 : dw $4901 ; Events, Items, Doors
    dl $7ED91A : db $02 : dw $0049 ; Events, Items, Doors
    dw #$FFFF
.after

preset_redesign_varia_kago_boost:
    dw #preset_redesign_varia_reflectors_2 ; Varia: Reflectors
    dl $7E078D : db $02 : dw $C044 ; DDB
    dl $7E079B : db $02 : dw $CC27 ; MDB
    dl $7E07F3 : db $02 : dw $0009 ; Music Bank
    dl $7E07F5 : db $02 : dw $0005 ; Music Track
    dl $7E090F : db $02 : dw $6000 ; Screen subpixel X position.
    dl $7E0911 : db $02 : dw $0500 ; Screen X position in pixels
    dl $7E0913 : db $02 : dw $0000 ; Screen subpixel Y position
    dl $7E0915 : db $02 : dw $0000 ; Screen Y position in pixels
    dl $7E0917 : db $02 : dw $03C0 ; Layer 2 X scroll in room in pixels?
    dl $7E0919 : db $02 : dw $0000 ; Layer 2 Y scroll in room in pixels? (up = positive)
    dl $7E0921 : db $02 : dw $F700 ; BG2 X scroll offset due to room transitions (Translates between Layer 2 scroll and BG2 scroll)
    dl $7E0923 : db $02 : dw $0000 ; BG2 Y scroll offset due to room transitions (Translates between Layer 2 scroll and BG2 scroll)
    dl $7E09C6 : db $02 : dw $0003 ; Missiles
    dl $7E0AF6 : db $02 : dw $052D ; Samus X
    dl $7E0AFA : db $02 : dw $008B ; Samus Y
    dl $7ED91A : db $02 : dw $004C ; Events, Items, Doors
    dw #$FFFF
.after

preset_redesign_varia_walljump_check_down:
    dw #preset_redesign_varia_kago_boost ; Varia: Kago Boost
    dl $7E078D : db $02 : dw $BFF0 ; DDB
    dl $7E078F : db $02 : dw $0002 ; DoorOut Index
    dl $7E079B : db $02 : dw $93AA ; MDB
    dl $7E090F : db $02 : dw $7000 ; Screen subpixel X position.
    dl $7E0911 : db $02 : dw $0000 ; Screen X position in pixels
    dl $7E0913 : db $02 : dw $D400 ; Screen subpixel Y position
    dl $7E0915 : db $02 : dw $0011 ; Screen Y position in pixels
    dl $7E0917 : db $02 : dw $0000 ; Layer 2 X scroll in room in pixels?
    dl $7E0919 : db $02 : dw $000C ; Layer 2 Y scroll in room in pixels? (up = positive)
    dl $7E0921 : db $02 : dw $FD00 ; BG2 X scroll offset due to room transitions (Translates between Layer 2 scroll and BG2 scroll)
    dl $7E0923 : db $02 : dw $FD00 ; BG2 Y scroll offset due to room transitions (Translates between Layer 2 scroll and BG2 scroll)
    dl $7E0AF6 : db $02 : dw $0045 ; Samus X
    dl $7E0AFA : db $02 : dw $0091 ; Samus Y
    dl $7ED91A : db $02 : dw $004D ; Events, Items, Doors
    dw #$FFFF
.after

preset_redesign_varia_sky_guardian_room:
    dw #preset_redesign_varia_walljump_check_down ; Varia: WallJump Check Down
    dl $7E078D : db $02 : dw $BFD8 ; DDB
    dl $7E078F : db $02 : dw $0000 ; DoorOut Index
    dl $7E079B : db $02 : dw $CB8B ; MDB
    dl $7E090F : db $02 : dw $0000 ; Screen subpixel X position.
    dl $7E0913 : db $02 : dw $0000 ; Screen subpixel Y position
    dl $7E0915 : db $02 : dw $0321 ; Screen Y position in pixels
    dl $7E0917 : db $02 : dw $0001 ; Layer 2 X scroll in room in pixels?
    dl $7E0919 : db $02 : dw $0258 ; Layer 2 Y scroll in room in pixels? (up = positive)
    dl $7E0921 : db $02 : dw $FF00 ; BG2 X scroll offset due to room transitions (Translates between Layer 2 scroll and BG2 scroll)
    dl $7E0923 : db $02 : dw $FB00 ; BG2 Y scroll offset due to room transitions (Translates between Layer 2 scroll and BG2 scroll)
    dl $7E0AF6 : db $02 : dw $0044 ; Samus X
    dl $7E0AFA : db $02 : dw $039B ; Samus Y
    dl $7ED91A : db $02 : dw $0050 ; Events, Items, Doors
    dw #$FFFF
.after

preset_redesign_varia_final_boss_room:
    dw #preset_redesign_varia_sky_guardian_room ; Varia: Sky Guardian Room
    dl $7E078D : db $02 : dw $BF54 ; DDB
    dl $7E078F : db $02 : dw $0002 ; DoorOut Index
    dl $7E079B : db $02 : dw $97B5 ; MDB
    dl $7E07F3 : db $02 : dw $0006 ; Music Bank
    dl $7E07F5 : db $02 : dw $0006 ; Music Track
    dl $7E090F : db $02 : dw $D800 ; Screen subpixel X position.
    dl $7E0913 : db $02 : dw $0E00 ; Screen subpixel Y position
    dl $7E0915 : db $02 : dw $0000 ; Screen Y position in pixels
    dl $7E0917 : db $02 : dw $0000 ; Layer 2 X scroll in room in pixels?
    dl $7E0919 : db $02 : dw $0000 ; Layer 2 Y scroll in room in pixels? (up = positive)
    dl $7E0923 : db $02 : dw $0000 ; BG2 Y scroll offset due to room transitions (Translates between Layer 2 scroll and BG2 scroll)
    dl $7E0AF6 : db $02 : dw $0036 ; Samus X
    dl $7E0AFA : db $02 : dw $008B ; Samus Y
    dl $7ED91A : db $02 : dw $0051 ; Events, Items, Doors
    dw #$FFFF
.after

preset_redesign_varia_ship:
    dw #preset_redesign_varia_final_boss_room ; Varia: Final Boss Room
    dl $7E078D : db $02 : dw $BF0C ; DDB
    dl $7E078F : db $02 : dw $0000 ; DoorOut Index
    dl $7E079B : db $02 : dw $92FD ; MDB
    dl $7E07F3 : db $02 : dw $0009 ; Music Bank
    dl $7E07F5 : db $02 : dw $0005 ; Music Track
    dl $7E090F : db $02 : dw $0000 ; Screen subpixel X position.
    dl $7E0911 : db $02 : dw $0021 ; Screen X position in pixels
    dl $7E0913 : db $02 : dw $8C00 ; Screen subpixel Y position
    dl $7E0915 : db $02 : dw $001F ; Screen Y position in pixels
    dl $7E0917 : db $02 : dw $0018 ; Layer 2 X scroll in room in pixels?
    dl $7E0919 : db $02 : dw $0017 ; Layer 2 Y scroll in room in pixels? (up = positive)
    dl $7E0921 : db $02 : dw $FA00 ; BG2 X scroll offset due to room transitions (Translates between Layer 2 scroll and BG2 scroll)
    dl $7E09C2 : db $02 : dw $00C7 ; Health
    dl $7E09C4 : db $02 : dw $00C7 ; Max health
    dl $7E09C6 : db $02 : dw $0005 ; Missiles
    dl $7E0A1C : db $02 : dw $000A ; Samus position/state
    dl $7E0A1E : db $02 : dw $0104 ; More position/state
    dl $7E0AF6 : db $02 : dw $00C1 ; Samus X
    dl $7E0AFA : db $02 : dw $00AB ; Samus Y
    dl $7ED870 : db $02 : dw $0008 ; Events, Items, Doors
    dl $7ED91A : db $02 : dw $0058 ; Events, Items, Doors
    dw #$FFFF
.after

preset_redesign_varia_pirate_drop_2:
    dw #preset_redesign_varia_ship ; Varia: Ship
    dl $7E078D : db $02 : dw $8916 ; DDB
    dl $7E079B : db $02 : dw $9A90 ; MDB
    dl $7E090F : db $02 : dw $4000 ; Screen subpixel X position.
    dl $7E0911 : db $02 : dw $0000 ; Screen X position in pixels
    dl $7E0913 : db $02 : dw $0000 ; Screen subpixel Y position
    dl $7E0915 : db $02 : dw $0510 ; Screen Y position in pixels
    dl $7E0917 : db $02 : dw $0000 ; Layer 2 X scroll in room in pixels?
    dl $7E0919 : db $02 : dw $03CC ; Layer 2 Y scroll in room in pixels? (up = positive)
    dl $7E0921 : db $02 : dw $FE00 ; BG2 X scroll offset due to room transitions (Translates between Layer 2 scroll and BG2 scroll)
    dl $7E0923 : db $02 : dw $FE00 ; BG2 Y scroll offset due to room transitions (Translates between Layer 2 scroll and BG2 scroll)
    dl $7E0A1C : db $02 : dw $0002 ; Samus position/state
    dl $7E0A1E : db $02 : dw $0004 ; More position/state
    dl $7E0AF6 : db $02 : dw $0045 ; Samus X
    dl $7E0AFA : db $02 : dw $058B ; Samus Y
    dl $7ED91A : db $02 : dw $005B ; Events, Items, Doors
    dw #$FFFF
.after

preset_redesign_varia_brin_elevator_right_2:
    dw #preset_redesign_varia_pirate_drop_2 ; Varia: Pirate Drop
    dl $7E078D : db $02 : dw $8C16 ; DDB
    dl $7E078F : db $02 : dw $0002 ; DoorOut Index
    dl $7E079B : db $02 : dw $9938 ; MDB
    dl $7E07F5 : db $02 : dw $0003 ; Music Track
    dl $7E090F : db $02 : dw $F000 ; Screen subpixel X position.
    dl $7E0915 : db $02 : dw $0000 ; Screen Y position in pixels
    dl $7E0919 : db $02 : dw $0000 ; Layer 2 Y scroll in room in pixels? (up = positive)
    dl $7E0921 : db $02 : dw $FF00 ; BG2 X scroll offset due to room transitions (Translates between Layer 2 scroll and BG2 scroll)
    dl $7E0923 : db $02 : dw $0000 ; BG2 Y scroll offset due to room transitions (Translates between Layer 2 scroll and BG2 scroll)
    dl $7E09C2 : db $02 : dw $00C2 ; Health
    dl $7E0AF6 : db $02 : dw $0081 ; Samus X
    dl $7E0AFA : db $02 : dw $008B ; Samus Y
    dl $7ED91A : db $02 : dw $005E ; Events, Items, Doors
    dw #$FFFF
.after

preset_redesign_varia_hopper_hellway:
    dw #preset_redesign_varia_brin_elevator_right_2 ; Varia: Brin Elevator Right
    dl $7E078D : db $02 : dw $8C0A ; DDB
    dl $7E078F : db $02 : dw $0009 ; DoorOut Index
    dl $7E079B : db $02 : dw $9AD9 ; MDB
    dl $7E079F : db $02 : dw $0001 ; Region
    dl $7E07C3 : db $02 : dw $E6B0 ; GFX Pointers
    dl $7E07C5 : db $02 : dw $64BB ; GFX Pointers
    dl $7E07C7 : db $02 : dw $C2B2 ; GFX Pointers
    dl $7E07F3 : db $02 : dw $000F ; Music Bank
    dl $7E07F5 : db $02 : dw $0005 ; Music Track
    dl $7E090F : db $02 : dw $1000 ; Screen subpixel X position.
    dl $7E0911 : db $02 : dw $0700 ; Screen X position in pixels
    dl $7E0913 : db $02 : dw $C400 ; Screen subpixel Y position
    dl $7E0915 : db $02 : dw $011B ; Screen Y position in pixels
    dl $7E0917 : db $02 : dw $0540 ; Layer 2 X scroll in room in pixels?
    dl $7E0919 : db $02 : dw $00D4 ; Layer 2 Y scroll in room in pixels? (up = positive)
    dl $7E0921 : db $02 : dw $FC00 ; BG2 X scroll offset due to room transitions (Translates between Layer 2 scroll and BG2 scroll)
    dl $7E0923 : db $02 : dw $00E0 ; BG2 Y scroll offset due to room transitions (Translates between Layer 2 scroll and BG2 scroll)
    dl $7E09C2 : db $02 : dw $00C7 ; Health
    dl $7E09C6 : db $02 : dw $0000 ; Missiles
    dl $7E0A1C : db $02 : dw $0001 ; Samus position/state
    dl $7E0A1E : db $02 : dw $0008 ; More position/state
    dl $7E0AF6 : db $02 : dw $07C3 ; Samus X
    dl $7E0AFA : db $02 : dw $018B ; Samus Y
    dl $7ED8B2 : db $02 : dw $6901 ; Events, Items, Doors
    dl $7ED91A : db $02 : dw $0064 ; Events, Items, Doors
    dw #$FFFF
.after

preset_redesign_varia_early_supers:
    dw #preset_redesign_varia_hopper_hellway ; Varia: Hopper Hellway
    dl $7E078D : db $02 : dw $B368 ; DDB
    dl $7E078F : db $02 : dw $0002 ; DoorOut Index
    dl $7E079B : db $02 : dw $9B9D ; MDB
    dl $7E090F : db $02 : dw $3000 ; Screen subpixel X position.
    dl $7E0913 : db $02 : dw $0000 ; Screen subpixel Y position
    dl $7E0915 : db $02 : dw $0200 ; Screen Y position in pixels
    dl $7E0917 : db $02 : dw $0700 ; Layer 2 X scroll in room in pixels?
    dl $7E0919 : db $02 : dw $0200 ; Layer 2 Y scroll in room in pixels? (up = positive)
    dl $7E0921 : db $02 : dw $F800 ; BG2 X scroll offset due to room transitions (Translates between Layer 2 scroll and BG2 scroll)
    dl $7E0923 : db $02 : dw $FE00 ; BG2 Y scroll offset due to room transitions (Translates between Layer 2 scroll and BG2 scroll)
    dl $7E09C2 : db $02 : dw $00B3 ; Health
    dl $7E09C6 : db $02 : dw $0003 ; Missiles
    dl $7E0AF6 : db $02 : dw $07CF ; Samus X
    dl $7E0AFA : db $02 : dw $028B ; Samus Y
    dl $7ED91A : db $02 : dw $0065 ; Events, Items, Doors
    dw #$FFFF
.after

preset_redesign_varia_pb_blockade:
    dw #preset_redesign_varia_early_supers ; Varia: Early Supers
    dl $7E078D : db $02 : dw $8D42 ; DDB
    dl $7E078F : db $02 : dw $0001 ; DoorOut Index
    dl $7E079B : db $02 : dw $9B5B ; MDB
    dl $7E090F : db $02 : dw $1000 ; Screen subpixel X position.
    dl $7E0911 : db $02 : dw $0400 ; Screen X position in pixels
    dl $7E0915 : db $02 : dw $010A ; Screen Y position in pixels
    dl $7E0917 : db $02 : dw $0400 ; Layer 2 X scroll in room in pixels?
    dl $7E0919 : db $02 : dw $010A ; Layer 2 Y scroll in room in pixels? (up = positive)
    dl $7E0921 : db $02 : dw $0100 ; BG2 X scroll offset due to room transitions (Translates between Layer 2 scroll and BG2 scroll)
    dl $7E09C2 : db $02 : dw $005F ; Health
    dl $7E09CA : db $02 : dw $0001 ; Supers
    dl $7E09CC : db $02 : dw $0002 ; Max supers
    dl $7E0AF6 : db $02 : dw $04A7 ; Samus X
    dl $7E0AFA : db $02 : dw $018B ; Samus Y
    dl $7ED874 : db $02 : dw $8024 ; Events, Items, Doors
    dl $7ED8B2 : db $02 : dw $E901 ; Events, Items, Doors
    dl $7ED91A : db $02 : dw $0066 ; Events, Items, Doors
    dw #$FFFF
.after

preset_redesign_varia_spikey_vileplumes:
    dw #preset_redesign_varia_pb_blockade ; Varia: PB Blockade
    dl $7E078D : db $02 : dw $8D1E ; DDB
    dl $7E078F : db $02 : dw $0000 ; DoorOut Index
    dl $7E079B : db $02 : dw $A3AE ; MDB
    dl $7E07C3 : db $02 : dw $A5AA ; GFX Pointers
    dl $7E07C5 : db $02 : dw $5FBC ; GFX Pointers
    dl $7E07C7 : db $02 : dw $C2B3 ; GFX Pointers
    dl $7E07F3 : db $02 : dw $0012 ; Music Bank
    dl $7E090F : db $02 : dw $0000 ; Screen subpixel X position.
    dl $7E0911 : db $02 : dw $08EB ; Screen X position in pixels
    dl $7E0913 : db $02 : dw $4A00 ; Screen subpixel Y position
    dl $7E0915 : db $02 : dw $021F ; Screen Y position in pixels
    dl $7E0917 : db $02 : dw $06B0 ; Layer 2 X scroll in room in pixels?
    dl $7E0919 : db $02 : dw $0197 ; Layer 2 Y scroll in room in pixels? (up = positive)
    dl $7E0923 : db $02 : dw $0000 ; BG2 Y scroll offset due to room transitions (Translates between Layer 2 scroll and BG2 scroll)
    dl $7E09C2 : db $02 : dw $004F ; Health
    dl $7E0AF6 : db $02 : dw $094B ; Samus X
    dl $7E0AFA : db $02 : dw $02BB ; Samus Y
    dl $7ED91A : db $02 : dw $0067 ; Events, Items, Doors
    dw #$FFFF
.after

preset_redesign_varia_spike_guardian_room:
    dw #preset_redesign_varia_spikey_vileplumes ; Varia: Spikey Vileplumes
    dl $7E078D : db $02 : dw $9162 ; DDB
    dl $7E079B : db $02 : dw $A322 ; MDB
    dl $7E090F : db $02 : dw $8000 ; Screen subpixel X position.
    dl $7E0911 : db $02 : dw $0180 ; Screen X position in pixels
    dl $7E0913 : db $02 : dw $0000 ; Screen subpixel Y position
    dl $7E0915 : db $02 : dw $0509 ; Screen Y position in pixels
    dl $7E0917 : db $02 : dw $0120 ; Layer 2 X scroll in room in pixels?
    dl $7E0919 : db $02 : dw $03C6 ; Layer 2 Y scroll in room in pixels? (up = positive)
    dl $7E0923 : db $02 : dw $FD00 ; BG2 Y scroll offset due to room transitions (Translates between Layer 2 scroll and BG2 scroll)
    dl $7E09C2 : db $02 : dw $012B ; Health
    dl $7E09C4 : db $02 : dw $012B ; Max health
    dl $7E09C6 : db $02 : dw $0005 ; Missiles
    dl $7E09CA : db $02 : dw $0002 ; Supers
    dl $7E0AF6 : db $02 : dw $021F ; Samus X
    dl $7E0AFA : db $02 : dw $058B ; Samus Y
    dl $7ED828 : db $02 : dw $0604 ; Events, Items, Doors
    dl $7ED876 : db $02 : dw $0400 ; Events, Items, Doors
    dl $7ED8B6 : db $02 : dw $0008 ; Events, Items, Doors
    dl $7ED91A : db $02 : dw $006C ; Events, Items, Doors
    dw #$FFFF
.after

preset_redesign_varia_soggy_missiles:
    dw #preset_redesign_varia_spike_guardian_room ; Varia: Spike Guardian Room
    dl $7E078D : db $02 : dw $9102 ; DDB
    dl $7E078F : db $02 : dw $0001 ; DoorOut Index
    dl $7E079B : db $02 : dw $A408 ; MDB
    dl $7E090F : db $02 : dw $1780 ; Screen subpixel X position.
    dl $7E0911 : db $02 : dw $0000 ; Screen X position in pixels
    dl $7E0915 : db $02 : dw $011B ; Screen Y position in pixels
    dl $7E0917 : db $02 : dw $0000 ; Layer 2 X scroll in room in pixels?
    dl $7E0919 : db $02 : dw $00D4 ; Layer 2 Y scroll in room in pixels? (up = positive)
    dl $7E0923 : db $02 : dw $FF00 ; BG2 Y scroll offset due to room transitions (Translates between Layer 2 scroll and BG2 scroll)
    dl $7E09C2 : db $02 : dw $011B ; Health
    dl $7E0A1C : db $02 : dw $0002 ; Samus position/state
    dl $7E0A1E : db $02 : dw $0004 ; More position/state
    dl $7E0AF6 : db $02 : dw $0027 ; Samus X
    dl $7E0AFA : db $02 : dw $018B ; Samus Y
    dl $7ED91A : db $02 : dw $006D ; Events, Items, Doors
    dw #$FFFF
.after

preset_redesign_varia_varia_bomb_jump:
    dw #preset_redesign_varia_soggy_missiles ; Varia: Soggy Missiles
    dl $7E078D : db $02 : dw $913E ; DDB
    dl $7E078F : db $02 : dw $0000 ; DoorOut Index
    dl $7E079B : db $02 : dw $A253 ; MDB
    dl $7E090F : db $02 : dw $C000 ; Screen subpixel X position.
    dl $7E0911 : db $02 : dw $0078 ; Screen X position in pixels
    dl $7E0913 : db $02 : dw $DC00 ; Screen subpixel Y position
    dl $7E0915 : db $02 : dw $0834 ; Screen Y position in pixels
    dl $7E0917 : db $02 : dw $005A ; Layer 2 X scroll in room in pixels?
    dl $7E0919 : db $02 : dw $0627 ; Layer 2 Y scroll in room in pixels? (up = positive)
    dl $7E0923 : db $02 : dw $F700 ; BG2 Y scroll offset due to room transitions (Translates between Layer 2 scroll and BG2 scroll)
    dl $7E09C2 : db $02 : dw $0107 ; Health
    dl $7E09C6 : db $02 : dw $000F ; Missiles
    dl $7E09C8 : db $02 : dw $000F ; Max missiles
    dl $7E0A1C : db $02 : dw $0001 ; Samus position/state
    dl $7E0A1E : db $02 : dw $0008 ; More position/state
    dl $7E0AF6 : db $02 : dw $00E7 ; Samus X
    dl $7E0AFA : db $02 : dw $08AB ; Samus Y
    dl $7ED876 : db $02 : dw $0600 ; Events, Items, Doors
    dl $7ED8B6 : db $02 : dw $000A ; Events, Items, Doors
    dl $7ED8DA : db $02 : dw $0C00 ; Events, Items, Doors
    dl $7ED91A : db $02 : dw $006F ; Events, Items, Doors
    dw #$FFFF
.after

preset_redesign_speed_booster_varia_2:
    dw #preset_redesign_varia_varia_bomb_jump ; Varia: Varia Bomb Jump
    dl $7E078D : db $02 : dw $901E ; DDB
    dl $7E079B : db $02 : dw $A6E2 ; MDB
    dl $7E07F5 : db $02 : dw $0003 ; Music Track
    dl $7E090F : db $02 : dw $9000 ; Screen subpixel X position.
    dl $7E0911 : db $02 : dw $0000 ; Screen X position in pixels
    dl $7E0913 : db $02 : dw $1000 ; Screen subpixel Y position
    dl $7E0915 : db $02 : dw $0000 ; Screen Y position in pixels
    dl $7E0917 : db $02 : dw $0000 ; Layer 2 X scroll in room in pixels?
    dl $7E0919 : db $02 : dw $0000 ; Layer 2 Y scroll in room in pixels? (up = positive)
    dl $7E0923 : db $02 : dw $0000 ; BG2 Y scroll offset due to room transitions (Translates between Layer 2 scroll and BG2 scroll)
    dl $7E09A2 : db $02 : dw $1405 ; Equipped Items
    dl $7E09A4 : db $02 : dw $1405 ; Collected Items
    dl $7E09C2 : db $02 : dw $00BA ; Health
    dl $7E09C6 : db $02 : dw $0000 ; Missiles
    dl $7E09CA : db $02 : dw $0000 ; Supers
    dl $7E0A1C : db $02 : dw $0002 ; Samus position/state
    dl $7E0A1E : db $02 : dw $0004 ; More position/state
    dl $7E0AF6 : db $02 : dw $0029 ; Samus X
    dl $7E0AFA : db $02 : dw $008B ; Samus Y
    dl $7ED82C : db $02 : dw $4000 ; Events, Items, Doors
    dl $7ED876 : db $02 : dw $4600 ; Events, Items, Doors
    dl $7ED8B4 : db $02 : dw $8840 ; Events, Items, Doors
    dl $7ED91A : db $02 : dw $0070 ; Events, Items, Doors
    dw #$FFFF
.after

preset_redesign_speed_booster_un_elevator_left:
    dw #preset_redesign_speed_booster_varia_2 ; Speed Booster: Varia
    dl $7E078D : db $02 : dw $914A ; DDB
    dl $7E078F : db $02 : dw $0003 ; DoorOut Index
    dl $7E079B : db $02 : dw $A6A1 ; MDB
    dl $7E090F : db $02 : dw $A000 ; Screen subpixel X position.
    dl $7E0911 : db $02 : dw $0100 ; Screen X position in pixels
    dl $7E0913 : db $02 : dw $3200 ; Screen subpixel Y position
    dl $7E0917 : db $02 : dw $0100 ; Layer 2 X scroll in room in pixels?
    dl $7E0921 : db $02 : dw $FE00 ; BG2 X scroll offset due to room transitions (Translates between Layer 2 scroll and BG2 scroll)
    dl $7E09C2 : db $02 : dw $018F ; Health
    dl $7E09C4 : db $02 : dw $018F ; Max health
    dl $7E09CA : db $02 : dw $0002 ; Supers
    dl $7E0A1C : db $02 : dw $0001 ; Samus position/state
    dl $7E0A1E : db $02 : dw $0008 ; More position/state
    dl $7E0AF6 : db $02 : dw $0182 ; Samus X
    dl $7ED882 : db $02 : dw $0008 ; Events, Items, Doors
    dl $7ED91A : db $02 : dw $0074 ; Events, Items, Doors
    dw #$FFFF
.after

preset_redesign_speed_booster_wave_bomb_jump:
    dw #preset_redesign_speed_booster_un_elevator_left ; Speed Booster: UN Elevator Left
    dl $7E078D : db $02 : dw $9852 ; DDB
    dl $7E078F : db $02 : dw $0000 ; DoorOut Index
    dl $7E079B : db $02 : dw $A815 ; MDB
    dl $7E079F : db $02 : dw $0002 ; Region
    dl $7E07C3 : db $02 : dw $C3F9 ; GFX Pointers
    dl $7E07C5 : db $02 : dw $E4BD ; GFX Pointers
    dl $7E07C7 : db $02 : dw $C2B5 ; GFX Pointers
    dl $7E07F3 : db $02 : dw $0015 ; Music Bank
    dl $7E07F5 : db $02 : dw $0005 ; Music Track
    dl $7E090F : db $02 : dw $B800 ; Screen subpixel X position.
    dl $7E0911 : db $02 : dw $01B7 ; Screen X position in pixels
    dl $7E0913 : db $02 : dw $0000 ; Screen subpixel Y position
    dl $7E0915 : db $02 : dw $045B ; Screen Y position in pixels
    dl $7E0917 : db $02 : dw $0149 ; Layer 2 X scroll in room in pixels?
    dl $7E0919 : db $02 : dw $0344 ; Layer 2 Y scroll in room in pixels? (up = positive)
    dl $7E0921 : db $02 : dw $FA00 ; BG2 X scroll offset due to room transitions (Translates between Layer 2 scroll and BG2 scroll)
    dl $7E0923 : db $02 : dw $FC00 ; BG2 Y scroll offset due to room transitions (Translates between Layer 2 scroll and BG2 scroll)
    dl $7E09C6 : db $02 : dw $000F ; Missiles
    dl $7E0A1C : db $02 : dw $0041 ; Samus position/state
    dl $7E0A1E : db $02 : dw $0404 ; More position/state
    dl $7E0AF6 : db $02 : dw $0254 ; Samus X
    dl $7E0AFA : db $02 : dw $04F9 ; Samus Y
    dl $7ED82C : db $02 : dw $C000 ; Events, Items, Doors
    dl $7ED8BC : db $02 : dw $0004 ; Events, Items, Doors
    dl $7ED91A : db $02 : dw $0075 ; Events, Items, Doors
    dw #$FFFF
.after

preset_redesign_speed_booster_exiting_wave:
    dw #preset_redesign_speed_booster_wave_bomb_jump ; Speed Booster: Wave Bomb Jump
    dl $7E078D : db $02 : dw $9312 ; DDB
    dl $7E079B : db $02 : dw $ADDE ; MDB
    dl $7E07F5 : db $02 : dw $0003 ; Music Track
    dl $7E090F : db $02 : dw $0000 ; Screen subpixel X position.
    dl $7E0911 : db $02 : dw $0000 ; Screen X position in pixels
    dl $7E0913 : db $02 : dw $E000 ; Screen subpixel Y position
    dl $7E0915 : db $02 : dw $0000 ; Screen Y position in pixels
    dl $7E0917 : db $02 : dw $0000 ; Layer 2 X scroll in room in pixels?
    dl $7E0919 : db $02 : dw $0000 ; Layer 2 Y scroll in room in pixels? (up = positive)
    dl $7E0921 : db $02 : dw $0100 ; BG2 X scroll offset due to room transitions (Translates between Layer 2 scroll and BG2 scroll)
    dl $7E0923 : db $02 : dw $0000 ; BG2 Y scroll offset due to room transitions (Translates between Layer 2 scroll and BG2 scroll)
    dl $7E09A6 : db $02 : dw $0001 ; Beams
    dl $7E09A8 : db $02 : dw $0001 ; Beams
    dl $7E0A1C : db $02 : dw $0002 ; Samus position/state
    dl $7E0A1E : db $02 : dw $0004 ; More position/state
    dl $7E0AF6 : db $02 : dw $0040 ; Samus X
    dl $7E0AFA : db $02 : dw $008B ; Samus Y
    dl $7ED87A : db $02 : dw $0010 ; Events, Items, Doors
    dl $7ED91A : db $02 : dw $0076 ; Events, Items, Doors
    dw #$FFFF
.after

preset_redesign_speed_booster_big_fall:
    dw #preset_redesign_speed_booster_exiting_wave ; Speed Booster: Exiting Wave
    dl $7E078D : db $02 : dw $9336 ; DDB
    dl $7E078F : db $02 : dw $0003 ; DoorOut Index
    dl $7E079B : db $02 : dw $BF9E ; MDB
    dl $7E07F5 : db $02 : dw $0005 ; Music Track
    dl $7E090F : db $02 : dw $E000 ; Screen subpixel X position.
    dl $7E0911 : db $02 : dw $0400 ; Screen X position in pixels
    dl $7E0913 : db $02 : dw $AC00 ; Screen subpixel Y position
    dl $7E0915 : db $02 : dw $0400 ; Screen Y position in pixels
    dl $7E0917 : db $02 : dw $0300 ; Layer 2 X scroll in room in pixels?
    dl $7E0919 : db $02 : dw $0300 ; Layer 2 Y scroll in room in pixels? (up = positive)
    dl $7E0921 : db $02 : dw $F900 ; BG2 X scroll offset due to room transitions (Translates between Layer 2 scroll and BG2 scroll)
    dl $7E0923 : db $02 : dw $FC00 ; BG2 Y scroll offset due to room transitions (Translates between Layer 2 scroll and BG2 scroll)
    dl $7E0AF6 : db $02 : dw $0427 ; Samus X
    dl $7E0AFA : db $02 : dw $048B ; Samus Y
    dw #$FFFF
.after

preset_redesign_speed_booster_squeept_squeept:
    dw #preset_redesign_speed_booster_big_fall ; Speed Booster: Big Fall
    dl $7E078D : db $02 : dw $AEC1 ; DDB
    dl $7E078F : db $02 : dw $0002 ; DoorOut Index
    dl $7E079B : db $02 : dw $A8F8 ; MDB
    dl $7E090F : db $02 : dw $5180 ; Screen subpixel X position.
    dl $7E0911 : db $02 : dw $0300 ; Screen X position in pixels
    dl $7E0913 : db $02 : dw $0000 ; Screen subpixel Y position
    dl $7E0915 : db $02 : dw $080B ; Screen Y position in pixels
    dl $7E0917 : db $02 : dw $0240 ; Layer 2 X scroll in room in pixels?
    dl $7E0919 : db $02 : dw $0608 ; Layer 2 Y scroll in room in pixels? (up = positive)
    dl $7E0921 : db $02 : dw $FE00 ; BG2 X scroll offset due to room transitions (Translates between Layer 2 scroll and BG2 scroll)
    dl $7E0923 : db $02 : dw $0000 ; BG2 Y scroll offset due to room transitions (Translates between Layer 2 scroll and BG2 scroll)
    dl $7E09C6 : db $02 : dw $000E ; Missiles
    dl $7E0A1C : db $02 : dw $0001 ; Samus position/state
    dl $7E0A1E : db $02 : dw $0008 ; More position/state
    dl $7E0AF6 : db $02 : dw $03A2 ; Samus X
    dl $7E0AFA : db $02 : dw $088B ; Samus Y
    dw #$FFFF
.after

preset_redesign_speed_booster_morph_maze:
    dw #preset_redesign_speed_booster_squeept_squeept ; Speed Booster: Squeept Squeept
    dl $7E078D : db $02 : dw $9456 ; DDB
    dl $7E078F : db $02 : dw $0003 ; DoorOut Index
    dl $7E079B : db $02 : dw $CCCB ; MDB
    dl $7E090F : db $02 : dw $0000 ; Screen subpixel X position.
    dl $7E0911 : db $02 : dw $01D4 ; Screen X position in pixels
    dl $7E0913 : db $02 : dw $0C00 ; Screen subpixel Y position
    dl $7E0915 : db $02 : dw $041F ; Screen Y position in pixels
    dl $7E0917 : db $02 : dw $015F ; Layer 2 X scroll in room in pixels?
    dl $7E0919 : db $02 : dw $0317 ; Layer 2 Y scroll in room in pixels? (up = positive)
    dl $7E0921 : db $02 : dw $0100 ; BG2 X scroll offset due to room transitions (Translates between Layer 2 scroll and BG2 scroll)
    dl $7E0923 : db $02 : dw $FC00 ; BG2 Y scroll offset due to room transitions (Translates between Layer 2 scroll and BG2 scroll)
    dl $7E09C2 : db $02 : dw $0161 ; Health
    dl $7E09C6 : db $02 : dw $0007 ; Missiles
    dl $7E09CA : db $02 : dw $0000 ; Supers
    dl $7E0A1C : db $02 : dw $0007 ; Samus position/state
    dl $7E0AF6 : db $02 : dw $0234 ; Samus X
    dl $7E0AFA : db $02 : dw $049B ; Samus Y
    dl $7ED8B8 : db $02 : dw $0020 ; Events, Items, Doors
    dl $7ED8BE : db $02 : dw $2404 ; Events, Items, Doors
    dl $7ED91A : db $02 : dw $0077 ; Events, Items, Doors
    dw #$FFFF
.after

preset_redesign_speed_booster_pb_maze:
    dw #preset_redesign_speed_booster_morph_maze ; Speed Booster: Morph Maze
    dl $7E078D : db $02 : dw $93D2 ; DDB
    dl $7E078F : db $02 : dw $0004 ; DoorOut Index
    dl $7E079B : db $02 : dw $CE40 ; MDB
    dl $7E090F : db $02 : dw $6000 ; Screen subpixel X position.
    dl $7E0911 : db $02 : dw $0700 ; Screen X position in pixels
    dl $7E0913 : db $02 : dw $0000 ; Screen subpixel Y position
    dl $7E0915 : db $02 : dw $041C ; Screen Y position in pixels
    dl $7E0917 : db $02 : dw $0540 ; Layer 2 X scroll in room in pixels?
    dl $7E0919 : db $02 : dw $0315 ; Layer 2 Y scroll in room in pixels? (up = positive)
    dl $7E0921 : db $02 : dw $F900 ; BG2 X scroll offset due to room transitions (Translates between Layer 2 scroll and BG2 scroll)
    dl $7E0923 : db $02 : dw $FFE0 ; BG2 Y scroll offset due to room transitions (Translates between Layer 2 scroll and BG2 scroll)
    dl $7E09C2 : db $02 : dw $017A ; Health
    dl $7E09C6 : db $02 : dw $0006 ; Missiles
    dl $7E0A1C : db $02 : dw $0001 ; Samus position/state
    dl $7E0AF6 : db $02 : dw $07D4 ; Samus X
    dl $7E0AFA : db $02 : dw $048B ; Samus Y
    dl $7ED8DC : db $02 : dw $0004 ; Events, Items, Doors
    dl $7ED91A : db $02 : dw $0078 ; Events, Items, Doors
    dw #$FFFF
.after

preset_redesign_speed_booster_reverse_morph_maze:
    dw #preset_redesign_speed_booster_pb_maze ; Speed Booster: PB Maze
    dl $7E078D : db $02 : dw $AF99 ; DDB
    dl $7E078F : db $02 : dw $0003 ; DoorOut Index
    dl $7E079B : db $02 : dw $C000 ; MDB
    dl $7E090F : db $02 : dw $E000 ; Screen subpixel X position.
    dl $7E0911 : db $02 : dw $0000 ; Screen X position in pixels
    dl $7E0913 : db $02 : dw $4400 ; Screen subpixel Y position
    dl $7E0915 : db $02 : dw $041D ; Screen Y position in pixels
    dl $7E0917 : db $02 : dw $0000 ; Layer 2 X scroll in room in pixels?
    dl $7E0921 : db $02 : dw $0100 ; BG2 X scroll offset due to room transitions (Translates between Layer 2 scroll and BG2 scroll)
    dl $7E0923 : db $02 : dw $FC00 ; BG2 Y scroll offset due to room transitions (Translates between Layer 2 scroll and BG2 scroll)
    dl $7E09CE : db $02 : dw $0001 ; Pbs
    dl $7E09D0 : db $02 : dw $0001 ; Max pbs
    dl $7E0A1C : db $02 : dw $0002 ; Samus position/state
    dl $7E0A1E : db $02 : dw $0004 ; More position/state
    dl $7E0AF6 : db $02 : dw $0028 ; Samus X
    dl $7ED880 : db $02 : dw $4000 ; Events, Items, Doors
    dl $7ED91A : db $02 : dw $0079 ; Events, Items, Doors
    dw #$FFFF
.after

preset_redesign_speed_booster_five_spawner_farm:
    dw #preset_redesign_speed_booster_reverse_morph_maze ; Speed Booster: Reverse Morph Maze
    dl $7E078D : db $02 : dw $AFB1 ; DDB
    dl $7E078F : db $02 : dw $0005 ; DoorOut Index
    dl $7E079B : db $02 : dw $CCCB ; MDB
    dl $7E090F : db $02 : dw $7A00 ; Screen subpixel X position.
    dl $7E0913 : db $02 : dw $0000 ; Screen subpixel Y position
    dl $7E0915 : db $02 : dw $041B ; Screen Y position in pixels
    dl $7E0919 : db $02 : dw $0314 ; Layer 2 Y scroll in room in pixels? (up = positive)
    dl $7E0921 : db $02 : dw $FE00 ; BG2 X scroll offset due to room transitions (Translates between Layer 2 scroll and BG2 scroll)
    dl $7E0923 : db $02 : dw $FB00 ; BG2 Y scroll offset due to room transitions (Translates between Layer 2 scroll and BG2 scroll)
    dl $7E09C2 : db $02 : dw $00FD ; Health
    dl $7E09C6 : db $02 : dw $0005 ; Missiles
    dl $7E09CE : db $02 : dw $0000 ; Pbs
    dl $7E0AF6 : db $02 : dw $003B ; Samus X
    dl $7ED8A2 : db $02 : dw $2000 ; Events, Items, Doors
    dl $7ED91A : db $02 : dw $007A ; Events, Items, Doors
    dw #$FFFF
.after

preset_redesign_speed_booster_morph_bomb_blockade:
    dw #preset_redesign_speed_booster_five_spawner_farm ; Speed Booster: Five Spawner Farm
    dl $7E078D : db $02 : dw $93A2 ; DDB
    dl $7E078F : db $02 : dw $0000 ; DoorOut Index
    dl $7E079B : db $02 : dw $AA82 ; MDB
    dl $7E090F : db $02 : dw $3000 ; Screen subpixel X position.
    dl $7E0911 : db $02 : dw $0200 ; Screen X position in pixels
    dl $7E0915 : db $02 : dw $0100 ; Screen Y position in pixels
    dl $7E0917 : db $02 : dw $0180 ; Layer 2 X scroll in room in pixels?
    dl $7E0919 : db $02 : dw $00C0 ; Layer 2 Y scroll in room in pixels? (up = positive)
    dl $7E0921 : db $02 : dw $FD00 ; BG2 X scroll offset due to room transitions (Translates between Layer 2 scroll and BG2 scroll)
    dl $7E0923 : db $02 : dw $FF00 ; BG2 Y scroll offset due to room transitions (Translates between Layer 2 scroll and BG2 scroll)
    dl $7E09C2 : db $02 : dw $018F ; Health
    dl $7E09C6 : db $02 : dw $000F ; Missiles
    dl $7E09CA : db $02 : dw $0002 ; Supers
    dl $7E09CE : db $02 : dw $0001 ; Pbs
    dl $7E0A1C : db $02 : dw $0001 ; Samus position/state
    dl $7E0A1E : db $02 : dw $0008 ; More position/state
    dl $7E0AF6 : db $02 : dw $02C6 ; Samus X
    dl $7E0AFA : db $02 : dw $018B ; Samus Y
    dw #$FFFF
.after

preset_redesign_speed_booster_lava_bomb_jump:
    dw #preset_redesign_speed_booster_morph_bomb_blockade ; Speed Booster: Morph Bomb Blockade
    dl $7E078D : db $02 : dw $9456 ; DDB
    dl $7E078F : db $02 : dw $0003 ; DoorOut Index
    dl $7E079B : db $02 : dw $CCCB ; MDB
    dl $7E090F : db $02 : dw $2000 ; Screen subpixel X position.
    dl $7E0911 : db $02 : dw $0600 ; Screen X position in pixels
    dl $7E0915 : db $02 : dw $021A ; Screen Y position in pixels
    dl $7E0917 : db $02 : dw $0480 ; Layer 2 X scroll in room in pixels?
    dl $7E0919 : db $02 : dw $0193 ; Layer 2 Y scroll in room in pixels? (up = positive)
    dl $7E0921 : db $02 : dw $0100 ; BG2 X scroll offset due to room transitions (Translates between Layer 2 scroll and BG2 scroll)
    dl $7E0923 : db $02 : dw $FC00 ; BG2 Y scroll offset due to room transitions (Translates between Layer 2 scroll and BG2 scroll)
    dl $7E09CA : db $02 : dw $0001 ; Supers
    dl $7E0AF6 : db $02 : dw $06A0 ; Samus X
    dl $7E0AFA : db $02 : dw $028B ; Samus Y
    dl $7ED8A2 : db $02 : dw $6000 ; Events, Items, Doors
    dl $7ED8BE : db $02 : dw $2C04 ; Events, Items, Doors
    dw #$FFFF
.after

preset_redesign_speed_booster_speed_entry:
    dw #preset_redesign_speed_booster_lava_bomb_jump ; Speed Booster: Lava Bomb Jump
    dl $7E078D : db $02 : dw $BB0C ; DDB
    dl $7E078F : db $02 : dw $0005 ; DoorOut Index
    dl $7E079B : db $02 : dw $AFFB ; MDB
    dl $7E090F : db $02 : dw $4000 ; Screen subpixel X position.
    dl $7E0911 : db $02 : dw $0300 ; Screen X position in pixels
    dl $7E0915 : db $02 : dw $0023 ; Screen Y position in pixels
    dl $7E0917 : db $02 : dw $0240 ; Layer 2 X scroll in room in pixels?
    dl $7E0919 : db $02 : dw $001A ; Layer 2 Y scroll in room in pixels? (up = positive)
    dl $7E0923 : db $02 : dw $0000 ; BG2 Y scroll offset due to room transitions (Translates between Layer 2 scroll and BG2 scroll)
    dl $7E09C2 : db $02 : dw $018E ; Health
    dl $7E09CA : db $02 : dw $0002 ; Supers
    dl $7E0AF6 : db $02 : dw $0394 ; Samus X
    dl $7E0AFA : db $02 : dw $008B ; Samus Y
    dl $7ED8A8 : db $02 : dw $0800 ; Events, Items, Doors
    dw #$FFFF
.after

preset_redesign_hi_jump_boots_speed_escape:
    dw #preset_redesign_speed_booster_speed_entry ; Speed Booster: Speed Entry
    dl $7E078D : db $02 : dw $C494 ; DDB
    dl $7E078F : db $02 : dw $0001 ; DoorOut Index
    dl $7E079B : db $02 : dw $AD1B ; MDB
    dl $7E090F : db $02 : dw $0000 ; Screen subpixel X position.
    dl $7E0911 : db $02 : dw $0000 ; Screen X position in pixels
    dl $7E0915 : db $02 : dw $001C ; Screen Y position in pixels
    dl $7E0917 : db $02 : dw $0000 ; Layer 2 X scroll in room in pixels?
    dl $7E0919 : db $02 : dw $0015 ; Layer 2 Y scroll in room in pixels? (up = positive)
    dl $7E09A2 : db $02 : dw $3405 ; Equipped Items
    dl $7E09A4 : db $02 : dw $3405 ; Collected Items
    dl $7E09C2 : db $02 : dw $0157 ; Health
    dl $7E09C6 : db $02 : dw $000E ; Missiles
    dl $7E0A1C : db $02 : dw $0002 ; Samus position/state
    dl $7E0A1E : db $02 : dw $0004 ; More position/state
    dl $7E0AF6 : db $02 : dw $0025 ; Samus X
    dl $7ED82C : db $02 : dw $E000 ; Events, Items, Doors
    dl $7ED878 : db $02 : dw $0004 ; Events, Items, Doors
    dl $7ED8B4 : db $02 : dw $8841 ; Events, Items, Doors
    dl $7ED91A : db $02 : dw $007C ; Events, Items, Doors
    dw #$FFFF
.after

preset_redesign_hi_jump_boots_lake_spark:
    dw #preset_redesign_hi_jump_boots_speed_escape ; Hi Jump Boots: Speed Escape
    dl $7E078D : db $02 : dw $95BE ; DDB
    dl $7E078F : db $02 : dw $0000 ; DoorOut Index
    dl $7E079B : db $02 : dw $A923 ; MDB
    dl $7E090F : db $02 : dw $7000 ; Screen subpixel X position.
    dl $7E0911 : db $02 : dw $0200 ; Screen X position in pixels
    dl $7E0913 : db $02 : dw $F200 ; Screen subpixel Y position
    dl $7E0915 : db $02 : dw $0013 ; Screen Y position in pixels
    dl $7E0917 : db $02 : dw $0180 ; Layer 2 X scroll in room in pixels?
    dl $7E0919 : db $02 : dw $000E ; Layer 2 Y scroll in room in pixels? (up = positive)
    dl $7E0921 : db $02 : dw $FB00 ; BG2 X scroll offset due to room transitions (Translates between Layer 2 scroll and BG2 scroll)
    dl $7E0923 : db $02 : dw $F800 ; BG2 Y scroll offset due to room transitions (Translates between Layer 2 scroll and BG2 scroll)
    dl $7E09C2 : db $02 : dw $0120 ; Health
    dl $7E0AF6 : db $02 : dw $025D ; Samus X
    dl $7ED91A : db $02 : dw $007D ; Events, Items, Doors
    dw #$FFFF
.after

preset_redesign_hi_jump_boots_squeept_spark:
    dw #preset_redesign_hi_jump_boots_lake_spark ; Hi Jump Boots: Lake Spark
    dl $7E078D : db $02 : dw $9456 ; DDB
    dl $7E078F : db $02 : dw $0003 ; DoorOut Index
    dl $7E079B : db $02 : dw $CCCB ; MDB
    dl $7E090F : db $02 : dw $6000 ; Screen subpixel X position.
    dl $7E0911 : db $02 : dw $0147 ; Screen X position in pixels
    dl $7E0913 : db $02 : dw $0000 ; Screen subpixel Y position
    dl $7E0915 : db $02 : dw $041B ; Screen Y position in pixels
    dl $7E0917 : db $02 : dw $00F5 ; Layer 2 X scroll in room in pixels?
    dl $7E0919 : db $02 : dw $0314 ; Layer 2 Y scroll in room in pixels? (up = positive)
    dl $7E0921 : db $02 : dw $0100 ; BG2 X scroll offset due to room transitions (Translates between Layer 2 scroll and BG2 scroll)
    dl $7E0923 : db $02 : dw $FC00 ; BG2 Y scroll offset due to room transitions (Translates between Layer 2 scroll and BG2 scroll)
    dl $7E09C2 : db $02 : dw $0153 ; Health
    dl $7E0AF6 : db $02 : dw $01D0 ; Samus X
    dl $7E0AFA : db $02 : dw $048B ; Samus Y
    dw #$FFFF
.after

preset_redesign_hi_jump_boots_big_up_spark:
    dw #preset_redesign_hi_jump_boots_squeept_spark ; Hi Jump Boots: Squeept Spark
    dl $7E078D : db $02 : dw $AF75 ; DDB
    dl $7E078F : db $02 : dw $0000 ; DoorOut Index
    dl $7E079B : db $02 : dw $AFA3 ; MDB
    dl $7E090F : db $02 : dw $0000 ; Screen subpixel X position.
    dl $7E0911 : db $02 : dw $0000 ; Screen X position in pixels
    dl $7E0913 : db $02 : dw $D000 ; Screen subpixel Y position
    dl $7E0915 : db $02 : dw $0000 ; Screen Y position in pixels
    dl $7E0917 : db $02 : dw $0000 ; Layer 2 X scroll in room in pixels?
    dl $7E0919 : db $02 : dw $0000 ; Layer 2 Y scroll in room in pixels? (up = positive)
    dl $7E0921 : db $02 : dw $FB00 ; BG2 X scroll offset due to room transitions (Translates between Layer 2 scroll and BG2 scroll)
    dl $7E0923 : db $02 : dw $0000 ; BG2 Y scroll offset due to room transitions (Translates between Layer 2 scroll and BG2 scroll)
    dl $7E09C2 : db $02 : dw $00F4 ; Health
    dl $7E0AF6 : db $02 : dw $0025 ; Samus X
    dl $7E0AFA : db $02 : dw $008B ; Samus Y
    dl $7ED8AE : db $02 : dw $0400 ; Events, Items, Doors
    dl $7ED91A : db $02 : dw $007E ; Events, Items, Doors
    dw #$FFFF
.after

preset_redesign_hi_jump_boots_chain_spark_out_of_un:
    dw #preset_redesign_hi_jump_boots_big_up_spark ; Hi Jump Boots: Big Up Spark
    dl $7E078D : db $02 : dw $AED9 ; DDB
    dl $7E078F : db $02 : dw $0004 ; DoorOut Index
    dl $7E079B : db $02 : dw $A815 ; MDB
    dl $7E090F : db $02 : dw $4000 ; Screen subpixel X position.
    dl $7E0911 : db $02 : dw $02D7 ; Screen X position in pixels
    dl $7E0913 : db $02 : dw $F200 ; Screen subpixel Y position
    dl $7E0915 : db $02 : dw $03FC ; Screen Y position in pixels
    dl $7E0917 : db $02 : dw $0221 ; Layer 2 X scroll in room in pixels?
    dl $7E0919 : db $02 : dw $02FD ; Layer 2 Y scroll in room in pixels? (up = positive)
    dl $7E0921 : db $02 : dw $0100 ; BG2 X scroll offset due to room transitions (Translates between Layer 2 scroll and BG2 scroll)
    dl $7E0923 : db $02 : dw $FC00 ; BG2 Y scroll offset due to room transitions (Translates between Layer 2 scroll and BG2 scroll)
    dl $7E09C2 : db $02 : dw $018F ; Health
    dl $7E09C6 : db $02 : dw $000F ; Missiles
    dl $7E0A1C : db $02 : dw $0001 ; Samus position/state
    dl $7E0A1E : db $02 : dw $0008 ; More position/state
    dl $7E0AF6 : db $02 : dw $034E ; Samus X
    dl $7E0AFA : db $02 : dw $048B ; Samus Y
    dl $7ED8A2 : db $02 : dw $6200 ; Events, Items, Doors
    dw #$FFFF
.after

preset_redesign_hi_jump_boots_reserve_elevator:
    dw #preset_redesign_hi_jump_boots_chain_spark_out_of_un ; Hi Jump Boots: Chain Spark out of UN
    dl $7E078D : db $02 : dw $986A ; DDB
    dl $7E078F : db $02 : dw $0003 ; DoorOut Index
    dl $7E079B : db $02 : dw $A6A1 ; MDB
    dl $7E079F : db $02 : dw $0001 ; Region
    dl $7E07C3 : db $02 : dw $A5AA ; GFX Pointers
    dl $7E07C5 : db $02 : dw $5FBC ; GFX Pointers
    dl $7E07C7 : db $02 : dw $C2B3 ; GFX Pointers
    dl $7E07F3 : db $02 : dw $0012 ; Music Bank
    dl $7E07F5 : db $02 : dw $0003 ; Music Track
    dl $7E090F : db $02 : dw $6000 ; Screen subpixel X position.
    dl $7E0911 : db $02 : dw $0100 ; Screen X position in pixels
    dl $7E0913 : db $02 : dw $C000 ; Screen subpixel Y position
    dl $7E0915 : db $02 : dw $0000 ; Screen Y position in pixels
    dl $7E0917 : db $02 : dw $0100 ; Layer 2 X scroll in room in pixels?
    dl $7E0919 : db $02 : dw $0000 ; Layer 2 Y scroll in room in pixels? (up = positive)
    dl $7E0921 : db $02 : dw $FF00 ; BG2 X scroll offset due to room transitions (Translates between Layer 2 scroll and BG2 scroll)
    dl $7E0923 : db $02 : dw $FD00 ; BG2 Y scroll offset due to room transitions (Translates between Layer 2 scroll and BG2 scroll)
    dl $7E09C2 : db $02 : dw $018A ; Health
    dl $7E0AF6 : db $02 : dw $0190 ; Samus X
    dl $7E0AFA : db $02 : dw $008B ; Samus Y
    dl $7E0B3F : db $02 : dw $0004 ; Blue suit
    dl $7ED91A : db $02 : dw $0082 ; Events, Items, Doors
    dw #$FFFF
.after

preset_redesign_hi_jump_boots_red_gate_glitch:
    dw #preset_redesign_hi_jump_boots_reserve_elevator ; Hi Jump Boots: Reserve Elevator
    dl $7E078D : db $02 : dw $AE6D ; DDB
    dl $7E078F : db $02 : dw $0002 ; DoorOut Index
    dl $7E079B : db $02 : dw $A471 ; MDB
    dl $7E07F5 : db $02 : dw $0005 ; Music Track
    dl $7E090F : db $02 : dw $7000 ; Screen subpixel X position.
    dl $7E0913 : db $02 : dw $FA00 ; Screen subpixel Y position
    dl $7E0917 : db $02 : dw $00C0 ; Layer 2 X scroll in room in pixels?
    dl $7E0921 : db $02 : dw $0000 ; BG2 X scroll offset due to room transitions (Translates between Layer 2 scroll and BG2 scroll)
    dl $7E0923 : db $02 : dw $0000 ; BG2 Y scroll offset due to room transitions (Translates between Layer 2 scroll and BG2 scroll)
    dl $7E09C2 : db $02 : dw $0176 ; Health
    dl $7E0A1C : db $02 : dw $0002 ; Samus position/state
    dl $7E0A1E : db $02 : dw $0004 ; More position/state
    dl $7E0AF6 : db $02 : dw $0158 ; Samus X
    dl $7E0B3F : db $02 : dw $0000 ; Blue suit
    dw #$FFFF
.after

preset_redesign_hi_jump_boots_spikesuit:
    dw #preset_redesign_hi_jump_boots_red_gate_glitch ; Hi Jump Boots: Red Gate Glitch
    dl $7E078D : db $02 : dw $AE91 ; DDB
    dl $7E078F : db $02 : dw $0003 ; DoorOut Index
    dl $7E079B : db $02 : dw $9D9C ; MDB
    dl $7E07C3 : db $02 : dw $E6B0 ; GFX Pointers
    dl $7E07C5 : db $02 : dw $64BB ; GFX Pointers
    dl $7E07C7 : db $02 : dw $C2B2 ; GFX Pointers
    dl $7E07F3 : db $02 : dw $000F ; Music Bank
    dl $7E090F : db $02 : dw $8000 ; Screen subpixel X position.
    dl $7E0911 : db $02 : dw $000B ; Screen X position in pixels
    dl $7E0913 : db $02 : dw $D600 ; Screen subpixel Y position
    dl $7E0915 : db $02 : dw $0300 ; Screen Y position in pixels
    dl $7E0917 : db $02 : dw $0008 ; Layer 2 X scroll in room in pixels?
    dl $7E0919 : db $02 : dw $0240 ; Layer 2 Y scroll in room in pixels? (up = positive)
    dl $7E0921 : db $02 : dw $F500 ; BG2 X scroll offset due to room transitions (Translates between Layer 2 scroll and BG2 scroll)
    dl $7E0923 : db $02 : dw $FD00 ; BG2 Y scroll offset due to room transitions (Translates between Layer 2 scroll and BG2 scroll)
    dl $7E09C2 : db $02 : dw $015F ; Health
    dl $7E09C6 : db $02 : dw $000A ; Missiles
    dl $7E09CE : db $02 : dw $0000 ; Pbs
    dl $7E0AF6 : db $02 : dw $006B ; Samus X
    dl $7E0AFA : db $02 : dw $038B ; Samus Y
    dl $7E0B3F : db $02 : dw $0004 ; Blue suit
    dl $7ED8AE : db $02 : dw $0401 ; Events, Items, Doors
    dl $7ED8DC : db $02 : dw $0014 ; Events, Items, Doors
    dw #$FFFF
.after

preset_redesign_hi_jump_boots_water_bounceball:
    dw #preset_redesign_hi_jump_boots_spikesuit ; Hi Jump Boots: Spikesuit
    dl $7E078D : db $02 : dw $8E32 ; DDB
    dl $7E078F : db $02 : dw $0000 ; DoorOut Index
    dl $7E079B : db $02 : dw $9E52 ; MDB
    dl $7E090F : db $02 : dw $F800 ; Screen subpixel X position.
    dl $7E0911 : db $02 : dw $0000 ; Screen X position in pixels
    dl $7E0913 : db $02 : dw $0000 ; Screen subpixel Y position
    dl $7E0915 : db $02 : dw $0009 ; Screen Y position in pixels
    dl $7E0917 : db $02 : dw $0000 ; Layer 2 X scroll in room in pixels?
    dl $7E0919 : db $02 : dw $0006 ; Layer 2 Y scroll in room in pixels? (up = positive)
    dl $7E0921 : db $02 : dw $F800 ; BG2 X scroll offset due to room transitions (Translates between Layer 2 scroll and BG2 scroll)
    dl $7E0923 : db $02 : dw $FF00 ; BG2 Y scroll offset due to room transitions (Translates between Layer 2 scroll and BG2 scroll)
    dl $7E09C2 : db $02 : dw $0120 ; Health
    dl $7E0A68 : db $02 : dw $0001 ; Flash suit
    dl $7E0AF6 : db $02 : dw $003D ; Samus X
    dl $7E0AFA : db $02 : dw $0099 ; Samus Y
    dl $7E0B3F : db $02 : dw $0000 ; Blue suit
    dl $7ED8DA : db $02 : dw $0E00 ; Events, Items, Doors
    dw #$FFFF
.after

preset_redesign_hi_jump_boots_sporespawn_exit:
    dw #preset_redesign_hi_jump_boots_water_bounceball ; Hi Jump Boots: Water Bounceball
    dl $7E078D : db $02 : dw $8FBE ; DDB
    dl $7E078F : db $02 : dw $0001 ; DoorOut Index
    dl $7E079B : db $02 : dw $9DC7 ; MDB
    dl $7E07F5 : db $02 : dw $0003 ; Music Track
    dl $7E090F : db $02 : dw $1000 ; Screen subpixel X position.
    dl $7E0915 : db $02 : dw $01C9 ; Screen Y position in pixels
    dl $7E0919 : db $02 : dw $01C9 ; Layer 2 Y scroll in room in pixels? (up = positive)
    dl $7E0921 : db $02 : dw $FF00 ; BG2 X scroll offset due to room transitions (Translates between Layer 2 scroll and BG2 scroll)
    dl $7E0923 : db $02 : dw $FE00 ; BG2 Y scroll offset due to room transitions (Translates between Layer 2 scroll and BG2 scroll)
    dl $7E09C2 : db $02 : dw $0116 ; Health
    dl $7E09CA : db $02 : dw $0004 ; Supers
    dl $7E09CC : db $02 : dw $0004 ; Max supers
    dl $7E0A1C : db $02 : dw $0001 ; Samus position/state
    dl $7E0A1E : db $02 : dw $0008 ; More position/state
    dl $7E0AF6 : db $02 : dw $00A0 ; Samus X
    dl $7E0AFA : db $02 : dw $023A ; Samus Y
    dl $7ED874 : db $02 : dw $8224 ; Events, Items, Doors
    dl $7ED8DC : db $02 : dw $0016 ; Events, Items, Doors
    dl $7ED91A : db $02 : dw $0087 ; Events, Items, Doors
    dw #$FFFF
.after

preset_redesign_hi_jump_boots_charge_hoppers:
    dw #preset_redesign_hi_jump_boots_sporespawn_exit ; Hi Jump Boots: SporeSpawn Exit
    dl $7E078D : db $02 : dw $8FB2 ; DDB
    dl $7E078F : db $02 : dw $0000 ; DoorOut Index
    dl $7E079B : db $02 : dw $9D19 ; MDB
    dl $7E07F5 : db $02 : dw $0005 ; Music Track
    dl $7E090F : db $02 : dw $C000 ; Screen subpixel X position.
    dl $7E0913 : db $02 : dw $F800 ; Screen subpixel Y position
    dl $7E0915 : db $02 : dw $0111 ; Screen Y position in pixels
    dl $7E0919 : db $02 : dw $00CC ; Layer 2 Y scroll in room in pixels? (up = positive)
    dl $7E0923 : db $02 : dw $FD00 ; BG2 Y scroll offset due to room transitions (Translates between Layer 2 scroll and BG2 scroll)
    dl $7E09C2 : db $02 : dw $0107 ; Health
    dl $7E09CA : db $02 : dw $0003 ; Supers
    dl $7E0A1C : db $02 : dw $0002 ; Samus position/state
    dl $7E0A1E : db $02 : dw $0004 ; More position/state
    dl $7E0AF6 : db $02 : dw $006F ; Samus X
    dl $7E0AFA : db $02 : dw $019B ; Samus Y
    dl $7ED8B4 : db $02 : dw $8851 ; Events, Items, Doors
    dl $7ED91A : db $02 : dw $0088 ; Events, Items, Doors
    dw #$FFFF
.after

preset_redesign_hi_jump_boots_charge_exit:
    dw #preset_redesign_hi_jump_boots_charge_hoppers ; Hi Jump Boots: Charge Hoppers
    dl $7E078D : db $02 : dw $9132 ; DDB
    dl $7E079B : db $02 : dw $9E11 ; MDB
    dl $7E090F : db $02 : dw $B000 ; Screen subpixel X position.
    dl $7E0911 : db $02 : dw $0100 ; Screen X position in pixels
    dl $7E0913 : db $02 : dw $9C00 ; Screen subpixel Y position
    dl $7E0915 : db $02 : dw $001C ; Screen Y position in pixels
    dl $7E0917 : db $02 : dw $00C0 ; Layer 2 X scroll in room in pixels?
    dl $7E0919 : db $02 : dw $0015 ; Layer 2 Y scroll in room in pixels? (up = positive)
    dl $7E0921 : db $02 : dw $FE00 ; BG2 X scroll offset due to room transitions (Translates between Layer 2 scroll and BG2 scroll)
    dl $7E0923 : db $02 : dw $FF00 ; BG2 Y scroll offset due to room transitions (Translates between Layer 2 scroll and BG2 scroll)
    dl $7E09A6 : db $02 : dw $1001 ; Beams
    dl $7E09A8 : db $02 : dw $1001 ; Beams
    dl $7E09CA : db $02 : dw $0002 ; Supers
    dl $7E0A1C : db $02 : dw $0001 ; Samus position/state
    dl $7E0A1E : db $02 : dw $0008 ; More position/state
    dl $7E0AF6 : db $02 : dw $01D4 ; Samus X
    dl $7E0AFA : db $02 : dw $008B ; Samus Y
    dl $7ED874 : db $02 : dw $82A4 ; Events, Items, Doors
    dl $7ED8B4 : db $02 : dw $8871 ; Events, Items, Doors
    dl $7ED91A : db $02 : dw $008B ; Events, Items, Doors
    dw #$FFFF
.after

preset_redesign_hi_jump_boots_missing_etank_room:
    dw #preset_redesign_hi_jump_boots_charge_exit ; Hi Jump Boots: Charge Exit
    dl $7E078D : db $02 : dw $8E62 ; DDB
    dl $7E079B : db $02 : dw $9D19 ; MDB
    dl $7E090F : db $02 : dw $4000 ; Screen subpixel X position.
    dl $7E0911 : db $02 : dw $0300 ; Screen X position in pixels
    dl $7E0913 : db $02 : dw $0000 ; Screen subpixel Y position
    dl $7E0915 : db $02 : dw $002C ; Screen Y position in pixels
    dl $7E0917 : db $02 : dw $0240 ; Layer 2 X scroll in room in pixels?
    dl $7E0919 : db $02 : dw $0021 ; Layer 2 Y scroll in room in pixels? (up = positive)
    dl $7E0921 : db $02 : dw $0100 ; BG2 X scroll offset due to room transitions (Translates between Layer 2 scroll and BG2 scroll)
    dl $7E09C2 : db $02 : dw $0111 ; Health
    dl $7E09CA : db $02 : dw $0004 ; Supers
    dl $7E0AF6 : db $02 : dw $03D3 ; Samus X
    dl $7E0AFA : db $02 : dw $009B ; Samus Y
    dl $7ED91A : db $02 : dw $008C ; Events, Items, Doors
    dw #$FFFF
.after

preset_redesign_hi_jump_boots_cacatac_alley:
    dw #preset_redesign_hi_jump_boots_missing_etank_room ; Hi Jump Boots: Missing Etank Room
    dl $7E078D : db $02 : dw $8F52 ; DDB
    dl $7E078F : db $02 : dw $0003 ; DoorOut Index
    dl $7E079B : db $02 : dw $A22A ; MDB
    dl $7E090F : db $02 : dw $F800 ; Screen subpixel X position.
    dl $7E0911 : db $02 : dw $0000 ; Screen X position in pixels
    dl $7E0913 : db $02 : dw $D800 ; Screen subpixel Y position
    dl $7E0915 : db $02 : dw $0200 ; Screen Y position in pixels
    dl $7E0917 : db $02 : dw $0000 ; Layer 2 X scroll in room in pixels?
    dl $7E0919 : db $02 : dw $0180 ; Layer 2 Y scroll in room in pixels? (up = positive)
    dl $7E0921 : db $02 : dw $FF00 ; BG2 X scroll offset due to room transitions (Translates between Layer 2 scroll and BG2 scroll)
    dl $7E0923 : db $02 : dw $0000 ; BG2 Y scroll offset due to room transitions (Translates between Layer 2 scroll and BG2 scroll)
    dl $7E09C2 : db $02 : dw $0100 ; Health
    dl $7E09C8 : db $02 : dw $0019 ; Max missiles
    dl $7E09CA : db $02 : dw $0000 ; Supers
    dl $7E0AF6 : db $02 : dw $00D7 ; Samus X
    dl $7E0AFA : db $02 : dw $028B ; Samus Y
    dl $7ED876 : db $02 : dw $4608 ; Events, Items, Doors
    dl $7ED8B2 : db $02 : dw $F901 ; Events, Items, Doors
    dl $7ED8B4 : db $02 : dw $A871 ; Events, Items, Doors
    dl $7ED91A : db $02 : dw $0094 ; Events, Items, Doors
    dw #$FFFF
.after

preset_redesign_hi_jump_boots_hi_jump_boots_2:
    dw #preset_redesign_hi_jump_boots_cacatac_alley ; Hi Jump Boots: Cacatac Alley
    dl $7E078D : db $02 : dw $AF39 ; DDB
    dl $7E078F : db $02 : dw $0001 ; DoorOut Index
    dl $7E079B : db $02 : dw $9FBA ; MDB
    dl $7E090F : db $02 : dw $A000 ; Screen subpixel X position.
    dl $7E0911 : db $02 : dw $0300 ; Screen X position in pixels
    dl $7E0913 : db $02 : dw $2600 ; Screen subpixel Y position
    dl $7E0915 : db $02 : dw $0016 ; Screen Y position in pixels
    dl $7E0917 : db $02 : dw $0240 ; Layer 2 X scroll in room in pixels?
    dl $7E0919 : db $02 : dw $0010 ; Layer 2 Y scroll in room in pixels? (up = positive)
    dl $7E0921 : db $02 : dw $0100 ; BG2 X scroll offset due to room transitions (Translates between Layer 2 scroll and BG2 scroll)
    dl $7E09C2 : db $02 : dw $00F8 ; Health
    dl $7E09CA : db $02 : dw $0003 ; Supers
    dl $7E0AF6 : db $02 : dw $03C5 ; Samus X
    dl $7E0AFA : db $02 : dw $008B ; Samus Y
    dw #$FFFF
.after

preset_redesign_grapple_hjb_exit:
    dw #preset_redesign_hi_jump_boots_hi_jump_boots_2 ; Hi Jump Boots: Hi Jump Boots
    dl $7E078D : db $02 : dw $8F0A ; DDB
    dl $7E079B : db $02 : dw $A201 ; MDB
    dl $7E090F : db $02 : dw $0000 ; Screen subpixel X position.
    dl $7E0911 : db $02 : dw $0004 ; Screen X position in pixels
    dl $7E0913 : db $02 : dw $0000 ; Screen subpixel Y position
    dl $7E0915 : db $02 : dw $00CC ; Screen Y position in pixels
    dl $7E0917 : db $02 : dw $0004 ; Layer 2 X scroll in room in pixels?
    dl $7E0919 : db $02 : dw $00CC ; Layer 2 Y scroll in room in pixels? (up = positive)
    dl $7E09A2 : db $02 : dw $3505 ; Equipped Items
    dl $7E09A4 : db $02 : dw $3505 ; Collected Items
    dl $7E09C2 : db $02 : dw $00E2 ; Health
    dl $7E0A1C : db $02 : dw $0002 ; Samus position/state
    dl $7E0A1E : db $02 : dw $0004 ; More position/state
    dl $7E0A68 : db $02 : dw $0000 ; Flash suit
    dl $7E0AF6 : db $02 : dw $00A4 ; Samus X
    dl $7E0AFA : db $02 : dw $013B ; Samus Y
    dl $7ED876 : db $02 : dw $460C ; Events, Items, Doors
    dl $7ED91A : db $02 : dw $0095 ; Events, Items, Doors
    dw #$FFFF
.after

preset_redesign_grapple_pb_gate:
    dw #preset_redesign_grapple_hjb_exit ; Grapple: HJB Exit
    dl $7E078D : db $02 : dw $8E86 ; DDB
    dl $7E079B : db $02 : dw $A0A4 ; MDB
    dl $7E090F : db $02 : dw $F000 ; Screen subpixel X position.
    dl $7E0911 : db $02 : dw $0000 ; Screen X position in pixels
    dl $7E0913 : db $02 : dw $B200 ; Screen subpixel Y position
    dl $7E0915 : db $02 : dw $000E ; Screen Y position in pixels
    dl $7E0917 : db $02 : dw $0000 ; Layer 2 X scroll in room in pixels?
    dl $7E0919 : db $02 : dw $000E ; Layer 2 Y scroll in room in pixels? (up = positive)
    dl $7E0921 : db $02 : dw $0000 ; BG2 X scroll offset due to room transitions (Translates between Layer 2 scroll and BG2 scroll)
    dl $7E0923 : db $02 : dw $FD00 ; BG2 Y scroll offset due to room transitions (Translates between Layer 2 scroll and BG2 scroll)
    dl $7E09C2 : db $02 : dw $009A ; Health
    dl $7E09CA : db $02 : dw $0004 ; Supers
    dl $7E09CE : db $02 : dw $0001 ; Pbs
    dl $7E0A1C : db $02 : dw $0001 ; Samus position/state
    dl $7E0A1E : db $02 : dw $0008 ; More position/state
    dl $7E0AF6 : db $02 : dw $0093 ; Samus X
    dl $7E0AFA : db $02 : dw $009B ; Samus Y
    dw #$FFFF
.after

preset_redesign_grapple_hopper_hallway_farm:
    dw #preset_redesign_grapple_pb_gate ; Grapple: PB Gate
    dl $7E078D : db $02 : dw $8F76 ; DDB
    dl $7E078F : db $02 : dw $0000 ; DoorOut Index
    dl $7E079B : db $02 : dw $9CB3 ; MDB
    dl $7E090F : db $02 : dw $E600 ; Screen subpixel X position.
    dl $7E0911 : db $02 : dw $0600 ; Screen X position in pixels
    dl $7E0913 : db $02 : dw $0000 ; Screen subpixel Y position
    dl $7E0915 : db $02 : dw $021D ; Screen Y position in pixels
    dl $7E0917 : db $02 : dw $0480 ; Layer 2 X scroll in room in pixels?
    dl $7E0919 : db $02 : dw $021D ; Layer 2 Y scroll in room in pixels? (up = positive)
    dl $7E0921 : db $02 : dw $FE00 ; BG2 X scroll offset due to room transitions (Translates between Layer 2 scroll and BG2 scroll)
    dl $7E0923 : db $02 : dw $FA00 ; BG2 Y scroll offset due to room transitions (Translates between Layer 2 scroll and BG2 scroll)
    dl $7E09C2 : db $02 : dw $0043 ; Health
    dl $7E09C6 : db $02 : dw $0003 ; Missiles
    dl $7E09CA : db $02 : dw $0002 ; Supers
    dl $7E0AF6 : db $02 : dw $06C6 ; Samus X
    dl $7E0AFA : db $02 : dw $028B ; Samus Y
    dl $7ED8A0 : db $02 : dw $0100 ; Events, Items, Doors
    dl $7ED8DE : db $02 : dw $8000 ; Events, Items, Doors
    dl $7ED91A : db $02 : dw $0097 ; Events, Items, Doors
    dw #$FFFF
.after

preset_redesign_grapple_towards_dachora:
    dw #preset_redesign_grapple_hopper_hallway_farm ; Grapple: Hopper Hallway Farm
    dl $7E078D : db $02 : dw $8DAE ; DDB
    dl $7E078F : db $02 : dw $0001 ; DoorOut Index
    dl $7E079B : db $02 : dw $9BC8 ; MDB
    dl $7E090F : db $02 : dw $5000 ; Screen subpixel X position.
    dl $7E0911 : db $02 : dw $0200 ; Screen X position in pixels
    dl $7E0913 : db $02 : dw $55FF ; Screen subpixel Y position
    dl $7E0915 : db $02 : dw $0100 ; Screen Y position in pixels
    dl $7E0917 : db $02 : dw $0180 ; Layer 2 X scroll in room in pixels?
    dl $7E0919 : db $02 : dw $00C0 ; Layer 2 Y scroll in room in pixels? (up = positive)
    dl $7E0921 : db $02 : dw $FF00 ; BG2 X scroll offset due to room transitions (Translates between Layer 2 scroll and BG2 scroll)
    dl $7E0923 : db $02 : dw $FF00 ; BG2 Y scroll offset due to room transitions (Translates between Layer 2 scroll and BG2 scroll)
    dl $7E09C2 : db $02 : dw $00AB ; Health
    dl $7E09C6 : db $02 : dw $000A ; Missiles
    dl $7E09CA : db $02 : dw $0006 ; Supers
    dl $7E09CC : db $02 : dw $0006 ; Max supers
    dl $7E0A1C : db $02 : dw $0002 ; Samus position/state
    dl $7E0A1E : db $02 : dw $0004 ; More position/state
    dl $7E0AF6 : db $02 : dw $023C ; Samus X
    dl $7E0AFA : db $02 : dw $018B ; Samus Y
    dl $7ED874 : db $02 : dw $92A4 ; Events, Items, Doors
    dl $7ED8C4 : db $02 : dw $0040 ; Events, Items, Doors
    dl $7ED91A : db $02 : dw $009B ; Events, Items, Doors
    dw #$FFFF
.after

preset_redesign_grapple_leaving_dachora:
    dw #preset_redesign_grapple_towards_dachora ; Grapple: Towards Dachora
    dl $7E078D : db $02 : dw $C3EC ; DDB
    dl $7E078F : db $02 : dw $0003 ; DoorOut Index
    dl $7E079B : db $02 : dw $A734 ; MDB
    dl $7E090F : db $02 : dw $C000 ; Screen subpixel X position.
    dl $7E0911 : db $02 : dw $0000 ; Screen X position in pixels
    dl $7E0913 : db $02 : dw $2C00 ; Screen subpixel Y position
    dl $7E0917 : db $02 : dw $0000 ; Layer 2 X scroll in room in pixels?
    dl $7E0921 : db $02 : dw $0100 ; BG2 X scroll offset due to room transitions (Translates between Layer 2 scroll and BG2 scroll)
    dl $7E09C2 : db $02 : dw $0092 ; Health
    dl $7E09C6 : db $02 : dw $0005 ; Missiles
    dl $7E09CA : db $02 : dw $0001 ; Supers
    dl $7E0A1C : db $02 : dw $0001 ; Samus position/state
    dl $7E0A1E : db $02 : dw $0008 ; More position/state
    dl $7E0AF6 : db $02 : dw $0035 ; Samus X
    dl $7E0AFA : db $02 : dw $01BB ; Samus Y
    dl $7ED8B4 : db $02 : dw $A875 ; Events, Items, Doors
    dl $7ED8D8 : db $02 : dw $0040 ; Events, Items, Doors
    dl $7ED91A : db $02 : dw $009D ; Events, Items, Doors
    dw #$FFFF
.after

preset_redesign_grapple_pink_wall:
    dw #preset_redesign_grapple_leaving_dachora ; Grapple: Leaving Dachora
    dl $7E078D : db $02 : dw $8DBA ; DDB
    dl $7E078F : db $02 : dw $0002 ; DoorOut Index
    dl $7E079B : db $02 : dw $A0A4 ; MDB
    dl $7E090F : db $02 : dw $0000 ; Screen subpixel X position.
    dl $7E0913 : db $02 : dw $3E00 ; Screen subpixel Y position
    dl $7E0915 : db $02 : dw $021F ; Screen Y position in pixels
    dl $7E0919 : db $02 : dw $021F ; Layer 2 Y scroll in room in pixels? (up = positive)
    dl $7E0921 : db $02 : dw $FF00 ; BG2 X scroll offset due to room transitions (Translates between Layer 2 scroll and BG2 scroll)
    dl $7E0923 : db $02 : dw $0000 ; BG2 Y scroll offset due to room transitions (Translates between Layer 2 scroll and BG2 scroll)
    dl $7E09C2 : db $02 : dw $00A1 ; Health
    dl $7E09C6 : db $02 : dw $0007 ; Missiles
    dl $7E09CA : db $02 : dw $0002 ; Supers
    dl $7E0A1C : db $02 : dw $0002 ; Samus position/state
    dl $7E0A1E : db $02 : dw $0004 ; More position/state
    dl $7E0AF6 : db $02 : dw $0083 ; Samus X
    dl $7E0AFA : db $02 : dw $02CB ; Samus Y
    dl $7ED91A : db $02 : dw $009F ; Events, Items, Doors
    dw #$FFFF
.after

preset_redesign_grapple_norfair_elevator:
    dw #preset_redesign_grapple_pink_wall ; Grapple: Pink Wall
    dl $7E078D : db $02 : dw $914A ; DDB
    dl $7E078F : db $02 : dw $0003 ; DoorOut Index
    dl $7E079B : db $02 : dw $A6A1 ; MDB
    dl $7E07C3 : db $02 : dw $A5AA ; GFX Pointers
    dl $7E07C5 : db $02 : dw $5FBC ; GFX Pointers
    dl $7E07C7 : db $02 : dw $C2B3 ; GFX Pointers
    dl $7E07F3 : db $02 : dw $0012 ; Music Bank
    dl $7E07F5 : db $02 : dw $0003 ; Music Track
    dl $7E090F : db $02 : dw $4000 ; Screen subpixel X position.
    dl $7E0911 : db $02 : dw $0100 ; Screen X position in pixels
    dl $7E0913 : db $02 : dw $7C00 ; Screen subpixel Y position
    dl $7E0915 : db $02 : dw $0000 ; Screen Y position in pixels
    dl $7E0917 : db $02 : dw $0100 ; Layer 2 X scroll in room in pixels?
    dl $7E0919 : db $02 : dw $0000 ; Layer 2 Y scroll in room in pixels? (up = positive)
    dl $7E0921 : db $02 : dw $FE00 ; BG2 X scroll offset due to room transitions (Translates between Layer 2 scroll and BG2 scroll)
    dl $7E09C2 : db $02 : dw $001E ; Health
    dl $7E09CA : db $02 : dw $0001 ; Supers
    dl $7E09CE : db $02 : dw $0000 ; Pbs
    dl $7E0AF6 : db $02 : dw $017D ; Samus X
    dl $7E0AFA : db $02 : dw $008B ; Samus Y
    dl $7ED8A0 : db $02 : dw $0900 ; Events, Items, Doors
    dl $7ED8B4 : db $02 : dw $E875 ; Events, Items, Doors
    dl $7ED91A : db $02 : dw $00A2 ; Events, Items, Doors
    dw #$FFFF
.after

preset_redesign_grapple_ice_hellway_farm:
    dw #preset_redesign_grapple_norfair_elevator ; Grapple: Norfair Elevator
    dl $7E078D : db $02 : dw $985E ; DDB
    dl $7E078F : db $02 : dw $0001 ; DoorOut Index
    dl $7E079B : db $02 : dw $BFCF ; MDB
    dl $7E079F : db $02 : dw $0002 ; Region
    dl $7E07C3 : db $02 : dw $C3F9 ; GFX Pointers
    dl $7E07C5 : db $02 : dw $E4BD ; GFX Pointers
    dl $7E07C7 : db $02 : dw $C2B5 ; GFX Pointers
    dl $7E07F3 : db $02 : dw $0015 ; Music Bank
    dl $7E07F5 : db $02 : dw $0005 ; Music Track
    dl $7E090F : db $02 : dw $0000 ; Screen subpixel X position.
    dl $7E0911 : db $02 : dw $0300 ; Screen X position in pixels
    dl $7E0913 : db $02 : dw $01FF ; Screen subpixel Y position
    dl $7E0915 : db $02 : dw $0100 ; Screen Y position in pixels
    dl $7E0917 : db $02 : dw $0300 ; Layer 2 X scroll in room in pixels?
    dl $7E0919 : db $02 : dw $0100 ; Layer 2 Y scroll in room in pixels? (up = positive)
    dl $7E0921 : db $02 : dw $0100 ; BG2 X scroll offset due to room transitions (Translates between Layer 2 scroll and BG2 scroll)
    dl $7E0923 : db $02 : dw $FF00 ; BG2 Y scroll offset due to room transitions (Translates between Layer 2 scroll and BG2 scroll)
    dl $7E09C2 : db $02 : dw $01F3 ; Health
    dl $7E09C4 : db $02 : dw $01F3 ; Max health
    dl $7E09CA : db $02 : dw $0000 ; Supers
    dl $7E0A1C : db $02 : dw $0001 ; Samus position/state
    dl $7E0A1E : db $02 : dw $0008 ; More position/state
    dl $7E0AF6 : db $02 : dw $03CA ; Samus X
    dl $7E0AFA : db $02 : dw $016B ; Samus Y
    dl $7ED880 : db $02 : dw $6000 ; Events, Items, Doors
    dl $7ED8BC : db $02 : dw $000C ; Events, Items, Doors
    dl $7ED91A : db $02 : dw $00A5 ; Events, Items, Doors
    dw #$FFFF
.after

preset_redesign_grapple_ice_hellway_shutters:
    dw #preset_redesign_grapple_ice_hellway_farm ; Grapple: Ice Hellway Farm
    dl $7E078D : db $02 : dw $9756 ; DDB
    dl $7E079B : db $02 : dw $AEDF ; MDB
    dl $7E090F : db $02 : dw $5000 ; Screen subpixel X position.
    dl $7E0911 : db $02 : dw $0700 ; Screen X position in pixels
    dl $7E0913 : db $02 : dw $EC00 ; Screen subpixel Y position
    dl $7E0915 : db $02 : dw $010A ; Screen Y position in pixels
    dl $7E0917 : db $02 : dw $0540 ; Layer 2 X scroll in room in pixels?
    dl $7E0919 : db $02 : dw $00C7 ; Layer 2 Y scroll in room in pixels? (up = positive)
    dl $7E0921 : db $02 : dw $FB00 ; BG2 X scroll offset due to room transitions (Translates between Layer 2 scroll and BG2 scroll)
    dl $7E0923 : db $02 : dw $FD00 ; BG2 Y scroll offset due to room transitions (Translates between Layer 2 scroll and BG2 scroll)
    dl $7E09C6 : db $02 : dw $0019 ; Missiles
    dl $7E09CA : db $02 : dw $0005 ; Supers
    dl $7E09CE : db $02 : dw $0001 ; Pbs
    dl $7E0A1C : db $02 : dw $0002 ; Samus position/state
    dl $7E0A1E : db $02 : dw $0004 ; More position/state
    dl $7E0AF6 : db $02 : dw $0765 ; Samus X
    dl $7E0AFA : db $02 : dw $018B ; Samus Y
    dl $7ED8BA : db $02 : dw $0080 ; Events, Items, Doors
    dw #$FFFF
.after

preset_redesign_grapple_ice_tripper:
    dw #preset_redesign_grapple_ice_hellway_shutters ; Grapple: Ice Hellway Shutters
    dl $7E078D : db $02 : dw $96AE ; DDB
    dl $7E078F : db $02 : dw $0000 ; DoorOut Index
    dl $7E079B : db $02 : dw $B026 ; MDB
    dl $7E090F : db $02 : dw $6000 ; Screen subpixel X position.
    dl $7E0911 : db $02 : dw $0000 ; Screen X position in pixels
    dl $7E0913 : db $02 : dw $CC00 ; Screen subpixel Y position
    dl $7E0915 : db $02 : dw $0000 ; Screen Y position in pixels
    dl $7E0917 : db $02 : dw $0000 ; Layer 2 X scroll in room in pixels?
    dl $7E0919 : db $02 : dw $0000 ; Layer 2 Y scroll in room in pixels? (up = positive)
    dl $7E0921 : db $02 : dw $0100 ; BG2 X scroll offset due to room transitions (Translates between Layer 2 scroll and BG2 scroll)
    dl $7E0923 : db $02 : dw $0000 ; BG2 Y scroll offset due to room transitions (Translates between Layer 2 scroll and BG2 scroll)
    dl $7E09C2 : db $02 : dw $01EB ; Health
    dl $7E09CA : db $02 : dw $0004 ; Supers
    dl $7E0A1C : db $02 : dw $0001 ; Samus position/state
    dl $7E0A1E : db $02 : dw $0008 ; More position/state
    dl $7E0AF6 : db $02 : dw $00D2 ; Samus X
    dl $7E0AFA : db $02 : dw $008B ; Samus Y
    dl $7ED8BA : db $02 : dw $0180 ; Events, Items, Doors
    dw #$FFFF
.after

preset_redesign_grapple_leaving_ice:
    dw #preset_redesign_grapple_ice_tripper ; Grapple: Ice Tripper
    dl $7E078D : db $02 : dw $937E ; DDB
    dl $7E078F : db $02 : dw $0002 ; DoorOut Index
    dl $7E079B : db $02 : dw $A890 ; MDB
    dl $7E07F5 : db $02 : dw $0003 ; Music Track
    dl $7E090F : db $02 : dw $8000 ; Screen subpixel X position.
    dl $7E0913 : db $02 : dw $0000 ; Screen subpixel Y position
    dl $7E0917 : db $02 : dw $0001 ; Layer 2 X scroll in room in pixels?
    dl $7E09A8 : db $02 : dw $1003 ; Beams
    dl $7E09C2 : db $02 : dw $01BD ; Health
    dl $7E09C6 : db $02 : dw $0018 ; Missiles
    dl $7E0A1C : db $02 : dw $0002 ; Samus position/state
    dl $7E0A1E : db $02 : dw $0004 ; More position/state
    dl $7E0AF6 : db $02 : dw $00AA ; Samus X
    dl $7ED878 : db $02 : dw $0005 ; Events, Items, Doors
    dl $7ED8D8 : db $02 : dw $00C0 ; Events, Items, Doors
    dl $7ED91A : db $02 : dw $00A6 ; Events, Items, Doors
    dw #$FFFF
.after

preset_redesign_grapple_pb_blockade_farm:
    dw #preset_redesign_grapple_leaving_ice ; Grapple: Leaving Ice
    dl $7E078D : db $02 : dw $9366 ; DDB
    dl $7E078F : db $02 : dw $0000 ; DoorOut Index
    dl $7E079B : db $02 : dw $A865 ; MDB
    dl $7E07F5 : db $02 : dw $0005 ; Music Track
    dl $7E090F : db $02 : dw $0000 ; Screen subpixel X position.
    dl $7E0911 : db $02 : dw $0500 ; Screen X position in pixels
    dl $7E0913 : db $02 : dw $3000 ; Screen subpixel Y position
    dl $7E0915 : db $02 : dw $0007 ; Screen Y position in pixels
    dl $7E0917 : db $02 : dw $03C0 ; Layer 2 X scroll in room in pixels?
    dl $7E0919 : db $02 : dw $0005 ; Layer 2 Y scroll in room in pixels? (up = positive)
    dl $7E09C2 : db $02 : dw $0145 ; Health
    dl $7E09C6 : db $02 : dw $0013 ; Missiles
    dl $7E09CA : db $02 : dw $0000 ; Supers
    dl $7E0A1C : db $02 : dw $0001 ; Samus position/state
    dl $7E0A1E : db $02 : dw $0008 ; More position/state
    dl $7E0AF6 : db $02 : dw $05DB ; Samus X
    dl $7ED8B8 : db $02 : dw $0021 ; Events, Items, Doors
    dw #$FFFF
.after

preset_redesign_grapple_missile_skip:
    dw #preset_redesign_grapple_pb_blockade_farm ; Grapple: PB Blockade Farm
    dl $7E078D : db $02 : dw $934E ; DDB
    dl $7E078F : db $02 : dw $0001 ; DoorOut Index
    dl $7E079B : db $02 : dw $A7DE ; MDB
    dl $7E090F : db $02 : dw $8000 ; Screen subpixel X position.
    dl $7E0911 : db $02 : dw $0100 ; Screen X position in pixels
    dl $7E0913 : db $02 : dw $0000 ; Screen subpixel Y position
    dl $7E0915 : db $02 : dw $0122 ; Screen Y position in pixels
    dl $7E0917 : db $02 : dw $00C0 ; Layer 2 X scroll in room in pixels?
    dl $7E0919 : db $02 : dw $00D9 ; Layer 2 Y scroll in room in pixels? (up = positive)
    dl $7E0923 : db $02 : dw $FE00 ; BG2 Y scroll offset due to room transitions (Translates between Layer 2 scroll and BG2 scroll)
    dl $7E09C2 : db $02 : dw $01F3 ; Health
    dl $7E09C6 : db $02 : dw $0019 ; Missiles
    dl $7E09CA : db $02 : dw $0006 ; Supers
    dl $7E0AF6 : db $02 : dw $01C8 ; Samus X
    dl $7E0AFA : db $02 : dw $018B ; Samus Y
    dl $7ED8AE : db $02 : dw $0405 ; Events, Items, Doors
    dl $7ED8B6 : db $02 : dw $800A ; Events, Items, Doors
    dw #$FFFF
.after

preset_redesign_grapple_prescrew:
    dw #preset_redesign_grapple_missile_skip ; Grapple: Missile Skip
    dl $7E078D : db $02 : dw $95EE ; DDB
    dl $7E078F : db $02 : dw $0003 ; DoorOut Index
    dl $7E079B : db $02 : dw $AEB4 ; MDB
    dl $7E090F : db $02 : dw $0000 ; Screen subpixel X position.
    dl $7E0911 : db $02 : dw $0000 ; Screen X position in pixels
    dl $7E0913 : db $02 : dw $F001 ; Screen subpixel Y position
    dl $7E0915 : db $02 : dw $0500 ; Screen Y position in pixels
    dl $7E0917 : db $02 : dw $0000 ; Layer 2 X scroll in room in pixels?
    dl $7E0919 : db $02 : dw $03C0 ; Layer 2 Y scroll in room in pixels? (up = positive)
    dl $7E0921 : db $02 : dw $FE00 ; BG2 X scroll offset due to room transitions (Translates between Layer 2 scroll and BG2 scroll)
    dl $7E0923 : db $02 : dw $FD00 ; BG2 Y scroll offset due to room transitions (Translates between Layer 2 scroll and BG2 scroll)
    dl $7E09C2 : db $02 : dw $019B ; Health
    dl $7E09CA : db $02 : dw $0005 ; Supers
    dl $7E0A1C : db $02 : dw $0002 ; Samus position/state
    dl $7E0A1E : db $02 : dw $0004 ; More position/state
    dl $7E0AF6 : db $02 : dw $00C8 ; Samus X
    dl $7E0AFA : db $02 : dw $059B ; Samus Y
    dl $7ED8BA : db $02 : dw $0181 ; Events, Items, Doors
    dl $7ED8D8 : db $02 : dw $10C0 ; Events, Items, Doors
    dl $7ED91A : db $02 : dw $00A9 ; Events, Items, Doors
    dw #$FFFF
.after

preset_redesign_grapple_screw:
    dw #preset_redesign_grapple_prescrew ; Grapple: Prescrew
    dl $7E078D : db $02 : dw $B11F ; DDB
    dl $7E078F : db $02 : dw $0002 ; DoorOut Index
    dl $7E079B : db $02 : dw $C062 ; MDB
    dl $7E090F : db $02 : dw $D000 ; Screen subpixel X position.
    dl $7E0911 : db $02 : dw $0200 ; Screen X position in pixels
    dl $7E0913 : db $02 : dw $1000 ; Screen subpixel Y position
    dl $7E0915 : db $02 : dw $04FC ; Screen Y position in pixels
    dl $7E0917 : db $02 : dw $0180 ; Layer 2 X scroll in room in pixels?
    dl $7E0919 : db $02 : dw $03BD ; Layer 2 Y scroll in room in pixels? (up = positive)
    dl $7E0921 : db $02 : dw $FD00 ; BG2 X scroll offset due to room transitions (Translates between Layer 2 scroll and BG2 scroll)
    dl $7E0923 : db $02 : dw $0000 ; BG2 Y scroll offset due to room transitions (Translates between Layer 2 scroll and BG2 scroll)
    dl $7E09C2 : db $02 : dw $0170 ; Health
    dl $7E09C6 : db $02 : dw $000A ; Missiles
    dl $7E09CA : db $02 : dw $0003 ; Supers
    dl $7E0A1C : db $02 : dw $0001 ; Samus position/state
    dl $7E0A1E : db $02 : dw $0008 ; More position/state
    dl $7E0AF6 : db $02 : dw $02D0 ; Samus X
    dl $7E0B3F : db $02 : dw $0004 ; Blue suit
    dl $7ED8AE : db $02 : dw $2405 ; Events, Items, Doors
    dl $7ED8C2 : db $02 : dw $4000 ; Events, Items, Doors
    dl $7ED8DA : db $02 : dw $8E00 ; Events, Items, Doors
    dw #$FFFF
.after

preset_redesign_grapple_refill_room:
    dw #preset_redesign_grapple_screw ; Grapple: Screw
    dl $7E078D : db $02 : dw $B167 ; DDB
    dl $7E079B : db $02 : dw $B55A ; MDB
    dl $7E090F : db $02 : dw $7000 ; Screen subpixel X position.
    dl $7E0911 : db $02 : dw $06E2 ; Screen X position in pixels
    dl $7E0913 : db $02 : dw $A200 ; Screen subpixel Y position
    dl $7E0915 : db $02 : dw $021F ; Screen Y position in pixels
    dl $7E0917 : db $02 : dw $0529 ; Layer 2 X scroll in room in pixels?
    dl $7E0919 : db $02 : dw $0197 ; Layer 2 Y scroll in room in pixels? (up = positive)
    dl $7E0921 : db $02 : dw $FF00 ; BG2 X scroll offset due to room transitions (Translates between Layer 2 scroll and BG2 scroll)
    dl $7E09A2 : db $02 : dw $350D ; Equipped Items
    dl $7E09A4 : db $02 : dw $350D ; Collected Items
    dl $7E09C2 : db $02 : dw $00EF ; Health
    dl $7E0AF6 : db $02 : dw $0742 ; Samus X
    dl $7E0AFA : db $02 : dw $02CB ; Samus Y
    dl $7E0B3F : db $02 : dw $0000 ; Blue suit
    dl $7ED87A : db $02 : dw $8010 ; Events, Items, Doors
    dl $7ED91A : db $02 : dw $00AA ; Events, Items, Doors
    dw #$FFFF
.after

preset_redesign_grapple_spark_blockade:
    dw #preset_redesign_grapple_refill_room ; Grapple: Refill Room
    dl $7E078D : db $02 : dw $B1BB ; DDB
    dl $7E078F : db $02 : dw $0004 ; DoorOut Index
    dl $7E079B : db $02 : dw $B6EE ; MDB
    dl $7E090F : db $02 : dw $B200 ; Screen subpixel X position.
    dl $7E0911 : db $02 : dw $0300 ; Screen X position in pixels
    dl $7E0913 : db $02 : dw $EE00 ; Screen subpixel Y position
    dl $7E0915 : db $02 : dw $031F ; Screen Y position in pixels
    dl $7E0917 : db $02 : dw $0240 ; Layer 2 X scroll in room in pixels?
    dl $7E0919 : db $02 : dw $0257 ; Layer 2 Y scroll in room in pixels? (up = positive)
    dl $7E0921 : db $02 : dw $FA00 ; BG2 X scroll offset due to room transitions (Translates between Layer 2 scroll and BG2 scroll)
    dl $7E09C2 : db $02 : dw $01F3 ; Health
    dl $7E09C6 : db $02 : dw $0019 ; Missiles
    dl $7E0A1C : db $02 : dw $0002 ; Samus position/state
    dl $7E0A1E : db $02 : dw $0004 ; More position/state
    dl $7E0AF6 : db $02 : dw $038E ; Samus X
    dl $7E0AFA : db $02 : dw $0394 ; Samus Y
    dl $7ED91A : db $02 : dw $00AC ; Events, Items, Doors
    dw #$FFFF
.after

preset_redesign_grapple_guardian_runback:
    dw #preset_redesign_grapple_spark_blockade ; Grapple: Spark Blockade
    dl $7E078D : db $02 : dw $970E ; DDB
    dl $7E078F : db $02 : dw $0000 ; DoorOut Index
    dl $7E079B : db $02 : dw $ACB3 ; MDB
    dl $7E090F : db $02 : dw $0000 ; Screen subpixel X position.
    dl $7E0911 : db $02 : dw $0016 ; Screen X position in pixels
    dl $7E0913 : db $02 : dw $3F00 ; Screen subpixel Y position
    dl $7E0915 : db $02 : dw $0000 ; Screen Y position in pixels
    dl $7E0917 : db $02 : dw $0010 ; Layer 2 X scroll in room in pixels?
    dl $7E0919 : db $02 : dw $0000 ; Layer 2 Y scroll in room in pixels? (up = positive)
    dl $7E0921 : db $02 : dw $FD00 ; BG2 X scroll offset due to room transitions (Translates between Layer 2 scroll and BG2 scroll)
    dl $7E0923 : db $02 : dw $FF00 ; BG2 Y scroll offset due to room transitions (Translates between Layer 2 scroll and BG2 scroll)
    dl $7E09C2 : db $02 : dw $0185 ; Health
    dl $7E09CA : db $02 : dw $0002 ; Supers
    dl $7E09CE : db $02 : dw $0000 ; Pbs
    dl $7E09D0 : db $02 : dw $0002 ; Max pbs
    dl $7E0A1C : db $02 : dw $0001 ; Samus position/state
    dl $7E0A1E : db $02 : dw $0008 ; More position/state
    dl $7E0AF6 : db $02 : dw $0076 ; Samus X
    dl $7E0AFA : db $02 : dw $006B ; Samus Y
    dl $7ED826 : db $02 : dw $0080 ; Events, Items, Doors
    dl $7ED87A : db $02 : dw $8011 ; Events, Items, Doors
    dl $7ED8AE : db $02 : dw $240D ; Events, Items, Doors
    dl $7ED8BE : db $02 : dw $2C06 ; Events, Items, Doors
    dl $7ED8DC : db $02 : dw $0096 ; Events, Items, Doors
    dl $7ED91A : db $02 : dw $00AD ; Events, Items, Doors
    dw #$FFFF
.after

preset_redesign_grapple_dessgeega_kill_room:
    dw #preset_redesign_grapple_guardian_runback ; Grapple: Guardian Runback
    dl $7E078D : db $02 : dw $9576 ; DDB
    dl $7E078F : db $02 : dw $0003 ; DoorOut Index
    dl $7E079B : db $02 : dw $B0DD ; MDB
    dl $7E090F : db $02 : dw $7000 ; Screen subpixel X position.
    dl $7E0911 : db $02 : dw $0000 ; Screen X position in pixels
    dl $7E0913 : db $02 : dw $0000 ; Screen subpixel Y position
    dl $7E0915 : db $02 : dw $07FB ; Screen Y position in pixels
    dl $7E0917 : db $02 : dw $0000 ; Layer 2 X scroll in room in pixels?
    dl $7E0919 : db $02 : dw $05FC ; Layer 2 Y scroll in room in pixels? (up = positive)
    dl $7E0921 : db $02 : dw $0100 ; BG2 X scroll offset due to room transitions (Translates between Layer 2 scroll and BG2 scroll)
    dl $7E0923 : db $02 : dw $FA00 ; BG2 Y scroll offset due to room transitions (Translates between Layer 2 scroll and BG2 scroll)
    dl $7E09C2 : db $02 : dw $01F0 ; Health
    dl $7E09CA : db $02 : dw $0006 ; Supers
    dl $7E09CE : db $02 : dw $0002 ; Pbs
    dl $7E0A1C : db $02 : dw $0002 ; Samus position/state
    dl $7E0A1E : db $02 : dw $0004 ; More position/state
    dl $7E0AF6 : db $02 : dw $003F ; Samus X
    dl $7E0AFA : db $02 : dw $088B ; Samus Y
    dl $7ED8B8 : db $02 : dw $8021 ; Events, Items, Doors
    dw #$FFFF
.after

preset_redesign_grapple_pipe_tunnels:
    dw #preset_redesign_grapple_dessgeega_kill_room ; Grapple: Dessgeega Kill Room
    dl $7E078D : db $02 : dw $B227 ; DDB
    dl $7E078F : db $02 : dw $0002 ; DoorOut Index
    dl $7E079B : db $02 : dw $ACB3 ; MDB
    dl $7E090F : db $02 : dw $9000 ; Screen subpixel X position.
    dl $7E0915 : db $02 : dw $0201 ; Screen Y position in pixels
    dl $7E0919 : db $02 : dw $0180 ; Layer 2 Y scroll in room in pixels? (up = positive)
    dl $7E0921 : db $02 : dw $FA00 ; BG2 X scroll offset due to room transitions (Translates between Layer 2 scroll and BG2 scroll)
    dl $7E0923 : db $02 : dw $FB00 ; BG2 Y scroll offset due to room transitions (Translates between Layer 2 scroll and BG2 scroll)
    dl $7E09C2 : db $02 : dw $01F3 ; Health
    dl $7E0AF6 : db $02 : dw $003E ; Samus X
    dl $7E0AFA : db $02 : dw $028B ; Samus Y
    dl $7ED8CC : db $02 : dw $0040 ; Events, Items, Doors
    dl $7ED91A : db $02 : dw $00AE ; Events, Items, Doors
    dw #$FFFF
.after

preset_redesign_grapple_tripper_ride:
    dw #preset_redesign_grapple_pipe_tunnels ; Grapple: Pipe Tunnels
    dl $7E078D : db $02 : dw $9486 ; DDB
    dl $7E078F : db $02 : dw $0001 ; DoorOut Index
    dl $7E079B : db $02 : dw $ABD2 ; MDB
    dl $7E090F : db $02 : dw $4000 ; Screen subpixel X position.
    dl $7E0913 : db $02 : dw $1C00 ; Screen subpixel Y position
    dl $7E0915 : db $02 : dw $01FC ; Screen Y position in pixels
    dl $7E0919 : db $02 : dw $017D ; Layer 2 Y scroll in room in pixels? (up = positive)
    dl $7E0921 : db $02 : dw $FF00 ; BG2 X scroll offset due to room transitions (Translates between Layer 2 scroll and BG2 scroll)
    dl $7E0923 : db $02 : dw $0000 ; BG2 Y scroll offset due to room transitions (Translates between Layer 2 scroll and BG2 scroll)
    dl $7E09C2 : db $02 : dw $01EC ; Health
    dl $7E0AF6 : db $02 : dw $0031 ; Samus X
    dl $7ED8A8 : db $02 : dw $1800 ; Events, Items, Doors
    dw #$FFFF
.after

preset_redesign_lower_norfair_springball_skip:
    dw #preset_redesign_grapple_tripper_ride ; Grapple: Tripper Ride
    dl $7E078D : db $02 : dw $9636 ; DDB
    dl $7E078F : db $02 : dw $0000 ; DoorOut Index
    dl $7E079B : db $02 : dw $AC2B ; MDB
    dl $7E07F5 : db $02 : dw $0003 ; Music Track
    dl $7E090F : db $02 : dw $F000 ; Screen subpixel X position.
    dl $7E0913 : db $02 : dw $0102 ; Screen subpixel Y position
    dl $7E0915 : db $02 : dw $0000 ; Screen Y position in pixels
    dl $7E0919 : db $02 : dw $0000 ; Layer 2 Y scroll in room in pixels? (up = positive)
    dl $7E0921 : db $02 : dw $FD00 ; BG2 X scroll offset due to room transitions (Translates between Layer 2 scroll and BG2 scroll)
    dl $7E09A2 : db $02 : dw $750D ; Equipped Items
    dl $7E09A4 : db $02 : dw $750D ; Collected Items
    dl $7E09C2 : db $02 : dw $01DF ; Health
    dl $7E09C6 : db $02 : dw $0014 ; Missiles
    dl $7E0AF6 : db $02 : dw $006E ; Samus X
    dl $7E0AFA : db $02 : dw $008B ; Samus Y
    dl $7ED878 : db $02 : dw $0805 ; Events, Items, Doors
    dl $7ED8BA : db $02 : dw $0185 ; Events, Items, Doors
    dl $7ED91A : db $02 : dw $00AF ; Events, Items, Doors
    dw #$FFFF
.after

preset_redesign_lower_norfair_acid_death_spikes:
    dw #preset_redesign_lower_norfair_springball_skip ; Lower Norfair: Springball Skip
    dl $7E078D : db $02 : dw $9522 ; DDB
    dl $7E078F : db $02 : dw $0001 ; DoorOut Index
    dl $7E079B : db $02 : dw $B3A5 ; MDB
    dl $7E07F3 : db $02 : dw $0018 ; Music Bank
    dl $7E07F5 : db $02 : dw $0005 ; Music Track
    dl $7E090F : db $02 : dw $D000 ; Screen subpixel X position.
    dl $7E0911 : db $02 : dw $0100 ; Screen X position in pixels
    dl $7E0913 : db $02 : dw $A9FD ; Screen subpixel Y position
    dl $7E0915 : db $02 : dw $0721 ; Screen Y position in pixels
    dl $7E0917 : db $02 : dw $0100 ; Layer 2 X scroll in room in pixels?
    dl $7E0919 : db $02 : dw $0558 ; Layer 2 Y scroll in room in pixels? (up = positive)
    dl $7E0923 : db $02 : dw $F800 ; BG2 Y scroll offset due to room transitions (Translates between Layer 2 scroll and BG2 scroll)
    dl $7E09C2 : db $02 : dw $01E4 ; Health
    dl $7E0AF6 : db $02 : dw $013A ; Samus X
    dl $7E0AFA : db $02 : dw $078B ; Samus Y
    dl $7ED8A6 : db $02 : dw $0010 ; Events, Items, Doors
    dw #$FFFF
.after

preset_redesign_lower_norfair_bull_room:
    dw #preset_redesign_lower_norfair_acid_death_spikes ; Lower Norfair: Acid Death Spikes
    dl $7E078D : db $02 : dw $B660 ; DDB
    dl $7E078F : db $02 : dw $0003 ; DoorOut Index
    dl $7E079B : db $02 : dw $B051 ; MDB
    dl $7E090F : db $02 : dw $E000 ; Screen subpixel X position.
    dl $7E0911 : db $02 : dw $0000 ; Screen X position in pixels
    dl $7E0913 : db $02 : dw $DA00 ; Screen subpixel Y position
    dl $7E0915 : db $02 : dw $0609 ; Screen Y position in pixels
    dl $7E0917 : db $02 : dw $0001 ; Layer 2 X scroll in room in pixels?
    dl $7E0919 : db $02 : dw $0486 ; Layer 2 Y scroll in room in pixels? (up = positive)
    dl $7E0921 : db $02 : dw $FF00 ; BG2 X scroll offset due to room transitions (Translates between Layer 2 scroll and BG2 scroll)
    dl $7E0923 : db $02 : dw $FD00 ; BG2 Y scroll offset due to room transitions (Translates between Layer 2 scroll and BG2 scroll)
    dl $7E09C2 : db $02 : dw $01F3 ; Health
    dl $7E09C6 : db $02 : dw $0016 ; Missiles
    dl $7E09CE : db $02 : dw $0001 ; Pbs
    dl $7E0AF6 : db $02 : dw $0027 ; Samus X
    dl $7E0AFA : db $02 : dw $068B ; Samus Y
    dl $7ED8A4 : db $02 : dw $0800 ; Events, Items, Doors
    dl $7ED91A : db $02 : dw $00B0 ; Events, Items, Doors
    dw #$FFFF
.after

preset_redesign_lower_norfair_ripper_ibj:
    dw #preset_redesign_lower_norfair_bull_room ; Lower Norfair: Bull Room
    dl $7E078D : db $02 : dw $B654 ; DDB
    dl $7E078F : db $02 : dw $0006 ; DoorOut Index
    dl $7E079B : db $02 : dw $B585 ; MDB
    dl $7E090F : db $02 : dw $B000 ; Screen subpixel X position.
    dl $7E0913 : db $02 : dw $0000 ; Screen subpixel Y position
    dl $7E0915 : db $02 : dw $0000 ; Screen Y position in pixels
    dl $7E0917 : db $02 : dw $0000 ; Layer 2 X scroll in room in pixels?
    dl $7E0919 : db $02 : dw $0000 ; Layer 2 Y scroll in room in pixels? (up = positive)
    dl $7E0921 : db $02 : dw $F600 ; BG2 X scroll offset due to room transitions (Translates between Layer 2 scroll and BG2 scroll)
    dl $7E0923 : db $02 : dw $0000 ; BG2 Y scroll offset due to room transitions (Translates between Layer 2 scroll and BG2 scroll)
    dl $7E09C2 : db $02 : dw $017B ; Health
    dl $7E09CA : db $02 : dw $0005 ; Supers
    dl $7E09CE : db $02 : dw $0002 ; Pbs
    dl $7E0AF6 : db $02 : dw $0032 ; Samus X
    dl $7E0AFA : db $02 : dw $008B ; Samus Y
    dl $7ED8BC : db $02 : dw $800C ; Events, Items, Doors
    dw #$FFFF
.after

preset_redesign_lower_norfair_preridley_farm:
    dw #preset_redesign_lower_norfair_ripper_ibj ; Lower Norfair: Ripper IBJ
    dl $7E078D : db $02 : dw $B7A0 ; DDB
    dl $7E079B : db $02 : dw $B656 ; MDB
    dl $7E090F : db $02 : dw $2000 ; Screen subpixel X position.
    dl $7E0915 : db $02 : dw $020B ; Screen Y position in pixels
    dl $7E0919 : db $02 : dw $0188 ; Layer 2 Y scroll in room in pixels? (up = positive)
    dl $7E0921 : db $02 : dw $FD00 ; BG2 X scroll offset due to room transitions (Translates between Layer 2 scroll and BG2 scroll)
    dl $7E0923 : db $02 : dw $00E0 ; BG2 Y scroll offset due to room transitions (Translates between Layer 2 scroll and BG2 scroll)
    dl $7E09C2 : db $02 : dw $013F ; Health
    dl $7E09C6 : db $02 : dw $0011 ; Missiles
    dl $7E09CA : db $02 : dw $0004 ; Supers
    dl $7E09CE : db $02 : dw $0001 ; Pbs
    dl $7E0AF6 : db $02 : dw $003F ; Samus X
    dl $7E0AFA : db $02 : dw $028B ; Samus Y
    dl $7ED8A6 : db $02 : dw $1010 ; Events, Items, Doors
    dl $7ED8BA : db $02 : dw $8185 ; Events, Items, Doors
    dl $7ED8BC : db $02 : dw $840C ; Events, Items, Doors
    dl $7ED8D8 : db $02 : dw $10E0 ; Events, Items, Doors
    dl $7ED91A : db $02 : dw $00B3 ; Events, Items, Doors
    dw #$FFFF
.after

preset_redesign_lower_norfair_ridley:
    dw #preset_redesign_lower_norfair_preridley_farm ; Lower Norfair: Preridley Farm
    dl $7E078D : db $02 : dw $B85C ; DDB
    dl $7E078F : db $02 : dw $0003 ; DoorOut Index
    dl $7E079B : db $02 : dw $B37A ; MDB
    dl $7E090F : db $02 : dw $1000 ; Screen subpixel X position.
    dl $7E0913 : db $02 : dw $DA00 ; Screen subpixel Y position
    dl $7E0915 : db $02 : dw $0000 ; Screen Y position in pixels
    dl $7E0919 : db $02 : dw $0000 ; Layer 2 Y scroll in room in pixels? (up = positive)
    dl $7E0923 : db $02 : dw $0000 ; BG2 Y scroll offset due to room transitions (Translates between Layer 2 scroll and BG2 scroll)
    dl $7E09C2 : db $02 : dw $01E2 ; Health
    dl $7E09CA : db $02 : dw $0001 ; Supers
    dl $7E09CE : db $02 : dw $0002 ; Pbs
    dl $7E0AF6 : db $02 : dw $002F ; Samus X
    dl $7E0AFA : db $02 : dw $009B ; Samus Y
    dl $7ED8BC : db $02 : dw $844C ; Events, Items, Doors
    dw #$FFFF
.after

preset_redesign_lower_norfair_ridley_etank:
    dw #preset_redesign_lower_norfair_ridley ; Lower Norfair: Ridley
    dl $7E078D : db $02 : dw $98CA ; DDB
    dl $7E078F : db $02 : dw $0000 ; DoorOut Index
    dl $7E079B : db $02 : dw $B32E ; MDB
    dl $7E07F3 : db $02 : dw $0024 ; Music Bank
    dl $7E07F5 : db $02 : dw $0003 ; Music Track
    dl $7E090F : db $02 : dw $4000 ; Screen subpixel X position.
    dl $7E0913 : db $02 : dw $0000 ; Screen subpixel Y position
    dl $7E0915 : db $02 : dw $0100 ; Screen Y position in pixels
    dl $7E0917 : db $02 : dw $0001 ; Layer 2 X scroll in room in pixels?
    dl $7E0919 : db $02 : dw $00C0 ; Layer 2 Y scroll in room in pixels? (up = positive)
    dl $7E0921 : db $02 : dw $FF00 ; BG2 X scroll offset due to room transitions (Translates between Layer 2 scroll and BG2 scroll)
    dl $7E0923 : db $02 : dw $FF00 ; BG2 Y scroll offset due to room transitions (Translates between Layer 2 scroll and BG2 scroll)
    dl $7E09C2 : db $02 : dw $005A ; Health
    dl $7E09C6 : db $02 : dw $000C ; Missiles
    dl $7E09CA : db $02 : dw $0005 ; Supers
    dl $7E0AF6 : db $02 : dw $004F ; Samus X
    dl $7E0AFA : db $02 : dw $019B ; Samus Y
    dl $7ED82A : db $02 : dw $0001 ; Events, Items, Doors
    dw #$FFFF
.after

preset_redesign_lower_norfair_exiting_ridley:
    dw #preset_redesign_lower_norfair_ridley_etank ; Lower Norfair: Ridley Etank
    dl $7E078D : db $02 : dw $9A62 ; DDB
    dl $7E090F : db $02 : dw $9000 ; Screen subpixel X position.
    dl $7E0913 : db $02 : dw $EC00 ; Screen subpixel Y position
    dl $7E0915 : db $02 : dw $00FA ; Screen Y position in pixels
    dl $7E0919 : db $02 : dw $00BB ; Layer 2 Y scroll in room in pixels? (up = positive)
    dl $7E0921 : db $02 : dw $0100 ; BG2 X scroll offset due to room transitions (Translates between Layer 2 scroll and BG2 scroll)
    dl $7E09C2 : db $02 : dw $0257 ; Health
    dl $7E09C4 : db $02 : dw $0257 ; Max health
    dl $7E0A1C : db $02 : dw $0001 ; Samus position/state
    dl $7E0A1E : db $02 : dw $0008 ; More position/state
    dl $7E0AF6 : db $02 : dw $00A5 ; Samus X
    dl $7ED87C : db $02 : dw $0202 ; Events, Items, Doors
    dl $7ED91A : db $02 : dw $00B4 ; Events, Items, Doors
    dw #$FFFF
.after

preset_redesign_lower_norfair_gold_torizo:
    dw #preset_redesign_lower_norfair_exiting_ridley ; Lower Norfair: Exiting Ridley
    dl $7E078D : db $02 : dw $98D6 ; DDB
    dl $7E078F : db $02 : dw $0001 ; DoorOut Index
    dl $7E079B : db $02 : dw $B656 ; MDB
    dl $7E07F3 : db $02 : dw $0018 ; Music Bank
    dl $7E07F5 : db $02 : dw $0005 ; Music Track
    dl $7E090F : db $02 : dw $4000 ; Screen subpixel X position.
    dl $7E0911 : db $02 : dw $0300 ; Screen X position in pixels
    dl $7E0913 : db $02 : dw $4A00 ; Screen subpixel Y position
    dl $7E0915 : db $02 : dw $0400 ; Screen Y position in pixels
    dl $7E0917 : db $02 : dw $0240 ; Layer 2 X scroll in room in pixels?
    dl $7E0919 : db $02 : dw $0300 ; Layer 2 Y scroll in room in pixels? (up = positive)
    dl $7E0923 : db $02 : dw $FE00 ; BG2 Y scroll offset due to room transitions (Translates between Layer 2 scroll and BG2 scroll)
    dl $7E0AF6 : db $02 : dw $039D ; Samus X
    dl $7E0AFA : db $02 : dw $048B ; Samus Y
    dl $7ED91A : db $02 : dw $00B5 ; Events, Items, Doors
    dw #$FFFF
.after

preset_redesign_lower_norfair_below_bull_room:
    dw #preset_redesign_lower_norfair_gold_torizo ; Lower Norfair: Gold Torizo
    dl $7E078D : db $02 : dw $B850 ; DDB
    dl $7E078F : db $02 : dw $0002 ; DoorOut Index
    dl $7E079B : db $02 : dw $B283 ; MDB
    dl $7E07F3 : db $02 : dw $0024 ; Music Bank
    dl $7E07F5 : db $02 : dw $0003 ; Music Track
    dl $7E090F : db $02 : dw $B000 ; Screen subpixel X position.
    dl $7E0911 : db $02 : dw $0200 ; Screen X position in pixels
    dl $7E0913 : db $02 : dw $A600 ; Screen subpixel Y position
    dl $7E0915 : db $02 : dw $0100 ; Screen Y position in pixels
    dl $7E0917 : db $02 : dw $0180 ; Layer 2 X scroll in room in pixels?
    dl $7E0919 : db $02 : dw $0100 ; Layer 2 Y scroll in room in pixels? (up = positive)
    dl $7E0923 : db $02 : dw $FF00 ; BG2 Y scroll offset due to room transitions (Translates between Layer 2 scroll and BG2 scroll)
    dl $7E09C2 : db $02 : dw $01F8 ; Health
    dl $7E09C6 : db $02 : dw $0018 ; Missiles
    dl $7E09CA : db $02 : dw $0006 ; Supers
    dl $7E0AF6 : db $02 : dw $02DC ; Samus X
    dl $7E0AFA : db $02 : dw $018B ; Samus Y
    dl $7ED82A : db $02 : dw $0005 ; Events, Items, Doors
    dl $7ED8A6 : db $02 : dw $1018 ; Events, Items, Doors
    dl $7ED91A : db $02 : dw $00B6 ; Events, Items, Doors
    dw #$FFFF
.after

preset_redesign_lower_norfair_viola_climb:
    dw #preset_redesign_lower_norfair_below_bull_room ; Lower Norfair: Below Bull Room
    dl $7E078D : db $02 : dw $B654 ; DDB
    dl $7E078F : db $02 : dw $0006 ; DoorOut Index
    dl $7E079B : db $02 : dw $B585 ; MDB
    dl $7E07F3 : db $02 : dw $0018 ; Music Bank
    dl $7E07F5 : db $02 : dw $0005 ; Music Track
    dl $7E090F : db $02 : dw $0000 ; Screen subpixel X position.
    dl $7E0911 : db $02 : dw $0900 ; Screen X position in pixels
    dl $7E0913 : db $02 : dw $0000 ; Screen subpixel Y position
    dl $7E0915 : db $02 : dw $001D ; Screen Y position in pixels
    dl $7E0917 : db $02 : dw $06C0 ; Layer 2 X scroll in room in pixels?
    dl $7E0919 : db $02 : dw $0015 ; Layer 2 Y scroll in room in pixels? (up = positive)
    dl $7E0921 : db $02 : dw $F600 ; BG2 X scroll offset due to room transitions (Translates between Layer 2 scroll and BG2 scroll)
    dl $7E0923 : db $02 : dw $0000 ; BG2 Y scroll offset due to room transitions (Translates between Layer 2 scroll and BG2 scroll)
    dl $7E09C2 : db $02 : dw $01A8 ; Health
    dl $7E0AF6 : db $02 : dw $09B7 ; Samus X
    dl $7E0AFA : db $02 : dw $00AB ; Samus Y
    dw #$FFFF
.after

preset_redesign_lower_norfair_acid_death_pit:
    dw #preset_redesign_lower_norfair_viola_climb ; Lower Norfair: Viola Climb
    dl $7E078D : db $02 : dw $99EA ; DDB
    dl $7E078F : db $02 : dw $0000 ; DoorOut Index
    dl $7E079B : db $02 : dw $B051 ; MDB
    dl $7E090F : db $02 : dw $C000 ; Screen subpixel X position.
    dl $7E0911 : db $02 : dw $0000 ; Screen X position in pixels
    dl $7E0913 : db $02 : dw $1BFF ; Screen subpixel Y position
    dl $7E0915 : db $02 : dw $0105 ; Screen Y position in pixels
    dl $7E0917 : db $02 : dw $0001 ; Layer 2 X scroll in room in pixels?
    dl $7E0919 : db $02 : dw $00C3 ; Layer 2 Y scroll in room in pixels? (up = positive)
    dl $7E0921 : db $02 : dw $0100 ; BG2 X scroll offset due to room transitions (Translates between Layer 2 scroll and BG2 scroll)
    dl $7E0923 : db $02 : dw $FA00 ; BG2 Y scroll offset due to room transitions (Translates between Layer 2 scroll and BG2 scroll)
    dl $7E09C2 : db $02 : dw $01B5 ; Health
    dl $7E0AF6 : db $02 : dw $00D7 ; Samus X
    dl $7E0AFA : db $02 : dw $018B ; Samus Y
    dw #$FFFF
.after

preset_redesign_lower_norfair_ripper_dessgeegas:
    dw #preset_redesign_lower_norfair_acid_death_pit ; Lower Norfair: Acid Death Pit
    dl $7E078D : db $02 : dw $B600 ; DDB
    dl $7E078F : db $02 : dw $0002 ; DoorOut Index
    dl $7E079B : db $02 : dw $B3A5 ; MDB
    dl $7E090F : db $02 : dw $7000 ; Screen subpixel X position.
    dl $7E0911 : db $02 : dw $0200 ; Screen X position in pixels
    dl $7E0913 : db $02 : dw $0000 ; Screen subpixel Y position
    dl $7E0915 : db $02 : dw $011B ; Screen Y position in pixels
    dl $7E0917 : db $02 : dw $0200 ; Layer 2 X scroll in room in pixels?
    dl $7E0919 : db $02 : dw $00D4 ; Layer 2 Y scroll in room in pixels? (up = positive)
    dl $7E0921 : db $02 : dw $0000 ; BG2 X scroll offset due to room transitions (Translates between Layer 2 scroll and BG2 scroll)
    dl $7E0923 : db $02 : dw $FB00 ; BG2 Y scroll offset due to room transitions (Translates between Layer 2 scroll and BG2 scroll)
    dl $7E09C2 : db $02 : dw $0257 ; Health
    dl $7E09C6 : db $02 : dw $0019 ; Missiles
    dl $7E09CA : db $02 : dw $0005 ; Supers
    dl $7E0AF6 : db $02 : dw $02B3 ; Samus X
    dl $7ED8D8 : db $02 : dw $10F0 ; Events, Items, Doors
    dl $7ED91A : db $02 : dw $00B7 ; Events, Items, Doors
    dw #$FFFF
.after

preset_redesign_lower_norfair_after_super_blockade:
    dw #preset_redesign_lower_norfair_ripper_dessgeegas ; Lower Norfair: Ripper Dessgeegas
    dl $7E078D : db $02 : dw $B47C ; DDB
    dl $7E078F : db $02 : dw $0004 ; DoorOut Index
    dl $7E079B : db $02 : dw $AB64 ; MDB
    dl $7E090F : db $02 : dw $E000 ; Screen subpixel X position.
    dl $7E0911 : db $02 : dw $0000 ; Screen X position in pixels
    dl $7E0913 : db $02 : dw $D200 ; Screen subpixel Y position
    dl $7E0915 : db $02 : dw $0202 ; Screen Y position in pixels
    dl $7E0917 : db $02 : dw $0000 ; Layer 2 X scroll in room in pixels?
    dl $7E0919 : db $02 : dw $0181 ; Layer 2 Y scroll in room in pixels? (up = positive)
    dl $7E0921 : db $02 : dw $0100 ; BG2 X scroll offset due to room transitions (Translates between Layer 2 scroll and BG2 scroll)
    dl $7E0923 : db $02 : dw $FD00 ; BG2 Y scroll offset due to room transitions (Translates between Layer 2 scroll and BG2 scroll)
    dl $7E09C2 : db $02 : dw $023E ; Health
    dl $7E0AF6 : db $02 : dw $00BF ; Samus X
    dl $7E0AFA : db $02 : dw $028B ; Samus Y
    dl $7ED8A4 : db $02 : dw $0801 ; Events, Items, Doors
    dl $7ED91A : db $02 : dw $00B9 ; Events, Items, Doors
    dw #$FFFF
.after

preset_redesign_lower_norfair_lava_guardian:
    dw #preset_redesign_lower_norfair_after_super_blockade ; Lower Norfair: After Super Blockade
    dl $7E078D : db $02 : dw $B464 ; DDB
    dl $7E078F : db $02 : dw $0002 ; DoorOut Index
    dl $7E079B : db $02 : dw $B1E5 ; MDB
    dl $7E090F : db $02 : dw $5600 ; Screen subpixel X position.
    dl $7E0913 : db $02 : dw $0000 ; Screen subpixel Y position
    dl $7E0915 : db $02 : dw $0200 ; Screen Y position in pixels
    dl $7E0919 : db $02 : dw $0180 ; Layer 2 Y scroll in room in pixels? (up = positive)
    dl $7E0921 : db $02 : dw $FE00 ; BG2 X scroll offset due to room transitions (Translates between Layer 2 scroll and BG2 scroll)
    dl $7E0923 : db $02 : dw $FC00 ; BG2 Y scroll offset due to room transitions (Translates between Layer 2 scroll and BG2 scroll)
    dl $7E09CA : db $02 : dw $0006 ; Supers
    dl $7E09CE : db $02 : dw $0001 ; Pbs
    dl $7E0A1C : db $02 : dw $0002 ; Samus position/state
    dl $7E0A1E : db $02 : dw $0004 ; More position/state
    dl $7E0AF6 : db $02 : dw $0036 ; Samus X
    dl $7E0AFA : db $02 : dw $028F ; Samus Y
    dl $7ED8A6 : db $02 : dw $101C ; Events, Items, Doors
    dw #$FFFF
.after

preset_redesign_lower_norfair_ln_final_enemies:
    dw #preset_redesign_lower_norfair_lava_guardian ; Lower Norfair: Lava Guardian
    dl $7E078D : db $02 : dw $B380 ; DDB
    dl $7E079B : db $02 : dw $B106 ; MDB
    dl $7E090F : db $02 : dw $8000 ; Screen subpixel X position.
    dl $7E0913 : db $02 : dw $2400 ; Screen subpixel Y position
    dl $7E0915 : db $02 : dw $000B ; Screen Y position in pixels
    dl $7E0919 : db $02 : dw $000B ; Layer 2 Y scroll in room in pixels? (up = positive)
    dl $7E0921 : db $02 : dw $FF00 ; BG2 X scroll offset due to room transitions (Translates between Layer 2 scroll and BG2 scroll)
    dl $7E0923 : db $02 : dw $0000 ; BG2 Y scroll offset due to room transitions (Translates between Layer 2 scroll and BG2 scroll)
    dl $7E09C2 : db $02 : dw $00AF ; Health
    dl $7E09CE : db $02 : dw $0000 ; Pbs
    dl $7E0AF6 : db $02 : dw $0043 ; Samus X
    dl $7E0AFA : db $02 : dw $009B ; Samus Y
    dl $7ED826 : db $02 : dw $0180 ; Events, Items, Doors
    dl $7ED8A6 : db $02 : dw $101F ; Events, Items, Doors
    dw #$FFFF
.after

preset_redesign_lower_norfair_rumble_maze:
    dw #preset_redesign_lower_norfair_ln_final_enemies ; Lower Norfair: LN Final Enemies
    dl $7E078D : db $02 : dw $B3D4 ; DDB
    dl $7E078F : db $02 : dw $0001 ; DoorOut Index
    dl $7E079B : db $02 : dw $B510 ; MDB
    dl $7E090F : db $02 : dw $5000 ; Screen subpixel X position.
    dl $7E0913 : db $02 : dw $0000 ; Screen subpixel Y position
    dl $7E0915 : db $02 : dw $0021 ; Screen Y position in pixels
    dl $7E0919 : db $02 : dw $0018 ; Layer 2 Y scroll in room in pixels? (up = positive)
    dl $7E0921 : db $02 : dw $FC00 ; BG2 X scroll offset due to room transitions (Translates between Layer 2 scroll and BG2 scroll)
    dl $7E09C2 : db $02 : dw $00E6 ; Health
    dl $7E09CA : db $02 : dw $0005 ; Supers
    dl $7E0AF6 : db $02 : dw $0031 ; Samus X
    dl $7ED8B8 : db $02 : dw $8121 ; Events, Items, Doors
    dl $7ED8BC : db $02 : dw $8C4C ; Events, Items, Doors
    dl $7ED91A : db $02 : dw $00BA ; Events, Items, Doors
    dw #$FFFF
.after

preset_redesign_lost_caverns_norfair_elevator_left:
    dw #preset_redesign_lower_norfair_rumble_maze ; Lower Norfair: Rumble Maze
    dl $7E078D : db $02 : dw $9996 ; DDB
    dl $7E078F : db $02 : dw $0000 ; DoorOut Index
    dl $7E079B : db $02 : dw $BFCF ; MDB
    dl $7E07F3 : db $02 : dw $0015 ; Music Bank
    dl $7E0913 : db $02 : dw $8DFF ; Screen subpixel Y position
    dl $7E0915 : db $02 : dw $0100 ; Screen Y position in pixels
    dl $7E0919 : db $02 : dw $0100 ; Layer 2 Y scroll in room in pixels? (up = positive)
    dl $7E0921 : db $02 : dw $0000 ; BG2 X scroll offset due to room transitions (Translates between Layer 2 scroll and BG2 scroll)
    dl $7E0923 : db $02 : dw $FE00 ; BG2 Y scroll offset due to room transitions (Translates between Layer 2 scroll and BG2 scroll)
    dl $7E09C2 : db $02 : dw $00BB ; Health
    dl $7E0AF6 : db $02 : dw $002C ; Samus X
    dl $7E0AFA : db $02 : dw $018B ; Samus Y
    dl $7ED91A : db $02 : dw $00BC ; Events, Items, Doors
    dw #$FFFF
.after

preset_redesign_lost_caverns_water_hoppers:
    dw #preset_redesign_lost_caverns_norfair_elevator_left ; Lost Caverns: Norfair Elevator Left
    dl $7E078D : db $02 : dw $923A ; DDB
    dl $7E078F : db $02 : dw $0001 ; DoorOut Index
    dl $7E079B : db $02 : dw $A471 ; MDB
    dl $7E079F : db $02 : dw $0001 ; Region
    dl $7E07C3 : db $02 : dw $A5AA ; GFX Pointers
    dl $7E07C5 : db $02 : dw $5FBC ; GFX Pointers
    dl $7E07C7 : db $02 : dw $C2B3 ; GFX Pointers
    dl $7E07F3 : db $02 : dw $0012 ; Music Bank
    dl $7E090F : db $02 : dw $D000 ; Screen subpixel X position.
    dl $7E0911 : db $02 : dw $0110 ; Screen X position in pixels
    dl $7E0913 : db $02 : dw $0000 ; Screen subpixel Y position
    dl $7E0915 : db $02 : dw $001B ; Screen Y position in pixels
    dl $7E0917 : db $02 : dw $00CC ; Layer 2 X scroll in room in pixels?
    dl $7E0919 : db $02 : dw $001B ; Layer 2 Y scroll in room in pixels? (up = positive)
    dl $7E0921 : db $02 : dw $0100 ; BG2 X scroll offset due to room transitions (Translates between Layer 2 scroll and BG2 scroll)
    dl $7E0923 : db $02 : dw $FF00 ; BG2 Y scroll offset due to room transitions (Translates between Layer 2 scroll and BG2 scroll)
    dl $7E09CA : db $02 : dw $0006 ; Supers
    dl $7E0AF6 : db $02 : dw $0178 ; Samus X
    dl $7E0AFA : db $02 : dw $008B ; Samus Y
    dl $7ED91A : db $02 : dw $00C0 ; Events, Items, Doors
    dw #$FFFF
.after

preset_redesign_lost_caverns_big_pink:
    dw #preset_redesign_lost_caverns_water_hoppers ; Lost Caverns: Water Hoppers
    dl $7E078D : db $02 : dw $C4E8 ; DDB
    dl $7E078F : db $02 : dw $0003 ; DoorOut Index
    dl $7E079B : db $02 : dw $A07B ; MDB
    dl $7E07C3 : db $02 : dw $B130 ; GFX Pointers
    dl $7E07C5 : db $02 : dw $3CBE ; GFX Pointers
    dl $7E07C7 : db $02 : dw $C2B8 ; GFX Pointers
    dl $7E07F3 : db $02 : dw $000F ; Music Bank
    dl $7E090F : db $02 : dw $A000 ; Screen subpixel X position.
    dl $7E0911 : db $02 : dw $0200 ; Screen X position in pixels
    dl $7E0913 : db $02 : dw $1400 ; Screen subpixel Y position
    dl $7E0915 : db $02 : dw $0000 ; Screen Y position in pixels
    dl $7E0917 : db $02 : dw $0180 ; Layer 2 X scroll in room in pixels?
    dl $7E0919 : db $02 : dw $0000 ; Layer 2 Y scroll in room in pixels? (up = positive)
    dl $7E0921 : db $02 : dw $FF00 ; BG2 X scroll offset due to room transitions (Translates between Layer 2 scroll and BG2 scroll)
    dl $7E0923 : db $02 : dw $0000 ; BG2 Y scroll offset due to room transitions (Translates between Layer 2 scroll and BG2 scroll)
    dl $7E09C2 : db $02 : dw $007B ; Health
    dl $7E0AF6 : db $02 : dw $02C3 ; Samus X
    dl $7ED91A : db $02 : dw $00C6 ; Events, Items, Doors
    dw #$FFFF
.after

preset_redesign_lost_caverns_brin_elevator_right_3:
    dw #preset_redesign_lost_caverns_big_pink ; Lost Caverns: Big Pink
    dl $7E078D : db $02 : dw $A2DC ; DDB
    dl $7E078F : db $02 : dw $0001 ; DoorOut Index
    dl $7E079B : db $02 : dw $9FE5 ; MDB
    dl $7E07C3 : db $02 : dw $E6B0 ; GFX Pointers
    dl $7E07C5 : db $02 : dw $64BB ; GFX Pointers
    dl $7E07C7 : db $02 : dw $C2B2 ; GFX Pointers
    dl $7E090F : db $02 : dw $0F00 ; Screen subpixel X position.
    dl $7E0911 : db $02 : dw $0100 ; Screen X position in pixels
    dl $7E0913 : db $02 : dw $D600 ; Screen subpixel Y position
    dl $7E0917 : db $02 : dw $00C0 ; Layer 2 X scroll in room in pixels?
    dl $7E0921 : db $02 : dw $0100 ; BG2 X scroll offset due to room transitions (Translates between Layer 2 scroll and BG2 scroll)
    dl $7E09C2 : db $02 : dw $00D7 ; Health
    dl $7E09CE : db $02 : dw $0002 ; Pbs
    dl $7E0A1C : db $02 : dw $0001 ; Samus position/state
    dl $7E0A1E : db $02 : dw $0008 ; More position/state
    dl $7E0AF6 : db $02 : dw $0196 ; Samus X
    dl $7E0AFA : db $02 : dw $0090 ; Samus Y
    dl $7ED91A : db $02 : dw $00C8 ; Events, Items, Doors
    dw #$FFFF
.after

preset_redesign_lost_caverns_kago_climb_2:
    dw #preset_redesign_lost_caverns_brin_elevator_right_3 ; Lost Caverns: Brin Elevator Right
    dl $7E078D : db $02 : dw $8CA6 ; DDB
    dl $7E078F : db $02 : dw $0002 ; DoorOut Index
    dl $7E079B : db $02 : dw $9938 ; MDB
    dl $7E079F : db $02 : dw $0000 ; Region
    dl $7E07C3 : db $02 : dw $C629 ; GFX Pointers
    dl $7E07C5 : db $02 : dw $7CBA ; GFX Pointers
    dl $7E07C7 : db $02 : dw $C2AD ; GFX Pointers
    dl $7E07F3 : db $02 : dw $0009 ; Music Bank
    dl $7E07F5 : db $02 : dw $0003 ; Music Track
    dl $7E090F : db $02 : dw $4000 ; Screen subpixel X position.
    dl $7E0911 : db $02 : dw $0000 ; Screen X position in pixels
    dl $7E0913 : db $02 : dw $0000 ; Screen subpixel Y position
    dl $7E0915 : db $02 : dw $001B ; Screen Y position in pixels
    dl $7E0917 : db $02 : dw $0000 ; Layer 2 X scroll in room in pixels?
    dl $7E0919 : db $02 : dw $0014 ; Layer 2 Y scroll in room in pixels? (up = positive)
    dl $7E0921 : db $02 : dw $0000 ; BG2 X scroll offset due to room transitions (Translates between Layer 2 scroll and BG2 scroll)
    dl $7E0923 : db $02 : dw $FE00 ; BG2 Y scroll offset due to room transitions (Translates between Layer 2 scroll and BG2 scroll)
    dl $7E09C2 : db $02 : dw $00EB ; Health
    dl $7E09CA : db $02 : dw $0007 ; Supers
    dl $7E09CC : db $02 : dw $0007 ; Max supers
    dl $7E0AF6 : db $02 : dw $0093 ; Samus X
    dl $7E0AFA : db $02 : dw $008B ; Samus Y
    dl $7ED872 : db $02 : dw $2004 ; Events, Items, Doors
    dl $7ED91A : db $02 : dw $00CE ; Events, Items, Doors
    dw #$FFFF
.after

preset_redesign_lost_caverns_spazer_room:
    dw #preset_redesign_lost_caverns_kago_climb_2 ; Lost Caverns: Kago Climb
    dl $7E078D : db $02 : dw $8C22 ; DDB
    dl $7E078F : db $02 : dw $0001 ; DoorOut Index
    dl $7E079B : db $02 : dw $99BD ; MDB
    dl $7E07F5 : db $02 : dw $0005 ; Music Track
    dl $7E090F : db $02 : dw $B000 ; Screen subpixel X position.
    dl $7E0911 : db $02 : dw $0100 ; Screen X position in pixels
    dl $7E0913 : db $02 : dw $2E00 ; Screen subpixel Y position
    dl $7E0915 : db $02 : dw $0409 ; Screen Y position in pixels
    dl $7E0917 : db $02 : dw $00C0 ; Layer 2 X scroll in room in pixels?
    dl $7E0919 : db $02 : dw $0306 ; Layer 2 Y scroll in room in pixels? (up = positive)
    dl $7E0921 : db $02 : dw $FE00 ; BG2 X scroll offset due to room transitions (Translates between Layer 2 scroll and BG2 scroll)
    dl $7E0923 : db $02 : dw $FA00 ; BG2 Y scroll offset due to room transitions (Translates between Layer 2 scroll and BG2 scroll)
    dl $7E09C2 : db $02 : dw $00E9 ; Health
    dl $7E09CA : db $02 : dw $0006 ; Supers
    dl $7E0AF6 : db $02 : dw $01D8 ; Samus X
    dl $7E0AFA : db $02 : dw $048B ; Samus Y
    dl $7ED8B2 : db $02 : dw $F981 ; Events, Items, Doors
    dl $7ED91A : db $02 : dw $00D1 ; Events, Items, Doors
    dw #$FFFF
.after

preset_redesign_lost_caverns_spazer_spark:
    dw #preset_redesign_lost_caverns_spazer_room ; Lost Caverns: Spazer Room
    dl $7E078D : db $02 : dw $8C8E ; DDB
    dl $7E079B : db $02 : dw $96BA ; MDB
    dl $7E090F : db $02 : dw $C000 ; Screen subpixel X position.
    dl $7E0911 : db $02 : dw $0449 ; Screen X position in pixels
    dl $7E0913 : db $02 : dw $AA00 ; Screen subpixel Y position
    dl $7E0915 : db $02 : dw $011F ; Screen Y position in pixels
    dl $7E0917 : db $02 : dw $0336 ; Layer 2 X scroll in room in pixels?
    dl $7E0919 : db $02 : dw $00D7 ; Layer 2 Y scroll in room in pixels? (up = positive)
    dl $7E0921 : db $02 : dw $0100 ; BG2 X scroll offset due to room transitions (Translates between Layer 2 scroll and BG2 scroll)
    dl $7E0923 : db $02 : dw $FD00 ; BG2 Y scroll offset due to room transitions (Translates between Layer 2 scroll and BG2 scroll)
    dl $7E09C2 : db $02 : dw $0123 ; Health
    dl $7E09CA : db $02 : dw $0005 ; Supers
    dl $7E0A1C : db $02 : dw $0002 ; Samus position/state
    dl $7E0A1E : db $02 : dw $0004 ; More position/state
    dl $7E0AF6 : db $02 : dw $04AA ; Samus X
    dl $7E0AFA : db $02 : dw $01BB ; Samus Y
;    dl $7ED8B0 : db $02 : dw $000A ; Events, Items, Doors
    dl $7ED91A : db $02 : dw $00D5 ; Events, Items, Doors
    dw #$FFFF
.after

preset_redesign_lost_caverns_guardian_chain_spark:
    dw #preset_redesign_lost_caverns_spazer_spark ; Lost Caverns: Spazer Spark
    dl $7E078D : db $02 : dw $8B6E ; DDB
    dl $7E078F : db $02 : dw $0004 ; DoorOut Index
    dl $7E079B : db $02 : dw $9A44 ; MDB
    dl $7E090F : db $02 : dw $5000 ; Screen subpixel X position.
    dl $7E0911 : db $02 : dw $03E3 ; Screen X position in pixels
    dl $7E0913 : db $02 : dw $A600 ; Screen subpixel Y position
    dl $7E0915 : db $02 : dw $011B ; Screen Y position in pixels
    dl $7E0917 : db $02 : dw $02EA ; Layer 2 X scroll in room in pixels?
    dl $7E0919 : db $02 : dw $00D4 ; Layer 2 Y scroll in room in pixels? (up = positive)
    dl $7E0921 : db $02 : dw $FB00 ; BG2 X scroll offset due to room transitions (Translates between Layer 2 scroll and BG2 scroll)
    dl $7E0923 : db $02 : dw $FF00 ; BG2 Y scroll offset due to room transitions (Translates between Layer 2 scroll and BG2 scroll)
    dl $7E09A6 : db $02 : dw $1004 ; Beams
    dl $7E09A8 : db $02 : dw $1007 ; Beams
    dl $7E09C2 : db $02 : dw $00EA ; Health
    dl $7E0A1C : db $02 : dw $0001 ; Samus position/state
    dl $7E0A1E : db $02 : dw $0008 ; More position/state
    dl $7E0AF6 : db $02 : dw $0456 ; Samus X
    dl $7E0AFA : db $02 : dw $018B ; Samus Y
    dl $7ED872 : db $02 : dw $2204 ; Events, Items, Doors
    dl $7ED91A : db $02 : dw $00D8 ; Events, Items, Doors
    dw #$FFFF
.after

preset_redesign_lost_caverns_landing_site_3:
    dw #preset_redesign_lost_caverns_guardian_chain_spark ; Lost Caverns: Guardian Chain Spark
    dl $7E078D : db $02 : dw $8B56 ; DDB
    dl $7E078F : db $02 : dw $0002 ; DoorOut Index
    dl $7E079B : db $02 : dw $92FD ; MDB
    dl $7E090F : db $02 : dw $8000 ; Screen subpixel X position.
    dl $7E0911 : db $02 : dw $0000 ; Screen X position in pixels
    dl $7E0913 : db $02 : dw $0000 ; Screen subpixel Y position
    dl $7E0915 : db $02 : dw $042B ; Screen Y position in pixels
    dl $7E0917 : db $02 : dw $0000 ; Layer 2 X scroll in room in pixels?
    dl $7E0919 : db $02 : dw $0320 ; Layer 2 Y scroll in room in pixels? (up = positive)
    dl $7E0921 : db $02 : dw $0100 ; BG2 X scroll offset due to room transitions (Translates between Layer 2 scroll and BG2 scroll)
    dl $7E0923 : db $02 : dw $F900 ; BG2 Y scroll offset due to room transitions (Translates between Layer 2 scroll and BG2 scroll)
    dl $7E09C2 : db $02 : dw $00C3 ; Health
    dl $7E09D0 : db $02 : dw $0003 ; Max pbs
    dl $7E0A1C : db $02 : dw $0002 ; Samus position/state
    dl $7E0A1E : db $02 : dw $0004 ; More position/state
    dl $7E0A68 : db $02 : dw $0001 ; Flash suit
    dl $7E0AF6 : db $02 : dw $0059 ; Samus X
    dl $7E0AFA : db $02 : dw $049B ; Samus Y
    dl $7ED826 : db $02 : dw $0181 ; Events, Items, Doors
    dl $7ED870 : db $02 : dw $0028 ; Events, Items, Doors
    dl $7ED8A0 : db $02 : dw $0904 ; Events, Items, Doors
    dl $7ED91A : db $02 : dw $00DE ; Events, Items, Doors
    dw #$FFFF
.after

preset_redesign_lost_caverns_etank_room:
    dw #preset_redesign_lost_caverns_landing_site_3 ; Lost Caverns: Landing Site
    dl $7E078D : db $02 : dw $895E ; DDB
    dl $7E078F : db $02 : dw $0000 ; DoorOut Index
    dl $7E079B : db $02 : dw $91F8 ; MDB
    dl $7E07F3 : db $02 : dw $000C ; Music Bank
    dl $7E090F : db $02 : dw $A000 ; Screen subpixel X position.
    dl $7E0911 : db $02 : dw $0500 ; Screen X position in pixels
    dl $7E0913 : db $02 : dw $1800 ; Screen subpixel Y position
    dl $7E0915 : db $02 : dw $02F6 ; Screen Y position in pixels
    dl $7E0917 : db $02 : dw $03C0 ; Layer 2 X scroll in room in pixels?
    dl $7E0919 : db $02 : dw $0238 ; Layer 2 Y scroll in room in pixels? (up = positive)
    dl $7E0921 : db $02 : dw $FA00 ; BG2 X scroll offset due to room transitions (Translates between Layer 2 scroll and BG2 scroll)
    dl $7E09C2 : db $02 : dw $0257 ; Health
    dl $7E09CA : db $02 : dw $0007 ; Supers
    dl $7E09CE : db $02 : dw $0003 ; Pbs
    dl $7E0A1C : db $02 : dw $0001 ; Samus position/state
    dl $7E0A1E : db $02 : dw $0008 ; More position/state
    dl $7E0A68 : db $02 : dw $0000 ; Flash suit
    dl $7E0AF6 : db $02 : dw $05C1 ; Samus X
    dl $7E0AFA : db $02 : dw $038B ; Samus Y
    dl $7ED91A : db $02 : dw $00DF ; Events, Items, Doors
    dw #$FFFF
.after

preset_redesign_lost_caverns_sky_guardian:
    dw #preset_redesign_lost_caverns_etank_room ; Lost Caverns: Etank Room
    dl $7E078D : db $02 : dw $896A ; DDB
    dl $7E078F : db $02 : dw $0001 ; DoorOut Index
    dl $7E079B : db $02 : dw $F838 ; MDB
    dl $7E090F : db $02 : dw $0000 ; Screen subpixel X position.
    dl $7E0911 : db $02 : dw $08B1 ; Screen X position in pixels
    dl $7E0913 : db $02 : dw $0000 ; Screen subpixel Y position
    dl $7E0915 : db $02 : dw $01F1 ; Screen Y position in pixels
    dl $7E0917 : db $02 : dw $0458 ; Layer 2 X scroll in room in pixels?
    dl $7E0919 : db $02 : dw $01F1 ; Layer 2 Y scroll in room in pixels? (up = positive)
    dl $7E0921 : db $02 : dw $0100 ; BG2 X scroll offset due to room transitions (Translates between Layer 2 scroll and BG2 scroll)
    dl $7E0923 : db $02 : dw $FD00 ; BG2 Y scroll offset due to room transitions (Translates between Layer 2 scroll and BG2 scroll)
    dl $7E0AF6 : db $02 : dw $0911 ; Samus X
    dl $7E0AFA : db $02 : dw $027B ; Samus Y
    dl $7ED91A : db $02 : dw $00E6 ; Events, Items, Doors
    dw #$FFFF
.after

preset_redesign_lost_caverns_gate_clip:
    dw #preset_redesign_lost_caverns_sky_guardian ; Lost Caverns: Sky Guardian
    dl $7E078D : db $02 : dw $8B9E ; DDB
    dl $7E079B : db $02 : dw $F8BB ; MDB
    dl $7E090F : db $02 : dw $BE00 ; Screen subpixel X position.
    dl $7E0911 : db $02 : dw $0900 ; Screen X position in pixels
    dl $7E0913 : db $02 : dw $5000 ; Screen subpixel Y position
    dl $7E0915 : db $02 : dw $0400 ; Screen Y position in pixels
    dl $7E0917 : db $02 : dw $0480 ; Layer 2 X scroll in room in pixels?
    dl $7E0919 : db $02 : dw $0400 ; Layer 2 Y scroll in room in pixels? (up = positive)
    dl $7E0923 : db $02 : dw $FE00 ; BG2 Y scroll offset due to room transitions (Translates between Layer 2 scroll and BG2 scroll)
    dl $7E09C2 : db $02 : dw $0216 ; Health
    dl $7E0AF6 : db $02 : dw $09DF ; Samus X
    dl $7E0AFA : db $02 : dw $048B ; Samus Y
    dl $7E0B3F : db $02 : dw $0003 ; Blue suit
    dl $7ED826 : db $02 : dw $0183 ; Events, Items, Doors
    dl $7ED91A : db $02 : dw $00E7 ; Events, Items, Doors
    dw #$FFFF
.after

preset_redesign_lost_caverns_crab_fall:
    dw #preset_redesign_lost_caverns_gate_clip ; Lost Caverns: Gate Clip
    dl $7E078D : db $02 : dw $BF3C ; DDB
    dl $7E078F : db $02 : dw $0000 ; DoorOut Index
    dl $7E079B : db $02 : dw $CB8B ; MDB
    dl $7E07F3 : db $02 : dw $0009 ; Music Bank
    dl $7E090F : db $02 : dw $0000 ; Screen subpixel X position.
    dl $7E0911 : db $02 : dw $0000 ; Screen X position in pixels
    dl $7E0913 : db $02 : dw $5200 ; Screen subpixel Y position
    dl $7E0915 : db $02 : dw $081F ; Screen Y position in pixels
    dl $7E0917 : db $02 : dw $0001 ; Layer 2 X scroll in room in pixels?
    dl $7E0919 : db $02 : dw $0617 ; Layer 2 Y scroll in room in pixels? (up = positive)
    dl $7E0923 : db $02 : dw $FD00 ; BG2 Y scroll offset due to room transitions (Translates between Layer 2 scroll and BG2 scroll)
    dl $7E09C2 : db $02 : dw $0226 ; Health
    dl $7E09CA : db $02 : dw $0006 ; Supers
    dl $7E0A1C : db $02 : dw $0002 ; Samus position/state
    dl $7E0A1E : db $02 : dw $0004 ; More position/state
    dl $7E0AF6 : db $02 : dw $0087 ; Samus X
    dl $7E0AFA : db $02 : dw $08DA ; Samus Y
    dl $7E0B3F : db $02 : dw $0000 ; Blue suit
    dl $7ED91A : db $02 : dw $00E8 ; Events, Items, Doors
    dw #$FFFF
.after

preset_redesign_lost_caverns_boulder_bowling:
    dw #preset_redesign_lost_caverns_crab_fall ; Lost Caverns: Crab Fall
    dl $7E078D : db $02 : dw $BF90 ; DDB
    dl $7E078F : db $02 : dw $0004 ; DoorOut Index
    dl $7E079B : db $02 : dw $948C ; MDB
    dl $7E090F : db $02 : dw $D000 ; Screen subpixel X position.
    dl $7E0913 : db $02 : dw $7C00 ; Screen subpixel Y position
    dl $7E0915 : db $02 : dw $051F ; Screen Y position in pixels
    dl $7E0917 : db $02 : dw $0000 ; Layer 2 X scroll in room in pixels?
    dl $7E0919 : db $02 : dw $03D7 ; Layer 2 Y scroll in room in pixels? (up = positive)
    dl $7E0921 : db $02 : dw $0000 ; BG2 X scroll offset due to room transitions (Translates between Layer 2 scroll and BG2 scroll)
    dl $7E0923 : db $02 : dw $FFE0 ; BG2 Y scroll offset due to room transitions (Translates between Layer 2 scroll and BG2 scroll)
    dl $7E09C2 : db $02 : dw $0208 ; Health
    dl $7E09C6 : db $02 : dw $0014 ; Missiles
    dl $7E09CA : db $02 : dw $0002 ; Supers
    dl $7E0A1C : db $02 : dw $0027 ; Samus position/state
    dl $7E0A1E : db $02 : dw $0508 ; More position/state
    dl $7E0AF6 : db $02 : dw $0055 ; Samus X
    dl $7E0AFA : db $02 : dw $05C0 ; Samus Y
    dl $7ED8B2 : db $02 : dw $F989 ; Events, Items, Doors
    dw #$FFFF
.after

preset_redesign_lost_caverns_phantoon_save_room:
    dw #preset_redesign_lost_caverns_boulder_bowling ; Lost Caverns: Boulder Bowling
    dl $7E078D : db $02 : dw $C374 ; DDB
    dl $7E078F : db $02 : dw $0000 ; DoorOut Index
    dl $7E079B : db $02 : dw $94FD ; MDB
    dl $7E07F3 : db $02 : dw $0012 ; Music Bank
    dl $7E07F5 : db $02 : dw $0004 ; Music Track
    dl $7E090F : db $02 : dw $7800 ; Screen subpixel X position.
    dl $7E0911 : db $02 : dw $0400 ; Screen X position in pixels
    dl $7E0913 : db $02 : dw $0000 ; Screen subpixel Y position
    dl $7E0915 : db $02 : dw $0200 ; Screen Y position in pixels
    dl $7E0917 : db $02 : dw $0300 ; Layer 2 X scroll in room in pixels?
    dl $7E0919 : db $02 : dw $0180 ; Layer 2 Y scroll in room in pixels? (up = positive)
    dl $7E0921 : db $02 : dw $FB00 ; BG2 X scroll offset due to room transitions (Translates between Layer 2 scroll and BG2 scroll)
    dl $7E0923 : db $02 : dw $FE00 ; BG2 Y scroll offset due to room transitions (Translates between Layer 2 scroll and BG2 scroll)
    dl $7E09C2 : db $02 : dw $01B7 ; Health
    dl $7E09C6 : db $02 : dw $0014 ; Missiles
    dl $7E09CA : db $02 : dw $0001 ; Supers
    dl $7E0A1C : db $02 : dw $0001 ; Samus position/state
    dl $7E0A1E : db $02 : dw $0008 ; More position/state
    dl $7E0AF6 : db $02 : dw $04B9 ; Samus X
    dl $7E0AFA : db $02 : dw $028B ; Samus Y
    dl $7E0B3F : db $02 : dw $0003 ; Blue suit
    dl $7ED8B0 : db $02 : dw $882A ; Events, Items, Doors
    dl $7ED91A : db $02 : dw $00ED ; Events, Items, Doors
    dw #$FFFF
.after

preset_redesign_lost_caverns_lost_maze:
    dw #preset_redesign_lost_caverns_phantoon_save_room ; Lost Caverns: Phantoon Save Room
    dl $7E078D : db $02 : dw $C0EC ; DDB
    dl $7E078F : db $02 : dw $0003 ; DoorOut Index
    dl $7E079B : db $02 : dw $CAAE ; MDB
    dl $7E07C3 : db $02 : dw $860B ; GFX Pointers
    dl $7E07C5 : db $02 : dw $7BC0 ; GFX Pointers
    dl $7E07C7 : db $02 : dw $C2BD ; GFX Pointers
    dl $7E090F : db $02 : dw $6A80 ; Screen subpixel X position.
    dl $7E0911 : db $02 : dw $0200 ; Screen X position in pixels
    dl $7E0913 : db $02 : dw $C400 ; Screen subpixel Y position
    dl $7E0915 : db $02 : dw $0000 ; Screen Y position in pixels
    dl $7E0917 : db $02 : dw $0180 ; Layer 2 X scroll in room in pixels?
    dl $7E0919 : db $02 : dw $0000 ; Layer 2 Y scroll in room in pixels? (up = positive)
    dl $7E0921 : db $02 : dw $0100 ; BG2 X scroll offset due to room transitions (Translates between Layer 2 scroll and BG2 scroll)
    dl $7E0923 : db $02 : dw $0000 ; BG2 Y scroll offset due to room transitions (Translates between Layer 2 scroll and BG2 scroll)
    dl $7E0AF6 : db $02 : dw $02C7 ; Samus X
    dl $7E0AFA : db $02 : dw $0087 ; Samus Y
    dl $7E0B3F : db $02 : dw $0001 ; Blue suit
    dw #$FFFF
.after

preset_redesign_lost_caverns_phantoon:
    dw #preset_redesign_lost_caverns_lost_maze ; Lost Caverns: Lost Maze
    dl $7E078D : db $02 : dw $C380 ; DDB
    dl $7E078F : db $02 : dw $0001 ; DoorOut Index
    dl $7E079B : db $02 : dw $A70B ; MDB
    dl $7E079F : db $02 : dw $0003 ; Region
    dl $7E090F : db $02 : dw $3D00 ; Screen subpixel X position.
    dl $7E0911 : db $02 : dw $0700 ; Screen X position in pixels
    dl $7E0913 : db $02 : dw $0000 ; Screen subpixel Y position
    dl $7E0915 : db $02 : dw $0406 ; Screen Y position in pixels
    dl $7E0917 : db $02 : dw $0700 ; Layer 2 X scroll in room in pixels?
    dl $7E0919 : db $02 : dw $0406 ; Layer 2 Y scroll in room in pixels? (up = positive)
    dl $7E0923 : db $02 : dw $FC00 ; BG2 Y scroll offset due to room transitions (Translates between Layer 2 scroll and BG2 scroll)
    dl $7E0A1C : db $02 : dw $0089 ; Samus position/state
    dl $7E0A1E : db $02 : dw $1508 ; More position/state
    dl $7E0AF6 : db $02 : dw $07DB ; Samus X
    dl $7E0AFA : db $02 : dw $048E ; Samus Y
    dl $7E0B3F : db $02 : dw $0000 ; Blue suit
    dw #$FFFF
.after

preset_redesign_botwoon_chain_spark_to_gravity:
    dw #preset_redesign_lost_caverns_phantoon ; Lost Caverns: Phantoon
    dl $7E078D : db $02 : dw $A2C4 ; DDB
    dl $7E078F : db $02 : dw $0000 ; DoorOut Index
    dl $7E079B : db $02 : dw $CAAE ; MDB
    dl $7E079F : db $02 : dw $0000 ; Region
    dl $7E07F5 : db $02 : dw $0005 ; Music Track
    dl $7E090F : db $02 : dw $9000 ; Screen subpixel X position.
    dl $7E0911 : db $02 : dw $0400 ; Screen X position in pixels
    dl $7E0913 : db $02 : dw $CA00 ; Screen subpixel Y position
    dl $7E0915 : db $02 : dw $0000 ; Screen Y position in pixels
    dl $7E0917 : db $02 : dw $0300 ; Layer 2 X scroll in room in pixels?
    dl $7E0919 : db $02 : dw $0000 ; Layer 2 Y scroll in room in pixels? (up = positive)
    dl $7E0921 : db $02 : dw $FD00 ; BG2 X scroll offset due to room transitions (Translates between Layer 2 scroll and BG2 scroll)
    dl $7E0923 : db $02 : dw $0000 ; BG2 Y scroll offset due to room transitions (Translates between Layer 2 scroll and BG2 scroll)
    dl $7E09C2 : db $02 : dw $017E ; Health
    dl $7E09C6 : db $02 : dw $0000 ; Missiles
    dl $7E09CA : db $02 : dw $0006 ; Supers
    dl $7E0A1C : db $02 : dw $0001 ; Samus position/state
    dl $7E0A1E : db $02 : dw $0008 ; More position/state
    dl $7E0AF6 : db $02 : dw $0430 ; Samus X
    dl $7E0AFA : db $02 : dw $008B ; Samus Y
    dl $7ED828 : db $02 : dw $0605 ; Events, Items, Doors
    dl $7ED82A : db $02 : dw $0105 ; Events, Items, Doors
    dl $7ED8C0 : db $02 : dw $0040 ; Events, Items, Doors
    dw #$FFFF
.after

preset_redesign_botwoon_sinking_chain_spark:
    dw #preset_redesign_botwoon_chain_spark_to_gravity ; Botwoon: Chain Spark To Gravity
    dl $7E078D : db $02 : dw $C14C ; DDB
    dl $7E078F : db $02 : dw $0004 ; DoorOut Index
    dl $7E079B : db $02 : dw $95A8 ; MDB
    dl $7E07C3 : db $02 : dw $C629 ; GFX Pointers
    dl $7E07C5 : db $02 : dw $7CBA ; GFX Pointers
    dl $7E07C7 : db $02 : dw $C2AD ; GFX Pointers
    dl $7E090F : db $02 : dw $C200 ; Screen subpixel X position.
    dl $7E0911 : db $02 : dw $0000 ; Screen X position in pixels
    dl $7E0913 : db $02 : dw $3800 ; Screen subpixel Y position
    dl $7E0915 : db $02 : dw $0200 ; Screen Y position in pixels
    dl $7E0917 : db $02 : dw $0000 ; Layer 2 X scroll in room in pixels?
    dl $7E0919 : db $02 : dw $0180 ; Layer 2 Y scroll in room in pixels? (up = positive)
    dl $7E0921 : db $02 : dw $FC00 ; BG2 X scroll offset due to room transitions (Translates between Layer 2 scroll and BG2 scroll)
    dl $7E0923 : db $02 : dw $FF00 ; BG2 Y scroll offset due to room transitions (Translates between Layer 2 scroll and BG2 scroll)
    dl $7E09C2 : db $02 : dw $013B ; Health
    dl $7E0A1C : db $02 : dw $0002 ; Samus position/state
    dl $7E0A1E : db $02 : dw $0004 ; More position/state
    dl $7E0A68 : db $02 : dw $0001 ; Flash suit
    dl $7E0AF6 : db $02 : dw $0068 ; Samus X
    dl $7E0AFA : db $02 : dw $02A4 ; Samus Y
    dl $7ED91A : db $02 : dw $00EE ; Events, Items, Doors
    dw #$FFFF
.after

preset_redesign_botwoon_gravity:
    dw #preset_redesign_botwoon_sinking_chain_spark ; Botwoon: Sinking Chain Spark
    dl $7E078D : db $02 : dw $C188 ; DDB
    dl $7E078F : db $02 : dw $0002 ; DoorOut Index
    dl $7E079B : db $02 : dw $957D ; MDB
    dl $7E090F : db $02 : dw $E878 ; Screen subpixel X position.
    dl $7E0911 : db $02 : dw $0100 ; Screen X position in pixels
    dl $7E0913 : db $02 : dw $0000 ; Screen subpixel Y position
    dl $7E0915 : db $02 : dw $0804 ; Screen Y position in pixels
    dl $7E0917 : db $02 : dw $00C0 ; Layer 2 X scroll in room in pixels?
    dl $7E0919 : db $02 : dw $0603 ; Layer 2 Y scroll in room in pixels? (up = positive)
    dl $7E0921 : db $02 : dw $0100 ; BG2 X scroll offset due to room transitions (Translates between Layer 2 scroll and BG2 scroll)
    dl $7E0923 : db $02 : dw $F700 ; BG2 Y scroll offset due to room transitions (Translates between Layer 2 scroll and BG2 scroll)
    dl $7E09C2 : db $02 : dw $014E ; Health
    dl $7E09CA : db $02 : dw $0005 ; Supers
    dl $7E0A1C : db $02 : dw $0001 ; Samus position/state
    dl $7E0A1E : db $02 : dw $0008 ; More position/state
    dl $7E0A68 : db $02 : dw $0000 ; Flash suit
    dl $7E0AF6 : db $02 : dw $01D6 ; Samus X
    dl $7E0AFA : db $02 : dw $088B ; Samus Y
    dl $7E0B3F : db $02 : dw $0003 ; Blue suit
    dl $7ED8B0 : db $02 : dw $88AA ; Events, Items, Doors
    dl $7ED91A : db $02 : dw $00EF ; Events, Items, Doors
    dw #$FFFF
.after

preset_redesign_botwoon_spikesuit_2:
    dw #preset_redesign_botwoon_gravity ; Botwoon: Gravity
    dl $7E078D : db $02 : dw $C164 ; DDB
    dl $7E078F : db $02 : dw $0006 ; DoorOut Index
    dl $7E079B : db $02 : dw $95A8 ; MDB
    dl $7E090F : db $02 : dw $2000 ; Screen subpixel X position.
    dl $7E0911 : db $02 : dw $00E3 ; Screen X position in pixels
    dl $7E0913 : db $02 : dw $0800 ; Screen subpixel Y position
    dl $7E0915 : db $02 : dw $0400 ; Screen Y position in pixels
    dl $7E0917 : db $02 : dw $00AA ; Layer 2 X scroll in room in pixels?
    dl $7E0919 : db $02 : dw $0300 ; Layer 2 Y scroll in room in pixels? (up = positive)
    dl $7E0921 : db $02 : dw $FC00 ; BG2 X scroll offset due to room transitions (Translates between Layer 2 scroll and BG2 scroll)
    dl $7E0923 : db $02 : dw $FC00 ; BG2 Y scroll offset due to room transitions (Translates between Layer 2 scroll and BG2 scroll)
    dl $7E09A2 : db $02 : dw $752D ; Equipped Items
    dl $7E09A4 : db $02 : dw $752D ; Collected Items
    dl $7E09C2 : db $02 : dw $0153 ; Health
    dl $7E0AF6 : db $02 : dw $0175 ; Samus X
    dl $7E0AFA : db $02 : dw $04AB ; Samus Y
    dl $7E0B3F : db $02 : dw $0000 ; Blue suit
    dl $7ED870 : db $02 : dw $1028 ; Events, Items, Doors
    dl $7ED8AC : db $02 : dw $0040 ; Events, Items, Doors
    dl $7ED91A : db $02 : dw $00F1 ; Events, Items, Doors
    dw #$FFFF
.after

preset_redesign_botwoon_fish_tunnel_left:
    dw #preset_redesign_botwoon_spikesuit_2 ; Botwoon: Spikesuit
    dl $7E078D : db $02 : dw $C188 ; DDB
    dl $7E078F : db $02 : dw $0002 ; DoorOut Index
    dl $7E079B : db $02 : dw $957D ; MDB
    dl $7E090F : db $02 : dw $2C00 ; Screen subpixel X position.
    dl $7E0911 : db $02 : dw $0000 ; Screen X position in pixels
    dl $7E0913 : db $02 : dw $0000 ; Screen subpixel Y position
    dl $7E0915 : db $02 : dw $0907 ; Screen Y position in pixels
    dl $7E0917 : db $02 : dw $0000 ; Layer 2 X scroll in room in pixels?
    dl $7E0919 : db $02 : dw $06C5 ; Layer 2 Y scroll in room in pixels? (up = positive)
    dl $7E0921 : db $02 : dw $0100 ; BG2 X scroll offset due to room transitions (Translates between Layer 2 scroll and BG2 scroll)
    dl $7E0923 : db $02 : dw $F700 ; BG2 Y scroll offset due to room transitions (Translates between Layer 2 scroll and BG2 scroll)
    dl $7E09C2 : db $02 : dw $0145 ; Health
    dl $7E09C6 : db $02 : dw $0002 ; Missiles
    dl $7E09CA : db $02 : dw $0006 ; Supers
    dl $7E0A1C : db $02 : dw $0002 ; Samus position/state
    dl $7E0A1E : db $02 : dw $0004 ; More position/state
    dl $7E0A68 : db $02 : dw $0001 ; Flash suit
    dl $7E0AF6 : db $02 : dw $0060 ; Samus X
    dl $7E0AFA : db $02 : dw $099B ; Samus Y
    dw #$FFFF
.after

preset_redesign_botwoon_spiksuit_ibj:
    dw #preset_redesign_botwoon_fish_tunnel_left ; Botwoon: Fish Tunnel Left
    dl $7E078D : db $02 : dw $C14C ; DDB
    dl $7E078F : db $02 : dw $0004 ; DoorOut Index
    dl $7E079B : db $02 : dw $95A8 ; MDB
    dl $7E090F : db $02 : dw $2000 ; Screen subpixel X position.
    dl $7E0911 : db $02 : dw $02F3 ; Screen X position in pixels
    dl $7E0915 : db $02 : dw $011B ; Screen Y position in pixels
    dl $7E0917 : db $02 : dw $0236 ; Layer 2 X scroll in room in pixels?
    dl $7E0919 : db $02 : dw $00D4 ; Layer 2 Y scroll in room in pixels? (up = positive)
    dl $7E0921 : db $02 : dw $FC00 ; BG2 X scroll offset due to room transitions (Translates between Layer 2 scroll and BG2 scroll)
    dl $7E0923 : db $02 : dw $FF00 ; BG2 Y scroll offset due to room transitions (Translates between Layer 2 scroll and BG2 scroll)
    dl $7E09C2 : db $02 : dw $014F ; Health
    dl $7E0A1C : db $02 : dw $0001 ; Samus position/state
    dl $7E0A1E : db $02 : dw $0008 ; More position/state
    dl $7E0AF6 : db $02 : dw $0390 ; Samus X
    dl $7E0AFA : db $02 : dw $019B ; Samus Y
    dl $7ED91A : db $02 : dw $00F4 ; Events, Items, Doors
    dw #$FFFF
.after

preset_redesign_botwoon_leaving_kago_guardian:
    dw #preset_redesign_botwoon_spiksuit_ibj ; Botwoon: Spiksuit IBJ
    dl $7E078D : db $02 : dw $C128 ; DDB
    dl $7E078F : db $02 : dw $0001 ; DoorOut Index
    dl $7E079B : db $02 : dw $9552 ; MDB
    dl $7E090F : db $02 : dw $A800 ; Screen subpixel X position.
    dl $7E0911 : db $02 : dw $0900 ; Screen X position in pixels
    dl $7E0913 : db $02 : dw $CA00 ; Screen subpixel Y position
    dl $7E0915 : db $02 : dw $0200 ; Screen Y position in pixels
    dl $7E0917 : db $02 : dw $06C0 ; Layer 2 X scroll in room in pixels?
    dl $7E0919 : db $02 : dw $0180 ; Layer 2 Y scroll in room in pixels? (up = positive)
    dl $7E0921 : db $02 : dw $F800 ; BG2 X scroll offset due to room transitions (Translates between Layer 2 scroll and BG2 scroll)
    dl $7E0923 : db $02 : dw $FE00 ; BG2 Y scroll offset due to room transitions (Translates between Layer 2 scroll and BG2 scroll)
    dl $7E09C2 : db $02 : dw $01FC ; Health
    dl $7E09C6 : db $02 : dw $0012 ; Missiles
    dl $7E09CE : db $02 : dw $0004 ; Pbs
    dl $7E09D0 : db $02 : dw $0004 ; Max pbs
    dl $7E0A1C : db $02 : dw $0002 ; Samus position/state
    dl $7E0A1E : db $02 : dw $0004 ; More position/state
    dl $7E0A68 : db $02 : dw $0000 ; Flash suit
    dl $7E0AF6 : db $02 : dw $0927 ; Samus X
    dl $7E0AFA : db $02 : dw $028B ; Samus Y
    dl $7ED826 : db $02 : dw $0187 ; Events, Items, Doors
    dl $7ED870 : db $02 : dw $1828 ; Events, Items, Doors
    dl $7ED8AC : db $02 : dw $0050 ; Events, Items, Doors
    dl $7ED91A : db $02 : dw $00F5 ; Events, Items, Doors
    dw #$FFFF
.after

preset_redesign_botwoon_terrible_terrible_fall_supers:
    dw #preset_redesign_botwoon_leaving_kago_guardian ; Botwoon: Leaving Kago Guardian
    dl $7E078D : db $02 : dw $C38C ; DDB
    dl $7E078F : db $02 : dw $0002 ; DoorOut Index
    dl $7E079B : db $02 : dw $CAAE ; MDB
    dl $7E07C3 : db $02 : dw $860B ; GFX Pointers
    dl $7E07C5 : db $02 : dw $7BC0 ; GFX Pointers
    dl $7E07C7 : db $02 : dw $C2BD ; GFX Pointers
    dl $7E090F : db $02 : dw $6800 ; Screen subpixel X position.
    dl $7E0911 : db $02 : dw $0000 ; Screen X position in pixels
    dl $7E0913 : db $02 : dw $E5FF ; Screen subpixel Y position
    dl $7E0915 : db $02 : dw $0000 ; Screen Y position in pixels
    dl $7E0917 : db $02 : dw $0000 ; Layer 2 X scroll in room in pixels?
    dl $7E0919 : db $02 : dw $0000 ; Layer 2 Y scroll in room in pixels? (up = positive)
    dl $7E0921 : db $02 : dw $FD00 ; BG2 X scroll offset due to room transitions (Translates between Layer 2 scroll and BG2 scroll)
    dl $7E0923 : db $02 : dw $0000 ; BG2 Y scroll offset due to room transitions (Translates between Layer 2 scroll and BG2 scroll)
    dl $7E0AF6 : db $02 : dw $002A ; Samus X
    dl $7E0AFA : db $02 : dw $008B ; Samus Y
    dw #$FFFF
.after

preset_redesign_botwoon_boulder_bowling_2:
    dw #preset_redesign_botwoon_terrible_terrible_fall_supers ; Botwoon: Terrible Terrible Fall Supers
    dl $7E078D : db $02 : dw $ADC5 ; DDB
    dl $7E079B : db $02 : dw $968F ; MDB
    dl $7E07C3 : db $02 : dw $C629 ; GFX Pointers
    dl $7E07C5 : db $02 : dw $7CBA ; GFX Pointers
    dl $7E07C7 : db $02 : dw $C2AD ; GFX Pointers
    dl $7E090F : db $02 : dw $5A00 ; Screen subpixel X position.
    dl $7E0911 : db $02 : dw $0500 ; Screen X position in pixels
    dl $7E0913 : db $02 : dw $5400 ; Screen subpixel Y position
    dl $7E0915 : db $02 : dw $000F ; Screen Y position in pixels
    dl $7E0917 : db $02 : dw $0001 ; Layer 2 X scroll in room in pixels?
    dl $7E0919 : db $02 : dw $000B ; Layer 2 Y scroll in room in pixels? (up = positive)
    dl $7E0921 : db $02 : dw $FA00 ; BG2 X scroll offset due to room transitions (Translates between Layer 2 scroll and BG2 scroll)
    dl $7E09C2 : db $02 : dw $01E8 ; Health
    dl $7E09C6 : db $02 : dw $000D ; Missiles
    dl $7E09CA : db $02 : dw $0007 ; Supers
    dl $7E09CC : db $02 : dw $0008 ; Max supers
    dl $7E0AF6 : db $02 : dw $0525 ; Samus X
    dl $7E0AFA : db $02 : dw $0091 ; Samus Y
    dl $7ED870 : db $02 : dw $1C28 ; Events, Items, Doors
    dl $7ED8B0 : db $02 : dw $8CAA ; Events, Items, Doors
    dl $7ED91A : db $02 : dw $00F8 ; Events, Items, Doors
    dw #$FFFF
.after

preset_redesign_botwoon_red_gate_chain_spark:
    dw #preset_redesign_botwoon_boulder_bowling_2 ; Botwoon: Boulder Bowling
    dl $7E078D : db $02 : dw $BF78 ; DDB
    dl $7E079B : db $02 : dw $93FE ; MDB
    dl $7E07F3 : db $02 : dw $0009 ; Music Bank
    dl $7E090F : db $02 : dw $E000 ; Screen subpixel X position.
    dl $7E0911 : db $02 : dw $0269 ; Screen X position in pixels
    dl $7E0913 : db $02 : dw $CC00 ; Screen subpixel Y position
    dl $7E0915 : db $02 : dw $0000 ; Screen Y position in pixels
    dl $7E0917 : db $02 : dw $01CE ; Layer 2 X scroll in room in pixels?
    dl $7E0919 : db $02 : dw $0000 ; Layer 2 Y scroll in room in pixels? (up = positive)
    dl $7E0921 : db $02 : dw $FB00 ; BG2 X scroll offset due to room transitions (Translates between Layer 2 scroll and BG2 scroll)
    dl $7E09C2 : db $02 : dw $021F ; Health
    dl $7E09CA : db $02 : dw $0008 ; Supers
    dl $7E0AF6 : db $02 : dw $02D2 ; Samus X
    dl $7E0AFA : db $02 : dw $00AB ; Samus Y
    dl $7ED91A : db $02 : dw $00FA ; Events, Items, Doors
    dw #$FFFF
.after

preset_redesign_botwoon_spikester_descent:
    dw #preset_redesign_botwoon_red_gate_chain_spark ; Botwoon: Red Gate Chain Spark
    dl $7E078D : db $02 : dw $8E9E ; DDB
    dl $7E078F : db $02 : dw $0000 ; DoorOut Index
    dl $7E079B : db $02 : dw $9879 ; MDB
    dl $7E07C3 : db $02 : dw $F911 ; GFX Pointers
    dl $7E07C5 : db $02 : dw $43BA ; GFX Pointers
    dl $7E07C7 : db $02 : dw $C2AF ; GFX Pointers
    dl $7E090F : db $02 : dw $CE80 ; Screen subpixel X position.
    dl $7E0911 : db $02 : dw $0000 ; Screen X position in pixels
    dl $7E0913 : db $02 : dw $4E00 ; Screen subpixel Y position
    dl $7E0917 : db $02 : dw $0000 ; Layer 2 X scroll in room in pixels?
    dl $7E09C2 : db $02 : dw $01F5 ; Health
    dl $7E09C6 : db $02 : dw $0018 ; Missiles
    dl $7E09C8 : db $02 : dw $0023 ; Max missiles
    dl $7E0AF6 : db $02 : dw $0038 ; Samus X
    dl $7E0AFA : db $02 : dw $0098 ; Samus Y
    dl $7ED872 : db $02 : dw $220C ; Events, Items, Doors
    dl $7ED8AE : db $02 : dw $244D ; Events, Items, Doors
    dl $7ED8DE : db $02 : dw $8040 ; Events, Items, Doors
    dl $7ED91A : db $02 : dw $00FD ; Events, Items, Doors
    dw #$FFFF
.after

preset_redesign_botwoon_crabby_ggg:
    dw #preset_redesign_botwoon_spikester_descent ; Botwoon: Spikester Descent
    dl $7E078D : db $02 : dw $8B02 ; DDB
    dl $7E078F : db $02 : dw $0003 ; DoorOut Index
    dl $7E079B : db $02 : dw $B3E1 ; MDB
    dl $7E079F : db $02 : dw $0004 ; Region
    dl $7E07C3 : db $02 : dw $B130 ; GFX Pointers
    dl $7E07C5 : db $02 : dw $3CBE ; GFX Pointers
    dl $7E07C7 : db $02 : dw $C2B8 ; GFX Pointers
    dl $7E07F5 : db $02 : dw $0003 ; Music Track
    dl $7E090F : db $02 : dw $D000 ; Screen subpixel X position.
    dl $7E0913 : db $02 : dw $C000 ; Screen subpixel Y position
    dl $7E0915 : db $02 : dw $0100 ; Screen Y position in pixels
    dl $7E0919 : db $02 : dw $0100 ; Layer 2 Y scroll in room in pixels? (up = positive)
    dl $7E0921 : db $02 : dw $0000 ; BG2 X scroll offset due to room transitions (Translates between Layer 2 scroll and BG2 scroll)
    dl $7E0923 : db $02 : dw $00E0 ; BG2 Y scroll offset due to room transitions (Translates between Layer 2 scroll and BG2 scroll)
    dl $7E09A6 : db $02 : dw $1001 ; Beams
    dl $7E09C6 : db $02 : dw $0008 ; Missiles
    dl $7E0AF6 : db $02 : dw $0035 ; Samus X
    dl $7E0AFA : db $02 : dw $018B ; Samus Y
    dl $7ED8BC : db $02 : dw $8F4C ; Events, Items, Doors
    dl $7ED8BE : db $02 : dw $2C16 ; Events, Items, Doors
    dw #$FFFF
.after

preset_redesign_botwoon_twin_red_gates:
    dw #preset_redesign_botwoon_crabby_ggg ; Botwoon: Crabby GGG
    dl $7E078D : db $02 : dw $BA70 ; DDB
    dl $7E079B : db $02 : dw $D48E ; MDB
    dl $7E07F3 : db $02 : dw $001B ; Music Bank
    dl $7E07F5 : db $02 : dw $0005 ; Music Track
    dl $7E090F : db $02 : dw $DC00 ; Screen subpixel X position.
    dl $7E0913 : db $02 : dw $8C00 ; Screen subpixel Y position
    dl $7E0915 : db $02 : dw $0400 ; Screen Y position in pixels
    dl $7E0919 : db $02 : dw $0400 ; Layer 2 Y scroll in room in pixels? (up = positive)
    dl $7E0921 : db $02 : dw $0100 ; BG2 X scroll offset due to room transitions (Translates between Layer 2 scroll and BG2 scroll)
    dl $7E0923 : db $02 : dw $FE00 ; BG2 Y scroll offset due to room transitions (Translates between Layer 2 scroll and BG2 scroll)
    dl $7E09C2 : db $02 : dw $0209 ; Health
    dl $7E09CA : db $02 : dw $0006 ; Supers
    dl $7E0A1C : db $02 : dw $0001 ; Samus position/state
    dl $7E0A1E : db $02 : dw $0008 ; More position/state
    dl $7E0AF6 : db $02 : dw $008C ; Samus X
    dl $7E0AFA : db $02 : dw $049D ; Samus Y
    dl $7ED8DC : db $02 : dw $1096 ; Events, Items, Doors
    dl $7ED91A : db $02 : dw $00FE ; Events, Items, Doors
    dw #$FFFF
.after

preset_redesign_botwoon_purple_platforms:
    dw #preset_redesign_botwoon_twin_red_gates ; Botwoon: Twin Red Gates
    dl $7E078D : db $02 : dw $BA94 ; DDB
    dl $7E079B : db $02 : dw $D4C2 ; MDB
    dl $7E090F : db $02 : dw $C000 ; Screen subpixel X position.
    dl $7E0911 : db $02 : dw $0100 ; Screen X position in pixels
    dl $7E0913 : db $02 : dw $BC00 ; Screen subpixel Y position
    dl $7E0915 : db $02 : dw $0206 ; Screen Y position in pixels
    dl $7E0917 : db $02 : dw $00C0 ; Layer 2 X scroll in room in pixels?
    dl $7E0919 : db $02 : dw $0184 ; Layer 2 Y scroll in room in pixels? (up = positive)
    dl $7E0921 : db $02 : dw $0000 ; BG2 X scroll offset due to room transitions (Translates between Layer 2 scroll and BG2 scroll)
    dl $7E0923 : db $02 : dw $0000 ; BG2 Y scroll offset due to room transitions (Translates between Layer 2 scroll and BG2 scroll)
    dl $7E09C6 : db $02 : dw $0006 ; Missiles
    dl $7E0A1C : db $02 : dw $0002 ; Samus position/state
    dl $7E0A1E : db $02 : dw $0004 ; More position/state
    dl $7E0AF6 : db $02 : dw $0129 ; Samus X
    dl $7E0AFA : db $02 : dw $028B ; Samus Y
    dl $7ED8D8 : db $02 : dw $16F0 ; Events, Items, Doors
    dl $7ED91A : db $02 : dw $0100 ; Events, Items, Doors
    dw #$FFFF
.after

preset_redesign_botwoon_shutter_maze_top:
    dw #preset_redesign_botwoon_purple_platforms ; Botwoon: Purple Platforms
    dl $7E078D : db $02 : dw $A690 ; DDB
    dl $7E078F : db $02 : dw $0001 ; DoorOut Index
    dl $7E079B : db $02 : dw $D461 ; MDB
    dl $7E07C3 : db $02 : dw $E78D ; GFX Pointers
    dl $7E07C5 : db $02 : dw $2EBE ; GFX Pointers
    dl $7E07C7 : db $02 : dw $C2B9 ; GFX Pointers
    dl $7E090F : db $02 : dw $4180 ; Screen subpixel X position.
    dl $7E0911 : db $02 : dw $0000 ; Screen X position in pixels
    dl $7E0913 : db $02 : dw $0000 ; Screen subpixel Y position
    dl $7E0915 : db $02 : dw $0402 ; Screen Y position in pixels
    dl $7E0917 : db $02 : dw $0000 ; Layer 2 X scroll in room in pixels?
    dl $7E0919 : db $02 : dw $0402 ; Layer 2 Y scroll in room in pixels? (up = positive)
    dl $7E0921 : db $02 : dw $FA00 ; BG2 X scroll offset due to room transitions (Translates between Layer 2 scroll and BG2 scroll)
    dl $7E0923 : db $02 : dw $FB00 ; BG2 Y scroll offset due to room transitions (Translates between Layer 2 scroll and BG2 scroll)
    dl $7E09C2 : db $02 : dw $021D ; Health
    dl $7E0AF6 : db $02 : dw $0035 ; Samus X
    dl $7E0AFA : db $02 : dw $048B ; Samus Y
    dl $7ED91A : db $02 : dw $0101 ; Events, Items, Doors
    dw #$FFFF
.after

preset_redesign_botwoon_quicksand_run:
    dw #preset_redesign_botwoon_shutter_maze_top ; Botwoon: Shutter Maze Top
    dl $7E078D : db $02 : dw $A648 ; DDB
    dl $7E079B : db $02 : dw $D387 ; MDB
    dl $7E090F : db $02 : dw $7600 ; Screen subpixel X position.
    dl $7E0915 : db $02 : dw $0400 ; Screen Y position in pixels
    dl $7E0919 : db $02 : dw $0400 ; Layer 2 Y scroll in room in pixels? (up = positive)
    dl $7E0921 : db $02 : dw $FC00 ; BG2 X scroll offset due to room transitions (Translates between Layer 2 scroll and BG2 scroll)
    dl $7E0923 : db $02 : dw $FC00 ; BG2 Y scroll offset due to room transitions (Translates between Layer 2 scroll and BG2 scroll)
    dl $7E09C2 : db $02 : dw $0231 ; Health
    dl $7E09CE : db $02 : dw $0003 ; Pbs
    dl $7E0AF6 : db $02 : dw $0038 ; Samus X
    dl $7ED8DA : db $02 : dw $8E0C ; Events, Items, Doors
    dw #$FFFF
.after

preset_redesign_botwoon_botwoon_2:
    dw #preset_redesign_botwoon_quicksand_run ; Botwoon: Quicksand Run
    dl $7E078D : db $02 : dw $A5AC ; DDB
    dl $7E079B : db $02 : dw $D1DD ; MDB
    dl $7E090F : db $02 : dw $2900 ; Screen subpixel X position.
    dl $7E0911 : db $02 : dw $0300 ; Screen X position in pixels
    dl $7E0915 : db $02 : dw $011B ; Screen Y position in pixels
    dl $7E0917 : db $02 : dw $0300 ; Layer 2 X scroll in room in pixels?
    dl $7E0919 : db $02 : dw $011B ; Layer 2 Y scroll in room in pixels? (up = positive)
    dl $7E0921 : db $02 : dw $FE00 ; BG2 X scroll offset due to room transitions (Translates between Layer 2 scroll and BG2 scroll)
    dl $7E0923 : db $02 : dw $0000 ; BG2 Y scroll offset due to room transitions (Translates between Layer 2 scroll and BG2 scroll)
    dl $7E09C2 : db $02 : dw $022F ; Health
    dl $7E09C6 : db $02 : dw $0001 ; Missiles
    dl $7E09CA : db $02 : dw $0002 ; Supers
    dl $7E0A1C : db $02 : dw $0001 ; Samus position/state
    dl $7E0A1E : db $02 : dw $0008 ; More position/state
    dl $7E0AF6 : db $02 : dw $03C4 ; Samus X
    dl $7E0AFA : db $02 : dw $018B ; Samus Y
    dl $7ED8A8 : db $02 : dw $1A08 ; Events, Items, Doors
    dl $7ED8C0 : db $02 : dw $1040 ; Events, Items, Doors
    dl $7ED8C4 : db $02 : dw $0041 ; Events, Items, Doors
    dl $7ED91A : db $02 : dw $0103 ; Events, Items, Doors
    dw #$FFFF
.after

preset_redesign_botwoon_botwoon_fall:
    dw #preset_redesign_botwoon_botwoon_2 ; Botwoon: Botwoon
    dl $7E078D : db $02 : dw $B98C ; DDB
    dl $7E078F : db $02 : dw $0006 ; DoorOut Index
    dl $7E079B : db $02 : dw $D95E ; MDB
    dl $7E07F3 : db $02 : dw $002A ; Music Bank
    dl $7E07F5 : db $02 : dw $0003 ; Music Track
    dl $7E090F : db $02 : dw $A800 ; Screen subpixel X position.
    dl $7E0911 : db $02 : dw $0000 ; Screen X position in pixels
    dl $7E0913 : db $02 : dw $9400 ; Screen subpixel Y position
    dl $7E0915 : db $02 : dw $0000 ; Screen Y position in pixels
    dl $7E0917 : db $02 : dw $0000 ; Layer 2 X scroll in room in pixels?
    dl $7E0919 : db $02 : dw $0000 ; Layer 2 Y scroll in room in pixels? (up = positive)
    dl $7E0921 : db $02 : dw $0100 ; BG2 X scroll offset due to room transitions (Translates between Layer 2 scroll and BG2 scroll)
    dl $7E09A2 : db $02 : dw $772D ; Equipped Items
    dl $7E09A4 : db $02 : dw $772D ; Collected Items
    dl $7E09C2 : db $02 : dw $0257 ; Health
    dl $7E09C6 : db $02 : dw $0005 ; Missiles
    dl $7E09CA : db $02 : dw $0005 ; Supers
    dl $7E09CE : db $02 : dw $0004 ; Pbs
    dl $7E0A1C : db $02 : dw $0002 ; Samus position/state
    dl $7E0A1E : db $02 : dw $0004 ; More position/state
    dl $7E0AF6 : db $02 : dw $0027 ; Samus X
    dl $7E0AFA : db $02 : dw $008B ; Samus Y
    dl $7ED82C : db $02 : dw $E002 ; Events, Items, Doors
    dl $7ED880 : db $02 : dw $6400 ; Events, Items, Doors
    dl $7ED8C2 : db $02 : dw $6000 ; Events, Items, Doors
    dl $7ED91A : db $02 : dw $0104 ; Events, Items, Doors
    dw #$FFFF
.after

preset_redesign_cleanup_save_room_fall:
    dw #preset_redesign_botwoon_botwoon_fall ; Botwoon: Botwoon Fall
    dl $7E078D : db $02 : dw $A3B4 ; DDB
    dl $7E078F : db $02 : dw $0002 ; DoorOut Index
    dl $7E079B : db $02 : dw $D1DD ; MDB
    dl $7E07F3 : db $02 : dw $001B ; Music Bank
    dl $7E07F5 : db $02 : dw $0005 ; Music Track
    dl $7E090F : db $02 : dw $0000 ; Screen subpixel X position.
    dl $7E0911 : db $02 : dw $011A ; Screen X position in pixels
    dl $7E0913 : db $02 : dw $1200 ; Screen subpixel Y position
    dl $7E0915 : db $02 : dw $081F ; Screen Y position in pixels
    dl $7E0917 : db $02 : dw $011A ; Layer 2 X scroll in room in pixels?
    dl $7E0919 : db $02 : dw $081F ; Layer 2 Y scroll in room in pixels? (up = positive)
    dl $7E0921 : db $02 : dw $FF00 ; BG2 X scroll offset due to room transitions (Translates between Layer 2 scroll and BG2 scroll)
    dl $7E0923 : db $02 : dw $F700 ; BG2 Y scroll offset due to room transitions (Translates between Layer 2 scroll and BG2 scroll)
    dl $7E09C6 : db $02 : dw $0000 ; Missiles
    dl $7E09CA : db $02 : dw $0007 ; Supers
    dl $7E0AF6 : db $02 : dw $01BA ; Samus X
    dl $7E0AFA : db $02 : dw $08BB ; Samus Y
    dl $7ED8AE : db $02 : dw $344D ; Events, Items, Doors
    dl $7ED8C0 : db $02 : dw $1140 ; Events, Items, Doors
    dl $7ED91A : db $02 : dw $0107 ; Events, Items, Doors
    dw #$FFFF
.after

preset_redesign_cleanup_snail_highway:
    dw #preset_redesign_cleanup_save_room_fall ; Cleanup: Save Room Fall
    dl $7E078D : db $02 : dw $A3C0 ; DDB
    dl $7E078F : db $02 : dw $0003 ; DoorOut Index
    dl $7E079B : db $02 : dw $D017 ; MDB
    dl $7E07C3 : db $02 : dw $B130 ; GFX Pointers
    dl $7E07C5 : db $02 : dw $3CBE ; GFX Pointers
    dl $7E07C7 : db $02 : dw $C2B8 ; GFX Pointers
    dl $7E090F : db $02 : dw $B000 ; Screen subpixel X position.
    dl $7E0911 : db $02 : dw $0000 ; Screen X position in pixels
    dl $7E0913 : db $02 : dw $C400 ; Screen subpixel Y position
    dl $7E0915 : db $02 : dw $03F3 ; Screen Y position in pixels
    dl $7E0917 : db $02 : dw $0000 ; Layer 2 X scroll in room in pixels?
    dl $7E0919 : db $02 : dw $02F6 ; Layer 2 Y scroll in room in pixels? (up = positive)
    dl $7E0921 : db $02 : dw $0100 ; BG2 X scroll offset due to room transitions (Translates between Layer 2 scroll and BG2 scroll)
    dl $7E0923 : db $02 : dw $FC00 ; BG2 Y scroll offset due to room transitions (Translates between Layer 2 scroll and BG2 scroll)
    dl $7E09C2 : db $02 : dw $023B ; Health
    dl $7E09C6 : db $02 : dw $0002 ; Missiles
    dl $7E0A1C : db $02 : dw $0001 ; Samus position/state
    dl $7E0A1E : db $02 : dw $0008 ; More position/state
    dl $7E0AF6 : db $02 : dw $00E1 ; Samus X
    dl $7E0AFA : db $02 : dw $048B ; Samus Y
    dl $7ED91A : db $02 : dw $0108 ; Events, Items, Doors
    dw #$FFFF
.after

preset_redesign_cleanup_green_brin_pb_blockade:
    dw #preset_redesign_cleanup_snail_highway ; Cleanup: Snail Highway
    dl $7E078D : db $02 : dw $A4B0 ; DDB
    dl $7E078F : db $02 : dw $0000 ; DoorOut Index
    dl $7E079B : db $02 : dw $D21C ; MDB
    dl $7E07F5 : db $02 : dw $0006 ; Music Track
    dl $7E090F : db $02 : dw $9000 ; Screen subpixel X position.
    dl $7E0911 : db $02 : dw $0200 ; Screen X position in pixels
    dl $7E0913 : db $02 : dw $8200 ; Screen subpixel Y position
    dl $7E0915 : db $02 : dw $0000 ; Screen Y position in pixels
    dl $7E0917 : db $02 : dw $0200 ; Layer 2 X scroll in room in pixels?
    dl $7E0919 : db $02 : dw $0000 ; Layer 2 Y scroll in room in pixels? (up = positive)
    dl $7E0921 : db $02 : dw $FF00 ; BG2 X scroll offset due to room transitions (Translates between Layer 2 scroll and BG2 scroll)
    dl $7E0923 : db $02 : dw $0000 ; BG2 Y scroll offset due to room transitions (Translates between Layer 2 scroll and BG2 scroll)
    dl $7E09CE : db $02 : dw $0003 ; Pbs
    dl $7E0AF6 : db $02 : dw $02C0 ; Samus X
    dl $7E0AFA : db $02 : dw $008B ; Samus Y
    dl $7ED89E : db $02 : dw $0001 ; Events, Items, Doors
    dl $7ED8BF : db $02 : dw $C656 ; Events, Items, Doors
    dl $7ED91A : db $02 : dw $010A ; Events, Items, Doors
    dw #$FFFF
.after

preset_redesign_cleanup_red_tower_guardian:
    dw #preset_redesign_cleanup_green_brin_pb_blockade ; Cleanup: Green Brin PB Blockade
    dl $7E078D : db $02 : dw $8D1E ; DDB
    dl $7E079B : db $02 : dw $A3AE ; MDB
    dl $7E079F : db $02 : dw $0001 ; Region
    dl $7E07C3 : db $02 : dw $A5AA ; GFX Pointers
    dl $7E07C5 : db $02 : dw $5FBC ; GFX Pointers
    dl $7E07C7 : db $02 : dw $C2B3 ; GFX Pointers
    dl $7E07F3 : db $02 : dw $0012 ; Music Bank
    dl $7E07F5 : db $02 : dw $0005 ; Music Track
    dl $7E090F : db $02 : dw $B000 ; Screen subpixel X position.
    dl $7E0911 : db $02 : dw $08F9 ; Screen X position in pixels
    dl $7E0913 : db $02 : dw $C000 ; Screen subpixel Y position
    dl $7E0915 : db $02 : dw $021F ; Screen Y position in pixels
    dl $7E0917 : db $02 : dw $06BA ; Layer 2 X scroll in room in pixels?
    dl $7E0919 : db $02 : dw $0197 ; Layer 2 Y scroll in room in pixels? (up = positive)
    dl $7E0921 : db $02 : dw $0100 ; BG2 X scroll offset due to room transitions (Translates between Layer 2 scroll and BG2 scroll)
    dl $7E09C2 : db $02 : dw $022C ; Health
    dl $7E09C6 : db $02 : dw $0004 ; Missiles
    dl $7E09CA : db $02 : dw $0008 ; Supers
    dl $7E09CE : db $02 : dw $0001 ; Pbs
    dl $7E0AF6 : db $02 : dw $0959 ; Samus X
    dl $7E0AFA : db $02 : dw $02BB ; Samus Y
    dl $7ED8A0 : db $02 : dw $0944 ; Events, Items, Doors
    dl $7ED8A2 : db $02 : dw $6208 ; Events, Items, Doors
    dl $7ED91A : db $02 : dw $010C ; Events, Items, Doors
    dw #$FFFF
.after

preset_redesign_cleanup_spike_guardian:
    dw #preset_redesign_cleanup_red_tower_guardian ; Cleanup: Red Tower Guardian
    dl $7E078D : db $02 : dw $90EA ; DDB
    dl $7E079B : db $02 : dw $A322 ; MDB
    dl $7E090F : db $02 : dw $0000 ; Screen subpixel X position.
    dl $7E0911 : db $02 : dw $0205 ; Screen X position in pixels
    dl $7E0913 : db $02 : dw $0000 ; Screen subpixel Y position
    dl $7E0915 : db $02 : dw $0539 ; Screen Y position in pixels
    dl $7E0917 : db $02 : dw $0183 ; Layer 2 X scroll in room in pixels?
    dl $7E0919 : db $02 : dw $03EA ; Layer 2 Y scroll in room in pixels? (up = positive)
    dl $7E0921 : db $02 : dw $FE00 ; BG2 X scroll offset due to room transitions (Translates between Layer 2 scroll and BG2 scroll)
    dl $7E0923 : db $02 : dw $00E0 ; BG2 Y scroll offset due to room transitions (Translates between Layer 2 scroll and BG2 scroll)
    dl $7E09C2 : db $02 : dw $0228 ; Health
    dl $7E09CE : db $02 : dw $0000 ; Pbs
    dl $7E0AF6 : db $02 : dw $0265 ; Samus X
    dl $7E0AFA : db $02 : dw $05BB ; Samus Y
    dl $7ED826 : db $02 : dw $01A7 ; Events, Items, Doors
    dl $7ED8A2 : db $02 : dw $620C ; Events, Items, Doors
    dl $7ED91A : db $02 : dw $010E ; Events, Items, Doors
    dw #$FFFF
.after

preset_redesign_cleanup_water_room_2:
    dw #preset_redesign_cleanup_spike_guardian ; Cleanup: Spike Guardian
    dl $7E078D : db $02 : dw $9096 ; DDB
    dl $7E079B : db $02 : dw $A408 ; MDB
    dl $7E090F : db $02 : dw $2800 ; Screen subpixel X position.
    dl $7E0911 : db $02 : dw $0000 ; Screen X position in pixels
    dl $7E0915 : db $02 : dw $013E ; Screen Y position in pixels
    dl $7E0917 : db $02 : dw $0000 ; Layer 2 X scroll in room in pixels?
    dl $7E0919 : db $02 : dw $00EE ; Layer 2 Y scroll in room in pixels? (up = positive)
    dl $7E09C2 : db $02 : dw $01AC ; Health
    dl $7E0A1C : db $02 : dw $0002 ; Samus position/state
    dl $7E0A1E : db $02 : dw $0004 ; More position/state
    dl $7E0AF6 : db $02 : dw $004D ; Samus X
    dl $7E0AFA : db $02 : dw $01A9 ; Samus Y
    dl $7ED826 : db $02 : dw $01B7 ; Events, Items, Doors
    dw #$FFFF
.after

preset_redesign_cleanup_norfair_elevator_left_2:
    dw #preset_redesign_cleanup_water_room_2 ; Cleanup: Water Room 2
    dl $7E078D : db $02 : dw $914A ; DDB
    dl $7E078F : db $02 : dw $0003 ; DoorOut Index
    dl $7E079B : db $02 : dw $A6A1 ; MDB
    dl $7E07F5 : db $02 : dw $0003 ; Music Track
    dl $7E090F : db $02 : dw $0000 ; Screen subpixel X position.
    dl $7E0911 : db $02 : dw $0100 ; Screen X position in pixels
    dl $7E0913 : db $02 : dw $7C00 ; Screen subpixel Y position
    dl $7E0915 : db $02 : dw $0000 ; Screen Y position in pixels
    dl $7E0917 : db $02 : dw $0100 ; Layer 2 X scroll in room in pixels?
    dl $7E0919 : db $02 : dw $0000 ; Layer 2 Y scroll in room in pixels? (up = positive)
    dl $7E0923 : db $02 : dw $0000 ; BG2 Y scroll offset due to room transitions (Translates between Layer 2 scroll and BG2 scroll)
    dl $7E09C2 : db $02 : dw $01B1 ; Health
    dl $7E0A1C : db $02 : dw $0001 ; Samus position/state
    dl $7E0A1E : db $02 : dw $0008 ; More position/state
    dl $7E0A68 : db $02 : dw $0063 ; Flash suit
    dl $7E0AF6 : db $02 : dw $0187 ; Samus X
    dl $7E0AFA : db $02 : dw $008B ; Samus Y
    dl $7ED91A : db $02 : dw $0118 ; Events, Items, Doors
    dw #$FFFF
.after

preset_redesign_cleanup_lag_farm:
    dw #preset_redesign_cleanup_norfair_elevator_left_2 ; Cleanup: Norfair Elevator Left
    dl $7E078D : db $02 : dw $9852 ; DDB
    dl $7E078F : db $02 : dw $0000 ; DoorOut Index
    dl $7E079B : db $02 : dw $A815 ; MDB
    dl $7E079F : db $02 : dw $0002 ; Region
    dl $7E07C3 : db $02 : dw $C3F9 ; GFX Pointers
    dl $7E07C5 : db $02 : dw $E4BD ; GFX Pointers
    dl $7E07C7 : db $02 : dw $C2B5 ; GFX Pointers
    dl $7E07F3 : db $02 : dw $0015 ; Music Bank
    dl $7E07F5 : db $02 : dw $0005 ; Music Track
    dl $7E090F : db $02 : dw $BC00 ; Screen subpixel X position.
    dl $7E0911 : db $02 : dw $0171 ; Screen X position in pixels
    dl $7E0913 : db $02 : dw $0000 ; Screen subpixel Y position
    dl $7E0915 : db $02 : dw $03F5 ; Screen Y position in pixels
    dl $7E0917 : db $02 : dw $0114 ; Layer 2 X scroll in room in pixels?
    dl $7E0919 : db $02 : dw $02F7 ; Layer 2 Y scroll in room in pixels? (up = positive)
    dl $7E0921 : db $02 : dw $FA00 ; BG2 X scroll offset due to room transitions (Translates between Layer 2 scroll and BG2 scroll)
    dl $7E0923 : db $02 : dw $FC00 ; BG2 Y scroll offset due to room transitions (Translates between Layer 2 scroll and BG2 scroll)
    dl $7E09A6 : db $02 : dw $1004 ; Beams
    dl $7E09C2 : db $02 : dw $016E ; Health
    dl $7E0A1C : db $02 : dw $0002 ; Samus position/state
    dl $7E0A1E : db $02 : dw $0004 ; More position/state
    dl $7E0AF6 : db $02 : dw $01D3 ; Samus X
    dl $7E0AFA : db $02 : dw $0485 ; Samus Y
    dl $7ED91A : db $02 : dw $0119 ; Events, Items, Doors
    dw #$FFFF
.after

preset_redesign_cleanup_lava_blockades:
    dw #preset_redesign_cleanup_lag_farm ; Cleanup: Lag Farm
    dl $7E078D : db $02 : dw $AEC1 ; DDB
    dl $7E078F : db $02 : dw $0002 ; DoorOut Index
    dl $7E079B : db $02 : dw $A8F8 ; MDB
    dl $7E090F : db $02 : dw $9B00 ; Screen subpixel X position.
    dl $7E0911 : db $02 : dw $003D ; Screen X position in pixels
    dl $7E0915 : db $02 : dw $0832 ; Screen Y position in pixels
    dl $7E0917 : db $02 : dw $002D ; Layer 2 X scroll in room in pixels?
    dl $7E0919 : db $02 : dw $0625 ; Layer 2 Y scroll in room in pixels? (up = positive)
    dl $7E0921 : db $02 : dw $FE00 ; BG2 X scroll offset due to room transitions (Translates between Layer 2 scroll and BG2 scroll)
    dl $7E0923 : db $02 : dw $0000 ; BG2 Y scroll offset due to room transitions (Translates between Layer 2 scroll and BG2 scroll)
    dl $7E09C2 : db $02 : dw $022A ; Health
    dl $7E09C6 : db $02 : dw $0023 ; Missiles
    dl $7E09CE : db $02 : dw $0004 ; Pbs
    dl $7E0A1C : db $02 : dw $0001 ; Samus position/state
    dl $7E0A1E : db $02 : dw $0008 ; More position/state
    dl $7E0A68 : db $02 : dw $0000 ; Flash suit
    dl $7E0AF6 : db $02 : dw $00D2 ; Samus X
    dl $7E0AFA : db $02 : dw $08B2 ; Samus Y
    dw #$FFFF
.after

preset_redesign_cleanup_lava_guardian_2:
    dw #preset_redesign_cleanup_lava_blockades ; Cleanup: Lava Blockades
    dl $7E078D : db $02 : dw $9396 ; DDB
    dl $7E078F : db $02 : dw $0001 ; DoorOut Index
    dl $7E079B : db $02 : dw $AFA3 ; MDB
    dl $7E090F : db $02 : dw $6800 ; Screen subpixel X position.
    dl $7E0911 : db $02 : dw $0000 ; Screen X position in pixels
    dl $7E0915 : db $02 : dw $0221 ; Screen Y position in pixels
    dl $7E0917 : db $02 : dw $0000 ; Layer 2 X scroll in room in pixels?
    dl $7E0919 : db $02 : dw $0198 ; Layer 2 Y scroll in room in pixels? (up = positive)
    dl $7E0921 : db $02 : dw $0100 ; BG2 X scroll offset due to room transitions (Translates between Layer 2 scroll and BG2 scroll)
    dl $7E09C2 : db $02 : dw $021E ; Health
    dl $7E09CE : db $02 : dw $0001 ; Pbs
    dl $7E0A1C : db $02 : dw $007A ; Samus position/state
    dl $7E0A1E : db $02 : dw $1104 ; More position/state
    dl $7E0AF6 : db $02 : dw $004C ; Samus X
    dl $7E0AFA : db $02 : dw $02AF ; Samus Y
    dl $7ED8A4 : db $02 : dw $0F01 ; Events, Items, Doors
    dw #$FFFF
.after

preset_redesign_cleanup_big_up_spark_2:
    dw #preset_redesign_cleanup_lava_guardian_2 ; Cleanup: Lava Guardian
    dl $7E078D : db $02 : dw $AF5D ; DDB
    dl $7E078F : db $02 : dw $0003 ; DoorOut Index
    dl $7E090F : db $02 : dw $6000 ; Screen subpixel X position.
    dl $7E0915 : db $02 : dw $0000 ; Screen Y position in pixels
    dl $7E0919 : db $02 : dw $0000 ; Layer 2 Y scroll in room in pixels? (up = positive)
    dl $7E0923 : db $02 : dw $FE00 ; BG2 Y scroll offset due to room transitions (Translates between Layer 2 scroll and BG2 scroll)
    dl $7E09C2 : db $02 : dw $0212 ; Health
    dl $7E0A1C : db $02 : dw $0002 ; Samus position/state
    dl $7E0A1E : db $02 : dw $0004 ; More position/state
    dl $7E0AF6 : db $02 : dw $003A ; Samus X
    dl $7E0AFA : db $02 : dw $008B ; Samus Y
    dl $7ED826 : db $02 : dw $01F7 ; Events, Items, Doors
    dw #$FFFF
.after

preset_redesign_cleanup_lag_climb:
    dw #preset_redesign_cleanup_big_up_spark_2 ; Cleanup: Big Up Spark
    dl $7E078D : db $02 : dw $9732 ; DDB
    dl $7E078F : db $02 : dw $0000 ; DoorOut Index
    dl $7E079B : db $02 : dw $A8F8 ; MDB
    dl $7E090F : db $02 : dw $D980 ; Screen subpixel X position.
    dl $7E0911 : db $02 : dw $0100 ; Screen X position in pixels
    dl $7E0915 : db $02 : dw $002C ; Screen Y position in pixels
    dl $7E0917 : db $02 : dw $00C0 ; Layer 2 X scroll in room in pixels?
    dl $7E0919 : db $02 : dw $0021 ; Layer 2 Y scroll in room in pixels? (up = positive)
    dl $7E0921 : db $02 : dw $FC00 ; BG2 X scroll offset due to room transitions (Translates between Layer 2 scroll and BG2 scroll)
    dl $7E0923 : db $02 : dw $F800 ; BG2 Y scroll offset due to room transitions (Translates between Layer 2 scroll and BG2 scroll)
    dl $7E09C2 : db $02 : dw $01A8 ; Health
    dl $7E0A1C : db $02 : dw $0001 ; Samus position/state
    dl $7E0A1E : db $02 : dw $0008 ; More position/state
    dl $7E0AF6 : db $02 : dw $018F ; Samus X
    dl $7E0AFA : db $02 : dw $00AB ; Samus Y
    dw #$FFFF
.after

preset_redesign_cleanup_tube_clip:
    dw #preset_redesign_cleanup_lag_climb ; Cleanup: Lag Climb
    dl $7E078D : db $02 : dw $9402 ; DDB
    dl $7E079B : db $02 : dw $BF9E ; MDB
    dl $7E090F : db $02 : dw $B000 ; Screen subpixel X position.
    dl $7E0911 : db $02 : dw $0000 ; Screen X position in pixels
    dl $7E0915 : db $02 : dw $0000 ; Screen Y position in pixels
    dl $7E0917 : db $02 : dw $0000 ; Layer 2 X scroll in room in pixels?
    dl $7E0919 : db $02 : dw $0000 ; Layer 2 Y scroll in room in pixels? (up = positive)
    dl $7E0921 : db $02 : dw $FF00 ; BG2 X scroll offset due to room transitions (Translates between Layer 2 scroll and BG2 scroll)
    dl $7E0923 : db $02 : dw $FE00 ; BG2 Y scroll offset due to room transitions (Translates between Layer 2 scroll and BG2 scroll)
    dl $7E09C2 : db $02 : dw $01E4 ; Health
    dl $7E09CE : db $02 : dw $0004 ; Pbs
    dl $7E0A1C : db $02 : dw $0002 ; Samus position/state
    dl $7E0A1E : db $02 : dw $0004 ; More position/state
    dl $7E0AF6 : db $02 : dw $0026 ; Samus X
    dl $7E0AFA : db $02 : dw $008B ; Samus Y
    dl $7ED8B8 : db $02 : dw $8125 ; Events, Items, Doors
    dl $7ED91A : db $02 : dw $011A ; Events, Items, Doors
    dw #$FFFF
.after

preset_redesign_cleanup_big_pink_2:
    dw #preset_redesign_cleanup_tube_clip ; Cleanup: Tube Clip
    dl $7E078D : db $02 : dw $AEA9 ; DDB
    dl $7E079B : db $02 : dw $A07B ; MDB
    dl $7E079F : db $02 : dw $0001 ; Region
    dl $7E07C3 : db $02 : dw $B130 ; GFX Pointers
    dl $7E07C5 : db $02 : dw $3CBE ; GFX Pointers
    dl $7E07C7 : db $02 : dw $C2B8 ; GFX Pointers
    dl $7E07F3 : db $02 : dw $000F ; Music Bank
    dl $7E090F : db $02 : dw $9000 ; Screen subpixel X position.
    dl $7E0911 : db $02 : dw $0200 ; Screen X position in pixels
    dl $7E0915 : db $02 : dw $001D ; Screen Y position in pixels
    dl $7E0917 : db $02 : dw $0180 ; Layer 2 X scroll in room in pixels?
    dl $7E0919 : db $02 : dw $0015 ; Layer 2 Y scroll in room in pixels? (up = positive)
    dl $7E0921 : db $02 : dw $FC00 ; BG2 X scroll offset due to room transitions (Translates between Layer 2 scroll and BG2 scroll)
    dl $7E0923 : db $02 : dw $FC00 ; BG2 Y scroll offset due to room transitions (Translates between Layer 2 scroll and BG2 scroll)
    dl $7E09C6 : db $02 : dw $002D ; Missiles
    dl $7E09C8 : db $02 : dw $002D ; Max missiles
    dl $7E0AF6 : db $02 : dw $0268 ; Samus X
    dl $7ED874 : db $02 : dw $B2A4 ; Events, Items, Doors
    dl $7ED91A : db $02 : dw $011B ; Events, Items, Doors
    dw #$FFFF
.after

preset_redesign_cleanup_overhead_blockade:
    dw #preset_redesign_cleanup_big_pink_2 ; Cleanup: Big Pink
    dl $7E078D : db $02 : dw $8DEA ; DDB
    dl $7E078F : db $02 : dw $0003 ; DoorOut Index
    dl $7E079B : db $02 : dw $9AD9 ; MDB
    dl $7E07C3 : db $02 : dw $E6B0 ; GFX Pointers
    dl $7E07C5 : db $02 : dw $64BB ; GFX Pointers
    dl $7E07C7 : db $02 : dw $C2B2 ; GFX Pointers
    dl $7E090F : db $02 : dw $8000 ; Screen subpixel X position.
    dl $7E0911 : db $02 : dw $01C0 ; Screen X position in pixels
    dl $7E0913 : db $02 : dw $0800 ; Screen subpixel Y position
    dl $7E0915 : db $02 : dw $0500 ; Screen Y position in pixels
    dl $7E0917 : db $02 : dw $0150 ; Layer 2 X scroll in room in pixels?
    dl $7E0919 : db $02 : dw $03C0 ; Layer 2 Y scroll in room in pixels? (up = positive)
    dl $7E0921 : db $02 : dw $0100 ; BG2 X scroll offset due to room transitions (Translates between Layer 2 scroll and BG2 scroll)
    dl $7E0923 : db $02 : dw $FB00 ; BG2 Y scroll offset due to room transitions (Translates between Layer 2 scroll and BG2 scroll)
    dl $7E09C2 : db $02 : dw $01E8 ; Health
    dl $7E0A1C : db $02 : dw $0001 ; Samus position/state
    dl $7E0A1E : db $02 : dw $0008 ; More position/state
    dl $7E0AF6 : db $02 : dw $025E ; Samus X
    dl $7E0AFA : db $02 : dw $059B ; Samus Y
    dl $7ED91A : db $02 : dw $0123 ; Events, Items, Doors
    dw #$FFFF
.after

preset_redesign_cleanup_pb_backroom:
    dw #preset_redesign_cleanup_overhead_blockade ; Cleanup: Overhead Blockade
    dl $7E078D : db $02 : dw $C428 ; DDB
    dl $7E078F : db $02 : dw $0000 ; DoorOut Index
    dl $7E090F : db $02 : dw $A000 ; Screen subpixel X position.
    dl $7E0911 : db $02 : dw $0700 ; Screen X position in pixels
    dl $7E0913 : db $02 : dw $0000 ; Screen subpixel Y position
    dl $7E0915 : db $02 : dw $032B ; Screen Y position in pixels
    dl $7E0917 : db $02 : dw $0540 ; Layer 2 X scroll in room in pixels?
    dl $7E0919 : db $02 : dw $0260 ; Layer 2 Y scroll in room in pixels? (up = positive)
    dl $7E0921 : db $02 : dw $F800 ; BG2 X scroll offset due to room transitions (Translates between Layer 2 scroll and BG2 scroll)
    dl $7E0923 : db $02 : dw $FD00 ; BG2 Y scroll offset due to room transitions (Translates between Layer 2 scroll and BG2 scroll)
    dl $7E09C2 : db $02 : dw $01DC ; Health
    dl $7E09CE : db $02 : dw $0003 ; Pbs
    dl $7E0AF6 : db $02 : dw $077D ; Samus X
    dl $7E0AFA : db $02 : dw $039B ; Samus Y
    dl $7ED91A : db $02 : dw $0131 ; Events, Items, Doors
    dw #$FFFF
.after

preset_redesign_cleanup_hopper_kill_room:
    dw #preset_redesign_cleanup_pb_backroom ; Cleanup: PB Backroom
    dl $7E078D : db $02 : dw $95B2 ; DDB
    dl $7E078F : db $02 : dw $0001 ; DoorOut Index
    dl $7E079B : db $02 : dw $A734 ; MDB
    dl $7E090F : db $02 : dw $9C00 ; Screen subpixel X position.
    dl $7E0911 : db $02 : dw $0400 ; Screen X position in pixels
    dl $7E0913 : db $02 : dw $D400 ; Screen subpixel Y position
    dl $7E0915 : db $02 : dw $001A ; Screen Y position in pixels
    dl $7E0917 : db $02 : dw $0300 ; Layer 2 X scroll in room in pixels?
    dl $7E0919 : db $02 : dw $0013 ; Layer 2 Y scroll in room in pixels? (up = positive)
    dl $7E0923 : db $02 : dw $FF00 ; BG2 Y scroll offset due to room transitions (Translates between Layer 2 scroll and BG2 scroll)
    dl $7E09C2 : db $02 : dw $01E9 ; Health
    dl $7E09C6 : db $02 : dw $000F ; Missiles
    dl $7E09CA : db $02 : dw $0002 ; Supers
    dl $7E09CE : db $02 : dw $0005 ; Pbs
    dl $7E09D0 : db $02 : dw $0005 ; Max pbs
    dl $7E0AF6 : db $02 : dw $04AB ; Samus X
    dl $7E0AFA : db $02 : dw $0090 ; Samus Y
    dl $7ED874 : db $02 : dw $B2B4 ; Events, Items, Doors
    dl $7ED8AC : db $02 : dw $0650 ; Events, Items, Doors
    dl $7ED8B4 : db $02 : dw $E877 ; Events, Items, Doors
    dl $7ED8B6 : db $02 : dw $8C0A ; Events, Items, Doors
    dl $7ED8DC : db $02 : dw $5096 ; Events, Items, Doors
    dl $7ED8DE : db $02 : dw $A040 ; Events, Items, Doors
    dl $7ED91A : db $02 : dw $0132 ; Events, Items, Doors
    dw #$FFFF
.after

preset_redesign_cleanup_dachora_reverse_spark:
    dw #preset_redesign_cleanup_hopper_kill_room ; Cleanup: Hopper Kill Room
    dl $7E078D : db $02 : dw $C440 ; DDB
    dl $7E078F : db $02 : dw $0002 ; DoorOut Index
    dl $7E090F : db $02 : dw $5000 ; Screen subpixel X position.
    dl $7E0913 : db $02 : dw $5400 ; Screen subpixel Y position
    dl $7E0915 : db $02 : dw $0100 ; Screen Y position in pixels
    dl $7E0919 : db $02 : dw $00C0 ; Layer 2 Y scroll in room in pixels? (up = positive)
    dl $7E0921 : db $02 : dw $FB00 ; BG2 X scroll offset due to room transitions (Translates between Layer 2 scroll and BG2 scroll)
    dl $7E0923 : db $02 : dw $0000 ; BG2 Y scroll offset due to room transitions (Translates between Layer 2 scroll and BG2 scroll)
    dl $7E09C6 : db $02 : dw $0013 ; Missiles
    dl $7E09CA : db $02 : dw $0005 ; Supers
    dl $7E0A1C : db $02 : dw $0002 ; Samus position/state
    dl $7E0A1E : db $02 : dw $0004 ; More position/state
    dl $7E0AF6 : db $02 : dw $0479 ; Samus X
    dl $7E0AFA : db $02 : dw $018B ; Samus Y
    dl $7ED826 : db $02 : dw $01FF ; Events, Items, Doors
    dl $7ED8CE : db $02 : dw $0002 ; Events, Items, Doors
    dl $7ED91A : db $02 : dw $0134 ; Events, Items, Doors
    dw #$FFFF
.after

preset_redesign_cleanup_hopper_hellway_2:
    dw #preset_redesign_cleanup_dachora_reverse_spark ; Cleanup: Dachora Reverse Spark
    dl $7E078D : db $02 : dw $C428 ; DDB
    dl $7E078F : db $02 : dw $0000 ; DoorOut Index
    dl $7E079B : db $02 : dw $9AD9 ; MDB
    dl $7E090F : db $02 : dw $8000 ; Screen subpixel X position.
    dl $7E0911 : db $02 : dw $06C6 ; Screen X position in pixels
    dl $7E0913 : db $02 : dw $9200 ; Screen subpixel Y position
    dl $7E0915 : db $02 : dw $0145 ; Screen Y position in pixels
    dl $7E0917 : db $02 : dw $0514 ; Layer 2 X scroll in room in pixels?
    dl $7E0919 : db $02 : dw $00F3 ; Layer 2 Y scroll in room in pixels? (up = positive)
    dl $7E0921 : db $02 : dw $F800 ; BG2 X scroll offset due to room transitions (Translates between Layer 2 scroll and BG2 scroll)
    dl $7E0923 : db $02 : dw $FD00 ; BG2 Y scroll offset due to room transitions (Translates between Layer 2 scroll and BG2 scroll)
    dl $7E09C2 : db $02 : dw $01AC ; Health
    dl $7E0A1C : db $02 : dw $0001 ; Samus position/state
    dl $7E0A1E : db $02 : dw $0008 ; More position/state
    dl $7E0AF6 : db $02 : dw $079E ; Samus X
    dl $7E0AFA : db $02 : dw $018B ; Samus Y
    dl $7ED8A0 : db $02 : dw $0974 ; Events, Items, Doors
    dl $7ED91A : db $02 : dw $013B ; Events, Items, Doors
    dw #$FFFF
.after

preset_redesign_cleanup_broken_tube:
    dw #preset_redesign_cleanup_hopper_hellway_2 ; Cleanup: Hopper Hellway
    dl $7E078D : db $02 : dw $AF2D ; DDB
    dl $7E078F : db $02 : dw $0002 ; DoorOut Index
    dl $7E079B : db $02 : dw $D21C ; MDB
    dl $7E079F : db $02 : dw $0004 ; Region
    dl $7E07C3 : db $02 : dw $B130 ; GFX Pointers
    dl $7E07C5 : db $02 : dw $3CBE ; GFX Pointers
    dl $7E07C7 : db $02 : dw $C2B8 ; GFX Pointers
    dl $7E07F3 : db $02 : dw $001B ; Music Bank
    dl $7E07F5 : db $02 : dw $0006 ; Music Track
    dl $7E090F : db $02 : dw $3400 ; Screen subpixel X position.
    dl $7E0911 : db $02 : dw $0000 ; Screen X position in pixels
    dl $7E0913 : db $02 : dw $C800 ; Screen subpixel Y position
    dl $7E0915 : db $02 : dw $0000 ; Screen Y position in pixels
    dl $7E0917 : db $02 : dw $0000 ; Layer 2 X scroll in room in pixels?
    dl $7E0919 : db $02 : dw $0000 ; Layer 2 Y scroll in room in pixels? (up = positive)
    dl $7E0921 : db $02 : dw $0100 ; BG2 X scroll offset due to room transitions (Translates between Layer 2 scroll and BG2 scroll)
    dl $7E0923 : db $02 : dw $0000 ; BG2 Y scroll offset due to room transitions (Translates between Layer 2 scroll and BG2 scroll)
    dl $7E09C2 : db $02 : dw $01D2 ; Health
    dl $7E09CA : db $02 : dw $0008 ; Supers
    dl $7E09CE : db $02 : dw $0004 ; Pbs
    dl $7E0AF6 : db $02 : dw $008F ; Samus X
    dl $7E0AFA : db $02 : dw $00BB ; Samus Y
    dl $7ED8A0 : db $02 : dw $09C4 ; Events, Items, Doors
    dw #$FFFF
.after

preset_redesign_draygon_speedysupers:
    dw #preset_redesign_cleanup_broken_tube ; Cleanup: Broken Tube
    dl $7E078D : db $02 : dw $B880 ; DDB
    dl $7E078F : db $02 : dw $0003 ; DoorOut Index
    dl $7E079B : db $02 : dw $CED2 ; MDB
    dl $7E090F : db $02 : dw $D000 ; Screen subpixel X position.
    dl $7E0911 : db $02 : dw $0C00 ; Screen X position in pixels
    dl $7E0913 : db $02 : dw $2E00 ; Screen subpixel Y position
    dl $7E0915 : db $02 : dw $0100 ; Screen Y position in pixels
    dl $7E0917 : db $02 : dw $09C0 ; Layer 2 X scroll in room in pixels?
    dl $7E0919 : db $02 : dw $0100 ; Layer 2 Y scroll in room in pixels? (up = positive)
    dl $7E0921 : db $02 : dw $FA00 ; BG2 X scroll offset due to room transitions (Translates between Layer 2 scroll and BG2 scroll)
    dl $7E09C2 : db $02 : dw $01E6 ; Health
    dl $7E0AF6 : db $02 : dw $0CB9 ; Samus X
    dl $7E0AFA : db $02 : dw $01B0 ; Samus Y
    dl $7ED91A : db $02 : dw $013D ; Events, Items, Doors
    dw #$FFFF
.after

preset_redesign_draygon_mochtroids:
    dw #preset_redesign_draygon_speedysupers ; Draygon: SpeedySupers
    dl $7E078D : db $02 : dw $B8C8 ; DDB
    dl $7E079B : db $02 : dw $CF80 ; MDB
    dl $7E090F : db $02 : dw $5000 ; Screen subpixel X position.
    dl $7E0911 : db $02 : dw $0700 ; Screen X position in pixels
    dl $7E0913 : db $02 : dw $D400 ; Screen subpixel Y position
    dl $7E0915 : db $02 : dw $001B ; Screen Y position in pixels
    dl $7E0917 : db $02 : dw $05B0 ; Layer 2 X scroll in room in pixels?
    dl $7E0919 : db $02 : dw $0014 ; Layer 2 Y scroll in room in pixels? (up = positive)
    dl $7E0921 : db $02 : dw $0100 ; BG2 X scroll offset due to room transitions (Translates between Layer 2 scroll and BG2 scroll)
    dl $7E09C6 : db $02 : dw $000E ; Missiles
    dl $7E09CA : db $02 : dw $000A ; Supers
    dl $7E09CC : db $02 : dw $000A ; Max supers
    dl $7E0AF6 : db $02 : dw $07BF ; Samus X
    dl $7E0AFA : db $02 : dw $009B ; Samus Y
    dl $7ED87C : db $02 : dw $1202 ; Events, Items, Doors
    dl $7ED8AA : db $02 : dw $8080 ; Events, Items, Doors
    dl $7ED8C0 : db $02 : dw $1141 ; Events, Items, Doors
    dl $7ED91A : db $02 : dw $013E ; Events, Items, Doors
    dw #$FFFF
.after

preset_redesign_draygon_bomb_block_tunnel:
    dw #preset_redesign_draygon_mochtroids ; Draygon: Mochtroids
    dl $7E078D : db $02 : dw $A42C ; DDB
    dl $7E078F : db $02 : dw $0000 ; DoorOut Index
    dl $7E079B : db $02 : dw $D765 ; MDB
    dl $7E090F : db $02 : dw $9000 ; Screen subpixel X position.
    dl $7E0911 : db $02 : dw $0000 ; Screen X position in pixels
    dl $7E0913 : db $02 : dw $E800 ; Screen subpixel Y position
    dl $7E0915 : db $02 : dw $0000 ; Screen Y position in pixels
    dl $7E0917 : db $02 : dw $0000 ; Layer 2 X scroll in room in pixels?
    dl $7E0919 : db $02 : dw $0000 ; Layer 2 Y scroll in room in pixels? (up = positive)
    dl $7E09C6 : db $02 : dw $0018 ; Missiles
    dl $7E09C8 : db $02 : dw $0037 ; Max missiles
    dl $7E09CA : db $02 : dw $0009 ; Supers
    dl $7E09CE : db $02 : dw $0005 ; Pbs
    dl $7E0AF6 : db $02 : dw $0083 ; Samus X
    dl $7ED87C : db $02 : dw $9202 ; Events, Items, Doors
    dl $7ED8C0 : db $02 : dw $1151 ; Events, Items, Doors
    dl $7ED91A : db $02 : dw $0140 ; Events, Items, Doors
    dw #$FFFF
.after

preset_redesign_draygon_beam_combo_ggg:
    dw #preset_redesign_draygon_bomb_block_tunnel ; Draygon: Bomb Block Tunnel
    dl $7E078D : db $02 : dw $A864 ; DDB
    dl $7E078F : db $02 : dw $0002 ; DoorOut Index
    dl $7E079B : db $02 : dw $D78F ; MDB
    dl $7E090F : db $02 : dw $3000 ; Screen subpixel X position.
    dl $7E0911 : db $02 : dw $0525 ; Screen X position in pixels
    dl $7E0913 : db $02 : dw $0000 ; Screen subpixel Y position
    dl $7E0917 : db $02 : dw $03DB ; Layer 2 X scroll in room in pixels?
    dl $7E0923 : db $02 : dw $FF00 ; BG2 Y scroll offset due to room transitions (Translates between Layer 2 scroll and BG2 scroll)
    dl $7E09C2 : db $02 : dw $01FA ; Health
    dl $7E0A1C : db $02 : dw $0002 ; Samus position/state
    dl $7E0A1E : db $02 : dw $0004 ; More position/state
    dl $7E0AF6 : db $02 : dw $0596 ; Samus X
    dl $7E0AFA : db $02 : dw $008B ; Samus Y
    dl $7ED91A : db $02 : dw $0141 ; Events, Items, Doors
    dw #$FFFF
.after

preset_redesign_draygon_falling_sand_climb:
    dw #preset_redesign_draygon_beam_combo_ggg ; Draygon: Beam Combo GGG
    dl $7E078D : db $02 : dw $A900 ; DDB
    dl $7E078F : db $02 : dw $0003 ; DoorOut Index
    dl $7E079B : db $02 : dw $D7E4 ; MDB
    dl $7E090F : db $02 : dw $F080 ; Screen subpixel X position.
    dl $7E0911 : db $02 : dw $0000 ; Screen X position in pixels
    dl $7E0913 : db $02 : dw $FA00 ; Screen subpixel Y position
    dl $7E0917 : db $02 : dw $0000 ; Layer 2 X scroll in room in pixels?
    dl $7E0921 : db $02 : dw $FD00 ; BG2 X scroll offset due to room transitions (Translates between Layer 2 scroll and BG2 scroll)
    dl $7E0923 : db $02 : dw $0000 ; BG2 Y scroll offset due to room transitions (Translates between Layer 2 scroll and BG2 scroll)
    dl $7E09C2 : db $02 : dw $01C8 ; Health
    dl $7E09CA : db $02 : dw $0004 ; Supers
    dl $7E0AF6 : db $02 : dw $0032 ; Samus X
    dl $7E0AFA : db $02 : dw $008D ; Samus Y
    dl $7ED8C2 : db $02 : dw $6400 ; Events, Items, Doors
    dl $7ED8DE : db $02 : dw $A041 ; Events, Items, Doors
    dl $7ED91A : db $02 : dw $0143 ; Events, Items, Doors
    dw #$FFFF
.after

preset_redesign_draygon_draygon_2:
    dw #preset_redesign_draygon_falling_sand_climb ; Draygon: Falling Sand Climb
    dl $7E078D : db $02 : dw $A45C ; DDB
    dl $7E078F : db $02 : dw $0004 ; DoorOut Index
    dl $7E079B : db $02 : dw $D9AA ; MDB
    dl $7E07C3 : db $02 : dw $860B ; GFX Pointers
    dl $7E07C5 : db $02 : dw $7BC0 ; GFX Pointers
    dl $7E07C7 : db $02 : dw $C2BD ; GFX Pointers
    dl $7E07F5 : db $02 : dw $0004 ; Music Track
    dl $7E090F : db $02 : dw $9000 ; Screen subpixel X position.
    dl $7E0911 : db $02 : dw $0100 ; Screen X position in pixels
    dl $7E0913 : db $02 : dw $1C00 ; Screen subpixel Y position
    dl $7E0915 : db $02 : dw $011F ; Screen Y position in pixels
    dl $7E0917 : db $02 : dw $00C0 ; Layer 2 X scroll in room in pixels?
    dl $7E0919 : db $02 : dw $00D7 ; Layer 2 Y scroll in room in pixels? (up = positive)
    dl $7E0921 : db $02 : dw $FB00 ; BG2 X scroll offset due to room transitions (Translates between Layer 2 scroll and BG2 scroll)
    dl $7E09C6 : db $02 : dw $0004 ; Missiles
    dl $7E09CA : db $02 : dw $0003 ; Supers
    dl $7E09CE : db $02 : dw $0004 ; Pbs
    dl $7E0A1C : db $02 : dw $0001 ; Samus position/state
    dl $7E0A1E : db $02 : dw $0008 ; More position/state
    dl $7E0AF6 : db $02 : dw $01C9 ; Samus X
    dl $7E0AFA : db $02 : dw $019F ; Samus Y
    dl $7ED8AA : db $02 : dw $8180 ; Events, Items, Doors
    dl $7ED8C2 : db $02 : dw $6C00 ; Events, Items, Doors
    dl $7ED91A : db $02 : dw $0144 ; Events, Items, Doors
    dw #$FFFF
.after

preset_redesign_draygon_sandfall_fall:
    dw #preset_redesign_draygon_draygon_2 ; Draygon: Draygon
    dl $7E078D : db $02 : dw $A96C ; DDB
    dl $7E078F : db $02 : dw $0000 ; DoorOut Index
    dl $7E07F3 : db $02 : dw $0024 ; Music Bank
    dl $7E090F : db $02 : dw $D000 ; Screen subpixel X position.
    dl $7E0911 : db $02 : dw $0400 ; Screen X position in pixels
    dl $7E0913 : db $02 : dw $2400 ; Screen subpixel Y position
    dl $7E0915 : db $02 : dw $001F ; Screen Y position in pixels
    dl $7E0917 : db $02 : dw $0300 ; Layer 2 X scroll in room in pixels?
    dl $7E0919 : db $02 : dw $0017 ; Layer 2 Y scroll in room in pixels? (up = positive)
    dl $7E0921 : db $02 : dw $FE00 ; BG2 X scroll offset due to room transitions (Translates between Layer 2 scroll and BG2 scroll)
    dl $7E0923 : db $02 : dw $FF00 ; BG2 Y scroll offset due to room transitions (Translates between Layer 2 scroll and BG2 scroll)
    dl $7E09C2 : db $02 : dw $0108 ; Health
    dl $7E09CA : db $02 : dw $0008 ; Supers
    dl $7E09CE : db $02 : dw $0005 ; Pbs
    dl $7E0AF6 : db $02 : dw $04B9 ; Samus X
    dl $7E0AFA : db $02 : dw $009B ; Samus Y
    dl $7ED82C : db $02 : dw $E003 ; Events, Items, Doors
    dw #$FFFF
.after

preset_redesign_draygon_spacefishjump:
    dw #preset_redesign_draygon_sandfall_fall ; Draygon: Sandfall Fall
    dl $7E078D : db $02 : dw $BED0 ; DDB
    dl $7E079B : db $02 : dw $D0B9 ; MDB
    dl $7E07C3 : db $02 : dw $B130 ; GFX Pointers
    dl $7E07C5 : db $02 : dw $3CBE ; GFX Pointers
    dl $7E07C7 : db $02 : dw $C2B8 ; GFX Pointers
    dl $7E07F3 : db $02 : dw $001B ; Music Bank
    dl $7E07F5 : db $02 : dw $0006 ; Music Track
    dl $7E090F : db $02 : dw $7000 ; Screen subpixel X position.
    dl $7E0911 : db $02 : dw $0200 ; Screen X position in pixels
    dl $7E0913 : db $02 : dw $7800 ; Screen subpixel Y position
    dl $7E0915 : db $02 : dw $07F8 ; Screen Y position in pixels
    dl $7E0917 : db $02 : dw $0180 ; Layer 2 X scroll in room in pixels?
    dl $7E0919 : db $02 : dw $05FA ; Layer 2 Y scroll in room in pixels? (up = positive)
    dl $7E0921 : db $02 : dw $0100 ; BG2 X scroll offset due to room transitions (Translates between Layer 2 scroll and BG2 scroll)
    dl $7E0923 : db $02 : dw $0000 ; BG2 Y scroll offset due to room transitions (Translates between Layer 2 scroll and BG2 scroll)
    dl $7E09C2 : db $02 : dw $00E0 ; Health
    dl $7E0AF6 : db $02 : dw $02D7 ; Samus X
    dl $7E0AFA : db $02 : dw $088B ; Samus Y
    dl $7ED91A : db $02 : dw $0145 ; Events, Items, Doors
    dw #$FFFF
.after

preset_redesign_draygon_towards_shutter_switch:
    dw #preset_redesign_draygon_spacefishjump ; Draygon: SpaceFishJump
    dl $7E078D : db $02 : dw $A78C ; DDB
    dl $7E078F : db $02 : dw $0001 ; DoorOut Index
    dl $7E079B : db $02 : dw $D69A ; MDB
    dl $7E090F : db $02 : dw $C000 ; Screen subpixel X position.
    dl $7E0911 : db $02 : dw $0900 ; Screen X position in pixels
    dl $7E0913 : db $02 : dw $0000 ; Screen subpixel Y position
    dl $7E0915 : db $02 : dw $0219 ; Screen Y position in pixels
    dl $7E0917 : db $02 : dw $0900 ; Layer 2 X scroll in room in pixels?
    dl $7E0919 : db $02 : dw $0192 ; Layer 2 Y scroll in room in pixels? (up = positive)
    dl $7E0921 : db $02 : dw $FB00 ; BG2 X scroll offset due to room transitions (Translates between Layer 2 scroll and BG2 scroll)
    dl $7E0923 : db $02 : dw $FE00 ; BG2 Y scroll offset due to room transitions (Translates between Layer 2 scroll and BG2 scroll)
    dl $7E09C2 : db $02 : dw $0293 ; Health
    dl $7E09C4 : db $02 : dw $02BB ; Max health
    dl $7E0AF6 : db $02 : dw $09C0 ; Samus X
    dl $7E0AFA : db $02 : dw $028B ; Samus Y
    dl $7ED880 : db $02 : dw $6404 ; Events, Items, Doors
    dl $7ED91A : db $02 : dw $0147 ; Events, Items, Doors
    dw #$FFFF
.after

preset_redesign_draygon_towards_shutter_room:
    dw #preset_redesign_draygon_towards_shutter_switch ; Draygon: Towards Shutter Switch
    dl $7E078D : db $02 : dw $A7A4 ; DDB
    dl $7E078F : db $02 : dw $0003 ; DoorOut Index
    dl $7E090F : db $02 : dw $F000 ; Screen subpixel X position.
    dl $7E0911 : db $02 : dw $0600 ; Screen X position in pixels
    dl $7E0913 : db $02 : dw $FAFF ; Screen subpixel Y position
    dl $7E0915 : db $02 : dw $0214 ; Screen Y position in pixels
    dl $7E0917 : db $02 : dw $0600 ; Layer 2 X scroll in room in pixels?
    dl $7E0919 : db $02 : dw $018F ; Layer 2 Y scroll in room in pixels? (up = positive)
    dl $7E0921 : db $02 : dw $F600 ; BG2 X scroll offset due to room transitions (Translates between Layer 2 scroll and BG2 scroll)
    dl $7E09CA : db $02 : dw $0007 ; Supers
    dl $7E0A1C : db $02 : dw $0002 ; Samus position/state
    dl $7E0A1E : db $02 : dw $0004 ; More position/state
    dl $7E0AF6 : db $02 : dw $0627 ; Samus X
    dl $7ED8D8 : db $02 : dw $1EF0 ; Events, Items, Doors
    dl $7ED91A : db $02 : dw $014A ; Events, Items, Doors
    dw #$FFFF
.after

preset_redesign_draygon_pipes_guardian:
    dw #preset_redesign_draygon_towards_shutter_room ; Draygon: Towards Shutter Room
    dl $7E078D : db $02 : dw $BCC0 ; DDB
    dl $7E079B : db $02 : dw $D646 ; MDB
    dl $7E090F : db $02 : dw $2000 ; Screen subpixel X position.
    dl $7E0911 : db $02 : dw $0200 ; Screen X position in pixels
    dl $7E0913 : db $02 : dw $0000 ; Screen subpixel Y position
    dl $7E0915 : db $02 : dw $000C ; Screen Y position in pixels
    dl $7E0917 : db $02 : dw $0180 ; Layer 2 X scroll in room in pixels?
    dl $7E0919 : db $02 : dw $0009 ; Layer 2 Y scroll in room in pixels? (up = positive)
    dl $7E0921 : db $02 : dw $FF00 ; BG2 X scroll offset due to room transitions (Translates between Layer 2 scroll and BG2 scroll)
    dl $7E09CA : db $02 : dw $0006 ; Supers
    dl $7E0AF6 : db $02 : dw $0247 ; Samus X
    dl $7E0AFA : db $02 : dw $008B ; Samus Y
    dl $7ED8C0 : db $02 : dw $9151 ; Events, Items, Doors
    dl $7ED91A : db $02 : dw $014B ; Events, Items, Doors
    dw #$FFFF
.after

preset_redesign_draygon_mochtroid_spark:
    dw #preset_redesign_draygon_pipes_guardian ; Draygon: Pipes Guardian
    dl $7E078D : db $02 : dw $BCB4 ; DDB
    dl $7E078F : db $02 : dw $0002 ; DoorOut Index
    dl $7E090F : db $02 : dw $F480 ; Screen subpixel X position.
    dl $7E0911 : db $02 : dw $0000 ; Screen X position in pixels
    dl $7E0915 : db $02 : dw $040C ; Screen Y position in pixels
    dl $7E0917 : db $02 : dw $0000 ; Layer 2 X scroll in room in pixels?
    dl $7E0919 : db $02 : dw $0309 ; Layer 2 Y scroll in room in pixels? (up = positive)
    dl $7E09A6 : db $02 : dw $1001 ; Beams
    dl $7E09C2 : db $02 : dw $026B ; Health
    dl $7E0AF6 : db $02 : dw $0030 ; Samus X
    dl $7E0AFA : db $02 : dw $048C ; Samus Y
    dl $7ED826 : db $02 : dw $09FF ; Events, Items, Doors
    dl $7ED8DC : db $02 : dw $7096 ; Events, Items, Doors
    dl $7ED91A : db $02 : dw $014D ; Events, Items, Doors
    dw #$FFFF
.after

preset_redesign_draygon_big_speed_jump:
    dw #preset_redesign_draygon_mochtroid_spark ; Draygon: Mochtroid Spark
    dl $7E078D : db $02 : dw $AF45 ; DDB
    dl $7E078F : db $02 : dw $0004 ; DoorOut Index
    dl $7E079B : db $02 : dw $D104 ; MDB
    dl $7E090F : db $02 : dw $8000 ; Screen subpixel X position.
    dl $7E0915 : db $02 : dw $0009 ; Screen Y position in pixels
    dl $7E0919 : db $02 : dw $0006 ; Layer 2 Y scroll in room in pixels? (up = positive)
    dl $7E0921 : db $02 : dw $FE00 ; BG2 X scroll offset due to room transitions (Translates between Layer 2 scroll and BG2 scroll)
    dl $7E0923 : db $02 : dw $FF00 ; BG2 Y scroll offset due to room transitions (Translates between Layer 2 scroll and BG2 scroll)
    dl $7E09C2 : db $02 : dw $0234 ; Health
    dl $7E09C6 : db $02 : dw $0037 ; Missiles
    dl $7E09CA : db $02 : dw $0008 ; Supers
    dl $7E09CC : db $02 : dw $000B ; Max supers
    dl $7E0AF6 : db $02 : dw $0025 ; Samus X
    dl $7E0AFA : db $02 : dw $008B ; Samus Y
    dl $7ED880 : db $02 : dw $6406 ; Events, Items, Doors
    dl $7ED8A8 : db $02 : dw $9A08 ; Events, Items, Doors
    dl $7ED8AA : db $02 : dw $8181 ; Events, Items, Doors
    dl $7ED91A : db $02 : dw $014E ; Events, Items, Doors
    dw #$FFFF
.after

preset_redesign_draygon_snail_hallway:
    dw #preset_redesign_draygon_big_speed_jump ; Draygon: Big Speed Jump
    dl $7E078D : db $02 : dw $A414 ; DDB
    dl $7E078F : db $02 : dw $0000 ; DoorOut Index
    dl $7E079B : db $02 : dw $CF80 ; MDB
    dl $7E090F : db $02 : dw $0000 ; Screen subpixel X position.
    dl $7E0915 : db $02 : dw $0002 ; Screen Y position in pixels
    dl $7E0919 : db $02 : dw $0001 ; Layer 2 Y scroll in room in pixels? (up = positive)
    dl $7E0921 : db $02 : dw $F800 ; BG2 X scroll offset due to room transitions (Translates between Layer 2 scroll and BG2 scroll)
    dl $7E0923 : db $02 : dw $FE00 ; BG2 Y scroll offset due to room transitions (Translates between Layer 2 scroll and BG2 scroll)
    dl $7E0AF6 : db $02 : dw $0033 ; Samus X
    dl $7ED91A : db $02 : dw $014F ; Events, Items, Doors
    dw #$FFFF
.after

preset_redesign_draygon_ridley_tube_climb:
    dw #preset_redesign_draygon_snail_hallway ; Draygon: Snail Hallway
    dl $7E078D : db $02 : dw $A4C8 ; DDB
    dl $7E078F : db $02 : dw $0002 ; DoorOut Index
    dl $7E079B : db $02 : dw $CED2 ; MDB
    dl $7E090F : db $02 : dw $8800 ; Screen subpixel X position.
    dl $7E0915 : db $02 : dw $00FB ; Screen Y position in pixels
    dl $7E0919 : db $02 : dw $00FB ; Layer 2 Y scroll in room in pixels? (up = positive)
    dl $7E0921 : db $02 : dw $FA00 ; BG2 X scroll offset due to room transitions (Translates between Layer 2 scroll and BG2 scroll)
    dl $7E0923 : db $02 : dw $0000 ; BG2 Y scroll offset due to room transitions (Translates between Layer 2 scroll and BG2 scroll)
    dl $7E09CA : db $02 : dw $0007 ; Supers
    dl $7E0AF6 : db $02 : dw $0063 ; Samus X
    dl $7E0AFA : db $02 : dw $0182 ; Samus Y
    dl $7ED89E : db $02 : dw $0009 ; Events, Items, Doors
    dl $7ED8BE : db $02 : dw $6C16 ; Events, Items, Doors
    dl $7ED91A : db $02 : dw $0152 ; Events, Items, Doors
    dw #$FFFF
.after

preset_redesign_draygon_reserve_upspark:
    dw #preset_redesign_draygon_ridley_tube_climb ; Draygon: Ridley Tube Climb
    dl $7E078D : db $02 : dw $B92C ; DDB
    dl $7E078F : db $02 : dw $0005 ; DoorOut Index
    dl $7E079B : db $02 : dw $D055 ; MDB
    dl $7E07F5 : db $02 : dw $0005 ; Music Track
    dl $7E090F : db $02 : dw $9E00 ; Screen subpixel X position.
    dl $7E0911 : db $02 : dw $0200 ; Screen X position in pixels
    dl $7E0913 : db $02 : dw $FA00 ; Screen subpixel Y position
    dl $7E0915 : db $02 : dw $0000 ; Screen Y position in pixels
    dl $7E0917 : db $02 : dw $0200 ; Layer 2 X scroll in room in pixels?
    dl $7E0919 : db $02 : dw $0000 ; Layer 2 Y scroll in room in pixels? (up = positive)
    dl $7E0921 : db $02 : dw $FF00 ; BG2 X scroll offset due to room transitions (Translates between Layer 2 scroll and BG2 scroll)
    dl $7E09C2 : db $02 : dw $0223 ; Health
    dl $7E0A1C : db $02 : dw $0001 ; Samus position/state
    dl $7E0A1E : db $02 : dw $0008 ; More position/state
    dl $7E0AF6 : db $02 : dw $0264 ; Samus X
    dl $7E0AFA : db $02 : dw $0099 ; Samus Y
    dl $7ED826 : db $02 : dw $0BFF ; Events, Items, Doors
    dl $7ED91A : db $02 : dw $0154 ; Events, Items, Doors
    dw #$FFFF
.after

preset_redesign_draygon_shutter_maze_bottom:
    dw #preset_redesign_draygon_reserve_upspark ; Draygon: Reserve Upspark
    dl $7E078D : db $02 : dw $BC48 ; DDB
    dl $7E079B : db $02 : dw $D2AA ; MDB
    dl $7E07C3 : db $02 : dw $E78D ; GFX Pointers
    dl $7E07C5 : db $02 : dw $2EBE ; GFX Pointers
    dl $7E07C7 : db $02 : dw $C2B9 ; GFX Pointers
    dl $7E090F : db $02 : dw $B000 ; Screen subpixel X position.
    dl $7E0911 : db $02 : dw $0300 ; Screen X position in pixels
    dl $7E0913 : db $02 : dw $4E02 ; Screen subpixel Y position
    dl $7E0915 : db $02 : dw $0200 ; Screen Y position in pixels
    dl $7E0917 : db $02 : dw $0300 ; Layer 2 X scroll in room in pixels?
    dl $7E0919 : db $02 : dw $0200 ; Layer 2 Y scroll in room in pixels? (up = positive)
    dl $7E0921 : db $02 : dw $FD00 ; BG2 X scroll offset due to room transitions (Translates between Layer 2 scroll and BG2 scroll)
    dl $7E0923 : db $02 : dw $FEE0 ; BG2 Y scroll offset due to room transitions (Translates between Layer 2 scroll and BG2 scroll)
    dl $7E09C2 : db $02 : dw $01C7 ; Health
    dl $7E09CA : db $02 : dw $0008 ; Supers
    dl $7E0AF6 : db $02 : dw $03A7 ; Samus X
    dl $7E0AFA : db $02 : dw $025B ; Samus Y
    dl $7ED91A : db $02 : dw $0156 ; Events, Items, Doors
    dw #$FFFF
.after

preset_redesign_draygon_guard_crabs:
    dw #preset_redesign_draygon_shutter_maze_bottom ; Draygon: Shutter Maze Bottom
    dl $7E078D : db $02 : dw $A714 ; DDB
    dl $7E078F : db $02 : dw $0001 ; DoorOut Index
    dl $7E079B : db $02 : dw $D387 ; MDB
    dl $7E090F : db $02 : dw $8000 ; Screen subpixel X position.
    dl $7E0913 : db $02 : dw $0000 ; Screen subpixel Y position
    dl $7E0915 : db $02 : dw $0700 ; Screen Y position in pixels
    dl $7E0919 : db $02 : dw $0700 ; Layer 2 Y scroll in room in pixels? (up = positive)
    dl $7E0921 : db $02 : dw $0100 ; BG2 X scroll offset due to room transitions (Translates between Layer 2 scroll and BG2 scroll)
    dl $7E0923 : db $02 : dw $F900 ; BG2 Y scroll offset due to room transitions (Translates between Layer 2 scroll and BG2 scroll)
    dl $7E09C2 : db $02 : dw $01C1 ; Health
    dl $7E09C6 : db $02 : dw $001E ; Missiles
    dl $7E09CA : db $02 : dw $000B ; Supers
    dl $7E0AF6 : db $02 : dw $03D2 ; Samus X
    dl $7E0AFA : db $02 : dw $078B ; Samus Y
    dl $7ED8C0 : db $02 : dw $D151 ; Events, Items, Doors
    dl $7ED8DA : db $02 : dw $8E3C ; Events, Items, Doors
    dl $7ED91A : db $02 : dw $0157 ; Events, Items, Doors
    dw #$FFFF
.after

preset_redesign_draygon_beach_crabs:
    dw #preset_redesign_draygon_guard_crabs ; Draygon: Guard Crabs
    dl $7E078D : db $02 : dw $A72C ; DDB
    dl $7E078F : db $02 : dw $0003 ; DoorOut Index
    dl $7E079B : db $02 : dw $D4C2 ; MDB
    dl $7E07C3 : db $02 : dw $B130 ; GFX Pointers
    dl $7E07C5 : db $02 : dw $3CBE ; GFX Pointers
    dl $7E07C7 : db $02 : dw $C2B8 ; GFX Pointers
    dl $7E090F : db $02 : dw $E000 ; Screen subpixel X position.
    dl $7E0911 : db $02 : dw $0100 ; Screen X position in pixels
    dl $7E0915 : db $02 : dw $000C ; Screen Y position in pixels
    dl $7E0917 : db $02 : dw $00C0 ; Layer 2 X scroll in room in pixels?
    dl $7E0919 : db $02 : dw $0009 ; Layer 2 Y scroll in room in pixels? (up = positive)
    dl $7E0923 : db $02 : dw $FC00 ; BG2 Y scroll offset due to room transitions (Translates between Layer 2 scroll and BG2 scroll)
    dl $7E09CA : db $02 : dw $000A ; Supers
    dl $7E0A1C : db $02 : dw $0002 ; Samus position/state
    dl $7E0A1E : db $02 : dw $0004 ; More position/state
    dl $7E0AF6 : db $02 : dw $0125 ; Samus X
    dl $7E0AFA : db $02 : dw $008B ; Samus Y
    dl $7ED826 : db $02 : dw $0FFF ; Events, Items, Doors
    dl $7ED8DC : db $02 : dw $7896 ; Events, Items, Doors
    dl $7ED91A : db $02 : dw $015A ; Events, Items, Doors
    dw #$FFFF
.after

preset_redesign_tourian_gatekeeper:
    dw #preset_redesign_draygon_beach_crabs ; Draygon: Beach Crabs
    dl $7E078D : db $02 : dw $A654 ; DDB
    dl $7E079B : db $02 : dw $B3E1 ; MDB
    dl $7E07F5 : db $02 : dw $0003 ; Music Track
    dl $7E090F : db $02 : dw $8000 ; Screen subpixel X position.
    dl $7E0911 : db $02 : dw $0000 ; Screen X position in pixels
    dl $7E0915 : db $02 : dw $0100 ; Screen Y position in pixels
    dl $7E0917 : db $02 : dw $0000 ; Layer 2 X scroll in room in pixels?
    dl $7E0919 : db $02 : dw $0100 ; Layer 2 Y scroll in room in pixels? (up = positive)
    dl $7E0923 : db $02 : dw $FF00 ; BG2 Y scroll offset due to room transitions (Translates between Layer 2 scroll and BG2 scroll)
    dl $7E09C2 : db $02 : dw $01D5 ; Health
    dl $7E0A1C : db $02 : dw $0001 ; Samus position/state
    dl $7E0A1E : db $02 : dw $0008 ; More position/state
    dl $7E0AF6 : db $02 : dw $00C9 ; Samus X
    dl $7E0AFA : db $02 : dw $018B ; Samus Y
    dl $7ED91A : db $02 : dw $015B ; Events, Items, Doors
    dw #$FFFF
.after

preset_redesign_tourian_m1_purple_door_metroids:
    dw #preset_redesign_tourian_gatekeeper ; Tourian: GateKeeper
    dl $7E078D : db $02 : dw $9222 ; DDB
    dl $7E078F : db $02 : dw $0002 ; DoorOut Index
    dl $7E079B : db $02 : dw $A641 ; MDB
    dl $7E07C3 : db $02 : dw $860B ; GFX Pointers
    dl $7E07C5 : db $02 : dw $7BC0 ; GFX Pointers
    dl $7E07C7 : db $02 : dw $C2BD ; GFX Pointers
    dl $7E07F3 : db $02 : dw $0009 ; Music Bank
    dl $7E07F5 : db $02 : dw $0006 ; Music Track
    dl $7E090F : db $02 : dw $5000 ; Screen subpixel X position.
    dl $7E0915 : db $02 : dw $0000 ; Screen Y position in pixels
    dl $7E0919 : db $02 : dw $0000 ; Layer 2 Y scroll in room in pixels? (up = positive)
    dl $7E0923 : db $02 : dw $0000 ; BG2 Y scroll offset due to room transitions (Translates between Layer 2 scroll and BG2 scroll)
    dl $7E09A6 : db $02 : dw $1002 ; Beams
    dl $7E09C6 : db $02 : dw $0019 ; Missiles
    dl $7E09CA : db $02 : dw $0006 ; Supers
    dl $7E0AF6 : db $02 : dw $007D ; Samus X
    dl $7E0AFA : db $02 : dw $008B ; Samus Y
    dl $7ED826 : db $02 : dw $1FFF ; Events, Items, Doors
    dl $7ED8A8 : db $02 : dw $9E08 ; Events, Items, Doors
    dl $7ED8B6 : db $02 : dw $8E0A ; Events, Items, Doors
    dw #$FFFF
.after

preset_redesign_tourian_m2_kill_6:
    dw #preset_redesign_tourian_m1_purple_door_metroids ; Tourian: M1 Purple Door Metroids
    dl $7E078D : db $02 : dw $C3BC ; DDB
    dl $7E079B : db $02 : dw $DAAE ; MDB
    dl $7E079F : db $02 : dw $0005 ; Region
    dl $7E07C3 : db $02 : dw $D414 ; GFX Pointers
    dl $7E07C5 : db $02 : dw $00BF ; GFX Pointers
    dl $7E07C7 : db $02 : dw $CEB5 ; GFX Pointers
    dl $7E07F3 : db $02 : dw $001E ; Music Bank
    dl $7E07F5 : db $02 : dw $0005 ; Music Track
    dl $7E090F : db $02 : dw $3000 ; Screen subpixel X position.
    dl $7E0913 : db $02 : dw $EC00 ; Screen subpixel Y position
    dl $7E0915 : db $02 : dw $0519 ; Screen Y position in pixels
    dl $7E0919 : db $02 : dw $03D2 ; Layer 2 Y scroll in room in pixels? (up = positive)
    dl $7E0921 : db $02 : dw $0000 ; BG2 X scroll offset due to room transitions (Translates between Layer 2 scroll and BG2 scroll)
    dl $7E0923 : db $02 : dw $00E0 ; BG2 Y scroll offset due to room transitions (Translates between Layer 2 scroll and BG2 scroll)
    dl $7E09C2 : db $02 : dw $01D7 ; Health
    dl $7E09C6 : db $02 : dw $000A ; Missiles
    dl $7E09CA : db $02 : dw $0008 ; Supers
    dl $7E0AF6 : db $02 : dw $00CF ; Samus X
    dl $7E0AFA : db $02 : dw $058B ; Samus Y
    dl $7ED90C : db $02 : dw $0100 ; Events, Items, Doors
    dw #$FFFF
.after

preset_redesign_tourian_m3_kill_2:
    dw #preset_redesign_tourian_m2_kill_6 ; Tourian: M2 Kill 6
    dl $7E078D : db $02 : dw $A984 ; DDB
    dl $7E078F : db $02 : dw $0000 ; DoorOut Index
    dl $7E079B : db $02 : dw $DB7D ; MDB
    dl $7E07C5 : db $02 : dw $EDBF ; GFX Pointers
    dl $7E07C7 : db $02 : dw $C2BA ; GFX Pointers
    dl $7E090F : db $02 : dw $8000 ; Screen subpixel X position.
    dl $7E0911 : db $02 : dw $0500 ; Screen X position in pixels
    dl $7E0913 : db $02 : dw $0000 ; Screen subpixel Y position
    dl $7E0915 : db $02 : dw $001D ; Screen Y position in pixels
    dl $7E0917 : db $02 : dw $03C0 ; Layer 2 X scroll in room in pixels?
    dl $7E0919 : db $02 : dw $0015 ; Layer 2 Y scroll in room in pixels? (up = positive)
    dl $7E0921 : db $02 : dw $0100 ; BG2 X scroll offset due to room transitions (Translates between Layer 2 scroll and BG2 scroll)
    dl $7E0923 : db $02 : dw $0000 ; BG2 Y scroll offset due to room transitions (Translates between Layer 2 scroll and BG2 scroll)
    dl $7E09C2 : db $02 : dw $01BA ; Health
    dl $7E09C6 : db $02 : dw $0018 ; Missiles
    dl $7E09CA : db $02 : dw $0006 ; Supers
    dl $7E0AF6 : db $02 : dw $05D6 ; Samus X
    dl $7E0AFA : db $02 : dw $008B ; Samus Y
    dl $7ED8C4 : db $02 : dw $0045 ; Events, Items, Doors
    dw #$FFFF
.after

preset_redesign_tourian_m4_kill_5:
    dw #preset_redesign_tourian_m3_kill_2 ; Tourian: M3 Kill 2
    dl $7E078D : db $02 : dw $A9E4 ; DDB
    dl $7E078F : db $02 : dw $0001 ; DoorOut Index
    dl $7E079B : db $02 : dw $DB31 ; MDB
    dl $7E090F : db $02 : dw $4000 ; Screen subpixel X position.
    dl $7E0911 : db $02 : dw $0000 ; Screen X position in pixels
    dl $7E0913 : db $02 : dw $D400 ; Screen subpixel Y position
    dl $7E0915 : db $02 : dw $0022 ; Screen Y position in pixels
    dl $7E0917 : db $02 : dw $0000 ; Layer 2 X scroll in room in pixels?
    dl $7E0919 : db $02 : dw $0019 ; Layer 2 Y scroll in room in pixels? (up = positive)
    dl $7E0923 : db $02 : dw $FF00 ; BG2 Y scroll offset due to room transitions (Translates between Layer 2 scroll and BG2 scroll)
    dl $7E09C2 : db $02 : dw $0225 ; Health
    dl $7E09C6 : db $02 : dw $0014 ; Missiles
    dl $7E0A1C : db $02 : dw $0002 ; Samus position/state
    dl $7E0A1E : db $02 : dw $0004 ; More position/state
    dl $7E0AF6 : db $02 : dw $0025 ; Samus X
    dl $7ED8C4 : db $02 : dw $0047 ; Events, Items, Doors
    dw #$FFFF
.after

preset_redesign_tourian_m5_kill_6:
    dw #preset_redesign_tourian_m4_kill_5 ; Tourian: M4 Kill 5
    dl $7E078D : db $02 : dw $A9C0 ; DDB
    dl $7E078F : db $02 : dw $0000 ; DoorOut Index
    dl $7E079B : db $02 : dw $C98E ; MDB
    dl $7E090F : db $02 : dw $8000 ; Screen subpixel X position.
    dl $7E0913 : db $02 : dw $6000 ; Screen subpixel Y position
    dl $7E0915 : db $02 : dw $021F ; Screen Y position in pixels
    dl $7E0919 : db $02 : dw $0197 ; Layer 2 Y scroll in room in pixels? (up = positive)
    dl $7E0921 : db $02 : dw $FC00 ; BG2 X scroll offset due to room transitions (Translates between Layer 2 scroll and BG2 scroll)
    dl $7E0923 : db $02 : dw $FE00 ; BG2 Y scroll offset due to room transitions (Translates between Layer 2 scroll and BG2 scroll)
    dl $7E09C2 : db $02 : dw $02BB ; Health
    dl $7E09C6 : db $02 : dw $001F ; Missiles
    dl $7E0AF6 : db $02 : dw $0023 ; Samus X
    dl $7E0AFA : db $02 : dw $028B ; Samus Y
    dw #$FFFF
.after

preset_redesign_tourian_m6_shutter_skip:
    dw #preset_redesign_tourian_m5_kill_6 ; Tourian: M5 Kill 6
    dl $7E078D : db $02 : dw $A198 ; DDB
    dl $7E078F : db $02 : dw $0001 ; DoorOut Index
    dl $7E079B : db $02 : dw $CA08 ; MDB
    dl $7E090F : db $02 : dw $1000 ; Screen subpixel X position.
    dl $7E0911 : db $02 : dw $0100 ; Screen X position in pixels
    dl $7E0913 : db $02 : dw $0000 ; Screen subpixel Y position
    dl $7E0915 : db $02 : dw $001D ; Screen Y position in pixels
    dl $7E0917 : db $02 : dw $00C0 ; Layer 2 X scroll in room in pixels?
    dl $7E0919 : db $02 : dw $0015 ; Layer 2 Y scroll in room in pixels? (up = positive)
    dl $7E0921 : db $02 : dw $FE00 ; BG2 X scroll offset due to room transitions (Translates between Layer 2 scroll and BG2 scroll)
    dl $7E09C2 : db $02 : dw $0290 ; Health
    dl $7E09C6 : db $02 : dw $002F ; Missiles
    dl $7E0A1C : db $02 : dw $0001 ; Samus position/state
    dl $7E0A1E : db $02 : dw $0008 ; More position/state
    dl $7E0AF6 : db $02 : dw $01C7 ; Samus X
    dl $7E0AFA : db $02 : dw $008B ; Samus Y
    dl $7ED8CC : db $02 : dw $0440 ; Events, Items, Doors
    dl $7ED90C : db $02 : dw $FF00 ; Events, Items, Doors
    dw #$FFFF
.after

preset_redesign_tourian_m7_kill_5:
    dw #preset_redesign_tourian_m6_shutter_skip ; Tourian: M6 Shutter Skip
    dl $7E078D : db $02 : dw $A1BC ; DDB
    dl $7E079B : db $02 : dw $C98E ; MDB
    dl $7E090F : db $02 : dw $F000 ; Screen subpixel X position.
    dl $7E0911 : db $02 : dw $0700 ; Screen X position in pixels
    dl $7E0915 : db $02 : dw $001A ; Screen Y position in pixels
    dl $7E0917 : db $02 : dw $0540 ; Layer 2 X scroll in room in pixels?
    dl $7E0919 : db $02 : dw $0013 ; Layer 2 Y scroll in room in pixels? (up = positive)
    dl $7E0921 : db $02 : dw $0100 ; BG2 X scroll offset due to room transitions (Translates between Layer 2 scroll and BG2 scroll)
    dl $7E0923 : db $02 : dw $0000 ; BG2 Y scroll offset due to room transitions (Translates between Layer 2 scroll and BG2 scroll)
    dl $7E09C2 : db $02 : dw $0240 ; Health
    dl $7E0AF6 : db $02 : dw $07CD ; Samus X
    dw #$FFFF
.after

preset_redesign_tourian_m8_kill_7:
    dw #preset_redesign_tourian_m7_kill_5 ; Tourian: M7 Kill 5
    dl $7E078D : db $02 : dw $ADF5 ; DDB
    dl $7E078F : db $02 : dw $0005 ; DoorOut Index
    dl $7E079B : db $02 : dw $DAE1 ; MDB
    dl $7E090F : db $02 : dw $7000 ; Screen subpixel X position.
    dl $7E0911 : db $02 : dw $0800 ; Screen X position in pixels
    dl $7E0915 : db $02 : dw $001B ; Screen Y position in pixels
    dl $7E0917 : db $02 : dw $0600 ; Layer 2 X scroll in room in pixels?
    dl $7E0919 : db $02 : dw $0014 ; Layer 2 Y scroll in room in pixels? (up = positive)
    dl $7E09C2 : db $02 : dw $018E ; Health
    dl $7E09C6 : db $02 : dw $0036 ; Missiles
    dl $7E09CA : db $02 : dw $0007 ; Supers
    dl $7E0AF6 : db $02 : dw $08C6 ; Samus X
    dw #$FFFF
.after

preset_redesign_tourian_m9_kill_9:
    dw #preset_redesign_tourian_m8_kill_7 ; Tourian: M8 Kill 7
    dl $7E078D : db $02 : dw $A9A8 ; DDB
    dl $7E078F : db $02 : dw $0000 ; DoorOut Index
    dl $7E079B : db $02 : dw $DCB1 ; MDB
    dl $7E090F : db $02 : dw $A000 ; Screen subpixel X position.
    dl $7E0911 : db $02 : dw $0100 ; Screen X position in pixels
    dl $7E0915 : db $02 : dw $021B ; Screen Y position in pixels
    dl $7E0917 : db $02 : dw $00C0 ; Layer 2 X scroll in room in pixels?
    dl $7E0919 : db $02 : dw $0194 ; Layer 2 Y scroll in room in pixels? (up = positive)
    dl $7E0921 : db $02 : dw $0000 ; BG2 X scroll offset due to room transitions (Translates between Layer 2 scroll and BG2 scroll)
    dl $7E09C2 : db $02 : dw $02BB ; Health
    dl $7E09C6 : db $02 : dw $0037 ; Missiles
    dl $7E0AF6 : db $02 : dw $01A7 ; Samus X
    dl $7E0AFA : db $02 : dw $028B ; Samus Y
    dl $7ED8C4 : db $02 : dw $0057 ; Events, Items, Doors
    dw #$FFFF
.after

preset_redesign_tourian_m10_kill_3:
    dw #preset_redesign_tourian_m9_kill_9 ; Tourian: M9 Kill 9
    dl $7E078D : db $02 : dw $AA44 ; DDB
    dl $7E078F : db $02 : dw $0001 ; DoorOut Index
    dl $7E079B : db $02 : dw $CAF6 ; MDB
    dl $7E090F : db $02 : dw $0000 ; Screen subpixel X position.
    dl $7E0911 : db $02 : dw $0800 ; Screen X position in pixels
    dl $7E0913 : db $02 : dw $7800 ; Screen subpixel Y position
    dl $7E0915 : db $02 : dw $001C ; Screen Y position in pixels
    dl $7E0917 : db $02 : dw $0600 ; Layer 2 X scroll in room in pixels?
    dl $7E0919 : db $02 : dw $0015 ; Layer 2 Y scroll in room in pixels? (up = positive)
    dl $7E0921 : db $02 : dw $FD00 ; BG2 X scroll offset due to room transitions (Translates between Layer 2 scroll and BG2 scroll)
    dl $7E0923 : db $02 : dw $FE00 ; BG2 Y scroll offset due to room transitions (Translates between Layer 2 scroll and BG2 scroll)
    dl $7E09C2 : db $02 : dw $02BB ; Health
    dl $7E09CA : db $02 : dw $0009 ; Supers
    dl $7E0AF6 : db $02 : dw $08B6 ; Samus X
    dl $7E0AFA : db $02 : dw $008B ; Samus Y
    dw #$FFFF
.after

preset_redesign_tourian_baby_skip:
    dw #preset_redesign_tourian_m10_kill_3 ; Tourian: M10 Kill 3
    dl $7E078D : db $02 : dw $A9FC ; DDB
    dl $7E079B : db $02 : dw $DDF3 ; MDB
    dl $7E07C5 : db $02 : dw $00BF ; GFX Pointers
    dl $7E07C7 : db $02 : dw $CEB5 ; GFX Pointers
    dl $7E090F : db $02 : dw $A000 ; Screen subpixel X position.
    dl $7E0911 : db $02 : dw $0000 ; Screen X position in pixels
    dl $7E0913 : db $02 : dw $C400 ; Screen subpixel Y position
    dl $7E0915 : db $02 : dw $001F ; Screen Y position in pixels
    dl $7E0917 : db $02 : dw $0000 ; Layer 2 X scroll in room in pixels?
    dl $7E0919 : db $02 : dw $0017 ; Layer 2 Y scroll in room in pixels? (up = positive)
    dl $7E0921 : db $02 : dw $0100 ; BG2 X scroll offset due to room transitions (Translates between Layer 2 scroll and BG2 scroll)
    dl $7E0923 : db $02 : dw $0000 ; BG2 Y scroll offset due to room transitions (Translates between Layer 2 scroll and BG2 scroll)
    dl $7E09C2 : db $02 : dw $02BA ; Health
    dl $7E09CA : db $02 : dw $0008 ; Supers
    dl $7E0A1C : db $02 : dw $0002 ; Samus position/state
    dl $7E0A1E : db $02 : dw $0004 ; More position/state
    dl $7E0AF6 : db $02 : dw $0077 ; Samus X
    dl $7E0AFA : db $02 : dw $00CB ; Samus Y
    dl $7ED8C4 : db $02 : dw $005F ; Events, Items, Doors
    dw #$FFFF
.after

preset_redesign_tourian_big_hoppers:
    dw #preset_redesign_tourian_baby_skip ; Tourian: Baby Skip
    dl $7E078D : db $02 : dw $C4B8 ; DDB
    dl $7E078F : db $02 : dw $0000 ; DoorOut Index
    dl $7E079B : db $02 : dw $A618 ; MDB
    dl $7E07C5 : db $02 : dw $EDBF ; GFX Pointers
    dl $7E07C7 : db $02 : dw $C2BA ; GFX Pointers
    dl $7E090F : db $02 : dw $EC00 ; Screen subpixel X position.
    dl $7E0913 : db $02 : dw $1800 ; Screen subpixel Y position
    dl $7E0915 : db $02 : dw $0100 ; Screen Y position in pixels
    dl $7E0919 : db $02 : dw $00C0 ; Layer 2 Y scroll in room in pixels? (up = positive)
    dl $7E0921 : db $02 : dw $FF00 ; BG2 X scroll offset due to room transitions (Translates between Layer 2 scroll and BG2 scroll)
    dl $7E09A6 : db $02 : dw $1001 ; Beams
    dl $7E0A1C : db $02 : dw $0001 ; Samus position/state
    dl $7E0A1E : db $02 : dw $0008 ; More position/state
    dl $7E0AF6 : db $02 : dw $00B9 ; Samus X
    dl $7E0AFA : db $02 : dw $01B2 ; Samus Y
    dw #$FFFF
.after

preset_redesign_tourian_zeb_skip:
    dw #preset_redesign_tourian_big_hoppers ; Tourian: Big Hoppers
    dl $7E078D : db $02 : dw $AA08 ; DDB
    dl $7E079B : db $02 : dw $DDF3 ; MDB
    dl $7E07C5 : db $02 : dw $00BF ; GFX Pointers
    dl $7E07C7 : db $02 : dw $CEB5 ; GFX Pointers
    dl $7E090F : db $02 : dw $2000 ; Screen subpixel X position.
    dl $7E0913 : db $02 : dw $0000 ; Screen subpixel Y position
    dl $7E0915 : db $02 : dw $0419 ; Screen Y position in pixels
    dl $7E0919 : db $02 : dw $0312 ; Layer 2 Y scroll in room in pixels? (up = positive)
    dl $7E0921 : db $02 : dw $0100 ; BG2 X scroll offset due to room transitions (Translates between Layer 2 scroll and BG2 scroll)
    dl $7E0923 : db $02 : dw $FE00 ; BG2 Y scroll offset due to room transitions (Translates between Layer 2 scroll and BG2 scroll)
    dl $7E09A6 : db $02 : dw $1002 ; Beams
    dl $7E09C6 : db $02 : dw $001E ; Missiles
    dl $7E0A1C : db $02 : dw $0002 ; Samus position/state
    dl $7E0A1E : db $02 : dw $0004 ; More position/state
    dl $7E0AF6 : db $02 : dw $003E ; Samus X
    dl $7E0AFA : db $02 : dw $048B ; Samus Y
    dl $7ED8C2 : db $02 : dw $7C00 ; Events, Items, Doors
    dw #$FFFF
.after

preset_redesign_final_escape_escape_room_2:
    dw #preset_redesign_tourian_zeb_skip ; Tourian: Zeb Skip
    dl $7E078D : db $02 : dw $AA8C ; DDB
    dl $7E078F : db $02 : dw $0001 ; DoorOut Index
    dl $7E079B : db $02 : dw $CAF6 ; MDB
    dl $7E07C5 : db $02 : dw $EDBF ; GFX Pointers
    dl $7E07C7 : db $02 : dw $C2BA ; GFX Pointers
    dl $7E07F3 : db $02 : dw $0024 ; Music Bank
    dl $7E07F5 : db $02 : dw $0007 ; Music Track
    dl $7E090F : db $02 : dw $0000 ; Screen subpixel X position.
    dl $7E0911 : db $02 : dw $0015 ; Screen X position in pixels
    dl $7E0913 : db $02 : dw $29FE ; Screen subpixel Y position
    dl $7E0915 : db $02 : dw $03E0 ; Screen Y position in pixels
    dl $7E0917 : db $02 : dw $000F ; Layer 2 X scroll in room in pixels?
    dl $7E0919 : db $02 : dw $02E8 ; Layer 2 Y scroll in room in pixels? (up = positive)
    dl $7E0921 : db $02 : dw $F600 ; BG2 X scroll offset due to room transitions (Translates between Layer 2 scroll and BG2 scroll)
    dl $7E0923 : db $02 : dw $FC00 ; BG2 Y scroll offset due to room transitions (Translates between Layer 2 scroll and BG2 scroll)
    dl $7E09A2 : db $02 : dw $1484 ; Equipped Items
    dl $7E09A4 : db $02 : dw $1404 ; Collected Items
    dl $7E09A6 : db $02 : dw $1009 ; Beams
    dl $7E09C2 : db $02 : dw $026B ; Health
    dl $7E09C6 : db $02 : dw $0000 ; Missiles
    dl $7E09CA : db $02 : dw $0000 ; Supers
    dl $7E09CE : db $02 : dw $0000 ; Pbs
    dl $7E0A1C : db $02 : dw $0041 ; Samus position/state
    dl $7E0A1E : db $02 : dw $0404 ; More position/state
    dl $7E0A76 : db $02 : dw $8000 ; Hyper beam
    dl $7E0AF6 : db $02 : dw $00B5 ; Samus X
    dl $7E0AFA : db $02 : dw $0479 ; Samus Y
    dl $7ED820 : db $02 : dw $4005 ; Events, Items, Doors
    dl $7ED82C : db $02 : dw $E203 ; Events, Items, Doors
    dw #$FFFF
.after

preset_redesign_final_escape_missile_pack_room:
    dw #preset_redesign_final_escape_escape_room_2 ; Final Escape: Escape Room 2
    dl $7E078D : db $02 : dw $AB04 ; DDB
    dl $7E079B : db $02 : dw $DDC4 ; MDB
    dl $7E090F : db $02 : dw $D000 ; Screen subpixel X position.
    dl $7E0911 : db $02 : dw $0000 ; Screen X position in pixels
    dl $7E0913 : db $02 : dw $0000 ; Screen subpixel Y position
    dl $7E0915 : db $02 : dw $001A ; Screen Y position in pixels
    dl $7E0917 : db $02 : dw $0000 ; Layer 2 X scroll in room in pixels?
    dl $7E0919 : db $02 : dw $0013 ; Layer 2 Y scroll in room in pixels? (up = positive)
    dl $7E0921 : db $02 : dw $F800 ; BG2 X scroll offset due to room transitions (Translates between Layer 2 scroll and BG2 scroll)
    dl $7E0923 : db $02 : dw $0000 ; BG2 Y scroll offset due to room transitions (Translates between Layer 2 scroll and BG2 scroll)
    dl $7E09A2 : db $02 : dw $1404 ; Equipped Items
    dl $7E0A1C : db $02 : dw $0002 ; Samus position/state
    dl $7E0A1E : db $02 : dw $0004 ; More position/state
    dl $7E0AF6 : db $02 : dw $0043 ; Samus X
    dl $7E0AFA : db $02 : dw $008B ; Samus Y
    dw #$FFFF
.after

preset_redesign_final_escape_shutter_skip:
    dw #preset_redesign_final_escape_missile_pack_room ; Final Escape: Missile Pack Room
    dl $7E078D : db $02 : dw $AA98 ; DDB
    dl $7E078F : db $02 : dw $0000 ; DoorOut Index
    dl $7E079B : db $02 : dw $DCFF ; MDB
    dl $7E090F : db $02 : dw $D800 ; Screen subpixel X position.
    dl $7E0911 : db $02 : dw $0500 ; Screen X position in pixels
    dl $7E0915 : db $02 : dw $021D ; Screen Y position in pixels
    dl $7E0917 : db $02 : dw $03C0 ; Layer 2 X scroll in room in pixels?
    dl $7E0919 : db $02 : dw $0195 ; Layer 2 Y scroll in room in pixels? (up = positive)
    dl $7E0921 : db $02 : dw $FC00 ; BG2 X scroll offset due to room transitions (Translates between Layer 2 scroll and BG2 scroll)
    dl $7E0923 : db $02 : dw $FD00 ; BG2 Y scroll offset due to room transitions (Translates between Layer 2 scroll and BG2 scroll)
    dl $7E09C6 : db $02 : dw $000A ; Missiles
    dl $7E09C8 : db $02 : dw $0041 ; Max missiles
    dl $7E0A1C : db $02 : dw $0001 ; Samus position/state
    dl $7E0A1E : db $02 : dw $0008 ; More position/state
    dl $7E0AF6 : db $02 : dw $05C7 ; Samus X
    dl $7E0AFA : db $02 : dw $028B ; Samus Y
    dl $7ED880 : db $02 : dw $6C06 ; Events, Items, Doors
    dl $7ED91A : db $02 : dw $015C ; Events, Items, Doors
    dw #$FFFF
.after

preset_redesign_final_escape_maze_shutter_pirate:
    dw #preset_redesign_final_escape_shutter_skip ; Final Escape: Shutter Skip
    dl $7E078D : db $02 : dw $AB1C ; DDB
    dl $7E078F : db $02 : dw $0001 ; DoorOut Index
    dl $7E079B : db $02 : dw $DEDE ; MDB
    dl $7E090F : db $02 : dw $F000 ; Screen subpixel X position.
    dl $7E0911 : db $02 : dw $0600 ; Screen X position in pixels
    dl $7E0913 : db $02 : dw $0E00 ; Screen subpixel Y position
    dl $7E0915 : db $02 : dw $00FD ; Screen Y position in pixels
    dl $7E0917 : db $02 : dw $0480 ; Layer 2 X scroll in room in pixels?
    dl $7E0919 : db $02 : dw $00BD ; Layer 2 Y scroll in room in pixels? (up = positive)
    dl $7E0921 : db $02 : dw $FE00 ; BG2 X scroll offset due to room transitions (Translates between Layer 2 scroll and BG2 scroll)
    dl $7E0923 : db $02 : dw $FF00 ; BG2 Y scroll offset due to room transitions (Translates between Layer 2 scroll and BG2 scroll)
    dl $7E09C6 : db $02 : dw $0005 ; Missiles
    dl $7E0AF6 : db $02 : dw $06C9 ; Samus X
    dl $7E0AFA : db $02 : dw $0193 ; Samus Y
    dw #$FFFF
.after

preset_redesign_final_escape_jump_morph_room:
    dw #preset_redesign_final_escape_maze_shutter_pirate ; Final Escape: Maze Shutter Pirate
    dl $7E078D : db $02 : dw $AB34 ; DDB
    dl $7E079B : db $02 : dw $CAF6 ; MDB
    dl $7E090F : db $02 : dw $A000 ; Screen subpixel X position.
    dl $7E0911 : db $02 : dw $0400 ; Screen X position in pixels
    dl $7E0913 : db $02 : dw $4800 ; Screen subpixel Y position
    dl $7E0915 : db $02 : dw $021B ; Screen Y position in pixels
    dl $7E0917 : db $02 : dw $0300 ; Layer 2 X scroll in room in pixels?
    dl $7E0919 : db $02 : dw $0194 ; Layer 2 Y scroll in room in pixels? (up = positive)
    dl $7E0921 : db $02 : dw $0100 ; BG2 X scroll offset due to room transitions (Translates between Layer 2 scroll and BG2 scroll)
    dl $7E0923 : db $02 : dw $FE00 ; BG2 Y scroll offset due to room transitions (Translates between Layer 2 scroll and BG2 scroll)
    dl $7E0A1C : db $02 : dw $0002 ; Samus position/state
    dl $7E0A1E : db $02 : dw $0004 ; More position/state
    dl $7E0AF6 : db $02 : dw $0446 ; Samus X
    dl $7E0AFA : db $02 : dw $028B ; Samus Y
    dw #$FFFF
.after

preset_redesign_final_escape_morph_tunnels:
    dw #preset_redesign_final_escape_jump_morph_room ; Final Escape: Jump Morph Room
    dl $7E078D : db $02 : dw $AA38 ; DDB
    dl $7E078F : db $02 : dw $0000 ; DoorOut Index
    dl $7E079B : db $02 : dw $DAE1 ; MDB
    dl $7E0911 : db $02 : dw $0000 ; Screen X position in pixels
    dl $7E0913 : db $02 : dw $6000 ; Screen subpixel Y position
    dl $7E0915 : db $02 : dw $001F ; Screen Y position in pixels
    dl $7E0917 : db $02 : dw $0000 ; Layer 2 X scroll in room in pixels?
    dl $7E0919 : db $02 : dw $0017 ; Layer 2 Y scroll in room in pixels? (up = positive)
    dl $7E0921 : db $02 : dw $F700 ; BG2 X scroll offset due to room transitions (Translates between Layer 2 scroll and BG2 scroll)
    dl $7E0923 : db $02 : dw $0000 ; BG2 Y scroll offset due to room transitions (Translates between Layer 2 scroll and BG2 scroll)
    dl $7E0AF6 : db $02 : dw $0032 ; Samus X
    dl $7E0AFA : db $02 : dw $008B ; Samus Y
    dw #$FFFF
.after

preset_redesign_final_escape_metroid_dodge_1:
    dw #preset_redesign_final_escape_morph_tunnels ; Final Escape: Morph Tunnels
    dl $7E078D : db $02 : dw $AE01 ; DDB
    dl $7E078F : db $02 : dw $0006 ; DoorOut Index
    dl $7E079B : db $02 : dw $DB31 ; MDB
    dl $7E090F : db $02 : dw $E000 ; Screen subpixel X position.
    dl $7E0913 : db $02 : dw $87FF ; Screen subpixel Y position
    dl $7E0915 : db $02 : dw $0117 ; Screen Y position in pixels
    dl $7E0919 : db $02 : dw $00D1 ; Layer 2 Y scroll in room in pixels? (up = positive)
    dl $7E0921 : db $02 : dw $0100 ; BG2 X scroll offset due to room transitions (Translates between Layer 2 scroll and BG2 scroll)
    dl $7E0AF6 : db $02 : dw $0037 ; Samus X
    dl $7E0AFA : db $02 : dw $018B ; Samus Y
    dw #$FFFF
.after

preset_redesign_final_escape_metroid_dodge_2:
    dw #preset_redesign_final_escape_metroid_dodge_1 ; Final Escape: Metroid Dodge 1
    dl $7E078D : db $02 : dw $A9CC ; DDB
    dl $7E078F : db $02 : dw $0001 ; DoorOut Index
    dl $7E079B : db $02 : dw $DB7D ; MDB
    dl $7E090F : db $02 : dw $0000 ; Screen subpixel X position.
    dl $7E0911 : db $02 : dw $0004 ; Screen X position in pixels
    dl $7E0913 : db $02 : dw $E7FF ; Screen subpixel Y position
    dl $7E0915 : db $02 : dw $001F ; Screen Y position in pixels
    dl $7E0917 : db $02 : dw $0003 ; Layer 2 X scroll in room in pixels?
    dl $7E0919 : db $02 : dw $0017 ; Layer 2 Y scroll in room in pixels? (up = positive)
    dl $7E0921 : db $02 : dw $FA00 ; BG2 X scroll offset due to room transitions (Translates between Layer 2 scroll and BG2 scroll)
    dl $7E0A1C : db $02 : dw $0041 ; Samus position/state
    dl $7E0A1E : db $02 : dw $0404 ; More position/state
    dl $7E0AF6 : db $02 : dw $00A4 ; Samus X
    dl $7E0AFA : db $02 : dw $00D9 ; Samus Y
    dw #$FFFF
.after

preset_redesign_final_escape_kago_shutter_mockball:
    dw #preset_redesign_final_escape_metroid_dodge_2 ; Final Escape: Metroid Dodge 2
    dl $7E078D : db $02 : dw $A9D8 ; DDB
    dl $7E078F : db $02 : dw $0000 ; DoorOut Index
    dl $7E079B : db $02 : dw $D9D4 ; MDB
    dl $7E090F : db $02 : dw $2400 ; Screen subpixel X position.
    dl $7E0913 : db $02 : dw $E400 ; Screen subpixel Y position
    dl $7E0915 : db $02 : dw $06F8 ; Screen Y position in pixels
    dl $7E0919 : db $02 : dw $053A ; Layer 2 Y scroll in room in pixels? (up = positive)
    dl $7E0921 : db $02 : dw $0000 ; BG2 X scroll offset due to room transitions (Translates between Layer 2 scroll and BG2 scroll)
    dl $7E0923 : db $02 : dw $00E0 ; BG2 Y scroll offset due to room transitions (Translates between Layer 2 scroll and BG2 scroll)
    dl $7E0A1C : db $02 : dw $0002 ; Samus position/state
    dl $7E0A1E : db $02 : dw $0004 ; More position/state
    dl $7E0AF6 : db $02 : dw $0034 ; Samus X
    dl $7E0AFA : db $02 : dw $078B ; Samus Y
    dw #$FFFF
.after

preset_redesign_final_escape_tiny_footholds_climb:
    dw #preset_redesign_final_escape_kago_shutter_mockball ; Final Escape: Kago Shutter Mockball
    dl $7E078D : db $02 : dw $A24C ; DDB
    dl $7E079B : db $02 : dw $D845 ; MDB
    dl $7E090F : db $02 : dw $3000 ; Screen subpixel X position.
    dl $7E0913 : db $02 : dw $5600 ; Screen subpixel Y position
    dl $7E0915 : db $02 : dw $0000 ; Screen Y position in pixels
    dl $7E0919 : db $02 : dw $0000 ; Layer 2 Y scroll in room in pixels? (up = positive)
    dl $7E0923 : db $02 : dw $F600 ; BG2 Y scroll offset due to room transitions (Translates between Layer 2 scroll and BG2 scroll)
    dl $7E09C6 : db $02 : dw $0005 ; Missiles
    dl $7E0A1C : db $02 : dw $0001 ; Samus position/state
    dl $7E0A1E : db $02 : dw $0008 ; More position/state
    dl $7E0AF6 : db $02 : dw $007B ; Samus X
    dl $7E0AFA : db $02 : dw $006B ; Samus Y
    dw #$FFFF
.after

preset_redesign_final_escape_trip_on_slopes:
    dw #preset_redesign_final_escape_tiny_footholds_climb ; Final Escape: Tiny Footholds Climb
    dl $7E078D : db $02 : dw $A294 ; DDB
    dl $7E079B : db $02 : dw $A1D8 ; MDB
    dl $7E079F : db $02 : dw $0000 ; Region
    dl $7E07C3 : db $02 : dw $860B ; GFX Pointers
    dl $7E07C5 : db $02 : dw $7BC0 ; GFX Pointers
    dl $7E07C7 : db $02 : dw $C2BD ; GFX Pointers
    dl $7E0913 : db $02 : dw $0000 ; Screen subpixel Y position
    dl $7E0915 : db $02 : dw $002B ; Screen Y position in pixels
    dl $7E0919 : db $02 : dw $0020 ; Layer 2 Y scroll in room in pixels? (up = positive)
    dl $7E0923 : db $02 : dw $FD00 ; BG2 Y scroll offset due to room transitions (Translates between Layer 2 scroll and BG2 scroll)
    dl $7E09C6 : db $02 : dw $0000 ; Missiles
    dl $7E0AF6 : db $02 : dw $00BC ; Samus X
    dl $7E0AFA : db $02 : dw $009B ; Samus Y
    dw #$FFFF
.after

preset_redesign_final_escape_underwater_platforming_1:
    dw #preset_redesign_final_escape_trip_on_slopes ; Final Escape: Trip On Slopes
    dl $7E078D : db $02 : dw $905A ; DDB
    dl $7E079B : db $02 : dw $A184 ; MDB
    dl $7E07C5 : db $02 : dw $9CC0 ; GFX Pointers
    dl $7E07C7 : db $02 : dw $C2BC ; GFX Pointers
    dl $7E090F : db $02 : dw $B800 ; Screen subpixel X position.
    dl $7E0913 : db $02 : dw $4800 ; Screen subpixel Y position
    dl $7E0915 : db $02 : dw $0000 ; Screen Y position in pixels
    dl $7E0919 : db $02 : dw $0000 ; Layer 2 Y scroll in room in pixels? (up = positive)
    dl $7E0921 : db $02 : dw $0100 ; BG2 X scroll offset due to room transitions (Translates between Layer 2 scroll and BG2 scroll)
    dl $7E0923 : db $02 : dw $0000 ; BG2 Y scroll offset due to room transitions (Translates between Layer 2 scroll and BG2 scroll)
    dl $7E0AF6 : db $02 : dw $002A ; Samus X
    dl $7E0AFA : db $02 : dw $008B ; Samus Y
    dw #$FFFF
.after

preset_redesign_final_escape_underwater_platforming_2:
    dw #preset_redesign_final_escape_underwater_platforming_1 ; Final Escape: Underwater Platforming 1
    dl $7E078D : db $02 : dw $8FD6 ; DDB
    dl $7E079B : db $02 : dw $CA52 ; MDB
    dl $7E07C3 : db $02 : dw $C629 ; GFX Pointers
    dl $7E07C5 : db $02 : dw $7CBA ; GFX Pointers
    dl $7E07C7 : db $02 : dw $C2AD ; GFX Pointers
    dl $7E090F : db $02 : dw $1A00 ; Screen subpixel X position.
    dl $7E0911 : db $02 : dw $0100 ; Screen X position in pixels
    dl $7E0913 : db $02 : dw $5000 ; Screen subpixel Y position
    dl $7E0915 : db $02 : dw $0015 ; Screen Y position in pixels
    dl $7E0917 : db $02 : dw $00C0 ; Layer 2 X scroll in room in pixels?
    dl $7E0919 : db $02 : dw $000F ; Layer 2 Y scroll in room in pixels? (up = positive)
    dl $7E0923 : db $02 : dw $FD00 ; BG2 Y scroll offset due to room transitions (Translates between Layer 2 scroll and BG2 scroll)
    dl $7E0AF6 : db $02 : dw $01DA ; Samus X
    dw #$FFFF
.after

preset_redesign_final_escape_mushroom_run:
    dw #preset_redesign_final_escape_underwater_platforming_2 ; Final Escape: Underwater Platforming 2
    dl $7E078D : db $02 : dw $C338 ; DDB
    dl $7E079B : db $02 : dw $CE8A ; MDB
    dl $7E090F : db $02 : dw $5C00 ; Screen subpixel X position.
    dl $7E0911 : db $02 : dw $0200 ; Screen X position in pixels
    dl $7E0913 : db $02 : dw $0000 ; Screen subpixel Y position
    dl $7E0915 : db $02 : dw $0029 ; Screen Y position in pixels
    dl $7E0917 : db $02 : dw $0180 ; Layer 2 X scroll in room in pixels?
    dl $7E0919 : db $02 : dw $001E ; Layer 2 Y scroll in room in pixels? (up = positive)
    dl $7E0923 : db $02 : dw $FE00 ; BG2 Y scroll offset due to room transitions (Translates between Layer 2 scroll and BG2 scroll)
    dl $7E0A1C : db $02 : dw $0002 ; Samus position/state
    dl $7E0A1E : db $02 : dw $0004 ; More position/state
    dl $7E0AF6 : db $02 : dw $022B ; Samus X
    dl $7E0AFA : db $02 : dw $00A7 ; Samus Y
    dw #$FFFF
.after

preset_redesign_final_escape_pirates_and_steam:
    dw #preset_redesign_final_escape_mushroom_run ; Final Escape: Mushroom Run
    dl $7E078D : db $02 : dw $A270 ; DDB
    dl $7E078F : db $02 : dw $0001 ; DoorOut Index
    dl $7E079B : db $02 : dw $9F64 ; MDB
    dl $7E090F : db $02 : dw $F000 ; Screen subpixel X position.
    dl $7E0911 : db $02 : dw $0127 ; Screen X position in pixels
    dl $7E0915 : db $02 : dw $000B ; Screen Y position in pixels
    dl $7E0917 : db $02 : dw $00DD ; Layer 2 X scroll in room in pixels?
    dl $7E0919 : db $02 : dw $0008 ; Layer 2 Y scroll in room in pixels? (up = positive)
    dl $7E0921 : db $02 : dw $FB00 ; BG2 X scroll offset due to room transitions (Translates between Layer 2 scroll and BG2 scroll)
    dl $7E0923 : db $02 : dw $FF00 ; BG2 Y scroll offset due to room transitions (Translates between Layer 2 scroll and BG2 scroll)
    dl $7E0AF6 : db $02 : dw $018D ; Samus X
    dl $7E0AFA : db $02 : dw $007B ; Samus Y
    dw #$FFFF
.after

preset_redesign_final_escape_lava_and_steam:
    dw #preset_redesign_final_escape_pirates_and_steam ; Final Escape: Pirates And Steam
    dl $7E078D : db $02 : dw $895E ; DDB
    dl $7E078F : db $02 : dw $0000 ; DoorOut Index
    dl $7E079B : db $02 : dw $91F8 ; MDB
    dl $7E090F : db $02 : dw $EC00 ; Screen subpixel X position.
    dl $7E0911 : db $02 : dw $0035 ; Screen X position in pixels
    dl $7E0913 : db $02 : dw $7600 ; Screen subpixel Y position
    dl $7E0915 : db $02 : dw $0642 ; Screen Y position in pixels
    dl $7E0917 : db $02 : dw $0027 ; Layer 2 X scroll in room in pixels?
    dl $7E0919 : db $02 : dw $04B1 ; Layer 2 Y scroll in room in pixels? (up = positive)
    dl $7E0921 : db $02 : dw $FA00 ; BG2 X scroll offset due to room transitions (Translates between Layer 2 scroll and BG2 scroll)
    dl $7E0923 : db $02 : dw $F900 ; BG2 Y scroll offset due to room transitions (Translates between Layer 2 scroll and BG2 scroll)
    dl $7E0AF6 : db $02 : dw $00A5 ; Samus X
    dl $7E0AFA : db $02 : dw $06B1 ; Samus Y
    dw #$FFFF
.after

preset_redesign_final_escape_rising_tides:
    dw #preset_redesign_final_escape_lava_and_steam ; Final Escape: Lava And Steam
    dl $7E078D : db $02 : dw $8FE2 ; DDB
    dl $7E090F : db $02 : dw $0400 ; Screen subpixel X position.
    dl $7E0911 : db $02 : dw $0500 ; Screen X position in pixels
    dl $7E0913 : db $02 : dw $BA00 ; Screen subpixel Y position
    dl $7E0915 : db $02 : dw $0316 ; Screen Y position in pixels
    dl $7E0917 : db $02 : dw $03C0 ; Layer 2 X scroll in room in pixels?
    dl $7E0919 : db $02 : dw $0250 ; Layer 2 Y scroll in room in pixels? (up = positive)
    dl $7E0921 : db $02 : dw $0100 ; BG2 X scroll offset due to room transitions (Translates between Layer 2 scroll and BG2 scroll)
    dl $7E0923 : db $02 : dw $FE00 ; BG2 Y scroll offset due to room transitions (Translates between Layer 2 scroll and BG2 scroll)
    dl $7E0A1C : db $02 : dw $0001 ; Samus position/state
    dl $7E0A1E : db $02 : dw $0008 ; More position/state
    dl $7E0AF6 : db $02 : dw $05D4 ; Samus X
    dl $7E0AFA : db $02 : dw $038B ; Samus Y
    dw #$FFFF
.after

preset_redesign_final_escape_final_boss_2:
    dw #preset_redesign_final_escape_rising_tides ; Final Escape: Rising Tides
    dl $7E078D : db $02 : dw $8922 ; DDB
    dl $7E078F : db $02 : dw $0001 ; DoorOut Index
    dl $7E079B : db $02 : dw $92FD ; MDB
    dl $7E090F : db $02 : dw $5000 ; Screen subpixel X position.
    dl $7E0913 : db $02 : dw $EA00 ; Screen subpixel Y position
    dl $7E0915 : db $02 : dw $001D ; Screen Y position in pixels
    dl $7E0919 : db $02 : dw $0015 ; Layer 2 Y scroll in room in pixels? (up = positive)
    dl $7E0923 : db $02 : dw $0000 ; BG2 Y scroll offset due to room transitions (Translates between Layer 2 scroll and BG2 scroll)
    dl $7E09C2 : db $02 : dw $0231 ; Health
    dl $7E0AF6 : db $02 : dw $05D7 ; Samus X
    dl $7E0AFA : db $02 : dw $008B ; Samus Y
    dw #$FFFF
.after

preset_redesign_final_escape_ship_2:
    dw #preset_redesign_final_escape_final_boss_2 ; Final Escape: Final Boss
    dl $7E078D : db $02 : dw $BF24 ; DDB
    dl $7E078F : db $02 : dw $0002 ; DoorOut Index
    dl $7E079B : db $02 : dw $97B5 ; MDB
    dl $7E090F : db $02 : dw $2000 ; Screen subpixel X position.
    dl $7E0911 : db $02 : dw $0000 ; Screen X position in pixels
    dl $7E0913 : db $02 : dw $0000 ; Screen subpixel Y position
    dl $7E0915 : db $02 : dw $0000 ; Screen Y position in pixels
    dl $7E0917 : db $02 : dw $0000 ; Layer 2 X scroll in room in pixels?
    dl $7E0919 : db $02 : dw $0000 ; Layer 2 Y scroll in room in pixels? (up = positive)
    dl $7E0AF6 : db $02 : dw $004C ; Samus X
    dw #$FFFF
.after
