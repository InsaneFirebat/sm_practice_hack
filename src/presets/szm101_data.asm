
preset_SZM101_bombs_landing_site:
    dw #$0000
    dw $078B : dw $0000 ; Elevator Index
    dw $078D : dw $896A ; DDB
    dw $078F : dw $0000 ; DoorOut Index
    dw $079B : dw $91F8 ; MDB
    dw $079F : dw $0000 ; Region
    dw $07C3 : dw $C629 ; GFX Pointers
    dw $07C5 : dw $7CBA ; GFX Pointers
    dw $07C7 : dw $C2AD ; GFX Pointers
    dw $07F3 : dw $0036 ; Music Bank
    dw $07F5 : dw $0005 ; Music Track
    dw $090F : dw $C000 ; Screen subpixel X position.
    dw $0911 : dw $03FA ; Screen X position in pixels
    dw $0913 : dw $4000 ; Screen subpixel Y position
    dw $0915 : dw $03F9 ; Screen Y position in pixels
    dw $0917 : dw $02FB ; Layer 2 X scroll in room in pixels?
    dw $0919 : dw $03F9 ; Layer 2 Y scroll in room in pixels? (up = positive)
    dw $0921 : dw $0300 ; BG2 X scroll offset due to room transitions (Translates between Layer 2 scroll and BG2 scroll)
    dw $0923 : dw $0400 ; BG2 Y scroll offset due to room transitions (Translates between Layer 2 scroll and BG2 scroll)
    dw $093F : dw $0000 ; Ceres escape flag
    dw $09A2 : dw $0000 ; Equipped Items
    dw $09A4 : dw $0000 ; Collected Items
    dw $09A6 : dw $0000 ; Beams
    dw $09A8 : dw $0000 ; Beams
    dw $09C0 : dw $0000 ; Manual/Auto reserve tank
    dw $09C2 : dw $0063 ; Health
    dw $09C4 : dw $0063 ; Max health
    dw $09C6 : dw $0000 ; Missiles
    dw $09C8 : dw $0000 ; Max missiles
    dw $09CA : dw $0000 ; Supers
    dw $09CC : dw $0000 ; Max supers
    dw $09CE : dw $0000 ; Pbs
    dw $09D0 : dw $0000 ; Max pbs
    dw $09D4 : dw $0000 ; Max reserves
    dw $09D6 : dw $0000 ; Reserves
    dw $0A1C : dw $0002 ; Samus position/state
    dw $0A1E : dw $0004 ; More position/state
    dw $0A68 : dw $0000 ; Flash suit
    dw $0A76 : dw $0000 ; Hyper beam
    dw $0AF6 : dw $047D ; Samus X
    dw $0AFA : dw $0443 ; Samus Y
    dw $0B3F : dw $0000 ; Blue suit
    dw $D7C0 : dw $0000 ; SRAM copy
    dw $D7C2 : dw $0000 ; SRAM copy
    dw $D7C4 : dw $0000 ; SRAM copy
    dw $D7C6 : dw $0000 ; SRAM copy
    dw $D7C8 : dw $0800 ; SRAM copy
    dw $D7CA : dw $0400 ; SRAM copy
    dw $D7CC : dw $0200 ; SRAM copy
    dw $D7CE : dw $0100 ; SRAM copy
    dw $D7D0 : dw $4000 ; SRAM copy
    dw $D7D2 : dw $8000 ; SRAM copy
    dw $D7D4 : dw $0080 ; SRAM copy
    dw $D7D6 : dw $2000 ; SRAM copy
    dw $D7D8 : dw $0040 ; SRAM copy
    dw $D7DA : dw $0020 ; SRAM copy
    dw $D7DC : dw $0010 ; SRAM copy
    dw $D7DE : dw $0000 ; SRAM copy
    dw $D7E0 : dw $0063 ; SRAM copy
    dw $D7E2 : dw $0063 ; SRAM copy
    dw $D7E4 : dw $0000 ; SRAM copy
    dw $D7E6 : dw $0000 ; SRAM copy
    dw $D7E8 : dw $0000 ; SRAM copy
    dw $D7EA : dw $0000 ; SRAM copy
    dw $D7EC : dw $0000 ; SRAM copy
    dw $D7EE : dw $0000 ; SRAM copy
    dw $D7F0 : dw $0000 ; SRAM copy
    dw $D7F2 : dw $0000 ; SRAM copy
    dw $D7F4 : dw $0000 ; SRAM copy
    dw $D7F6 : dw $0000 ; SRAM copy
    dw $D7F8 : dw $0000 ; SRAM copy
    dw $D7FA : dw $0000 ; SRAM copy
    dw $D7FC : dw $0000 ; SRAM copy
    dw $D7FE : dw $0000 ; SRAM copy
    dw $D800 : dw $0000 ; SRAM copy
    dw $D802 : dw $0001 ; SRAM copy
    dw $D804 : dw $0001 ; SRAM copy
    dw $D806 : dw $0001 ; SRAM copy
    dw $D808 : dw $0000 ; SRAM copy
    dw $D80A : dw $0000 ; SRAM copy
    dw $D80C : dw $0000 ; SRAM copy
    dw $D80E : dw $0000 ; SRAM copy
    dw $D810 : dw $0000 ; SRAM copy
    dw $D812 : dw $0000 ; SRAM copy
    dw $D814 : dw $0000 ; SRAM copy
    dw $D816 : dw $0000 ; SRAM copy
    dw $D818 : dw $0000 ; SRAM copy
    dw $D81A : dw $0000 ; SRAM copy
    dw $D81C : dw $0000 ; SRAM copy
    dw $D81E : dw $0000 ; SRAM copy
    dw $D820 : dw $0000 ; Events, Items, Doors
    dw $D822 : dw $0000 ; Events, Items, Doors
    dw $D824 : dw $0000 ; Events, Items, Doors
    dw $D826 : dw $0000 ; Events, Items, Doors
    dw $D828 : dw $0000 ; Events, Items, Doors
    dw $D82A : dw $0100 ; Events, Items, Doors
    dw $D82C : dw $0000 ; Events, Items, Doors
    dw $D82E : dw $0000 ; Events, Items, Doors
    dw $D830 : dw $0000 ; Events, Items, Doors
    dw $D832 : dw $0000 ; Events, Items, Doors
    dw $D834 : dw $0000 ; Events, Items, Doors
    dw $D836 : dw $0000 ; Events, Items, Doors
    dw $D838 : dw $0000 ; Events, Items, Doors
    dw $D83A : dw $0000 ; Events, Items, Doors
    dw $D83C : dw $0000 ; Events, Items, Doors
    dw $D83E : dw $0000 ; Events, Items, Doors
    dw $D840 : dw $0000 ; Events, Items, Doors
    dw $D842 : dw $0000 ; Events, Items, Doors
    dw $D844 : dw $0000 ; Events, Items, Doors
    dw $D846 : dw $0000 ; Events, Items, Doors
    dw $D848 : dw $0000 ; Events, Items, Doors
    dw $D84A : dw $0000 ; Events, Items, Doors
    dw $D84C : dw $0000 ; Events, Items, Doors
    dw $D84E : dw $0000 ; Events, Items, Doors
    dw $D850 : dw $0000 ; Events, Items, Doors
    dw $D852 : dw $0000 ; Events, Items, Doors
    dw $D854 : dw $0000 ; Events, Items, Doors
    dw $D856 : dw $0000 ; Events, Items, Doors
    dw $D858 : dw $0000 ; Events, Items, Doors
    dw $D85A : dw $0000 ; Events, Items, Doors
    dw $D85C : dw $0000 ; Events, Items, Doors
    dw $D85E : dw $0000 ; Events, Items, Doors
    dw $D860 : dw $0000 ; Events, Items, Doors
    dw $D862 : dw $0000 ; Events, Items, Doors
    dw $D864 : dw $0000 ; Events, Items, Doors
    dw $D866 : dw $0000 ; Events, Items, Doors
    dw $D868 : dw $0000 ; Events, Items, Doors
    dw $D86A : dw $0000 ; Events, Items, Doors
    dw $D86C : dw $0000 ; Events, Items, Doors
    dw $D86E : dw $0000 ; Events, Items, Doors
    dw $D870 : dw $0000 ; Events, Items, Doors
    dw $D872 : dw $0000 ; Events, Items, Doors
    dw $D874 : dw $0000 ; Events, Items, Doors
    dw $D876 : dw $0000 ; Events, Items, Doors
    dw $D878 : dw $0000 ; Events, Items, Doors
    dw $D87A : dw $0020 ; Events, Items, Doors
    dw $D87C : dw $0000 ; Events, Items, Doors
    dw $D87E : dw $0000 ; Events, Items, Doors
    dw $D880 : dw $0000 ; Events, Items, Doors
    dw $D882 : dw $0000 ; Events, Items, Doors
    dw $D884 : dw $0000 ; Events, Items, Doors
    dw $D886 : dw $0000 ; Events, Items, Doors
    dw $D888 : dw $0000 ; Events, Items, Doors
    dw $D88A : dw $0000 ; Events, Items, Doors
    dw $D88C : dw $0000 ; Events, Items, Doors
    dw $D88E : dw $0000 ; Events, Items, Doors
    dw $D890 : dw $0000 ; Events, Items, Doors
    dw $D892 : dw $0000 ; Events, Items, Doors
    dw $D894 : dw $0000 ; Events, Items, Doors
    dw $D896 : dw $0000 ; Events, Items, Doors
    dw $D898 : dw $0000 ; Events, Items, Doors
    dw $D89A : dw $0000 ; Events, Items, Doors
    dw $D89C : dw $0000 ; Events, Items, Doors
    dw $D89E : dw $0000 ; Events, Items, Doors
    dw $D8A0 : dw $0000 ; Events, Items, Doors
    dw $D8A2 : dw $0000 ; Events, Items, Doors
    dw $D8A4 : dw $0000 ; Events, Items, Doors
    dw $D8A6 : dw $0000 ; Events, Items, Doors
    dw $D8A8 : dw $0000 ; Events, Items, Doors
    dw $D8AA : dw $0000 ; Events, Items, Doors
    dw $D8AC : dw $0000 ; Events, Items, Doors
    dw $D8AE : dw $0000 ; Events, Items, Doors
    dw $D8B0 : dw $0000 ; Events, Items, Doors
    dw $D8B2 : dw $0000 ; Events, Items, Doors
    dw $D8B4 : dw $0000 ; Events, Items, Doors
    dw $D8B6 : dw $0000 ; Events, Items, Doors
    dw $D8B8 : dw $0000 ; Events, Items, Doors
    dw $D8BA : dw $0000 ; Events, Items, Doors
    dw $D8BC : dw $0000 ; Events, Items, Doors
    dw $D8BE : dw $0000 ; Events, Items, Doors
    dw $D8C0 : dw $0000 ; Events, Items, Doors
    dw $D8C2 : dw $0000 ; Events, Items, Doors
    dw $D8C4 : dw $0000 ; Events, Items, Doors
    dw $D8C6 : dw $0000 ; Events, Items, Doors
    dw $D8C8 : dw $0000 ; Events, Items, Doors
    dw $D8CA : dw $0000 ; Events, Items, Doors
    dw $D8CC : dw $0000 ; Events, Items, Doors
    dw $D8CE : dw $0000 ; Events, Items, Doors
    dw $D8D0 : dw $0000 ; Events, Items, Doors
    dw $D8D2 : dw $0000 ; Events, Items, Doors
    dw $D8D4 : dw $0000 ; Events, Items, Doors
    dw $D8D6 : dw $0000 ; Events, Items, Doors
    dw $D8D8 : dw $0000 ; Events, Items, Doors
    dw $D8DA : dw $0000 ; Events, Items, Doors
    dw $D8DC : dw $0000 ; Events, Items, Doors
    dw $D8DE : dw $0000 ; Events, Items, Doors
    dw $D8E0 : dw $0000 ; Events, Items, Doors
    dw $D8E2 : dw $0000 ; Events, Items, Doors
    dw $D8E4 : dw $0000 ; Events, Items, Doors
    dw $D8E6 : dw $0000 ; Events, Items, Doors
    dw $D8E8 : dw $0000 ; Events, Items, Doors
    dw $D8EA : dw $0000 ; Events, Items, Doors
    dw $D8EC : dw $0000 ; Events, Items, Doors
    dw $D8EE : dw $0000 ; Events, Items, Doors
    dw $D8F0 : dw $0000 ; Events, Items, Doors
    dw $D8F2 : dw $0000 ; Events, Items, Doors
    dw $D8F4 : dw $0000 ; Events, Items, Doors
    dw $D8F6 : dw $0000 ; Events, Items, Doors
    dw $D8F8 : dw $0000 ; Events, Items, Doors
    dw $D8FA : dw $0000 ; Events, Items, Doors
    dw $D8FC : dw $0000 ; Events, Items, Doors
    dw $D8FE : dw $0000 ; Events, Items, Doors
    dw $D900 : dw $0000 ; Events, Items, Doors
    dw $D902 : dw $0000 ; Events, Items, Doors
    dw $D904 : dw $0000 ; Events, Items, Doors
    dw $D906 : dw $0000 ; Events, Items, Doors
    dw $D908 : dw $0000 ; Events, Items, Doors
    dw $D90A : dw $0000 ; Events, Items, Doors
    dw $D90C : dw $0000 ; Events, Items, Doors
    dw $D90E : dw $0000 ; Events, Items, Doors
    dw $D910 : dw $0000 ; Events, Items, Doors
    dw $D912 : dw $0000 ; Events, Items, Doors
    dw $D914 : dw $0005 ; Events, Items, Doors
    dw $D916 : dw $0000 ; Events, Items, Doors
    dw $D918 : dw $0000 ; Events, Items, Doors
    dw $D91A : dw $0002 ; Events, Items, Doors
    dw $D91C : dw $0000 ; Events, Items, Doors
    dw $D91E : dw $0000 ; Events, Items, Doors
    dw #$FFFF


preset_SZM101_bombs_shaft_top:
    dw #preset_SZM101_bombs_landing_site ; Bombs: Landing Site
    dw $078D : dw $908A ; DDB
    dw $078F : dw $0001 ; DoorOut Index
    dw $079B : dw $8148 ; MDB
    dw $07F3 : dw $0006 ; Music Bank
    dw $07F5 : dw $0007 ; Music Track
    dw $090F : dw $2C00 ; Screen subpixel X position.
    dw $0911 : dw $0000 ; Screen X position in pixels
    dw $0913 : dw $1400 ; Screen subpixel Y position
    dw $0915 : dw $0000 ; Screen Y position in pixels
    dw $0917 : dw $0000 ; Layer 2 X scroll in room in pixels?
    dw $0919 : dw $0000 ; Layer 2 Y scroll in room in pixels? (up = positive)
    dw $0921 : dw $0100 ; BG2 X scroll offset due to room transitions (Translates between Layer 2 scroll and BG2 scroll)
    dw $0923 : dw $0000 ; BG2 Y scroll offset due to room transitions (Translates between Layer 2 scroll and BG2 scroll)
    dw $0A1C : dw $0001 ; Samus position/state
    dw $0A1E : dw $0008 ; More position/state
    dw $0AF6 : dw $005E ; Samus X
    dw $0AFA : dw $008B ; Samus Y
    dw $D91A : dw $0003 ; Events, Items, Doors
    dw #$FFFF


preset_SZM101_bombs_ceiling_etank:
    dw #preset_SZM101_bombs_shaft_top ; Bombs: Shaft Top
    dw $078D : dw $91AA ; DDB
    dw $078F : dw $0000 ; DoorOut Index
    dw $079B : dw $A2F7 ; MDB
    dw $079F : dw $0001 ; Region
    dw $07C3 : dw $E6B0 ; GFX Pointers
    dw $07C5 : dw $64BB ; GFX Pointers
    dw $07C7 : dw $C2B2 ; GFX Pointers
    dw $07F3 : dw $000F ; Music Bank
    dw $07F5 : dw $0005 ; Music Track
    dw $090F : dw $2000 ; Screen subpixel X position.
    dw $0913 : dw $3000 ; Screen subpixel Y position
    dw $09A2 : dw $0004 ; Equipped Items
    dw $09A4 : dw $0004 ; Collected Items
    dw $09C2 : dw $0059 ; Health
    dw $0AF6 : dw $00CE ; Samus X
    dw $D880 : dw $0001 ; Events, Items, Doors
    dw $D91A : dw $0004 ; Events, Items, Doors
    dw #$FFFF


preset_SZM101_bombs_robo_clip:
    dw #preset_SZM101_bombs_ceiling_etank ; Bombs: Ceiling Etank
    dw $078D : dw $C018 ; DDB
    dw $078F : dw $0002 ; DoorOut Index
    dw $079B : dw $A3DD ; MDB
    dw $090F : dw $F000 ; Screen subpixel X position.
    dw $0913 : dw $1400 ; Screen subpixel Y position
    dw $09C2 : dw $0090 ; Health
    dw $09C4 : dw $0095 ; Max health
    dw $0AF6 : dw $00CF ; Samus X
    dw $D87C : dw $0100 ; Events, Items, Doors
    dw $D91A : dw $0009 ; Events, Items, Doors
    dw #$FFFF


preset_SZM101_bombs_white_wall_kago_room:
    dw #preset_SZM101_bombs_robo_clip ; Bombs: Robo Clip
    dw $078D : dw $97F2 ; DDB
    dw $078F : dw $0000 ; DoorOut Index
    dw $079B : dw $A3AE ; MDB
    dw $090F : dw $8001 ; Screen subpixel X position.
    dw $0911 : dw $0200 ; Screen X position in pixels
    dw $0913 : dw $0000 ; Screen subpixel Y position
    dw $0915 : dw $0300 ; Screen Y position in pixels
    dw $0917 : dw $0200 ; Layer 2 X scroll in room in pixels?
    dw $0919 : dw $0300 ; Layer 2 Y scroll in room in pixels? (up = positive)
    dw $0921 : dw $FD00 ; BG2 X scroll offset due to room transitions (Translates between Layer 2 scroll and BG2 scroll)
    dw $0923 : dw $FD00 ; BG2 Y scroll offset due to room transitions (Translates between Layer 2 scroll and BG2 scroll)
    dw $0AF6 : dw $02CA ; Samus X
    dw $0AFA : dw $038B ; Samus Y
    dw #$FFFF


preset_SZM101_bombs_white_wall_2:
    dw #preset_SZM101_bombs_white_wall_kago_room ; Bombs: White Wall Kago Room
    dw $078D : dw $911A ; DDB
    dw $078F : dw $0001 ; DoorOut Index
    dw $079B : dw $9994 ; MDB
    dw $07C3 : dw $860B ; GFX Pointers
    dw $07C5 : dw $21C0 ; GFX Pointers
    dw $07C7 : dw $C2C0 ; GFX Pointers
    dw $090F : dw $8400 ; Screen subpixel X position.
    dw $0911 : dw $0000 ; Screen X position in pixels
    dw $0913 : dw $E000 ; Screen subpixel Y position
    dw $0915 : dw $0000 ; Screen Y position in pixels
    dw $0917 : dw $0000 ; Layer 2 X scroll in room in pixels?
    dw $0919 : dw $0000 ; Layer 2 Y scroll in room in pixels? (up = positive)
    dw $0921 : dw $0100 ; BG2 X scroll offset due to room transitions (Translates between Layer 2 scroll and BG2 scroll)
    dw $0923 : dw $0000 ; BG2 Y scroll offset due to room transitions (Translates between Layer 2 scroll and BG2 scroll)
    dw $09C2 : dw $0086 ; Health
    dw $0AF6 : dw $00C6 ; Samus X
    dw $0AFA : dw $0095 ; Samus Y
    dw #$FFFF


preset_SZM101_bombs_white_wall_missiles:
    dw #preset_SZM101_bombs_white_wall_2 ; Bombs: White Wall 2
    dw $078D : dw $8C16 ; DDB
    dw $078F : dw $0000 ; DoorOut Index
    dw $079B : dw $A471 ; MDB
    dw $07C3 : dw $A5AA ; GFX Pointers
    dw $07C5 : dw $5FBC ; GFX Pointers
    dw $07C7 : dw $C2B3 ; GFX Pointers
    dw $090F : dw $C400 ; Screen subpixel X position.
    dw $0911 : dw $0100 ; Screen X position in pixels
    dw $0913 : dw $8C00 ; Screen subpixel Y position
    dw $0915 : dw $0013 ; Screen Y position in pixels
    dw $0917 : dw $00C0 ; Layer 2 X scroll in room in pixels?
    dw $0919 : dw $000E ; Layer 2 Y scroll in room in pixels? (up = positive)
    dw $0AF6 : dw $01C0 ; Samus X
    dw $0AFA : dw $009B ; Samus Y
    dw #$FFFF


preset_SZM101_bombs_missile_gate_room:
    dw #preset_SZM101_bombs_white_wall_missiles ; Bombs: White Wall Missiles
    dw $078D : dw $90AE ; DDB
    dw $078F : dw $0002 ; DoorOut Index
    dw $079B : dw $AA0E ; MDB
    dw $090F : dw $1800 ; Screen subpixel X position.
    dw $0911 : dw $0300 ; Screen X position in pixels
    dw $0913 : dw $0000 ; Screen subpixel Y position
    dw $0915 : dw $0100 ; Screen Y position in pixels
    dw $0917 : dw $0240 ; Layer 2 X scroll in room in pixels?
    dw $0919 : dw $00C0 ; Layer 2 Y scroll in room in pixels? (up = positive)
    dw $0921 : dw $FC00 ; BG2 X scroll offset due to room transitions (Translates between Layer 2 scroll and BG2 scroll)
    dw $0923 : dw $FF00 ; BG2 Y scroll offset due to room transitions (Translates between Layer 2 scroll and BG2 scroll)
    dw $09C2 : dw $0095 ; Health
    dw $09C6 : dw $0005 ; Missiles
    dw $09C8 : dw $0005 ; Max missiles
    dw $0AF6 : dw $03BE ; Samus X
    dw $0AFA : dw $018B ; Samus Y
    dw $D872 : dw $0001 ; Events, Items, Doors
    dw $D91A : dw $000E ; Events, Items, Doors
    dw #$FFFF


preset_SZM101_bombs_kihunter_climb:
    dw #preset_SZM101_bombs_missile_gate_room ; Bombs: Missile Gate Room
    dw $078D : dw $90BA ; DDB
    dw $078F : dw $0003 ; DoorOut Index
    dw $079B : dw $962A ; MDB
    dw $079F : dw $0000 ; Region
    dw $07C3 : dw $F911 ; GFX Pointers
    dw $07C5 : dw $43BA ; GFX Pointers
    dw $07C7 : dw $C2AF ; GFX Pointers
    dw $07F5 : dw $0003 ; Music Track
    dw $090F : dw $A000 ; Screen subpixel X position.
    dw $0911 : dw $0000 ; Screen X position in pixels
    dw $0913 : dw $0C00 ; Screen subpixel Y position
    dw $0915 : dw $0000 ; Screen Y position in pixels
    dw $0917 : dw $0000 ; Layer 2 X scroll in room in pixels?
    dw $0919 : dw $0000 ; Layer 2 Y scroll in room in pixels? (up = positive)
    dw $0921 : dw $0000 ; BG2 X scroll offset due to room transitions (Translates between Layer 2 scroll and BG2 scroll)
    dw $0AF6 : dw $007C ; Samus X
    dw $0AFA : dw $005B ; Samus Y
    dw $D91A : dw $000F ; Events, Items, Doors
    dw #$FFFF


preset_SZM101_bombs_harder_robo_clip:
    dw #preset_SZM101_bombs_kihunter_climb ; Bombs: Kihunter Climb
    dw $078D : dw $8AF6 ; DDB
    dw $078F : dw $0000 ; DoorOut Index
    dw $079B : dw $98E2 ; MDB
    dw $07F3 : dw $0009 ; Music Bank
    dw $07F5 : dw $0006 ; Music Track
    dw $090F : dw $9001 ; Screen subpixel X position.
    dw $0913 : dw $0000 ; Screen subpixel Y position
    dw $0915 : dw $0024 ; Screen Y position in pixels
    dw $0919 : dw $001B ; Layer 2 Y scroll in room in pixels? (up = positive)
    dw $0921 : dw $FE00 ; BG2 X scroll offset due to room transitions (Translates between Layer 2 scroll and BG2 scroll)
    dw $0923 : dw $FE00 ; BG2 Y scroll offset due to room transitions (Translates between Layer 2 scroll and BG2 scroll)
    dw $0A1C : dw $0002 ; Samus position/state
    dw $0A1E : dw $0004 ; More position/state
    dw $0AF6 : dw $001F ; Samus X
    dw $0AFA : dw $008B ; Samus Y
    dw #$FFFF


preset_SZM101_bombs_crumble_run:
    dw #preset_SZM101_bombs_harder_robo_clip ; Bombs: Harder Robo Clip
    dw $078D : dw $AE3C ; DDB
    dw $078F : dw $0002 ; DoorOut Index
    dw $079B : dw $9FE5 ; MDB
    dw $090F : dw $A000 ; Screen subpixel X position.
    dw $0911 : dw $0200 ; Screen X position in pixels
    dw $0915 : dw $001F ; Screen Y position in pixels
    dw $0917 : dw $0180 ; Layer 2 X scroll in room in pixels?
    dw $0919 : dw $0017 ; Layer 2 Y scroll in room in pixels? (up = positive)
    dw $0921 : dw $0100 ; BG2 X scroll offset due to room transitions (Translates between Layer 2 scroll and BG2 scroll)
    dw $0923 : dw $0000 ; BG2 Y scroll offset due to room transitions (Translates between Layer 2 scroll and BG2 scroll)
    dw $0A1C : dw $0001 ; Samus position/state
    dw $0A1E : dw $0008 ; More position/state
    dw $0AF6 : dw $02DF ; Samus X
    dw #$FFFF


preset_SZM101_bombs_pirate_jump:
    dw #preset_SZM101_bombs_crumble_run ; Bombs: Crumble Run
    dw $078D : dw $8F82 ; DDB
    dw $078F : dw $0001 ; DoorOut Index
    dw $079B : dw $9A44 ; MDB
    dw $090F : dw $E000 ; Screen subpixel X position.
    dw $0911 : dw $0500 ; Screen X position in pixels
    dw $0915 : dw $021F ; Screen Y position in pixels
    dw $0917 : dw $03C0 ; Layer 2 X scroll in room in pixels?
    dw $0919 : dw $0197 ; Layer 2 Y scroll in room in pixels? (up = positive)
    dw $0923 : dw $FE00 ; BG2 Y scroll offset due to room transitions (Translates between Layer 2 scroll and BG2 scroll)
    dw $09C6 : dw $000A ; Missiles
    dw $09C8 : dw $000A ; Max missiles
    dw $0AF6 : dw $05CB ; Samus X
    dw $0AFA : dw $028B ; Samus Y
    dw $D870 : dw $0080 ; Events, Items, Doors
    dw $D91A : dw $0010 ; Events, Items, Doors
    dw #$FFFF


preset_SZM101_bombs_bomb_torizo:
    dw #preset_SZM101_bombs_pirate_jump ; Bombs: Pirate Jump
    dw $078D : dw $8BAA ; DDB
    dw $078F : dw $0000 ; DoorOut Index
    dw $079B : dw $84F2 ; MDB
    dw $07F3 : dw $0024 ; Music Bank
    dw $07F5 : dw $0003 ; Music Track
    dw $090F : dw $9000 ; Screen subpixel X position.
    dw $0911 : dw $0200 ; Screen X position in pixels
    dw $0913 : dw $5C00 ; Screen subpixel Y position
    dw $0915 : dw $0000 ; Screen Y position in pixels
    dw $0917 : dw $0180 ; Layer 2 X scroll in room in pixels?
    dw $0919 : dw $0000 ; Layer 2 Y scroll in room in pixels? (up = positive)
    dw $0921 : dw $FD00 ; BG2 X scroll offset due to room transitions (Translates between Layer 2 scroll and BG2 scroll)
    dw $0923 : dw $0000 ; BG2 Y scroll offset due to room transitions (Translates between Layer 2 scroll and BG2 scroll)
    dw $09C2 : dw $0063 ; Health
    dw $0AF6 : dw $02C9 ; Samus X
    dw $0AFA : dw $008B ; Samus Y
    dw $D91A : dw $0011 ; Events, Items, Doors
    dw #$FFFF


preset_SZM101_varia_bt_exit:
    dw #preset_SZM101_bombs_bomb_torizo ; Bombs: Bomb Torizo
    dw $078D : dw $8BC2 ; DDB
    dw $078F : dw $0001 ; DoorOut Index
    dw $079B : dw $9804 ; MDB
    dw $090F : dw $B000 ; Screen subpixel X position.
    dw $0911 : dw $0000 ; Screen X position in pixels
    dw $0913 : dw $9C00 ; Screen subpixel Y position
    dw $0917 : dw $0000 ; Layer 2 X scroll in room in pixels?
    dw $0921 : dw $0100 ; BG2 X scroll offset due to room transitions (Translates between Layer 2 scroll and BG2 scroll)
    dw $09A2 : dw $1004 ; Equipped Items
    dw $09A4 : dw $1004 ; Collected Items
    dw $09C2 : dw $0095 ; Health
    dw $0A1C : dw $0002 ; Samus position/state
    dw $0A1E : dw $0004 ; More position/state
    dw $0AF6 : dw $003B ; Samus X
    dw $D828 : dw $0004 ; Events, Items, Doors
    dw $D880 : dw $0003 ; Events, Items, Doors
    dw $D8C2 : dw $0020 ; Events, Items, Doors
    dw $D91A : dw $0012 ; Events, Items, Doors
    dw #$FFFF


preset_SZM101_varia_crumble_run_return:
    dw #preset_SZM101_varia_bt_exit ; Varia: BT Exit
    dw $078D : dw $8BB6 ; DDB
    dw $078F : dw $0000 ; DoorOut Index
    dw $079B : dw $9C5E ; MDB
    dw $07F3 : dw $0009 ; Music Bank
    dw $07F5 : dw $0006 ; Music Track
    dw $090F : dw $E000 ; Screen subpixel X position.
    dw $0913 : dw $E000 ; Screen subpixel Y position
    dw $0915 : dw $02FD ; Screen Y position in pixels
    dw $0919 : dw $02FD ; Layer 2 Y scroll in room in pixels? (up = positive)
    dw $0921 : dw $FF00 ; BG2 X scroll offset due to room transitions (Translates between Layer 2 scroll and BG2 scroll)
    dw $0923 : dw $FC00 ; BG2 Y scroll offset due to room transitions (Translates between Layer 2 scroll and BG2 scroll)
    dw $09C2 : dw $0065 ; Health
    dw $0AF6 : dw $0051 ; Samus X
    dw $0AFA : dw $038B ; Samus Y
    dw #$FFFF


preset_SZM101_varia_ripper_bomb_jump:
    dw #preset_SZM101_varia_crumble_run_return ; Varia: Crumble Run Return
    dw $078D : dw $AE48 ; DDB
    dw $079B : dw $9FE5 ; MDB
    dw $090F : dw $6000 ; Screen subpixel X position.
    dw $0913 : dw $7400 ; Screen subpixel Y position
    dw $0915 : dw $001F ; Screen Y position in pixels
    dw $0919 : dw $0017 ; Layer 2 Y scroll in room in pixels? (up = positive)
    dw $0921 : dw $FD00 ; BG2 X scroll offset due to room transitions (Translates between Layer 2 scroll and BG2 scroll)
    dw $0923 : dw $0000 ; BG2 Y scroll offset due to room transitions (Translates between Layer 2 scroll and BG2 scroll)
    dw $09C2 : dw $0083 ; Health
    dw $0AF6 : dw $0027 ; Samus X
    dw $0AFA : dw $008B ; Samus Y
    dw $D91A : dw $0013 ; Events, Items, Doors
    dw #$FFFF


preset_SZM101_varia_pancake_fall:
    dw #preset_SZM101_varia_ripper_bomb_jump ; Varia: Ripper Bomb Jump
    dw $078D : dw $8F76 ; DDB
    dw $079B : dw $9552 ; MDB
    dw $090F : dw $C000 ; Screen subpixel X position.
    dw $0913 : dw $F800 ; Screen subpixel Y position
    dw $0921 : dw $FF00 ; BG2 X scroll offset due to room transitions (Translates between Layer 2 scroll and BG2 scroll)
    dw $0AF6 : dw $0034 ; Samus X
    dw #$FFFF


preset_SZM101_varia_pre_grapple:
    dw #preset_SZM101_varia_pancake_fall ; Varia: Pancake Fall
    dw $078D : dw $B404 ; DDB
    dw $078F : dw $0003 ; DoorOut Index
    dw $079B : dw $99BD ; MDB
    dw $07C3 : dw $C629 ; GFX Pointers
    dw $07C5 : dw $5DBA ; GFX Pointers
    dw $07C7 : dw $C2AE ; GFX Pointers
    dw $090F : dw $5FFF ; Screen subpixel X position.
    dw $0913 : dw $B400 ; Screen subpixel Y position
    dw $0915 : dw $0308 ; Screen Y position in pixels
    dw $0917 : dw $0001 ; Layer 2 X scroll in room in pixels?
    dw $0919 : dw $0246 ; Layer 2 Y scroll in room in pixels? (up = positive)
    dw $0923 : dw $FB00 ; BG2 Y scroll offset due to room transitions (Translates between Layer 2 scroll and BG2 scroll)
    dw $09C2 : dw $004E ; Health
    dw $09C6 : dw $0008 ; Missiles
    dw $0A1C : dw $0001 ; Samus position/state
    dw $0A1E : dw $0008 ; More position/state
    dw $0AF6 : dw $00C6 ; Samus X
    dw $0AFA : dw $0395 ; Samus Y
    dw $D8C2 : dw $0060 ; Events, Items, Doors
    dw $D91A : dw $0016 ; Events, Items, Doors
    dw #$FFFF


preset_SZM101_varia_post_grapple:
    dw #preset_SZM101_varia_pre_grapple ; Varia: Pre Grapple
    dw $078D : dw $ADC9 ; DDB
    dw $078F : dw $0001 ; DoorOut Index
    dw $079B : dw $9E11 ; MDB
    dw $07C3 : dw $F911 ; GFX Pointers
    dw $07C5 : dw $43BA ; GFX Pointers
    dw $07C7 : dw $C2AF ; GFX Pointers
    dw $07F3 : dw $0036 ; Music Bank
    dw $07F5 : dw $0003 ; Music Track
    dw $090F : dw $A000 ; Screen subpixel X position.
    dw $0913 : dw $4401 ; Screen subpixel Y position
    dw $0915 : dw $0100 ; Screen Y position in pixels
    dw $0917 : dw $0000 ; Layer 2 X scroll in room in pixels?
    dw $0919 : dw $00C0 ; Layer 2 Y scroll in room in pixels? (up = positive)
    dw $0921 : dw $0100 ; BG2 X scroll offset due to room transitions (Translates between Layer 2 scroll and BG2 scroll)
    dw $0923 : dw $FF00 ; BG2 Y scroll offset due to room transitions (Translates between Layer 2 scroll and BG2 scroll)
    dw $09A2 : dw $5004 ; Equipped Items
    dw $09A4 : dw $5004 ; Collected Items
    dw $09C2 : dw $0049 ; Health
    dw $0A1C : dw $0041 ; Samus position/state
    dw $0A1E : dw $0404 ; More position/state
    dw $0AF6 : dw $0037 ; Samus X
    dw $0AFA : dw $0149 ; Samus Y
    dw $D880 : dw $0103 ; Events, Items, Doors
    dw $D91A : dw $0017 ; Events, Items, Doors
    dw #$FFFF


preset_SZM101_varia_super_room_entry:
    dw #preset_SZM101_varia_post_grapple ; Varia: Post Grapple
    dw $078D : dw $BF38 ; DDB
    dw $078F : dw $0000 ; DoorOut Index
    dw $079B : dw $99F9 ; MDB
    dw $07C3 : dw $C629 ; GFX Pointers
    dw $07C5 : dw $5DBA ; GFX Pointers
    dw $07C7 : dw $C2AE ; GFX Pointers
    dw $07F3 : dw $0009 ; Music Bank
    dw $07F5 : dw $0006 ; Music Track
    dw $090F : dw $4000 ; Screen subpixel X position.
    dw $0911 : dw $0700 ; Screen X position in pixels
    dw $0913 : dw $F400 ; Screen subpixel Y position
    dw $0915 : dw $0000 ; Screen Y position in pixels
    dw $0917 : dw $0540 ; Layer 2 X scroll in room in pixels?
    dw $0919 : dw $0000 ; Layer 2 Y scroll in room in pixels? (up = positive)
    dw $0921 : dw $F800 ; BG2 X scroll offset due to room transitions (Translates between Layer 2 scroll and BG2 scroll)
    dw $0923 : dw $0000 ; BG2 Y scroll offset due to room transitions (Translates between Layer 2 scroll and BG2 scroll)
    dw $09C2 : dw $004E ; Health
    dw $0A1C : dw $0002 ; Samus position/state
    dw $0A1E : dw $0004 ; More position/state
    dw $0AF6 : dw $07C9 ; Samus X
    dw $0AFA : dw $008B ; Samus Y
    dw $D91A : dw $001C ; Events, Items, Doors
    dw #$FFFF


preset_SZM101_varia_super_ceiling_bomb_jump:
    dw #preset_SZM101_varia_super_room_entry ; Varia: Super Room Entry
    dw $090F : dw $0000 ; Screen subpixel X position.
    dw $0911 : dw $0175 ; Screen X position in pixels
    dw $0913 : dw $9002 ; Screen subpixel Y position
    dw $0917 : dw $0117 ; Layer 2 X scroll in room in pixels?
    dw $09C2 : dw $00C7 ; Health
    dw $09C4 : dw $00C7 ; Max health
    dw $0A1C : dw $0041 ; Samus position/state
    dw $0A1E : dw $0404 ; More position/state
    dw $0AF6 : dw $0206 ; Samus X
    dw $0AFA : dw $0049 ; Samus Y
    dw $D87C : dw $0108 ; Events, Items, Doors
    dw #$FFFF


preset_SZM101_varia_reserve_kihunters:
    dw #preset_SZM101_varia_super_ceiling_bomb_jump ; Varia: Super Ceiling Bomb Jump
    dw $090F : dw $D000 ; Screen subpixel X position.
    dw $0911 : dw $0000 ; Screen X position in pixels
    dw $0913 : dw $0000 ; Screen subpixel Y position
    dw $0915 : dw $011B ; Screen Y position in pixels
    dw $0917 : dw $0000 ; Layer 2 X scroll in room in pixels?
    dw $0919 : dw $00D4 ; Layer 2 Y scroll in room in pixels? (up = positive)
    dw $09CA : dw $0002 ; Supers
    dw $09CC : dw $0002 ; Max supers
    dw $0A1C : dw $0002 ; Samus position/state
    dw $0A1E : dw $0004 ; More position/state
    dw $0AF6 : dw $0046 ; Samus X
    dw $0AFA : dw $018B ; Samus Y
    dw $D874 : dw $4000 ; Events, Items, Doors
    dw #$FFFF


preset_SZM101_varia_shaft_top_2:
    dw #preset_SZM101_varia_reserve_kihunters ; Varia: Reserve KiHunters
    dw $078D : dw $908A ; DDB
    dw $078F : dw $0001 ; DoorOut Index
    dw $079B : dw $8148 ; MDB
    dw $07C5 : dw $7CBA ; GFX Pointers
    dw $07C7 : dw $C2AD ; GFX Pointers
    dw $07F3 : dw $0006 ; Music Bank
    dw $07F5 : dw $0007 ; Music Track
    dw $090F : dw $E000 ; Screen subpixel X position.
    dw $0913 : dw $B400 ; Screen subpixel Y position
    dw $0915 : dw $0000 ; Screen Y position in pixels
    dw $0919 : dw $0000 ; Layer 2 Y scroll in room in pixels? (up = positive)
    dw $0921 : dw $0100 ; BG2 X scroll offset due to room transitions (Translates between Layer 2 scroll and BG2 scroll)
    dw $09C0 : dw $0001 ; Manual/Auto reserve tank
    dw $09C6 : dw $0007 ; Missiles
    dw $09D4 : dw $0064 ; Max reserves
    dw $0A1C : dw $0001 ; Samus position/state
    dw $0A1E : dw $0008 ; More position/state
    dw $0AF6 : dw $0057 ; Samus X
    dw $0AFA : dw $008B ; Samus Y
    dw $D87E : dw $1000 ; Events, Items, Doors
    dw $D91A : dw $0020 ; Events, Items, Doors
    dw #$FFFF


preset_SZM101_varia_robot_clip_again:
    dw #preset_SZM101_varia_shaft_top_2 ; Varia: Shaft Top
    dw $078D : dw $C018 ; DDB
    dw $078F : dw $0002 ; DoorOut Index
    dw $079B : dw $A3DD ; MDB
    dw $079F : dw $0001 ; Region
    dw $07C3 : dw $E6B0 ; GFX Pointers
    dw $07C5 : dw $64BB ; GFX Pointers
    dw $07C7 : dw $C2B2 ; GFX Pointers
    dw $07F3 : dw $000F ; Music Bank
    dw $07F5 : dw $0005 ; Music Track
    dw $090F : dw $3000 ; Screen subpixel X position.
    dw $0913 : dw $5C00 ; Screen subpixel Y position
    dw $09C6 : dw $000A ; Missiles
    dw $09D6 : dw $0014 ; Reserves
    dw $0AF6 : dw $00C9 ; Samus X
    dw $D91A : dw $0026 ; Events, Items, Doors
    dw #$FFFF


preset_SZM101_varia_acid_dive:
    dw #preset_SZM101_varia_robot_clip_again ; Varia: Robot Clip Again
    dw $078D : dw $9102 ; DDB
    dw $078F : dw $0001 ; DoorOut Index
    dw $079B : dw $A3AE ; MDB
    dw $090F : dw $E000 ; Screen subpixel X position.
    dw $0911 : dw $0200 ; Screen X position in pixels
    dw $0913 : dw $0000 ; Screen subpixel Y position
    dw $0915 : dw $001B ; Screen Y position in pixels
    dw $0917 : dw $0200 ; Layer 2 X scroll in room in pixels?
    dw $0919 : dw $001B ; Layer 2 Y scroll in room in pixels? (up = positive)
    dw $0923 : dw $FD00 ; BG2 Y scroll offset due to room transitions (Translates between Layer 2 scroll and BG2 scroll)
    dw $09C6 : dw $0009 ; Missiles
    dw $09D6 : dw $0064 ; Reserves
    dw $0AF6 : dw $0292 ; Samus X
    dw $0AFA : dw $009B ; Samus Y
    dw $D8C4 : dw $0040 ; Events, Items, Doors
    dw #$FFFF


preset_SZM101_varia_secret_ceiling:
    dw #preset_SZM101_varia_acid_dive ; Varia: Acid Dive
    dw $078D : dw $B194 ; DDB
    dw $078F : dw $0003 ; DoorOut Index
    dw $079B : dw $990D ; MDB
    dw $07C3 : dw $A5AA ; GFX Pointers
    dw $07C5 : dw $5FBC ; GFX Pointers
    dw $07C7 : dw $C2B3 ; GFX Pointers
    dw $090F : dw $7000 ; Screen subpixel X position.
    dw $0911 : dw $0500 ; Screen X position in pixels
    dw $0915 : dw $00ED ; Screen Y position in pixels
    dw $0917 : dw $0500 ; Layer 2 X scroll in room in pixels?
    dw $0919 : dw $00B1 ; Layer 2 Y scroll in room in pixels? (up = positive)
    dw $0923 : dw $0000 ; BG2 Y scroll offset due to room transitions (Translates between Layer 2 scroll and BG2 scroll)
    dw $09C2 : dw $000A ; Health
    dw $09C4 : dw $00F9 ; Max health
    dw $09C6 : dw $000A ; Missiles
    dw $0AF6 : dw $05CC ; Samus X
    dw $0AFA : dw $018B ; Samus Y
    dw $D87C : dw $010C ; Events, Items, Doors
    dw $D91A : dw $0027 ; Events, Items, Doors
    dw #$FFFF


preset_SZM101_power_bombs_varia_exit:
    dw #preset_SZM101_varia_secret_ceiling ; Varia: Secret Ceiling
    dw $078D : dw $8ADE ; DDB
    dw $078F : dw $0000 ; DoorOut Index
    dw $079B : dw $A051 ; MDB
    dw $07F5 : dw $0003 ; Music Track
    dw $090F : dw $8000 ; Screen subpixel X position.
    dw $0911 : dw $0000 ; Screen X position in pixels
    dw $0913 : dw $C000 ; Screen subpixel Y position
    dw $0915 : dw $0000 ; Screen Y position in pixels
    dw $0917 : dw $0000 ; Layer 2 X scroll in room in pixels?
    dw $0919 : dw $0000 ; Layer 2 Y scroll in room in pixels? (up = positive)
    dw $0921 : dw $FF00 ; BG2 X scroll offset due to room transitions (Translates between Layer 2 scroll and BG2 scroll)
    dw $09A2 : dw $5005 ; Equipped Items
    dw $09A4 : dw $5005 ; Collected Items
    dw $09C2 : dw $0028 ; Health
    dw $09C6 : dw $000E ; Missiles
    dw $09C8 : dw $000F ; Max missiles
    dw $0AF6 : dw $007A ; Samus X
    dw $0AFA : dw $008B ; Samus Y
    dw $D870 : dw $0084 ; Events, Items, Doors
    dw $D880 : dw $0123 ; Events, Items, Doors
    dw $D8C6 : dw $4000 ; Events, Items, Doors
    dw $D91A : dw $002A ; Events, Items, Doors
    dw #$FFFF


preset_SZM101_power_bombs_etank_short_mock:
    dw #preset_SZM101_power_bombs_varia_exit ; Power Bombs: Varia Exit
    dw $078D : dw $A384 ; DDB
    dw $078F : dw $0001 ; DoorOut Index
    dw $079B : dw $9BC8 ; MDB
    dw $07F5 : dw $0005 ; Music Track
    dw $090F : dw $0000 ; Screen subpixel X position.
    dw $0911 : dw $0415 ; Screen X position in pixels
    dw $0913 : dw $1800 ; Screen subpixel Y position
    dw $0915 : dw $009A ; Screen Y position in pixels
    dw $0917 : dw $0415 ; Layer 2 X scroll in room in pixels?
    dw $0919 : dw $009A ; Layer 2 Y scroll in room in pixels? (up = positive)
    dw $0921 : dw $0100 ; BG2 X scroll offset due to room transitions (Translates between Layer 2 scroll and BG2 scroll)
    dw $09C2 : dw $0016 ; Health
    dw $09C6 : dw $0013 ; Missiles
    dw $09C8 : dw $0014 ; Max missiles
    dw $0AF6 : dw $0475 ; Samus X
    dw $0AFA : dw $012B ; Samus Y
    dw $D870 : dw $0184 ; Events, Items, Doors
    dw $D91A : dw $002E ; Events, Items, Doors
    dw #$FFFF


preset_SZM101_power_bombs_chozo_etank:
    dw #preset_SZM101_power_bombs_etank_short_mock ; Power Bombs: Etank Short Mock
    dw $078D : dw $8D5A ; DDB
    dw $079B : dw $A322 ; MDB
    dw $07C3 : dw $E6B0 ; GFX Pointers
    dw $07C5 : dw $64BB ; GFX Pointers
    dw $07C7 : dw $C2B2 ; GFX Pointers
    dw $090F : dw $D000 ; Screen subpixel X position.
    dw $0911 : dw $0000 ; Screen X position in pixels
    dw $0913 : dw $F800 ; Screen subpixel Y position
    dw $0915 : dw $0709 ; Screen Y position in pixels
    dw $0917 : dw $0000 ; Layer 2 X scroll in room in pixels?
    dw $0919 : dw $0709 ; Layer 2 Y scroll in room in pixels? (up = positive)
    dw $0923 : dw $FD00 ; BG2 Y scroll offset due to room transitions (Translates between Layer 2 scroll and BG2 scroll)
    dw $09C2 : dw $011F ; Health
    dw $09C4 : dw $012B ; Max health
    dw $09C6 : dw $0012 ; Missiles
    dw $0A1C : dw $0002 ; Samus position/state
    dw $0A1E : dw $0004 ; More position/state
    dw $0AF6 : dw $008D ; Samus X
    dw $0AFA : dw $078B ; Samus Y
    dw $D87C : dw $011C ; Events, Items, Doors
    dw $D8C4 : dw $0050 ; Events, Items, Doors
    dw $D91A : dw $002F ; Events, Items, Doors
    dw #$FFFF


preset_SZM101_power_bombs_un_elevator:
    dw #preset_SZM101_power_bombs_chozo_etank ; Power Bombs: Chozo Etank
    dw $078D : dw $8B1A ; DDB
    dw $078F : dw $0003 ; DoorOut Index
    dw $079B : dw $A6A1 ; MDB
    dw $07F3 : dw $0012 ; Music Bank
    dw $07F5 : dw $0003 ; Music Track
    dw $090F : dw $7000 ; Screen subpixel X position.
    dw $0913 : dw $5000 ; Screen subpixel Y position
    dw $0915 : dw $0000 ; Screen Y position in pixels
    dw $0919 : dw $0000 ; Layer 2 Y scroll in room in pixels? (up = positive)
    dw $0921 : dw $FB00 ; BG2 X scroll offset due to room transitions (Translates between Layer 2 scroll and BG2 scroll)
    dw $0923 : dw $0000 ; BG2 Y scroll offset due to room transitions (Translates between Layer 2 scroll and BG2 scroll)
    dw $09C2 : dw $0158 ; Health
    dw $09C4 : dw $015D ; Max health
    dw $0AF6 : dw $0081 ; Samus X
    dw $0AFA : dw $008B ; Samus Y
    dw $D87C : dw $011E ; Events, Items, Doors
    dw $D91A : dw $0031 ; Events, Items, Doors
    dw #$FFFF


preset_SZM101_power_bombs_shot_block_wall:
    dw #preset_SZM101_power_bombs_un_elevator ; Power Bombs: UN Elevator
    dw $078D : dw $9246 ; DDB
    dw $078F : dw $0005 ; DoorOut Index
    dw $079B : dw $A7DE ; MDB
    dw $079F : dw $0002 ; Region
    dw $07C3 : dw $C3F9 ; GFX Pointers
    dw $07C5 : dw $BBBD ; GFX Pointers
    dw $07C7 : dw $C2B6 ; GFX Pointers
    dw $07F3 : dw $0015 ; Music Bank
    dw $07F5 : dw $0005 ; Music Track
    dw $090F : dw $4000 ; Screen subpixel X position.
    dw $0913 : dw $0000 ; Screen subpixel Y position
    dw $0915 : dw $0422 ; Screen Y position in pixels
    dw $0919 : dw $0422 ; Layer 2 Y scroll in room in pixels? (up = positive)
    dw $0921 : dw $0000 ; BG2 X scroll offset due to room transitions (Translates between Layer 2 scroll and BG2 scroll)
    dw $0923 : dw $00E0 ; BG2 Y scroll offset due to room transitions (Translates between Layer 2 scroll and BG2 scroll)
    dw $09CA : dw $0001 ; Supers
    dw $0AF6 : dw $0025 ; Samus X
    dw $0AFA : dw $048B ; Samus Y
    dw $D91A : dw $0033 ; Events, Items, Doors
    dw #$FFFF


preset_SZM101_power_bombs_lava_dive_farm:
    dw #preset_SZM101_power_bombs_shot_block_wall ; Power Bombs: Shot Block Wall
    dw $078D : dw $9306 ; DDB
    dw $078F : dw $0007 ; DoorOut Index
    dw $079B : dw $A865 ; MDB
    dw $090F : dw $3001 ; Screen subpixel X position.
    dw $0913 : dw $1802 ; Screen subpixel Y position
    dw $0915 : dw $0000 ; Screen Y position in pixels
    dw $0919 : dw $0000 ; Layer 2 Y scroll in room in pixels? (up = positive)
    dw $0921 : dw $FB00 ; BG2 X scroll offset due to room transitions (Translates between Layer 2 scroll and BG2 scroll)
    dw $0923 : dw $0000 ; BG2 Y scroll offset due to room transitions (Translates between Layer 2 scroll and BG2 scroll)
    dw $09C2 : dw $015D ; Health
    dw $0A1C : dw $0041 ; Samus position/state
    dw $0A1E : dw $0404 ; More position/state
    dw $0AF6 : dw $0045 ; Samus X
    dw $0AFA : dw $0069 ; Samus Y
    dw #$FFFF


preset_SZM101_power_bombs_lava_dive_etank:
    dw #preset_SZM101_power_bombs_lava_dive_farm ; Power Bombs: Lava Dive Farm
    dw $078D : dw $B080 ; DDB
    dw $078F : dw $0001 ; DoorOut Index
    dw $079B : dw $AC5A ; MDB
    dw $090F : dw $5000 ; Screen subpixel X position.
    dw $0911 : dw $000D ; Screen X position in pixels
    dw $0913 : dw $FC00 ; Screen subpixel Y position
    dw $0915 : dw $0400 ; Screen Y position in pixels
    dw $0917 : dw $000D ; Layer 2 X scroll in room in pixels?
    dw $0919 : dw $0400 ; Layer 2 Y scroll in room in pixels? (up = positive)
    dw $0921 : dw $0100 ; BG2 X scroll offset due to room transitions (Translates between Layer 2 scroll and BG2 scroll)
    dw $0923 : dw $FD00 ; BG2 Y scroll offset due to room transitions (Translates between Layer 2 scroll and BG2 scroll)
    dw $09C2 : dw $0090 ; Health
    dw $09C6 : dw $0019 ; Missiles
    dw $09C8 : dw $0019 ; Max missiles
    dw $09CA : dw $0002 ; Supers
    dw $0A1C : dw $0002 ; Samus position/state
    dw $0A1E : dw $0004 ; More position/state
    dw $0AF6 : dw $0096 ; Samus X
    dw $0AFA : dw $048B ; Samus Y
    dw $D872 : dw $0101 ; Events, Items, Doors
    dw $D91A : dw $0037 ; Events, Items, Doors
    dw #$FFFF


preset_SZM101_power_bombs_big_hopper_empty_shaft:
    dw #preset_SZM101_power_bombs_lava_dive_etank ; Power Bombs: Lava Dive Etank
    dw $078D : dw $94E6 ; DDB
    dw $078F : dw $0000 ; DoorOut Index
    dw $079B : dw $B07A ; MDB
    dw $079F : dw $0001 ; Region
    dw $07C3 : dw $A5AA ; GFX Pointers
    dw $07C5 : dw $5FBC ; GFX Pointers
    dw $07C7 : dw $C2B3 ; GFX Pointers
    dw $07F5 : dw $0003 ; Music Track
    dw $090F : dw $C000 ; Screen subpixel X position.
    dw $0911 : dw $0000 ; Screen X position in pixels
    dw $0913 : dw $0000 ; Screen subpixel Y position
    dw $0915 : dw $0000 ; Screen Y position in pixels
    dw $0917 : dw $0000 ; Layer 2 X scroll in room in pixels?
    dw $0919 : dw $0000 ; Layer 2 Y scroll in room in pixels? (up = positive)
    dw $0921 : dw $FF00 ; BG2 X scroll offset due to room transitions (Translates between Layer 2 scroll and BG2 scroll)
    dw $0923 : dw $0000 ; BG2 Y scroll offset due to room transitions (Translates between Layer 2 scroll and BG2 scroll)
    dw $09C2 : dw $00D4 ; Health
    dw $09C4 : dw $018F ; Max health
    dw $09C6 : dw $0017 ; Missiles
    dw $0A1C : dw $0041 ; Samus position/state
    dw $0A1E : dw $0404 ; More position/state
    dw $0AF6 : dw $00B5 ; Samus X
    dw $0AFA : dw $0099 ; Samus Y
    dw $D87C : dw $811E ; Events, Items, Doors
    dw $D91A : dw $0038 ; Events, Items, Doors
    dw #$FFFF


preset_SZM101_power_bombs_speed_room:
    dw #preset_SZM101_power_bombs_big_hopper_empty_shaft ; Power Bombs: Big Hopper Empty Shaft
    dw $078D : dw $97AA ; DDB
    dw $079B : dw $ACF0 ; MDB
    dw $07C3 : dw $E6B0 ; GFX Pointers
    dw $07C5 : dw $64BB ; GFX Pointers
    dw $07C7 : dw $C2B2 ; GFX Pointers
    dw $07F3 : dw $0012 ; Music Bank
    dw $07F5 : dw $0005 ; Music Track
    dw $090F : dw $0000 ; Screen subpixel X position.
    dw $0913 : dw $7000 ; Screen subpixel Y position
    dw $0915 : dw $0400 ; Screen Y position in pixels
    dw $0919 : dw $0400 ; Layer 2 Y scroll in room in pixels? (up = positive)
    dw $0921 : dw $FA00 ; BG2 X scroll offset due to room transitions (Translates between Layer 2 scroll and BG2 scroll)
    dw $09C2 : dw $0043 ; Health
    dw $0A1C : dw $0002 ; Samus position/state
    dw $0A1E : dw $0004 ; More position/state
    dw $0AF6 : dw $0093 ; Samus X
    dw $0AFA : dw $049B ; Samus Y
    dw $D91A : dw $0039 ; Events, Items, Doors
    dw #$FFFF


preset_SZM101_power_bombs_big_hopper_ramps:
    dw #preset_SZM101_power_bombs_speed_room ; Power Bombs: Speed Room
    dw $078D : dw $B0B0 ; DDB
    dw $078F : dw $0001 ; DoorOut Index
    dw $079B : dw $AD1B ; MDB
    dw $07C3 : dw $A5AA ; GFX Pointers
    dw $07C5 : dw $5FBC ; GFX Pointers
    dw $07C7 : dw $C2B3 ; GFX Pointers
    dw $07F5 : dw $0003 ; Music Track
    dw $090F : dw $4000 ; Screen subpixel X position.
    dw $0911 : dw $0100 ; Screen X position in pixels
    dw $0913 : dw $A800 ; Screen subpixel Y position
    dw $0915 : dw $0100 ; Screen Y position in pixels
    dw $0917 : dw $0100 ; Layer 2 X scroll in room in pixels?
    dw $0919 : dw $0100 ; Layer 2 Y scroll in room in pixels? (up = positive)
    dw $0921 : dw $FE00 ; BG2 X scroll offset due to room transitions (Translates between Layer 2 scroll and BG2 scroll)
    dw $0923 : dw $FF00 ; BG2 Y scroll offset due to room transitions (Translates between Layer 2 scroll and BG2 scroll)
    dw $09A2 : dw $7005 ; Equipped Items
    dw $09A4 : dw $7005 ; Collected Items
    dw $09C2 : dw $018F ; Health
    dw $09C6 : dw $0019 ; Missiles
    dw $09CA : dw $0004 ; Supers
    dw $09CC : dw $0004 ; Max supers
    dw $0A1C : dw $0001 ; Samus position/state
    dw $0A1E : dw $0008 ; More position/state
    dw $0AF6 : dw $0175 ; Samus X
    dw $0AFA : dw $019B ; Samus Y
    dw $D820 : dw $0001 ; Events, Items, Doors
    dw $D878 : dw $0001 ; Events, Items, Doors
    dw $D880 : dw $0163 ; Events, Items, Doors
    dw $D8CE : dw $4000 ; Events, Items, Doors
    dw $D91A : dw $003B ; Events, Items, Doors
    dw #$FFFF


preset_SZM101_power_bombs_maglodite_lava_dive:
    dw #preset_SZM101_power_bombs_big_hopper_ramps ; Power Bombs: Big Hopper Ramps
    dw $078D : dw $B0BC ; DDB
    dw $078F : dw $0002 ; DoorOut Index
    dw $079B : dw $B07A ; MDB
    dw $090F : dw $4400 ; Screen subpixel X position.
    dw $0911 : dw $0000 ; Screen X position in pixels
    dw $0913 : dw $F400 ; Screen subpixel Y position
    dw $0915 : dw $001B ; Screen Y position in pixels
    dw $0917 : dw $0000 ; Layer 2 X scroll in room in pixels?
    dw $0919 : dw $001B ; Layer 2 Y scroll in room in pixels? (up = positive)
    dw $0921 : dw $0100 ; BG2 X scroll offset due to room transitions (Translates between Layer 2 scroll and BG2 scroll)
    dw $0923 : dw $FD00 ; BG2 Y scroll offset due to room transitions (Translates between Layer 2 scroll and BG2 scroll)
    dw $09C2 : dw $014E ; Health
    dw $09CA : dw $0006 ; Supers
    dw $09CC : dw $0006 ; Max supers
    dw $0AF6 : dw $00B5 ; Samus X
    dw $0AFA : dw $008B ; Samus Y
    dw $D876 : dw $8000 ; Events, Items, Doors
    dw $D91A : dw $003C ; Events, Items, Doors
    dw #$FFFF


preset_SZM101_power_bombs_springball_room_:
    dw #preset_SZM101_power_bombs_maglodite_lava_dive ; Power Bombs: Maglodite Lava Dive
    dw $078D : dw $9786 ; DDB
    dw $078F : dw $0000 ; DoorOut Index
    dw $079B : dw $AC5A ; MDB
    dw $079F : dw $0002 ; Region
    dw $07C3 : dw $C3F9 ; GFX Pointers
    dw $07C5 : dw $BBBD ; GFX Pointers
    dw $07C7 : dw $C2B6 ; GFX Pointers
    dw $07F3 : dw $0015 ; Music Bank
    dw $07F5 : dw $0005 ; Music Track
    dw $090F : dw $0300 ; Screen subpixel X position.
    dw $0911 : dw $0500 ; Screen X position in pixels
    dw $0913 : dw $0000 ; Screen subpixel Y position
    dw $0915 : dw $024C ; Screen Y position in pixels
    dw $0917 : dw $0500 ; Layer 2 X scroll in room in pixels?
    dw $0919 : dw $024C ; Layer 2 Y scroll in room in pixels? (up = positive)
    dw $0923 : dw $FC00 ; BG2 Y scroll offset due to room transitions (Translates between Layer 2 scroll and BG2 scroll)
    dw $09C2 : dw $0134 ; Health
    dw $0A1C : dw $0089 ; Samus position/state
    dw $0A1E : dw $1508 ; More position/state
    dw $0AF6 : dw $05DB ; Samus X
    dw $0AFA : dw $02BB ; Samus Y
    dw $D91A : dw $003E ; Events, Items, Doors
    dw #$FFFF


preset_SZM101_power_bombs_spikesuit:
    dw #preset_SZM101_power_bombs_springball_room_ ; Power Bombs: Springball Room 
    dw $078D : dw $AFFC ; DDB
    dw $079B : dw $AB07 ; MDB
    dw $090F : dw $B000 ; Screen subpixel X position.
    dw $0911 : dw $0000 ; Screen X position in pixels
    dw $0915 : dw $0400 ; Screen Y position in pixels
    dw $0917 : dw $0000 ; Layer 2 X scroll in room in pixels?
    dw $0919 : dw $0300 ; Layer 2 Y scroll in room in pixels? (up = positive)
    dw $0923 : dw $FD00 ; BG2 Y scroll offset due to room transitions (Translates between Layer 2 scroll and BG2 scroll)
    dw $09C6 : dw $0018 ; Missiles
    dw $0A1C : dw $0001 ; Samus position/state
    dw $0A1E : dw $0008 ; More position/state
    dw $0AF6 : dw $00C4 ; Samus X
    dw $0AFA : dw $048B ; Samus Y
    dw $D91A : dw $0040 ; Events, Items, Doors
    dw #$FFFF


preset_SZM101_power_bombs_morph_gauntlet:
    dw #preset_SZM101_power_bombs_spikesuit ; Power Bombs: Spikesuit
    dw $078D : dw $9276 ; DDB
    dw $079B : dw $AEDF ; MDB
    dw $07C5 : dw $E4BD ; GFX Pointers
    dw $07C7 : dw $C2B5 ; GFX Pointers
    dw $090F : dw $C000 ; Screen subpixel X position.
    dw $0913 : dw $4000 ; Screen subpixel Y position
    dw $0915 : dw $011F ; Screen Y position in pixels
    dw $0919 : dw $011F ; Layer 2 Y scroll in room in pixels? (up = positive)
    dw $0923 : dw $FF00 ; BG2 Y scroll offset due to room transitions (Translates between Layer 2 scroll and BG2 scroll)
    dw $09C2 : dw $00CB ; Health
    dw $0A1C : dw $001D ; Samus position/state
    dw $0A1E : dw $0408 ; More position/state
    dw $0A68 : dw $0001 ; Flash suit
    dw $0AF6 : dw $0097 ; Samus X
    dw $0AFA : dw $01D9 ; Samus Y
    dw #$FFFF


preset_SZM101_upper_norfair_leaving_power_bomb_room:
    dw #preset_SZM101_power_bombs_morph_gauntlet ; Power Bombs: Morph Gauntlet
    dw $078D : dw $B1F4 ; DDB
    dw $078F : dw $0002 ; DoorOut Index
    dw $079B : dw $ADAD ; MDB
    dw $090F : dw $CE80 ; Screen subpixel X position.
    dw $0913 : dw $0000 ; Screen subpixel Y position
    dw $0915 : dw $00FC ; Screen Y position in pixels
    dw $0919 : dw $00FC ; Layer 2 Y scroll in room in pixels? (up = positive)
    dw $09C2 : dw $00F0 ; Health
    dw $09CA : dw $0005 ; Supers
    dw $09CE : dw $0002 ; Pbs
    dw $09D0 : dw $0002 ; Max pbs
    dw $0A1C : dw $0002 ; Samus position/state
    dw $0A1E : dw $0004 ; More position/state
    dw $0A68 : dw $0000 ; Flash suit
    dw $0AF6 : dw $0031 ; Samus X
    dw $0AFA : dw $018B ; Samus Y
    dw $0B3F : dw $0004 ; Blue suit
    dw $D878 : dw $4001 ; Events, Items, Doors
    dw $D8C6 : dw $4020 ; Events, Items, Doors
    dw $D91A : dw $0041 ; Events, Items, Doors
    dw #$FFFF


preset_SZM101_upper_norfair_pre_ice:
    dw #preset_SZM101_upper_norfair_leaving_power_bomb_room ; Upper Norfair: Leaving Power Bomb Room
    dw $078D : dw $970E ; DDB
    dw $078F : dw $0000 ; DoorOut Index
    dw $079B : dw $A923 ; MDB
    dw $07C5 : dw $BBBD ; GFX Pointers
    dw $07C7 : dw $C2B6 ; GFX Pointers
    dw $090F : dw $6000 ; Screen subpixel X position.
    dw $0915 : dw $001D ; Screen Y position in pixels
    dw $0919 : dw $001D ; Layer 2 Y scroll in room in pixels? (up = positive)
    dw $0923 : dw $F800 ; BG2 Y scroll offset due to room transitions (Translates between Layer 2 scroll and BG2 scroll)
    dw $09C2 : dw $00E6 ; Health
    dw $09CA : dw $0006 ; Supers
    dw $0AF6 : dw $0082 ; Samus X
    dw $0AFA : dw $008B ; Samus Y
    dw $0B3F : dw $0000 ; Blue suit
    dw $D91A : dw $0042 ; Events, Items, Doors
    dw #$FFFF


preset_SZM101_upper_norfair_leaving_ice:
    dw #preset_SZM101_upper_norfair_pre_ice ; Upper Norfair: Pre Ice
    dw $078D : dw $96AE ; DDB
    dw $079B : dw $AC83 ; MDB
    dw $07F5 : dw $0003 ; Music Track
    dw $090F : dw $8180 ; Screen subpixel X position.
    dw $0911 : dw $0100 ; Screen X position in pixels
    dw $0913 : dw $B800 ; Screen subpixel Y position
    dw $0915 : dw $0000 ; Screen Y position in pixels
    dw $0917 : dw $0100 ; Layer 2 X scroll in room in pixels?
    dw $0919 : dw $0000 ; Layer 2 Y scroll in room in pixels? (up = positive)
    dw $0921 : dw $FE00 ; BG2 X scroll offset due to room transitions (Translates between Layer 2 scroll and BG2 scroll)
    dw $0923 : dw $0000 ; BG2 Y scroll offset due to room transitions (Translates between Layer 2 scroll and BG2 scroll)
    dw $09A6 : dw $0002 ; Beams
    dw $09A8 : dw $0002 ; Beams
    dw $09C6 : dw $0017 ; Missiles
    dw $09CA : dw $0005 ; Supers
    dw $0A1C : dw $0001 ; Samus position/state
    dw $0A1E : dw $0008 ; More position/state
    dw $0AF6 : dw $0192 ; Samus X
    dw $D880 : dw $01E3 ; Events, Items, Doors
    dw $D8C4 : dw $2050 ; Events, Items, Doors
    dw $D8C6 : dw $40A0 ; Events, Items, Doors
    dw $D91A : dw $0043 ; Events, Items, Doors
    dw #$FFFF


preset_SZM101_upper_norfair_baby_croc_supers:
    dw #preset_SZM101_upper_norfair_leaving_ice ; Upper Norfair: Leaving Ice
    dw $078D : dw $96BA ; DDB
    dw $078F : dw $0001 ; DoorOut Index
    dw $079B : dw $A923 ; MDB
    dw $07F5 : dw $0005 ; Music Track
    dw $090F : dw $7D80 ; Screen subpixel X position.
    dw $0911 : dw $0000 ; Screen X position in pixels
    dw $0913 : dw $0000 ; Screen subpixel Y position
    dw $0915 : dw $0324 ; Screen Y position in pixels
    dw $0917 : dw $0000 ; Layer 2 X scroll in room in pixels?
    dw $0919 : dw $0324 ; Layer 2 Y scroll in room in pixels? (up = positive)
    dw $0921 : dw $0100 ; BG2 X scroll offset due to room transitions (Translates between Layer 2 scroll and BG2 scroll)
    dw $09C2 : dw $00E1 ; Health
    dw $09CA : dw $0006 ; Supers
    dw $09CC : dw $0008 ; Max supers
    dw $0A1C : dw $0002 ; Samus position/state
    dw $0A1E : dw $0004 ; More position/state
    dw $0AF6 : dw $0031 ; Samus X
    dw $0AFA : dw $0394 ; Samus Y
    dw $D876 : dw $A000 ; Events, Items, Doors
    dw $D91A : dw $0044 ; Events, Items, Doors
    dw #$FFFF


preset_SZM101_upper_norfair_pre_hi_jump:
    dw #preset_SZM101_upper_norfair_baby_croc_supers ; Upper Norfair: Baby Croc Supers
    dw $078D : dw $93BA ; DDB
    dw $078F : dw $0002 ; DoorOut Index
    dw $079B : dw $AD5E ; MDB
    dw $090F : dw $0080 ; Screen subpixel X position.
    dw $0911 : dw $0300 ; Screen X position in pixels
    dw $0915 : dw $0411 ; Screen Y position in pixels
    dw $0917 : dw $0300 ; Layer 2 X scroll in room in pixels?
    dw $0919 : dw $0411 ; Layer 2 Y scroll in room in pixels? (up = positive)
    dw $0921 : dw $FC00 ; BG2 X scroll offset due to room transitions (Translates between Layer 2 scroll and BG2 scroll)
    dw $0923 : dw $FF00 ; BG2 Y scroll offset due to room transitions (Translates between Layer 2 scroll and BG2 scroll)
    dw $09C2 : dw $01C1 ; Health
    dw $09C4 : dw $01C1 ; Max health
    dw $09CA : dw $0007 ; Supers
    dw $09CC : dw $000A ; Max supers
    dw $0A1C : dw $0001 ; Samus position/state
    dw $0A1E : dw $0008 ; More position/state
    dw $0A68 : dw $0000 ; Flash suit
    dw $0AF6 : dw $03D1 ; Samus X
    dw $0AFA : dw $0484 ; Samus Y
    dw $0B3F : dw $0004 ; Blue suit
    dw $D878 : dw $4003 ; Events, Items, Doors
    dw $D87C : dw $A11E ; Events, Items, Doors
    dw $D91A : dw $0046 ; Events, Items, Doors
    dw #$FFFF


preset_SZM101_upper_norfair_leaving_hi_jump:
    dw #preset_SZM101_upper_norfair_pre_hi_jump ; Upper Norfair: Pre Hi Jump
    dw $078D : dw $93AE ; DDB
    dw $078F : dw $0001 ; DoorOut Index
    dw $079B : dw $A9E5 ; MDB
    dw $07F5 : dw $0003 ; Music Track
    dw $090F : dw $1400 ; Screen subpixel X position.
    dw $0911 : dw $0000 ; Screen X position in pixels
    dw $0915 : dw $000B ; Screen Y position in pixels
    dw $0917 : dw $0000 ; Layer 2 X scroll in room in pixels?
    dw $0919 : dw $0008 ; Layer 2 Y scroll in room in pixels? (up = positive)
    dw $0921 : dw $0100 ; BG2 X scroll offset due to room transitions (Translates between Layer 2 scroll and BG2 scroll)
    dw $0923 : dw $0000 ; BG2 Y scroll offset due to room transitions (Translates between Layer 2 scroll and BG2 scroll)
    dw $09A2 : dw $7105 ; Equipped Items
    dw $09A4 : dw $7105 ; Collected Items
    dw $09C6 : dw $0016 ; Missiles
    dw $0A1C : dw $0002 ; Samus position/state
    dw $0A1E : dw $0004 ; More position/state
    dw $0AF6 : dw $0098 ; Samus X
    dw $0AFA : dw $007B ; Samus Y
    dw $D880 : dw $01F3 ; Events, Items, Doors
    dw $D8C4 : dw $A050 ; Events, Items, Doors
    dw $D91A : dw $0048 ; Events, Items, Doors
    dw #$FFFF


preset_SZM101_upper_norfair_springball:
    dw #preset_SZM101_upper_norfair_leaving_hi_jump ; Upper Norfair: Leaving Hi Jump
    dw $078D : dw $9282 ; DDB
    dw $079B : dw $AB07 ; MDB
    dw $07F5 : dw $0005 ; Music Track
    dw $090F : dw $F000 ; Screen subpixel X position.
    dw $0915 : dw $0000 ; Screen Y position in pixels
    dw $0919 : dw $0000 ; Layer 2 Y scroll in room in pixels? (up = positive)
    dw $0921 : dw $FF00 ; BG2 X scroll offset due to room transitions (Translates between Layer 2 scroll and BG2 scroll)
    dw $0923 : dw $FC00 ; BG2 Y scroll offset due to room transitions (Translates between Layer 2 scroll and BG2 scroll)
    dw $09C2 : dw $019E ; Health
    dw $09CA : dw $0009 ; Supers
    dw $0AF6 : dw $003D ; Samus X
    dw $0AFA : dw $008B ; Samus Y
    dw $0B3F : dw $0000 ; Blue suit
    dw $D91A : dw $0049 ; Events, Items, Doors
    dw #$FFFF


preset_SZM101_upper_norfair_big_dessgeegas:
    dw #preset_SZM101_upper_norfair_springball ; Upper Norfair: Springball
    dw $078D : dw $949E ; DDB
    dw $078F : dw $0003 ; DoorOut Index
    dw $079B : dw $ADDE ; MDB
    dw $090F : dw $1C00 ; Screen subpixel X position.
    dw $0911 : dw $0220 ; Screen X position in pixels
    dw $0913 : dw $9800 ; Screen subpixel Y position
    dw $0915 : dw $0500 ; Screen Y position in pixels
    dw $0917 : dw $0220 ; Layer 2 X scroll in room in pixels?
    dw $0919 : dw $0500 ; Layer 2 Y scroll in room in pixels? (up = positive)
    dw $0921 : dw $F900 ; BG2 X scroll offset due to room transitions (Translates between Layer 2 scroll and BG2 scroll)
    dw $0923 : dw $0000 ; BG2 Y scroll offset due to room transitions (Translates between Layer 2 scroll and BG2 scroll)
    dw $09A2 : dw $7107 ; Equipped Items
    dw $09A4 : dw $7107 ; Collected Items
    dw $09C2 : dw $01BC ; Health
    dw $09C6 : dw $0006 ; Missiles
    dw $09CE : dw $0004 ; Pbs
    dw $09D0 : dw $0004 ; Max pbs
    dw $0A1C : dw $0001 ; Samus position/state
    dw $0A1E : dw $0008 ; More position/state
    dw $0AF6 : dw $0298 ; Samus X
    dw $0AFA : dw $057B ; Samus Y
    dw $D878 : dw $C003 ; Events, Items, Doors
    dw $D880 : dw $41F3 ; Events, Items, Doors
    dw $D91A : dw $004B ; Events, Items, Doors
    dw #$FFFF


preset_SZM101_upper_norfair_wave_block_pit:
    dw #preset_SZM101_upper_norfair_big_dessgeegas ; Upper Norfair: Big Dessgeegas
    dw $078D : dw $B248 ; DDB
    dw $078F : dw $0001 ; DoorOut Index
    dw $079B : dw $B1BB ; MDB
    dw $07C5 : dw $E4BD ; GFX Pointers
    dw $07C7 : dw $C2B5 ; GFX Pointers
    dw $090F : dw $6780 ; Screen subpixel X position.
    dw $0911 : dw $0000 ; Screen X position in pixels
    dw $0913 : dw $F000 ; Screen subpixel Y position
    dw $0915 : dw $0000 ; Screen Y position in pixels
    dw $0917 : dw $0000 ; Layer 2 X scroll in room in pixels?
    dw $0919 : dw $0000 ; Layer 2 Y scroll in room in pixels? (up = positive)
    dw $0921 : dw $0100 ; BG2 X scroll offset due to room transitions (Translates between Layer 2 scroll and BG2 scroll)
    dw $09C2 : dw $018A ; Health
    dw $09CA : dw $0008 ; Supers
    dw $0AF6 : dw $0039 ; Samus X
    dw $0AFA : dw $008B ; Samus Y
    dw $D8C6 : dw $40E0 ; Events, Items, Doors
    dw $D91A : dw $004F ; Events, Items, Doors
    dw #$FFFF


preset_SZM101_upper_norfair_exiting_wave:
    dw #preset_SZM101_upper_norfair_wave_block_pit ; Upper Norfair: Wave Block Pit
    dw $078D : dw $8C0A ; DDB
    dw $079B : dw $A815 ; MDB
    dw $090F : dw $9400 ; Screen subpixel X position.
    dw $0911 : dw $0500 ; Screen X position in pixels
    dw $0913 : dw $0000 ; Screen subpixel Y position
    dw $0917 : dw $0500 ; Layer 2 X scroll in room in pixels?
    dw $0921 : dw $F900 ; BG2 X scroll offset due to room transitions (Translates between Layer 2 scroll and BG2 scroll)
    dw $09A6 : dw $0003 ; Beams
    dw $09A8 : dw $0003 ; Beams
    dw $09CA : dw $0009 ; Supers
    dw $0AF6 : dw $0547 ; Samus X
    dw $D880 : dw $43F3 ; Events, Items, Doors
    dw $D8C4 : dw $B050 ; Events, Items, Doors
    dw $D91A : dw $0053 ; Events, Items, Doors
    dw #$FFFF


preset_SZM101_upper_norfair_missiles_below_wave:
    dw #preset_SZM101_upper_norfair_exiting_wave ; Upper Norfair: Exiting Wave
    dw $078D : dw $B260 ; DDB
    dw $078F : dw $0003 ; DoorOut Index
    dw $079B : dw $A788 ; MDB
    dw $090F : dw $C000 ; Screen subpixel X position.
    dw $0911 : dw $00EB ; Screen X position in pixels
    dw $0913 : dw $5000 ; Screen subpixel Y position
    dw $0915 : dw $030D ; Screen Y position in pixels
    dw $0917 : dw $00B0 ; Layer 2 X scroll in room in pixels?
    dw $0919 : dw $0249 ; Layer 2 Y scroll in room in pixels? (up = positive)
    dw $0921 : dw $0100 ; BG2 X scroll offset due to room transitions (Translates between Layer 2 scroll and BG2 scroll)
    dw $09CA : dw $0007 ; Supers
    dw $09CE : dw $0003 ; Pbs
    dw $0A1C : dw $0002 ; Samus position/state
    dw $0A1E : dw $0004 ; More position/state
    dw $0AF6 : dw $0186 ; Samus X
    dw $0AFA : dw $037B ; Samus Y
    dw #$FFFF


preset_SZM101_upper_norfair_wave_wave_gate:
    dw #preset_SZM101_upper_norfair_missiles_below_wave ; Upper Norfair: Missiles Below Wave
    dw $078D : dw $B26C ; DDB
    dw $078F : dw $0004 ; DoorOut Index
    dw $0911 : dw $0000 ; Screen X position in pixels
    dw $0913 : dw $F400 ; Screen subpixel Y position
    dw $0915 : dw $011C ; Screen Y position in pixels
    dw $0917 : dw $0000 ; Layer 2 X scroll in room in pixels?
    dw $0919 : dw $00D5 ; Layer 2 Y scroll in room in pixels? (up = positive)
    dw $0923 : dw $FD00 ; BG2 Y scroll offset due to room transitions (Translates between Layer 2 scroll and BG2 scroll)
    dw $09C2 : dw $01C1 ; Health
    dw $09C6 : dw $0016 ; Missiles
    dw $09C8 : dw $001E ; Max missiles
    dw $09CA : dw $0009 ; Supers
    dw $09CE : dw $0004 ; Pbs
    dw $0AF6 : dw $004C ; Samus X
    dw $0AFA : dw $018B ; Samus Y
    dw $D872 : dw $0181 ; Events, Items, Doors
    dw $D91A : dw $0057 ; Events, Items, Doors
    dw #$FFFF


preset_SZM101_upper_norfair_super_blockade:
    dw #preset_SZM101_upper_norfair_wave_wave_gate ; Upper Norfair: Wave Wave Gate
    dw $078D : dw $B254 ; DDB
    dw $078F : dw $0002 ; DoorOut Index
    dw $079B : dw $AFCE ; MDB
    dw $090F : dw $4000 ; Screen subpixel X position.
    dw $0913 : dw $D3FF ; Screen subpixel Y position
    dw $0915 : dw $011B ; Screen Y position in pixels
    dw $0919 : dw $011B ; Layer 2 Y scroll in room in pixels? (up = positive)
    dw $0921 : dw $0000 ; BG2 X scroll offset due to room transitions (Translates between Layer 2 scroll and BG2 scroll)
    dw $0923 : dw $00E0 ; BG2 Y scroll offset due to room transitions (Translates between Layer 2 scroll and BG2 scroll)
    dw $09C6 : dw $001A ; Missiles
    dw $09CA : dw $000A ; Supers
    dw $0AF6 : dw $0031 ; Samus X
    dw $D91A : dw $005B ; Events, Items, Doors
    dw #$FFFF


preset_SZM101_upper_norfair_acid_party:
    dw #preset_SZM101_upper_norfair_super_blockade ; Upper Norfair: Super Blockade
    dw $078D : dw $B278 ; DDB
    dw $078F : dw $0005 ; DoorOut Index
    dw $090F : dw $3000 ; Screen subpixel X position.
    dw $0913 : dw $4800 ; Screen subpixel Y position
    dw $0915 : dw $01FC ; Screen Y position in pixels
    dw $0919 : dw $01FC ; Layer 2 Y scroll in room in pixels? (up = positive)
    dw $0921 : dw $0100 ; BG2 X scroll offset due to room transitions (Translates between Layer 2 scroll and BG2 scroll)
    dw $0923 : dw $FF00 ; BG2 Y scroll offset due to room transitions (Translates between Layer 2 scroll and BG2 scroll)
    dw $09C2 : dw $01B6 ; Health
    dw $09C6 : dw $0023 ; Missiles
    dw $09C8 : dw $0023 ; Max missiles
    dw $09CA : dw $0004 ; Supers
    dw $09CE : dw $0006 ; Pbs
    dw $09D0 : dw $0006 ; Max pbs
    dw $0A1C : dw $0001 ; Samus position/state
    dw $0A1E : dw $0008 ; More position/state
    dw $0AF6 : dw $00BA ; Samus X
    dw $0AFA : dw $028B ; Samus Y
    dw $D872 : dw $0981 ; Events, Items, Doors
    dw $D878 : dw $D003 ; Events, Items, Doors
    dw $D91A : dw $005F ; Events, Items, Doors
    dw #$FFFF


preset_SZM101_upper_norfair_save_room_secret:
    dw #preset_SZM101_upper_norfair_acid_party ; Upper Norfair: Acid Party
    dw $078D : dw $9606 ; DDB
    dw $078F : dw $0000 ; DoorOut Index
    dw $079B : dw $AC2B ; MDB
    dw $090F : dw $0000 ; Screen subpixel X position.
    dw $0913 : dw $F400 ; Screen subpixel Y position
    dw $0915 : dw $00FB ; Screen Y position in pixels
    dw $0919 : dw $00FB ; Layer 2 Y scroll in room in pixels? (up = positive)
    dw $0921 : dw $FF00 ; BG2 X scroll offset due to room transitions (Translates between Layer 2 scroll and BG2 scroll)
    dw $0923 : dw $FD00 ; BG2 Y scroll offset due to room transitions (Translates between Layer 2 scroll and BG2 scroll)
    dw $09C2 : dw $0141 ; Health
    dw $09C6 : dw $0028 ; Missiles
    dw $09C8 : dw $0028 ; Max missiles
    dw $09CA : dw $0008 ; Supers
    dw $09CE : dw $0004 ; Pbs
    dw $0AF6 : dw $00C4 ; Samus X
    dw $0AFA : dw $018B ; Samus Y
    dw $D874 : dw $4100 ; Events, Items, Doors
    dw $D91A : dw $0061 ; Events, Items, Doors
    dw #$FFFF


preset_SZM101_upper_norfair_reserve_tank_spark:
    dw #preset_SZM101_upper_norfair_save_room_secret ; Upper Norfair: Save Room Secret
    dw $078D : dw $BDC8 ; DDB
    dw $078F : dw $0001 ; DoorOut Index
    dw $079B : dw $891D ; MDB
    dw $07C3 : dw $A5AA ; GFX Pointers
    dw $07C5 : dw $47BC ; GFX Pointers
    dw $07C7 : dw $C2B4 ; GFX Pointers
    dw $07F5 : dw $0003 ; Music Track
    dw $0911 : dw $013B ; Screen X position in pixels
    dw $0913 : dw $83FE ; Screen subpixel Y position
    dw $0915 : dw $0098 ; Screen Y position in pixels
    dw $0917 : dw $013B ; Layer 2 X scroll in room in pixels?
    dw $0919 : dw $0098 ; Layer 2 Y scroll in room in pixels? (up = positive)
    dw $0921 : dw $0000 ; BG2 X scroll offset due to room transitions (Translates between Layer 2 scroll and BG2 scroll)
    dw $0923 : dw $0000 ; BG2 Y scroll offset due to room transitions (Translates between Layer 2 scroll and BG2 scroll)
    dw $0A1C : dw $0027 ; Samus position/state
    dw $0A1E : dw $0508 ; More position/state
    dw $0AF6 : dw $019B ; Samus X
    dw $0AFA : dw $0110 ; Samus Y
    dw #$FFFF


preset_SZM101_lower_norfair_elevator_entry:
    dw #preset_SZM101_upper_norfair_reserve_tank_spark ; Upper Norfair: Reserve Tank Spark
    dw $078D : dw $BCFC ; DDB
    dw $078F : dw $0002 ; DoorOut Index
    dw $090F : dw $7000 ; Screen subpixel X position.
    dw $0911 : dw $0000 ; Screen X position in pixels
    dw $0913 : dw $3C00 ; Screen subpixel Y position
    dw $0915 : dw $0100 ; Screen Y position in pixels
    dw $0917 : dw $0000 ; Layer 2 X scroll in room in pixels?
    dw $0919 : dw $0100 ; Layer 2 Y scroll in room in pixels? (up = positive)
    dw $0921 : dw $FE00 ; BG2 X scroll offset due to room transitions (Translates between Layer 2 scroll and BG2 scroll)
    dw $0923 : dw $00E0 ; BG2 Y scroll offset due to room transitions (Translates between Layer 2 scroll and BG2 scroll)
    dw $09D4 : dw $00C8 ; Max reserves
    dw $0A1C : dw $0002 ; Samus position/state
    dw $0A1E : dw $0004 ; More position/state
    dw $0AF6 : dw $007F ; Samus X
    dw $0AFA : dw $018B ; Samus Y
    dw $D87E : dw $5000 ; Events, Items, Doors
    dw $D91A : dw $0062 ; Events, Items, Doors
    dw #$FFFF


preset_SZM101_lower_norfair_save_room_short_charge:
    dw #preset_SZM101_lower_norfair_elevator_entry ; Lower Norfair: Elevator Entry
    dw $078D : dw $B20C ; DDB
    dw $078F : dw $0003 ; DoorOut Index
    dw $079B : dw $B236 ; MDB
    dw $07C3 : dw $C3F9 ; GFX Pointers
    dw $07C5 : dw $E4BD ; GFX Pointers
    dw $07C7 : dw $C2B5 ; GFX Pointers
    dw $07F3 : dw $0018 ; Music Bank
    dw $07F5 : dw $0005 ; Music Track
    dw $090F : dw $5000 ; Screen subpixel X position.
    dw $0913 : dw $0000 ; Screen subpixel Y position
    dw $0915 : dw $011D ; Screen Y position in pixels
    dw $0919 : dw $011D ; Layer 2 Y scroll in room in pixels? (up = positive)
    dw $0921 : dw $FC00 ; BG2 X scroll offset due to room transitions (Translates between Layer 2 scroll and BG2 scroll)
    dw $09C2 : dw $010F ; Health
    dw $09CA : dw $0007 ; Supers
    dw $09CE : dw $0006 ; Pbs
    dw $0AF6 : dw $0051 ; Samus X
    dw $D8C6 : dw $41E0 ; Events, Items, Doors
    dw #$FFFF


preset_SZM101_lower_norfair_reverse_long_spark:
    dw #preset_SZM101_lower_norfair_save_room_short_charge ; Lower Norfair: Save Room Short Charge
    dw $078D : dw $991E ; DDB
    dw $078F : dw $0000 ; DoorOut Index
    dw $079B : dw $B051 ; MDB
    dw $090F : dw $7FFF ; Screen subpixel X position.
    dw $0913 : dw $4C00 ; Screen subpixel Y position
    dw $0915 : dw $001C ; Screen Y position in pixels
    dw $0919 : dw $0015 ; Layer 2 Y scroll in room in pixels? (up = positive)
    dw $0921 : dw $0100 ; BG2 X scroll offset due to room transitions (Translates between Layer 2 scroll and BG2 scroll)
    dw $0923 : dw $0000 ; BG2 Y scroll offset due to room transitions (Translates between Layer 2 scroll and BG2 scroll)
    dw $09C2 : dw $01EC ; Health
    dw $09C4 : dw $01F3 ; Max health
    dw $09C6 : dw $0029 ; Missiles
    dw $09C8 : dw $002D ; Max missiles
    dw $09CA : dw $000B ; Supers
    dw $09CC : dw $000C ; Max supers
    dw $09CE : dw $0005 ; Pbs
    dw $0A1C : dw $0001 ; Samus position/state
    dw $0A1E : dw $0008 ; More position/state
    dw $0AF6 : dw $00D2 ; Samus X
    dw $0AFA : dw $008B ; Samus Y
    dw $D872 : dw $4981 ; Events, Items, Doors
    dw $D878 : dw $D00B ; Events, Items, Doors
    dw $D87E : dw $5004 ; Events, Items, Doors
    dw $D91A : dw $0066 ; Events, Items, Doors
    dw #$FFFF


preset_SZM101_lower_norfair_tight_short_charge:
    dw #preset_SZM101_lower_norfair_reverse_long_spark ; Lower Norfair: Reverse Long Spark
    dw $078D : dw $B290 ; DDB
    dw $078F : dw $0002 ; DoorOut Index
    dw $079B : dw $B4AD ; MDB
    dw $090F : dw $F000 ; Screen subpixel X position.
    dw $0913 : dw $0000 ; Screen subpixel Y position
    dw $0915 : dw $011D ; Screen Y position in pixels
    dw $0919 : dw $00D5 ; Layer 2 Y scroll in room in pixels? (up = positive)
    dw $0921 : dw $0000 ; BG2 X scroll offset due to room transitions (Translates between Layer 2 scroll and BG2 scroll)
    dw $0923 : dw $00E0 ; BG2 Y scroll offset due to room transitions (Translates between Layer 2 scroll and BG2 scroll)
    dw $09C2 : dw $01F3 ; Health
    dw $09C6 : dw $0021 ; Missiles
    dw $09CA : dw $000C ; Supers
    dw $09D0 : dw $0008 ; Max pbs
    dw $09D6 : dw $007B ; Reserves
    dw $0A1C : dw $0002 ; Samus position/state
    dw $0A1E : dw $0004 ; More position/state
    dw $0AF6 : dw $0025 ; Samus X
    dw $0AFA : dw $018B ; Samus Y
    dw $D87A : dw $0022 ; Events, Items, Doors
    dw $D91A : dw $0067 ; Events, Items, Doors
    dw #$FFFF


preset_SZM101_lower_norfair_crumble_bridge_supers:
    dw #preset_SZM101_lower_norfair_tight_short_charge ; Lower Norfair: Tight Short Charge
    dw $078D : dw $BD8C ; DDB
    dw $078F : dw $0000 ; DoorOut Index
    dw $090F : dw $FFFF ; Screen subpixel X position.
    dw $0913 : dw $3800 ; Screen subpixel Y position
    dw $0915 : dw $0600 ; Screen Y position in pixels
    dw $0919 : dw $0480 ; Layer 2 Y scroll in room in pixels? (up = positive)
    dw $0921 : dw $FF00 ; BG2 X scroll offset due to room transitions (Translates between Layer 2 scroll and BG2 scroll)
    dw $0923 : dw $FD00 ; BG2 Y scroll offset due to room transitions (Translates between Layer 2 scroll and BG2 scroll)
    dw $09C2 : dw $0190 ; Health
    dw $09C6 : dw $002A ; Missiles
    dw $09C8 : dw $0037 ; Max missiles
    dw $09CE : dw $0008 ; Pbs
    dw $09D6 : dw $0099 ; Reserves
    dw $0A1C : dw $0001 ; Samus position/state
    dw $0A1E : dw $0008 ; More position/state
    dw $0AF6 : dw $00DB ; Samus X
    dw $0AFA : dw $068B ; Samus Y
    dw $D872 : dw $6981 ; Events, Items, Doors
    dw $D874 : dw $4102 ; Events, Items, Doors
    dw $D91A : dw $006B ; Events, Items, Doors
    dw #$FFFF


preset_SZM101_lower_norfair_firefleas:
    dw #preset_SZM101_lower_norfair_crumble_bridge_supers ; Lower Norfair: Crumble Bridge Supers
    dw $078D : dw $9336 ; DDB
    dw $078F : dw $0003 ; DoorOut Index
    dw $079B : dw $B4E5 ; MDB
    dw $090F : dw $C000 ; Screen subpixel X position.
    dw $0913 : dw $C3FE ; Screen subpixel Y position
    dw $0915 : dw $0017 ; Screen Y position in pixels
    dw $0919 : dw $0011 ; Layer 2 Y scroll in room in pixels? (up = positive)
    dw $0921 : dw $FA00 ; BG2 X scroll offset due to room transitions (Translates between Layer 2 scroll and BG2 scroll)
    dw $09C2 : dw $00FA ; Health
    dw $09C6 : dw $0027 ; Missiles
    dw $09CA : dw $000D ; Supers
    dw $09CC : dw $000E ; Max supers
    dw $0A1C : dw $0002 ; Samus position/state
    dw $0A1E : dw $0004 ; More position/state
    dw $0AF6 : dw $0089 ; Samus X
    dw $0AFA : dw $008B ; Samus Y
    dw $D878 : dw $D02B ; Events, Items, Doors
    dw $D91A : dw $006F ; Events, Items, Doors
    dw #$FFFF


preset_SZM101_lower_norfair_spikey_mistep:
    dw #preset_SZM101_lower_norfair_firefleas ; Lower Norfair: FireFleas
    dw $078D : dw $99D2 ; DDB
    dw $078F : dw $0000 ; DoorOut Index
    dw $079B : dw $B3A5 ; MDB
    dw $090F : dw $8D40 ; Screen subpixel X position.
    dw $0913 : dw $0000 ; Screen subpixel Y position
    dw $0915 : dw $0100 ; Screen Y position in pixels
    dw $0919 : dw $00C0 ; Layer 2 Y scroll in room in pixels? (up = positive)
    dw $0921 : dw $FF00 ; BG2 X scroll offset due to room transitions (Translates between Layer 2 scroll and BG2 scroll)
    dw $0923 : dw $FF00 ; BG2 Y scroll offset due to room transitions (Translates between Layer 2 scroll and BG2 scroll)
    dw $09C2 : dw $0225 ; Health
    dw $09C4 : dw $0225 ; Max health
    dw $09CA : dw $000C ; Supers
    dw $0AF6 : dw $0025 ; Samus X
    dw $0AFA : dw $018B ; Samus Y
    dw $D87E : dw $5006 ; Events, Items, Doors
    dw $D8C6 : dw $43E0 ; Events, Items, Doors
    dw $D91A : dw $0070 ; Events, Items, Doors
    dw #$FFFF


preset_SZM101_lower_norfair_fallen_hero_super:
    dw #preset_SZM101_lower_norfair_spikey_mistep ; Lower Norfair: Spikey Mistep
    dw $078D : dw $9906 ; DDB
    dw $078F : dw $0003 ; DoorOut Index
    dw $079B : dw $B585 ; MDB
    dw $090F : dw $2000 ; Screen subpixel X position.
    dw $0911 : dw $0200 ; Screen X position in pixels
    dw $0915 : dw $00B9 ; Screen Y position in pixels
    dw $0917 : dw $0200 ; Layer 2 X scroll in room in pixels?
    dw $0919 : dw $00B9 ; Layer 2 Y scroll in room in pixels? (up = positive)
    dw $0921 : dw $FD00 ; BG2 X scroll offset due to room transitions (Translates between Layer 2 scroll and BG2 scroll)
    dw $0923 : dw $0000 ; BG2 Y scroll offset due to room transitions (Translates between Layer 2 scroll and BG2 scroll)
    dw $09C2 : dw $01B7 ; Health
    dw $09C6 : dw $001F ; Missiles
    dw $09C8 : dw $003C ; Max missiles
    dw $09CA : dw $000B ; Supers
    dw $09CE : dw $0007 ; Pbs
    dw $0A1C : dw $0001 ; Samus position/state
    dw $0A1E : dw $0008 ; More position/state
    dw $0AF6 : dw $02DB ; Samus X
    dw $0AFA : dw $012B ; Samus Y
    dw $D874 : dw $4103 ; Events, Items, Doors
    dw $D91A : dw $0075 ; Events, Items, Doors
    dw #$FFFF


preset_SZM101_lower_norfair_morph_maze_pipes:
    dw #preset_SZM101_lower_norfair_fallen_hero_super ; Lower Norfair: Fallen Hero Super
    dw $078D : dw $9A0E ; DDB
    dw $079B : dw $B3A5 ; MDB
    dw $090F : dw $4000 ; Screen subpixel X position.
    dw $0911 : dw $0000 ; Screen X position in pixels
    dw $0913 : dw $B400 ; Screen subpixel Y position
    dw $0915 : dw $0600 ; Screen Y position in pixels
    dw $0917 : dw $0000 ; Layer 2 X scroll in room in pixels?
    dw $0919 : dw $0480 ; Layer 2 Y scroll in room in pixels? (up = positive)
    dw $0921 : dw $0100 ; BG2 X scroll offset due to room transitions (Translates between Layer 2 scroll and BG2 scroll)
    dw $0923 : dw $FA00 ; BG2 Y scroll offset due to room transitions (Translates between Layer 2 scroll and BG2 scroll)
    dw $09C2 : dw $0199 ; Health
    dw $09CA : dw $0006 ; Supers
    dw $0A1C : dw $007A ; Samus position/state
    dw $0A1E : dw $1104 ; More position/state
    dw $0AF6 : dw $0023 ; Samus X
    dw $0AFA : dw $06B9 ; Samus Y
    dw $D91A : dw $0079 ; Events, Items, Doors
    dw #$FFFF


preset_SZM101_lower_norfair_build_your_speedway:
    dw #preset_SZM101_lower_norfair_morph_maze_pipes ; Lower Norfair: morph maze pipes
    dw $078D : dw $9966 ; DDB
    dw $078F : dw $0001 ; DoorOut Index
    dw $079B : dw $AAB5 ; MDB
    dw $07C3 : dw $860B ; GFX Pointers
    dw $07C5 : dw $21C0 ; GFX Pointers
    dw $07C7 : dw $C2C0 ; GFX Pointers
    dw $090F : dw $C53F ; Screen subpixel X position.
    dw $0913 : dw $0000 ; Screen subpixel Y position
    dw $0915 : dw $0000 ; Screen Y position in pixels
    dw $0919 : dw $0000 ; Layer 2 Y scroll in room in pixels? (up = positive)
    dw $0923 : dw $0000 ; BG2 Y scroll offset due to room transitions (Translates between Layer 2 scroll and BG2 scroll)
    dw $09C2 : dw $0167 ; Health
    dw $09C6 : dw $001C ; Missiles
    dw $09C8 : dw $0041 ; Max missiles
    dw $09CA : dw $0007 ; Supers
    dw $09CC : dw $0010 ; Max supers
    dw $09CE : dw $0006 ; Pbs
    dw $0A1C : dw $0001 ; Samus position/state
    dw $0A1E : dw $0008 ; More position/state
    dw $0AF6 : dw $002F ; Samus X
    dw $0AFA : dw $008B ; Samus Y
    dw $D872 : dw $E981 ; Events, Items, Doors
    dw $D878 : dw $D03B ; Events, Items, Doors
    dw $D91A : dw $007C ; Events, Items, Doors
    dw #$FFFF


preset_SZM101_lower_norfair_monster_elevator:
    dw #preset_SZM101_lower_norfair_build_your_speedway ; Lower Norfair: Build Your Speedway
    dw $078D : dw $9A86 ; DDB
    dw $078F : dw $0002 ; DoorOut Index
    dw $079B : dw $B5D5 ; MDB
    dw $07C3 : dw $C3F9 ; GFX Pointers
    dw $07C5 : dw $E4BD ; GFX Pointers
    dw $07C7 : dw $C2B5 ; GFX Pointers
    dw $090F : dw $DC00 ; Screen subpixel X position.
    dw $0911 : dw $0400 ; Screen X position in pixels
    dw $0913 : dw $1C00 ; Screen subpixel Y position
    dw $0917 : dw $0400 ; Layer 2 X scroll in room in pixels?
    dw $0921 : dw $FA00 ; BG2 X scroll offset due to room transitions (Translates between Layer 2 scroll and BG2 scroll)
    dw $0923 : dw $FD00 ; BG2 Y scroll offset due to room transitions (Translates between Layer 2 scroll and BG2 scroll)
    dw $09C2 : dw $0225 ; Health
    dw $09C4 : dw $0257 ; Max health
    dw $09C6 : dw $001B ; Missiles
    dw $09CA : dw $0009 ; Supers
    dw $0A1C : dw $0002 ; Samus position/state
    dw $0A1E : dw $0004 ; More position/state
    dw $0AF6 : dw $0456 ; Samus X
    dw $D842 : dw $0100 ; Events, Items, Doors
    dw $D844 : dw $0100 ; Events, Items, Doors
    dw $D87E : dw $500E ; Events, Items, Doors
    dw $D8C6 : dw $43E4 ; Events, Items, Doors
    dw $D91A : dw $007F ; Events, Items, Doors
    dw #$FFFF


preset_SZM101_lower_norfair_goldbat_spark:
    dw #preset_SZM101_lower_norfair_monster_elevator ; Lower Norfair: Monster Elevator
    dw $078D : dw $B35C ; DDB
    dw $078F : dw $0001 ; DoorOut Index
    dw $079B : dw $B656 ; MDB
    dw $090F : dw $AFFF ; Screen subpixel X position.
    dw $0911 : dw $0200 ; Screen X position in pixels
    dw $0913 : dw $2000 ; Screen subpixel Y position
    dw $0915 : dw $0700 ; Screen Y position in pixels
    dw $0917 : dw $0200 ; Layer 2 X scroll in room in pixels?
    dw $0919 : dw $0700 ; Layer 2 Y scroll in room in pixels? (up = positive)
    dw $0921 : dw $FD00 ; BG2 X scroll offset due to room transitions (Translates between Layer 2 scroll and BG2 scroll)
    dw $0923 : dw $FB00 ; BG2 Y scroll offset due to room transitions (Translates between Layer 2 scroll and BG2 scroll)
    dw $09CE : dw $0005 ; Pbs
    dw $0AF6 : dw $02C5 ; Samus X
    dw $0AFA : dw $078B ; Samus Y
    dw $D91A : dw $0080 ; Events, Items, Doors
    dw #$FFFF


preset_SZM101_lower_norfair_awful_chain_spark:
    dw #preset_SZM101_lower_norfair_goldbat_spark ; Lower Norfair: Goldbat Spark
    dw $078D : dw $9AAA ; DDB
    dw $078F : dw $0002 ; DoorOut Index
    dw $079B : dw $B5D5 ; MDB
    dw $090F : dw $A000 ; Screen subpixel X position.
    dw $0911 : dw $0800 ; Screen X position in pixels
    dw $0913 : dw $B400 ; Screen subpixel Y position
    dw $0915 : dw $0000 ; Screen Y position in pixels
    dw $0917 : dw $0800 ; Layer 2 X scroll in room in pixels?
    dw $0919 : dw $0000 ; Layer 2 Y scroll in room in pixels? (up = positive)
    dw $0921 : dw $F800 ; BG2 X scroll offset due to room transitions (Translates between Layer 2 scroll and BG2 scroll)
    dw $0923 : dw $00E0 ; BG2 Y scroll offset due to room transitions (Translates between Layer 2 scroll and BG2 scroll)
    dw $09C2 : dw $01C1 ; Health
    dw $09C6 : dw $0020 ; Missiles
    dw $09C8 : dw $0046 ; Max missiles
    dw $09CA : dw $000A ; Supers
    dw $09CE : dw $0006 ; Pbs
    dw $09D0 : dw $000A ; Max pbs
    dw $0A1C : dw $0001 ; Samus position/state
    dw $0A1E : dw $0008 ; More position/state
    dw $0AF6 : dw $08D4 ; Samus X
    dw $0AFA : dw $008B ; Samus Y
    dw $D874 : dw $4107 ; Events, Items, Doors
    dw $D87A : dw $0026 ; Events, Items, Doors
    dw $D91A : dw $0088 ; Events, Items, Doors
    dw #$FFFF


preset_SZM101_lower_norfair_chain_spark_puzzle:
    dw #preset_SZM101_lower_norfair_awful_chain_spark ; Lower Norfair: Awful Chain Spark
    dw $078D : dw $B374 ; DDB
    dw $078F : dw $0003 ; DoorOut Index
    dw $079B : dw $B6EE ; MDB
    dw $090F : dw $0F00 ; Screen subpixel X position.
    dw $0911 : dw $0200 ; Screen X position in pixels
    dw $0913 : dw $B800 ; Screen subpixel Y position
    dw $0915 : dw $0700 ; Screen Y position in pixels
    dw $0917 : dw $0200 ; Layer 2 X scroll in room in pixels?
    dw $0919 : dw $0700 ; Layer 2 Y scroll in room in pixels? (up = positive)
    dw $0921 : dw $0100 ; BG2 X scroll offset due to room transitions (Translates between Layer 2 scroll and BG2 scroll)
    dw $0923 : dw $FA00 ; BG2 Y scroll offset due to room transitions (Translates between Layer 2 scroll and BG2 scroll)
    dw $09C2 : dw $01E4 ; Health
    dw $09C6 : dw $001B ; Missiles
    dw $09CA : dw $0008 ; Supers
    dw $0AF6 : dw $02DB ; Samus X
    dw $0AFA : dw $078B ; Samus Y
    dw #$FFFF


preset_SZM101_lower_norfair_leaving_spark_puzzle:
    dw #preset_SZM101_lower_norfair_chain_spark_puzzle ; Lower Norfair: Chain Spark Puzzle
    dw $078D : dw $B2FC ; DDB
    dw $078F : dw $0005 ; DoorOut Index
    dw $079B : dw $A618 ; MDB
    dw $090F : dw $7800 ; Screen subpixel X position.
    dw $0911 : dw $0000 ; Screen X position in pixels
    dw $0913 : dw $0400 ; Screen subpixel Y position
    dw $0915 : dw $0000 ; Screen Y position in pixels
    dw $0917 : dw $0000 ; Layer 2 X scroll in room in pixels?
    dw $0919 : dw $0000 ; Layer 2 Y scroll in room in pixels? (up = positive)
    dw $0923 : dw $FE00 ; BG2 Y scroll offset due to room transitions (Translates between Layer 2 scroll and BG2 scroll)
    dw $09C6 : dw $0020 ; Missiles
    dw $09C8 : dw $004B ; Max missiles
    dw $09CA : dw $000A ; Supers
    dw $09CC : dw $0012 ; Max supers
    dw $0A1C : dw $0002 ; Samus position/state
    dw $0A1E : dw $0004 ; More position/state
    dw $0AF6 : dw $0040 ; Samus X
    dw $0AFA : dw $00BB ; Samus Y
    dw $D872 : dw $E9A1 ; Events, Items, Doors
    dw $D876 : dw $A200 ; Events, Items, Doors
    dw $D91A : dw $008A ; Events, Items, Doors
    dw #$FFFF


preset_SZM101_lower_norfair_screw_attack:
    dw #preset_SZM101_lower_norfair_leaving_spark_puzzle ; Lower Norfair: Leaving Spark Puzzle
    dw $078D : dw $99AE ; DDB
    dw $078F : dw $0000 ; DoorOut Index
    dw $079B : dw $B656 ; MDB
    dw $090F : dw $2801 ; Screen subpixel X position.
    dw $0911 : dw $0200 ; Screen X position in pixels
    dw $0913 : dw $0000 ; Screen subpixel Y position
    dw $0915 : dw $007C ; Screen Y position in pixels
    dw $0917 : dw $0200 ; Layer 2 X scroll in room in pixels?
    dw $0919 : dw $007C ; Layer 2 Y scroll in room in pixels? (up = positive)
    dw $0921 : dw $FD00 ; BG2 X scroll offset due to room transitions (Translates between Layer 2 scroll and BG2 scroll)
    dw $0923 : dw $0000 ; BG2 Y scroll offset due to room transitions (Translates between Layer 2 scroll and BG2 scroll)
    dw $09C2 : dw $01EE ; Health
    dw $09C6 : dw $001F ; Missiles
    dw $09CA : dw $0008 ; Supers
    dw $0AF6 : dw $0225 ; Samus X
    dw $0AFA : dw $00EB ; Samus Y
    dw $D8C4 : dw $B150 ; Events, Items, Doors
    dw $D91A : dw $008C ; Events, Items, Doors
    dw #$FFFF


preset_SZM101_lower_norfair_chain_spark_out_of_ln:
    dw #preset_SZM101_lower_norfair_screw_attack ; Lower Norfair: Screw Attack
    dw $078D : dw $B398 ; DDB
    dw $078F : dw $0001 ; DoorOut Index
    dw $079B : dw $B510 ; MDB
    dw $090F : dw $0000 ; Screen subpixel X position.
    dw $0911 : dw $03CE ; Screen X position in pixels
    dw $0913 : dw $9000 ; Screen subpixel Y position
    dw $0915 : dw $0011 ; Screen Y position in pixels
    dw $0917 : dw $03CE ; Layer 2 X scroll in room in pixels?
    dw $0919 : dw $0011 ; Layer 2 Y scroll in room in pixels? (up = positive)
    dw $0921 : dw $0100 ; BG2 X scroll offset due to room transitions (Translates between Layer 2 scroll and BG2 scroll)
    dw $09CE : dw $0007 ; Pbs
    dw $09D0 : dw $000C ; Max pbs
    dw $0A1C : dw $0001 ; Samus position/state
    dw $0A1E : dw $0008 ; More position/state
    dw $0AF6 : dw $042E ; Samus X
    dw $0AFA : dw $0093 ; Samus Y
    dw $D87A : dw $00A6 ; Events, Items, Doors
    dw $D880 : dw $C3F3 ; Events, Items, Doors
    dw $D91A : dw $008F ; Events, Items, Doors
    dw #$FFFF


preset_SZM101_cleanup_1_caterpiller_short_charge:
    dw #preset_SZM101_lower_norfair_chain_spark_out_of_ln ; Lower Norfair: Chain Spark Out Of LN
    dw $078D : dw $986A ; DDB
    dw $078F : dw $0002 ; DoorOut Index
    dw $079B : dw $891D ; MDB
    dw $07C3 : dw $A5AA ; GFX Pointers
    dw $07C5 : dw $47BC ; GFX Pointers
    dw $07C7 : dw $C2B4 ; GFX Pointers
    dw $07F5 : dw $0003 ; Music Track
    dw $090F : dw $1000 ; Screen subpixel X position.
    dw $0911 : dw $0000 ; Screen X position in pixels
    dw $0913 : dw $C000 ; Screen subpixel Y position
    dw $0915 : dw $0100 ; Screen Y position in pixels
    dw $0917 : dw $0000 ; Layer 2 X scroll in room in pixels?
    dw $0919 : dw $0100 ; Layer 2 Y scroll in room in pixels? (up = positive)
    dw $0921 : dw $0000 ; BG2 X scroll offset due to room transitions (Translates between Layer 2 scroll and BG2 scroll)
    dw $0923 : dw $FE00 ; BG2 Y scroll offset due to room transitions (Translates between Layer 2 scroll and BG2 scroll)
    dw $09C2 : dw $01DA ; Health
    dw $09C6 : dw $0036 ; Missiles
    dw $09CA : dw $000F ; Supers
    dw $09CE : dw $0009 ; Pbs
    dw $0A1C : dw $0002 ; Samus position/state
    dw $0A1E : dw $0004 ; More position/state
    dw $0AF6 : dw $007A ; Samus X
    dw $0AFA : dw $018B ; Samus Y
    dw #$FFFF


preset_SZM101_cleanup_1_solid_cacatacs:
    dw #preset_SZM101_cleanup_1_caterpiller_short_charge ; Cleanup 1: Caterpiller Short Charge
    dw $078D : dw $B224 ; DDB
    dw $078F : dw $0003 ; DoorOut Index
    dw $079B : dw $B106 ; MDB
    dw $07C3 : dw $C3F9 ; GFX Pointers
    dw $07C5 : dw $E4BD ; GFX Pointers
    dw $07C7 : dw $C2B5 ; GFX Pointers
    dw $07F3 : dw $0015 ; Music Bank
    dw $07F5 : dw $0005 ; Music Track
    dw $090F : dw $8000 ; Screen subpixel X position.
    dw $0911 : dw $0028 ; Screen X position in pixels
    dw $0913 : dw $2400 ; Screen subpixel Y position
    dw $0915 : dw $0000 ; Screen Y position in pixels
    dw $0917 : dw $0028 ; Layer 2 X scroll in room in pixels?
    dw $0919 : dw $0000 ; Layer 2 Y scroll in room in pixels? (up = positive)
    dw $0921 : dw $F800 ; BG2 X scroll offset due to room transitions (Translates between Layer 2 scroll and BG2 scroll)
    dw $0923 : dw $0000 ; BG2 Y scroll offset due to room transitions (Translates between Layer 2 scroll and BG2 scroll)
    dw $09C2 : dw $0275 ; Health
    dw $09C4 : dw $0289 ; Max health
    dw $0AF6 : dw $00A0 ; Samus X
    dw $0AFA : dw $007B ; Samus Y
    dw $D87E : dw $500F ; Events, Items, Doors
    dw $D91A : dw $00A2 ; Events, Items, Doors
    dw #$FFFF


preset_SZM101_cleanup_1_spikesuit_hallway:
    dw #preset_SZM101_cleanup_1_solid_cacatacs ; Cleanup 1: Solid Cacatacs
    dw $078D : dw $B1DC ; DDB
    dw $078F : dw $0000 ; DoorOut Index
    dw $079B : dw $AEDF ; MDB
    dw $090F : dw $A000 ; Screen subpixel X position.
    dw $0911 : dw $0000 ; Screen X position in pixels
    dw $0913 : dw $8400 ; Screen subpixel Y position
    dw $0915 : dw $00ED ; Screen Y position in pixels
    dw $0917 : dw $0000 ; Layer 2 X scroll in room in pixels?
    dw $0919 : dw $00ED ; Layer 2 Y scroll in room in pixels? (up = positive)
    dw $0921 : dw $0000 ; BG2 X scroll offset due to room transitions (Translates between Layer 2 scroll and BG2 scroll)
    dw $0923 : dw $FE00 ; BG2 Y scroll offset due to room transitions (Translates between Layer 2 scroll and BG2 scroll)
    dw $09CA : dw $0012 ; Supers
    dw $09CE : dw $000B ; Pbs
    dw $0AF6 : dw $00B1 ; Samus X
    dw $0AFA : dw $018B ; Samus Y
    dw $D91A : dw $00A3 ; Events, Items, Doors
    dw #$FFFF


preset_SZM101_cleanup_1_chasm_supers:
    dw #preset_SZM101_cleanup_1_spikesuit_hallway ; Cleanup 1: Spikesuit Hallway
    dw $078D : dw $9486 ; DDB
    dw $078F : dw $0001 ; DoorOut Index
    dw $079B : dw $ADDE ; MDB
    dw $07C5 : dw $BBBD ; GFX Pointers
    dw $07C7 : dw $C2B6 ; GFX Pointers
    dw $090F : dw $6000 ; Screen subpixel X position.
    dw $0911 : dw $01D2 ; Screen X position in pixels
    dw $0913 : dw $0000 ; Screen subpixel Y position
    dw $0915 : dw $000B ; Screen Y position in pixels
    dw $0917 : dw $01D2 ; Layer 2 X scroll in room in pixels?
    dw $0919 : dw $000B ; Layer 2 Y scroll in room in pixels? (up = positive)
    dw $0921 : dw $F900 ; BG2 X scroll offset due to room transitions (Translates between Layer 2 scroll and BG2 scroll)
    dw $0923 : dw $FD00 ; BG2 Y scroll offset due to room transitions (Translates between Layer 2 scroll and BG2 scroll)
    dw $09C2 : dw $0289 ; Health
    dw $09C6 : dw $0035 ; Missiles
    dw $09D6 : dw $00A3 ; Reserves
    dw $0AF6 : dw $024A ; Samus X
    dw $0AFA : dw $007B ; Samus Y
    dw $D91A : dw $00A5 ; Events, Items, Doors
    dw #$FFFF


preset_SZM101_cleanup_1_speed_keep_descent:
    dw #preset_SZM101_cleanup_1_chasm_supers ; Cleanup 1: Chasm Supers
    dw $078D : dw $976E ; DDB
    dw $078F : dw $0000 ; DoorOut Index
    dw $079B : dw $A6E2 ; MDB
    dw $079F : dw $0001 ; Region
    dw $07C3 : dw $A5AA ; GFX Pointers
    dw $07C5 : dw $5FBC ; GFX Pointers
    dw $07C7 : dw $C2B3 ; GFX Pointers
    dw $07F3 : dw $0012 ; Music Bank
    dw $090F : dw $0000 ; Screen subpixel X position.
    dw $0911 : dw $00D2 ; Screen X position in pixels
    dw $0913 : dw $B7FF ; Screen subpixel Y position
    dw $0915 : dw $0000 ; Screen Y position in pixels
    dw $0917 : dw $00D2 ; Layer 2 X scroll in room in pixels?
    dw $0919 : dw $0000 ; Layer 2 Y scroll in room in pixels? (up = positive)
    dw $0921 : dw $FE00 ; BG2 X scroll offset due to room transitions (Translates between Layer 2 scroll and BG2 scroll)
    dw $0923 : dw $0000 ; BG2 Y scroll offset due to room transitions (Translates between Layer 2 scroll and BG2 scroll)
    dw $09CC : dw $0014 ; Max supers
    dw $09CE : dw $000A ; Pbs
    dw $0AF6 : dw $0172 ; Samus X
    dw $0AFA : dw $009B ; Samus Y
    dw $D876 : dw $E200 ; Events, Items, Doors
    dw $D8C6 : dw $43F4 ; Events, Items, Doors
    dw $D91A : dw $00A8 ; Events, Items, Doors
    dw #$FFFF


preset_SZM101_cleanup_1_hole_in_the_wall_missiles:
    dw #preset_SZM101_cleanup_1_speed_keep_descent ; Cleanup 1: Speed Keep Descent
    dw $078D : dw $8BCE ; DDB
    dw $079B : dw $A253 ; MDB
    dw $090F : dw $B001 ; Screen subpixel X position.
    dw $0911 : dw $0000 ; Screen X position in pixels
    dw $0913 : dw $0000 ; Screen subpixel Y position
    dw $0915 : dw $091A ; Screen Y position in pixels
    dw $0917 : dw $0000 ; Layer 2 X scroll in room in pixels?
    dw $0919 : dw $091A ; Layer 2 Y scroll in room in pixels? (up = positive)
    dw $0921 : dw $FF00 ; BG2 X scroll offset due to room transitions (Translates between Layer 2 scroll and BG2 scroll)
    dw $0923 : dw $FD00 ; BG2 Y scroll offset due to room transitions (Translates between Layer 2 scroll and BG2 scroll)
    dw $09C2 : dw $02BB ; Health
    dw $09C4 : dw $02BB ; Max health
    dw $09CE : dw $0009 ; Pbs
    dw $0AF6 : dw $002F ; Samus X
    dw $0AFA : dw $098B ; Samus Y
    dw $D87C : dw $A31E ; Events, Items, Doors
    dw $D91A : dw $00A9 ; Events, Items, Doors
    dw #$FFFF


preset_SZM101_cleanup_1_eticoon_entry:
    dw #preset_SZM101_cleanup_1_hole_in_the_wall_missiles ; Cleanup 1: Hole In The Wall Missiles
    dw $078D : dw $B104 ; DDB
    dw $078F : dw $0003 ; DoorOut Index
    dw $079B : dw $A641 ; MDB
    dw $090F : dw $8000 ; Screen subpixel X position.
    dw $0911 : dw $0300 ; Screen X position in pixels
    dw $0915 : dw $0012 ; Screen Y position in pixels
    dw $0917 : dw $0240 ; Layer 2 X scroll in room in pixels?
    dw $0919 : dw $0012 ; Layer 2 Y scroll in room in pixels? (up = positive)
    dw $0921 : dw $FC00 ; BG2 X scroll offset due to room transitions (Translates between Layer 2 scroll and BG2 scroll)
    dw $0923 : dw $FE00 ; BG2 Y scroll offset due to room transitions (Translates between Layer 2 scroll and BG2 scroll)
    dw $09C2 : dw $02B1 ; Health
    dw $09C6 : dw $003B ; Missiles
    dw $09C8 : dw $0050 ; Max missiles
    dw $09D6 : dw $00B7 ; Reserves
    dw $0A1C : dw $0001 ; Samus position/state
    dw $0A1E : dw $0008 ; More position/state
    dw $0AF6 : dw $0364 ; Samus X
    dw $0AFA : dw $009B ; Samus Y
    dw $D872 : dw $E9A5 ; Events, Items, Doors
    dw $D91A : dw $00AB ; Events, Items, Doors
    dw #$FFFF


preset_SZM101_cleanup_1_super_door_over_crumples:
    dw #preset_SZM101_cleanup_1_eticoon_entry ; Cleanup 1: Eticoon Entry
    dw $078D : dw $8D42 ; DDB
    dw $078F : dw $0001 ; DoorOut Index
    dw $079B : dw $9AD9 ; MDB
    dw $0911 : dw $0100 ; Screen X position in pixels
    dw $0915 : dw $061D ; Screen Y position in pixels
    dw $0917 : dw $0100 ; Layer 2 X scroll in room in pixels?
    dw $0919 : dw $061D ; Layer 2 Y scroll in room in pixels? (up = positive)
    dw $0921 : dw $FF00 ; BG2 X scroll offset due to room transitions (Translates between Layer 2 scroll and BG2 scroll)
    dw $0923 : dw $F500 ; BG2 Y scroll offset due to room transitions (Translates between Layer 2 scroll and BG2 scroll)
    dw $09CE : dw $000A ; Pbs
    dw $09D0 : dw $000E ; Max pbs
    dw $0A1C : dw $0002 ; Samus position/state
    dw $0A1E : dw $0004 ; More position/state
    dw $0AF6 : dw $0163 ; Samus X
    dw $0AFA : dw $068B ; Samus Y
    dw $D878 : dw $D23B ; Events, Items, Doors
    dw $D91A : dw $00AD ; Events, Items, Doors
    dw #$FFFF


preset_SZM101_cleanup_1_crumble_pillers:
    dw #preset_SZM101_cleanup_1_super_door_over_crumples ; Cleanup 1: Super Door Over Crumples
    dw $078D : dw $8D12 ; DDB
    dw $078F : dw $000A ; DoorOut Index
    dw $079B : dw $A011 ; MDB
    dw $07C3 : dw $E6B0 ; GFX Pointers
    dw $07C5 : dw $64BB ; GFX Pointers
    dw $07C7 : dw $C2B2 ; GFX Pointers
    dw $090F : dw $CB80 ; Screen subpixel X position.
    dw $0911 : dw $0000 ; Screen X position in pixels
    dw $0913 : dw $B400 ; Screen subpixel Y position
    dw $0915 : dw $01E2 ; Screen Y position in pixels
    dw $0917 : dw $0000 ; Layer 2 X scroll in room in pixels?
    dw $0919 : dw $0169 ; Layer 2 Y scroll in room in pixels? (up = positive)
    dw $0921 : dw $FD00 ; BG2 X scroll offset due to room transitions (Translates between Layer 2 scroll and BG2 scroll)
    dw $0923 : dw $0000 ; BG2 Y scroll offset due to room transitions (Translates between Layer 2 scroll and BG2 scroll)
    dw $09C2 : dw $02DE ; Health
    dw $09C4 : dw $02ED ; Max health
    dw $09C6 : dw $0037 ; Missiles
    dw $09CA : dw $0011 ; Supers
    dw $09CE : dw $000C ; Pbs
    dw $0A1C : dw $0001 ; Samus position/state
    dw $0A1E : dw $0008 ; More position/state
    dw $0AF6 : dw $0027 ; Samus X
    dw $0AFA : dw $028B ; Samus Y
    dw $D87C : dw $A35E ; Events, Items, Doors
    dw $D8C2 : dw $00E0 ; Events, Items, Doors
    dw $D91A : dw $00AF ; Events, Items, Doors
    dw #$FFFF


preset_SZM101_cleanup_1_post_sporespawn_room:
    dw #preset_SZM101_cleanup_1_crumble_pillers ; Cleanup 1: Crumble Pillers
    dw $078D : dw $8EFE ; DDB
    dw $078F : dw $0000 ; DoorOut Index
    dw $090F : dw $C000 ; Screen subpixel X position.
    dw $0913 : dw $63FF ; Screen subpixel Y position
    dw $0915 : dw $0108 ; Screen Y position in pixels
    dw $0919 : dw $00C6 ; Layer 2 Y scroll in room in pixels? (up = positive)
    dw $0921 : dw $FF00 ; BG2 X scroll offset due to room transitions (Translates between Layer 2 scroll and BG2 scroll)
    dw $0923 : dw $FE00 ; BG2 Y scroll offset due to room transitions (Translates between Layer 2 scroll and BG2 scroll)
    dw $09C2 : dw $02E3 ; Health
    dw $09CA : dw $0013 ; Supers
    dw $09CC : dw $0016 ; Max supers
    dw $0A1C : dw $0002 ; Samus position/state
    dw $0A1E : dw $0004 ; More position/state
    dw $0AF6 : dw $004D ; Samus X
    dw $0AFA : dw $018B ; Samus Y
    dw $D876 : dw $E208 ; Events, Items, Doors
    dw $D91A : dw $00B1 ; Events, Items, Doors
    dw #$FFFF


preset_SZM101_cleanup_1_spazer:
    dw #preset_SZM101_cleanup_1_post_sporespawn_room ; Cleanup 1: Post Sporespawn Room
    dw $078D : dw $8F2E ; DDB
    dw $079B : dw $9E52 ; MDB
    dw $07C3 : dw $A5AA ; GFX Pointers
    dw $07C5 : dw $5FBC ; GFX Pointers
    dw $07C7 : dw $C2B3 ; GFX Pointers
    dw $090F : dw $0000 ; Screen subpixel X position.
    dw $0911 : dw $0051 ; Screen X position in pixels
    dw $0913 : dw $F800 ; Screen subpixel Y position
    dw $0915 : dw $012C ; Screen Y position in pixels
    dw $0917 : dw $0051 ; Layer 2 X scroll in room in pixels?
    dw $0919 : dw $012C ; Layer 2 Y scroll in room in pixels? (up = positive)
    dw $0921 : dw $F900 ; BG2 X scroll offset due to room transitions (Translates between Layer 2 scroll and BG2 scroll)
    dw $0923 : dw $FD00 ; BG2 Y scroll offset due to room transitions (Translates between Layer 2 scroll and BG2 scroll)
    dw $09C2 : dw $02BB ; Health
    dw $09C6 : dw $003C ; Missiles
    dw $09C8 : dw $0055 ; Max missiles
    dw $0AF6 : dw $00F1 ; Samus X
    dw $0AFA : dw $019B ; Samus Y
    dw $D870 : dw $1184 ; Events, Items, Doors
    dw $D91A : dw $00B2 ; Events, Items, Doors
    dw #$FFFF


preset_SZM101_cleanup_1_spazer_exit:
    dw #preset_SZM101_cleanup_1_spazer ; Cleanup 1: Spazer
    dw $078D : dw $8E7A ; DDB
    dw $079B : dw $A4DA ; MDB
    dw $090F : dw $E000 ; Screen subpixel X position.
    dw $0911 : dw $0000 ; Screen X position in pixels
    dw $0913 : dw $FC00 ; Screen subpixel Y position
    dw $0915 : dw $0200 ; Screen Y position in pixels
    dw $0917 : dw $0000 ; Layer 2 X scroll in room in pixels?
    dw $0919 : dw $0200 ; Layer 2 Y scroll in room in pixels? (up = positive)
    dw $0921 : dw $FE00 ; BG2 X scroll offset due to room transitions (Translates between Layer 2 scroll and BG2 scroll)
    dw $0923 : dw $0000 ; BG2 Y scroll offset due to room transitions (Translates between Layer 2 scroll and BG2 scroll)
    dw $09A6 : dw $0007 ; Beams
    dw $09A8 : dw $0007 ; Beams
    dw $09C6 : dw $0044 ; Missiles
    dw $09C8 : dw $005F ; Max missiles
    dw $09CA : dw $0011 ; Supers
    dw $0AF6 : dw $0075 ; Samus X
    dw $0AFA : dw $029B ; Samus Y
    dw $D872 : dw $E9BD ; Events, Items, Doors
    dw $D880 : dw $C3FB ; Events, Items, Doors
    dw $D8C2 : dw $40E0 ; Events, Items, Doors
    dw $D8C4 : dw $B950 ; Events, Items, Doors
    dw $D91A : dw $00B5 ; Events, Items, Doors
    dw #$FFFF


preset_SZM101_cleanup_1_leaving_tourian:
    dw #preset_SZM101_cleanup_1_spazer_exit ; Cleanup 1: Spazer Exit
    dw $078D : dw $AA5C ; DDB
    dw $078F : dw $0001 ; DoorOut Index
    dw $079B : dw $83E8 ; MDB
    dw $07C3 : dw $E6B0 ; GFX Pointers
    dw $07C5 : dw $64BB ; GFX Pointers
    dw $07C7 : dw $C2B2 ; GFX Pointers
    dw $090F : dw $2000 ; Screen subpixel X position.
    dw $0913 : dw $0000 ; Screen subpixel Y position
    dw $0921 : dw $0000 ; BG2 X scroll offset due to room transitions (Translates between Layer 2 scroll and BG2 scroll)
    dw $0923 : dw $00E0 ; BG2 Y scroll offset due to room transitions (Translates between Layer 2 scroll and BG2 scroll)
    dw $09C2 : dw $0243 ; Health
    dw $09CA : dw $0010 ; Supers
    dw $09CE : dw $000A ; Pbs
    dw $0A1C : dw $009B ; Samus position/state
    dw $0A1E : dw $0000 ; More position/state
    dw $0AF6 : dw $0080 ; Samus X
    dw $0AFA : dw $02A8 ; Samus Y
    dw $D822 : dw $0020 ; Events, Items, Doors
    dw $D880 : dw $F3FB ; Events, Items, Doors
    dw $D8C8 : dw $0001 ; Events, Items, Doors
    dw $D91A : dw $00BA ; Events, Items, Doors
    dw #$FFFF


preset_SZM101_cleanup_1_bomb_hole_missiles:
    dw #preset_SZM101_cleanup_1_leaving_tourian ; Cleanup 1: Leaving Tourian
    dw $078D : dw $B684 ; DDB
    dw $079B : dw $9D19 ; MDB
    dw $090F : dw $6980 ; Screen subpixel X position.
    dw $0911 : dw $0100 ; Screen X position in pixels
    dw $0913 : dw $0800 ; Screen subpixel Y position
    dw $0915 : dw $0119 ; Screen Y position in pixels
    dw $0917 : dw $00C0 ; Layer 2 X scroll in room in pixels?
    dw $0919 : dw $00D2 ; Layer 2 Y scroll in room in pixels? (up = positive)
    dw $0921 : dw $0100 ; BG2 X scroll offset due to room transitions (Translates between Layer 2 scroll and BG2 scroll)
    dw $0923 : dw $FD00 ; BG2 Y scroll offset due to room transitions (Translates between Layer 2 scroll and BG2 scroll)
    dw $09C2 : dw $031F ; Health
    dw $09C4 : dw $031F ; Max health
    dw $09CA : dw $000E ; Supers
    dw $09CE : dw $0008 ; Pbs
    dw $0A1C : dw $0002 ; Samus position/state
    dw $0A1E : dw $0004 ; More position/state
    dw $0AF6 : dw $014E ; Samus X
    dw $0AFA : dw $0193 ; Samus Y
    dw $D87C : dw $A75E ; Events, Items, Doors
    dw $D91A : dw $00BD ; Events, Items, Doors
    dw #$FFFF


preset_SZM101_cleanup_1_mini_kraid_big_lag:
    dw #preset_SZM101_cleanup_1_bomb_hole_missiles ; Cleanup 1: Bomb Hole Missiles
    dw $078D : dw $9132 ; DDB
    dw $078F : dw $0000 ; DoorOut Index
    dw $090F : dw $0000 ; Screen subpixel X position.
    dw $0911 : dw $0614 ; Screen X position in pixels
    dw $0913 : dw $0000 ; Screen subpixel Y position
    dw $0915 : dw $0411 ; Screen Y position in pixels
    dw $0917 : dw $048F ; Layer 2 X scroll in room in pixels?
    dw $0919 : dw $030C ; Layer 2 Y scroll in room in pixels? (up = positive)
    dw $0921 : dw $F700 ; BG2 X scroll offset due to room transitions (Translates between Layer 2 scroll and BG2 scroll)
    dw $0923 : dw $FE00 ; BG2 Y scroll offset due to room transitions (Translates between Layer 2 scroll and BG2 scroll)
    dw $09C6 : dw $004E ; Missiles
    dw $09C8 : dw $0069 ; Max missiles
    dw $09CA : dw $000C ; Supers
    dw $09CC : dw $0018 ; Max supers
    dw $09CE : dw $0009 ; Pbs
    dw $09D6 : dw $00C8 ; Reserves
    dw $0AF6 : dw $06B4 ; Samus X
    dw $0AFA : dw $0481 ; Samus Y
    dw $D870 : dw $1784 ; Events, Items, Doors
    dw $D876 : dw $E308 ; Events, Items, Doors
    dw $D8C2 : dw $50E0 ; Events, Items, Doors
    dw $D91A : dw $00C3 ; Events, Items, Doors
    dw #$FFFF


preset_SZM101_cleanup_1_pink_room_exit_spark:
    dw #preset_SZM101_cleanup_1_mini_kraid_big_lag ; Cleanup 1: Mini Kraid Big Lag
    dw $078D : dw $AFCC ; DDB
    dw $078F : dw $0003 ; DoorOut Index
    dw $079B : dw $9CB3 ; MDB
    dw $090F : dw $F97F ; Screen subpixel X position.
    dw $0911 : dw $0900 ; Screen X position in pixels
    dw $0915 : dw $0000 ; Screen Y position in pixels
    dw $0917 : dw $0900 ; Layer 2 X scroll in room in pixels?
    dw $0919 : dw $0000 ; Layer 2 Y scroll in room in pixels? (up = positive)
    dw $0921 : dw $F800 ; BG2 X scroll offset due to room transitions (Translates between Layer 2 scroll and BG2 scroll)
    dw $0923 : dw $0000 ; BG2 Y scroll offset due to room transitions (Translates between Layer 2 scroll and BG2 scroll)
    dw $09C2 : dw $0315 ; Health
    dw $09C6 : dw $0051 ; Missiles
    dw $09C8 : dw $006E ; Max missiles
    dw $09CA : dw $0015 ; Supers
    dw $09CE : dw $000B ; Pbs
    dw $09D0 : dw $0010 ; Max pbs
    dw $0A1C : dw $0001 ; Samus position/state
    dw $0A1E : dw $0008 ; More position/state
    dw $0AF6 : dw $0942 ; Samus X
    dw $0AFA : dw $008D ; Samus Y
    dw $D874 : dw $4187 ; Events, Items, Doors
    dw $D878 : dw $D63B ; Events, Items, Doors
    dw $D91A : dw $00C6 ; Events, Items, Doors
    dw #$FFFF


preset_SZM101_chozodia_elevator_top:
    dw #preset_SZM101_cleanup_1_pink_room_exit_spark ; Cleanup 1: Pink Room Exit Spark
    dw $078D : dw $8CA6 ; DDB
    dw $078F : dw $0002 ; DoorOut Index
    dw $079B : dw $88D7 ; MDB
    dw $07C3 : dw $A5AA ; GFX Pointers
    dw $07C5 : dw $5FBC ; GFX Pointers
    dw $07C7 : dw $C2B3 ; GFX Pointers
    dw $07F5 : dw $0003 ; Music Track
    dw $090F : dw $C000 ; Screen subpixel X position.
    dw $0911 : dw $0000 ; Screen X position in pixels
    dw $0913 : dw $C000 ; Screen subpixel Y position
    dw $0917 : dw $0000 ; Layer 2 X scroll in room in pixels?
    dw $0921 : dw $0000 ; BG2 X scroll offset due to room transitions (Translates between Layer 2 scroll and BG2 scroll)
    dw $0923 : dw $FF00 ; BG2 Y scroll offset due to room transitions (Translates between Layer 2 scroll and BG2 scroll)
    dw $0A1C : dw $0002 ; Samus position/state
    dw $0A1E : dw $0004 ; More position/state
    dw $0AF6 : dw $007D ; Samus X
    dw $0AFA : dw $008B ; Samus Y
    dw $D91A : dw $00C8 ; Events, Items, Doors
    dw #$FFFF


preset_SZM101_chozodia_robot_clip_with_speed:
    dw #preset_SZM101_chozodia_elevator_top ; Chozodia: Elevator Top
    dw $078D : dw $8FEE ; DDB
    dw $078F : dw $0001 ; DoorOut Index
    dw $079B : dw $A130 ; MDB
    dw $07C3 : dw $E6B0 ; GFX Pointers
    dw $07C5 : dw $64BB ; GFX Pointers
    dw $07C7 : dw $C2B2 ; GFX Pointers
    dw $07F3 : dw $000F ; Music Bank
    dw $07F5 : dw $0005 ; Music Track
    dw $090F : dw $A000 ; Screen subpixel X position.
    dw $0911 : dw $0100 ; Screen X position in pixels
    dw $0913 : dw $0000 ; Screen subpixel Y position
    dw $0915 : dw $041D ; Screen Y position in pixels
    dw $0917 : dw $0100 ; Layer 2 X scroll in room in pixels?
    dw $0919 : dw $041D ; Layer 2 Y scroll in room in pixels? (up = positive)
    dw $0923 : dw $FA00 ; BG2 Y scroll offset due to room transitions (Translates between Layer 2 scroll and BG2 scroll)
    dw $09C2 : dw $030F ; Health
    dw $09C6 : dw $0057 ; Missiles
    dw $09C8 : dw $0073 ; Max missiles
    dw $09CA : dw $0017 ; Supers
    dw $09CC : dw $001A ; Max supers
    dw $0A1C : dw $0001 ; Samus position/state
    dw $0A1E : dw $0008 ; More position/state
    dw $0AF6 : dw $01A5 ; Samus X
    dw $0AFA : dw $048B ; Samus Y
    dw $D874 : dw $41C7 ; Events, Items, Doors
    dw $D876 : dw $E328 ; Events, Items, Doors
    dw $D91A : dw $00CD ; Events, Items, Doors
    dw #$FFFF


preset_SZM101_chozodia_charge_entry:
    dw #preset_SZM101_chozodia_robot_clip_with_speed ; Chozodia: Robot Clip With Speed
    dw $078D : dw $B1A0 ; DDB
    dw $078F : dw $0004 ; DoorOut Index
    dw $090F : dw $1000 ; Screen subpixel X position.
    dw $0913 : dw $FC00 ; Screen subpixel Y position
    dw $0915 : dw $021D ; Screen Y position in pixels
    dw $0919 : dw $021D ; Layer 2 Y scroll in room in pixels? (up = positive)
    dw $0921 : dw $FD00 ; BG2 X scroll offset due to room transitions (Translates between Layer 2 scroll and BG2 scroll)
    dw $0923 : dw $FF00 ; BG2 Y scroll offset due to room transitions (Translates between Layer 2 scroll and BG2 scroll)
    dw $09C2 : dw $0301 ; Health
    dw $09C6 : dw $005A ; Missiles
    dw $09C8 : dw $0078 ; Max missiles
    dw $09CE : dw $000A ; Pbs
    dw $0A1C : dw $0002 ; Samus position/state
    dw $0A1E : dw $0004 ; More position/state
    dw $0AF6 : dw $013E ; Samus X
    dw $0AFA : dw $028B ; Samus Y
    dw $D874 : dw $41E7 ; Events, Items, Doors
    dw $D8C4 : dw $B9D1 ; Events, Items, Doors
    dw $D91A : dw $00D0 ; Events, Items, Doors
    dw #$FFFF


preset_SZM101_chozodia_charge_entry_exit:
    dw #preset_SZM101_chozodia_charge_entry ; Chozodia: Charge Entry
    dw $078D : dw $8C9A ; DDB
    dw $078F : dw $0000 ; DoorOut Index
    dw $079B : dw $9461 ; MDB
    dw $07F5 : dw $0003 ; Music Track
    dw $090F : dw $E000 ; Screen subpixel X position.
    dw $0911 : dw $0200 ; Screen X position in pixels
    dw $0913 : dw $3000 ; Screen subpixel Y position
    dw $0915 : dw $0100 ; Screen Y position in pixels
    dw $0917 : dw $0180 ; Layer 2 X scroll in room in pixels?
    dw $0919 : dw $00C0 ; Layer 2 Y scroll in room in pixels? (up = positive)
    dw $0921 : dw $0100 ; BG2 X scroll offset due to room transitions (Translates between Layer 2 scroll and BG2 scroll)
    dw $09A6 : dw $1007 ; Beams
    dw $09A8 : dw $1007 ; Beams
    dw $0A1C : dw $0001 ; Samus position/state
    dw $0A1E : dw $0008 ; More position/state
    dw $0AF6 : dw $02CE ; Samus X
    dw $0AFA : dw $018B ; Samus Y
    dw $D880 : dw $F3FF ; Events, Items, Doors
    dw $D8CC : dw $0001 ; Events, Items, Doors
    dw $D91A : dw $00D1 ; Events, Items, Doors
    dw #$FFFF


preset_SZM101_chozodia_shoot_the_floor:
    dw #preset_SZM101_chozodia_charge_entry_exit ; Chozodia: Charge Entry Exit
    dw $078D : dw $B188 ; DDB
    dw $078F : dw $0002 ; DoorOut Index
    dw $079B : dw $B139 ; MDB
    dw $07C3 : dw $A5AA ; GFX Pointers
    dw $07C5 : dw $5FBC ; GFX Pointers
    dw $07C7 : dw $C2B3 ; GFX Pointers
    dw $07F5 : dw $0005 ; Music Track
    dw $090F : dw $FC00 ; Screen subpixel X position.
    dw $0911 : dw $0300 ; Screen X position in pixels
    dw $0913 : dw $9000 ; Screen subpixel Y position
    dw $0917 : dw $0240 ; Layer 2 X scroll in room in pixels?
    dw $0923 : dw $0000 ; BG2 Y scroll offset due to room transitions (Translates between Layer 2 scroll and BG2 scroll)
    dw $09C2 : dw $02EA ; Health
    dw $09CA : dw $0015 ; Supers
    dw $0AF6 : dw $03BF ; Samus X
    dw $0AFA : dw $0194 ; Samus Y
    dw $D91A : dw $00D7 ; Events, Items, Doors
    dw #$FFFF


preset_SZM101_chozodia_map_room:
    dw #preset_SZM101_chozodia_shoot_the_floor ; Chozodia: Shoot The Floor
    dw $078D : dw $911A ; DDB
    dw $078F : dw $0001 ; DoorOut Index
    dw $079B : dw $9994 ; MDB
    dw $07C3 : dw $860B ; GFX Pointers
    dw $07C5 : dw $21C0 ; GFX Pointers
    dw $07C7 : dw $C2C0 ; GFX Pointers
    dw $090F : dw $C000 ; Screen subpixel X position.
    dw $0911 : dw $0000 ; Screen X position in pixels
    dw $0913 : dw $C000 ; Screen subpixel Y position
    dw $0915 : dw $0000 ; Screen Y position in pixels
    dw $0917 : dw $0000 ; Layer 2 X scroll in room in pixels?
    dw $0919 : dw $0000 ; Layer 2 Y scroll in room in pixels? (up = positive)
    dw $09C6 : dw $005E ; Missiles
    dw $09C8 : dw $007D ; Max missiles
    dw $0AF6 : dw $00A7 ; Samus X
    dw $0AFA : dw $009B ; Samus Y
    dw $D872 : dw $E9FD ; Events, Items, Doors
    dw $D8C4 : dw $BBD1 ; Events, Items, Doors
    dw $D91A : dw $00D8 ; Events, Items, Doors
    dw #$FFFF


preset_SZM101_chozodia_white_room_etank:
    dw #preset_SZM101_chozodia_map_room ; Chozodia: Map Room
    dw $078D : dw $9012 ; DDB
    dw $078F : dw $0000 ; DoorOut Index
    dw $079B : dw $A471 ; MDB
    dw $07C3 : dw $A5AA ; GFX Pointers
    dw $07C5 : dw $5FBC ; GFX Pointers
    dw $07C7 : dw $C2B3 ; GFX Pointers
    dw $090F : dw $0200 ; Screen subpixel X position.
    dw $0911 : dw $0100 ; Screen X position in pixels
    dw $0913 : dw $BC00 ; Screen subpixel Y position
    dw $0915 : dw $0022 ; Screen Y position in pixels
    dw $0917 : dw $00C0 ; Layer 2 X scroll in room in pixels?
    dw $0919 : dw $0019 ; Layer 2 Y scroll in room in pixels? (up = positive)
    dw $0923 : dw $FF00 ; BG2 Y scroll offset due to room transitions (Translates between Layer 2 scroll and BG2 scroll)
    dw $09C2 : dw $015B ; Health
    dw $09C6 : dw $0060 ; Missiles
    dw $09D0 : dw $0012 ; Max pbs
    dw $0AF6 : dw $01C9 ; Samus X
    dw $0AFA : dw $0092 ; Samus Y
    dw $D878 : dw $DE3B ; Events, Items, Doors
    dw $D8C4 : dw $BFD1 ; Events, Items, Doors
    dw $D91A : dw $00D9 ; Events, Items, Doors
    dw #$FFFF


preset_SZM101_chozodia_ship_entry_chain_spark:
    dw #preset_SZM101_chozodia_white_room_etank ; Chozodia: White Room Etank
    dw $078D : dw $8AF6 ; DDB
    dw $079B : dw $98E2 ; MDB
    dw $079F : dw $0000 ; Region
    dw $07C3 : dw $F911 ; GFX Pointers
    dw $07C5 : dw $43BA ; GFX Pointers
    dw $07C7 : dw $C2AF ; GFX Pointers
    dw $07F3 : dw $0009 ; Music Bank
    dw $07F5 : dw $0006 ; Music Track
    dw $090F : dw $7000 ; Screen subpixel X position.
    dw $0911 : dw $01F5 ; Screen X position in pixels
    dw $0913 : dw $6801 ; Screen subpixel Y position
    dw $0915 : dw $011F ; Screen Y position in pixels
    dw $0917 : dw $0177 ; Layer 2 X scroll in room in pixels?
    dw $0919 : dw $00D7 ; Layer 2 Y scroll in room in pixels? (up = positive)
    dw $0921 : dw $FE00 ; BG2 X scroll offset due to room transitions (Translates between Layer 2 scroll and BG2 scroll)
    dw $0923 : dw $FE00 ; BG2 Y scroll offset due to room transitions (Translates between Layer 2 scroll and BG2 scroll)
    dw $09C2 : dw $0351 ; Health
    dw $09C4 : dw $0351 ; Max health
    dw $09CE : dw $0009 ; Pbs
    dw $0AF6 : dw $0272 ; Samus X
    dw $0AFA : dw $01BB ; Samus Y
    dw $D87C : dw $E75E ; Events, Items, Doors
    dw $D91A : dw $00DC ; Events, Items, Doors
    dw #$FFFF


preset_SZM101_chozodia_waterway_speedkeep:
    dw #preset_SZM101_chozodia_ship_entry_chain_spark ; Chozodia: Ship Entry Chain Spark
    dw $078D : dw $B9F0 ; DDB
    dw $078F : dw $0003 ; DoorOut Index
    dw $079B : dw $87B7 ; MDB
    dw $079F : dw $0003 ; Region
    dw $07C3 : dw $E78D ; GFX Pointers
    dw $07C5 : dw $2EBE ; GFX Pointers
    dw $07C7 : dw $C2B9 ; GFX Pointers
    dw $07F3 : dw $0030 ; Music Bank
    dw $090F : dw $8000 ; Screen subpixel X position.
    dw $0911 : dw $0100 ; Screen X position in pixels
    dw $0913 : dw $E3FF ; Screen subpixel Y position
    dw $0915 : dw $020B ; Screen Y position in pixels
    dw $0917 : dw $0100 ; Layer 2 X scroll in room in pixels?
    dw $0919 : dw $020B ; Layer 2 Y scroll in room in pixels? (up = positive)
    dw $0921 : dw $0100 ; BG2 X scroll offset due to room transitions (Translates between Layer 2 scroll and BG2 scroll)
    dw $0923 : dw $FF00 ; BG2 Y scroll offset due to room transitions (Translates between Layer 2 scroll and BG2 scroll)
    dw $09CE : dw $0008 ; Pbs
    dw $0A1C : dw $0079 ; Samus position/state
    dw $0A1E : dw $1108 ; More position/state
    dw $0AF6 : dw $01E4 ; Samus X
    dw $0AFA : dw $0299 ; Samus Y
    dw $D91A : dw $00DD ; Events, Items, Doors
    dw #$FFFF


preset_SZM101_chozodia_chozodia_speedkeep:
    dw #preset_SZM101_chozodia_waterway_speedkeep ; Chozodia: Waterway Speedkeep
    dw $078D : dw $A6A8 ; DDB
    dw $078F : dw $0000 ; DoorOut Index
    dw $079B : dw $D78F ; MDB
    dw $079F : dw $0004 ; Region
    dw $07C3 : dw $F911 ; GFX Pointers
    dw $07C5 : dw $43BA ; GFX Pointers
    dw $07C7 : dw $C2AF ; GFX Pointers
    dw $07F3 : dw $001B ; Music Bank
    dw $090F : dw $0000 ; Screen subpixel X position.
    dw $0911 : dw $011D ; Screen X position in pixels
    dw $0913 : dw $F400 ; Screen subpixel Y position
    dw $0915 : dw $0004 ; Screen Y position in pixels
    dw $0917 : dw $011D ; Layer 2 X scroll in room in pixels?
    dw $0919 : dw $0003 ; Layer 2 Y scroll in room in pixels? (up = positive)
    dw $0921 : dw $FD00 ; BG2 X scroll offset due to room transitions (Translates between Layer 2 scroll and BG2 scroll)
    dw $09C2 : dw $0329 ; Health
    dw $0A1C : dw $0002 ; Samus position/state
    dw $0A1E : dw $0004 ; More position/state
    dw $0AF6 : dw $01BD ; Samus X
    dw $0AFA : dw $008B ; Samus Y
    dw $D91A : dw $00E1 ; Events, Items, Doors
    dw #$FFFF


preset_SZM101_chozodia_bang:
    dw #preset_SZM101_chozodia_chozodia_speedkeep ; Chozodia: Chozodia Speedkeep
    dw $078D : dw $A5C4 ; DDB
    dw $078F : dw $0003 ; DoorOut Index
    dw $079B : dw $D1A3 ; MDB
    dw $0911 : dw $02F2 ; Screen X position in pixels
    dw $0913 : dw $3800 ; Screen subpixel Y position
    dw $0915 : dw $011F ; Screen Y position in pixels
    dw $0917 : dw $02F2 ; Layer 2 X scroll in room in pixels?
    dw $0919 : dw $00D7 ; Layer 2 Y scroll in room in pixels? (up = positive)
    dw $0921 : dw $0000 ; BG2 X scroll offset due to room transitions (Translates between Layer 2 scroll and BG2 scroll)
    dw $0923 : dw $00E0 ; BG2 Y scroll offset due to room transitions (Translates between Layer 2 scroll and BG2 scroll)
    dw $09CE : dw $000B ; Pbs
    dw $0A1C : dw $0027 ; Samus position/state
    dw $0A1E : dw $0508 ; More position/state
    dw $0AF6 : dw $0352 ; Samus X
    dw $0AFA : dw $01CA ; Samus Y
    dw #$FFFF


preset_SZM101_chozodia_botwoon:
    dw #preset_SZM101_chozodia_bang ; Chozodia: Bang
    dw $078D : dw $C0AC ; DDB
    dw $078F : dw $0001 ; DoorOut Index
    dw $079B : dw $8CAA ; MDB
    dw $07C5 : dw $15BA ; GFX Pointers
    dw $07C7 : dw $C2B0 ; GFX Pointers
    dw $090F : dw $DC00 ; Screen subpixel X position.
    dw $0911 : dw $0100 ; Screen X position in pixels
    dw $0913 : dw $5C00 ; Screen subpixel Y position
    dw $0915 : dw $0000 ; Screen Y position in pixels
    dw $0917 : dw $0100 ; Layer 2 X scroll in room in pixels?
    dw $0919 : dw $0000 ; Layer 2 Y scroll in room in pixels? (up = positive)
    dw $0921 : dw $0100 ; BG2 X scroll offset due to room transitions (Translates between Layer 2 scroll and BG2 scroll)
    dw $0923 : dw $0000 ; BG2 Y scroll offset due to room transitions (Translates between Layer 2 scroll and BG2 scroll)
    dw $09A6 : dw $1001 ; Beams
    dw $09C2 : dw $02ED ; Health
    dw $09C6 : dw $0062 ; Missiles
    dw $09CE : dw $0009 ; Pbs
    dw $0A1C : dw $0001 ; Samus position/state
    dw $0A1E : dw $0008 ; More position/state
    dw $0AF6 : dw $01B8 ; Samus X
    dw $0AFA : dw $00AB ; Samus Y
    dw $D8CA : dw $0A00 ; Events, Items, Doors
    dw $D91A : dw $00E2 ; Events, Items, Doors
    dw #$FFFF


preset_SZM101_chozodia_gravity:
    dw #preset_SZM101_chozodia_botwoon ; Chozodia: Botwoon
    dw $078D : dw $BCCC ; DDB
    dw $079B : dw $D95E ; MDB
    dw $07F5 : dw $0003 ; Music Track
    dw $090F : dw $AC00 ; Screen subpixel X position.
    dw $0911 : dw $0000 ; Screen X position in pixels
    dw $0913 : dw $9800 ; Screen subpixel Y position
    dw $0915 : dw $0300 ; Screen Y position in pixels
    dw $0917 : dw $0000 ; Layer 2 X scroll in room in pixels?
    dw $0919 : dw $0300 ; Layer 2 Y scroll in room in pixels? (up = positive)
    dw $0923 : dw $FD00 ; BG2 Y scroll offset due to room transitions (Translates between Layer 2 scroll and BG2 scroll)
    dw $09C2 : dw $0122 ; Health
    dw $09C6 : dw $001A ; Missiles
    dw $09CA : dw $000F ; Supers
    dw $09CE : dw $0007 ; Pbs
    dw $09D6 : dw $0000 ; Reserves
    dw $0A1C : dw $0002 ; Samus position/state
    dw $0A1E : dw $0004 ; More position/state
    dw $0AF6 : dw $0030 ; Samus X
    dw $0AFA : dw $038B ; Samus Y
    dw $D82C : dw $0002 ; Events, Items, Doors
    dw $D8CA : dw $0E00 ; Events, Items, Doors
    dw #$FFFF


preset_SZM101_chozodia_pb_speedball:
    dw #preset_SZM101_chozodia_gravity ; Chozodia: Gravity
    dw $07F3 : dw $000C ; Music Bank
    dw $090F : dw $4000 ; Screen subpixel X position.
    dw $0911 : dw $0100 ; Screen X position in pixels
    dw $0913 : dw $0000 ; Screen subpixel Y position
    dw $0915 : dw $001D ; Screen Y position in pixels
    dw $0917 : dw $0100 ; Layer 2 X scroll in room in pixels?
    dw $0919 : dw $001D ; Layer 2 Y scroll in room in pixels? (up = positive)
    dw $09A2 : dw $732F ; Equipped Items
    dw $09A4 : dw $732F ; Collected Items
    dw $09A6 : dw $1009 ; Beams
    dw $09A8 : dw $100F ; Beams
    dw $09CE : dw $0007 ; Pbs
    dw $0A1C : dw $0001 ; Samus position/state
    dw $0A1E : dw $0008 ; More position/state
    dw $0AF6 : dw $01C1 ; Samus X
    dw $0AFA : dw $008B ; Samus Y
    dw $D880 : dw $FBFF ; Events, Items, Doors
    dw $D91A : dw $00E3 ; Events, Items, Doors
    dw #$FFFF


preset_SZM101_chozodia_tricky_chain_spark:
    dw #preset_SZM101_chozodia_pb_speedball ; Chozodia: PB Speedball
    dw $078D : dw $BC90 ; DDB
    dw $078F : dw $0003 ; DoorOut Index
    dw $079B : dw $D72A ; MDB
    dw $07C5 : dw $43BA ; GFX Pointers
    dw $07C7 : dw $C2AF ; GFX Pointers
    dw $07F5 : dw $0005 ; Music Track
    dw $090F : dw $3000 ; Screen subpixel X position.
    dw $0911 : dw $0000 ; Screen X position in pixels
    dw $0915 : dw $0700 ; Screen Y position in pixels
    dw $0917 : dw $0000 ; Layer 2 X scroll in room in pixels?
    dw $0919 : dw $0700 ; Layer 2 Y scroll in room in pixels? (up = positive)
    dw $0923 : dw $F900 ; BG2 Y scroll offset due to room transitions (Translates between Layer 2 scroll and BG2 scroll)
    dw $09C2 : dw $0104 ; Health
    dw $09CE : dw $000A ; Pbs
    dw $09D0 : dw $0014 ; Max pbs
    dw $0AF6 : dw $0038 ; Samus X
    dw $0AFA : dw $078B ; Samus Y
    dw $D87A : dw $40A6 ; Events, Items, Doors
    dw $D91A : dw $00E4 ; Events, Items, Doors
    dw #$FFFF


preset_SZM101_chozodia_gold_torizo:
    dw #preset_SZM101_chozodia_tricky_chain_spark ; Chozodia: Tricky Chain Spark
    dw $078D : dw $C1F8 ; DDB
    dw $078F : dw $0002 ; DoorOut Index
    dw $079B : dw $8DCC ; MDB
    dw $07C5 : dw $15BA ; GFX Pointers
    dw $07C7 : dw $C2B0 ; GFX Pointers
    dw $090F : dw $7000 ; Screen subpixel X position.
    dw $0913 : dw $B800 ; Screen subpixel Y position
    dw $0915 : dw $0000 ; Screen Y position in pixels
    dw $0919 : dw $0000 ; Layer 2 Y scroll in room in pixels? (up = positive)
    dw $0921 : dw $FF00 ; BG2 X scroll offset due to room transitions (Translates between Layer 2 scroll and BG2 scroll)
    dw $0923 : dw $0000 ; BG2 Y scroll offset due to room transitions (Translates between Layer 2 scroll and BG2 scroll)
    dw $09A6 : dw $100B ; Beams
    dw $09C2 : dw $0351 ; Health
    dw $09C6 : dw $007D ; Missiles
    dw $09CC : dw $001C ; Max supers
    dw $0A1C : dw $0002 ; Samus position/state
    dw $0A1E : dw $0004 ; More position/state
    dw $0AF6 : dw $002C ; Samus X
    dw $0AFA : dw $00AB ; Samus Y
    dw $D876 : dw $EB28 ; Events, Items, Doors
    dw $D91A : dw $00E5 ; Events, Items, Doors
    dw #$FFFF


preset_SZM101_chozodia_reflector_puzzle:
    dw #preset_SZM101_chozodia_gold_torizo ; Chozodia: Gold Torizo
    dw $078D : dw $A2C4 ; DDB
    dw $078F : dw $0000 ; DoorOut Index
    dw $079B : dw $B283 ; MDB
    dw $07F3 : dw $0024 ; Music Bank
    dw $07F5 : dw $0003 ; Music Track
    dw $090F : dw $E000 ; Screen subpixel X position.
    dw $0913 : dw $1000 ; Screen subpixel Y position
    dw $0915 : dw $01FC ; Screen Y position in pixels
    dw $0919 : dw $01FC ; Layer 2 Y scroll in room in pixels? (up = positive)
    dw $0921 : dw $FE00 ; BG2 X scroll offset due to room transitions (Translates between Layer 2 scroll and BG2 scroll)
    dw $0923 : dw $FF00 ; BG2 Y scroll offset due to room transitions (Translates between Layer 2 scroll and BG2 scroll)
    dw $09C2 : dw $02B0 ; Health
    dw $09CE : dw $000B ; Pbs
    dw $09D0 : dw $0016 ; Max pbs
    dw $0AF6 : dw $0024 ; Samus X
    dw $0AFA : dw $028B ; Samus Y
    dw $D82C : dw $0006 ; Events, Items, Doors
    dw $D87A : dw $42A6 ; Events, Items, Doors
    dw $D8CA : dw $0F00 ; Events, Items, Doors
    dw $D91A : dw $00E7 ; Events, Items, Doors
    dw #$FFFF


preset_SZM101_chozodia_lost_maze_down:
    dw #preset_SZM101_chozodia_reflector_puzzle ; Chozodia: Reflector Puzzle
    dw $078D : dw $BD80 ; DDB
    dw $078F : dw $0002 ; DoorOut Index
    dw $079B : dw $D1A3 ; MDB
    dw $07C5 : dw $43BA ; GFX Pointers
    dw $07C7 : dw $C2AF ; GFX Pointers
    dw $07F3 : dw $000C ; Music Bank
    dw $07F5 : dw $0005 ; Music Track
    dw $090F : dw $E500 ; Screen subpixel X position.
    dw $0913 : dw $0000 ; Screen subpixel Y position
    dw $0915 : dw $031B ; Screen Y position in pixels
    dw $0919 : dw $0254 ; Layer 2 Y scroll in room in pixels? (up = positive)
    dw $0921 : dw $FC00 ; BG2 X scroll offset due to room transitions (Translates between Layer 2 scroll and BG2 scroll)
    dw $0923 : dw $0000 ; BG2 Y scroll offset due to room transitions (Translates between Layer 2 scroll and BG2 scroll)
    dw $09C2 : dw $02E9 ; Health
    dw $09C6 : dw $0079 ; Missiles
    dw $09CE : dw $000E ; Pbs
    dw $0AF6 : dw $0026 ; Samus X
    dw $0AFA : dw $038B ; Samus Y
    dw $D8CE : dw $4800 ; Events, Items, Doors
    dw #$FFFF


preset_SZM101_chozodia_big_space_boost:
    dw #preset_SZM101_chozodia_lost_maze_down ; Chozodia: Lost Maze Down
    dw $078D : dw $A42C ; DDB
    dw $078F : dw $0000 ; DoorOut Index
    dw $079B : dw $D845 ; MDB
    dw $090F : dw $8000 ; Screen subpixel X position.
    dw $0911 : dw $00E2 ; Screen X position in pixels
    dw $0913 : dw $7FFF ; Screen subpixel Y position
    dw $0915 : dw $02ED ; Screen Y position in pixels
    dw $0917 : dw $00E2 ; Layer 2 X scroll in room in pixels?
    dw $0919 : dw $02ED ; Layer 2 Y scroll in room in pixels? (up = positive)
    dw $0921 : dw $FE00 ; BG2 X scroll offset due to room transitions (Translates between Layer 2 scroll and BG2 scroll)
    dw $0923 : dw $FD00 ; BG2 Y scroll offset due to room transitions (Translates between Layer 2 scroll and BG2 scroll)
    dw $09C2 : dw $0383 ; Health
    dw $09C4 : dw $0383 ; Max health
    dw $09CE : dw $0012 ; Pbs
    dw $0AF6 : dw $0182 ; Samus X
    dw $0AFA : dw $036B ; Samus Y
    dw $D87E : dw $580F ; Events, Items, Doors
    dw $D91A : dw $00E8 ; Events, Items, Doors
    dw #$FFFF


preset_SZM101_tourian_kihunter_elevator:
    dw #preset_SZM101_chozodia_big_space_boost ; Chozodia: Big Space Boost
    dw $078D : dw $90BA ; DDB
    dw $078F : dw $0002 ; DoorOut Index
    dw $079B : dw $962A ; MDB
    dw $079F : dw $0000 ; Region
    dw $07F3 : dw $000F ; Music Bank
    dw $07F5 : dw $0003 ; Music Track
    dw $090F : dw $5000 ; Screen subpixel X position.
    dw $0911 : dw $0000 ; Screen X position in pixels
    dw $0913 : dw $5400 ; Screen subpixel Y position
    dw $0915 : dw $0000 ; Screen Y position in pixels
    dw $0917 : dw $0000 ; Layer 2 X scroll in room in pixels?
    dw $0919 : dw $0000 ; Layer 2 Y scroll in room in pixels? (up = positive)
    dw $0921 : dw $0000 ; BG2 X scroll offset due to room transitions (Translates between Layer 2 scroll and BG2 scroll)
    dw $0923 : dw $FF00 ; BG2 Y scroll offset due to room transitions (Translates between Layer 2 scroll and BG2 scroll)
    dw $09C2 : dw $0381 ; Health
    dw $0AF6 : dw $007F ; Samus X
    dw $0AFA : dw $005B ; Samus Y
    dw $D91A : dw $00E9 ; Events, Items, Doors
    dw #$FFFF


preset_SZM101_tourian_pancake_missiles:
    dw #preset_SZM101_tourian_kihunter_elevator ; Tourian: Kihunter Elevator
    dw $078D : dw $B3F8 ; DDB
    dw $079B : dw $9552 ; MDB
    dw $07F3 : dw $0009 ; Music Bank
    dw $07F5 : dw $0006 ; Music Track
    dw $090F : dw $A000 ; Screen subpixel X position.
    dw $0913 : dw $0000 ; Screen subpixel Y position
    dw $0921 : dw $0100 ; BG2 X scroll offset due to room transitions (Translates between Layer 2 scroll and BG2 scroll)
    dw $0923 : dw $0000 ; BG2 Y scroll offset due to room transitions (Translates between Layer 2 scroll and BG2 scroll)
    dw $09C2 : dw $0383 ; Health
    dw $09CE : dw $0014 ; Pbs
    dw $09D6 : dw $0030 ; Reserves
    dw $0AF6 : dw $0035 ; Samus X
    dw $0AFA : dw $008B ; Samus Y
    dw $D91A : dw $00EA ; Events, Items, Doors
    dw #$FFFF


preset_SZM101_tourian_landing_site_spark:
    dw #preset_SZM101_tourian_pancake_missiles ; Tourian: Pancake Missiles
    dw $078D : dw $BF8C ; DDB
    dw $079B : dw $91F8 ; MDB
    dw $07C3 : dw $C629 ; GFX Pointers
    dw $07C5 : dw $7CBA ; GFX Pointers
    dw $07C7 : dw $C2AD ; GFX Pointers
    dw $07F3 : dw $0006 ; Music Bank
    dw $07F5 : dw $0007 ; Music Track
    dw $090F : dw $0000 ; Screen subpixel X position.
    dw $0911 : dw $07A1 ; Screen X position in pixels
    dw $0913 : dw $1800 ; Screen subpixel Y position
    dw $0915 : dw $0123 ; Screen Y position in pixels
    dw $0917 : dw $05B8 ; Layer 2 X scroll in room in pixels?
    dw $0919 : dw $00DA ; Layer 2 Y scroll in room in pixels? (up = positive)
    dw $0921 : dw $F700 ; BG2 X scroll offset due to room transitions (Translates between Layer 2 scroll and BG2 scroll)
    dw $0923 : dw $FF00 ; BG2 Y scroll offset due to room transitions (Translates between Layer 2 scroll and BG2 scroll)
    dw $09C6 : dw $0085 ; Missiles
    dw $09C8 : dw $0087 ; Max missiles
    dw $09CA : dw $000E ; Supers
    dw $09D6 : dw $0073 ; Reserves
    dw $0A68 : dw $0096 ; Flash suit
    dw $0AF6 : dw $0841 ; Samus X
    dw $0AFA : dw $01BB ; Samus Y
    dw $D870 : dw $17C6 ; Events, Items, Doors
    dw $D91A : dw $00F8 ; Events, Items, Doors
    dw #$FFFF


preset_SZM101_tourian_morph_room:
    dw #preset_SZM101_tourian_landing_site_spark ; Tourian: Landing Site Spark
    dw $078D : dw $B1B8 ; DDB
    dw $078F : dw $0000 ; DoorOut Index
    dw $079B : dw $8190 ; MDB
    dw $079F : dw $0001 ; Region
    dw $07C3 : dw $E6B0 ; GFX Pointers
    dw $07C5 : dw $64BB ; GFX Pointers
    dw $07C7 : dw $C2B2 ; GFX Pointers
    dw $07F3 : dw $000F ; Music Bank
    dw $07F5 : dw $0005 ; Music Track
    dw $0911 : dw $02E5 ; Screen X position in pixels
    dw $0913 : dw $87FF ; Screen subpixel Y position
    dw $0915 : dw $0200 ; Screen Y position in pixels
    dw $0917 : dw $02E5 ; Layer 2 X scroll in room in pixels?
    dw $0919 : dw $0200 ; Layer 2 Y scroll in room in pixels? (up = positive)
    dw $0921 : dw $FA00 ; BG2 X scroll offset due to room transitions (Translates between Layer 2 scroll and BG2 scroll)
    dw $0923 : dw $FE00 ; BG2 Y scroll offset due to room transitions (Translates between Layer 2 scroll and BG2 scroll)
    dw $09C6 : dw $008C ; Missiles
    dw $09C8 : dw $008C ; Max missiles
    dw $09CA : dw $000E ; Supers
    dw $09CE : dw $0018 ; Pbs
    dw $09D0 : dw $0018 ; Max pbs
    dw $09D6 : dw $00C8 ; Reserves
    dw $0A68 : dw $0000 ; Flash suit
    dw $0AF6 : dw $0385 ; Samus X
    dw $0AFA : dw $02AB ; Samus Y
    dw $D870 : dw $17C7 ; Events, Items, Doors
    dw $D878 : dw $DF3B ; Events, Items, Doors
    dw $D8C2 : dw $50E2 ; Events, Items, Doors
    dw $D91A : dw $0105 ; Events, Items, Doors
    dw #$FFFF


preset_SZM101_tourian_ninja_pirate_fall:
    dw #preset_SZM101_tourian_morph_room ; Tourian: Morph Room
    dw $078D : dw $91C2 ; DDB
    dw $078F : dw $0002 ; DoorOut Index
    dw $079B : dw $DC65 ; MDB
    dw $079F : dw $0005 ; Region
    dw $07C3 : dw $F300 ; GFX Pointers
    dw $07C5 : dw $EDE4 ; GFX Pointers
    dw $07C7 : dw $C2BA ; GFX Pointers
    dw $07F3 : dw $001E ; Music Bank
    dw $090F : dw $A000 ; Screen subpixel X position.
    dw $0911 : dw $0100 ; Screen X position in pixels
    dw $0913 : dw $EBFF ; Screen subpixel Y position
    dw $0915 : dw $0400 ; Screen Y position in pixels
    dw $0917 : dw $0100 ; Layer 2 X scroll in room in pixels?
    dw $0919 : dw $0400 ; Layer 2 Y scroll in room in pixels? (up = positive)
    dw $0921 : dw $FE00 ; BG2 X scroll offset due to room transitions (Translates between Layer 2 scroll and BG2 scroll)
    dw $0923 : dw $0000 ; BG2 Y scroll offset due to room transitions (Translates between Layer 2 scroll and BG2 scroll)
    dw $09C2 : dw $034A ; Health
    dw $09CA : dw $0004 ; Supers
    dw $0AF6 : dw $0139 ; Samus X
    dw $0AFA : dw $048B ; Samus Y
    dw $D87A : dw $4286 ; Events, Items, Doors
    dw $D88E : dw $0001 ; Events, Items, Doors
    dw $D890 : dw $0001 ; Events, Items, Doors
    dw $D8C8 : dw $0181 ; Events, Items, Doors
    dw #$FFFF


preset_SZM101_tourian_xray:
    dw #preset_SZM101_tourian_ninja_pirate_fall ; Tourian: Ninja Pirate Fall
    dw $078D : dw $AA14 ; DDB
    dw $078F : dw $0001 ; DoorOut Index
    dw $079B : dw $DBCD ; MDB
    dw $090F : dw $5000 ; Screen subpixel X position.
    dw $0911 : dw $0000 ; Screen X position in pixels
    dw $0913 : dw $F400 ; Screen subpixel Y position
    dw $0915 : dw $0200 ; Screen Y position in pixels
    dw $0917 : dw $0000 ; Layer 2 X scroll in room in pixels?
    dw $0919 : dw $0200 ; Layer 2 Y scroll in room in pixels? (up = positive)
    dw $0921 : dw $0100 ; BG2 X scroll offset due to room transitions (Translates between Layer 2 scroll and BG2 scroll)
    dw $09C2 : dw $036A ; Health
    dw $09CA : dw $0006 ; Supers
    dw $09CE : dw $0017 ; Pbs
    dw $0A1C : dw $0001 ; Samus position/state
    dw $0A1E : dw $0008 ; More position/state
    dw $0AF6 : dw $00BE ; Samus X
    dw $0AFA : dw $028B ; Samus Y
    dw $D848 : dw $0100 ; Events, Items, Doors
    dw $D8C8 : dw $03F1 ; Events, Items, Doors
    dw #$FFFF


preset_SZM101_tourian_xray_standup_clip:
    dw #preset_SZM101_tourian_xray ; Tourian: Xray
    dw $078D : dw $B4D4 ; DDB
    dw $078F : dw $0002 ; DoorOut Index
    dw $079B : dw $CBD5 ; MDB
    dw $090F : dw $A000 ; Screen subpixel X position.
    dw $0913 : dw $D000 ; Screen subpixel Y position
    dw $0915 : dw $0047 ; Screen Y position in pixels
    dw $0919 : dw $0035 ; Layer 2 Y scroll in room in pixels? (up = positive)
    dw $09A2 : dw $F32F ; Equipped Items
    dw $09A4 : dw $F32F ; Collected Items
    dw $09C2 : dw $03B5 ; Health
    dw $09C4 : dw $03B5 ; Max health
    dw $09CA : dw $000A ; Supers
    dw $09CE : dw $001A ; Pbs
    dw $09D0 : dw $001A ; Max pbs
    dw $0A1C : dw $0002 ; Samus position/state
    dw $0A1E : dw $0004 ; More position/state
    dw $0AF6 : dw $0039 ; Samus X
    dw $0AFA : dw $00BB ; Samus Y
    dw $D84A : dw $0100 ; Events, Items, Doors
    dw $D87A : dw $42A6 ; Events, Items, Doors
    dw $D87E : dw $581F ; Events, Items, Doors
    dw $D880 : dw $FFFF ; Events, Items, Doors
    dw $D91A : dw $0112 ; Events, Items, Doors
    dw #$FFFF


preset_SZM101_tourian_blind_speedkeep:
    dw #preset_SZM101_tourian_xray_standup_clip ; Tourian: Xray Standup Clip
    dw $078D : dw $9A56 ; DDB
    dw $078F : dw $0001 ; DoorOut Index
    dw $079B : dw $DB31 ; MDB
    dw $090F : dw $0000 ; Screen subpixel X position.
    dw $0913 : dw $63FF ; Screen subpixel Y position
    dw $0915 : dw $0200 ; Screen Y position in pixels
    dw $0919 : dw $0200 ; Layer 2 Y scroll in room in pixels? (up = positive)
    dw $09C2 : dw $038D ; Health
    dw $09CE : dw $001B ; Pbs
    dw $09D0 : dw $001E ; Max pbs
    dw $0A1C : dw $0001 ; Samus position/state
    dw $0A1E : dw $0008 ; More position/state
    dw $0AF6 : dw $00C3 ; Samus X
    dw $0AFA : dw $028B ; Samus Y
    dw $D87A : dw $42EE ; Events, Items, Doors
    dw $D90C : dw $0100 ; Events, Items, Doors
    dw $D91A : dw $0115 ; Events, Items, Doors
    dw #$FFFF


preset_SZM101_tourian_metroids:
    dw #preset_SZM101_tourian_blind_speedkeep ; Tourian: Blind Speedkeep
    dw $078D : dw $B4D4 ; DDB
    dw $078F : dw $0002 ; DoorOut Index
    dw $079B : dw $CBD5 ; MDB
    dw $090F : dw $B001 ; Screen subpixel X position.
    dw $0913 : dw $1BFF ; Screen subpixel Y position
    dw $0915 : dw $01FE ; Screen Y position in pixels
    dw $0919 : dw $017E ; Layer 2 Y scroll in room in pixels? (up = positive)
    dw $09C2 : dw $039C ; Health
    dw $09C6 : dw $0091 ; Missiles
    dw $09C8 : dw $0091 ; Max missiles
    dw $09CA : dw $000B ; Supers
    dw $09CC : dw $001E ; Max supers
    dw $0A1C : dw $0002 ; Samus position/state
    dw $0A1E : dw $0004 ; More position/state
    dw $0AF6 : dw $0028 ; Samus X
    dw $D874 : dw $41EF ; Events, Items, Doors
    dw $D878 : dw $DF7B ; Events, Items, Doors
    dw $D91A : dw $0117 ; Events, Items, Doors
    dw #$FFFF


preset_SZM101_tourian_mother_brain:
    dw #preset_SZM101_tourian_metroids ; Tourian: Metroids
    dw $078D : dw $A9CC ; DDB
    dw $078F : dw $0001 ; DoorOut Index
    dw $079B : dw $CAAE ; MDB
    dw $090F : dw $4000 ; Screen subpixel X position.
    dw $0913 : dw $6400 ; Screen subpixel Y position
    dw $0915 : dw $0000 ; Screen Y position in pixels
    dw $0919 : dw $0000 ; Layer 2 Y scroll in room in pixels? (up = positive)
    dw $0921 : dw $FC00 ; BG2 X scroll offset due to room transitions (Translates between Layer 2 scroll and BG2 scroll)
    dw $09C2 : dw $03B5 ; Health
    dw $09CA : dw $001E ; Supers
    dw $09CE : dw $001E ; Pbs
    dw $0AF6 : dw $0039 ; Samus X
    dw $0AFA : dw $00AB ; Samus Y
    dw $D8C6 : dw $57F4 ; Events, Items, Doors
    dw #$FFFF


preset_SZM101_tourian_elevator_breakdown:
    dw #preset_SZM101_tourian_mother_brain ; Tourian: Mother Brain
    dw $078D : dw $B588 ; DDB
    dw $078F : dw $0005 ; DoorOut Index
    dw $079B : dw $8320 ; MDB
    dw $07F3 : dw $0024 ; Music Bank
    dw $07F5 : dw $0007 ; Music Track
    dw $0913 : dw $0000 ; Screen subpixel Y position
    dw $0915 : dw $001F ; Screen Y position in pixels
    dw $0919 : dw $001F ; Layer 2 Y scroll in room in pixels? (up = positive)
    dw $0921 : dw $0000 ; BG2 X scroll offset due to room transitions (Translates between Layer 2 scroll and BG2 scroll)
    dw $0923 : dw $FF00 ; BG2 Y scroll offset due to room transitions (Translates between Layer 2 scroll and BG2 scroll)
    dw $09C2 : dw $0312 ; Health
    dw $09C6 : dw $003A ; Missiles
    dw $09CA : dw $0017 ; Supers
    dw $0A1C : dw $009B ; Samus position/state
    dw $0A1E : dw $0000 ; More position/state
    dw $0AF6 : dw $0080 ; Samus X
    dw $0AFA : dw $00A9 ; Samus Y
    dw $D820 : dw $4125 ; Events, Items, Doors
    dw $D8CC : dw $0003 ; Events, Items, Doors
    dw $D90C : dw $FF00 ; Events, Items, Doors
    dw #$FFFF


preset_SZM101_tourian_back_of_gauntlet_missiles:
    dw #preset_SZM101_tourian_elevator_breakdown ; Tourian: Elevator Breakdown
    dw $078D : dw $B5B0 ; DDB
    dw $078F : dw $0000 ; DoorOut Index
    dw $079B : dw $92B3 ; MDB
    dw $079F : dw $0000 ; Region
    dw $07C3 : dw $D414 ; GFX Pointers
    dw $07C5 : dw $C1BF ; GFX Pointers
    dw $07C7 : dw $C2BB ; GFX Pointers
    dw $090F : dw $A000 ; Screen subpixel X position.
    dw $0913 : dw $9C00 ; Screen subpixel Y position
    dw $0915 : dw $0000 ; Screen Y position in pixels
    dw $0919 : dw $0000 ; Layer 2 Y scroll in room in pixels? (up = positive)
    dw $0921 : dw $FB00 ; BG2 X scroll offset due to room transitions (Translates between Layer 2 scroll and BG2 scroll)
    dw $0923 : dw $0000 ; BG2 Y scroll offset due to room transitions (Translates between Layer 2 scroll and BG2 scroll)
    dw $09C2 : dw $03E7 ; Health
    dw $09C4 : dw $03E7 ; Max health
    dw $09C6 : dw $0039 ; Missiles
    dw $09CA : dw $0016 ; Supers
    dw $09CE : dw $001C ; Pbs
    dw $0A1C : dw $0002 ; Samus position/state
    dw $0A1E : dw $0004 ; More position/state
    dw $0A68 : dw $0081 ; Flash suit
    dw $0AF6 : dw $002E ; Samus X
    dw $0AFA : dw $008B ; Samus Y
    dw $D87E : dw $5C1F ; Events, Items, Doors
    dw $D91A : dw $0118 ; Events, Items, Doors
    dw #$FFFF


preset_SZM101_tourian_parlor:
    dw #preset_SZM101_tourian_back_of_gauntlet_missiles ; Tourian: Back Of Gauntlet Missiles
    dw $078D : dw $8EF2 ; DDB
    dw $078F : dw $0001 ; DoorOut Index
    dw $079B : dw $92FD ; MDB
    dw $07C3 : dw $C629 ; GFX Pointers
    dw $07C5 : dw $7CBA ; GFX Pointers
    dw $07C7 : dw $C2AD ; GFX Pointers
    dw $07F3 : dw $0006 ; Music Bank
    dw $090F : dw $0000 ; Screen subpixel X position.
    dw $0911 : dw $0032 ; Screen X position in pixels
    dw $0913 : dw $0000 ; Screen subpixel Y position
    dw $0915 : dw $0100 ; Screen Y position in pixels
    dw $0917 : dw $0025 ; Layer 2 X scroll in room in pixels?
    dw $0919 : dw $00C0 ; Layer 2 Y scroll in room in pixels? (up = positive)
    dw $0921 : dw $0100 ; BG2 X scroll offset due to room transitions (Translates between Layer 2 scroll and BG2 scroll)
    dw $0923 : dw $FF00 ; BG2 Y scroll offset due to room transitions (Translates between Layer 2 scroll and BG2 scroll)
    dw $09C2 : dw $0419 ; Health
    dw $09C4 : dw $0419 ; Max health
    dw $09C6 : dw $0043 ; Missiles
    dw $09C8 : dw $009B ; Max missiles
    dw $09CA : dw $0015 ; Supers
    dw $0A1C : dw $0001 ; Samus position/state
    dw $0A1E : dw $0008 ; More position/state
    dw $0A68 : dw $00BC ; Flash suit
    dw $0AF6 : dw $0092 ; Samus X
    dw $0AFA : dw $0189 ; Samus Y
    dw $D820 : dw $0125 ; Events, Items, Doors
    dw $D828 : dw $0005 ; Events, Items, Doors
    dw $D870 : dw $17DF ; Events, Items, Doors
    dw $D87C : dw $E77E ; Events, Items, Doors
    dw $D91A : dw $011D ; Events, Items, Doors
    dw #$FFFF


preset_SZM101_tourian_parlor_fall:
    dw #preset_SZM101_tourian_parlor ; Tourian: Parlor
    dw $078D : dw $B4B0 ; DDB
    dw $078F : dw $0004 ; DoorOut Index
    dw $0911 : dw $0100 ; Screen X position in pixels
    dw $0913 : dw $0800 ; Screen subpixel Y position
    dw $0915 : dw $0199 ; Screen Y position in pixels
    dw $0917 : dw $00C0 ; Layer 2 X scroll in room in pixels?
    dw $0919 : dw $0132 ; Layer 2 Y scroll in room in pixels? (up = positive)
    dw $0921 : dw $FB00 ; BG2 X scroll offset due to room transitions (Translates between Layer 2 scroll and BG2 scroll)
    dw $09CE : dw $001D ; Pbs
    dw $09D0 : dw $0020 ; Max pbs
    dw $0A1C : dw $007A ; Samus position/state
    dw $0A1E : dw $1104 ; More position/state
    dw $0A68 : dw $0000 ; Flash suit
    dw $0AF6 : dw $0179 ; Samus X
    dw $0AFA : dw $0209 ; Samus Y
    dw $D840 : dw $0100 ; Events, Items, Doors
    dw $D878 : dw $DFFB ; Events, Items, Doors
    dw $D91A : dw $0120 ; Events, Items, Doors
    dw #$FFFF


preset_SZM101_tourian_phantoon:
    dw #preset_SZM101_tourian_parlor_fall ; Tourian: Parlor Fall
    dw $078D : dw $B5E8 ; DDB
    dw $078F : dw $0003 ; DoorOut Index
    dw $079B : dw $96BA ; MDB
    dw $079F : dw $0005 ; Region
    dw $07C3 : dw $B004 ; GFX Pointers
    dw $07C5 : dw $E3C0 ; GFX Pointers
    dw $07C7 : dw $C2C1 ; GFX Pointers
    dw $090F : dw $9000 ; Screen subpixel X position.
    dw $0913 : dw $5000 ; Screen subpixel Y position
    dw $0915 : dw $0A00 ; Screen Y position in pixels
    dw $0917 : dw $0100 ; Layer 2 X scroll in room in pixels?
    dw $0919 : dw $0A00 ; Layer 2 Y scroll in room in pixels? (up = positive)
    dw $0921 : dw $FF00 ; BG2 X scroll offset due to room transitions (Translates between Layer 2 scroll and BG2 scroll)
    dw $0923 : dw $00E0 ; BG2 Y scroll offset due to room transitions (Translates between Layer 2 scroll and BG2 scroll)
    dw $09CA : dw $0014 ; Supers
    dw $0A1C : dw $0001 ; Samus position/state
    dw $0A1E : dw $0008 ; More position/state
    dw $0AF6 : dw $01D0 ; Samus X
    dw $0AFA : dw $0A8B ; Samus Y
    dw $D8CE : dw $4810 ; Events, Items, Doors
    dw #$FFFF


preset_SZM101_tourian_ninja_pirates:
    dw #preset_SZM101_tourian_phantoon ; Tourian: Phantoon
    dw $078D : dw $A264 ; DDB
    dw $078F : dw $0000 ; DoorOut Index
    dw $079B : dw $DEA7 ; MDB
    dw $07C3 : dw $F300 ; GFX Pointers
    dw $07C5 : dw $EDE4 ; GFX Pointers
    dw $07C7 : dw $C2BA ; GFX Pointers
    dw $07F3 : dw $001E ; Music Bank
    dw $07F5 : dw $0005 ; Music Track
    dw $090F : dw $7000 ; Screen subpixel X position.
    dw $0911 : dw $0000 ; Screen X position in pixels
    dw $0913 : dw $0000 ; Screen subpixel Y position
    dw $0915 : dw $00FD ; Screen Y position in pixels
    dw $0917 : dw $0000 ; Layer 2 X scroll in room in pixels?
    dw $0919 : dw $00BD ; Layer 2 Y scroll in room in pixels? (up = positive)
    dw $0921 : dw $FA00 ; BG2 X scroll offset due to room transitions (Translates between Layer 2 scroll and BG2 scroll)
    dw $0923 : dw $0000 ; BG2 Y scroll offset due to room transitions (Translates between Layer 2 scroll and BG2 scroll)
    dw $09A2 : dw $F30F ; Equipped Items
    dw $09C2 : dw $00EE ; Health
    dw $09C6 : dw $0049 ; Missiles
    dw $09CA : dw $0016 ; Supers
    dw $09CE : dw $0020 ; Pbs
    dw $09D6 : dw $0000 ; Reserves
    dw $0A1C : dw $0002 ; Samus position/state
    dw $0A1E : dw $0004 ; More position/state
    dw $0A68 : dw $0001 ; Flash suit
    dw $0AF6 : dw $0079 ; Samus X
    dw $0AFA : dw $016B ; Samus Y
    dw $D82C : dw $0106 ; Events, Items, Doors
    dw $D8C2 : dw $50F2 ; Events, Items, Doors
    dw $D8C8 : dw $03F3 ; Events, Items, Doors
    dw $D8CE : dw $4910 ; Events, Items, Doors
    dw #$FFFF


preset_SZM101_tourian_vault_missile:
    dw #preset_SZM101_tourian_ninja_pirates ; Tourian: Ninja Pirates
    dw $078D : dw $AAF8 ; DDB
    dw $079B : dw $DE4D ; MDB
    dw $090F : dw $3FFF ; Screen subpixel X position.
    dw $0911 : dw $0200 ; Screen X position in pixels
    dw $0913 : dw $E800 ; Screen subpixel Y position
    dw $0915 : dw $0000 ; Screen Y position in pixels
    dw $0917 : dw $0180 ; Layer 2 X scroll in room in pixels?
    dw $0919 : dw $0000 ; Layer 2 Y scroll in room in pixels? (up = positive)
    dw $0921 : dw $0000 ; BG2 X scroll offset due to room transitions (Translates between Layer 2 scroll and BG2 scroll)
    dw $0923 : dw $FF00 ; BG2 Y scroll offset due to room transitions (Translates between Layer 2 scroll and BG2 scroll)
    dw $09CA : dw $0015 ; Supers
    dw $0A68 : dw $0000 ; Flash suit
    dw $0AF6 : dw $02D0 ; Samus X
    dw $0AFA : dw $008B ; Samus Y
    dw $D8C8 : dw $03F7 ; Events, Items, Doors
    dw #$FFFF


preset_SZM101_tourian_ninja_pirate_room:
    dw #preset_SZM101_tourian_vault_missile ; Tourian: Vault Missile
    dw $078D : dw $A48C ; DDB
    dw $090F : dw $0000 ; Screen subpixel X position.
    dw $0911 : dw $000B ; Screen X position in pixels
    dw $0913 : dw $F800 ; Screen subpixel Y position
    dw $0915 : dw $001F ; Screen Y position in pixels
    dw $0917 : dw $0008 ; Layer 2 X scroll in room in pixels?
    dw $0919 : dw $0017 ; Layer 2 Y scroll in room in pixels? (up = positive)
    dw $0921 : dw $FD00 ; BG2 X scroll offset due to room transitions (Translates between Layer 2 scroll and BG2 scroll)
    dw $0923 : dw $0000 ; BG2 Y scroll offset due to room transitions (Translates between Layer 2 scroll and BG2 scroll)
    dw $09A2 : dw $F32F ; Equipped Items
    dw $09C2 : dw $040A ; Health
    dw $09C6 : dw $0042 ; Missiles
    dw $09C8 : dw $00A0 ; Max missiles
    dw $09CA : dw $000F ; Supers
    dw $09CE : dw $0015 ; Pbs
    dw $09D6 : dw $00C8 ; Reserves
    dw $0AF6 : dw $00AB ; Samus X
    dw $D872 : dw $E9FF ; Events, Items, Doors
    dw $D8CE : dw $5910 ; Events, Items, Doors
    dw $D91A : dw $0122 ; Events, Items, Doors
    dw #$FFFF


preset_SZM101_tourian_under_mb_speedkeep:
    dw #preset_SZM101_tourian_ninja_pirate_room ; Tourian: Ninja Pirate Room
    dw $078D : dw $AB1C ; DDB
    dw $078F : dw $0001 ; DoorOut Index
    dw $079B : dw $DEDE ; MDB
    dw $090F : dw $A000 ; Screen subpixel X position.
    dw $0911 : dw $00ED ; Screen X position in pixels
    dw $0913 : dw $CC00 ; Screen subpixel Y position
    dw $0915 : dw $0117 ; Screen Y position in pixels
    dw $0917 : dw $00B1 ; Layer 2 X scroll in room in pixels?
    dw $0919 : dw $00D1 ; Layer 2 Y scroll in room in pixels? (up = positive)
    dw $0921 : dw $0100 ; BG2 X scroll offset due to room transitions (Translates between Layer 2 scroll and BG2 scroll)
    dw $0923 : dw $FD00 ; BG2 Y scroll offset due to room transitions (Translates between Layer 2 scroll and BG2 scroll)
    dw $09C6 : dw $0044 ; Missiles
    dw $0A1C : dw $0001 ; Samus position/state
    dw $0A1E : dw $0008 ; More position/state
    dw $0AF6 : dw $0153 ; Samus X
    dw $0AFA : dw $018B ; Samus Y
    dw #$FFFF


preset_SZM101_tourian_metroids_forward:
    dw #preset_SZM101_tourian_under_mb_speedkeep ; Tourian: Under MB speedkeep
    dw $078D : dw $BE40 ; DDB
    dw $078F : dw $0000 ; DoorOut Index
    dw $079B : dw $96BA ; MDB
    dw $07C3 : dw $B004 ; GFX Pointers
    dw $07C5 : dw $E3C0 ; GFX Pointers
    dw $07C7 : dw $C2C1 ; GFX Pointers
    dw $07F3 : dw $0006 ; Music Bank
    dw $07F5 : dw $0007 ; Music Track
    dw $090F : dw $3E00 ; Screen subpixel X position.
    dw $0911 : dw $0200 ; Screen X position in pixels
    dw $0913 : dw $9C00 ; Screen subpixel Y position
    dw $0915 : dw $0900 ; Screen Y position in pixels
    dw $0917 : dw $0200 ; Layer 2 X scroll in room in pixels?
    dw $0919 : dw $0900 ; Layer 2 Y scroll in room in pixels? (up = positive)
    dw $0921 : dw $FE00 ; BG2 X scroll offset due to room transitions (Translates between Layer 2 scroll and BG2 scroll)
    dw $0923 : dw $F600 ; BG2 Y scroll offset due to room transitions (Translates between Layer 2 scroll and BG2 scroll)
    dw $09C2 : dw $03A6 ; Health
    dw $09CE : dw $0019 ; Pbs
    dw $09D0 : dw $0022 ; Max pbs
    dw $0AF6 : dw $02CC ; Samus X
    dw $0AFA : dw $098B ; Samus Y
    dw $D87A : dw $42FE ; Events, Items, Doors
    dw $D91A : dw $0123 ; Events, Items, Doors
    dw #$FFFF


preset_SZM101_tourian_metroids_backward:
    dw #preset_SZM101_tourian_metroids_forward ; Tourian: Metroids Forward
    dw $078D : dw $B510 ; DDB
    dw $078F : dw $0004 ; DoorOut Index
    dw $079B : dw $CD5C ; MDB
    dw $07C5 : dw $04C0 ; GFX Pointers
    dw $090F : dw $0000 ; Screen subpixel X position.
    dw $0911 : dw $0100 ; Screen X position in pixels
    dw $0913 : dw $0000 ; Screen subpixel Y position
    dw $0915 : dw $0109 ; Screen Y position in pixels
    dw $0917 : dw $0100 ; Layer 2 X scroll in room in pixels?
    dw $0919 : dw $0109 ; Layer 2 Y scroll in room in pixels? (up = positive)
    dw $0923 : dw $FF00 ; BG2 Y scroll offset due to room transitions (Translates between Layer 2 scroll and BG2 scroll)
    dw $09C2 : dw $03A7 ; Health
    dw $09C6 : dw $004F ; Missiles
    dw $09C8 : dw $00A5 ; Max missiles
    dw $09CA : dw $0014 ; Supers
    dw $09CE : dw $0021 ; Pbs
    dw $0A1C : dw $0079 ; Samus position/state
    dw $0A1E : dw $1108 ; More position/state
    dw $0AF6 : dw $01E7 ; Samus X
    dw $0AFA : dw $0179 ; Samus Y
    dw $D874 : dw $41FF ; Events, Items, Doors
    dw $D8C6 : dw $77F4 ; Events, Items, Doors
    dw $D91A : dw $0127 ; Events, Items, Doors
    dw #$FFFF


preset_SZM101_tourian_tourian_escape:
    dw #preset_SZM101_tourian_metroids_backward ; Tourian: Metroids Backward
    dw $078D : dw $B6E4 ; DDB
    dw $078F : dw $0002 ; DoorOut Index
    dw $079B : dw $96BA ; MDB
    dw $07C5 : dw $E3C0 ; GFX Pointers
    dw $090F : dw $E000 ; Screen subpixel X position.
    dw $0911 : dw $0000 ; Screen X position in pixels
    dw $0913 : dw $E7FF ; Screen subpixel Y position
    dw $0915 : dw $0A00 ; Screen Y position in pixels
    dw $0917 : dw $0000 ; Layer 2 X scroll in room in pixels?
    dw $0919 : dw $0A00 ; Layer 2 Y scroll in room in pixels? (up = positive)
    dw $0921 : dw $FD00 ; BG2 X scroll offset due to room transitions (Translates between Layer 2 scroll and BG2 scroll)
    dw $0923 : dw $F700 ; BG2 Y scroll offset due to room transitions (Translates between Layer 2 scroll and BG2 scroll)
    dw $09C2 : dw $035E ; Health
    dw $0A1C : dw $0002 ; Samus position/state
    dw $0A1E : dw $0004 ; More position/state
    dw $0AF6 : dw $002B ; Samus X
    dw $0AFA : dw $0A8B ; Samus Y
    dw $D91A : dw $0129 ; Events, Items, Doors
    dw #$FFFF


preset_SZM101_cleanup_2_brinstar_secret_item:
    dw #preset_SZM101_tourian_tourian_escape ; Tourian: Tourian Escape
    dw $078D : dw $AA5C ; DDB
    dw $078F : dw $0001 ; DoorOut Index
    dw $079B : dw $83E8 ; MDB
    dw $079F : dw $0001 ; Region
    dw $07C3 : dw $E6B0 ; GFX Pointers
    dw $07C5 : dw $64BB ; GFX Pointers
    dw $07C7 : dw $C2B2 ; GFX Pointers
    dw $07F3 : dw $0012 ; Music Bank
    dw $07F5 : dw $0005 ; Music Track
    dw $090F : dw $7000 ; Screen subpixel X position.
    dw $0913 : dw $0000 ; Screen subpixel Y position
    dw $0915 : dw $0200 ; Screen Y position in pixels
    dw $0919 : dw $0200 ; Layer 2 Y scroll in room in pixels? (up = positive)
    dw $0921 : dw $0000 ; BG2 X scroll offset due to room transitions (Translates between Layer 2 scroll and BG2 scroll)
    dw $0923 : dw $00E0 ; BG2 Y scroll offset due to room transitions (Translates between Layer 2 scroll and BG2 scroll)
    dw $09CA : dw $0013 ; Supers
    dw $0A1C : dw $009B ; Samus position/state
    dw $0A1E : dw $0000 ; More position/state
    dw $0AF6 : dw $0080 ; Samus X
    dw $0AFA : dw $02A8 ; Samus Y
    dw $D91A : dw $012B ; Events, Items, Doors
    dw #$FFFF


preset_SZM101_cleanup_2_mini_kraid_long_room:
    dw #preset_SZM101_cleanup_2_brinstar_secret_item ; Cleanup 2: Brinstar Secret Item
    dw $078D : dw $9072 ; DDB
    dw $078F : dw $0000 ; DoorOut Index
    dw $079B : dw $A4B1 ; MDB
    dw $07C3 : dw $A5AA ; GFX Pointers
    dw $07C5 : dw $5FBC ; GFX Pointers
    dw $07C7 : dw $C2B3 ; GFX Pointers
    dw $090F : dw $9000 ; Screen subpixel X position.
    dw $0913 : dw $2800 ; Screen subpixel Y position
    dw $0915 : dw $0900 ; Screen Y position in pixels
    dw $0919 : dw $0900 ; Layer 2 Y scroll in room in pixels? (up = positive)
    dw $0921 : dw $0100 ; BG2 X scroll offset due to room transitions (Translates between Layer 2 scroll and BG2 scroll)
    dw $0923 : dw $FC00 ; BG2 Y scroll offset due to room transitions (Translates between Layer 2 scroll and BG2 scroll)
    dw $09CA : dw $0015 ; Supers
    dw $09CC : dw $0020 ; Max supers
    dw $09CE : dw $0020 ; Pbs
    dw $0A1C : dw $0001 ; Samus position/state
    dw $0A1E : dw $0008 ; More position/state
    dw $0AF6 : dw $00C4 ; Samus X
    dw $0AFA : dw $098B ; Samus Y
    dw $D876 : dw $EBA8 ; Events, Items, Doors
    dw $D91A : dw $012E ; Events, Items, Doors
    dw #$FFFF


preset_SZM101_cleanup_2_mini_kraid_boss_fight:
    dw #preset_SZM101_cleanup_2_mini_kraid_long_room ; Cleanup 2: Mini Kraid Long Room
    dw $078D : dw $AFB4 ; DDB
    dw $078F : dw $0001 ; DoorOut Index
    dw $079B : dw $9CB3 ; MDB
    dw $07C3 : dw $E6B0 ; GFX Pointers
    dw $07C5 : dw $64BB ; GFX Pointers
    dw $07C7 : dw $C2B2 ; GFX Pointers
    dw $090F : dw $E680 ; Screen subpixel X position.
    dw $0911 : dw $0B00 ; Screen X position in pixels
    dw $0913 : dw $C400 ; Screen subpixel Y position
    dw $0915 : dw $0300 ; Screen Y position in pixels
    dw $0917 : dw $0B00 ; Layer 2 X scroll in room in pixels?
    dw $0919 : dw $0300 ; Layer 2 Y scroll in room in pixels? (up = positive)
    dw $0921 : dw $F800 ; BG2 X scroll offset due to room transitions (Translates between Layer 2 scroll and BG2 scroll)
    dw $0923 : dw $FE00 ; BG2 Y scroll offset due to room transitions (Translates between Layer 2 scroll and BG2 scroll)
    dw $09C2 : dw $035D ; Health
    dw $09CA : dw $001F ; Supers
    dw $0A1C : dw $0002 ; Samus position/state
    dw $0A1E : dw $0004 ; More position/state
    dw $0AF6 : dw $0B31 ; Samus X
    dw $0AFA : dw $0389 ; Samus Y
    dw $D8C2 : dw $52F2 ; Events, Items, Doors
    dw $D8CE : dw $5950 ; Events, Items, Doors
    dw $D91A : dw $0131 ; Events, Items, Doors
    dw #$FFFF


preset_SZM101_cleanup_2_kraid:
    dw #preset_SZM101_cleanup_2_mini_kraid_boss_fight ; Cleanup 2: Mini Kraid Boss Fight
    dw $078D : dw $9192 ; DDB
    dw $078F : dw $0000 ; DoorOut Index
    dw $079B : dw $A641 ; MDB
    dw $07C3 : dw $A5AA ; GFX Pointers
    dw $07C5 : dw $5FBC ; GFX Pointers
    dw $07C7 : dw $C2B3 ; GFX Pointers
    dw $07F3 : dw $0027 ; Music Bank
    dw $07F5 : dw $0006 ; Music Track
    dw $090F : dw $4000 ; Screen subpixel X position.
    dw $0911 : dw $0000 ; Screen X position in pixels
    dw $0913 : dw $13FF ; Screen subpixel Y position
    dw $0915 : dw $07D2 ; Screen Y position in pixels
    dw $0917 : dw $0000 ; Layer 2 X scroll in room in pixels?
    dw $0919 : dw $07D2 ; Layer 2 Y scroll in room in pixels? (up = positive)
    dw $0921 : dw $FF00 ; BG2 X scroll offset due to room transitions (Translates between Layer 2 scroll and BG2 scroll)
    dw $0923 : dw $FA00 ; BG2 Y scroll offset due to room transitions (Translates between Layer 2 scroll and BG2 scroll)
    dw $09C2 : dw $0442 ; Health
    dw $09C4 : dw $044B ; Max health
    dw $0A1C : dw $0027 ; Samus position/state
    dw $0A1E : dw $0508 ; More position/state
    dw $0AF6 : dw $00D0 ; Samus X
    dw $0AFA : dw $0849 ; Samus Y
    dw $D87C : dw $EF7E ; Events, Items, Doors
    dw $D91A : dw $0133 ; Events, Items, Doors
    dw #$FFFF


preset_SZM101_cleanup_2_pink_hopper_spark:
    dw #preset_SZM101_cleanup_2_kraid ; Cleanup 2: Kraid
    dw $078D : dw $AFCC ; DDB
    dw $078F : dw $0003 ; DoorOut Index
    dw $079B : dw $9CB3 ; MDB
    dw $07C3 : dw $E6B0 ; GFX Pointers
    dw $07C5 : dw $64BB ; GFX Pointers
    dw $07C7 : dw $C2B2 ; GFX Pointers
    dw $07F3 : dw $0012 ; Music Bank
    dw $07F5 : dw $0005 ; Music Track
    dw $090F : dw $C000 ; Screen subpixel X position.
    dw $0911 : dw $0915 ; Screen X position in pixels
    dw $0913 : dw $0000 ; Screen subpixel Y position
    dw $0915 : dw $0000 ; Screen Y position in pixels
    dw $0917 : dw $0915 ; Layer 2 X scroll in room in pixels?
    dw $0919 : dw $0000 ; Layer 2 Y scroll in room in pixels? (up = positive)
    dw $0921 : dw $F800 ; BG2 X scroll offset due to room transitions (Translates between Layer 2 scroll and BG2 scroll)
    dw $0923 : dw $0000 ; BG2 Y scroll offset due to room transitions (Translates between Layer 2 scroll and BG2 scroll)
    dw $09C2 : dw $042C ; Health
    dw $09C6 : dw $0055 ; Missiles
    dw $09CA : dw $001D ; Supers
    dw $09CE : dw $0022 ; Pbs
    dw $0A1C : dw $0001 ; Samus position/state
    dw $0A1E : dw $0008 ; More position/state
    dw $0AF6 : dw $0975 ; Samus X
    dw $0AFA : dw $009B ; Samus Y
    dw $D828 : dw $0105 ; Events, Items, Doors
    dw $D8CE : dw $5D50 ; Events, Items, Doors
    dw $D91A : dw $0135 ; Events, Items, Doors
    dw #$FFFF


preset_SZM101_cleanup_2_reserve_room:
    dw #preset_SZM101_cleanup_2_pink_hopper_spark ; Cleanup 2: Pink Hopper Spark
    dw $078D : dw $B0E0 ; DDB
    dw $078F : dw $0000 ; DoorOut Index
    dw $079B : dw $A253 ; MDB
    dw $07C3 : dw $A5AA ; GFX Pointers
    dw $07C5 : dw $5FBC ; GFX Pointers
    dw $07C7 : dw $C2B3 ; GFX Pointers
    dw $090F : dw $6000 ; Screen subpixel X position.
    dw $0911 : dw $0000 ; Screen X position in pixels
    dw $0915 : dw $021D ; Screen Y position in pixels
    dw $0917 : dw $0000 ; Layer 2 X scroll in room in pixels?
    dw $0919 : dw $021D ; Layer 2 Y scroll in room in pixels? (up = positive)
    dw $0921 : dw $0100 ; BG2 X scroll offset due to room transitions (Translates between Layer 2 scroll and BG2 scroll)
    dw $0923 : dw $F700 ; BG2 Y scroll offset due to room transitions (Translates between Layer 2 scroll and BG2 scroll)
    dw $0A1C : dw $0002 ; Samus position/state
    dw $0A1E : dw $0004 ; More position/state
    dw $0AF6 : dw $0035 ; Samus X
    dw $0AFA : dw $028B ; Samus Y
    dw $D91A : dw $0138 ; Events, Items, Doors
    dw #$FFFF


preset_SZM101_cleanup_2_below_reserve_room:
    dw #preset_SZM101_cleanup_2_reserve_room ; Cleanup 2: Reserve Room
    dw $078D : dw $8D66 ; DDB
    dw $090F : dw $C000 ; Screen subpixel X position.
    dw $0913 : dw $CC00 ; Screen subpixel Y position
    dw $0915 : dw $0300 ; Screen Y position in pixels
    dw $0919 : dw $0300 ; Layer 2 Y scroll in room in pixels? (up = positive)
    dw $0923 : dw $FE00 ; BG2 Y scroll offset due to room transitions (Translates between Layer 2 scroll and BG2 scroll)
    dw $09CA : dw $001F ; Supers
    dw $09CC : dw $0022 ; Max supers
    dw $09CE : dw $0021 ; Pbs
    dw $09D4 : dw $012C ; Max reserves
    dw $0AF6 : dw $0047 ; Samus X
    dw $0AFA : dw $038B ; Samus Y
    dw $D876 : dw $EBA9 ; Events, Items, Doors
    dw $D87E : dw $7C1F ; Events, Items, Doors
    dw $D91A : dw $013B ; Events, Items, Doors
    dw #$FFFF


preset_SZM101_cleanup_2_sporespawn_ice_bridge:
    dw #preset_SZM101_cleanup_2_below_reserve_room ; Cleanup 2: Below Reserve Room
    dw $078D : dw $8E32 ; DDB
    dw $079B : dw $9AD9 ; MDB
    dw $090F : dw $5001 ; Screen subpixel X position.
    dw $0913 : dw $B3FF ; Screen subpixel Y position
    dw $0915 : dw $051A ; Screen Y position in pixels
    dw $0919 : dw $051A ; Layer 2 Y scroll in room in pixels? (up = positive)
    dw $0921 : dw $FF00 ; BG2 X scroll offset due to room transitions (Translates between Layer 2 scroll and BG2 scroll)
    dw $0923 : dw $FB00 ; BG2 Y scroll offset due to room transitions (Translates between Layer 2 scroll and BG2 scroll)
    dw $09C2 : dw $03FC ; Health
    dw $09C6 : dw $005A ; Missiles
    dw $09C8 : dw $00AA ; Max missiles
    dw $0AF6 : dw $0028 ; Samus X
    dw $0AFA : dw $058B ; Samus Y
    dw $D870 : dw $1FDF ; Events, Items, Doors
    dw $D91A : dw $013D ; Events, Items, Doors
    dw #$FFFF


preset_SZM101_cleanup_2_sporespawn_exit:
    dw #preset_SZM101_cleanup_2_sporespawn_ice_bridge ; Cleanup 2: SporeSpawn Ice Bridge
    dw $078D : dw $8B26 ; DDB
    dw $079B : dw $9DC7 ; MDB
    dw $07F3 : dw $002A ; Music Bank
    dw $090F : dw $A000 ; Screen subpixel X position.
    dw $0913 : dw $0000 ; Screen subpixel Y position
    dw $0915 : dw $021C ; Screen Y position in pixels
    dw $0919 : dw $021C ; Layer 2 Y scroll in room in pixels? (up = positive)
    dw $0923 : dw $FE00 ; BG2 Y scroll offset due to room transitions (Translates between Layer 2 scroll and BG2 scroll)
    dw $09C2 : dw $0432 ; Health
    dw $09C6 : dw $006A ; Missiles
    dw $09CA : dw $0023 ; Supers
    dw $09CC : dw $0024 ; Max supers
    dw $09CE : dw $0022 ; Pbs
    dw $0A1C : dw $0001 ; Samus position/state
    dw $0A1E : dw $0008 ; More position/state
    dw $0AF6 : dw $00B9 ; Samus X
    dw $0AFA : dw $028B ; Samus Y
    dw $D828 : dw $0305 ; Events, Items, Doors
    dw $D876 : dw $EBAD ; Events, Items, Doors
    dw $D8C2 : dw $72F2 ; Events, Items, Doors
    dw $D91A : dw $013E ; Events, Items, Doors
    dw #$FFFF


preset_SZM101_cleanup_2_kraid_mouth_missile:
    dw #preset_SZM101_cleanup_2_sporespawn_exit ; Cleanup 2: SporeSpawn Exit
    dw $078D : dw $8FA6 ; DDB
    dw $078F : dw $0002 ; DoorOut Index
    dw $079B : dw $88D7 ; MDB
    dw $07F3 : dw $0012 ; Music Bank
    dw $07F5 : dw $0003 ; Music Track
    dw $090F : dw $3000 ; Screen subpixel X position.
    dw $0913 : dw $5000 ; Screen subpixel Y position
    dw $0915 : dw $0000 ; Screen Y position in pixels
    dw $0919 : dw $0000 ; Layer 2 Y scroll in room in pixels? (up = positive)
    dw $0923 : dw $0000 ; BG2 Y scroll offset due to room transitions (Translates between Layer 2 scroll and BG2 scroll)
    dw $09C2 : dw $0426 ; Health
    dw $09C6 : dw $006F ; Missiles
    dw $09C8 : dw $00AF ; Max missiles
    dw $0AF6 : dw $0084 ; Samus X
    dw $0AFA : dw $008B ; Samus Y
    dw $D870 : dw $9FDF ; Events, Items, Doors
    dw $D91A : dw $0142 ; Events, Items, Doors
    dw #$FFFF


preset_SZM101_cleanup_2_etank_chain_spark:
    dw #preset_SZM101_cleanup_2_kraid_mouth_missile ; Cleanup 2: Kraid Mouth Missile
    dw $078D : dw $9702 ; DDB
    dw $078F : dw $0003 ; DoorOut Index
    dw $079B : dw $A2F7 ; MDB
    dw $07C3 : dw $E6B0 ; GFX Pointers
    dw $07C5 : dw $64BB ; GFX Pointers
    dw $07C7 : dw $C2B2 ; GFX Pointers
    dw $07F3 : dw $000F ; Music Bank
    dw $07F5 : dw $0005 ; Music Track
    dw $090F : dw $8000 ; Screen subpixel X position.
    dw $0913 : dw $0000 ; Screen subpixel Y position
    dw $0915 : dw $001D ; Screen Y position in pixels
    dw $0919 : dw $0015 ; Layer 2 Y scroll in room in pixels? (up = positive)
    dw $0923 : dw $FE00 ; BG2 Y scroll offset due to room transitions (Translates between Layer 2 scroll and BG2 scroll)
    dw $09C2 : dw $040E ; Health
    dw $09C6 : dw $0074 ; Missiles
    dw $09C8 : dw $00B4 ; Max missiles
    dw $0AF6 : dw $00C6 ; Samus X
    dw $D870 : dw $DFDF ; Events, Items, Doors
    dw $D91A : dw $0143 ; Events, Items, Doors
    dw #$FFFF


preset_SZM101_cleanup_2_slick_space_boost:
    dw #preset_SZM101_cleanup_2_etank_chain_spark ; Cleanup 2: Etank Chain Spark
    dw $078D : dw $C1B4 ; DDB
    dw $078F : dw $0006 ; DoorOut Index
    dw $079B : dw $A3AE ; MDB
    dw $090F : dw $E000 ; Screen subpixel X position.
    dw $0911 : dw $0100 ; Screen X position in pixels
    dw $0915 : dw $0600 ; Screen Y position in pixels
    dw $0917 : dw $0100 ; Layer 2 X scroll in room in pixels?
    dw $0919 : dw $0600 ; Layer 2 Y scroll in room in pixels? (up = positive)
    dw $0921 : dw $0100 ; BG2 X scroll offset due to room transitions (Translates between Layer 2 scroll and BG2 scroll)
    dw $0923 : dw $FA00 ; BG2 Y scroll offset due to room transitions (Translates between Layer 2 scroll and BG2 scroll)
    dw $09C2 : dw $047D ; Health
    dw $09C4 : dw $047D ; Max health
    dw $09C6 : dw $0075 ; Missiles
    dw $0A1C : dw $0001 ; Samus position/state
    dw $0A1E : dw $0008 ; More position/state
    dw $0A68 : dw $00D5 ; Flash suit
    dw $0AF6 : dw $016F ; Samus X
    dw $0AFA : dw $069B ; Samus Y
    dw $D87C : dw $EFFE ; Events, Items, Doors
    dw $D91A : dw $0148 ; Events, Items, Doors
    dw #$FFFF


preset_SZM101_cleanup_2_rock_pipes:
    dw #preset_SZM101_cleanup_2_slick_space_boost ; Cleanup 2: Slick Space Boost
    dw $078D : dw $9246 ; DDB
    dw $078F : dw $0005 ; DoorOut Index
    dw $079B : dw $A7DE ; MDB
    dw $079F : dw $0002 ; Region
    dw $07C3 : dw $C3F9 ; GFX Pointers
    dw $07C5 : dw $BBBD ; GFX Pointers
    dw $07C7 : dw $C2B6 ; GFX Pointers
    dw $07F3 : dw $0015 ; Music Bank
    dw $090F : dw $BFFF ; Screen subpixel X position.
    dw $0911 : dw $0000 ; Screen X position in pixels
    dw $0915 : dw $0321 ; Screen Y position in pixels
    dw $0917 : dw $0000 ; Layer 2 X scroll in room in pixels?
    dw $0919 : dw $0321 ; Layer 2 Y scroll in room in pixels? (up = positive)
    dw $0921 : dw $0000 ; BG2 X scroll offset due to room transitions (Translates between Layer 2 scroll and BG2 scroll)
    dw $0923 : dw $00E0 ; BG2 Y scroll offset due to room transitions (Translates between Layer 2 scroll and BG2 scroll)
    dw $09A6 : dw $1009 ; Beams
    dw $09C6 : dw $007A ; Missiles
    dw $09C8 : dw $00B9 ; Max missiles
    dw $0A1C : dw $0001 ; Samus position/state
    dw $0A1E : dw $0008 ; More position/state
    dw $0A68 : dw $0000 ; Flash suit
    dw $0AF6 : dw $00C2 ; Samus X
    dw $0AFA : dw $038B ; Samus Y
    dw $D870 : dw $FFDF ; Events, Items, Doors
    dw $D8BA : dw $0001 ; Events, Items, Doors
    dw $D91A : dw $014C ; Events, Items, Doors
    dw #$FFFF


preset_SZM101_cleanup_2_maze_skip:
    dw #preset_SZM101_cleanup_2_rock_pipes ; Cleanup 2: Rock Pipes
    dw $078D : dw $9672 ; DDB
    dw $078F : dw $0001 ; DoorOut Index
    dw $079B : dw $ACB3 ; MDB
    dw $090F : dw $F680 ; Screen subpixel X position.
    dw $0911 : dw $0100 ; Screen X position in pixels
    dw $0915 : dw $0103 ; Screen Y position in pixels
    dw $0917 : dw $00C0 ; Layer 2 X scroll in room in pixels?
    dw $0919 : dw $00C2 ; Layer 2 Y scroll in room in pixels? (up = positive)
    dw $0921 : dw $0100 ; BG2 X scroll offset due to room transitions (Translates between Layer 2 scroll and BG2 scroll)
    dw $0923 : dw $FF00 ; BG2 Y scroll offset due to room transitions (Translates between Layer 2 scroll and BG2 scroll)
    dw $09C2 : dw $04AB ; Health
    dw $09C4 : dw $04AF ; Max health
    dw $09D0 : dw $0024 ; Max pbs
    dw $0AF6 : dw $01D7 ; Samus X
    dw $0AFA : dw $018B ; Samus Y
    dw $D846 : dw $0100 ; Events, Items, Doors
    dw $D87A : dw $42FF ; Events, Items, Doors
    dw $D87C : dw $FFFE ; Events, Items, Doors
    dw $D91A : dw $014F ; Events, Items, Doors
    dw #$FFFF


preset_SZM101_cleanup_2_crocs_hideaway:
    dw #preset_SZM101_cleanup_2_maze_skip ; Cleanup 2: Maze Skip
    dw $078D : dw $9576 ; DDB
    dw $078F : dw $0003 ; DoorOut Index
    dw $079B : dw $AE07 ; MDB
    dw $090F : dw $5400 ; Screen subpixel X position.
    dw $0911 : dw $0300 ; Screen X position in pixels
    dw $0913 : dw $2800 ; Screen subpixel Y position
    dw $0915 : dw $0000 ; Screen Y position in pixels
    dw $0917 : dw $0240 ; Layer 2 X scroll in room in pixels?
    dw $0919 : dw $0000 ; Layer 2 Y scroll in room in pixels? (up = positive)
    dw $0923 : dw $0000 ; BG2 Y scroll offset due to room transitions (Translates between Layer 2 scroll and BG2 scroll)
    dw $09C2 : dw $0497 ; Health
    dw $09CA : dw $0026 ; Supers
    dw $09CC : dw $0026 ; Max supers
    dw $09CE : dw $0021 ; Pbs
    dw $0AF6 : dw $03CB ; Samus X
    dw $0AFA : dw $008B ; Samus Y
    dw $D878 : dw $DFFF ; Events, Items, Doors
    dw $D91A : dw $0150 ; Events, Items, Doors
    dw #$FFFF


preset_SZM101_cleanup_2_crocomire:
    dw #preset_SZM101_cleanup_2_crocs_hideaway ; Cleanup 2: Croc's Hideaway
    dw $078D : dw $BECC ; DDB
    dw $078F : dw $0001 ; DoorOut Index
    dw $079B : dw $A8F8 ; MDB
    dw $090F : dw $E000 ; Screen subpixel X position.
    dw $0911 : dw $0041 ; Screen X position in pixels
    dw $0913 : dw $1000 ; Screen subpixel Y position
    dw $0915 : dw $001F ; Screen Y position in pixels
    dw $0917 : dw $0030 ; Layer 2 X scroll in room in pixels?
    dw $0919 : dw $0017 ; Layer 2 Y scroll in room in pixels? (up = positive)
    dw $0921 : dw $FA00 ; BG2 X scroll offset due to room transitions (Translates between Layer 2 scroll and BG2 scroll)
    dw $09C2 : dw $047C ; Health
    dw $09C6 : dw $007F ; Missiles
    dw $09C8 : dw $00BE ; Max missiles
    dw $09CE : dw $0020 ; Pbs
    dw $0A1C : dw $0002 ; Samus position/state
    dw $0A1E : dw $0004 ; More position/state
    dw $0AF6 : dw $00AC ; Samus X
    dw $0AFA : dw $00AB ; Samus Y
    dw $D872 : dw $EDFF ; Events, Items, Doors
    dw $D91A : dw $0153 ; Events, Items, Doors
    dw #$FFFF


preset_SZM101_cleanup_2_broken_grapple_blocks:
    dw #preset_SZM101_cleanup_2_crocomire ; Cleanup 2: Crocomire
    dw $078D : dw $8DA2 ; DDB
    dw $078F : dw $0000 ; DoorOut Index
    dw $079B : dw $A7DE ; MDB
    dw $090F : dw $AC80 ; Screen subpixel X position.
    dw $0911 : dw $0000 ; Screen X position in pixels
    dw $0913 : dw $0000 ; Screen subpixel Y position
    dw $0915 : dw $031B ; Screen Y position in pixels
    dw $0917 : dw $0000 ; Layer 2 X scroll in room in pixels?
    dw $0919 : dw $031B ; Layer 2 Y scroll in room in pixels? (up = positive)
    dw $0921 : dw $FF00 ; BG2 X scroll offset due to room transitions (Translates between Layer 2 scroll and BG2 scroll)
    dw $0923 : dw $FA00 ; BG2 Y scroll offset due to room transitions (Translates between Layer 2 scroll and BG2 scroll)
    dw $09C2 : dw $0488 ; Health
    dw $09C6 : dw $0081 ; Missiles
    dw $09CA : dw $0028 ; Supers
    dw $09CC : dw $0028 ; Max supers
    dw $0AF6 : dw $004F ; Samus X
    dw $0AFA : dw $038B ; Samus Y
    dw $D82A : dw $0102 ; Events, Items, Doors
    dw $D876 : dw $FBAD ; Events, Items, Doors
    dw $D8C6 : dw $77F5 ; Events, Items, Doors
    dw $D91A : dw $0155 ; Events, Items, Doors
    dw #$FFFF


preset_SZM101_cleanup_2_lava_dive_pbs:
    dw #preset_SZM101_cleanup_2_broken_grapple_blocks ; Cleanup 2: Broken Grapple Blocks
    dw $078D : dw $94B6 ; DDB
    dw $079B : dw $AA82 ; MDB
    dw $090F : dw $F400 ; Screen subpixel X position.
    dw $0913 : dw $2400 ; Screen subpixel Y position
    dw $0915 : dw $0400 ; Screen Y position in pixels
    dw $0919 : dw $0400 ; Layer 2 Y scroll in room in pixels? (up = positive)
    dw $0923 : dw $FD00 ; BG2 Y scroll offset due to room transitions (Translates between Layer 2 scroll and BG2 scroll)
    dw $09C2 : dw $0474 ; Health
    dw $09C6 : dw $0087 ; Missiles
    dw $09C8 : dw $00C3 ; Max missiles
    dw $0A1C : dw $0001 ; Samus position/state
    dw $0A1E : dw $0008 ; More position/state
    dw $0AF6 : dw $00CB ; Samus X
    dw $0AFA : dw $048B ; Samus Y
    dw $D872 : dw $FDFF ; Events, Items, Doors
    dw $D8C6 : dw $77FD ; Events, Items, Doors
    dw $D91A : dw $0156 ; Events, Items, Doors
    dw #$FFFF


preset_SZM101_cleanup_2_super_gate_shot:
    dw #preset_SZM101_cleanup_2_lava_dive_pbs ; Cleanup 2: Lava Dive PBs
    dw $078D : dw $944A ; DDB
    dw $078F : dw $0003 ; DoorOut Index
    dw $079B : dw $95D4 ; MDB
    dw $079F : dw $0000 ; Region
    dw $07C3 : dw $C629 ; GFX Pointers
    dw $07C5 : dw $5DBA ; GFX Pointers
    dw $07C7 : dw $C2AE ; GFX Pointers
    dw $07F3 : dw $0009 ; Music Bank
    dw $07F5 : dw $0006 ; Music Track
    dw $090F : dw $0000 ; Screen subpixel X position.
    dw $0913 : dw $C000 ; Screen subpixel Y position
    dw $0915 : dw $0000 ; Screen Y position in pixels
    dw $0919 : dw $0000 ; Layer 2 Y scroll in room in pixels? (up = positive)
    dw $0921 : dw $0000 ; BG2 X scroll offset due to room transitions (Translates between Layer 2 scroll and BG2 scroll)
    dw $0923 : dw $FF00 ; BG2 Y scroll offset due to room transitions (Translates between Layer 2 scroll and BG2 scroll)
    dw $09C6 : dw $008C ; Missiles
    dw $09C8 : dw $00C8 ; Max missiles
    dw $09CA : dw $0027 ; Supers
    dw $09CE : dw $0021 ; Pbs
    dw $09D0 : dw $0026 ; Max pbs
    dw $0AF6 : dw $0082 ; Samus X
    dw $0AFA : dw $008B ; Samus Y
    dw $D872 : dw $FFFF ; Events, Items, Doors
    dw $D878 : dw $FFFF ; Events, Items, Doors
    dw $D91A : dw $0158 ; Events, Items, Doors
    dw #$FFFF


preset_SZM101_cleanup_2_breakable_chozo:
    dw #preset_SZM101_cleanup_2_super_gate_shot ; Cleanup 2: Super Gate Shot
    dw $078D : dw $BF68 ; DDB
    dw $078F : dw $0004 ; DoorOut Index
    dw $079B : dw $C310 ; MDB
    dw $07C5 : dw $7CBA ; GFX Pointers
    dw $07C7 : dw $C2AD ; GFX Pointers
    dw $07F3 : dw $0006 ; Music Bank
    dw $07F5 : dw $0007 ; Music Track
    dw $090F : dw $C000 ; Screen subpixel X position.
    dw $0911 : dw $0100 ; Screen X position in pixels
    dw $0913 : dw $0000 ; Screen subpixel Y position
    dw $0915 : dw $02FA ; Screen Y position in pixels
    dw $0917 : dw $0100 ; Layer 2 X scroll in room in pixels?
    dw $0919 : dw $02FA ; Layer 2 Y scroll in room in pixels? (up = positive)
    dw $0921 : dw $0100 ; BG2 X scroll offset due to room transitions (Translates between Layer 2 scroll and BG2 scroll)
    dw $0923 : dw $0000 ; BG2 Y scroll offset due to room transitions (Translates between Layer 2 scroll and BG2 scroll)
    dw $09C2 : dw $0471 ; Health
    dw $09C6 : dw $0091 ; Missiles
    dw $09C8 : dw $00CD ; Max missiles
    dw $09CA : dw $0028 ; Supers
    dw $09CC : dw $002A ; Max supers
    dw $09CE : dw $0022 ; Pbs
    dw $0AF6 : dw $0197 ; Samus X
    dw $0AFA : dw $038B ; Samus Y
    dw $D870 : dw $FFFF ; Events, Items, Doors
    dw $D874 : dw $C1FF ; Events, Items, Doors
    dw $D91A : dw $015D ; Events, Items, Doors
    dw #$FFFF


preset_SZM101_pirate_ship_ridley_shortest_charge:
    dw #preset_SZM101_cleanup_2_breakable_chozo ; Cleanup 2: Breakable Chozo
    dw $078D : dw $AEDC ; DDB
    dw $078F : dw $0005 ; DoorOut Index
    dw $079B : dw $B40A ; MDB
    dw $079F : dw $0003 ; Region
    dw $07C3 : dw $B130 ; GFX Pointers
    dw $07C5 : dw $3CBE ; GFX Pointers
    dw $07C7 : dw $C2B8 ; GFX Pointers
    dw $090F : dw $0000 ; Screen subpixel X position.
    dw $0911 : dw $00B0 ; Screen X position in pixels
    dw $0913 : dw $6800 ; Screen subpixel Y position
    dw $0915 : dw $016C ; Screen Y position in pixels
    dw $0917 : dw $00B0 ; Layer 2 X scroll in room in pixels?
    dw $0919 : dw $016C ; Layer 2 Y scroll in room in pixels? (up = positive)
    dw $0921 : dw $FF00 ; BG2 X scroll offset due to room transitions (Translates between Layer 2 scroll and BG2 scroll)
    dw $0923 : dw $FB00 ; BG2 Y scroll offset due to room transitions (Translates between Layer 2 scroll and BG2 scroll)
    dw $09C2 : dw $045D ; Health
    dw $09CA : dw $0026 ; Supers
    dw $09CE : dw $0021 ; Pbs
    dw $0A1C : dw $0002 ; Samus position/state
    dw $0A1E : dw $0004 ; More position/state
    dw $0AF6 : dw $0150 ; Samus X
    dw $0AFA : dw $01FB ; Samus Y
    dw $D91A : dw $0161 ; Events, Items, Doors
    dw #$FFFF


preset_SZM101_pirate_ship_ridley_inside_outside_spark:
    dw #preset_SZM101_pirate_ship_ridley_shortest_charge ; Pirate Ship Ridley: Shortest Charge
    dw $078D : dw $A51C ; DDB
    dw $078F : dw $0003 ; DoorOut Index
    dw $079B : dw $C2B0 ; MDB
    dw $07F3 : dw $000C ; Music Bank
    dw $07F5 : dw $0005 ; Music Track
    dw $090F : dw $A000 ; Screen subpixel X position.
    dw $0911 : dw $05A7 ; Screen X position in pixels
    dw $0915 : dw $01CD ; Screen Y position in pixels
    dw $0917 : dw $05A7 ; Layer 2 X scroll in room in pixels?
    dw $0919 : dw $01CD ; Layer 2 Y scroll in room in pixels? (up = positive)
    dw $0921 : dw $FD00 ; BG2 X scroll offset due to room transitions (Translates between Layer 2 scroll and BG2 scroll)
    dw $0923 : dw $FC00 ; BG2 Y scroll offset due to room transitions (Translates between Layer 2 scroll and BG2 scroll)
    dw $09C6 : dw $0096 ; Missiles
    dw $09C8 : dw $00D2 ; Max missiles
    dw $0A1C : dw $0002 ; Samus position/state
    dw $0A1E : dw $0004 ; More position/state
    dw $0AF6 : dw $0609 ; Samus X
    dw $0AFA : dw $023B ; Samus Y
    dw $D822 : dw $0021 ; Events, Items, Doors
    dw $D874 : dw $C5FF ; Events, Items, Doors
    dw $D91A : dw $0164 ; Events, Items, Doors
    dw #$FFFF


preset_SZM101_pirate_ship_ridley_plasma_sba:
    dw #preset_SZM101_pirate_ship_ridley_inside_outside_spark ; Pirate Ship Ridley: Inside Outside Spark
    dw $090F : dw $F380 ; Screen subpixel X position.
    dw $0911 : dw $0000 ; Screen X position in pixels
    dw $0915 : dw $02BB ; Screen Y position in pixels
    dw $0917 : dw $0000 ; Layer 2 X scroll in room in pixels?
    dw $0919 : dw $02BB ; Layer 2 Y scroll in room in pixels? (up = positive)
    dw $09C2 : dw $04E1 ; Health
    dw $09C4 : dw $04E1 ; Max health
    dw $09CA : dw $0027 ; Supers
    dw $09CC : dw $002C ; Max supers
    dw $0A1C : dw $0002 ; Samus position/state
    dw $0A1E : dw $0004 ; More position/state
    dw $0AF6 : dw $0030 ; Samus X
    dw $0AFA : dw $032B ; Samus Y
    dw $D876 : dw $FBBD ; Events, Items, Doors
    dw $D87E : dw $7C9F ; Events, Items, Doors
    dw $D91A : dw $0165 ; Events, Items, Doors
    dw #$FFFF


preset_SZM101_pirate_ship_ridley_super_speed_space_jump:
    dw #preset_SZM101_pirate_ship_ridley_plasma_sba ; Pirate Ship Ridley: Plasma SBA
    dw $078D : dw $BAF8 ; DDB
    dw $078F : dw $0004 ; DoorOut Index
    dw $079B : dw $93FE ; MDB
    dw $090F : dw $0000 ; Screen subpixel X position.
    dw $0911 : dw $0729 ; Screen X position in pixels
    dw $0913 : dw $0000 ; Screen subpixel Y position
    dw $0915 : dw $0001 ; Screen Y position in pixels
    dw $0917 : dw $0729 ; Layer 2 X scroll in room in pixels?
    dw $0919 : dw $0001 ; Layer 2 Y scroll in room in pixels? (up = positive)
    dw $0921 : dw $0000 ; BG2 X scroll offset due to room transitions (Translates between Layer 2 scroll and BG2 scroll)
    dw $09CE : dw $0022 ; Pbs
    dw $09D0 : dw $0028 ; Max pbs
    dw $0AF6 : dw $07C9 ; Samus X
    dw $0AFA : dw $008B ; Samus Y
    dw $D87A : dw $62FF ; Events, Items, Doors
    dw $D8CA : dw $0F10 ; Events, Items, Doors
    dw $D91A : dw $0164 ; Events, Items, Doors
    dw #$FFFF


preset_SZM101_pirate_ship_ridley_kihunter_zoo:
    dw #preset_SZM101_pirate_ship_ridley_super_speed_space_jump ; Pirate Ship Ridley: Super Speed Space Jump
    dw $078D : dw $A3CC ; DDB
    dw $079B : dw $C0E4 ; MDB
    dw $0911 : dw $01F0 ; Screen X position in pixels
    dw $0913 : dw $0C00 ; Screen subpixel Y position
    dw $0915 : dw $0300 ; Screen Y position in pixels
    dw $0917 : dw $01F0 ; Layer 2 X scroll in room in pixels?
    dw $0919 : dw $0300 ; Layer 2 Y scroll in room in pixels? (up = positive)
    dw $0921 : dw $0100 ; BG2 X scroll offset due to room transitions (Translates between Layer 2 scroll and BG2 scroll)
    dw $0923 : dw $FF00 ; BG2 Y scroll offset due to room transitions (Translates between Layer 2 scroll and BG2 scroll)
    dw $09C2 : dw $04D8 ; Health
    dw $09C6 : dw $0098 ; Missiles
    dw $09CA : dw $0021 ; Supers
    dw $09CE : dw $0023 ; Pbs
    dw $09D0 : dw $002A ; Max pbs
    dw $0A1C : dw $0001 ; Samus position/state
    dw $0A1E : dw $0008 ; More position/state
    dw $0AF6 : dw $0250 ; Samus X
    dw $0AFA : dw $03AB ; Samus Y
    dw $0B3F : dw $0004 ; Blue suit
    dw $D87A : dw $E2FF ; Events, Items, Doors
    dw $D91A : dw $0165 ; Events, Items, Doors
    dw #$FFFF


preset_SZM101_pirate_ship_ridley_under_the_ship:
    dw #preset_SZM101_pirate_ship_ridley_kihunter_zoo ; Pirate Ship Ridley: Kihunter Zoo
    dw $078D : dw $A564 ; DDB
    dw $078F : dw $0000 ; DoorOut Index
    dw $0911 : dw $016E ; Screen X position in pixels
    dw $0913 : dw $9BFF ; Screen subpixel Y position
    dw $0915 : dw $0222 ; Screen Y position in pixels
    dw $0917 : dw $016E ; Layer 2 X scroll in room in pixels?
    dw $0919 : dw $0222 ; Layer 2 Y scroll in room in pixels? (up = positive)
    dw $0921 : dw $FD00 ; BG2 X scroll offset due to room transitions (Translates between Layer 2 scroll and BG2 scroll)
    dw $0923 : dw $FD00 ; BG2 Y scroll offset due to room transitions (Translates between Layer 2 scroll and BG2 scroll)
    dw $09CA : dw $0023 ; Supers
    dw $09CC : dw $002E ; Max supers
    dw $09CE : dw $0020 ; Pbs
    dw $09D4 : dw $0190 ; Max reserves
    dw $0A1C : dw $0002 ; Samus position/state
    dw $0A1E : dw $0004 ; More position/state
    dw $0AF6 : dw $020E ; Samus X
    dw $0AFA : dw $02AB ; Samus Y
    dw $0B3F : dw $0000 ; Blue suit
    dw $D876 : dw $FFBD ; Events, Items, Doors
    dw $D87E : dw $FC9F ; Events, Items, Doors
    dw $D8CA : dw $0F50 ; Events, Items, Doors
    dw $D91A : dw $0168 ; Events, Items, Doors
    dw #$FFFF


preset_SZM101_pirate_ship_ridley_tease_pbs:
    dw #preset_SZM101_pirate_ship_ridley_under_the_ship ; Pirate Ship Ridley: Under The Ship
    dw $078D : dw $BAA4 ; DDB
    dw $078F : dw $0002 ; DoorOut Index
    dw $079B : dw $D16D ; MDB
    dw $079F : dw $0004 ; Region
    dw $07C3 : dw $F911 ; GFX Pointers
    dw $07C5 : dw $15BA ; GFX Pointers
    dw $07C7 : dw $C2B0 ; GFX Pointers
    dw $090F : dw $8F80 ; Screen subpixel X position.
    dw $0911 : dw $0600 ; Screen X position in pixels
    dw $0913 : dw $2800 ; Screen subpixel Y position
    dw $0915 : dw $0100 ; Screen Y position in pixels
    dw $0917 : dw $0480 ; Layer 2 X scroll in room in pixels?
    dw $0919 : dw $0100 ; Layer 2 Y scroll in room in pixels? (up = positive)
    dw $0921 : dw $0100 ; BG2 X scroll offset due to room transitions (Translates between Layer 2 scroll and BG2 scroll)
    dw $0923 : dw $0000 ; BG2 Y scroll offset due to room transitions (Translates between Layer 2 scroll and BG2 scroll)
    dw $09C2 : dw $04C9 ; Health
    dw $0A1C : dw $0001 ; Samus position/state
    dw $0A1E : dw $0008 ; More position/state
    dw $0AF6 : dw $06CB ; Samus X
    dw $0AFA : dw $018B ; Samus Y
    dw $D91A : dw $0169 ; Events, Items, Doors
    dw #$FFFF


preset_SZM101_pirate_ship_ridley_flappy_birds:
    dw #preset_SZM101_pirate_ship_ridley_tease_pbs ; Pirate Ship Ridley: Tease PBs
    dw $078D : dw $A21C ; DDB
    dw $078F : dw $0003 ; DoorOut Index
    dw $079B : dw $8B64 ; MDB
    dw $090F : dw $F000 ; Screen subpixel X position.
    dw $0911 : dw $0000 ; Screen X position in pixels
    dw $0915 : dw $0322 ; Screen Y position in pixels
    dw $0917 : dw $0000 ; Layer 2 X scroll in room in pixels?
    dw $0919 : dw $0259 ; Layer 2 Y scroll in room in pixels? (up = positive)
    dw $0921 : dw $0000 ; BG2 X scroll offset due to room transitions (Translates between Layer 2 scroll and BG2 scroll)
    dw $09C2 : dw $04E1 ; Health
    dw $09D6 : dw $00CE ; Reserves
    dw $0A1C : dw $0002 ; Samus position/state
    dw $0A1E : dw $0004 ; More position/state
    dw $0A68 : dw $0021 ; Flash suit
    dw $0AF6 : dw $005F ; Samus X
    dw $0AFA : dw $038B ; Samus Y
    dw $D890 : dw $0101 ; Events, Items, Doors
    dw $D91A : dw $016E ; Events, Items, Doors
    dw #$FFFF


preset_SZM101_pirate_ship_ridley_flappy_exit:
    dw #preset_SZM101_pirate_ship_ridley_flappy_birds ; Pirate Ship Ridley: Flappy Birds
    dw $078D : dw $B870 ; DDB
    dw $078F : dw $0002 ; DoorOut Index
    dw $079B : dw $D055 ; MDB
    dw $090F : dw $0000 ; Screen subpixel X position.
    dw $0911 : dw $0E00 ; Screen X position in pixels
    dw $0913 : dw $7C00 ; Screen subpixel Y position
    dw $0915 : dw $001B ; Screen Y position in pixels
    dw $0917 : dw $0E00 ; Layer 2 X scroll in room in pixels?
    dw $0919 : dw $001B ; Layer 2 Y scroll in room in pixels? (up = positive)
    dw $0921 : dw $F100 ; BG2 X scroll offset due to room transitions (Translates between Layer 2 scroll and BG2 scroll)
    dw $09C6 : dw $009D ; Missiles
    dw $09C8 : dw $00D7 ; Max missiles
    dw $0A1C : dw $0001 ; Samus position/state
    dw $0A1E : dw $0008 ; More position/state
    dw $0A68 : dw $0083 ; Flash suit
    dw $0AF6 : dw $0EC1 ; Samus X
    dw $0AFA : dw $008B ; Samus Y
    dw $D874 : dw $E5FF ; Events, Items, Doors
    dw #$FFFF


preset_SZM101_pirate_ship_ridley_tube_break:
    dw #preset_SZM101_pirate_ship_ridley_flappy_exit ; Pirate Ship Ridley: Flappy Exit
    dw $078D : dw $A414 ; DDB
    dw $078F : dw $0000 ; DoorOut Index
    dw $079B : dw $CE8A ; MDB
    dw $07C5 : dw $43BA ; GFX Pointers
    dw $07C7 : dw $C2AF ; GFX Pointers
    dw $090F : dw $0000 ; Screen subpixel X position.
    dw $0911 : dw $000B ; Screen X position in pixels
    dw $0915 : dw $0300 ; Screen Y position in pixels
    dw $0917 : dw $000B ; Layer 2 X scroll in room in pixels?
    dw $0919 : dw $0300 ; Layer 2 Y scroll in room in pixels? (up = positive)
    dw $0921 : dw $FC00 ; BG2 X scroll offset due to room transitions (Translates between Layer 2 scroll and BG2 scroll)
    dw $0923 : dw $FE00 ; BG2 Y scroll offset due to room transitions (Translates between Layer 2 scroll and BG2 scroll)
    dw $09C2 : dw $0545 ; Health
    dw $09C4 : dw $0545 ; Max health
    dw $09C6 : dw $00A2 ; Missiles
    dw $09C8 : dw $00DC ; Max missiles
    dw $09CA : dw $0022 ; Supers
    dw $09CE : dw $001E ; Pbs
    dw $09D6 : dw $00D8 ; Reserves
    dw $0A1C : dw $0002 ; Samus position/state
    dw $0A1E : dw $0004 ; More position/state
    dw $0A68 : dw $0000 ; Flash suit
    dw $0AF6 : dw $007F ; Samus X
    dw $0AFA : dw $038B ; Samus Y
    dw $D874 : dw $EDFF ; Events, Items, Doors
    dw $D87E : dw $FF9F ; Events, Items, Doors
    dw $D91A : dw $0174 ; Events, Items, Doors
    dw #$FFFF


preset_SZM101_pirate_ship_ridley_kihopper_ramp_down:
    dw #preset_SZM101_pirate_ship_ridley_tube_break ; Pirate Ship Ridley: Tube Break
    dw $078D : dw $A78C ; DDB
    dw $078F : dw $0001 ; DoorOut Index
    dw $079B : dw $8852 ; MDB
    dw $079F : dw $0003 ; Region
    dw $07C3 : dw $E78D ; GFX Pointers
    dw $07C5 : dw $2EBE ; GFX Pointers
    dw $07C7 : dw $C2B9 ; GFX Pointers
    dw $090F : dw $F000 ; Screen subpixel X position.
    dw $0911 : dw $0300 ; Screen X position in pixels
    dw $0913 : dw $0800 ; Screen subpixel Y position
    dw $0915 : dw $0200 ; Screen Y position in pixels
    dw $0917 : dw $0300 ; Layer 2 X scroll in room in pixels?
    dw $0919 : dw $0200 ; Layer 2 Y scroll in room in pixels? (up = positive)
    dw $09CA : dw $0024 ; Supers
    dw $09CC : dw $0030 ; Max supers
    dw $09CE : dw $001D ; Pbs
    dw $0A1C : dw $0001 ; Samus position/state
    dw $0A1E : dw $0008 ; More position/state
    dw $0AF6 : dw $0383 ; Samus X
    dw $0AFA : dw $02AB ; Samus Y
    dw $D820 : dw $0925 ; Events, Items, Doors
    dw $D876 : dw $FFBF ; Events, Items, Doors
    dw $D91A : dw $0176 ; Events, Items, Doors
    dw #$FFFF


preset_SZM101_pirate_ship_ridley_worker_robot_roadblock:
    dw #preset_SZM101_pirate_ship_ridley_kihopper_ramp_down ; Pirate Ship Ridley: Kihopper Ramp Down
    dw $078D : dw $8E9E ; DDB
    dw $078F : dw $0000 ; DoorOut Index
    dw $079B : dw $8F90 ; MDB
    dw $07C3 : dw $B130 ; GFX Pointers
    dw $07C5 : dw $3CBE ; GFX Pointers
    dw $07C7 : dw $C2B8 ; GFX Pointers
    dw $090F : dw $4000 ; Screen subpixel X position.
    dw $0911 : dw $0100 ; Screen X position in pixels
    dw $0913 : dw $0000 ; Screen subpixel Y position
    dw $0915 : dw $04E3 ; Screen Y position in pixels
    dw $0917 : dw $0100 ; Layer 2 X scroll in room in pixels?
    dw $0919 : dw $04E3 ; Layer 2 Y scroll in room in pixels? (up = positive)
    dw $0921 : dw $FE00 ; BG2 X scroll offset due to room transitions (Translates between Layer 2 scroll and BG2 scroll)
    dw $09CA : dw $0023 ; Supers
    dw $09D0 : dw $002C ; Max pbs
    dw $0AF6 : dw $01DB ; Samus X
    dw $0AFA : dw $054B ; Samus Y
    dw $D87A : dw $F2FF ; Events, Items, Doors
    dw $D91A : dw $0177 ; Events, Items, Doors
    dw #$FFFF


preset_SZM101_pirate_ship_ridley_under_the_ship_2:
    dw #preset_SZM101_pirate_ship_ridley_worker_robot_roadblock ; Pirate Ship Ridley: Worker Robot Roadblock
    dw $078D : dw $A6C0 ; DDB
    dw $090F : dw $B000 ; Screen subpixel X position.
    dw $0911 : dw $00DD ; Screen X position in pixels
    dw $0915 : dw $022D ; Screen Y position in pixels
    dw $0917 : dw $00DD ; Layer 2 X scroll in room in pixels?
    dw $0919 : dw $022D ; Layer 2 Y scroll in room in pixels? (up = positive)
    dw $0923 : dw $FB00 ; BG2 Y scroll offset due to room transitions (Translates between Layer 2 scroll and BG2 scroll)
    dw $09C6 : dw $00A4 ; Missiles
    dw $09CE : dw $001F ; Pbs
    dw $09D0 : dw $002E ; Max pbs
    dw $09D6 : dw $0114 ; Reserves
    dw $0AF6 : dw $013D ; Samus X
    dw $0AFA : dw $029B ; Samus Y
    dw $D822 : dw $0020 ; Events, Items, Doors
    dw $D87A : dw $F6FF ; Events, Items, Doors
    dw $D91A : dw $017B ; Events, Items, Doors
    dw #$FFFF


preset_SZM101_pirate_ship_ridley_the_lazer_part:
    dw #preset_SZM101_pirate_ship_ridley_under_the_ship_2 ; Pirate Ship Ridley: Under the Ship 2
    dw $078D : dw $BBF4 ; DDB
    dw $078F : dw $0004 ; DoorOut Index
    dw $079B : dw $85A0 ; MDB
    dw $07C3 : dw $E78D ; GFX Pointers
    dw $07C5 : dw $2EBE ; GFX Pointers
    dw $07C7 : dw $C2B9 ; GFX Pointers
    dw $090F : dw $E000 ; Screen subpixel X position.
    dw $0911 : dw $0258 ; Screen X position in pixels
    dw $0913 : dw $FFFF ; Screen subpixel Y position
    dw $0915 : dw $021F ; Screen Y position in pixels
    dw $0917 : dw $0258 ; Layer 2 X scroll in room in pixels?
    dw $0919 : dw $021F ; Layer 2 Y scroll in room in pixels? (up = positive)
    dw $0923 : dw $FD00 ; BG2 Y scroll offset due to room transitions (Translates between Layer 2 scroll and BG2 scroll)
    dw $09CA : dw $0027 ; Supers
    dw $09CC : dw $0032 ; Max supers
    dw $09CE : dw $001E ; Pbs
    dw $09D6 : dw $011E ; Reserves
    dw $0AF6 : dw $02F7 ; Samus X
    dw $0AFA : dw $02CB ; Samus Y
    dw $D876 : dw $FFFF ; Events, Items, Doors
    dw $D91A : dw $017E ; Events, Items, Doors
    dw #$FFFF


preset_SZM101_pirate_ship_ridley_lazer_save_room:
    dw #preset_SZM101_pirate_ship_ridley_the_lazer_part ; Pirate Ship Ridley: The Lazer Part
    dw $078D : dw $A87C ; DDB
    dw $078F : dw $0000 ; DoorOut Index
    dw $079B : dw $C280 ; MDB
    dw $090F : dw $D000 ; Screen subpixel X position.
    dw $0911 : dw $0000 ; Screen X position in pixels
    dw $0913 : dw $CC00 ; Screen subpixel Y position
    dw $0915 : dw $0100 ; Screen Y position in pixels
    dw $0917 : dw $0000 ; Layer 2 X scroll in room in pixels?
    dw $0919 : dw $0100 ; Layer 2 Y scroll in room in pixels? (up = positive)
    dw $0921 : dw $0100 ; BG2 X scroll offset due to room transitions (Translates between Layer 2 scroll and BG2 scroll)
    dw $0923 : dw $FF00 ; BG2 Y scroll offset due to room transitions (Translates between Layer 2 scroll and BG2 scroll)
    dw $09CA : dw $0025 ; Supers
    dw $0A1C : dw $0002 ; Samus position/state
    dw $0A1E : dw $0004 ; More position/state
    dw $0AF6 : dw $0035 ; Samus X
    dw $0AFA : dw $018B ; Samus Y
    dw #$FFFF


preset_SZM101_pirate_ship_ridley_spaceboost_etank:
    dw #preset_SZM101_pirate_ship_ridley_lazer_save_room ; Pirate Ship Ridley: Lazer Save Room
    dw $078D : dw $B780 ; DDB
    dw $078F : dw $0002 ; DoorOut Index
    dw $079B : dw $D461 ; MDB
    dw $090F : dw $3000 ; Screen subpixel X position.
    dw $0911 : dw $0400 ; Screen X position in pixels
    dw $0913 : dw $9FFF ; Screen subpixel Y position
    dw $0915 : dw $001F ; Screen Y position in pixels
    dw $0917 : dw $0400 ; Layer 2 X scroll in room in pixels?
    dw $0919 : dw $001F ; Layer 2 Y scroll in room in pixels? (up = positive)
    dw $0921 : dw $FC00 ; BG2 X scroll offset due to room transitions (Translates between Layer 2 scroll and BG2 scroll)
    dw $09CA : dw $0024 ; Supers
    dw $0A1C : dw $0001 ; Samus position/state
    dw $0A1E : dw $0008 ; More position/state
    dw $0AF6 : dw $0478 ; Samus X
    dw $0AFA : dw $009B ; Samus Y
    dw $D91A : dw $017F ; Events, Items, Doors
    dw #$FFFF


preset_SZM101_pirate_ship_ridley_two_gate:
    dw #preset_SZM101_pirate_ship_ridley_spaceboost_etank ; Pirate Ship Ridley: SpaceBoost Etank
    dw $078D : dw $A648 ; DDB
    dw $078F : dw $0001 ; DoorOut Index
    dw $079B : dw $9F11 ; MDB
    dw $090F : dw $B000 ; Screen subpixel X position.
    dw $0911 : dw $0048 ; Screen X position in pixels
    dw $0913 : dw $BFFF ; Screen subpixel Y position
    dw $0915 : dw $0000 ; Screen Y position in pixels
    dw $0917 : dw $0048 ; Layer 2 X scroll in room in pixels?
    dw $0919 : dw $0000 ; Layer 2 Y scroll in room in pixels? (up = positive)
    dw $0921 : dw $0000 ; BG2 X scroll offset due to room transitions (Translates between Layer 2 scroll and BG2 scroll)
    dw $0923 : dw $FC00 ; BG2 Y scroll offset due to room transitions (Translates between Layer 2 scroll and BG2 scroll)
    dw $09A6 : dw $100B ; Beams
    dw $09C2 : dw $0577 ; Health
    dw $09C4 : dw $0577 ; Max health
    dw $09CA : dw $0025 ; Supers
    dw $0AF6 : dw $00C7 ; Samus X
    dw $0AFA : dw $008B ; Samus Y
    dw $D87E : dw $FFDF ; Events, Items, Doors
    dw #$FFFF


preset_SZM101_pirate_ship_ridley_ridley:
    dw #preset_SZM101_pirate_ship_ridley_two_gate ; Pirate Ship Ridley: Two Gate
    dw $078D : dw $B72C ; DDB
    dw $078F : dw $0003 ; DoorOut Index
    dw $079B : dw $8091 ; MDB
    dw $079F : dw $0002 ; Region
    dw $07C3 : dw $C3F9 ; GFX Pointers
    dw $07C5 : dw $E4BD ; GFX Pointers
    dw $07C7 : dw $C2B5 ; GFX Pointers
    dw $07F5 : dw $0003 ; Music Track
    dw $090F : dw $7000 ; Screen subpixel X position.
    dw $0911 : dw $0100 ; Screen X position in pixels
    dw $0913 : dw $FC00 ; Screen subpixel Y position
    dw $0917 : dw $0100 ; Layer 2 X scroll in room in pixels?
    dw $0923 : dw $00E0 ; BG2 Y scroll offset due to room transitions (Translates between Layer 2 scroll and BG2 scroll)
    dw $09C2 : dw $05DB ; Health
    dw $09C4 : dw $05DB ; Max health
    dw $09C6 : dw $00A9 ; Missiles
    dw $09C8 : dw $00E1 ; Max missiles
    dw $09CA : dw $0028 ; Supers
    dw $09CE : dw $001D ; Pbs
    dw $0AF6 : dw $01C4 ; Samus X
    dw $D874 : dw $FDFF ; Events, Items, Doors
    dw $D87C : dw $FFFF ; Events, Items, Doors
    dw $D87E : dw $FFFF ; Events, Items, Doors
    dw $D8CE : dw $7D50 ; Events, Items, Doors
    dw $D8F0 : dw $0001 ; Events, Items, Doors
    dw $D91A : dw $0182 ; Events, Items, Doors
    dw #$FFFF


preset_SZM101_pirate_ship_draygon_leaving_ridley:
    dw #preset_SZM101_pirate_ship_ridley_ridley ; Pirate Ship Ridley: Ridley
    dw $078D : dw $983A ; DDB
    dw $078F : dw $0000 ; DoorOut Index
    dw $079B : dw $B32E ; MDB
    dw $07F3 : dw $0024 ; Music Bank
    dw $090F : dw $D001 ; Screen subpixel X position.
    dw $0911 : dw $0000 ; Screen X position in pixels
    dw $0913 : dw $DC00 ; Screen subpixel Y position
    dw $0915 : dw $011F ; Screen Y position in pixels
    dw $0917 : dw $0000 ; Layer 2 X scroll in room in pixels?
    dw $0919 : dw $00D7 ; Layer 2 Y scroll in room in pixels? (up = positive)
    dw $0921 : dw $0100 ; BG2 X scroll offset due to room transitions (Translates between Layer 2 scroll and BG2 scroll)
    dw $0923 : dw $FF00 ; BG2 Y scroll offset due to room transitions (Translates between Layer 2 scroll and BG2 scroll)
    dw $09C6 : dw $00AF ; Missiles
    dw $09CA : dw $001D ; Supers
    dw $09CE : dw $001F ; Pbs
    dw $09D6 : dw $012C ; Reserves
    dw $0A1C : dw $0002 ; Samus position/state
    dw $0A1E : dw $0004 ; More position/state
    dw $0AF6 : dw $003F ; Samus X
    dw $0AFA : dw $019B ; Samus Y
    dw $D82A : dw $0103 ; Events, Items, Doors
    dw $D8CE : dw $7F50 ; Events, Items, Doors
    dw #$FFFF


preset_SZM101_pirate_ship_draygon_gunship_room:
    dw #preset_SZM101_pirate_ship_draygon_leaving_ridley ; Pirate Ship Draygon: Leaving Ridley
    dw $078D : dw $8EC2 ; DDB
    dw $079B : dw $E021 ; MDB
    dw $079F : dw $0003 ; Region
    dw $07C3 : dw $E78D ; GFX Pointers
    dw $07C5 : dw $2EBE ; GFX Pointers
    dw $07C7 : dw $C2B9 ; GFX Pointers
    dw $07F3 : dw $000C ; Music Bank
    dw $07F5 : dw $0005 ; Music Track
    dw $090F : dw $F001 ; Screen subpixel X position.
    dw $0913 : dw $8000 ; Screen subpixel Y position
    dw $0915 : dw $01FA ; Screen Y position in pixels
    dw $0919 : dw $01FA ; Layer 2 Y scroll in room in pixels? (up = positive)
    dw $0921 : dw $FF00 ; BG2 X scroll offset due to room transitions (Translates between Layer 2 scroll and BG2 scroll)
    dw $0923 : dw $FE00 ; BG2 Y scroll offset due to room transitions (Translates between Layer 2 scroll and BG2 scroll)
    dw $0A1C : dw $0001 ; Samus position/state
    dw $0A1E : dw $0008 ; More position/state
    dw $0AF6 : dw $00CF ; Samus X
    dw $0AFA : dw $028B ; Samus Y
    dw $D822 : dw $0021 ; Events, Items, Doors
    dw $D91A : dw $0184 ; Events, Items, Doors
    dw #$FFFF


preset_SZM101_pirate_ship_draygon_underground_path:
    dw #preset_SZM101_pirate_ship_draygon_gunship_room ; Pirate Ship Draygon: Gunship Room
    dw $078D : dw $8EDA ; DDB
    dw $078F : dw $0002 ; DoorOut Index
    dw $079B : dw $9F11 ; MDB
    dw $090F : dw $0000 ; Screen subpixel X position.
    dw $0913 : dw $1800 ; Screen subpixel Y position
    dw $0915 : dw $0300 ; Screen Y position in pixels
    dw $0919 : dw $0300 ; Layer 2 Y scroll in room in pixels? (up = positive)
    dw $0921 : dw $0100 ; BG2 X scroll offset due to room transitions (Translates between Layer 2 scroll and BG2 scroll)
    dw $09C2 : dw $0577 ; Health
    dw $09D0 : dw $0030 ; Max pbs
    dw $0AF6 : dw $0060 ; Samus X
    dw $0AFA : dw $039B ; Samus Y
    dw $D87A : dw $F7FF ; Events, Items, Doors
    dw $D91A : dw $0185 ; Events, Items, Doors
    dw #$FFFF


preset_SZM101_pirate_ship_draygon_green_lazers:
    dw #preset_SZM101_pirate_ship_draygon_underground_path ; Pirate Ship Draygon: Underground Path
    dw $078D : dw $B798 ; DDB
    dw $078F : dw $0001 ; DoorOut Index
    dw $079B : dw $9879 ; MDB
    dw $090F : dw $3000 ; Screen subpixel X position.
    dw $0913 : dw $B800 ; Screen subpixel Y position
    dw $0915 : dw $0000 ; Screen Y position in pixels
    dw $0919 : dw $0000 ; Layer 2 Y scroll in room in pixels? (up = positive)
    dw $0923 : dw $0000 ; BG2 Y scroll offset due to room transitions (Translates between Layer 2 scroll and BG2 scroll)
    dw $09C2 : dw $0538 ; Health
    dw $09C6 : dw $00B1 ; Missiles
    dw $09CE : dw $001E ; Pbs
    dw $0A1C : dw $0002 ; Samus position/state
    dw $0A1E : dw $0004 ; More position/state
    dw $0AF6 : dw $009B ; Samus X
    dw $0AFA : dw $008B ; Samus Y
    dw #$FFFF


preset_SZM101_pirate_ship_draygon_jetpack_pirates:
    dw #preset_SZM101_pirate_ship_draygon_green_lazers ; Pirate Ship Draygon: Green Lazers
    dw $078D : dw $AEE8 ; DDB
    dw $078F : dw $0000 ; DoorOut Index
    dw $079B : dw $CE40 ; MDB
    dw $090F : dw $AFFF ; Screen subpixel X position.
    dw $0911 : dw $0100 ; Screen X position in pixels
    dw $0913 : dw $9000 ; Screen subpixel Y position
    dw $0915 : dw $0008 ; Screen Y position in pixels
    dw $0917 : dw $0100 ; Layer 2 X scroll in room in pixels?
    dw $0919 : dw $0008 ; Layer 2 Y scroll in room in pixels? (up = positive)
    dw $0921 : dw $FE00 ; BG2 X scroll offset due to room transitions (Translates between Layer 2 scroll and BG2 scroll)
    dw $0923 : dw $FE00 ; BG2 Y scroll offset due to room transitions (Translates between Layer 2 scroll and BG2 scroll)
    dw $09C2 : dw $0529 ; Health
    dw $0A1C : dw $0001 ; Samus position/state
    dw $0A1E : dw $0008 ; More position/state
    dw $0AF6 : dw $01C9 ; Samus X
    dw #$FFFF


preset_SZM101_pirate_ship_draygon_one_try_lazer_skip:
    dw #preset_SZM101_pirate_ship_draygon_jetpack_pirates ; Pirate Ship Draygon: Jetpack Pirates
    dw $078D : dw $B7A4 ; DDB
    dw $078F : dw $0002 ; DoorOut Index
    dw $079B : dw $8A31 ; MDB
    dw $090F : dw $0000 ; Screen subpixel X position.
    dw $0913 : dw $6800 ; Screen subpixel Y position
    dw $0915 : dw $001D ; Screen Y position in pixels
    dw $0919 : dw $001D ; Layer 2 Y scroll in room in pixels? (up = positive)
    dw $0921 : dw $0100 ; BG2 X scroll offset due to room transitions (Translates between Layer 2 scroll and BG2 scroll)
    dw $0923 : dw $FF00 ; BG2 Y scroll offset due to room transitions (Translates between Layer 2 scroll and BG2 scroll)
    dw $09C2 : dw $0493 ; Health
    dw $09C6 : dw $00B3 ; Missiles
    dw $0AF6 : dw $01B1 ; Samus X
    dw $D8CA : dw $0FD0 ; Events, Items, Doors
    dw #$FFFF


preset_SZM101_pirate_ship_draygon_draygon:
    dw #preset_SZM101_pirate_ship_draygon_one_try_lazer_skip ; Pirate Ship Draygon: One Try Lazer Skip
    dw $078D : dw $A4E0 ; DDB
    dw $078F : dw $0001 ; DoorOut Index
    dw $079B : dw $8B12 ; MDB
    dw $090F : dw $F5FF ; Screen subpixel X position.
    dw $0911 : dw $0000 ; Screen X position in pixels
    dw $0913 : dw $C800 ; Screen subpixel Y position
    dw $0915 : dw $0000 ; Screen Y position in pixels
    dw $0917 : dw $0000 ; Layer 2 X scroll in room in pixels?
    dw $0919 : dw $0000 ; Layer 2 Y scroll in room in pixels? (up = positive)
    dw $0923 : dw $0000 ; BG2 Y scroll offset due to room transitions (Translates between Layer 2 scroll and BG2 scroll)
    dw $09C2 : dw $048D ; Health
    dw $09C6 : dw $00B7 ; Missiles
    dw $09CA : dw $0022 ; Supers
    dw $09CE : dw $001F ; Pbs
    dw $09D0 : dw $0032 ; Max pbs
    dw $0AF6 : dw $00C5 ; Samus X
    dw $D82A : dw $0003 ; Events, Items, Doors
    dw $D87A : dw $FFFF ; Events, Items, Doors
    dw $D8CE : dw $7F52 ; Events, Items, Doors
    dw $D91A : dw $0186 ; Events, Items, Doors
    dw #$FFFF


preset_SZM101_pirate_ship_draygon_boss_missile:
    dw #preset_SZM101_pirate_ship_draygon_draygon ; Pirate Ship Draygon: Draygon
    dw $078D : dw $A96C ; DDB
    dw $078F : dw $0000 ; DoorOut Index
    dw $079B : dw $A07B ; MDB
    dw $07C3 : dw $9DEA ; GFX Pointers
    dw $07C5 : dw $2CBF ; GFX Pointers
    dw $07C7 : dw $C2BA ; GFX Pointers
    dw $07F3 : dw $002D ; Music Bank
    dw $07F5 : dw $0006 ; Music Track
    dw $090F : dw $9000 ; Screen subpixel X position.
    dw $09C2 : dw $0190 ; Health
    dw $09C6 : dw $0022 ; Missiles
    dw $09CA : dw $0012 ; Supers
    dw $09CE : dw $0029 ; Pbs
    dw $0AF6 : dw $0034 ; Samus X
    dw $D82A : dw $0103 ; Events, Items, Doors
    dw $D848 : dw $0101 ; Events, Items, Doors
    dw $D8B2 : dw $0002 ; Events, Items, Doors
    dw $D91A : dw $0189 ; Events, Items, Doors
    dw #$FFFF


preset_SZM101_pirate_ship_draygon_four_key_shutters:
    dw #preset_SZM101_pirate_ship_draygon_boss_missile ; Pirate Ship Draygon: Boss Missile
    dw $078D : dw $BFDC ; DDB
    dw $078F : dw $0001 ; DoorOut Index
    dw $079B : dw $BD50 ; MDB
    dw $07C3 : dw $E78D ; GFX Pointers
    dw $07C5 : dw $2EBE ; GFX Pointers
    dw $07C7 : dw $C2B9 ; GFX Pointers
    dw $07F3 : dw $0024 ; Music Bank
    dw $07F5 : dw $0007 ; Music Track
    dw $090F : dw $E000 ; Screen subpixel X position.
    dw $0915 : dw $0100 ; Screen Y position in pixels
    dw $0919 : dw $0100 ; Layer 2 Y scroll in room in pixels? (up = positive)
    dw $0921 : dw $0000 ; BG2 X scroll offset due to room transitions (Translates between Layer 2 scroll and BG2 scroll)
    dw $0923 : dw $FFE0 ; BG2 Y scroll offset due to room transitions (Translates between Layer 2 scroll and BG2 scroll)
    dw $09C2 : dw $0190 ; Health
    dw $09C6 : dw $0027 ; Missiles
    dw $09C8 : dw $00E6 ; Max missiles
    dw $09CA : dw $0012 ; Supers
    dw $09CE : dw $0029 ; Pbs
    dw $0A1C : dw $0002 ; Samus position/state
    dw $0A1E : dw $0004 ; More position/state
    dw $0AF6 : dw $0035 ; Samus X
    dw $0AFA : dw $018B ; Samus Y
    dw $D820 : dw $4925 ; Events, Items, Doors
    dw $D82A : dw $0303 ; Events, Items, Doors
    dw $D882 : dw $0001 ; Events, Items, Doors
    dw #$FFFF


preset_SZM101_pirate_ship_draygon_ninja_pirates_2:
    dw #preset_SZM101_pirate_ship_draygon_four_key_shutters ; Pirate Ship Draygon: Four Key Shutters
    dw $078D : dw $BB88 ; DDB
    dw $078F : dw $0000 ; DoorOut Index
    dw $079B : dw $CE40 ; MDB
    dw $090F : dw $3000 ; Screen subpixel X position.
    dw $0911 : dw $0095 ; Screen X position in pixels
    dw $0915 : dw $0200 ; Screen Y position in pixels
    dw $0917 : dw $0095 ; Layer 2 X scroll in room in pixels?
    dw $0919 : dw $0200 ; Layer 2 Y scroll in room in pixels? (up = positive)
    dw $0921 : dw $FE00 ; BG2 X scroll offset due to room transitions (Translates between Layer 2 scroll and BG2 scroll)
    dw $0923 : dw $0000 ; BG2 Y scroll offset due to room transitions (Translates between Layer 2 scroll and BG2 scroll)
    dw $09C6 : dw $0029 ; Missiles
    dw $09CA : dw $0011 ; Supers
    dw $0A1C : dw $0001 ; Samus position/state
    dw $0A1E : dw $0008 ; More position/state
    dw $0AF6 : dw $012E ; Samus X
    dw $0AFA : dw $027B ; Samus Y
    dw #$FFFF


preset_SZM101_pirate_ship_draygon_in_the_way_blocks:
    dw #preset_SZM101_pirate_ship_draygon_ninja_pirates_2 ; Pirate Ship Draygon: Ninja Pirates
    dw $078D : dw $B834 ; DDB
    dw $078F : dw $0001 ; DoorOut Index
    dw $079B : dw $DFD7 ; MDB
    dw $090F : dw $5FFF ; Screen subpixel X position.
    dw $0911 : dw $0000 ; Screen X position in pixels
    dw $0917 : dw $0000 ; Layer 2 X scroll in room in pixels?
    dw $0919 : dw $0180 ; Layer 2 Y scroll in room in pixels? (up = positive)
    dw $09D6 : dw $0000 ; Reserves
    dw $0A1C : dw $0002 ; Samus position/state
    dw $0A1E : dw $0004 ; More position/state
    dw $0AF6 : dw $003C ; Samus X
    dw $0AFA : dw $028B ; Samus Y
    dw $D8C8 : dw $13F7 ; Events, Items, Doors
    dw #$FFFF


preset_SZM101_pirate_ship_draygon_animal_room:
    dw #preset_SZM101_pirate_ship_draygon_in_the_way_blocks ; Pirate Ship Draygon: In The Way Blocks
    dw $078D : dw $BA80 ; DDB
    dw $078F : dw $0004 ; DoorOut Index
    dw $079B : dw $D5EC ; MDB
    dw $090F : dw $3000 ; Screen subpixel X position.
    dw $0913 : dw $D800 ; Screen subpixel Y position
    dw $0915 : dw $0000 ; Screen Y position in pixels
    dw $0919 : dw $0000 ; Layer 2 Y scroll in room in pixels? (up = positive)
    dw $0921 : dw $0000 ; BG2 X scroll offset due to room transitions (Translates between Layer 2 scroll and BG2 scroll)
    dw $0923 : dw $00E0 ; BG2 Y scroll offset due to room transitions (Translates between Layer 2 scroll and BG2 scroll)
    dw $09CE : dw $0028 ; Pbs
    dw $0AF6 : dw $0025 ; Samus X
    dw $0AFA : dw $00BB ; Samus Y
    dw $D820 : dw $C925 ; Events, Items, Doors
    dw $D8B2 : dw $1002 ; Events, Items, Doors
    dw $D91A : dw $018A ; Events, Items, Doors
    dw #$FFFF


preset_SZM101_pirate_ship_draygon_crash_room:
    dw #preset_SZM101_pirate_ship_draygon_animal_room ; Pirate Ship Draygon: Animal Room
    dw $078D : dw $A8A0 ; DDB
    dw $078F : dw $0000 ; DoorOut Index
    dw $079B : dw $8852 ; MDB
    dw $090F : dw $6000 ; Screen subpixel X position.
    dw $0913 : dw $3800 ; Screen subpixel Y position
    dw $0915 : dw $01FF ; Screen Y position in pixels
    dw $0919 : dw $01FF ; Layer 2 Y scroll in room in pixels? (up = positive)
    dw $0921 : dw $FF00 ; BG2 X scroll offset due to room transitions (Translates between Layer 2 scroll and BG2 scroll)
    dw $0923 : dw $FD00 ; BG2 Y scroll offset due to room transitions (Translates between Layer 2 scroll and BG2 scroll)
    dw $0AF6 : dw $0056 ; Samus X
    dw $0AFA : dw $028B ; Samus Y
    dw $D91A : dw $018B ; Events, Items, Doors
    dw #$FFFF


preset_SZM101_pirate_ship_draygon_dachora_room:
    dw #preset_SZM101_pirate_ship_draygon_crash_room ; Pirate Ship Draygon: Crash Room
    dw $078D : dw $BA08 ; DDB
    dw $078F : dw $0005 ; DoorOut Index
    dw $079B : dw $E0B5 ; MDB
    dw $090F : dw $4000 ; Screen subpixel X position.
    dw $0911 : dw $0068 ; Screen X position in pixels
    dw $0913 : dw $6400 ; Screen subpixel Y position
    dw $0915 : dw $0000 ; Screen Y position in pixels
    dw $0917 : dw $0068 ; Layer 2 X scroll in room in pixels?
    dw $0919 : dw $0000 ; Layer 2 Y scroll in room in pixels? (up = positive)
    dw $0921 : dw $FD00 ; BG2 X scroll offset due to room transitions (Translates between Layer 2 scroll and BG2 scroll)
    dw $0923 : dw $FE00 ; BG2 Y scroll offset due to room transitions (Translates between Layer 2 scroll and BG2 scroll)
    dw $0A1C : dw $0001 ; Samus position/state
    dw $0A1E : dw $0008 ; More position/state
    dw $0AF6 : dw $00F6 ; Samus X
    dw $0AFA : dw $008B ; Samus Y
    dw #$FFFF


preset_SZM101_pirate_ship_draygon_white_pirates:
    dw #preset_SZM101_pirate_ship_draygon_dachora_room ; Pirate Ship Draygon: Dachora Room
    dw $078D : dw $AB58 ; DDB
    dw $078F : dw $0000 ; DoorOut Index
    dw $079B : dw $896D ; MDB
    dw $0911 : dw $0214 ; Screen X position in pixels
    dw $0913 : dw $9800 ; Screen subpixel Y position
    dw $0917 : dw $0214 ; Layer 2 X scroll in room in pixels?
    dw $0921 : dw $0100 ; BG2 X scroll offset due to room transitions (Translates between Layer 2 scroll and BG2 scroll)
    dw $0923 : dw $FC00 ; BG2 Y scroll offset due to room transitions (Translates between Layer 2 scroll and BG2 scroll)
    dw $09C6 : dw $002E ; Missiles
    dw $09C8 : dw $00EB ; Max missiles
    dw $0AF6 : dw $0285 ; Samus X
    dw $D874 : dw $FFFF ; Events, Items, Doors
    dw $D91A : dw $018C ; Events, Items, Doors
    dw #$FFFF

