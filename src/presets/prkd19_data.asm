
preset_prkd19_crateria_ceres_elevator:
    dw #$0000
    dw $078D, $AB58  ; DDB
    dw $079B, $DF45  ; MDB
    dw $07F3, $002D  ; Music Bank
    dw $07F5, $0006  ; Music Track
    dw $090F, $0000  ; Screen subpixel X position
    dw $0911, $0000  ; Screen X position in pixels
    dw $0913, $0000  ; Screen subpixel Y position
    dw $0915, $0000  ; Screen Y position in pixels
    dw $0917, $0000  ; Layer 2 X position
    dw $0919, $0000  ; Layer 2 Y position
    dw $093F, $0000  ; Ceres escape flag
    dw $09A2, $0000  ; Equipped Items
    dw $09A4, $0000  ; Collected Items
    dw $09A6, $0000  ; Equipped Beams
    dw $09A8, $0000  ; Collected Beams
    dw $09C0, $0000  ; Manual/Auto reserve tank
    dw $09C2, $0063  ; Health
    dw $09C4, $0063  ; Max health
    dw $09C6, $0000  ; Missiles
    dw $09C8, $0000  ; Max missiles
    dw $09CA, $0000  ; Supers
    dw $09CC, $0000  ; Max supers
    dw $09CE, $0000  ; Pbs
    dw $09D0, $0000  ; Max pbs
    dw $09D2, $0000  ; Currently selected item
    dw $09D4, $0000  ; Max reserves
    dw $09D6, $0000  ; Reserves
    dw $0A1C, $0000  ; Samus position/state
    dw $0A1E, $0000  ; More position/state
    dw $0A68, $0000  ; Flash suit
    dw $0A76, $0000  ; Hyper beam
    dw $0AF6, $0080  ; Samus X
    dw $0AF8, $0000  ; Samus subpixel X
    dw $0AFA, $0048  ; Samus Y
    dw $0AFC, $0000  ; Samus subpixel Y
    dw $0B3F, $0000  ; Blue suit
    dw $D820, $0000  ; Events
    dw $D822, $0000  ; Events
    dw $D828, $0000  ; Bosses
    dw $D82A, $0000  ; Bosses
    dw $D82C, $0000  ; Bosses
    dw $D82E, $0000  ; Bosses
    dw $D870, $0000  ; Items
    dw $D872, $0000  ; Items
    dw $D874, $0000  ; Items
    dw $D876, $0000  ; Items
    dw $D878, $0000  ; Items
    dw $D87A, $0000  ; Items
    dw $D87C, $0000  ; Items
    dw $D87E, $0000  ; Items
    dw $D880, $0000  ; Items
    dw $D882, $0000  ; Items
    dw $D8B0, $0000  ; Doors
    dw $D8B2, $0000  ; Doors
    dw $D8B4, $0000  ; Doors
    dw $D8B6, $0000  ; Doors
    dw $D8B8, $0000  ; Doors
    dw $D8BA, $0000  ; Doors
    dw $D8BC, $0000  ; Doors
    dw $D8BE, $0000  ; Doors
    dw $D8C0, $0000  ; Doors
    dw $D8C2, $0000  ; Doors
    dw $D8C4, $0000  ; Doors
    dw $D908, $0000  ; Map Stations
    dw $D90A, $0000  ; Map Stations
    dw $D90C, $0000  ; Map Stations
    dw #$FFFF

preset_prkd19_crateria_ceres_escape:
    dw #preset_prkd19_crateria_ceres_elevator ; Crateria: Ceres Elevator
    dw $078D, $ABAC  ; DDB
    dw $079B, $E0B5  ; MDB
    dw $07F3, $0024  ; Music Bank
    dw $07F5, $0007  ; Music Track
    dw $090F, $8000  ; Screen subpixel X position
    dw $0913, $9400  ; Screen subpixel Y position
    dw $093F, $0002  ; Ceres escape flag
    dw $09C2, $0018  ; Health
    dw $0A1C, $0002  ; Samus position/state
    dw $0A1E, $0004  ; More position/state
    dw $0AF6, $0033  ; Samus X
    dw $0AF8, $B000  ; Samus subpixel X
    dw $0AFA, $008B  ; Samus Y
    dw $0AFC, $FFFF  ; Samus subpixel Y
    dw $D82E, $0001  ; Bosses
    dw #$FFFF

preset_prkd19_crateria_ceres_last_3_rooms:
    dw #preset_prkd19_crateria_ceres_escape ; Crateria: Ceres Escape
    dw $078D, $ABA0  ; DDB
    dw $079B, $E021  ; MDB
    dw $090F, $7400  ; Screen subpixel X position
    dw $0913, $F000  ; Screen subpixel Y position
    dw $0AF6, $004E  ; Samus X
    dw $0AFA, $00A2  ; Samus Y
    dw #$FFFF

preset_prkd19_crateria_ship:
    dw #preset_prkd19_crateria_ceres_last_3_rooms ; Crateria: Ceres Last 3 Rooms
    dw $078D, $88FE  ; DDB
    dw $079B, $91F8  ; MDB
    dw $07F3, $0006  ; Music Bank
    dw $07F5, $0005  ; Music Track
    dw $090F, $8000  ; Screen subpixel X position
    dw $0911, $0400  ; Screen X position in pixels
    dw $0913, $0000  ; Screen subpixel Y position
    dw $0915, $0400  ; Screen Y position in pixels
    dw $0917, $0200  ; Layer 2 X position
    dw $093F, $0000  ; Ceres escape flag
    dw $09C2, $0063  ; Health
    dw $0A1C, $0000  ; Samus position/state
    dw $0A1E, $0000  ; More position/state
    dw $0AF6, $0481  ; Samus X
    dw $0AF8, $0000  ; Samus subpixel X
    dw $0AFA, $0471  ; Samus Y
    dw $0AFC, $8000  ; Samus subpixel Y
    dw #$FFFF

preset_prkd19_crateria_parlor:
    dw #preset_prkd19_crateria_ship ; Crateria: Ship
    dw $090F, $0000  ; Screen subpixel X position
    dw $0911, $0000  ; Screen X position in pixels
    dw $0913, $1400  ; Screen subpixel Y position
    dw $0917, $0000  ; Layer 2 X position
    dw $0A1C, $0002  ; Samus position/state
    dw $0A1E, $0004  ; More position/state
    dw $0AF6, $0079  ; Samus X
    dw $0AFA, $049B  ; Samus Y
    dw $0AFC, $FFFF  ; Samus subpixel Y
    dw #$FFFF

preset_prkd19_crateria_parlor_downback:
    dw #preset_prkd19_crateria_parlor ; Crateria: Parlor
    dw $078D, $8916  ; DDB
    dw $079B, $92FD  ; MDB
    dw $090F, $F000  ; Screen subpixel X position
    dw $0911, $0100  ; Screen X position in pixels
    dw $0913, $9C00  ; Screen subpixel Y position
    dw $0915, $032A  ; Screen Y position in pixels
    dw $0917, $00C0  ; Layer 2 X position
    dw $0919, $025F  ; Layer 2 Y position
    dw $0AF6, $01B5  ; Samus X
    dw $0AFA, $039B  ; Samus Y
    dw #$FFFF

preset_prkd19_crateria_climb_down:
    dw #preset_prkd19_crateria_parlor_downback ; Crateria: Parlor Downback
    dw $090F, $0000  ; Screen subpixel X position
    dw $0913, $7BFF  ; Screen subpixel Y position
    dw $0915, $03F2  ; Screen Y position in pixels
    dw $0919, $02F5  ; Layer 2 Y position
    dw $0A1C, $0018  ; Samus position/state
    dw $0A1E, $0204  ; More position/state
    dw $0AF6, $0199  ; Samus X
    dw $0AF8, $8000  ; Samus subpixel X
    dw $0AFA, $048A  ; Samus Y
    dw $0AFC, $0000  ; Samus subpixel Y
    dw #$FFFF

preset_prkd19_crateria_pit_room:
    dw #preset_prkd19_crateria_climb_down ; Crateria: Climb Down
    dw $078D, $898E  ; DDB
    dw $079B, $96BA  ; MDB
    dw $090F, $6FFF  ; Screen subpixel X position
    dw $0913, $3800  ; Screen subpixel Y position
    dw $0915, $0800  ; Screen Y position in pixels
    dw $0919, $0600  ; Layer 2 Y position
    dw $0A1C, $0001  ; Samus position/state
    dw $0A1E, $0008  ; More position/state
    dw $0AF6, $01DB  ; Samus X
    dw $0AF8, $FFFF  ; Samus subpixel X
    dw $0AFA, $088B  ; Samus Y
    dw $0AFC, $FFFF  ; Samus subpixel Y
    dw #$FFFF

preset_prkd19_crateria_morph:
    dw #preset_prkd19_crateria_pit_room ; Crateria: Pit Room
    dw $078D, $8B9E  ; DDB
    dw $079B, $9E9F  ; MDB
    dw $07F5, $0007  ; Music Track
    dw $090F, $6000  ; Screen subpixel X position
    dw $0911, $0500  ; Screen X position in pixels
    dw $0913, $0000  ; Screen subpixel Y position
    dw $0915, $0200  ; Screen Y position in pixels
    dw $0917, $03C0  ; Layer 2 X position
    dw $0919, $0180  ; Layer 2 Y position
    dw $0A1C, $0000  ; Samus position/state
    dw $0A1E, $0000  ; More position/state
    dw $0AF6, $0580  ; Samus X
    dw $0AFA, $02A8  ; Samus Y
    dw #$FFFF

preset_prkd19_crateria_construction_zone_down:
    dw #preset_prkd19_crateria_morph ; Crateria: Morph
    dw $090F, $2000  ; Screen subpixel X position
    dw $0911, $0700  ; Screen X position in pixels
    dw $0913, $E400  ; Screen subpixel Y position
    dw $0917, $0540  ; Layer 2 X position
    dw $09A2, $0004  ; Equipped Items
    dw $09A4, $0004  ; Collected Items
    dw $0A1C, $0001  ; Samus position/state
    dw $0A1E, $0008  ; More position/state
    dw $0AF6, $07AC  ; Samus X
    dw $0AFA, $028B  ; Samus Y
    dw $D872, $0400  ; Items
    dw #$FFFF

preset_prkd19_crateria_construction_zone_up:
    dw #preset_prkd19_crateria_construction_zone_down ; Crateria: Construction Zone Down
    dw $078D, $8EDA  ; DDB
    dw $079B, $A107  ; MDB
    dw $090F, $D000  ; Screen subpixel X position
    dw $0911, $0000  ; Screen X position in pixels
    dw $0913, $6800  ; Screen subpixel Y position
    dw $0915, $0000  ; Screen Y position in pixels
    dw $0917, $0001  ; Layer 2 X position
    dw $0919, $0000  ; Layer 2 Y position
    dw $09C6, $0005  ; Missiles
    dw $09C8, $0005  ; Max missiles
    dw $0AF6, $0055  ; Samus X
    dw $0AFA, $008B  ; Samus Y
    dw $D874, $0004  ; Items
    dw #$FFFF

preset_prkd19_crateria_pit_room_revisit:
    dw #preset_prkd19_crateria_construction_zone_up ; Crateria: Construction Zone Up
    dw $078D, $8EB6  ; DDB
    dw $079B, $97B5  ; MDB
    dw $07F5, $0003  ; Music Track
    dw $090F, $0000  ; Screen subpixel X position
    dw $0913, $0000  ; Screen subpixel Y position
    dw $0917, $0000  ; Layer 2 X position
    dw $0A1C, $0000  ; Samus position/state
    dw $0A1E, $0000  ; More position/state
    dw $0AF6, $0080  ; Samus X
    dw $0AFA, $0088  ; Samus Y
    dw #$FFFF

preset_prkd19_crateria_climb_up:
    dw #preset_prkd19_crateria_pit_room_revisit ; Crateria: Pit Room Revisit
    dw $078D, $8B92  ; DDB
    dw $079B, $975C  ; MDB
    dw $07F3, $0009  ; Music Bank
    dw $07F5, $0005  ; Music Track
    dw $090F, $4000  ; Screen subpixel X position
    dw $0913, $CC00  ; Screen subpixel Y position
    dw $0A1C, $0002  ; Samus position/state
    dw $0A1E, $0004  ; More position/state
    dw $0AF6, $0083  ; Samus X
    dw $0AFA, $008B  ; Samus Y
    dw $D820, $0001  ; Events
    dw $D8B2, $0400  ; Doors
    dw #$FFFF

preset_prkd19_crateria_parlor_revisit:
    dw #preset_prkd19_crateria_climb_up ; Crateria: Climb Up
    dw $078D, $8B7A  ; DDB
    dw $079B, $96BA  ; MDB
    dw $090F, $0000  ; Screen subpixel X position
    dw $0911, $0100  ; Screen X position in pixels
    dw $0913, $C000  ; Screen subpixel Y position
    dw $0917, $00C0  ; Layer 2 X position
    dw $0AF6, $01A0  ; Samus X
    dw $0AFA, $005B  ; Samus Y
    dw #$FFFF

preset_prkd19_crateria_flyway:
    dw #preset_prkd19_crateria_parlor_revisit ; Crateria: Parlor Revisit
    dw $078D, $8B3E  ; DDB
    dw $079B, $92FD  ; MDB
    dw $090F, $C000  ; Screen subpixel X position
    dw $0911, $0300  ; Screen X position in pixels
    dw $0913, $2BFF  ; Screen subpixel Y position
    dw $0915, $01E6  ; Screen Y position in pixels
    dw $0917, $0240  ; Layer 2 X position
    dw $0919, $016C  ; Layer 2 Y position
    dw $09D2, $0001  ; Currently selected item
    dw $0A1C, $0001  ; Samus position/state
    dw $0A1E, $0008  ; More position/state
    dw $0AF6, $0369  ; Samus X
    dw $0AFA, $026B  ; Samus Y
    dw #$FFFF

preset_prkd19_crateria_bomb_torizo:
    dw #preset_prkd19_crateria_flyway ; Crateria: Flyway
    dw $078D, $8982  ; DDB
    dw $079B, $9879  ; MDB
    dw $090F, $4000  ; Screen subpixel X position
    dw $0911, $0200  ; Screen X position in pixels
    dw $0913, $D000  ; Screen subpixel Y position
    dw $0915, $0000  ; Screen Y position in pixels
    dw $0917, $0180  ; Layer 2 X position
    dw $0919, $0000  ; Layer 2 Y position
    dw $09C6, $0000  ; Missiles
    dw $09D2, $0000  ; Currently selected item
    dw $0AF6, $02BE  ; Samus X
    dw $0AFA, $008B  ; Samus Y
    dw $D8B2, $2400  ; Doors
    dw #$FFFF

preset_prkd19_crateria_alcatraz:
    dw #preset_prkd19_crateria_bomb_torizo ; Crateria: Bomb Torizo
    dw $078D, $8BAA  ; DDB
    dw $090F, $2001  ; Screen subpixel X position
    dw $0911, $0000  ; Screen X position in pixels
    dw $0917, $0000  ; Layer 2 X position
    dw $09A2, $1004  ; Equipped Items
    dw $09A4, $1004  ; Collected Items
    dw $09C6, $0005  ; Missiles
    dw $0A1C, $0002  ; Samus position/state
    dw $0A1E, $0004  ; More position/state
    dw $0AF6, $0040  ; Samus X
    dw $D828, $0004  ; Bosses
    dw $D870, $0080  ; Items
    dw $D8B2, $2C00  ; Doors
    dw #$FFFF

preset_prkd19_crateria_terminator:
    dw #preset_prkd19_crateria_alcatraz ; Crateria: Alcatraz
    dw $078D, $8BB6  ; DDB
    dw $079B, $92FD  ; MDB
    dw $090F, $6000  ; Screen subpixel X position
    dw $0911, $0100  ; Screen X position in pixels
    dw $0913, $5800  ; Screen subpixel Y position
    dw $0917, $00C0  ; Layer 2 X position
    dw $0A1C, $0041  ; Samus position/state
    dw $0A1E, $0404  ; More position/state
    dw $0AF6, $0115  ; Samus X
    dw $0AFA, $0099  ; Samus Y
    dw #$FFFF

preset_prkd19_crateria_green_pirate_shaft:
    dw #preset_prkd19_crateria_terminator ; Crateria: Terminator
    dw $078D, $895E  ; DDB
    dw $079B, $990D  ; MDB
    dw $090F, $9F00  ; Screen subpixel X position
    dw $0911, $0000  ; Screen X position in pixels
    dw $0913, $0000  ; Screen subpixel Y position
    dw $0915, $01FC  ; Screen Y position in pixels
    dw $0917, $0000  ; Layer 2 X position
    dw $0919, $017D  ; Layer 2 Y position
    dw $09C2, $00C7  ; Health
    dw $09C4, $00C7  ; Max health
    dw $0A1C, $0002  ; Samus position/state
    dw $0A1E, $0004  ; More position/state
    dw $0AF6, $0063  ; Samus X
    dw $0AFA, $029B  ; Samus Y
    dw $D870, $0180  ; Items
    dw #$FFFF

preset_prkd19_brinstar_green_brinstar_elevator:
    dw #preset_prkd19_crateria_green_pirate_shaft ; Crateria: Green Pirate Shaft
    dw $078D, $8C22  ; DDB
    dw $079B, $9938  ; MDB
    dw $07F5, $0003  ; Music Track
    dw $090F, $1C80  ; Screen subpixel X position
    dw $0913, $C400  ; Screen subpixel Y position
    dw $0915, $0000  ; Screen Y position in pixels
    dw $0919, $0000  ; Layer 2 Y position
    dw $09C6, $0002  ; Missiles
    dw $0AF6, $007C  ; Samus X
    dw $0AFA, $008B  ; Samus Y
    dw #$FFFF

preset_prkd19_brinstar_early_supers:
    dw #preset_prkd19_brinstar_green_brinstar_elevator ; Brinstar: Green Brinstar Elevator
    dw $078D, $8C0A  ; DDB
    dw $079B, $9AD9  ; MDB
    dw $07F3, $000F  ; Music Bank
    dw $07F5, $0005  ; Music Track
    dw $090F, $7000  ; Screen subpixel X position
    dw $0913, $0000  ; Screen subpixel Y position
    dw $0915, $041C  ; Screen Y position in pixels
    dw $0919, $0315  ; Layer 2 Y position
    dw $09C6, $0000  ; Missiles
    dw $0A1C, $0001  ; Samus position/state
    dw $0A1E, $0008  ; More position/state
    dw $0AF6, $00A1  ; Samus X
    dw $0AFA, $048B  ; Samus Y
    dw $D8B4, $0002  ; Doors
    dw #$FFFF

preset_prkd19_brinstar_dachora_room:
    dw #preset_prkd19_brinstar_early_supers ; Brinstar: Early Supers
    dw $078D, $8D4E  ; DDB
    dw $090F, $8000  ; Screen subpixel X position
    dw $0915, $061A  ; Screen Y position in pixels
    dw $0919, $0493  ; Layer 2 Y position
    dw $09C2, $00BD  ; Health
    dw $09CA, $0004  ; Supers
    dw $09CC, $0005  ; Max supers
    dw $0AF6, $0053  ; Samus X
    dw $0AFA, $068B  ; Samus Y
    dw $D872, $0401  ; Items
    dw $D8B4, $0006  ; Doors
    dw #$FFFF

preset_prkd19_brinstar_big_pink:
    dw #preset_prkd19_brinstar_dachora_room ; Brinstar: Dachora Room
    dw $078D, $8CE2  ; DDB
    dw $079B, $9CB3  ; MDB
    dw $090F, $7000  ; Screen subpixel X position
    dw $0911, $0600  ; Screen X position in pixels
    dw $0913, $9400  ; Screen subpixel Y position
    dw $0915, $0000  ; Screen Y position in pixels
    dw $0917, $0480  ; Layer 2 X position
    dw $0919, $0000  ; Layer 2 Y position
    dw $09C2, $00B3  ; Health
    dw $09C6, $0002  ; Missiles
    dw $0AF6, $0699  ; Samus X
    dw $0AFA, $008B  ; Samus Y
    dw #$FFFF

preset_prkd19_brinstar_green_hill_zone:
    dw #preset_prkd19_brinstar_big_pink ; Brinstar: Big Pink
    dw $078D, $8DAE  ; DDB
    dw $079B, $9D19  ; MDB
    dw $090F, $0000  ; Screen subpixel X position
    dw $0911, $0300  ; Screen X position in pixels
    dw $0913, $E000  ; Screen subpixel Y position
    dw $0915, $0611  ; Screen Y position in pixels
    dw $0917, $0240  ; Layer 2 X position
    dw $0919, $048C  ; Layer 2 Y position
    dw $09A6, $1000  ; Equipped Beams
    dw $09A8, $1000  ; Collected Beams
    dw $09C6, $0007  ; Missiles
    dw $09C8, $000A  ; Max missiles
    dw $09CA, $0003  ; Supers
    dw $0AF6, $036C  ; Samus X
    dw $0AFA, $068B  ; Samus Y
    dw $D872, $04C1  ; Items
    dw $D8B4, $0206  ; Doors
    dw #$FFFF

preset_prkd19_brinstar_noob_bridge:
    dw #preset_prkd19_brinstar_green_hill_zone ; Brinstar: Green Hill Zone
    dw $078D, $8DEA  ; DDB
    dw $079B, $9E52  ; MDB
    dw $090F, $5000  ; Screen subpixel X position
    dw $0911, $068B  ; Screen X position in pixels
    dw $0913, $8C00  ; Screen subpixel Y position
    dw $0915, $0300  ; Screen Y position in pixels
    dw $0917, $04E8  ; Layer 2 X position
    dw $0919, $0240  ; Layer 2 Y position
    dw $09C2, $00A9  ; Health
    dw $0AF6, $06FC  ; Samus X
    dw $0AFA, $03AB  ; Samus Y
    dw #$FFFF

preset_prkd19_brinstar_red_tower:
    dw #preset_prkd19_brinstar_noob_bridge ; Brinstar: Noob Bridge
    dw $078D, $8E92  ; DDB
    dw $079B, $9FBA  ; MDB
    dw $090F, $0000  ; Screen subpixel X position
    dw $0911, $0500  ; Screen X position in pixels
    dw $0913, $6400  ; Screen subpixel Y position
    dw $0915, $0000  ; Screen Y position in pixels
    dw $0917, $03C0  ; Layer 2 X position
    dw $0919, $0000  ; Layer 2 Y position
    dw $09CA, $0004  ; Supers
    dw $0AF6, $05BC  ; Samus X
    dw $0AFA, $008B  ; Samus Y
    dw $D8B6, $0008  ; Doors
    dw #$FFFF

preset_prkd19_brinstar_hellway:
    dw #preset_prkd19_brinstar_red_tower ; Brinstar: Red Tower
    dw $078D, $8F0A  ; DDB
    dw $079B, $A253  ; MDB
    dw $07F3, $0012  ; Music Bank
    dw $090F, $BFFF  ; Screen subpixel X position
    dw $0911, $0000  ; Screen X position in pixels
    dw $0913, $E400  ; Screen subpixel Y position
    dw $0915, $0006  ; Screen Y position in pixels
    dw $0917, $0000  ; Layer 2 X position
    dw $0919, $0004  ; Layer 2 Y position
    dw $0AF6, $0094  ; Samus X
    dw #$FFFF

preset_prkd19_brinstar_caterpillars_down:
    dw #preset_prkd19_brinstar_hellway ; Brinstar: Hellway
    dw $078D, $901E  ; DDB
    dw $079B, $A2F7  ; MDB
    dw $090F, $0000  ; Screen subpixel X position
    dw $0911, $0200  ; Screen X position in pixels
    dw $0913, $4400  ; Screen subpixel Y position
    dw $0915, $0000  ; Screen Y position in pixels
    dw $0917, $0180  ; Layer 2 X position
    dw $0919, $0000  ; Layer 2 Y position
    dw $09C2, $0093  ; Health
    dw $0AF6, $0286  ; Samus X
    dw #$FFFF

preset_prkd19_brinstar_alpha_power_bombs:
    dw #preset_prkd19_brinstar_caterpillars_down ; Brinstar: Caterpillars Down
    dw $078D, $908A  ; DDB
    dw $079B, $A322  ; MDB
    dw $090F, $B000  ; Screen subpixel X position
    dw $0911, $0000  ; Screen X position in pixels
    dw $0913, $5C00  ; Screen subpixel Y position
    dw $0915, $0717  ; Screen Y position in pixels
    dw $0917, $0000  ; Layer 2 X position
    dw $0919, $0717  ; Layer 2 Y position
    dw $09CA, $0003  ; Supers
    dw $0A1C, $0002  ; Samus position/state
    dw $0A1E, $0004  ; More position/state
    dw $0AF6, $0049  ; Samus X
    dw $0AFA, $078B  ; Samus Y
    dw $D8B6, $2008  ; Doors
    dw #$FFFF

preset_prkd19_brinstar_caterpillars_up:
    dw #preset_prkd19_brinstar_alpha_power_bombs ; Brinstar: Alpha Power Bombs
    dw $078D, $9096  ; DDB
    dw $079B, $A3AE  ; MDB
    dw $07F5, $0003  ; Music Track
    dw $090F, $1000  ; Screen subpixel X position
    dw $0911, $0200  ; Screen X position in pixels
    dw $0913, $CC00  ; Screen subpixel Y position
    dw $0915, $0000  ; Screen Y position in pixels
    dw $0917, $0180  ; Layer 2 X position
    dw $0919, $0000  ; Layer 2 Y position
    dw $09C2, $007F  ; Health
    dw $09CE, $0005  ; Pbs
    dw $09D0, $0005  ; Max pbs
    dw $09D2, $0003  ; Currently selected item
    dw $0A1C, $0001  ; Samus position/state
    dw $0A1E, $0008  ; More position/state
    dw $0AF6, $02AF  ; Samus X
    dw $0AFA, $008B  ; Samus Y
    dw $D874, $0104  ; Items
    dw #$FFFF

preset_prkd19_brinstar_crateria_kihunters:
    dw #preset_prkd19_brinstar_caterpillars_up ; Brinstar: Caterpillars Up
    dw $078D, $90BA  ; DDB
    dw $079B, $962A  ; MDB
    dw $090F, $0000  ; Screen subpixel X position
    dw $0911, $0000  ; Screen X position in pixels
    dw $0913, $0000  ; Screen subpixel Y position
    dw $0917, $0000  ; Layer 2 X position
    dw $09CA, $0005  ; Supers
    dw $09CE, $0004  ; Pbs
    dw $0A1C, $0000  ; Samus position/state
    dw $0A1E, $0000  ; More position/state
    dw $0AF6, $0080  ; Samus X
    dw $0AFA, $00A8  ; Samus Y
    dw $D8B6, $3008  ; Doors
    dw #$FFFF

preset_prkd19_brinstar_continuous_wall_jump:
    dw #preset_prkd19_brinstar_crateria_kihunters ; Brinstar: Crateria Kihunters
    dw $078D, $8AF6  ; DDB
    dw $079B, $948C  ; MDB
    dw $07F5, $0005  ; Music Track
    dw $090F, $0400  ; Screen subpixel X position
    dw $0911, $0200  ; Screen X position in pixels
    dw $0913, $3000  ; Screen subpixel Y position
    dw $0917, $0180  ; Layer 2 X position
    dw $09CE, $0001  ; Pbs
    dw $09D2, $0000  ; Currently selected item
    dw $0A1C, $0089  ; Samus position/state
    dw $0A1E, $1508  ; More position/state
    dw $0AF6, $02DB  ; Samus X
    dw $0AFA, $008B  ; Samus Y
    dw $D8B0, $6000  ; Doors
    dw $D8B2, $2C01  ; Doors
    dw #$FFFF

preset_prkd19_brinstar_horizontal_bomb_jump:
    dw #preset_prkd19_brinstar_continuous_wall_jump ; Brinstar: Continuous Wall Jump
    dw $078D, $8A36  ; DDB
    dw $079B, $95FF  ; MDB
    dw $090F, $4000  ; Screen subpixel X position
    dw $0911, $0085  ; Screen X position in pixels
    dw $0913, $0000  ; Screen subpixel Y position
    dw $0917, $0063  ; Layer 2 X position
    dw $09C6, $000C  ; Missiles
    dw $09C8, $000F  ; Max missiles
    dw $0A1C, $0001  ; Samus position/state
    dw $0A1E, $0008  ; More position/state
    dw $0AF6, $00EB  ; Samus X
    dw $D870, $0190  ; Items
    dw #$FFFF

preset_prkd19_brinstar_ocean:
    dw #preset_prkd19_brinstar_horizontal_bomb_jump ; Brinstar: Horizontal Bomb Jump
    dw $090F, $8000  ; Screen subpixel X position
    dw $0911, $0100  ; Screen X position in pixels
    dw $0913, $3C00  ; Screen subpixel Y position
    dw $0917, $00C0  ; Layer 2 X position
    dw $0AF6, $01A8  ; Samus X
    dw #$FFFF

preset_prkd19_wrecked_ship_shaft_down:
    dw #preset_prkd19_brinstar_ocean ; Brinstar: Ocean
    dw $078D, $89D6  ; DDB
    dw $079B, $CA08  ; MDB
    dw $07F3, $0030  ; Music Bank
    dw $090F, $0000  ; Screen subpixel X position
    dw $0911, $0300  ; Screen X position in pixels
    dw $0913, $0000  ; Screen subpixel Y position
    dw $0917, $0240  ; Layer 2 X position
    dw $09CA, $0004  ; Supers
    dw $0AF6, $038E  ; Samus X
    dw $D8B0, $7000  ; Doors
    dw #$FFFF

preset_prkd19_wrecked_ship_basement:
    dw #preset_prkd19_wrecked_ship_shaft_down ; Wrecked Ship: Shaft Down
    dw $078D, $A1BC  ; DDB
    dw $079B, $CAF6  ; MDB
    dw $090F, $6000  ; Screen subpixel X position
    dw $0911, $0400  ; Screen X position in pixels
    dw $0913, $4000  ; Screen subpixel Y position
    dw $0915, $071F  ; Screen Y position in pixels
    dw $0917, $0300  ; Layer 2 X position
    dw $0919, $0557  ; Layer 2 Y position
    dw $09CA, $0003  ; Supers
    dw $0AF6, $045C  ; Samus X
    dw $0AFA, $07BB  ; Samus Y
    dw $D8C0, $0010  ; Doors
    dw #$FFFF

preset_prkd19_wrecked_ship_phantoon:
    dw #preset_prkd19_wrecked_ship_basement ; Wrecked Ship: Basement
    dw $078D, $A21C  ; DDB
    dw $079B, $CC6F  ; MDB
    dw $090F, $C000  ; Screen subpixel X position
    dw $0913, $7400  ; Screen subpixel Y position
    dw $0915, $0000  ; Screen Y position in pixels
    dw $0919, $0000  ; Layer 2 Y position
    dw $09CA, $0002  ; Supers
    dw $0AF6, $04CE  ; Samus X
    dw $0AFA, $008B  ; Samus Y
    dw $D8C0, $0030  ; Doors
    dw #$FFFF

preset_prkd19_wrecked_ship_leaving_phantoon:
    dw #preset_prkd19_wrecked_ship_phantoon ; Wrecked Ship: Phantoon
    dw $078D, $A2AC  ; DDB
    dw $079B, $CD13  ; MDB
    dw $07F5, $0003  ; Music Track
    dw $0911, $0000  ; Screen X position in pixels
    dw $0913, $0800  ; Screen subpixel Y position
    dw $0917, $0001  ; Layer 2 X position
    dw $09C2, $00C7  ; Health
    dw $09C6, $000F  ; Missiles
    dw $09CA, $0003  ; Supers
    dw $09CE, $0005  ; Pbs
    dw $0A1C, $0002  ; Samus position/state
    dw $0A1E, $0004  ; More position/state
    dw $0AF6, $006D  ; Samus X
    dw $0AFA, $00BB  ; Samus Y
    dw $D82A, $0100  ; Bosses
    dw $D8C0, $0070  ; Doors
    dw #$FFFF

preset_prkd19_wrecked_ship_shaft_to_supers:
    dw #preset_prkd19_wrecked_ship_leaving_phantoon ; Wrecked Ship: Leaving Phantoon
    dw $078D, $A2C4  ; DDB
    dw $079B, $CC6F  ; MDB
    dw $07F5, $0006  ; Music Track
    dw $090F, $0000  ; Screen subpixel X position
    dw $0911, $0226  ; Screen X position in pixels
    dw $0913, $FC00  ; Screen subpixel Y position
    dw $0917, $019C  ; Layer 2 X position
    dw $09D2, $0003  ; Currently selected item
    dw $0AF6, $02C6  ; Samus X
    dw $0AFA, $006B  ; Samus Y
    dw #$FFFF

preset_prkd19_wrecked_ship_shaft_up:
    dw #preset_prkd19_wrecked_ship_shaft_to_supers ; Wrecked Ship: Shaft To Supers
    dw $078D, $A210  ; DDB
    dw $079B, $CDA8  ; MDB
    dw $090F, $5000  ; Screen subpixel X position
    dw $0911, $0000  ; Screen X position in pixels
    dw $0913, $7400  ; Screen subpixel Y position
    dw $0917, $0000  ; Layer 2 X position
    dw $09CA, $0008  ; Supers
    dw $09CC, $000A  ; Max supers
    dw $09CE, $0004  ; Pbs
    dw $09D2, $0000  ; Currently selected item
    dw $0A1C, $0001  ; Samus position/state
    dw $0A1E, $0008  ; More position/state
    dw $0AF6, $00C7  ; Samus X
    dw $0AFA, $008B  ; Samus Y
    dw $D880, $0020  ; Items
    dw $D8C0, $0074  ; Doors
    dw #$FFFF

preset_prkd19_wrecked_ship_attic:
    dw #preset_prkd19_wrecked_ship_shaft_up ; Wrecked Ship: Shaft Up
    dw $078D, $A2E8  ; DDB
    dw $079B, $CAF6  ; MDB
    dw $090F, $1C00  ; Screen subpixel X position
    dw $0911, $0400  ; Screen X position in pixels
    dw $0913, $CC00  ; Screen subpixel Y position
    dw $0917, $0300  ; Layer 2 X position
    dw $09D2, $0003  ; Currently selected item
    dw $0AF6, $0445  ; Samus X
    dw $0AFA, $006B  ; Samus Y
    dw #$FFFF

preset_prkd19_wrecked_ship_upper_west_ocean:
    dw #preset_prkd19_wrecked_ship_attic ; Wrecked Ship: Attic
    dw $078D, $A228  ; DDB
    dw $079B, $CA52  ; MDB
    dw $090F, $1000  ; Screen subpixel X position
    dw $0911, $0000  ; Screen X position in pixels
    dw $0913, $AC00  ; Screen subpixel Y position
    dw $0915, $001F  ; Screen Y position in pixels
    dw $0917, $0000  ; Layer 2 X position
    dw $0919, $001E  ; Layer 2 Y position
    dw $09C6, $0009  ; Missiles
    dw $09CA, $0006  ; Supers
    dw $09CE, $0003  ; Pbs
    dw $09D2, $0000  ; Currently selected item
    dw $0A1C, $0002  ; Samus position/state
    dw $0A1E, $0004  ; More position/state
    dw $0AF6, $003B  ; Samus X
    dw $0AFA, $008B  ; Samus Y
    dw $D8C0, $0174  ; Doors
    dw #$FFFF

preset_prkd19_wrecked_ship_pancakes_and_wavers:
    dw #preset_prkd19_wrecked_ship_upper_west_ocean ; Wrecked Ship: Upper West Ocean
    dw $078D, $A1E0  ; DDB
    dw $079B, $93FE  ; MDB
    dw $07F3, $000C  ; Music Bank
    dw $07F5, $0005  ; Music Track
    dw $090F, $8000  ; Screen subpixel X position
    dw $0911, $0200  ; Screen X position in pixels
    dw $0913, $4C00  ; Screen subpixel Y position
    dw $0915, $01FD  ; Screen Y position in pixels
    dw $0917, $0100  ; Layer 2 X position
    dw $0919, $0000  ; Layer 2 Y position
    dw $09C6, $000B  ; Missiles
    dw $0A1C, $0001  ; Samus position/state
    dw $0A1E, $0008  ; More position/state
    dw $0AF6, $02C0  ; Samus X
    dw $0AFA, $028B  ; Samus Y
    dw #$FFFF

preset_prkd19_wrecked_ship_bowling_alley:
    dw #preset_prkd19_wrecked_ship_pancakes_and_wavers ; Wrecked Ship: Pancakes and Wavers
    dw $078D, $89E2  ; DDB
    dw $079B, $9461  ; MDB
    dw $090F, $1800  ; Screen subpixel X position
    dw $0911, $0100  ; Screen X position in pixels
    dw $0913, $7400  ; Screen subpixel Y position
    dw $0915, $0000  ; Screen Y position in pixels
    dw $0917, $00C0  ; Layer 2 X position
    dw $09C2, $00BD  ; Health
    dw $09C6, $000D  ; Missiles
    dw $0AF6, $017B  ; Samus X
    dw $0AFA, $0090  ; Samus Y
    dw #$FFFF

preset_prkd19_wrecked_ship_leaving_gravity:
    dw #preset_prkd19_wrecked_ship_bowling_alley ; Wrecked Ship: Bowling Alley
    dw $078D, $A1A4  ; DDB
    dw $079B, $CE40  ; MDB
    dw $07F3, $0030  ; Music Bank
    dw $07F5, $0003  ; Music Track
    dw $090F, $4000  ; Screen subpixel X position
    dw $0911, $0000  ; Screen X position in pixels
    dw $0913, $F800  ; Screen subpixel Y position
    dw $0917, $0001  ; Layer 2 X position
    dw $09A2, $1024  ; Equipped Items
    dw $09A4, $1024  ; Collected Items
    dw $09C2, $0045  ; Health
    dw $0A1C, $009B  ; Samus position/state
    dw $0A1E, $0000  ; More position/state
    dw $0AF6, $0078  ; Samus X
    dw $0AFA, $0088  ; Samus Y
    dw $D880, $00A0  ; Items
    dw #$FFFF

preset_prkd19_wrecked_ship_reverse_moat:
    dw #preset_prkd19_wrecked_ship_leaving_gravity ; Wrecked Ship: Leaving Gravity
    dw $078D, $A300  ; DDB
    dw $079B, $93FE  ; MDB
    dw $07F3, $000C  ; Music Bank
    dw $07F5, $0005  ; Music Track
    dw $090F, $5400  ; Screen subpixel X position
    dw $0913, $0000  ; Screen subpixel Y position
    dw $0915, $040B  ; Screen Y position in pixels
    dw $0917, $0000  ; Layer 2 X position
    dw $09C2, $0043  ; Health
    dw $0A1C, $0002  ; Samus position/state
    dw $0A1E, $0004  ; More position/state
    dw $0AF6, $0068  ; Samus X
    dw $0AFA, $049B  ; Samus Y
    dw #$FFFF

preset_prkd19_wrecked_ship_crateria_kihunters_return:
    dw #preset_prkd19_wrecked_ship_reverse_moat ; Wrecked Ship: Reverse Moat
    dw $078D, $89CA  ; DDB
    dw $079B, $95FF  ; MDB
    dw $090F, $F000  ; Screen subpixel X position
    dw $0915, $0004  ; Screen Y position in pixels
    dw $0919, $0003  ; Layer 2 Y position
    dw $0AF6, $0038  ; Samus X
    dw $0AFA, $0094  ; Samus Y
    dw #$FFFF

preset_prkd19_red_brinstar_revisit_red_brinstar_elevator:
    dw #preset_prkd19_wrecked_ship_crateria_kihunters_return ; Wrecked Ship: Crateria Kihunters Return
    dw $078D, $8A42  ; DDB
    dw $079B, $962A  ; MDB
    dw $07F5, $0003  ; Music Track
    dw $090F, $7000  ; Screen subpixel X position
    dw $0913, $5800  ; Screen subpixel Y position
    dw $0915, $0000  ; Screen Y position in pixels
    dw $0919, $0000  ; Layer 2 Y position
    dw $09C2, $0057  ; Health
    dw $0A1C, $0001  ; Samus position/state
    dw $0A1E, $0008  ; More position/state
    dw $0AF6, $0080  ; Samus X
    dw $0AFA, $00AB  ; Samus Y
    dw #$FFFF

preset_prkd19_red_brinstar_revisit_caterpillars_revisit:
    dw #preset_prkd19_red_brinstar_revisit_red_brinstar_elevator ; Red Brinstar Revisit: Red Brinstar Elevator
    dw $078D, $8B02  ; DDB
    dw $079B, $A322  ; MDB
    dw $07F3, $0012  ; Music Bank
    dw $07F5, $0005  ; Music Track
    dw $0913, $0000  ; Screen subpixel Y position
    dw $0915, $0238  ; Screen Y position in pixels
    dw $0919, $0238  ; Layer 2 Y position
    dw $0A1C, $009B  ; Samus position/state
    dw $0A1E, $0000  ; More position/state
    dw $0AFA, $02AB  ; Samus Y
    dw #$FFFF

preset_prkd19_red_brinstar_revisit_hellway_revisit:
    dw #preset_prkd19_red_brinstar_revisit_caterpillars_revisit ; Red Brinstar Revisit: Caterpillars Revisit
    dw $090F, $A000  ; Screen subpixel X position
    dw $0913, $2800  ; Screen subpixel Y position
    dw $0915, $0500  ; Screen Y position in pixels
    dw $0919, $0500  ; Layer 2 Y position
    dw $09C6, $000C  ; Missiles
    dw $09CA, $0008  ; Supers
    dw $0A1C, $0002  ; Samus position/state
    dw $0A1E, $0004  ; More position/state
    dw $0AF6, $0059  ; Samus X
    dw $0AFA, $058B  ; Samus Y
    dw #$FFFF

preset_prkd19_red_brinstar_revisit_red_tower_down:
    dw #preset_prkd19_red_brinstar_revisit_hellway_revisit ; Red Brinstar Revisit: Hellway Revisit
    dw $078D, $90AE  ; DDB
    dw $079B, $A2F7  ; MDB
    dw $090F, $8000  ; Screen subpixel X position
    dw $0913, $9C00  ; Screen subpixel Y position
    dw $0915, $0000  ; Screen Y position in pixels
    dw $0919, $0000  ; Layer 2 Y position
    dw $09C2, $004F  ; Health
    dw $0AF6, $002D  ; Samus X
    dw $0AFA, $008B  ; Samus Y
    dw #$FFFF

preset_prkd19_red_brinstar_revisit_skree_boost:
    dw #preset_prkd19_red_brinstar_revisit_red_tower_down ; Red Brinstar Revisit: Red Tower Down
    dw $078D, $907E  ; DDB
    dw $079B, $A253  ; MDB
    dw $090F, $2000  ; Screen subpixel X position
    dw $0913, $0000  ; Screen subpixel Y position
    dw $0915, $091A  ; Screen Y position in pixels
    dw $0919, $06D3  ; Layer 2 Y position
    dw $0A1C, $0001  ; Samus position/state
    dw $0A1E, $0008  ; More position/state
    dw $0AF6, $005E  ; Samus X
    dw $0AFA, $098B  ; Samus Y
    dw #$FFFF

preset_prkd19_red_brinstar_revisit_below_spazer:
    dw #preset_prkd19_red_brinstar_revisit_skree_boost ; Red Brinstar Revisit: Skree Boost
    dw $078D, $9042  ; DDB
    dw $079B, $A3DD  ; MDB
    dw $090F, $E000  ; Screen subpixel X position
    dw $0911, $0100  ; Screen X position in pixels
    dw $0913, $7400  ; Screen subpixel Y position
    dw $0915, $0000  ; Screen Y position in pixels
    dw $0917, $00C0  ; Layer 2 X position
    dw $0919, $0000  ; Layer 2 Y position
    dw $09C2, $004E  ; Health
    dw $0AF6, $01DC  ; Samus X
    dw $0AFA, $008B  ; Samus Y
    dw #$FFFF

preset_prkd19_red_brinstar_revisit_leaving_spazer:
    dw #preset_prkd19_red_brinstar_revisit_below_spazer ; Red Brinstar Revisit: Below Spazer
    dw $078D, $9126  ; DDB
    dw $079B, $A447  ; MDB
    dw $07F5, $0003  ; Music Track
    dw $090F, $D000  ; Screen subpixel X position
    dw $0911, $0000  ; Screen X position in pixels
    dw $0913, $0C00  ; Screen subpixel Y position
    dw $0917, $0000  ; Layer 2 X position
    dw $09A6, $1004  ; Equipped Beams
    dw $09A8, $1004  ; Collected Beams
    dw $09CA, $0007  ; Supers
    dw $0A1C, $0002  ; Samus position/state
    dw $0A1E, $0004  ; More position/state
    dw $0AF6, $0053  ; Samus X
    dw $D874, $0504  ; Items
    dw $D8B6, $B008  ; Doors
    dw #$FFFF

preset_prkd19_red_brinstar_revisit_breaking_tube:
    dw #preset_prkd19_red_brinstar_revisit_leaving_spazer ; Red Brinstar Revisit: Leaving Spazer
    dw $078D, $9132  ; DDB
    dw $079B, $A408  ; MDB
    dw $07F5, $0005  ; Music Track
    dw $090F, $5000  ; Screen subpixel X position
    dw $0911, $0100  ; Screen X position in pixels
    dw $0913, $4400  ; Screen subpixel Y position
    dw $0915, $0100  ; Screen Y position in pixels
    dw $0917, $00C0  ; Layer 2 X position
    dw $0919, $00C0  ; Layer 2 Y position
    dw $09CA, $0008  ; Supers
    dw $09D2, $0003  ; Currently selected item
    dw $0A1C, $0001  ; Samus position/state
    dw $0A1E, $0008  ; More position/state
    dw $0AF6, $01B6  ; Samus X
    dw $0AFA, $018B  ; Samus Y
    dw #$FFFF

preset_prkd19_red_brinstar_revisit_business_center_preelev:
    dw #preset_prkd19_red_brinstar_revisit_breaking_tube ; Red Brinstar Revisit: Breaking Tube
    dw $078D, $A384  ; DDB
    dw $079B, $A6A1  ; MDB
    dw $07F5, $0003  ; Music Track
    dw $090F, $4000  ; Screen subpixel X position
    dw $0911, $0000  ; Screen X position in pixels
    dw $0913, $5001  ; Screen subpixel Y position
    dw $0915, $0000  ; Screen Y position in pixels
    dw $09CE, $0002  ; Pbs
    dw $09D2, $0000  ; Currently selected item
    dw $0AF6, $007F  ; Samus X
    dw $0AFA, $008B  ; Samus Y
    dw $D820, $0801  ; Events
    dw #$FFFF

preset_prkd19_upper_norfair_business_center_postelev:
    dw #preset_prkd19_red_brinstar_revisit_business_center_preelev ; Red Brinstar Revisit: Business Center Pre-Elev
    dw $078D, $9246  ; DDB
    dw $079B, $A7DE  ; MDB
    dw $07F3, $0015  ; Music Bank
    dw $07F5, $0005  ; Music Track
    dw $090F, $8000  ; Screen subpixel X position
    dw $0913, $0000  ; Screen subpixel Y position
    dw $0915, $0238  ; Screen Y position in pixels
    dw $0917, $0000  ; Layer 2 X position
    dw $0919, $01AA  ; Layer 2 Y position
    dw $0A1C, $009B  ; Samus position/state
    dw $0A1E, $0000  ; More position/state
    dw $0AF6, $0080  ; Samus X
    dw $0AFA, $02A8  ; Samus Y
    dw #$FFFF

preset_prkd19_upper_norfair_hi_jump_etank:
    dw #preset_prkd19_upper_norfair_business_center_postelev ; Upper Norfair: Business Center Post-Elev
    dw $090F, $FFFF  ; Screen subpixel X position
    dw $0915, $051B  ; Screen Y position in pixels
    dw $0919, $03D4  ; Layer 2 Y position
    dw $09CA, $0007  ; Supers
    dw $0A1C, $0002  ; Samus position/state
    dw $0A1E, $0004  ; More position/state
    dw $0AF6, $0049  ; Samus X
    dw $0AFA, $058B  ; Samus Y
    dw $D8B8, $2000  ; Doors
    dw #$FFFF

preset_prkd19_upper_norfair_leaving_hi_jump:
    dw #preset_prkd19_upper_norfair_hi_jump_etank ; Upper Norfair: Hi Jump E-Tank
    dw $078D, $9426  ; DDB
    dw $079B, $A9E5  ; MDB
    dw $07F5, $0003  ; Music Track
    dw $090F, $E000  ; Screen subpixel X position
    dw $0913, $7800  ; Screen subpixel Y position
    dw $0915, $0000  ; Screen Y position in pixels
    dw $0919, $0000  ; Layer 2 Y position
    dw $09A2, $1124  ; Equipped Items
    dw $09A4, $1124  ; Collected Items
    dw $09C2, $012B  ; Health
    dw $09C4, $012B  ; Max health
    dw $09CA, $0008  ; Supers
    dw $09D2, $0003  ; Currently selected item
    dw $0A1C, $0001  ; Samus position/state
    dw $0A1E, $0008  ; More position/state
    dw $0AF6, $0047  ; Samus X
    dw $0AFA, $00BB  ; Samus Y
    dw $D876, $0120  ; Items
    dw #$FFFF

preset_prkd19_upper_norfair_business_center_revisit:
    dw #preset_prkd19_upper_norfair_leaving_hi_jump ; Upper Norfair: Leaving Hi Jump
    dw $078D, $93F6  ; DDB
    dw $079B, $AA41  ; MDB
    dw $07F5, $0005  ; Music Track
    dw $090F, $7FFF  ; Screen subpixel X position
    dw $0911, $0100  ; Screen X position in pixels
    dw $0913, $27FF  ; Screen subpixel Y position
    dw $0917, $00C0  ; Layer 2 X position
    dw $09C2, $0126  ; Health
    dw $09CE, $0001  ; Pbs
    dw $09D2, $0000  ; Currently selected item
    dw $0AF6, $01BC  ; Samus X
    dw $0AFA, $008B  ; Samus Y
    dw $D8BA, $0001  ; Doors
    dw #$FFFF

preset_prkd19_upper_norfair_ice_beam_gates:
    dw #preset_prkd19_upper_norfair_business_center_revisit ; Upper Norfair: Business Center Revisit
    dw $078D, $941A  ; DDB
    dw $079B, $A7DE  ; MDB
    dw $090F, $5000  ; Screen subpixel X position
    dw $0911, $0000  ; Screen X position in pixels
    dw $0913, $BC00  ; Screen subpixel Y position
    dw $0915, $030D  ; Screen Y position in pixels
    dw $0917, $0000  ; Layer 2 X position
    dw $0919, $0249  ; Layer 2 Y position
    dw $09C6, $000E  ; Missiles
    dw $0A1C, $0002  ; Samus position/state
    dw $0A1E, $0004  ; More position/state
    dw $0AF6, $005A  ; Samus X
    dw $0AFA, $039B  ; Samus Y
    dw $D8B8, $2800  ; Doors
    dw #$FFFF

preset_prkd19_upper_norfair_ice_maze_up:
    dw #preset_prkd19_upper_norfair_ice_beam_gates ; Upper Norfair: Ice Beam Gates
    dw $078D, $931E  ; DDB
    dw $079B, $A75D  ; MDB
    dw $090F, $2000  ; Screen subpixel X position
    dw $0913, $E400  ; Screen subpixel Y position
    dw $0915, $0000  ; Screen Y position in pixels
    dw $0919, $0000  ; Layer 2 Y position
    dw $0AF6, $0033  ; Samus X
    dw $0AFA, $008B  ; Samus Y
    dw #$FFFF

preset_prkd19_upper_norfair_ice_maze_down:
    dw #preset_prkd19_upper_norfair_ice_maze_up ; Upper Norfair: Ice Maze Up
    dw $078D, $937E  ; DDB
    dw $079B, $A890  ; MDB
    dw $07F5, $0003  ; Music Track
    dw $090F, $7000  ; Screen subpixel X position
    dw $0913, $7C00  ; Screen subpixel Y position
    dw $0917, $0001  ; Layer 2 X position
    dw $09A6, $1006  ; Equipped Beams
    dw $09A8, $1006  ; Collected Beams
    dw $0AF6, $00BB  ; Samus X
    dw $D876, $0124  ; Items
    dw #$FFFF

preset_prkd19_upper_norfair_ice_escape:
    dw #preset_prkd19_upper_norfair_ice_maze_down ; Upper Norfair: Ice Maze Down
    dw $078D, $935A  ; DDB
    dw $079B, $A8B9  ; MDB
    dw $07F5, $0005  ; Music Track
    dw $090F, $4000  ; Screen subpixel X position
    dw $0913, $5400  ; Screen subpixel Y position
    dw $0915, $0200  ; Screen Y position in pixels
    dw $0917, $0000  ; Layer 2 X position
    dw $0919, $0180  ; Layer 2 Y position
    dw $0A1C, $0001  ; Samus position/state
    dw $0A1E, $0008  ; More position/state
    dw $0AF6, $00C8  ; Samus X
    dw $0AFA, $028B  ; Samus Y
    dw #$FFFF

preset_prkd19_upper_norfair_precathedral:
    dw #preset_prkd19_upper_norfair_ice_escape ; Upper Norfair: Ice Escape
    dw $078D, $932A  ; DDB
    dw $079B, $A7DE  ; MDB
    dw $090F, $7FFF  ; Screen subpixel X position
    dw $0913, $23FF  ; Screen subpixel Y position
    dw $0915, $031A  ; Screen Y position in pixels
    dw $0919, $0253  ; Layer 2 Y position
    dw $0AF6, $00A6  ; Samus X
    dw $0AFA, $038B  ; Samus Y
    dw #$FFFF

preset_prkd19_upper_norfair_cathedral:
    dw #preset_prkd19_upper_norfair_precathedral ; Upper Norfair: Pre-Cathedral
    dw $078D, $92CA  ; DDB
    dw $079B, $A7B3  ; MDB
    dw $090F, $A000  ; Screen subpixel X position
    dw $0911, $0200  ; Screen X position in pixels
    dw $0913, $D000  ; Screen subpixel Y position
    dw $0915, $0000  ; Screen Y position in pixels
    dw $0917, $0200  ; Layer 2 X position
    dw $0919, $0000  ; Layer 2 Y position
    dw $09C6, $000C  ; Missiles
    dw $09CA, $0007  ; Supers
    dw $09CE, $0003  ; Pbs
    dw $0AF6, $02A5  ; Samus X
    dw $0AFA, $008B  ; Samus Y
    dw $D8B8, $2C00  ; Doors
    dw #$FFFF

preset_prkd19_upper_norfair_rising_tide:
    dw #preset_prkd19_upper_norfair_cathedral ; Upper Norfair: Cathedral
    dw $078D, $92B2  ; DDB
    dw $079B, $A788  ; MDB
    dw $090F, $C000  ; Screen subpixel X position
    dw $0913, $2800  ; Screen subpixel Y position
    dw $0915, $0100  ; Screen Y position in pixels
    dw $0919, $0100  ; Layer 2 Y position
    dw $09C6, $000E  ; Missiles
    dw $09CA, $0006  ; Supers
    dw $0AF6, $02AF  ; Samus X
    dw $0AFA, $018B  ; Samus Y
    dw $D8B8, $2E00  ; Doors
    dw #$FFFF

preset_prkd19_upper_norfair_bubble_mountain:
    dw #preset_prkd19_upper_norfair_rising_tide ; Upper Norfair: Rising Tide
    dw $078D, $929A  ; DDB
    dw $079B, $AFA3  ; MDB
    dw $090F, $3000  ; Screen subpixel X position
    dw $0911, $0400  ; Screen X position in pixels
    dw $0913, $7C00  ; Screen subpixel Y position
    dw $0915, $0000  ; Screen Y position in pixels
    dw $0917, $0300  ; Layer 2 X position
    dw $0919, $0000  ; Layer 2 Y position
    dw $09C2, $0121  ; Health
    dw $0AF6, $04B0  ; Samus X
    dw $0AFA, $008B  ; Samus Y
    dw #$FFFF

preset_prkd19_upper_norfair_bat_cave:
    dw #preset_prkd19_upper_norfair_bubble_mountain ; Upper Norfair: Bubble Mountain
    dw $078D, $973E  ; DDB
    dw $079B, $ACB3  ; MDB
    dw $090F, $E000  ; Screen subpixel X position
    dw $0911, $0100  ; Screen X position in pixels
    dw $0913, $C000  ; Screen subpixel Y position
    dw $0917, $00C0  ; Layer 2 X position
    dw $09C2, $011F  ; Health
    dw $09CA, $0005  ; Supers
    dw $09D2, $0001  ; Currently selected item
    dw $0AF6, $01BA  ; Samus X
    dw $D8BA, $0011  ; Doors
    dw #$FFFF

preset_prkd19_upper_norfair_leaving_speedbooster:
    dw #preset_prkd19_upper_norfair_bat_cave ; Upper Norfair: Bat Cave
    dw $078D, $95B2  ; DDB
    dw $079B, $AD1B  ; MDB
    dw $07F5, $0003  ; Music Track
    dw $090F, $C000  ; Screen subpixel X position
    dw $0911, $0000  ; Screen X position in pixels
    dw $0913, $B000  ; Screen subpixel Y position
    dw $0917, $0000  ; Layer 2 X position
    dw $09A2, $3124  ; Equipped Items
    dw $09A4, $3124  ; Collected Items
    dw $09CA, $0004  ; Supers
    dw $09D2, $0000  ; Currently selected item
    dw $0A1C, $0002  ; Samus position/state
    dw $0A1E, $0004  ; More position/state
    dw $0AF6, $0045  ; Samus X
    dw $D878, $0004  ; Items
    dw $D8BA, $0031  ; Doors
    dw #$FFFF

preset_prkd19_upper_norfair_single_chamber:
    dw #preset_prkd19_upper_norfair_leaving_speedbooster ; Upper Norfair: Leaving Speedbooster
    dw $078D, $97AA  ; DDB
    dw $079B, $ACB3  ; MDB
    dw $07F5, $0005  ; Music Track
    dw $090F, $8FFF  ; Screen subpixel X position
    dw $0911, $0100  ; Screen X position in pixels
    dw $0913, $0000  ; Screen subpixel Y position
    dw $0915, $00FD  ; Screen Y position in pixels
    dw $0917, $00C0  ; Layer 2 X position
    dw $0919, $00BD  ; Layer 2 Y position
    dw $09C2, $0129  ; Health
    dw $09C6, $000F  ; Missiles
    dw $09CA, $000A  ; Supers
    dw $0A1C, $0001  ; Samus position/state
    dw $0A1E, $0008  ; More position/state
    dw $0AF6, $01A8  ; Samus X
    dw $0AFA, $018B  ; Samus Y
    dw $D822, $0020  ; Events
    dw #$FFFF

preset_prkd19_upper_norfair_double_chamber:
    dw #preset_prkd19_upper_norfair_single_chamber ; Upper Norfair: Single Chamber
    dw $078D, $9582  ; DDB
    dw $079B, $AD5E  ; MDB
    dw $090F, $9000  ; Screen subpixel X position
    dw $0911, $0000  ; Screen X position in pixels
    dw $0915, $0124  ; Screen Y position in pixels
    dw $0917, $0000  ; Layer 2 X position
    dw $0919, $00DB  ; Layer 2 Y position
    dw $09C2, $011D  ; Health
    dw $09CA, $0009  ; Supers
    dw $0AF6, $00B5  ; Samus X
    dw $D8BA, $0071  ; Doors
    dw #$FFFF

preset_prkd19_upper_norfair_double_chamber_revisited:
    dw #preset_prkd19_upper_norfair_double_chamber ; Upper Norfair: Double Chamber
    dw $078D, $961E  ; DDB
    dw $079B, $ADDE  ; MDB
    dw $07F5, $0003  ; Music Track
    dw $090F, $2001  ; Screen subpixel X position
    dw $0913, $3800  ; Screen subpixel Y position
    dw $0915, $0000  ; Screen Y position in pixels
    dw $0919, $0000  ; Layer 2 Y position
    dw $09A6, $1007  ; Equipped Beams
    dw $09A8, $1007  ; Collected Beams
    dw $09CA, $0008  ; Supers
    dw $0A1C, $0002  ; Samus position/state
    dw $0A1E, $0004  ; More position/state
    dw $0AF6, $004F  ; Samus X
    dw $0AFA, $008B  ; Samus Y
    dw $D8BA, $00F1  ; Doors
    dw #$FFFF

preset_prkd19_upper_norfair_single_chamber_revisited:
    dw #preset_prkd19_upper_norfair_double_chamber_revisited ; Upper Norfair: Double Chamber Revisited
    dw $078D, $962A  ; DDB
    dw $079B, $ADAD  ; MDB
    dw $07F5, $0005  ; Music Track
    dw $090F, $C000  ; Screen subpixel X position
    dw $0911, $0140  ; Screen X position in pixels
    dw $0913, $2400  ; Screen subpixel Y position
    dw $0915, $011F  ; Screen Y position in pixels
    dw $0917, $00F0  ; Layer 2 X position
    dw $0919, $011F  ; Layer 2 Y position
    dw $0AF6, $01DB  ; Samus X
    dw $0AFA, $01BB  ; Samus Y
    dw #$FFFF

preset_prkd19_upper_norfair_volcano_room:
    dw #preset_prkd19_upper_norfair_single_chamber_revisited ; Upper Norfair: Single Chamber Revisited
    dw $078D, $95EE  ; DDB
    dw $079B, $AE07  ; MDB
    dw $090F, $9E80  ; Screen subpixel X position
    dw $0911, $0300  ; Screen X position in pixels
    dw $0913, $6400  ; Screen subpixel Y position
    dw $0915, $0000  ; Screen Y position in pixels
    dw $0917, $0240  ; Layer 2 X position
    dw $0919, $0000  ; Layer 2 Y position
    dw $09C2, $010E  ; Health
    dw $0A1C, $0001  ; Samus position/state
    dw $0A1E, $0008  ; More position/state
    dw $0AF6, $03AE  ; Samus X
    dw $0AFA, $008B  ; Samus Y
    dw #$FFFF

preset_prkd19_upper_norfair_kronic_boost:
    dw #preset_prkd19_upper_norfair_volcano_room ; Upper Norfair: Volcano Room
    dw $078D, $9642  ; DDB
    dw $079B, $AE32  ; MDB
    dw $090F, $9E00  ; Screen subpixel X position
    dw $0911, $0000  ; Screen X position in pixels
    dw $0913, $1400  ; Screen subpixel Y position
    dw $0915, $0200  ; Screen Y position in pixels
    dw $0917, $0000  ; Layer 2 X position
    dw $0919, $0200  ; Layer 2 Y position
    dw $09C2, $010A  ; Health
    dw $0A1C, $008A  ; Samus position/state
    dw $0A1E, $1504  ; More position/state
    dw $0AF6, $0025  ; Samus X
    dw $0AFA, $028B  ; Samus Y
    dw #$FFFF

preset_prkd19_upper_norfair_lava_spark:
    dw #preset_prkd19_upper_norfair_kronic_boost ; Upper Norfair: Kronic Boost
    dw $078D, $965A  ; DDB
    dw $079B, $AE74  ; MDB
    dw $090F, $0000  ; Screen subpixel X position
    dw $0911, $0100  ; Screen X position in pixels
    dw $0913, $C000  ; Screen subpixel Y position
    dw $0917, $0100  ; Layer 2 X position
    dw $09C6, $000B  ; Missiles
    dw $09CE, $0005  ; Pbs
    dw $0A1C, $0002  ; Samus position/state
    dw $0A1E, $0004  ; More position/state
    dw $0AF6, $01EB  ; Samus X
    dw $D8BA, $01F1  ; Doors
    dw #$FFFF

preset_prkd19_lower_norfair_ln_main_hall:
    dw #preset_prkd19_upper_norfair_lava_spark ; Upper Norfair: Lava Spark
    dw $078D, $96F6  ; DDB
    dw $079B, $B236  ; MDB
    dw $07F3, $0018  ; Music Bank
    dw $090F, $1000  ; Screen subpixel X position
    dw $0911, $0400  ; Screen X position in pixels
    dw $0913, $0000  ; Screen subpixel Y position
    dw $0917, $0300  ; Layer 2 X position
    dw $0919, $0301  ; Layer 2 Y position
    dw $09A6, $1001  ; Equipped Beams
    dw $09C2, $00B4  ; Health
    dw $09D2, $0003  ; Currently selected item
    dw $0A1C, $009B  ; Samus position/state
    dw $0A1E, $0000  ; More position/state
    dw $0AF6, $0480  ; Samus X
    dw $0AF8, $D000  ; Samus subpixel X
    dw $0AFA, $0288  ; Samus Y
    dw #$FFFF

preset_prkd19_lower_norfair_prepillars:
    dw #preset_prkd19_lower_norfair_ln_main_hall ; Lower Norfair: LN Main Hall
    dw $090F, $3000  ; Screen subpixel X position
    dw $0911, $0700  ; Screen X position in pixels
    dw $0913, $9400  ; Screen subpixel Y position
    dw $0917, $0540  ; Layer 2 X position
    dw $0A1C, $0001  ; Samus position/state
    dw $0A1E, $0008  ; More position/state
    dw $0AF6, $079E  ; Samus X
    dw $0AFA, $028B  ; Samus Y
    dw #$FFFF

preset_prkd19_lower_norfair_worst_room_in_the_game:
    dw #preset_prkd19_lower_norfair_prepillars ; Lower Norfair: Pre-Pillars
    dw $078D, $9912  ; DDB
    dw $079B, $B457  ; MDB
    dw $090F, $277F  ; Screen subpixel X position
    dw $0911, $0300  ; Screen X position in pixels
    dw $0913, $E800  ; Screen subpixel Y position
    dw $0915, $0000  ; Screen Y position in pixels
    dw $0917, $0240  ; Layer 2 X position
    dw $0919, $0000  ; Layer 2 Y position
    dw $09C2, $0071  ; Health
    dw $0AF6, $03DB  ; Samus X
    dw $0AFA, $008B  ; Samus Y
    dw #$FFFF

preset_prkd19_lower_norfair_amphitheatre:
    dw #preset_prkd19_lower_norfair_worst_room_in_the_game ; Lower Norfair: Worst Room in the Game
    dw $078D, $994E  ; DDB
    dw $079B, $B4AD  ; MDB
    dw $090F, $4000  ; Screen subpixel X position
    dw $0911, $0000  ; Screen X position in pixels
    dw $0913, $A400  ; Screen subpixel Y position
    dw $0915, $011C  ; Screen Y position in pixels
    dw $0917, $0000  ; Layer 2 X position
    dw $0919, $00D5  ; Layer 2 Y position
    dw $09CE, $0004  ; Pbs
    dw $09D2, $0000  ; Currently selected item
    dw $0AF6, $00B1  ; Samus X
    dw $0AFA, $018B  ; Samus Y
    dw #$FFFF

preset_prkd19_lower_norfair_kihunter_stairs_down:
    dw #preset_prkd19_lower_norfair_amphitheatre ; Lower Norfair: Amphitheatre
    dw $078D, $997E  ; DDB
    dw $079B, $B4E5  ; MDB
    dw $0911, $0270  ; Screen X position in pixels
    dw $0913, $F000  ; Screen subpixel Y position
    dw $0915, $004B  ; Screen Y position in pixels
    dw $0917, $01D4  ; Layer 2 X position
    dw $0919, $0038  ; Layer 2 Y position
    dw $0AF6, $02D0  ; Samus X
    dw $0AFA, $00BB  ; Samus Y
    dw #$FFFF

preset_prkd19_lower_norfair_wasteland:
    dw #preset_prkd19_lower_norfair_kihunter_stairs_down ; Lower Norfair: Kihunter Stairs Down
    dw $078D, $99A2  ; DDB
    dw $079B, $B585  ; MDB
    dw $090F, $A980  ; Screen subpixel X position
    dw $0911, $0200  ; Screen X position in pixels
    dw $0913, $F3FF  ; Screen subpixel Y position
    dw $0915, $0416  ; Screen Y position in pixels
    dw $0917, $0180  ; Layer 2 X position
    dw $0919, $0310  ; Layer 2 Y position
    dw $09C2, $0088  ; Health
    dw $09CE, $0002  ; Pbs
    dw $0A1C, $001D  ; Samus position/state
    dw $0A1E, $0408  ; More position/state
    dw $0AF6, $024C  ; Samus X
    dw $0AFA, $0489  ; Samus Y
    dw $D8BA, $41F1  ; Doors
    dw #$FFFF

preset_prkd19_lower_norfair_metal_ninja_pirates:
    dw #preset_prkd19_lower_norfair_wasteland ; Lower Norfair: Wasteland
    dw $078D, $99EA  ; DDB
    dw $079B, $B5D5  ; MDB
    dw $090F, $1000  ; Screen subpixel X position
    dw $0911, $0100  ; Screen X position in pixels
    dw $0913, $4C00  ; Screen subpixel Y position
    dw $0915, $021C  ; Screen Y position in pixels
    dw $0917, $00C0  ; Layer 2 X position
    dw $0919, $0195  ; Layer 2 Y position
    dw $09C2, $0063  ; Health
    dw $09CA, $0007  ; Supers
    dw $09CE, $0001  ; Pbs
    dw $0A1C, $0002  ; Samus position/state
    dw $0A1E, $0004  ; More position/state
    dw $0AF6, $0169  ; Samus X
    dw $0AFA, $028B  ; Samus Y
    dw $D8BA, $C1F1  ; Doors
    dw #$FFFF

preset_prkd19_lower_norfair_plowerhouse:
    dw #preset_prkd19_lower_norfair_metal_ninja_pirates ; Lower Norfair: Metal Ninja Pirates
    dw $078D, $9A1A  ; DDB
    dw $079B, $B62B  ; MDB
    dw $090F, $0000  ; Screen subpixel X position
    dw $0911, $01F4  ; Screen X position in pixels
    dw $0913, $1C00  ; Screen subpixel Y position
    dw $0915, $0000  ; Screen Y position in pixels
    dw $0917, $0177  ; Layer 2 X position
    dw $0919, $0000  ; Layer 2 Y position
    dw $09C2, $00E9  ; Health
    dw $09CA, $000A  ; Supers
    dw $0AF6, $0254  ; Samus X
    dw $0AFA, $00BB  ; Samus Y
    dw $D8BC, $0001  ; Doors
    dw #$FFFF

preset_prkd19_lower_norfair_ridley_farming_room:
    dw #preset_prkd19_lower_norfair_plowerhouse ; Lower Norfair: Plowerhouse
    dw $078D, $9A32  ; DDB
    dw $079B, $B482  ; MDB
    dw $090F, $9000  ; Screen subpixel X position
    dw $0911, $0000  ; Screen X position in pixels
    dw $0913, $8C00  ; Screen subpixel Y position
    dw $0917, $0000  ; Layer 2 X position
    dw $09C2, $00CD  ; Health
    dw $0AF6, $0047  ; Samus X
    dw $0AFA, $008B  ; Samus Y
    dw #$FFFF

preset_prkd19_lower_norfair_ridley:
    dw #preset_prkd19_lower_norfair_ridley_farming_room ; Lower Norfair: Ridley Farming Room
    dw $078D, $995A  ; DDB
    dw $079B, $B37A  ; MDB
    dw $090F, $1000  ; Screen subpixel X position
    dw $0913, $7C00  ; Screen subpixel Y position
    dw $09C2, $00F2  ; Health
    dw $09C6, $000C  ; Missiles
    dw $09CE, $0004  ; Pbs
    dw $0AF6, $0024  ; Samus X
    dw $D8BA, $D1F1  ; Doors
    dw #$FFFF

preset_prkd19_lower_norfair_nox_ln_main_hall:
    dw #preset_prkd19_upper_norfair_lava_spark ; Upper Norfair: Lava Spark
    dw $078D, $96F6  ; DDB
    dw $079B, $B236  ; MDB
    dw $07F3, $0018  ; Music Bank
    dw $090F, $1000  ; Screen subpixel X position
    dw $0911, $0400  ; Screen X position in pixels
    dw $0913, $0000  ; Screen subpixel Y position
    dw $0917, $0300  ; Layer 2 X position
    dw $0919, $0301  ; Layer 2 Y position
    dw $09C2, $00B4  ; Health
    dw $09D2, $0003  ; Currently selected item
    dw $0A1C, $009B  ; Samus position/state
    dw $0A1E, $0000  ; More position/state
    dw $0AF6, $0480  ; Samus X
    dw $0AFA, $0288  ; Samus Y
    dw #$FFFF

preset_prkd19_lower_norfair_nox_prepillars:
    dw #preset_prkd19_lower_norfair_nox_ln_main_hall ; Lower Norfair: LN Main Hall
    dw $090F, $3000  ; Screen subpixel X position
    dw $0911, $0700  ; Screen X position in pixels
    dw $0913, $9400  ; Screen subpixel Y position
    dw $0917, $0540  ; Layer 2 X position
    dw $0A1C, $0001  ; Samus position/state
    dw $0A1E, $0008  ; More position/state
    dw $0AF6, $079E  ; Samus X
    dw $0AFA, $028B  ; Samus Y
    dw #$FFFF

preset_prkd19_lower_norfair_nox_worst_room_in_the_game:
    dw #preset_prkd19_lower_norfair_nox_prepillars ; Lower Norfair: Pre-Pillars
    dw $078D, $9912  ; DDB
    dw $079B, $B457  ; MDB
    dw $090F, $277F  ; Screen subpixel X position
    dw $0911, $0300  ; Screen X position in pixels
    dw $0913, $E800  ; Screen subpixel Y position
    dw $0915, $0000  ; Screen Y position in pixels
    dw $0917, $0240  ; Layer 2 X position
    dw $0919, $0000  ; Layer 2 Y position
    dw $09C2, $0071  ; Health
    dw $0AF6, $03DB  ; Samus X
    dw $0AFA, $008B  ; Samus Y
    dw #$FFFF

preset_prkd19_lower_norfair_nox_amphitheatre:
    dw #preset_prkd19_lower_norfair_nox_worst_room_in_the_game ; Lower Norfair: Worst Room in the Game
    dw $078D, $994E  ; DDB
    dw $079B, $B4AD  ; MDB
    dw $090F, $4000  ; Screen subpixel X position
    dw $0911, $0000  ; Screen X position in pixels
    dw $0913, $A400  ; Screen subpixel Y position
    dw $0915, $011C  ; Screen Y position in pixels
    dw $0917, $0000  ; Layer 2 X position
    dw $0919, $00D5  ; Layer 2 Y position
    dw $09CE, $0004  ; Pbs
    dw $09D2, $0000  ; Currently selected item
    dw $0AF6, $00B1  ; Samus X
    dw $0AFA, $018B  ; Samus Y
    dw #$FFFF

preset_prkd19_lower_norfair_nox_kihunter_stairs_down:
    dw #preset_prkd19_lower_norfair_nox_amphitheatre ; Lower Norfair: Amphitheatre
    dw $078D, $997E  ; DDB
    dw $079B, $B4E5  ; MDB
    dw $0911, $0270  ; Screen X position in pixels
    dw $0913, $F000  ; Screen subpixel Y position
    dw $0915, $004B  ; Screen Y position in pixels
    dw $0917, $01D4  ; Layer 2 X position
    dw $0919, $0038  ; Layer 2 Y position
    dw $0AF6, $02D0  ; Samus X
    dw $0AFA, $00BB  ; Samus Y
    dw #$FFFF

preset_prkd19_lower_norfair_nox_wasteland:
    dw #preset_prkd19_lower_norfair_nox_kihunter_stairs_down ; Lower Norfair: Kihunter Stairs Down
    dw $078D, $99A2  ; DDB
    dw $079B, $B585  ; MDB
    dw $090F, $A980  ; Screen subpixel X position
    dw $0911, $0200  ; Screen X position in pixels
    dw $0913, $F3FF  ; Screen subpixel Y position
    dw $0915, $0416  ; Screen Y position in pixels
    dw $0917, $0180  ; Layer 2 X position
    dw $0919, $0310  ; Layer 2 Y position
    dw $09C2, $0088  ; Health
    dw $09CE, $0002  ; Pbs
    dw $0A1C, $001D  ; Samus position/state
    dw $0A1E, $0408  ; More position/state
    dw $0AF6, $024C  ; Samus X
    dw $0AFA, $0489  ; Samus Y
    dw $D8BA, $41F1  ; Doors
    dw #$FFFF

preset_prkd19_lower_norfair_nox_metal_ninja_pirates:
    dw #preset_prkd19_lower_norfair_nox_wasteland ; Lower Norfair: Wasteland
    dw $078D, $99EA  ; DDB
    dw $079B, $B5D5  ; MDB
    dw $090F, $1000  ; Screen subpixel X position
    dw $0911, $0100  ; Screen X position in pixels
    dw $0913, $4C00  ; Screen subpixel Y position
    dw $0915, $021C  ; Screen Y position in pixels
    dw $0917, $00C0  ; Layer 2 X position
    dw $0919, $0195  ; Layer 2 Y position
    dw $09C2, $0063  ; Health
    dw $09CA, $0007  ; Supers
    dw $09CE, $0001  ; Pbs
    dw $0A1C, $0002  ; Samus position/state
    dw $0A1E, $0004  ; More position/state
    dw $0AF6, $0169  ; Samus X
    dw $0AFA, $028B  ; Samus Y
    dw $D8BA, $C1F1  ; Doors
    dw #$FFFF

preset_prkd19_lower_norfair_nox_plowerhouse:
    dw #preset_prkd19_lower_norfair_nox_metal_ninja_pirates ; Lower Norfair: Metal Ninja Pirates
    dw $078D, $9A1A  ; DDB
    dw $079B, $B62B  ; MDB
    dw $090F, $0000  ; Screen subpixel X position
    dw $0911, $01F4  ; Screen X position in pixels
    dw $0913, $1C00  ; Screen subpixel Y position
    dw $0915, $0000  ; Screen Y position in pixels
    dw $0917, $0177  ; Layer 2 X position
    dw $0919, $0000  ; Layer 2 Y position
    dw $09C2, $00E9  ; Health
    dw $09CA, $000A  ; Supers
    dw $0AF6, $0254  ; Samus X
    dw $0AFA, $00BB  ; Samus Y
    dw $D8BC, $0001  ; Doors
    dw #$FFFF

preset_prkd19_lower_norfair_nox_ridley_farming_room:
    dw #preset_prkd19_lower_norfair_nox_plowerhouse ; Lower Norfair: Plowerhouse
    dw $078D, $9A32  ; DDB
    dw $079B, $B482  ; MDB
    dw $090F, $9000  ; Screen subpixel X position
    dw $0911, $0000  ; Screen X position in pixels
    dw $0913, $8C00  ; Screen subpixel Y position
    dw $0917, $0000  ; Layer 2 X position
    dw $09C2, $00CD  ; Health
    dw $0AF6, $0047  ; Samus X
    dw $0AFA, $008B  ; Samus Y
    dw #$FFFF

preset_prkd19_lower_norfair_nox_ridley:
    dw #preset_prkd19_lower_norfair_nox_ridley_farming_room ; Lower Norfair: Ridley Farming Room
    dw $078D, $995A  ; DDB
    dw $079B, $B37A  ; MDB
    dw $090F, $1000  ; Screen subpixel X position
    dw $0913, $7C00  ; Screen subpixel Y position
    dw $09C2, $00F2  ; Health
    dw $09C6, $000F  ; Missiles
    dw $09CE, $0004  ; Pbs
    dw $0AF6, $0024  ; Samus X
    dw $D8BA, $D1F1  ; Doors
    dw #$FFFF

preset_prkd19_lower_norfair_leaving_ridley:
    dw #preset_prkd19_lower_norfair_ridley ; Lower Norfair: Ridley
    dw $078D, $98CA  ; DDB
    dw $079B, $B32E  ; MDB
    dw $07F3, $0024  ; Music Bank
    dw $07F5, $0003  ; Music Track
    dw $090F, $C000  ; Screen subpixel X position
    dw $0913, $C400  ; Screen subpixel Y position
    dw $0915, $011F  ; Screen Y position in pixels
    dw $0917, $0001  ; Layer 2 X position
    dw $0919, $00D7  ; Layer 2 Y position
    dw $09C6, $0004  ; Missiles
    dw $09CA, $0003  ; Supers
    dw $09CE, $0005  ; Pbs
    dw $0A1C, $0001  ; Samus position/state
    dw $0A1E, $0008  ; More position/state
    dw $0AF6, $005F  ; Samus X
    dw $0AFA, $019B  ; Samus Y
    dw $D82A, $0101  ; Bosses
    dw #$FFFF

preset_prkd19_lower_norfair_reverse_plowerhouse:
    dw #preset_prkd19_lower_norfair_leaving_ridley ; Lower Norfair: Leaving Ridley
    dw $078D, $98BE  ; DDB
    dw $079B, $B37A  ; MDB
    dw $07F3, $0018  ; Music Bank
    dw $07F5, $0005  ; Music Track
    dw $090F, $F000  ; Screen subpixel X position
    dw $0911, $0200  ; Screen X position in pixels
    dw $0913, $0400  ; Screen subpixel Y position
    dw $0915, $0000  ; Screen Y position in pixels
    dw $0917, $0180  ; Layer 2 X position
    dw $0919, $0000  ; Layer 2 Y position
    dw $09C2, $00F1  ; Health
    dw $09C6, $0009  ; Missiles
    dw $0AF6, $02B1  ; Samus X
    dw $0AFA, $008B  ; Samus Y
    dw $D8BA, $D5F1  ; Doors
    dw #$FFFF

preset_prkd19_lower_norfair_wasteland_revisit:
    dw #preset_prkd19_lower_norfair_reverse_plowerhouse ; Lower Norfair: Reverse Plowerhouse
    dw $078D, $9966  ; DDB
    dw $079B, $B62B  ; MDB
    dw $090F, $6000  ; Screen subpixel X position
    dw $0913, $8800  ; Screen subpixel Y position
    dw $09C2, $00C8  ; Health
    dw $0AF6, $02DC  ; Samus X
    dw #$FFFF

preset_prkd19_lower_norfair_kihunter_stairs_up:
    dw #preset_prkd19_lower_norfair_wasteland_revisit ; Lower Norfair: Wasteland Revisit
    dw $078D, $9A3E  ; DDB
    dw $079B, $B5D5  ; MDB
    dw $090F, $0000  ; Screen subpixel X position
    dw $0911, $0500  ; Screen X position in pixels
    dw $0913, $B000  ; Screen subpixel Y position
    dw $0917, $03C0  ; Layer 2 X position
    dw $09C2, $0099  ; Health
    dw $09CE, $0004  ; Pbs
    dw $0AF6, $055B  ; Samus X
    dw $0AFA, $009B  ; Samus Y
    dw #$FFFF

preset_prkd19_lower_norfair_fire_flea_room:
    dw #preset_prkd19_lower_norfair_kihunter_stairs_up ; Lower Norfair: Kihunter Stairs Up
    dw $078D, $9A26  ; DDB
    dw $079B, $B585  ; MDB
    dw $090F, $2001  ; Screen subpixel X position
    dw $0911, $0000  ; Screen X position in pixels
    dw $0913, $4C00  ; Screen subpixel Y position
    dw $0915, $000D  ; Screen Y position in pixels
    dw $0917, $0000  ; Layer 2 X position
    dw $0919, $0009  ; Layer 2 Y position
    dw $0AF6, $009C  ; Samus X
    dw $0AFA, $008B  ; Samus Y
    dw #$FFFF

preset_prkd19_lower_norfair_springball_maze:
    dw #preset_prkd19_lower_norfair_fire_flea_room ; Lower Norfair: Fire Flea Room
    dw $078D, $9A02  ; DDB
    dw $079B, $B6EE  ; MDB
    dw $090F, $0000  ; Screen subpixel X position
    dw $0911, $0100  ; Screen X position in pixels
    dw $0913, $0000  ; Screen subpixel Y position
    dw $0915, $0000  ; Screen Y position in pixels
    dw $0917, $0100  ; Layer 2 X position
    dw $0919, $000D  ; Layer 2 Y position
    dw $0A1C, $0002  ; Samus position/state
    dw $0A1E, $0004  ; More position/state
    dw $0AF6, $016C  ; Samus X
    dw #$FFFF

preset_prkd19_lower_norfair_three_musketeers:
    dw #preset_prkd19_lower_norfair_springball_maze ; Lower Norfair: Springball Maze
    dw $078D, $9A92  ; DDB
    dw $079B, $B510  ; MDB
    dw $090F, $E100  ; Screen subpixel X position
    dw $0911, $0000  ; Screen X position in pixels
    dw $0913, $5400  ; Screen subpixel Y position
    dw $0917, $0000  ; Layer 2 X position
    dw $0919, $0000  ; Layer 2 Y position
    dw $0AF6, $0069  ; Samus X
    dw #$FFFF

preset_prkd19_lower_norfair_single_chamber_final:
    dw #preset_prkd19_lower_norfair_three_musketeers ; Lower Norfair: Three Musketeers
    dw $078D, $99AE  ; DDB
    dw $079B, $B656  ; MDB
    dw $090F, $E000  ; Screen subpixel X position
    dw $0911, $0100  ; Screen X position in pixels
    dw $0913, $5800  ; Screen subpixel Y position
    dw $0915, $0002  ; Screen Y position in pixels
    dw $0917, $00C0  ; Layer 2 X position
    dw $0919, $0001  ; Layer 2 Y position
    dw $09C2, $0062  ; Health
    dw $0AF6, $016F  ; Samus X
    dw #$FFFF

preset_prkd19_lower_norfair_bubble_mountain_final:
    dw #preset_prkd19_lower_norfair_single_chamber_final ; Lower Norfair: Single Chamber Final
    dw $078D, $9A4A  ; DDB
    dw $079B, $AD5E  ; MDB
    dw $07F3, $0015  ; Music Bank
    dw $090F, $B000  ; Screen subpixel X position
    dw $0911, $0000  ; Screen X position in pixels
    dw $0913, $D800  ; Screen subpixel Y position
    dw $0915, $001B  ; Screen Y position in pixels
    dw $0917, $0000  ; Layer 2 X position
    dw $0919, $0014  ; Layer 2 Y position
    dw $09C2, $0056  ; Health
    dw $0AF6, $007D  ; Samus X
    dw #$FFFF

preset_prkd19_lower_norfair_frog_speedway:
    dw #preset_prkd19_lower_norfair_bubble_mountain_final ; Lower Norfair: Bubble Mountain Final
    dw $078D, $956A  ; DDB
    dw $079B, $AF72  ; MDB
    dw $090F, $0000  ; Screen subpixel X position
    dw $0911, $001B  ; Screen X position in pixels
    dw $0913, $7C00  ; Screen subpixel Y position
    dw $0915, $0000  ; Screen Y position in pixels
    dw $0917, $0014  ; Layer 2 X position
    dw $0919, $0000  ; Layer 2 Y position
    dw $09C6, $0008  ; Missiles
    dw $09CA, $0004  ; Supers
    dw $09CE, $0003  ; Pbs
    dw $0AF6, $00BB  ; Samus X
    dw #$FFFF

preset_prkd19_lower_norfair_business_center_final:
    dw #preset_prkd19_lower_norfair_frog_speedway ; Lower Norfair: Frog Speedway
    dw $078D, $97DA  ; DDB
    dw $079B, $B167  ; MDB
    dw $090F, $9000  ; Screen subpixel X position
    dw $0911, $0000  ; Screen X position in pixels
    dw $0913, $1800  ; Screen subpixel Y position
    dw $0917, $0000  ; Layer 2 X position
    dw $0AF6, $0032  ; Samus X
    dw #$FFFF

preset_prkd19_kraid_entering_kraids_lair:
    dw #preset_prkd19_lower_norfair_business_center_final ; Lower Norfair: Business Center Final
    dw $078D, $92EE  ; DDB
    dw $079B, $A6A1  ; MDB
    dw $07F3, $0012  ; Music Bank
    dw $07F5, $0003  ; Music Track
    dw $090F, $2000  ; Screen subpixel X position
    dw $0913, $0000  ; Screen subpixel Y position
    dw $09C2, $006A  ; Health
    dw $09CA, $0006  ; Supers
    dw $09D2, $0002  ; Currently selected item
    dw $0A1C, $009B  ; Samus position/state
    dw $0A1E, $0000  ; More position/state
    dw $0AF6, $0080  ; Samus X
    dw $0AFA, $0086  ; Samus Y
    dw #$FFFF

preset_prkd19_kraid_kraid_kihunters:
    dw #preset_prkd19_kraid_entering_kraids_lair ; Kraid: Entering Kraids Lair
    dw $078D, $923A  ; DDB
    dw $079B, $A471  ; MDB
    dw $07F5, $0005  ; Music Track
    dw $090F, $C000  ; Screen subpixel X position
    dw $0911, $0100  ; Screen X position in pixels
    dw $0913, $4FFF  ; Screen subpixel Y position
    dw $0915, $0100  ; Screen Y position in pixels
    dw $0917, $00C0  ; Layer 2 X position
    dw $0919, $0100  ; Layer 2 Y position
    dw $09C2, $006F  ; Health
    dw $09CA, $0005  ; Supers
    dw $09D2, $0000  ; Currently selected item
    dw $0A1C, $0001  ; Samus position/state
    dw $0A1E, $0008  ; More position/state
    dw $0AF6, $016B  ; Samus X
    dw $0AFA, $018B  ; Samus Y
    dw #$FFFF

preset_prkd19_kraid_mini_kraid:
    dw #preset_prkd19_kraid_kraid_kihunters ; Kraid: Kraid Kihunters
    dw $078D, $9156  ; DDB
    dw $079B, $A4DA  ; MDB
    dw $090F, $7000  ; Screen subpixel X position
    dw $0913, $EBFF  ; Screen subpixel Y position
    dw $0915, $00FA  ; Screen Y position in pixels
    dw $0919, $00FA  ; Layer 2 Y position
    dw #$FFFF

preset_prkd19_kraid_kraid:
    dw #preset_prkd19_kraid_mini_kraid ; Kraid: Mini Kraid
    dw $078D, $919E  ; DDB
    dw $079B, $A56B  ; MDB
    dw $07F3, $0027  ; Music Bank
    dw $07F5, $0006  ; Music Track
    dw $090F, $4000  ; Screen subpixel X position
    dw $0913, $D400  ; Screen subpixel Y position
    dw $0915, $0100  ; Screen Y position in pixels
    dw $0917, $0100  ; Layer 2 X position
    dw $0919, $0100  ; Layer 2 Y position
    dw $09C2, $006B  ; Health
    dw $09C6, $0006  ; Missiles
    dw $09CA, $0008  ; Supers
    dw $0AF6, $01BF  ; Samus X
    dw $D8B8, $2E24  ; Doors
    dw #$FFFF

preset_prkd19_kraid_leaving_varia:
    dw #preset_prkd19_kraid_kraid ; Kraid: Kraid
    dw $078D, $91DA  ; DDB
    dw $079B, $A6E2  ; MDB
    dw $07F5, $0003  ; Music Track
    dw $090F, $2000  ; Screen subpixel X position
    dw $0911, $0000  ; Screen X position in pixels
    dw $0913, $0800  ; Screen subpixel Y position
    dw $0915, $0000  ; Screen Y position in pixels
    dw $0917, $0000  ; Layer 2 X position
    dw $0919, $0000  ; Layer 2 Y position
    dw $09A2, $3125  ; Equipped Items
    dw $09A4, $3125  ; Collected Items
    dw $09C2, $00C0  ; Health
    dw $09C6, $000E  ; Missiles
    dw $09CA, $0007  ; Supers
    dw $09CE, $0005  ; Pbs
    dw $0A1C, $009B  ; Samus position/state
    dw $0A1E, $0000  ; More position/state
    dw $0AF6, $0078  ; Samus X
    dw $0AFA, $0088  ; Samus Y
    dw $D828, $0104  ; Bosses
    dw $D876, $0125  ; Items
    dw $D8B8, $2E64  ; Doors
    dw #$FFFF

preset_prkd19_kraid_mini_kraid_revisit:
    dw #preset_prkd19_kraid_leaving_varia ; Kraid: Leaving Varia
    dw $078D, $91CE  ; DDB
    dw $079B, $A56B  ; MDB
    dw $090F, $4000  ; Screen subpixel X position
    dw $0913, $3800  ; Screen subpixel Y position
    dw $0915, $0100  ; Screen Y position in pixels
    dw $0919, $0100  ; Layer 2 Y position
    dw $09C2, $00BC  ; Health
    dw $09D2, $0002  ; Currently selected item
    dw $0A1C, $0002  ; Samus position/state
    dw $0A1E, $0004  ; More position/state
    dw $0AF6, $0060  ; Samus X
    dw $0AFA, $018B  ; Samus Y
    dw $D8B8, $2EE4  ; Doors
    dw #$FFFF

preset_prkd19_kraid_kraid_kihunters_revisit:
    dw #preset_prkd19_kraid_mini_kraid_revisit ; Kraid: Mini Kraid Revisit
    dw $078D, $91AA  ; DDB
    dw $079B, $A521  ; MDB
    dw $090F, $0000  ; Screen subpixel X position
    dw $0911, $012C  ; Screen X position in pixels
    dw $0913, $EC00  ; Screen subpixel Y position
    dw $0915, $0000  ; Screen Y position in pixels
    dw $0917, $00E1  ; Layer 2 X position
    dw $0919, $0000  ; Layer 2 Y position
    dw $09C6, $000B  ; Missiles
    dw $09CA, $000A  ; Supers
    dw $09D2, $0000  ; Currently selected item
    dw $0AF6, $01CC  ; Samus X
    dw $0AFA, $00AB  ; Samus Y
    dw $D8B8, $2EEC  ; Doors
    dw #$FFFF

preset_prkd19_kraid_leaving_kraids_lair:
    dw #preset_prkd19_kraid_kraid_kihunters_revisit ; Kraid: Kraid Kihunters Revisit
    dw $078D, $916E  ; DDB
    dw $079B, $A471  ; MDB
    dw $07F3, $0012  ; Music Bank
    dw $07F5, $0005  ; Music Track
    dw $090F, $C001  ; Screen subpixel X position
    dw $0911, $0000  ; Screen X position in pixels
    dw $0913, $F000  ; Screen subpixel Y position
    dw $0915, $001B  ; Screen Y position in pixels
    dw $0917, $0000  ; Layer 2 X position
    dw $0919, $001B  ; Layer 2 Y position
    dw $09C2, $00C1  ; Health
    dw $09C6, $000D  ; Missiles
    dw $0AF6, $0025  ; Samus X
    dw $0AFA, $008B  ; Samus Y
    dw #$FFFF

preset_prkd19_maridia_maridia_tube_revisit:
    dw #preset_prkd19_kraid_leaving_kraids_lair ; Kraid: Leaving Kraids Lair
    dw $078D, $922E  ; DDB
    dw $079B, $CF80  ; MDB
    dw $090F, $D000  ; Screen subpixel X position
    dw $0913, $6400  ; Screen subpixel Y position
    dw $0915, $0100  ; Screen Y position in pixels
    dw $0919, $0100  ; Layer 2 Y position
    dw $09CA, $0009  ; Supers
    dw $0AF6, $00B3  ; Samus X
    dw $0AFA, $018B  ; Samus Y
    dw #$FFFF

preset_prkd19_maridia_fish_tank:
    dw #preset_prkd19_maridia_maridia_tube_revisit ; Maridia: Maridia Tube Revisit
    dw $078D, $A330  ; DDB
    dw $079B, $CFC9  ; MDB
    dw $07F3, $001B  ; Music Bank
    dw $07F5, $0006  ; Music Track
    dw $090F, $BFFF  ; Screen subpixel X position
    dw $0911, $00F5  ; Screen X position in pixels
    dw $0913, $1C00  ; Screen subpixel Y position
    dw $0915, $05ED  ; Screen Y position in pixels
    dw $0917, $00B7  ; Layer 2 X position
    dw $0919, $0471  ; Layer 2 Y position
    dw $0A1C, $0001  ; Samus position/state
    dw $0A1E, $0008  ; More position/state
    dw $0AF6, $0162  ; Samus X
    dw $0AFA, $068B  ; Samus Y
    dw #$FFFF

preset_prkd19_maridia_mt_everest:
    dw #preset_prkd19_maridia_fish_tank ; Maridia: Fish Tank
    dw $078D, $A3F0  ; DDB
    dw $079B, $D0B9  ; MDB
    dw $090F, $2000  ; Screen subpixel X position
    dw $0911, $0109  ; Screen X position in pixels
    dw $0913, $6800  ; Screen subpixel Y position
    dw $0915, $031F  ; Screen Y position in pixels
    dw $0917, $00C6  ; Layer 2 X position
    dw $0919, $0257  ; Layer 2 Y position
    dw $0AF6, $019D  ; Samus X
    dw $0AFA, $03BB  ; Samus Y
    dw #$FFFF

preset_prkd19_maridia_crab_shaft:
    dw #preset_prkd19_maridia_mt_everest ; Maridia: Mt Everest
    dw $090F, $6000  ; Screen subpixel X position
    dw $0911, $0500  ; Screen X position in pixels
    dw $0913, $9C01  ; Screen subpixel Y position
    dw $0915, $0000  ; Screen Y position in pixels
    dw $0917, $03C0  ; Layer 2 X position
    dw $0919, $0000  ; Layer 2 Y position
    dw $09C2, $0086  ; Health
    dw $0A1C, $0089  ; Samus position/state
    dw $0A1E, $1508  ; More position/state
    dw $0AF6, $05DB  ; Samus X
    dw $0AFA, $008B  ; Samus Y
    dw #$FFFF

preset_prkd19_maridia_aqueduct:
    dw #preset_prkd19_maridia_crab_shaft ; Maridia: Crab Shaft
    dw $078D, $A468  ; DDB
    dw $079B, $D1A3  ; MDB
    dw $090F, $5001  ; Screen subpixel X position
    dw $0911, $0006  ; Screen X position in pixels
    dw $0913, $F001  ; Screen subpixel Y position
    dw $0915, $0300  ; Screen Y position in pixels
    dw $0917, $0006  ; Layer 2 X position
    dw $0919, $0240  ; Layer 2 Y position
    dw $09D2, $0002  ; Currently selected item
    dw $0A1C, $0001  ; Samus position/state
    dw $0A1E, $0008  ; More position/state
    dw $0AF6, $0078  ; Samus X
    dw $0AFA, $03AB  ; Samus Y
    dw #$FFFF

preset_prkd19_maridia_botwoon_hallway:
    dw #preset_prkd19_maridia_aqueduct ; Maridia: Aqueduct
    dw $078D, $A4C8  ; DDB
    dw $079B, $D5A7  ; MDB
    dw $07F5, $0005  ; Music Track
    dw $090F, $0000  ; Screen subpixel X position
    dw $0911, $0000  ; Screen X position in pixels
    dw $0913, $6000  ; Screen subpixel Y position
    dw $0915, $0000  ; Screen Y position in pixels
    dw $0917, $0000  ; Layer 2 X position
    dw $0919, $0000  ; Layer 2 Y position
    dw $09CA, $0008  ; Supers
    dw $09CE, $0004  ; Pbs
    dw $09D2, $0000  ; Currently selected item
    dw $0A1C, $0002  ; Samus position/state
    dw $0A1E, $0004  ; More position/state
    dw $0AF6, $009F  ; Samus X
    dw $0AFA, $006B  ; Samus Y
    dw $D8C0, $8174  ; Doors
    dw #$FFFF

preset_prkd19_maridia_botwoon:
    dw #preset_prkd19_maridia_botwoon_hallway ; Maridia: Botwoon Hallway
    dw $078D, $A72C  ; DDB
    dw $079B, $D617  ; MDB
    dw $090F, $A000  ; Screen subpixel X position
    dw $0911, $02FF  ; Screen X position in pixels
    dw $0913, $C800  ; Screen subpixel Y position
    dw $0915, $0001  ; Screen Y position in pixels
    dw $0917, $023F  ; Layer 2 X position
    dw $0919, $0001  ; Layer 2 Y position
    dw $09D2, $0003  ; Currently selected item
    dw $0A1C, $0001  ; Samus position/state
    dw $0A1E, $0008  ; More position/state
    dw $0AF6, $039D  ; Samus X
    dw $0AFA, $008B  ; Samus Y
    dw #$FFFF

preset_prkd19_maridia_botwoon_etank:
    dw #preset_prkd19_maridia_botwoon ; Maridia: Botwoon
    dw $078D, $A774  ; DDB
    dw $079B, $D95E  ; MDB
    dw $07F3, $002A  ; Music Bank
    dw $07F5, $0003  ; Music Track
    dw $090F, $8000  ; Screen subpixel X position
    dw $0911, $0100  ; Screen X position in pixels
    dw $0913, $7800  ; Screen subpixel Y position
    dw $0915, $0000  ; Screen Y position in pixels
    dw $0917, $0100  ; Layer 2 X position
    dw $0919, $0000  ; Layer 2 Y position
    dw $09C2, $00C0  ; Health
    dw $09C6, $0009  ; Missiles
    dw $09CA, $0004  ; Supers
    dw $09CE, $0005  ; Pbs
    dw $09D2, $0000  ; Currently selected item
    dw $0AF6, $01C5  ; Samus X
    dw $D82C, $0002  ; Bosses
    dw #$FFFF

preset_prkd19_maridia_halfie_setup:
    dw #preset_prkd19_maridia_botwoon_etank ; Maridia: Botwoon E-Tank
    dw $078D, $A918  ; DDB
    dw $079B, $D7E4  ; MDB
    dw $07F3, $001B  ; Music Bank
    dw $07F5, $0005  ; Music Track
    dw $090F, $B000  ; Screen subpixel X position
    dw $0911, $0002  ; Screen X position in pixels
    dw $0913, $8000  ; Screen subpixel Y position
    dw $0915, $001F  ; Screen Y position in pixels
    dw $0917, $0001  ; Layer 2 X position
    dw $0919, $001F  ; Layer 2 Y position
    dw $09C2, $018F  ; Health
    dw $09C4, $018F  ; Max health
    dw $09C6, $000F  ; Missiles
    dw $0A1C, $009B  ; Samus position/state
    dw $0A1E, $0000  ; More position/state
    dw $0AF6, $0099  ; Samus X
    dw $0AFA, $0098  ; Samus Y
    dw $D882, $0100  ; Items
    dw #$FFFF

preset_prkd19_maridia_draygon:
    dw #preset_prkd19_maridia_halfie_setup ; Maridia: Halfie Setup
    dw $078D, $A7F8  ; DDB
    dw $079B, $D78F  ; MDB
    dw $090F, $5000  ; Screen subpixel X position
    dw $0911, $0000  ; Screen X position in pixels
    dw $0913, $0800  ; Screen subpixel Y position
    dw $0915, $0200  ; Screen Y position in pixels
    dw $0917, $0000  ; Layer 2 X position
    dw $0919, $0180  ; Layer 2 Y position
    dw $09C2, $0110  ; Health
    dw $09CA, $0002  ; Supers
    dw $0A1C, $0002  ; Samus position/state
    dw $0A1E, $0004  ; More position/state
    dw $0AF6, $0062  ; Samus X
    dw $0AFA, $028B  ; Samus Y
    dw $D8C2, $0C00  ; Doors
    dw #$FFFF

preset_prkd19_maridia_spikesuit_reverse_halfie:
    dw #preset_prkd19_maridia_draygon ; Maridia: Draygon
    dw $078D, $A96C  ; DDB
    dw $090F, $1000  ; Screen subpixel X position
    dw $0913, $0000  ; Screen subpixel Y position
    dw $0915, $0003  ; Screen Y position in pixels
    dw $0919, $0002  ; Layer 2 Y position
    dw $09C2, $00D8  ; Health
    dw $09C6, $000A  ; Missiles
    dw $09CA, $0003  ; Supers
    dw $0A68, $0001  ; Flash suit
    dw $0AF6, $003F  ; Samus X
    dw $0AFA, $008B  ; Samus Y
    dw $D82C, $0003  ; Bosses
    dw $D8C2, $4C00  ; Doors
    dw #$FFFF

preset_prkd19_maridia_reverse_colosseum:
    dw #preset_prkd19_maridia_spikesuit_reverse_halfie ; Maridia: Spikesuit Reverse Halfie
    dw $0A68, $0000  ; Flash suit
    dw #$FFFF

preset_prkd19_maridia_reverse_halfie_climb:
    dw #preset_prkd19_maridia_reverse_colosseum ; Maridia: Reverse Colosseum
    dw $078D, $A834  ; DDB
    dw $079B, $D72A  ; MDB
    dw $090F, $8000  ; Screen subpixel X position
    dw $0913, $F001  ; Screen subpixel Y position
    dw $0915, $0000  ; Screen Y position in pixels
    dw $0919, $0000  ; Layer 2 Y position
    dw $09C2, $0066  ; Health
    dw $0AF6, $0042  ; Samus X
    dw #$FFFF

preset_prkd19_maridia_reverse_botwoon_etank:
    dw #preset_prkd19_maridia_reverse_halfie_climb ; Maridia: Reverse Halfie Climb
    dw $078D, $A7E0  ; DDB
    dw $079B, $D913  ; MDB
    dw $090F, $0000  ; Screen subpixel X position
    dw $0913, $2800  ; Screen subpixel Y position
    dw $0915, $0200  ; Screen Y position in pixels
    dw $0919, $0200  ; Layer 2 Y position
    dw $0AF6, $00AE  ; Samus X
    dw $0AFA, $028B  ; Samus Y
    dw #$FFFF

preset_prkd19_maridia_reverse_botwoon_hallway:
    dw #preset_prkd19_maridia_reverse_botwoon_etank ; Maridia: Reverse Botwoon E-Tank
    dw $078D, $A84C  ; DDB
    dw $079B, $D95E  ; MDB
    dw $07F5, $0003  ; Music Track
    dw $090F, $1F80  ; Screen subpixel X position
    dw $0913, $D800  ; Screen subpixel Y position
    dw $0915, $0000  ; Screen Y position in pixels
    dw $0919, $0000  ; Layer 2 Y position
    dw $0AF6, $0025  ; Samus X
    dw $0AFA, $00BB  ; Samus Y
    dw #$FFFF

preset_prkd19_maridia_reverse_crab_shaft:
    dw #preset_prkd19_maridia_reverse_botwoon_hallway ; Maridia: Reverse Botwoon Hallway
    dw $078D, $A768  ; DDB
    dw $079B, $D5A7  ; MDB
    dw $07F5, $0005  ; Music Track
    dw $090F, $8000  ; Screen subpixel X position
    dw $0913, $6800  ; Screen subpixel Y position
    dw $0915, $00FE  ; Screen Y position in pixels
    dw $0919, $00FE  ; Layer 2 Y position
    dw $0AF6, $0069  ; Samus X
    dw $0AFA, $018B  ; Samus Y
    dw $D8C2, $6C00  ; Doors
    dw #$FFFF

preset_prkd19_maridia_mt_everest_revisit:
    dw #preset_prkd19_maridia_reverse_crab_shaft ; Maridia: Reverse Crab Shaft
    dw $078D, $A708  ; DDB
    dw $079B, $D1A3  ; MDB
    dw $07F5, $0006  ; Music Track
    dw $090F, $0000  ; Screen subpixel X position
    dw $0913, $A800  ; Screen subpixel Y position
    dw $0915, $0201  ; Screen Y position in pixels
    dw $0919, $0180  ; Layer 2 Y position
    dw $0AF6, $0073  ; Samus X
    dw $0AFA, $028B  ; Samus Y
    dw #$FFFF

preset_prkd19_backtracking_red_brinstar_green_gate:
    dw #preset_prkd19_maridia_mt_everest_revisit ; Maridia: Mt Everest Revisit
    dw $078D, $A42C  ; DDB
    dw $079B, $D104  ; MDB
    dw $090F, $C000  ; Screen subpixel X position
    dw $0911, $001A  ; Screen X position in pixels
    dw $0913, $8800  ; Screen subpixel Y position
    dw $0915, $0000  ; Screen Y position in pixels
    dw $0917, $001A  ; Layer 2 X position
    dw $0919, $0000  ; Layer 2 Y position
    dw $09C2, $008E  ; Health
    dw $09C6, $000B  ; Missiles
    dw $09CA, $0006  ; Supers
    dw $09D2, $0002  ; Currently selected item
    dw $0AF6, $007F  ; Samus X
    dw $0AFA, $008B  ; Samus Y
    dw #$FFFF

preset_prkd19_backtracking_crateria_kihunters_final:
    dw #preset_prkd19_backtracking_red_brinstar_green_gate ; Backtracking: Red Brinstar Green Gate
    dw $078D, $90BA  ; DDB
    dw $079B, $962A  ; MDB
    dw $07F3, $0012  ; Music Bank
    dw $07F5, $0003  ; Music Track
    dw $090F, $0000  ; Screen subpixel X position
    dw $0911, $0000  ; Screen X position in pixels
    dw $0913, $0000  ; Screen subpixel Y position
    dw $0917, $0000  ; Layer 2 X position
    dw $09CA, $0005  ; Supers
    dw $09D2, $0000  ; Currently selected item
    dw $0A1C, $009B  ; Samus position/state
    dw $0A1E, $0000  ; More position/state
    dw $0AF6, $0080  ; Samus X
    dw $0AFA, $00A8  ; Samus Y
    dw #$FFFF

preset_prkd19_backtracking_parlor_return:
    dw #preset_prkd19_backtracking_crateria_kihunters_final ; Backtracking: Crateria Kihunters Final
    dw $078D, $8AC6  ; DDB
    dw $079B, $91F8  ; MDB
    dw $07F3, $000C  ; Music Bank
    dw $07F5, $0005  ; Music Track
    dw $0911, $05E3  ; Screen X position in pixels
    dw $0915, $0400  ; Screen Y position in pixels
    dw $0917, $02F1  ; Layer 2 X position
    dw $09C6, $0009  ; Missiles
    dw $0A1C, $0002  ; Samus position/state
    dw $0A1E, $0004  ; More position/state
    dw $0AF6, $0683  ; Samus X
    dw $0AFA, $04BB  ; Samus Y
    dw #$FFFF

preset_prkd19_backtracking_terminator_revisit:
    dw #preset_prkd19_backtracking_parlor_return ; Backtracking: Parlor Return
    dw $078D, $8916  ; DDB
    dw $079B, $92FD  ; MDB
    dw $07F3, $0009  ; Music Bank
    dw $090F, $C000  ; Screen subpixel X position
    dw $0911, $0100  ; Screen X position in pixels
    dw $0913, $3C00  ; Screen subpixel Y position
    dw $0915, $0000  ; Screen Y position in pixels
    dw $0917, $00C0  ; Layer 2 X position
    dw $0A1C, $0072  ; Samus position/state
    dw $0A1E, $0504  ; More position/state
    dw $0AF6, $010C  ; Samus X
    dw $0AFA, $0090  ; Samus Y
    dw #$FFFF

preset_prkd19_backtracking_green_pirate_shaft_revisit:
    dw #preset_prkd19_backtracking_terminator_revisit ; Backtracking: Terminator Revisit
    dw $078D, $895E  ; DDB
    dw $079B, $990D  ; MDB
    dw $090F, $DE80  ; Screen subpixel X position
    dw $0911, $0000  ; Screen X position in pixels
    dw $0913, $0000  ; Screen subpixel Y position
    dw $0915, $01FB  ; Screen Y position in pixels
    dw $0917, $0000  ; Layer 2 X position
    dw $0919, $017C  ; Layer 2 Y position
    dw $0A1C, $0002  ; Samus position/state
    dw $0A1E, $0004  ; More position/state
    dw $0AF6, $0062  ; Samus X
    dw $0AFA, $029B  ; Samus Y
    dw #$FFFF

preset_prkd19_backtracking_g4_hallway:
    dw #preset_prkd19_backtracking_green_pirate_shaft_revisit ; Backtracking: Green Pirate Shaft Revisit
    dw $078D, $8BE6  ; DDB
    dw $079B, $99BD  ; MDB
    dw $090F, $7FFF  ; Screen subpixel X position
    dw $0913, $E400  ; Screen subpixel Y position
    dw $0915, $0600  ; Screen Y position in pixels
    dw $0917, $0001  ; Layer 2 X position
    dw $0919, $0480  ; Layer 2 Y position
    dw $09CA, $0004  ; Supers
    dw $0A1C, $0001  ; Samus position/state
    dw $0A1E, $0008  ; More position/state
    dw $0AF6, $00C2  ; Samus X
    dw $0AFA, $068B  ; Samus Y
    dw $D8B2, $6C01  ; Doors
    dw #$FFFF

preset_prkd19_backtracking_g4_elevator:
    dw #preset_prkd19_backtracking_g4_hallway ; Backtracking: G4 Hallway
    dw $078D, $91F2  ; DDB
    dw $079B, $A66A  ; MDB
    dw $07F5, $0006  ; Music Track
    dw $090F, $7000  ; Screen subpixel X position
    dw $0913, $7000  ; Screen subpixel Y position
    dw $0915, $0000  ; Screen Y position in pixels
    dw $0917, $0000  ; Layer 2 X position
    dw $0919, $0000  ; Layer 2 Y position
    dw $0A1C, $0002  ; Samus position/state
    dw $0A1E, $0004  ; More position/state
    dw $0AF6, $0049  ; Samus X
    dw $0AFA, $009B  ; Samus Y
    dw $D820, $0BC1  ; Events
    dw #$FFFF

preset_prkd19_tourian_tourian_elevator_room:
    dw #preset_prkd19_backtracking_g4_elevator ; Backtracking: G4 Elevator
    dw $078D, $9222  ; DDB
    dw $079B, $DAAE  ; MDB
    dw $07F3, $001E  ; Music Bank
    dw $07F5, $0005  ; Music Track
    dw $090F, $9FFF  ; Screen subpixel X position
    dw $0913, $0000  ; Screen subpixel Y position
    dw $0915, $0238  ; Screen Y position in pixels
    dw $0919, $01AA  ; Layer 2 Y position
    dw $09A6, $1007  ; Equipped Beams
    dw $0A1C, $009B  ; Samus position/state
    dw $0A1E, $0000  ; More position/state
    dw $0AF6, $0080  ; Samus X
    dw $0AFA, $02A8  ; Samus Y
    dw $D820, $0FC1  ; Events
    dw $D90C, $0100  ; Map Stations
    dw #$FFFF

preset_prkd19_tourian_metroids_1:
    dw #preset_prkd19_tourian_tourian_elevator_room ; Tourian: Tourian Elevator Room
    dw $090F, $0001  ; Screen subpixel X position
    dw $0913, $D3FF  ; Screen subpixel Y position
    dw $0915, $0300  ; Screen Y position in pixels
    dw $0919, $0240  ; Layer 2 Y position
    dw $0A1C, $0002  ; Samus position/state
    dw $0A1E, $0004  ; More position/state
    dw $0AF6, $0041  ; Samus X
    dw $0AFA, $038B  ; Samus Y
    dw #$FFFF

preset_prkd19_tourian_metroids_2:
    dw #preset_prkd19_tourian_metroids_1 ; Tourian: Metroids 1
    dw $078D, $A984  ; DDB
    dw $079B, $DAE1  ; MDB
    dw $090F, $6000  ; Screen subpixel X position
    dw $0911, $0119  ; Screen X position in pixels
    dw $0913, $A400  ; Screen subpixel Y position
    dw $0915, $0000  ; Screen Y position in pixels
    dw $0917, $00D2  ; Layer 2 X position
    dw $0919, $0000  ; Layer 2 Y position
    dw $09C2, $006B  ; Health
    dw $09C6, $000F  ; Missiles
    dw $09CA, $0006  ; Supers
    dw $0AF6, $0197  ; Samus X
    dw $0AFA, $00AB  ; Samus Y
    dw $D822, $0021  ; Events
    dw #$FFFF

preset_prkd19_tourian_metroids_3:
    dw #preset_prkd19_tourian_metroids_2 ; Tourian: Metroids 2
    dw $078D, $A9B4  ; DDB
    dw $079B, $DB31  ; MDB
    dw $090F, $EFFF  ; Screen subpixel X position
    dw $0911, $0000  ; Screen X position in pixels
    dw $0913, $0000  ; Screen subpixel Y position
    dw $0915, $0117  ; Screen Y position in pixels
    dw $0917, $0000  ; Layer 2 X position
    dw $0919, $00D1  ; Layer 2 Y position
    dw $09C2, $00D4  ; Health
    dw $09CA, $0007  ; Supers
    dw $0A1C, $0001  ; Samus position/state
    dw $0A1E, $0008  ; More position/state
    dw $0AF6, $00C0  ; Samus X
    dw $0AFA, $018B  ; Samus Y
    dw $D822, $0023  ; Events
    dw $D8C4, $0003  ; Doors
    dw #$FFFF

preset_prkd19_tourian_metroids_4:
    dw #preset_prkd19_tourian_metroids_3 ; Tourian: Metroids 3
    dw $078D, $A9CC  ; DDB
    dw $079B, $DB7D  ; MDB
    dw $090F, $A000  ; Screen subpixel X position
    dw $0911, $0500  ; Screen X position in pixels
    dw $0913, $6800  ; Screen subpixel Y position
    dw $0915, $0000  ; Screen Y position in pixels
    dw $0917, $03C0  ; Layer 2 X position
    dw $0919, $0000  ; Layer 2 Y position
    dw $09C2, $011B  ; Health
    dw $09CA, $0008  ; Supers
    dw $0AF6, $05AB  ; Samus X
    dw $0AFA, $008B  ; Samus Y
    dw $D822, $0027  ; Events
    dw $D8C4, $0007  ; Doors
    dw #$FFFF

preset_prkd19_tourian_giant_hoppers:
    dw #preset_prkd19_tourian_metroids_4 ; Tourian: Metroids 4
    dw $078D, $A9E4  ; DDB
    dw $079B, $DBCD  ; MDB
    dw $090F, $B000  ; Screen subpixel X position
    dw $0911, $0000  ; Screen X position in pixels
    dw $0913, $4C00  ; Screen subpixel Y position
    dw $0915, $011F  ; Screen Y position in pixels
    dw $0917, $0000  ; Layer 2 X position
    dw $0919, $00D7  ; Layer 2 Y position
    dw $09C2, $018F  ; Health
    dw $09CA, $000A  ; Supers
    dw $0AF6, $005E  ; Samus X
    dw $0AFA, $01CB  ; Samus Y
    dw $D822, $002F  ; Events
    dw $D8C4, $000F  ; Doors
    dw #$FFFF

preset_prkd19_tourian_baby_skip:
    dw #preset_prkd19_tourian_giant_hoppers ; Tourian: Giant Hoppers
    dw $078D, $AA14  ; DDB
    dw $079B, $DC65  ; MDB
    dw $07F3, $0045  ; Music Bank
    dw $07F5, $0006  ; Music Track
    dw $090F, $D000  ; Screen subpixel X position
    dw $0911, $0100  ; Screen X position in pixels
    dw $0913, $8800  ; Screen subpixel Y position
    dw $0915, $0000  ; Screen Y position in pixels
    dw $0917, $00C0  ; Layer 2 X position
    dw $0919, $0000  ; Layer 2 Y position
    dw $09C2, $0185  ; Health
    dw $0A1C, $0002  ; Samus position/state
    dw $0A1E, $0004  ; More position/state
    dw $0AF6, $01DA  ; Samus X
    dw $0AFA, $00AB  ; Samus Y
    dw #$FFFF

preset_prkd19_tourian_gadora_room:
    dw #preset_prkd19_tourian_baby_skip ; Tourian: Baby Skip
    dw $078D, $AA44  ; DDB
    dw $079B, $DCFF  ; MDB
    dw $07F3, $001E  ; Music Bank
    dw $07F5, $0005  ; Music Track
    dw $090F, $7000  ; Screen subpixel X position
    dw $0911, $0000  ; Screen X position in pixels
    dw $0913, $D000  ; Screen subpixel Y position
    dw $0915, $0116  ; Screen Y position in pixels
    dw $0917, $0000  ; Layer 2 X position
    dw $0919, $00D0  ; Layer 2 Y position
    dw $09CA, $0009  ; Supers
    dw $0A1C, $0001  ; Samus position/state
    dw $0A1E, $0008  ; More position/state
    dw $0AF6, $00DD  ; Samus X
    dw $0AFA, $018B  ; Samus Y
    dw $D8C4, $00AF  ; Doors
    dw #$FFFF

preset_prkd19_tourian_rinka_shaft:
    dw #preset_prkd19_tourian_gadora_room ; Tourian: Gadora Room
    dw $078D, $AA5C  ; DDB
    dw $079B, $DDC4  ; MDB
    dw $090F, $4000  ; Screen subpixel X position
    dw $0911, $0300  ; Screen X position in pixels
    dw $0913, $5400  ; Screen subpixel Y position
    dw $0915, $0000  ; Screen Y position in pixels
    dw $0917, $0240  ; Layer 2 X position
    dw $0919, $0000  ; Layer 2 Y position
    dw $09CA, $0008  ; Supers
    dw $0A1C, $0002  ; Samus position/state
    dw $0A1E, $0004  ; More position/state
    dw $0AF6, $03DB  ; Samus X
    dw $0AFA, $008B  ; Samus Y
    dw $D8C4, $01AF  ; Doors
    dw #$FFFF

preset_prkd19_tourian_zeb_skip:
    dw #preset_prkd19_tourian_rinka_shaft ; Tourian: Rinka Shaft
    dw $078D, $AAA4  ; DDB
    dw $079B, $DDF3  ; MDB
    dw $090F, $6000  ; Screen subpixel X position
    dw $0911, $0000  ; Screen X position in pixels
    dw $0913, $0000  ; Screen subpixel Y position
    dw $0915, $021A  ; Screen Y position in pixels
    dw $0917, $0000  ; Layer 2 X position
    dw $0919, $0193  ; Layer 2 Y position
    dw $09CA, $0007  ; Supers
    dw $0AF6, $0040  ; Samus X
    dw $0AFA, $028B  ; Samus Y
    dw $D8C4, $03AF  ; Doors
    dw #$FFFF

preset_prkd19_tourian_mother_brain_2:
    dw #preset_prkd19_tourian_zeb_skip ; Tourian: Zeb Skip
    dw $078D, $AAC8  ; DDB
    dw $079B, $DD58  ; MDB
    dw $07F3, $0021  ; Music Bank
    dw $07F5, $0000  ; Music Track
    dw $090F, $79FF  ; Screen subpixel X position
    dw $0915, $0000  ; Screen Y position in pixels
    dw $0919, $0000  ; Layer 2 Y position
    dw $09C2, $0176  ; Health
    dw $09C6, $0000  ; Missiles
    dw $09CA, $0000  ; Supers
    dw $0AF6, $00CF  ; Samus X
    dw $0AFA, $009B  ; Samus Y
    dw $D820, $0FC5  ; Events
    dw #$FFFF

preset_prkd19_tourian_mother_brain_3:
    dw #preset_prkd19_tourian_mother_brain_2 ; Tourian: Mother Brain 2
    dw $09A6, $1009  ; Equipped Beams
    dw $09C2, $018F  ; Health
    dw $09CE, $0000  ; Pbs
    dw $0A76, $8000  ; Hyper beam
    dw $D82C, $0203  ; Bosses
    dw #$FFFF

preset_prkd19_tourian_zebes_escape:
    dw #preset_prkd19_tourian_mother_brain_3 ; Tourian: Mother Brain 3
    dw $0A1C, $009B  ; Samus position/state
    dw $0A1E, $0000  ; More position/state
    dw $0AF6, $0025  ; Samus X
    dw $0AFA, $009E  ; Samus Y
    dw $D820, $4FC5  ; Events
    dw #$FFFF

preset_prkd19_tourian_escape_room_3:
    dw #preset_prkd19_tourian_zebes_escape ; Tourian: Zebes Escape
    dw $078D, $AAEC  ; DDB
    dw $079B, $DE7A  ; MDB
    dw $07F3, $0024  ; Music Bank
    dw $07F5, $0007  ; Music Track
    dw $090F, $F000  ; Screen subpixel X position
    dw $0913, $CC00  ; Screen subpixel Y position
    dw $0915, $0100  ; Screen Y position in pixels
    dw $0919, $00C0  ; Layer 2 Y position
    dw $0A1C, $0001  ; Samus position/state
    dw $0A1E, $0008  ; More position/state
    dw $0AF6, $00DF  ; Samus X
    dw $0AFA, $018B  ; Samus Y
    dw #$FFFF

preset_prkd19_tourian_escape_room_4:
    dw #preset_prkd19_tourian_escape_room_3 ; Tourian: Escape Room 3
    dw $078D, $AB04  ; DDB
    dw $079B, $DEA7  ; MDB
    dw $090F, $3000  ; Screen subpixel X position
    dw $0911, $0500  ; Screen X position in pixels
    dw $0913, $4C00  ; Screen subpixel Y position
    dw $0915, $001C  ; Screen Y position in pixels
    dw $0917, $03C0  ; Layer 2 X position
    dw $0919, $0015  ; Layer 2 Y position
    dw $0AF6, $05D6  ; Samus X
    dw $0AFA, $008B  ; Samus Y
    dw #$FFFF

preset_prkd19_tourian_escape_climb:
    dw #preset_prkd19_tourian_escape_room_4 ; Tourian: Escape Room 4
    dw $078D, $AB1C  ; DDB
    dw $079B, $DEDE  ; MDB
    dw $090F, $0000  ; Screen subpixel X position
    dw $0911, $00F1  ; Screen X position in pixels
    dw $0913, $A400  ; Screen subpixel Y position
    dw $0915, $00FB  ; Screen Y position in pixels
    dw $0917, $00B4  ; Layer 2 X position
    dw $0919, $00BC  ; Layer 2 Y position
    dw $09C2, $0171  ; Health
    dw $0AF6, $0151  ; Samus X
    dw $0AFA, $018B  ; Samus Y
    dw #$FFFF

preset_prkd19_tourian_escape_parlor:
    dw #preset_prkd19_tourian_escape_climb ; Tourian: Escape Climb
    dw $078D, $AB34  ; DDB
    dw $079B, $96BA  ; MDB
    dw $090F, $8FFF  ; Screen subpixel X position
    dw $0911, $0100  ; Screen X position in pixels
    dw $0913, $6801  ; Screen subpixel Y position
    dw $0915, $0000  ; Screen Y position in pixels
    dw $0917, $00C0  ; Layer 2 X position
    dw $0919, $0000  ; Layer 2 Y position
    dw $09C2, $00DE  ; Health
    dw $0A1C, $0002  ; Samus position/state
    dw $0A1E, $0004  ; More position/state
    dw $0AF6, $01DA  ; Samus X
    dw $0AFA, $004B  ; Samus Y
    dw #$FFFF
