
preset_zfackpdr_bombs_ship:
    dw #$0000
    dw $078D, $80F0  ; DDB
    dw $079B, $81F2  ; MDB
    dw $07F3, $0006  ; Music Bank
    dw $07F5, $0005  ; Music Track
    dw $090F, $0000  ; Screen subpixel X position
    dw $0911, $0300  ; Screen X position in pixels
    dw $0913, $0000  ; Screen subpixel Y position
    dw $0915, $03D0  ; Screen Y position in pixels
    dw $0917, $0180  ; Layer 2 X position
    dw $0919, $0000  ; Layer 2 Y position
    dw $093F, $0000  ; Ceres escape flag
    dw $09A2, $0000  ; Equipped Items
    dw $09A4, $0000  ; Collected Items
    dw $09A6, $0000  ; Beams
    dw $09A8, $0000  ; Beams
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
    dw $0AF6, $0381  ; Samus X
    dw $0AF8, $0000  ; Samus subpixel X
    dw $0AFA, $0440  ; Samus Y
    dw $0AFC, $8000  ; Samus subpixel Y
    dw $0B3F, $0000  ; Blue suit
    dw $D820, $0000  ; Events
    dw $D822, $0000  ; Events
    dw $D828, $0001  ; Bosses
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

preset_zfackpdr_bombs_sleepy_tunnel:
    dw #preset_zfackpdr_bombs_ship ; Bombs: Ship
    dw $078D, $812C  ; DDB
    dw $090F, $0C00  ; Screen subpixel X position
    dw $0911, $0600  ; Screen X position in pixels
    dw $0913, $3000  ; Screen subpixel Y position
    dw $0915, $0400  ; Screen Y position in pixels
    dw $0917, $0300  ; Layer 2 X position
    dw $0A1C, $0001  ; Samus position/state
    dw $0A1E, $0008  ; More position/state
    dw $0AF6, $06A1  ; Samus X
    dw $0AF8, $E7FF  ; Samus subpixel X
    dw $0AFA, $049A  ; Samus Y
    dw $0AFC, $FFFF  ; Samus subpixel Y
    dw #$FFFF

preset_zfackpdr_bombs_kihunter_babies:
    dw #preset_zfackpdr_bombs_sleepy_tunnel ; Bombs: Sleepy Tunnel
    dw $078D, $8138  ; DDB
    dw $079B, $8619  ; MDB
    dw $090F, $1000  ; Screen subpixel X position
    dw $0911, $0000  ; Screen X position in pixels
    dw $0913, $9C00  ; Screen subpixel Y position
    dw $0915, $0100  ; Screen Y position in pixels
    dw $0917, $0000  ; Layer 2 X position
    dw $0919, $0100  ; Layer 2 Y position
    dw $0A1C, $0002  ; Samus position/state
    dw $0A1E, $0004  ; More position/state
    dw $0AF6, $0048  ; Samus X
    dw $0AF8, $B000  ; Samus subpixel X
    dw $0AFA, $018B  ; Samus Y
    dw #$FFFF

preset_zfackpdr_bombs_climb_down:
    dw #preset_zfackpdr_bombs_kihunter_babies ; Bombs: Kihunter Babies
    dw $078D, $83D8  ; DDB
    dw $079B, $86D2  ; MDB
    dw $090F, $9000  ; Screen subpixel X position
    dw $0911, $0091  ; Screen X position in pixels
    dw $0913, $A800  ; Screen subpixel Y position
    dw $0915, $041C  ; Screen Y position in pixels
    dw $0917, $006C  ; Layer 2 X position
    dw $0919, $0315  ; Layer 2 Y position
    dw $0A1C, $0001  ; Samus position/state
    dw $0A1E, $0008  ; More position/state
    dw $0AF6, $0131  ; Samus X
    dw $0AF8, $EC00  ; Samus subpixel X
    dw $0AFA, $049D  ; Samus Y
    dw $0AFC, $CBFF  ; Samus subpixel Y
    dw #$FFFF

preset_zfackpdr_bombs_elevator_to_morph:
    dw #preset_zfackpdr_bombs_climb_down ; Bombs: Climb Down
    dw $078D, $83E4  ; DDB
    dw $079B, $87AE  ; MDB
    dw $090F, $4000  ; Screen subpixel X position
    dw $0911, $0000  ; Screen X position in pixels
    dw $0913, $8000  ; Screen subpixel Y position
    dw $0915, $00FA  ; Screen Y position in pixels
    dw $0917, $0000  ; Layer 2 X position
    dw $0919, $00DA  ; Layer 2 Y position
    dw $0A1C, $0002  ; Samus position/state
    dw $0A1E, $0004  ; More position/state
    dw $0AF6, $002E  ; Samus X
    dw $0AF8, $0000  ; Samus subpixel X
    dw $0AFA, $018B  ; Samus Y
    dw $0AFC, $FFFF  ; Samus subpixel Y
    dw #$FFFF

preset_zfackpdr_bombs_empty_chozo_down:
    dw #preset_zfackpdr_bombs_elevator_to_morph ; Bombs: Elevator to Morph
    dw $078D, $8048  ; DDB
    dw $079B, $8C17  ; MDB
    dw $07F5, $0007  ; Music Track
    dw $090F, $2000  ; Screen subpixel X position
    dw $0911, $0400  ; Screen X position in pixels
    dw $0913, $6000  ; Screen subpixel Y position
    dw $0915, $0100  ; Screen Y position in pixels
    dw $0917, $0400  ; Layer 2 X position
    dw $0919, $0100  ; Layer 2 Y position
    dw $0A1C, $0001  ; Samus position/state
    dw $0A1E, $0008  ; More position/state
    dw $0AF6, $04BE  ; Samus X
    dw #$FFFF

preset_zfackpdr_bombs_morph:
    dw #preset_zfackpdr_bombs_empty_chozo_down ; Bombs: Empty Chozo Down
    dw $078D, $85D0  ; DDB
    dw $090F, $3000  ; Screen subpixel X position
    dw $0911, $0000  ; Screen X position in pixels
    dw $0913, $5400  ; Screen subpixel Y position
    dw $0915, $0300  ; Screen Y position in pixels
    dw $0917, $0000  ; Layer 2 X position
    dw $0919, $0300  ; Layer 2 Y position
    dw $0A1C, $0002  ; Samus position/state
    dw $0A1E, $0004  ; More position/state
    dw $0AF6, $004A  ; Samus X
    dw $0AF8, $EFFF  ; Samus subpixel X
    dw $0AFA, $038B  ; Samus Y
    dw #$FFFF

preset_zfackpdr_bombs_morph_escape:
    dw #preset_zfackpdr_bombs_morph ; Bombs: Morph
    dw $078D, $8618  ; DDB
    dw $079B, $8CB9  ; MDB
    dw $090F, $0000  ; Screen subpixel X position
    dw $0913, $0400  ; Screen subpixel Y position
    dw $0915, $0200  ; Screen Y position in pixels
    dw $0919, $0200  ; Layer 2 Y position
    dw $09A2, $0004  ; Equipped Items
    dw $09A4, $0004  ; Collected Items
    dw $09C6, $0005  ; Missiles
    dw $09C8, $0005  ; Max missiles
    dw $0A1C, $0001  ; Samus position/state
    dw $0A1E, $0008  ; More position/state
    dw $0AF6, $00CF  ; Samus X
    dw $0AF8, $7FFF  ; Samus subpixel X
    dw $0AFA, $02BB  ; Samus Y
    dw $D872, $000C  ; Items
    dw #$FFFF

preset_zfackpdr_bombs_elevator_bottom:
    dw #preset_zfackpdr_bombs_morph_escape ; Bombs: Morph Escape
    dw $078D, $85AC  ; DDB
    dw $079B, $8C6B  ; MDB
    dw $090F, $A000  ; Screen subpixel X position
    dw $0911, $0200  ; Screen X position in pixels
    dw $0913, $F400  ; Screen subpixel Y position
    dw $0915, $000C  ; Screen Y position in pixels
    dw $0917, $0200  ; Layer 2 X position
    dw $0919, $000C  ; Layer 2 Y position
    dw $0A1C, $0002  ; Samus position/state
    dw $0A1E, $0004  ; More position/state
    dw $0AF6, $0245  ; Samus X
    dw $0AF8, $C000  ; Samus subpixel X
    dw $0AFA, $008B  ; Samus Y
    dw #$FFFF

preset_zfackpdr_bombs_pirate_mushrooms:
    dw #preset_zfackpdr_bombs_elevator_bottom ; Bombs: Elevator Bottom
    dw $078D, $8570  ; DDB
    dw $079B, $8116  ; MDB
    dw $07F3, $0009  ; Music Bank
    dw $07F5, $0003  ; Music Track
    dw $090F, $0000  ; Screen subpixel X position
    dw $0911, $0000  ; Screen X position in pixels
    dw $0913, $C000  ; Screen subpixel Y position
    dw $0915, $0000  ; Screen Y position in pixels
    dw $0917, $0000  ; Layer 2 X position
    dw $0919, $0000  ; Layer 2 Y position
    dw $09C6, $000A  ; Missiles
    dw $09C8, $000A  ; Max missiles
    dw $0A1C, $0001  ; Samus position/state
    dw $0A1E, $0008  ; More position/state
    dw $0AF6, $00A9  ; Samus X
    dw $0AF8, $BFFF  ; Samus subpixel X
    dw $D872, $000E  ; Items
    dw #$FFFF

preset_zfackpdr_bombs_kihunter_revival:
    dw #preset_zfackpdr_bombs_pirate_mushrooms ; Bombs: Pirate Mushrooms
    dw $078D, $83FC  ; DDB
    dw $079B, $8741  ; MDB
    dw $07F5, $0005  ; Music Track
    dw $0911, $0100  ; Screen X position in pixels
    dw $0913, $0000  ; Screen subpixel Y position
    dw $0915, $000B  ; Screen Y position in pixels
    dw $0917, $00C0  ; Layer 2 X position
    dw $0919, $0008  ; Layer 2 Y position
    dw $0A1C, $0002  ; Samus position/state
    dw $0A1E, $0004  ; More position/state
    dw $0AF6, $01A5  ; Samus X
    dw $0AF8, $AFFF  ; Samus subpixel X
    dw $0AFA, $007B  ; Samus Y
    dw $D820, $0001  ; Events
    dw $D8B2, $0002  ; Doors
    dw #$FFFF

preset_zfackpdr_bombs_purple_stairs:
    dw #preset_zfackpdr_bombs_kihunter_revival ; Bombs: Kihunter Revival
    dw $078D, $8384  ; DDB
    dw $079B, $86D2  ; MDB
    dw $090F, $D000  ; Screen subpixel X position
    dw $0911, $0000  ; Screen X position in pixels
    dw $0913, $0400  ; Screen subpixel Y position
    dw $0915, $0000  ; Screen Y position in pixels
    dw $0917, $0000  ; Layer 2 X position
    dw $0919, $0000  ; Layer 2 Y position
    dw $09C2, $004F  ; Health
    dw $0A1C, $0001  ; Samus position/state
    dw $0A1E, $0008  ; More position/state
    dw $0AF6, $00C2  ; Samus X
    dw $0AF8, $5FFF  ; Samus subpixel X
    dw $0AFA, $008B  ; Samus Y
    dw #$FFFF

preset_zfackpdr_bombs_ship_revisit:
    dw #preset_zfackpdr_bombs_purple_stairs ; Bombs: Purple Stairs
    dw $078D, $836C  ; DDB
    dw $079B, $82F5  ; MDB
    dw $090F, $B000  ; Screen subpixel X position
    dw $0911, $0200  ; Screen X position in pixels
    dw $0913, $1000  ; Screen subpixel Y position
    dw $0915, $001D  ; Screen Y position in pixels
    dw $0917, $0180  ; Layer 2 X position
    dw $0919, $0015  ; Layer 2 Y position
    dw $09C2, $005E  ; Health
    dw $0A1C, $0002  ; Samus position/state
    dw $0A1E, $0004  ; More position/state
    dw $0AF6, $023D  ; Samus X
    dw $0AF8, $6780  ; Samus subpixel X
    dw #$FFFF

preset_zfackpdr_bombs_rip_n_dive:
    dw #preset_zfackpdr_bombs_ship_revisit ; Bombs: Ship Revisit
    dw $078D, $812C  ; DDB
    dw $079B, $81F2  ; MDB
    dw $07F3, $0006  ; Music Bank
    dw $07F5, $0006  ; Music Track
    dw $090F, $E800  ; Screen subpixel X position
    dw $0911, $0000  ; Screen X position in pixels
    dw $0913, $D000  ; Screen subpixel Y position
    dw $0915, $03F7  ; Screen Y position in pixels
    dw $0917, $0000  ; Layer 2 X position
    dw $0919, $0000  ; Layer 2 Y position
    dw $09C6, $0005  ; Missiles
    dw $0AF6, $0047  ; Samus X
    dw $0AF8, $4000  ; Samus subpixel X
    dw $0AFA, $048B  ; Samus Y
    dw $D8B0, $0020  ; Doors
    dw #$FFFF

preset_zfackpdr_bombs_old_mb_tricks:
    dw #preset_zfackpdr_bombs_rip_n_dive ; Bombs: Rip n Dive
    dw $078D, $8120  ; DDB
    dw $079B, $8420  ; MDB
    dw $07F3, $0009  ; Music Bank
    dw $07F5, $0005  ; Music Track
    dw $090F, $7000  ; Screen subpixel X position
    dw $0911, $0200  ; Screen X position in pixels
    dw $0913, $B800  ; Screen subpixel Y position
    dw $0915, $0000  ; Screen Y position in pixels
    dw $0917, $01C0  ; Layer 2 X position
    dw $09C2, $0055  ; Health
    dw $0A1C, $0001  ; Samus position/state
    dw $0A1E, $0008  ; More position/state
    dw $0AF6, $0296  ; Samus X
    dw $0AF8, $2800  ; Samus subpixel X
    dw $0AFA, $006B  ; Samus Y
    dw #$FFFF

preset_zfackpdr_bombs_bomb_torizo:
    dw #preset_zfackpdr_bombs_old_mb_tricks ; Bombs: Old MB Tricks
    dw $078D, $81F8  ; DDB
    dw $079B, $8362  ; MDB
    dw $090F, $C000  ; Screen subpixel X position
    dw $0911, $0100  ; Screen X position in pixels
    dw $0913, $D800  ; Screen subpixel Y position
    dw $0915, $031F  ; Screen Y position in pixels
    dw $0917, $00C0  ; Layer 2 X position
    dw $0919, $0257  ; Layer 2 Y position
    dw $09C2, $0041  ; Health
    dw $09C6, $000A  ; Missiles
    dw $09C8, $000F  ; Max missiles
    dw $0A1C, $0028  ; Samus position/state
    dw $0A1E, $0504  ; More position/state
    dw $0AF6, $0179  ; Samus X
    dw $0AF8, $BFFF  ; Samus subpixel X
    dw $0AFA, $03A0  ; Samus Y
    dw $D870, $0020  ; Items
    dw #$FFFF

preset_zfackpdr_varia_and_supers_bt_escape:
    dw #preset_zfackpdr_bombs_bomb_torizo ; Bombs: Bomb Torizo
    dw $078D, $8168  ; DDB
    dw $079B, $80AD  ; MDB
    dw $07F3, $0024  ; Music Bank
    dw $07F5, $0003  ; Music Track
    dw $090F, $0000  ; Screen subpixel X position
    dw $0911, $0000  ; Screen X position in pixels
    dw $0913, $1400  ; Screen subpixel Y position
    dw $0915, $0000  ; Screen Y position in pixels
    dw $0917, $0000  ; Layer 2 X position
    dw $0919, $0000  ; Layer 2 Y position
    dw $09A2, $1004  ; Equipped Items
    dw $09A4, $1004  ; Collected Items
    dw $09C2, $0063  ; Health
    dw $09C6, $000F  ; Missiles
    dw $0A1C, $0002  ; Samus position/state
    dw $0A1E, $0004  ; More position/state
    dw $0AF6, $0046  ; Samus X
    dw $0AF8, $7FFF  ; Samus subpixel X
    dw $0AFA, $00BB  ; Samus Y
    dw $D828, $0005  ; Bosses
    dw $D870, $0022  ; Items
    dw $D8B0, $0022  ; Doors
    dw #$FFFF

preset_zfackpdr_varia_and_supers_kihunter_revisit:
    dw #preset_zfackpdr_varia_and_supers_bt_escape ; Varia and Supers: BT Escape
    dw $078D, $8030  ; DDB
    dw $079B, $8870  ; MDB
    dw $07F3, $0009  ; Music Bank
    dw $07F5, $0005  ; Music Track
    dw $090F, $8000  ; Screen subpixel X position
    dw $0913, $6400  ; Screen subpixel Y position
    dw $0915, $0200  ; Screen Y position in pixels
    dw $0919, $0180  ; Layer 2 Y position
    dw $0A1C, $0001  ; Samus position/state
    dw $0A1E, $0008  ; More position/state
    dw $0AF6, $00B9  ; Samus X
    dw $0AF8, $C000  ; Samus subpixel X
    dw $0AFA, $029B  ; Samus Y
    dw #$FFFF

preset_zfackpdr_varia_and_supers_purple_stairs_revisit:
    dw #preset_zfackpdr_varia_and_supers_kihunter_revisit ; Varia and Supers: Kihunter Revisit
    dw $078D, $842C  ; DDB
    dw $079B, $86D2  ; MDB
    dw $090F, $1000  ; Screen subpixel X position
    dw $0913, $4C00  ; Screen subpixel Y position
    dw $0915, $001C  ; Screen Y position in pixels
    dw $0919, $0015  ; Layer 2 Y position
    dw $09C2, $0054  ; Health
    dw $0AF6, $00C4  ; Samus X
    dw $0AF8, $3FFF  ; Samus subpixel X
    dw $0AFA, $008B  ; Samus Y
    dw #$FFFF

preset_zfackpdr_varia_and_supers_ship_revisit_revisit:
    dw #preset_zfackpdr_varia_and_supers_purple_stairs_revisit ; Varia and Supers: Purple Stairs Revisit
    dw $078D, $80E4  ; DDB
    dw $079B, $82F5  ; MDB
    dw $090F, $A000  ; Screen subpixel X position
    dw $0911, $0200  ; Screen X position in pixels
    dw $0913, $5400  ; Screen subpixel Y position
    dw $0915, $0006  ; Screen Y position in pixels
    dw $0917, $0180  ; Layer 2 X position
    dw $0919, $0004  ; Layer 2 Y position
    dw $09C2, $0040  ; Health
    dw $0A1C, $0002  ; Samus position/state
    dw $0A1E, $0004  ; More position/state
    dw $0AF6, $023D  ; Samus X
    dw $0AF8, $6000  ; Samus subpixel X
    dw #$FFFF

preset_zfackpdr_varia_and_supers_rip_n_dive_revisit:
    dw #preset_zfackpdr_varia_and_supers_ship_revisit_revisit ; Varia and Supers: Ship Revisit Revisit
    dw $078D, $812C  ; DDB
    dw $079B, $81F2  ; MDB
    dw $07F3, $0006  ; Music Bank
    dw $07F5, $0006  ; Music Track
    dw $090F, $F400  ; Screen subpixel X position
    dw $0911, $0000  ; Screen X position in pixels
    dw $0913, $A000  ; Screen subpixel Y position
    dw $0915, $0400  ; Screen Y position in pixels
    dw $0917, $0000  ; Layer 2 X position
    dw $0919, $0000  ; Layer 2 Y position
    dw $0A1C, $008A  ; Samus position/state
    dw $0A1E, $1504  ; More position/state
    dw $0AF6, $0025  ; Samus X
    dw $0AF8, $0000  ; Samus subpixel X
    dw $0AFA, $048B  ; Samus Y
    dw #$FFFF

preset_zfackpdr_varia_and_supers_gate_scam_one:
    dw #preset_zfackpdr_varia_and_supers_rip_n_dive_revisit ; Varia and Supers: Rip n Dive Revisit
    dw $078D, $8120  ; DDB
    dw $079B, $8420  ; MDB
    dw $07F3, $0009  ; Music Bank
    dw $07F5, $0005  ; Music Track
    dw $090F, $2000  ; Screen subpixel X position
    dw $0913, $7000  ; Screen subpixel Y position
    dw $0915, $0000  ; Screen Y position in pixels
    dw $0A1C, $0002  ; Samus position/state
    dw $0A1E, $0004  ; More position/state
    dw $0AF6, $003D  ; Samus X
    dw $0AF8, $B400  ; Samus subpixel X
    dw $0AFA, $006B  ; Samus Y
    dw #$FFFF

preset_zfackpdr_varia_and_supers_cannonball:
    dw #preset_zfackpdr_varia_and_supers_gate_scam_one ; Varia and Supers: Gate Scam One
    dw $078D, $8204  ; DDB
    dw $079B, $844F  ; MDB
    dw $090F, $0E00  ; Screen subpixel X position
    dw $0913, $FC00  ; Screen subpixel Y position
    dw $0915, $0100  ; Screen Y position in pixels
    dw $0919, $00C0  ; Layer 2 Y position
    dw $09C2, $0059  ; Health
    dw $09C6, $000A  ; Missiles
    dw $0AF6, $0039  ; Samus X
    dw $0AF8, $AABF  ; Samus subpixel X
    dw $0AFA, $018B  ; Samus Y
    dw $0AFC, $5BFF  ; Samus subpixel Y
    dw #$FFFF

preset_zfackpdr_varia_and_supers_red_brin_elevator:
    dw #preset_zfackpdr_varia_and_supers_cannonball ; Varia and Supers: Cannonball
    dw $078D, $8234  ; DDB
    dw $079B, $84AB  ; MDB
    dw $090F, $5960  ; Screen subpixel X position
    dw $0911, $0100  ; Screen X position in pixels
    dw $0913, $6000  ; Screen subpixel Y position
    dw $0915, $0500  ; Screen Y position in pixels
    dw $0917, $00C0  ; Layer 2 X position
    dw $0919, $03C0  ; Layer 2 Y position
    dw $09C2, $00C7  ; Health
    dw $09C4, $00C7  ; Max health
    dw $0AF6, $013B  ; Samus X
    dw $0AF8, $FDE0  ; Samus subpixel X
    dw $0AFA, $058B  ; Samus Y
    dw $0AFC, $D7FF  ; Samus subpixel Y
    dw $D870, $0122  ; Items
    dw #$FFFF

preset_zfackpdr_varia_and_supers_varia:
    dw #preset_zfackpdr_varia_and_supers_red_brin_elevator ; Varia and Supers: Red Brin Elevator
    dw $078D, $890C  ; DDB
    dw $079B, $8B81  ; MDB
    dw $07F3, $0015  ; Music Bank
    dw $07F5, $0003  ; Music Track
    dw $090F, $2000  ; Screen subpixel X position
    dw $0911, $0200  ; Screen X position in pixels
    dw $0913, $3400  ; Screen subpixel Y position
    dw $0915, $0100  ; Screen Y position in pixels
    dw $0917, $0180  ; Layer 2 X position
    dw $0919, $00C0  ; Layer 2 Y position
    dw $09C2, $00AC  ; Health
    dw $09C6, $0009  ; Missiles
    dw $0A1C, $0001  ; Samus position/state
    dw $0A1E, $0008  ; More position/state
    dw $0AF6, $02B2  ; Samus X
    dw $0AF8, $2DE0  ; Samus subpixel X
    dw $0AFA, $018B  ; Samus Y
    dw $0AFC, $FFFF  ; Samus subpixel Y
    dw $D8B2, $0042  ; Doors
    dw #$FFFF

preset_zfackpdr_varia_and_supers_gate_scam_two:
    dw #preset_zfackpdr_varia_and_supers_varia ; Varia and Supers: Varia
    dw $078D, $854C  ; DDB
    dw $079B, $9143  ; MDB
    dw $07F3, $0012  ; Music Bank
    dw $07F5, $0005  ; Music Track
    dw $0911, $0103  ; Screen X position in pixels
    dw $0913, $2800  ; Screen subpixel Y position
    dw $0915, $021F  ; Screen Y position in pixels
    dw $0917, $0103  ; Layer 2 X position
    dw $0919, $01DB  ; Layer 2 Y position
    dw $09A2, $1005  ; Equipped Items
    dw $09A4, $1005  ; Collected Items
    dw $09C2, $009C  ; Health
    dw $0AF6, $018F  ; Samus X
    dw $0AF8, $0000  ; Samus subpixel X
    dw $0AFA, $02CB  ; Samus Y
    dw $D822, $0020  ; Events
    dw $D870, $4122  ; Items
    dw #$FFFF

preset_zfackpdr_varia_and_supers_lava_pit_death_room:
    dw #preset_zfackpdr_varia_and_supers_gate_scam_two ; Varia and Supers: Gate Scam Two
    dw $090F, $C000  ; Screen subpixel X position
    dw $0911, $0000  ; Screen X position in pixels
    dw $0913, $3000  ; Screen subpixel Y position
    dw $0915, $011F  ; Screen Y position in pixels
    dw $0917, $0000  ; Layer 2 X position
    dw $0919, $00FB  ; Layer 2 Y position
    dw $09C6, $0002  ; Missiles
    dw $0A1C, $0002  ; Samus position/state
    dw $0A1E, $0004  ; More position/state
    dw $0AF6, $003F  ; Samus X
    dw $0AFA, $018B  ; Samus Y
    dw #$FFFF

preset_zfackpdr_varia_and_supers_bug_pipe_secret:
    dw #preset_zfackpdr_varia_and_supers_lava_pit_death_room ; Varia and Supers: Lava Pit Death Room
    dw $078D, $9314  ; DDB
    dw $079B, $9E2A  ; MDB
    dw $07F3, $0015  ; Music Bank
    dw $090F, $1000  ; Screen subpixel X position
    dw $0911, $0300  ; Screen X position in pixels
    dw $0913, $4C00  ; Screen subpixel Y position
    dw $0915, $021E  ; Screen Y position in pixels
    dw $0917, $02A0  ; Layer 2 X position
    dw $0919, $01DA  ; Layer 2 Y position
    dw $09C2, $007D  ; Health
    dw $09C6, $0001  ; Missiles
    dw $0A1C, $0028  ; Samus position/state
    dw $0A1E, $0504  ; More position/state
    dw $0AF6, $0355  ; Samus X
    dw $0AFA, $0290  ; Samus Y
    dw #$FFFF

preset_zfackpdr_varia_and_supers_bubble_mountain:
    dw #preset_zfackpdr_varia_and_supers_bug_pipe_secret ; Varia and Supers: Bug Pipe Secret
    dw $078D, $929C  ; DDB
    dw $079B, $9EBD  ; MDB
    dw $090F, $9000  ; Screen subpixel X position
    dw $0911, $0000  ; Screen X position in pixels
    dw $0913, $3800  ; Screen subpixel Y position
    dw $0915, $0100  ; Screen Y position in pixels
    dw $0917, $0000  ; Layer 2 X position
    dw $0919, $0100  ; Layer 2 Y position
    dw $09C2, $00BD  ; Health
    dw $09C6, $000A  ; Missiles
    dw $0A1C, $0002  ; Samus position/state
    dw $0A1E, $0004  ; More position/state
    dw $0AF6, $0031  ; Samus X
    dw $0AF8, $5000  ; Samus subpixel X
    dw $0AFA, $018B  ; Samus Y
    dw #$FFFF

preset_zfackpdr_varia_and_supers_early_supers:
    dw #preset_zfackpdr_varia_and_supers_bubble_mountain ; Varia and Supers: Bubble Mountain
    dw $078D, $92CC  ; DDB
    dw $079B, $A0B6  ; MDB
    dw $090F, $C000  ; Screen subpixel X position
    dw $0911, $0100  ; Screen X position in pixels
    dw $0913, $0000  ; Screen subpixel Y position
    dw $0915, $011A  ; Screen Y position in pixels
    dw $0917, $00C0  ; Layer 2 X position
    dw $0919, $00D3  ; Layer 2 Y position
    dw $0A1C, $0001  ; Samus position/state
    dw $0A1E, $0008  ; More position/state
    dw $0AF6, $01C3  ; Samus X
    dw $0AF8, $7FFF  ; Samus subpixel X
    dw #$FFFF

preset_zfackpdr_wave_and_ice_bubbly_troubly_:
    dw #preset_zfackpdr_varia_and_supers_early_supers ; Varia and Supers: Early Supers
    dw $078D, $9494  ; DDB
    dw $090F, $0000  ; Screen subpixel X position
    dw $0911, $0000  ; Screen X position in pixels
    dw $0913, $9400  ; Screen subpixel Y position
    dw $0915, $0500  ; Screen Y position in pixels
    dw $0917, $0000  ; Layer 2 X position
    dw $0919, $03C0  ; Layer 2 Y position
    dw $09C2, $00B0  ; Health
    dw $09CA, $0005  ; Supers
    dw $09CC, $0005  ; Max supers
    dw $0A1C, $0002  ; Samus position/state
    dw $0A1E, $0004  ; More position/state
    dw $0AF6, $0030  ; Samus X
    dw $0AF8, $E000  ; Samus subpixel X
    dw $0AFA, $058B  ; Samus Y
    dw $D878, $0004  ; Items
    dw #$FFFF

preset_zfackpdr_wave_and_ice_hopper_statue_room:
    dw #preset_zfackpdr_wave_and_ice_bubbly_troubly_ ; Wave and Ice: Bubbly Troubly 
    dw $078D, $94E8  ; DDB
    dw $079B, $A228  ; MDB
    dw $090F, $F000  ; Screen subpixel X position
    dw $0913, $A400  ; Screen subpixel Y position
    dw $0915, $00FB  ; Screen Y position in pixels
    dw $0919, $00FB  ; Layer 2 Y position
    dw $09C2, $009C  ; Health
    dw $0AF6, $003D  ; Samus X
    dw $0AF8, $B900  ; Samus subpixel X
    dw $0AFA, $0199  ; Samus Y
    dw $0AFC, $8C00  ; Samus subpixel Y
    dw #$FFFF

preset_zfackpdr_wave_and_ice_gate_scam_three:
    dw #preset_zfackpdr_wave_and_ice_hopper_statue_room ; Wave and Ice: Hopper Statue Room
    dw $078D, $9500  ; DDB
    dw $079B, $A282  ; MDB
    dw $090F, $4000  ; Screen subpixel X position
    dw $0913, $D800  ; Screen subpixel Y position
    dw $0915, $011F  ; Screen Y position in pixels
    dw $09CA, $0004  ; Supers
    dw $0AF6, $0044  ; Samus X
    dw $0AF8, $0000  ; Samus subpixel X
    dw $0AFA, $01A3  ; Samus Y
    dw $0AFC, $FFFF  ; Samus subpixel Y
    dw $D8B8, $0200  ; Doors
    dw #$FFFF

preset_zfackpdr_wave_and_ice_bubble_lava_room:
    dw #preset_zfackpdr_wave_and_ice_gate_scam_three ; Wave and Ice: Gate Scam Three
    dw $078D, $9548  ; DDB
    dw $079B, $A2B5  ; MDB
    dw $090F, $5000  ; Screen subpixel X position
    dw $0911, $0300  ; Screen X position in pixels
    dw $0913, $C400  ; Screen subpixel Y position
    dw $0915, $0400  ; Screen Y position in pixels
    dw $0917, $0300  ; Layer 2 X position
    dw $0919, $0400  ; Layer 2 Y position
    dw $09C6, $000F  ; Missiles
    dw $09C8, $0014  ; Max missiles
    dw $09CA, $0002  ; Supers
    dw $0A1C, $0001  ; Samus position/state
    dw $0A1E, $0008  ; More position/state
    dw $0AF6, $03C4  ; Samus X
    dw $0AF8, $EFFF  ; Samus subpixel X
    dw $0AFA, $048B  ; Samus Y
    dw $D878, $0044  ; Items
    dw #$FFFF

preset_zfackpdr_wave_and_ice_freeze_booger_room:
    dw #preset_zfackpdr_wave_and_ice_bubble_lava_room ; Wave and Ice: Bubble Lava Room
    dw $078D, $9698  ; DDB
    dw $079B, $A4E3  ; MDB
    dw $090F, $8001  ; Screen subpixel X position
    dw $0911, $0000  ; Screen X position in pixels
    dw $0913, $4000  ; Screen subpixel Y position
    dw $0915, $011F  ; Screen Y position in pixels
    dw $0917, $0000  ; Layer 2 X position
    dw $0919, $011F  ; Layer 2 Y position
    dw $09C2, $0075  ; Health
    dw $09C6, $000E  ; Missiles
    dw $0AF6, $0057  ; Samus X
    dw $0AF8, $4000  ; Samus subpixel X
    dw $0AFA, $01BB  ; Samus Y
    dw #$FFFF

preset_zfackpdr_wave_and_ice_wave_bugs_down:
    dw #preset_zfackpdr_wave_and_ice_freeze_booger_room ; Wave and Ice: Freeze Booger Room
    dw $078D, $96BC  ; DDB
    dw $079B, $A514  ; MDB
    dw $07F5, $0003  ; Music Track
    dw $090F, $8000  ; Screen subpixel X position
    dw $0911, $0200  ; Screen X position in pixels
    dw $0913, $6C00  ; Screen subpixel Y position
    dw $0915, $0000  ; Screen Y position in pixels
    dw $0917, $0180  ; Layer 2 X position
    dw $0919, $0000  ; Layer 2 Y position
    dw $09C2, $0054  ; Health
    dw $09CA, $0000  ; Supers
    dw $0AF6, $02C8  ; Samus X
    dw $0AF8, $B000  ; Samus subpixel X
    dw $0AFA, $008B  ; Samus Y
    dw #$FFFF

preset_zfackpdr_wave_and_ice_wave_escape:
    dw #preset_zfackpdr_wave_and_ice_wave_bugs_down ; Wave and Ice: Wave Bugs Down
    dw $078D, $9758  ; DDB
    dw $079B, $A547  ; MDB
    dw $090F, $9000  ; Screen subpixel X position
    dw $0911, $0000  ; Screen X position in pixels
    dw $0913, $4800  ; Screen subpixel Y position
    dw $0915, $0005  ; Screen Y position in pixels
    dw $0917, $0000  ; Layer 2 X position
    dw $0919, $0003  ; Layer 2 Y position
    dw $09A6, $0001  ; Beams
    dw $09A8, $0001  ; Beams
    dw $09C2, $009F  ; Health
    dw $09C6, $000D  ; Missiles
    dw $09CA, $0001  ; Supers
    dw $0A1C, $0002  ; Samus position/state
    dw $0A1E, $0004  ; More position/state
    dw $0AF6, $0035  ; Samus X
    dw $0AF8, $6000  ; Samus subpixel X
    dw $D878, $0844  ; Items
    dw $D8B8, $1200  ; Doors
    dw #$FFFF

preset_zfackpdr_wave_and_ice_bubble_lava_room_revisit:
    dw #preset_zfackpdr_wave_and_ice_wave_escape ; Wave and Ice: Wave Escape
    dw $078D, $9740  ; DDB
    dw $079B, $A4E3  ; MDB
    dw $07F5, $0005  ; Music Track
    dw $090F, $0000  ; Screen subpixel X position
    dw $0913, $0000  ; Screen subpixel Y position
    dw $0915, $001D  ; Screen Y position in pixels
    dw $0919, $001D  ; Layer 2 Y position
    dw $0AF6, $0043  ; Samus X
    dw $0AF8, $8000  ; Samus subpixel X
    dw #$FFFF

preset_zfackpdr_wave_and_ice_spiky_nova_room:
    dw #preset_zfackpdr_wave_and_ice_bubble_lava_room_revisit ; Wave and Ice: Bubble Lava Room Revisit
    dw $078D, $968C  ; DDB
    dw $079B, $A2B5  ; MDB
    dw $090F, $2000  ; Screen subpixel X position
    dw $0911, $0300  ; Screen X position in pixels
    dw $0913, $3800  ; Screen subpixel Y position
    dw $0915, $0101  ; Screen Y position in pixels
    dw $0917, $0300  ; Layer 2 X position
    dw $0919, $0101  ; Layer 2 Y position
    dw $09C2, $0065  ; Health
    dw $09C6, $000F  ; Missiles
    dw $0A1C, $0001  ; Samus position/state
    dw $0A1E, $0008  ; More position/state
    dw $0AF6, $03B9  ; Samus X
    dw $0AF8, $D000  ; Samus subpixel X
    dw $0AFA, $018B  ; Samus Y
    dw #$FFFF

preset_zfackpdr_wave_and_ice_rising_lava_platforms:
    dw #preset_zfackpdr_wave_and_ice_spiky_nova_room ; Wave and Ice: Spiky Nova Room
    dw $078D, $9608  ; DDB
    dw $079B, $A31B  ; MDB
    dw $090F, $6000  ; Screen subpixel X position
    dw $0911, $0100  ; Screen X position in pixels
    dw $0913, $1400  ; Screen subpixel Y position
    dw $0915, $0100  ; Screen Y position in pixels
    dw $0917, $00C0  ; Layer 2 X position
    dw $0919, $00C0  ; Layer 2 Y position
    dw $09C2, $0083  ; Health
    dw $0AF6, $01C0  ; Samus X
    dw $0AF8, $DA7F  ; Samus subpixel X
    dw #$FFFF

preset_zfackpdr_wave_and_ice_ice_pirate_tower:
    dw #preset_zfackpdr_wave_and_ice_rising_lava_platforms ; Wave and Ice: Rising Lava Platforms
    dw $078D, $9614  ; DDB
    dw $079B, $A377  ; MDB
    dw $090F, $2C00  ; Screen subpixel X position
    dw $0911, $0300  ; Screen X position in pixels
    dw $0913, $4400  ; Screen subpixel Y position
    dw $0915, $0000  ; Screen Y position in pixels
    dw $0917, $0240  ; Layer 2 X position
    dw $0919, $0000  ; Layer 2 Y position
    dw $09C2, $00A1  ; Health
    dw $09C6, $0011  ; Missiles
    dw $09C8, $0019  ; Max missiles
    dw $0AF6, $03B9  ; Samus X
    dw $0AF8, $F27F  ; Samus subpixel X
    dw $0AFA, $008B  ; Samus Y
    dw $0AFC, $17FF  ; Samus subpixel Y
    dw $D878, $0944  ; Items
    dw #$FFFF

preset_zfackpdr_wave_and_ice_ice_escape:
    dw #preset_zfackpdr_wave_and_ice_ice_pirate_tower ; Wave and Ice: Ice Pirate Tower
    dw $078D, $9668  ; DDB
    dw $079B, $A3A4  ; MDB
    dw $090F, $1000  ; Screen subpixel X position
    dw $0911, $0000  ; Screen X position in pixels
    dw $0913, $E400  ; Screen subpixel Y position
    dw $0915, $0162  ; Screen Y position in pixels
    dw $0917, $0000  ; Layer 2 X position
    dw $0919, $0109  ; Layer 2 Y position
    dw $09A6, $0003  ; Beams
    dw $09A8, $0003  ; Beams
    dw $09C6, $0009  ; Missiles
    dw $0AF6, $0072  ; Samus X
    dw $0AF8, $8000  ; Samus subpixel X
    dw $0AFA, $01FB  ; Samus Y
    dw $0AFC, $FFFF  ; Samus subpixel Y
    dw $D878, $0B44  ; Items
    dw $D8B8, $1600  ; Doors
    dw #$FFFF

preset_zfackpdr_power_bombs_boot_bug_bonanza:
    dw #preset_zfackpdr_wave_and_ice_ice_escape ; Wave and Ice: Ice Escape
    dw $078D, $9680  ; DDB
    dw $079B, $9DC2  ; MDB
    dw $090F, $7400  ; Screen subpixel X position
    dw $0911, $0300  ; Screen X position in pixels
    dw $0913, $0000  ; Screen subpixel Y position
    dw $0915, $031C  ; Screen Y position in pixels
    dw $0917, $0240  ; Layer 2 X position
    dw $0919, $0255  ; Layer 2 Y position
    dw $09C2, $00C7  ; Health
    dw $09CA, $0002  ; Supers
    dw $0AF6, $03BB  ; Samus X
    dw $0AF8, $6FFF  ; Samus subpixel X
    dw $0AFA, $038B  ; Samus Y
    dw #$FFFF

preset_zfackpdr_power_bombs_norfair_lobby:
    dw #preset_zfackpdr_power_bombs_boot_bug_bonanza ; Power Bombs: Boot Bug Bonanza
    dw $078D, $91E8  ; DDB
    dw $079B, $A027  ; MDB
    dw $090F, $6700  ; Screen subpixel X position
    dw $0911, $0000  ; Screen X position in pixels
    dw $0915, $002E  ; Screen Y position in pixels
    dw $0917, $0000  ; Layer 2 X position
    dw $0919, $0022  ; Layer 2 Y position
    dw $09A2, $1105  ; Equipped Items
    dw $09A4, $1105  ; Collected Items
    dw $09C6, $000D  ; Missiles
    dw $0A1C, $0002  ; Samus position/state
    dw $0A1E, $0004  ; More position/state
    dw $0AF6, $0044  ; Samus X
    dw $0AF8, $D780  ; Samus subpixel X
    dw $0AFA, $009E  ; Samus Y
    dw $D876, $8000  ; Items
    dw #$FFFF

preset_zfackpdr_power_bombs_map_tower_up:
    dw #preset_zfackpdr_power_bombs_norfair_lobby ; Power Bombs: Norfair Lobby
    dw $078D, $91AC  ; DDB
    dw $079B, $9FA0  ; MDB
    dw $090F, $9D81  ; Screen subpixel X position
    dw $0915, $001D  ; Screen Y position in pixels
    dw $0919, $0015  ; Layer 2 Y position
    dw $09C6, $0011  ; Missiles
    dw $0AF6, $0040  ; Samus X
    dw $0AF8, $E000  ; Samus subpixel X
    dw $0AFA, $008B  ; Samus Y
    dw #$FFFF

preset_zfackpdr_power_bombs_cac_attack_revisit:
    dw #preset_zfackpdr_power_bombs_map_tower_up ; Power Bombs: Map Tower Up
    dw $078D, $9338  ; DDB
    dw $079B, $9DF7  ; MDB
    dw $090F, $8000  ; Screen subpixel X position
    dw $0913, $9400  ; Screen subpixel Y position
    dw $0915, $0006  ; Screen Y position in pixels
    dw $0919, $0004  ; Layer 2 Y position
    dw $09C6, $0013  ; Missiles
    dw $09CA, $0003  ; Supers
    dw $0AF6, $002F  ; Samus X
    dw $0AF8, $1000  ; Samus subpixel X
    dw $D8B8, $1610  ; Doors
    dw #$FFFF

preset_zfackpdr_power_bombs_ceiling_missiles:
    dw #preset_zfackpdr_power_bombs_cac_attack_revisit ; Power Bombs: Cac Attack Revisit
    dw $078D, $926C  ; DDB
    dw $079B, $9E8C  ; MDB
    dw $090F, $6000  ; Screen subpixel X position
    dw $0913, $1400  ; Screen subpixel Y position
    dw $0915, $0200  ; Screen Y position in pixels
    dw $0919, $01C0  ; Layer 2 Y position
    dw $09C6, $0019  ; Missiles
    dw $09CA, $0005  ; Supers
    dw $0AF6, $006D  ; Samus X
    dw $0AF8, $CC00  ; Samus subpixel X
    dw $0AFA, $028B  ; Samus Y
    dw #$FFFF

preset_zfackpdr_power_bombs_gate_scam_four:
    dw #preset_zfackpdr_power_bombs_ceiling_missiles ; Power Bombs: Ceiling Missiles
    dw $078D, $9404  ; DDB
    dw $079B, $9EBD  ; MDB
    dw $090F, $3FFF  ; Screen subpixel X position
    dw $0913, $0000  ; Screen subpixel Y position
    dw $0915, $0100  ; Screen Y position in pixels
    dw $0919, $0100  ; Layer 2 Y position
    dw $09C6, $001E  ; Missiles
    dw $09C8, $001E  ; Max missiles
    dw $0AF6, $0037  ; Samus X
    dw $0AF8, $D000  ; Samus subpixel X
    dw $0AFA, $018B  ; Samus Y
    dw $D876, $8400  ; Items
    dw #$FFFF

preset_zfackpdr_power_bombs_face_climb:
    dw #preset_zfackpdr_power_bombs_gate_scam_four ; Power Bombs: Gate Scam Four
    dw $078D, $92CC  ; DDB
    dw $079B, $A0B6  ; MDB
    dw $090F, $6001  ; Screen subpixel X position
    dw $0913, $B800  ; Screen subpixel Y position
    dw $0915, $031F  ; Screen Y position in pixels
    dw $0919, $0257  ; Layer 2 Y position
    dw $09C2, $00BA  ; Health
    dw $0AF6, $0030  ; Samus X
    dw $0AF8, $5000  ; Samus subpixel X
    dw $0AFA, $03AB  ; Samus Y
    dw #$FFFF

preset_zfackpdr_power_bombs_hidden_hoppers:
    dw #preset_zfackpdr_power_bombs_face_climb ; Power Bombs: Face Climb
    dw $078D, $9428  ; DDB
    dw $079B, $A4B4  ; MDB
    dw $090F, $E000  ; Screen subpixel X position
    dw $0913, $F400  ; Screen subpixel Y position
    dw $0915, $001C  ; Screen Y position in pixels
    dw $0919, $001C  ; Layer 2 Y position
    dw $09C2, $00AB  ; Health
    dw $09CA, $0004  ; Supers
    dw $0AF6, $00AC  ; Samus X
    dw $0AF8, $DFFF  ; Samus subpixel X
    dw $0AFA, $008B  ; Samus Y
    dw $D8B8, $1E10  ; Doors
    dw #$FFFF

preset_zfackpdr_power_bombs_spiky_platform_tower:
    dw #preset_zfackpdr_power_bombs_hidden_hoppers ; Power Bombs: Hidden Hoppers
    dw $078D, $96EC  ; DDB
    dw $079B, $A174  ; MDB
    dw $090F, $0000  ; Screen subpixel X position
    dw $0911, $0112  ; Screen X position in pixels
    dw $0913, $0000  ; Screen subpixel Y position
    dw $0915, $000B  ; Screen Y position in pixels
    dw $0917, $00CD  ; Layer 2 X position
    dw $0919, $0008  ; Layer 2 Y position
    dw $09C2, $0029  ; Health
    dw $09C6, $0023  ; Missiles
    dw $09C8, $0023  ; Max missiles
    dw $0A1C, $0001  ; Samus position/state
    dw $0A1E, $0008  ; More position/state
    dw $0AF6, $0172  ; Samus X
    dw $0AF8, $FFFF  ; Samus subpixel X
    dw $0AFA, $007B  ; Samus Y
    dw $D878, $0B4C  ; Items
    dw #$FFFF

preset_zfackpdr_power_bombs_waveless_softlock:
    dw #preset_zfackpdr_power_bombs_spiky_platform_tower ; Power Bombs: Spiky Platform Tower
    dw $078D, $94AC  ; DDB
    dw $079B, $A1A1  ; MDB
    dw $090F, $4FFF  ; Screen subpixel X position
    dw $0911, $0000  ; Screen X position in pixels
    dw $0915, $000D  ; Screen Y position in pixels
    dw $0917, $0000  ; Layer 2 X position
    dw $0919, $000B  ; Layer 2 Y position
    dw $09C2, $002E  ; Health
    dw $0AF6, $00C8  ; Samus X
    dw $0AF8, $3FFF  ; Samus subpixel X
    dw #$FFFF

preset_zfackpdr_power_bombs_croc:
    dw #preset_zfackpdr_power_bombs_waveless_softlock ; Power Bombs: Waveless Softlock
    dw $078D, $9308  ; DDB
    dw $079B, $9EEA  ; MDB
    dw $090F, $7000  ; Screen subpixel X position
    dw $0911, $01BF  ; Screen X position in pixels
    dw $0913, $D000  ; Screen subpixel Y position
    dw $0915, $001F  ; Screen Y position in pixels
    dw $0917, $0187  ; Layer 2 X position
    dw $0919, $001B  ; Layer 2 Y position
    dw $09C2, $00C7  ; Health
    dw $09CA, $0003  ; Supers
    dw $0A1C, $0027  ; Samus position/state
    dw $0A1E, $0508  ; More position/state
    dw $0AF6, $0257  ; Samus X
    dw $0AF8, $4000  ; Samus subpixel X
    dw $0AFA, $00C0  ; Samus Y
    dw $D8B8, $1E1C  ; Doors
    dw #$FFFF

preset_zfackpdr_power_bombs_power_bombs_2:
    dw #preset_zfackpdr_power_bombs_croc ; Power Bombs: Croc
    dw $078D, $92D8  ; DDB
    dw $079B, $981D  ; MDB
    dw $07F3, $0027  ; Music Bank
    dw $07F5, $0006  ; Music Track
    dw $090F, $4000  ; Screen subpixel X position
    dw $0911, $0600  ; Screen X position in pixels
    dw $0913, $0000  ; Screen subpixel Y position
    dw $0915, $0000  ; Screen Y position in pixels
    dw $0917, $0000  ; Layer 2 X position
    dw $0919, $0001  ; Layer 2 Y position
    dw $09C6, $0018  ; Missiles
    dw $09CA, $0000  ; Supers
    dw $0A1C, $0001  ; Samus position/state
    dw $0A1E, $0008  ; More position/state
    dw $0AF6, $06D2  ; Samus X
    dw $0AF8, $B000  ; Samus subpixel X
    dw $0AFA, $008B  ; Samus Y
    dw $D82A, $0002  ; Bosses
    dw $D8B6, $0001  ; Doors
    dw #$FFFF

preset_zfackpdr_chozo_orbs_lava_death_revisit:
    dw #preset_zfackpdr_power_bombs_power_bombs_2 ; Power Bombs: Power Bombs
    dw $078D, $92B4  ; DDB
    dw $079B, $9E2A  ; MDB
    dw $07F3, $0015  ; Music Bank
    dw $07F5, $0005  ; Music Track
    dw $090F, $2001  ; Screen subpixel X position
    dw $0911, $0300  ; Screen X position in pixels
    dw $0913, $5000  ; Screen subpixel Y position
    dw $0915, $0205  ; Screen Y position in pixels
    dw $0917, $02A0  ; Layer 2 X position
    dw $0919, $01C4  ; Layer 2 Y position
    dw $09CA, $0002  ; Supers
    dw $09CE, $0004  ; Pbs
    dw $09D0, $0005  ; Max pbs
    dw $0AF6, $035B  ; Samus X
    dw $0AF8, $5000  ; Samus subpixel X
    dw $0AFA, $028B  ; Samus Y
    dw $D876, $8500  ; Items
    dw $D8B6, $4001  ; Doors
    dw #$FFFF

preset_zfackpdr_chozo_orbs_red_tower:
    dw #preset_zfackpdr_chozo_orbs_lava_death_revisit ; Chozo Orbs: Lava Death Revisit
    dw $078D, $893C  ; DDB
    dw $079B, $9110  ; MDB
    dw $07F3, $0012  ; Music Bank
    dw $090F, $B000  ; Screen subpixel X position
    dw $0911, $0100  ; Screen X position in pixels
    dw $0913, $F7FF  ; Screen subpixel Y position
    dw $0915, $001F  ; Screen Y position in pixels
    dw $0917, $00E0  ; Layer 2 X position
    dw $0919, $001B  ; Layer 2 Y position
    dw $09C2, $00B7  ; Health
    dw $09C6, $0017  ; Missiles
    dw $09CE, $0005  ; Pbs
    dw $0AF6, $01C2  ; Samus X
    dw $0AF8, $C3FF  ; Samus subpixel X
    dw $0AFA, $00A9  ; Samus Y
    dw #$FFFF

preset_zfackpdr_chozo_orbs_jungle_boost:
    dw #preset_zfackpdr_chozo_orbs_red_tower ; Chozo Orbs: Red Tower
    dw $078D, $88A0  ; DDB
    dw $079B, $907D  ; MDB
    dw $0911, $0300  ; Screen X position in pixels
    dw $0913, $7400  ; Screen subpixel Y position
    dw $0915, $0100  ; Screen Y position in pixels
    dw $0917, $0300  ; Layer 2 X position
    dw $0919, $0100  ; Layer 2 Y position
    dw $09C2, $00AD  ; Health
    dw $0AF6, $03BE  ; Samus X
    dw $0AF8, $3FFF  ; Samus subpixel X
    dw $0AFA, $018B  ; Samus Y
    dw #$FFFF

preset_zfackpdr_chozo_orbs_green_tunnel_tower:
    dw #preset_zfackpdr_chozo_orbs_jungle_boost ; Chozo Orbs: Jungle Boost
    dw $078D, $884C  ; DDB
    dw $079B, $9263  ; MDB
    dw $07F3, $000F  ; Music Bank
    dw $090F, $0000  ; Screen subpixel X position
    dw $0911, $0400  ; Screen X position in pixels
    dw $0913, $2BFE  ; Screen subpixel Y position
    dw $0915, $0000  ; Screen Y position in pixels
    dw $0919, $0000  ; Layer 2 Y position
    dw $09C2, $00B4  ; Health
    dw $0AF6, $04B5  ; Samus X
    dw $0AF8, $EFFF  ; Samus subpixel X
    dw $0AFA, $008B  ; Samus Y
    dw #$FFFF

preset_zfackpdr_chozo_orbs_charge_beam:
    dw #preset_zfackpdr_chozo_orbs_green_tunnel_tower ; Chozo Orbs: Green Tunnel Tower
    dw $078D, $89B4  ; DDB
    dw $079B, $8E1C  ; MDB
    dw $090F, $B000  ; Screen subpixel X position
    dw $0911, $0900  ; Screen X position in pixels
    dw $0913, $87FF  ; Screen subpixel Y position
    dw $0917, $07E0  ; Layer 2 X position
    dw $09C2, $00C3  ; Health
    dw $09C6, $0019  ; Missiles
    dw $0AF6, $09CD  ; Samus X
    dw $0AF8, $4FFF  ; Samus subpixel X
    dw #$FFFF

preset_zfackpdr_chozo_orbs_pink_elevator:
    dw #preset_zfackpdr_chozo_orbs_charge_beam ; Chozo Orbs: Charge Beam
    dw $078D, $8AD4  ; DDB
    dw $079B, $92EE  ; MDB
    dw $090F, $C000  ; Screen subpixel X position
    dw $0911, $0200  ; Screen X position in pixels
    dw $0913, $7400  ; Screen subpixel Y position
    dw $0915, $0100  ; Screen Y position in pixels
    dw $0917, $01C0  ; Layer 2 X position
    dw $0919, $00E0  ; Layer 2 Y position
    dw $09A6, $1003  ; Beams
    dw $09A8, $1003  ; Beams
    dw $09C6, $0012  ; Missiles
    dw $0AF6, $02C2  ; Samus X
    dw $0AF8, $7000  ; Samus subpixel X
    dw $0AFA, $018B  ; Samus Y
    dw $D874, $0100  ; Items
    dw $D8B4, $0040  ; Doors
    dw #$FFFF

preset_zfackpdr_chozo_orbs_noob_bridge:
    dw #preset_zfackpdr_chozo_orbs_pink_elevator ; Chozo Orbs: Pink Elevator
    dw $078D, $8C18  ; DDB
    dw $079B, $931D  ; MDB
    dw $090F, $2000  ; Screen subpixel X position
    dw $0911, $0300  ; Screen X position in pixels
    dw $0913, $9C00  ; Screen subpixel Y position
    dw $0915, $0200  ; Screen Y position in pixels
    dw $0917, $0300  ; Layer 2 X position
    dw $0919, $01C0  ; Layer 2 Y position
    dw $09C2, $00B3  ; Health
    dw $0AF6, $03C4  ; Samus X
    dw $0AF8, $FFFF  ; Samus subpixel X
    dw $0AFA, $028B  ; Samus Y
    dw #$FFFF

preset_zfackpdr_chozo_orbs_save_station:
    dw #preset_zfackpdr_chozo_orbs_noob_bridge ; Chozo Orbs: Noob Bridge
    dw $078D, $8C0C  ; DDB
    dw $079B, $94DC  ; MDB
    dw $090F, $7000  ; Screen subpixel X position
    dw $0911, $0000  ; Screen X position in pixels
    dw $0913, $D800  ; Screen subpixel Y position
    dw $0915, $02F7  ; Screen Y position in pixels
    dw $0917, $0000  ; Layer 2 X position
    dw $0919, $0239  ; Layer 2 Y position
    dw $09C2, $0084  ; Health
    dw $09C6, $000D  ; Missiles
    dw $09CA, $0007  ; Supers
    dw $09CC, $000A  ; Max supers
    dw $09CE, $0004  ; Pbs
    dw $0AF6, $00C6  ; Samus X
    dw $0AF8, $1FFF  ; Samus subpixel X
    dw $0AFA, $038B  ; Samus Y
    dw $D874, $0900  ; Items
    dw $D8B4, $0440  ; Doors
    dw #$FFFF

preset_zfackpdr_chozo_orbs_pain_lake:
    dw #preset_zfackpdr_chozo_orbs_save_station ; Chozo Orbs: Save Station
    dw $078D, $8D38  ; DDB
    dw $079B, $93B6  ; MDB
    dw $090F, $A000  ; Screen subpixel X position
    dw $0913, $9400  ; Screen subpixel Y position
    dw $0915, $051F  ; Screen Y position in pixels
    dw $0919, $03D7  ; Layer 2 Y position
    dw $09C2, $0120  ; Health
    dw $09C4, $012B  ; Max health
    dw $09CA, $0008  ; Supers
    dw $09CE, $0003  ; Pbs
    dw $0AF6, $0053  ; Samus X
    dw $0AF8, $0000  ; Samus subpixel X
    dw $0AFA, $05BB  ; Samus Y
    dw $D874, $4900  ; Items
    dw #$FFFF

preset_zfackpdr_chozo_orbs_chozo_orbs_2:
    dw #preset_zfackpdr_chozo_orbs_pain_lake ; Chozo Orbs: Pain Lake
    dw $078D, $8B7C  ; DDB
    dw $079B, $9420  ; MDB
    dw $090F, $1000  ; Screen subpixel X position
    dw $0913, $0000  ; Screen subpixel Y position
    dw $0915, $0232  ; Screen Y position in pixels
    dw $0919, $01EB  ; Layer 2 Y position
    dw $09C2, $00F4  ; Health
    dw $09CA, $000A  ; Supers
    dw $09CE, $0001  ; Pbs
    dw $0A1C, $0002  ; Samus position/state
    dw $0A1E, $0004  ; More position/state
    dw $0AF6, $0045  ; Samus X
    dw $0AF8, $6000  ; Samus subpixel X
    dw $0AFA, $029B  ; Samus Y
    dw $D8B4, $0640  ; Doors
    dw #$FFFF

preset_zfackpdr_speed_booster_tunnel_lake:
    dw #preset_zfackpdr_chozo_orbs_chozo_orbs_2 ; Chozo Orbs: Chozo Orbs
    dw $078D, $8BD0  ; DDB
    dw $079B, $8B35  ; MDB
    dw $07F3, $0024  ; Music Bank
    dw $07F5, $0003  ; Music Track
    dw $090F, $7000  ; Screen subpixel X position
    dw $0913, $1000  ; Screen subpixel Y position
    dw $0915, $0000  ; Screen Y position in pixels
    dw $0919, $0000  ; Layer 2 Y position
    dw $09C2, $0034  ; Health
    dw $09C6, $000C  ; Missiles
    dw $09CA, $0005  ; Supers
    dw $0A1C, $008A  ; Samus position/state
    dw $0A1E, $1504  ; More position/state
    dw $0AF6, $0025  ; Samus X
    dw $0AF8, $0000  ; Samus subpixel X
    dw $0AFA, $00AB  ; Samus Y
    dw $D828, $0405  ; Bosses
    dw $D8B2, $0062  ; Doors
    dw #$FFFF

preset_zfackpdr_speed_booster_mini_kraid_hall:
    dw #preset_zfackpdr_speed_booster_tunnel_lake ; Speed Booster: Tunnel Lake
    dw $078D, $8540  ; DDB
    dw $079B, $92BD  ; MDB
    dw $07F3, $000F  ; Music Bank
    dw $07F5, $0005  ; Music Track
    dw $090F, $A000  ; Screen subpixel X position
    dw $0911, $0100  ; Screen X position in pixels
    dw $0913, $0000  ; Screen subpixel Y position
    dw $0915, $0124  ; Screen Y position in pixels
    dw $0917, $00C0  ; Layer 2 X position
    dw $0919, $00DB  ; Layer 2 Y position
    dw $09C2, $0054  ; Health
    dw $09C6, $0009  ; Missiles
    dw $09CA, $0006  ; Supers
    dw $09CE, $0004  ; Pbs
    dw $0A1C, $0002  ; Samus position/state
    dw $0A1E, $0004  ; More position/state
    dw $0AF6, $0138  ; Samus X
    dw $0AF8, $F000  ; Samus subpixel X
    dw $0AFA, $018B  ; Samus Y
    dw #$FFFF

preset_zfackpdr_speed_booster_hopper_madness:
    dw #preset_zfackpdr_speed_booster_mini_kraid_hall ; Speed Booster: Mini Kraid Hall
    dw $078D, $8744  ; DDB
    dw $079B, $8DA3  ; MDB
    dw $07F3, $0027  ; Music Bank
    dw $07F5, $0006  ; Music Track
    dw $090F, $6800  ; Screen subpixel X position
    dw $0911, $0000  ; Screen X position in pixels
    dw $0913, $F400  ; Screen subpixel Y position
    dw $0915, $0100  ; Screen Y position in pixels
    dw $0917, $0000  ; Layer 2 X position
    dw $0919, $0100  ; Layer 2 Y position
    dw $09C2, $00C5  ; Health
    dw $09C6, $0006  ; Missiles
    dw $09CA, $0003  ; Supers
    dw $0AF6, $0045  ; Samus X
    dw $0AF8, $A3FF  ; Samus subpixel X
    dw $D8B2, $2262  ; Doors
    dw #$FFFF

preset_zfackpdr_speed_booster_enter_maridia:
    dw #preset_zfackpdr_speed_booster_hopper_madness ; Speed Booster: Hopper Madness
    dw $078D, $8654  ; DDB
    dw $079B, $8F07  ; MDB
    dw $07F3, $0012  ; Music Bank
    dw $07F5, $0005  ; Music Track
    dw $090F, $A000  ; Screen subpixel X position
    dw $0913, $7C00  ; Screen subpixel Y position
    dw $0915, $0000  ; Screen Y position in pixels
    dw $0919, $0000  ; Layer 2 Y position
    dw $09C2, $0040  ; Health
    dw $09C6, $0000  ; Missiles
    dw $09CA, $0001  ; Supers
    dw $0AF6, $003C  ; Samus X
    dw $0AF8, $1000  ; Samus subpixel X
    dw $0AFA, $008B  ; Samus Y
    dw #$FFFF

preset_zfackpdr_speed_booster_sand_tower_down:
    dw #preset_zfackpdr_speed_booster_enter_maridia ; Speed Booster: Enter Maridia
    dw $078D, $9CF8  ; DDB
    dw $079B, $B1BF  ; MDB
    dw $07F3, $001B  ; Music Bank
    dw $090F, $8000  ; Screen subpixel X position
    dw $0913, $BC00  ; Screen subpixel Y position
    dw $0915, $0024  ; Screen Y position in pixels
    dw $0919, $001B  ; Layer 2 Y position
    dw $09C2, $0068  ; Health
    dw $0AF6, $003B  ; Samus X
    dw $0AF8, $D000  ; Samus subpixel X
    dw $D820, $0801  ; Events
    dw #$FFFF

preset_zfackpdr_speed_booster_sand_hall:
    dw #preset_zfackpdr_speed_booster_sand_tower_down ; Speed Booster: Sand Tower Down
    dw $078D, $9E24  ; DDB
    dw $079B, $B2A8  ; MDB
    dw $090F, $D000  ; Screen subpixel X position
    dw $0911, $0200  ; Screen X position in pixels
    dw $0913, $8800  ; Screen subpixel Y position
    dw $0915, $0100  ; Screen Y position in pixels
    dw $0917, $0200  ; Layer 2 X position
    dw $0919, $00E0  ; Layer 2 Y position
    dw $09C2, $0070  ; Health
    dw $09C6, $0002  ; Missiles
    dw $09CE, $0005  ; Pbs
    dw $0A1C, $0001  ; Samus position/state
    dw $0A1E, $0008  ; More position/state
    dw $0AF6, $02C0  ; Samus X
    dw $0AF8, $3BFF  ; Samus subpixel X
    dw $0AFA, $018B  ; Samus Y
    dw #$FFFF

preset_zfackpdr_speed_booster_platform_climb:
    dw #preset_zfackpdr_speed_booster_sand_hall ; Speed Booster: Sand Hall
    dw $078D, $9DC4  ; DDB
    dw $079B, $B3B6  ; MDB
    dw $090F, $9301  ; Screen subpixel X position
    dw $0911, $0300  ; Screen X position in pixels
    dw $0913, $D801  ; Screen subpixel Y position
    dw $0915, $000D  ; Screen Y position in pixels
    dw $0917, $0300  ; Layer 2 X position
    dw $0919, $0009  ; Layer 2 Y position
    dw $09C6, $0004  ; Missiles
    dw $09CE, $0003  ; Pbs
    dw $09D2, $0003  ; Currently selected item
    dw $0AF6, $03D6  ; Samus X
    dw $0AF8, $B000  ; Samus subpixel X
    dw $0AFA, $008B  ; Samus Y
    dw #$FFFF

preset_zfackpdr_speed_booster_speed_escape:
    dw #preset_zfackpdr_speed_booster_platform_climb ; Speed Booster: Platform Climb
    dw $078D, $9E84  ; DDB
    dw $079B, $B3E3  ; MDB
    dw $090F, $0000  ; Screen subpixel X position
    dw $0911, $0000  ; Screen X position in pixels
    dw $0913, $0000  ; Screen subpixel Y position
    dw $0915, $032D  ; Screen Y position in pixels
    dw $0917, $0000  ; Layer 2 X position
    dw $0919, $0261  ; Layer 2 Y position
    dw $09A2, $3105  ; Equipped Items
    dw $09A4, $3105  ; Collected Items
    dw $09C2, $0089  ; Health
    dw $09C6, $0006  ; Missiles
    dw $09CA, $0000  ; Supers
    dw $09CE, $0001  ; Pbs
    dw $09D2, $0000  ; Currently selected item
    dw $0A1C, $0002  ; Samus position/state
    dw $0A1E, $0004  ; More position/state
    dw $0AF6, $0025  ; Samus X
    dw $0AF8, $0000  ; Samus subpixel X
    dw $0AFA, $039B  ; Samus Y
    dw $D87A, $0800  ; Items
    dw $D8BC, $0002  ; Doors
    dw #$FFFF

preset_zfackpdr_speed_booster_sand_tower_up:
    dw #preset_zfackpdr_speed_booster_speed_escape ; Speed Booster: Speed Escape
    dw $078D, $9E30  ; DDB
    dw $079B, $B45B  ; MDB
    dw $090F, $3800  ; Screen subpixel X position
    dw $0913, $9400  ; Screen subpixel Y position
    dw $0915, $0014  ; Screen Y position in pixels
    dw $0919, $000F  ; Layer 2 Y position
    dw $09C2, $012B  ; Health
    dw $09C6, $0023  ; Missiles
    dw $09CA, $000A  ; Supers
    dw $0AF6, $0030  ; Samus X
    dw $0AFA, $008B  ; Samus Y
    dw #$FFFF

preset_zfackpdr_speed_booster_shaktool:
    dw #preset_zfackpdr_speed_booster_sand_tower_up ; Speed Booster: Sand Tower Up
    dw $078D, $9D7C  ; DDB
    dw $079B, $B1BF  ; MDB
    dw $090F, $2400  ; Screen subpixel X position
    dw $0911, $0300  ; Screen X position in pixels
    dw $0913, $D000  ; Screen subpixel Y position
    dw $0915, $0100  ; Screen Y position in pixels
    dw $0917, $0240  ; Layer 2 X position
    dw $0919, $00C0  ; Layer 2 Y position
    dw $09CE, $0003  ; Pbs
    dw $0A1C, $0001  ; Samus position/state
    dw $0A1E, $0008  ; More position/state
    dw $0AF6, $03BF  ; Samus X
    dw $0AF8, $FFFF  ; Samus subpixel X
    dw $0AFA, $018B  ; Samus Y
    dw #$FFFF

preset_zfackpdr_kraid_and_grapple_kraids_lair:
    dw #preset_zfackpdr_speed_booster_shaktool ; Speed Booster: Shaktool
    dw $078D, $9CA4  ; DDB
    dw $079B, $B10B  ; MDB
    dw $090F, $AC00  ; Screen subpixel X position
    dw $0911, $0500  ; Screen X position in pixels
    dw $0913, $F000  ; Screen subpixel Y position
    dw $0917, $03C0  ; Layer 2 X position
    dw $0919, $0100  ; Layer 2 Y position
    dw $09C0, $0001  ; Manual/Auto reserve tank
    dw $09CE, $0001  ; Pbs
    dw $09D4, $0064  ; Max reserves
    dw $09D6, $0019  ; Reserves
    dw $0AF6, $05D2  ; Samus X
    dw $0AF8, $2FFF  ; Samus subpixel X
    dw $D820, $2801  ; Events
    dw $D87A, $0A00  ; Items
    dw #$FFFF

preset_zfackpdr_kraid_and_grapple_hopper_madness_two:
    dw #preset_zfackpdr_kraid_and_grapple_kraids_lair ; Kraid and Grapple: Kraid's Lair
    dw $078D, $8744  ; DDB
    dw $079B, $8DA3  ; MDB
    dw $07F3, $0027  ; Music Bank
    dw $07F5, $0006  ; Music Track
    dw $090F, $F000  ; Screen subpixel X position
    dw $0911, $01CA  ; Screen X position in pixels
    dw $0913, $2800  ; Screen subpixel Y position
    dw $0917, $0157  ; Layer 2 X position
    dw $09C2, $010C  ; Health
    dw $09CA, $0007  ; Supers
    dw $0A1C, $0002  ; Samus position/state
    dw $0A1E, $0004  ; More position/state
    dw $0AF6, $0231  ; Samus X
    dw $0AF8, $F800  ; Samus subpixel X
    dw $0AFA, $017B  ; Samus Y
    dw #$FFFF

preset_zfackpdr_kraid_and_grapple_spazer:
    dw #preset_zfackpdr_kraid_and_grapple_hopper_madness_two ; Kraid and Grapple: Hopper Madness Two
    dw $078D, $A7C0  ; DDB
    dw $079B, $B138  ; MDB
    dw $07F3, $0012  ; Music Bank
    dw $07F5, $0005  ; Music Track
    dw $090F, $3000  ; Screen subpixel X position
    dw $0911, $0000  ; Screen X position in pixels
    dw $0913, $6000  ; Screen subpixel Y position
    dw $0915, $0000  ; Screen Y position in pixels
    dw $0917, $0000  ; Layer 2 X position
    dw $0919, $0000  ; Layer 2 Y position
    dw $09C2, $009A  ; Health
    dw $0AF6, $006C  ; Samus X
    dw $0AF8, $7000  ; Samus subpixel X
    dw $0AFA, $008B  ; Samus Y
    dw #$FFFF

preset_zfackpdr_kraid_and_grapple_spike_tunnel:
    dw #preset_zfackpdr_kraid_and_grapple_spazer ; Kraid and Grapple: Spazer
    dw $078D, $9CE0  ; DDB
    dw $079B, $8E4D  ; MDB
    dw $090F, $C000  ; Screen subpixel X position
    dw $0911, $0200  ; Screen X position in pixels
    dw $0913, $37FF  ; Screen subpixel Y position
    dw $0917, $0200  ; Layer 2 X position
    dw $09A6, $1007  ; Beams
    dw $09A8, $1007  ; Beams
    dw $09C2, $0086  ; Health
    dw $09CA, $0008  ; Supers
    dw $0A1C, $0001  ; Samus position/state
    dw $0A1E, $0008  ; More position/state
    dw $0AF6, $025D  ; Samus X
    dw $0AF8, $A000  ; Samus subpixel X
    dw $0AFA, $005B  ; Samus Y
    dw $D872, $010E  ; Items
    dw $D8B2, $2662  ; Doors
    dw #$FFFF

preset_zfackpdr_kraid_and_grapple_kraid_entrance_:
    dw #preset_zfackpdr_kraid_and_grapple_spike_tunnel ; Kraid and Grapple: Spike Tunnel
    dw $078D, $86F0  ; DDB
    dw $079B, $8ED6  ; MDB
    dw $090F, $0000  ; Screen subpixel X position
    dw $0911, $0000  ; Screen X position in pixels
    dw $0913, $1800  ; Screen subpixel Y position
    dw $0915, $01FA  ; Screen Y position in pixels
    dw $0917, $0000  ; Layer 2 X position
    dw $0919, $017B  ; Layer 2 Y position
    dw $09C2, $00C5  ; Health
    dw $09C6, $0013  ; Missiles
    dw $09D6, $0000  ; Reserves
    dw $0AF6, $00CE  ; Samus X
    dw $0AF8, $1FFF  ; Samus subpixel X
    dw $0AFA, $028B  ; Samus Y
    dw $D8B2, $2E62  ; Doors
    dw #$FFFF

preset_zfackpdr_kraid_and_grapple_kraid:
    dw #preset_zfackpdr_kraid_and_grapple_kraid_entrance_ ; Kraid and Grapple: Kraid Entrance 
    dw $078D, $86FC  ; DDB
    dw $079B, $8D57  ; MDB
    dw $07F3, $0027  ; Music Bank
    dw $07F5, $0006  ; Music Track
    dw $0911, $0300  ; Screen X position in pixels
    dw $0913, $8400  ; Screen subpixel Y position
    dw $0915, $0000  ; Screen Y position in pixels
    dw $0917, $0240  ; Layer 2 X position
    dw $0919, $0000  ; Layer 2 Y position
    dw $09C2, $0079  ; Health
    dw $0AF6, $03CF  ; Samus X
    dw $0AF8, $0FFF  ; Samus subpixel X
    dw $0AFA, $008B  ; Samus Y
    dw $D8B2, $2F62  ; Doors
    dw #$FFFF

preset_zfackpdr_kraid_and_grapple_kraid_escape:
    dw #preset_zfackpdr_kraid_and_grapple_kraid ; Kraid and Grapple: Kraid
    dw $078D, $87EC  ; DDB
    dw $079B, $8A9D  ; MDB
    dw $07F5, $0003  ; Music Track
    dw $090F, $8000  ; Screen subpixel X position
    dw $0911, $0000  ; Screen X position in pixels
    dw $0913, $A800  ; Screen subpixel Y position
    dw $0915, $0100  ; Screen Y position in pixels
    dw $0917, $0001  ; Layer 2 X position
    dw $09C2, $018F  ; Health
    dw $09C4, $018F  ; Max health
    dw $09C6, $0023  ; Missiles
    dw $09CA, $0002  ; Supers
    dw $09CE, $0003  ; Pbs
    dw $0A1C, $0002  ; Samus position/state
    dw $0A1E, $0004  ; More position/state
    dw $0AF6, $0043  ; Samus X
    dw $0AF8, $C000  ; Samus subpixel X
    dw $0AFA, $018B  ; Samus Y
    dw $D828, $0505  ; Bosses
    dw $D872, $110E  ; Items
    dw $D8B2, $2F6A  ; Doors
    dw #$FFFF

preset_zfackpdr_kraid_and_grapple_spazer_revisit:
    dw #preset_zfackpdr_kraid_and_grapple_kraid_escape ; Kraid and Grapple: Kraid Escape
    dw $078D, $86E4  ; DDB
    dw $079B, $8E7A  ; MDB
    dw $07F3, $0012  ; Music Bank
    dw $07F5, $0005  ; Music Track
    dw $090F, $4000  ; Screen subpixel X position
    dw $0913, $A000  ; Screen subpixel Y position
    dw $0915, $001F  ; Screen Y position in pixels
    dw $0917, $0000  ; Layer 2 X position
    dw $0919, $0017  ; Layer 2 Y position
    dw $09C2, $00AE  ; Health
    dw $09C6, $0020  ; Missiles
    dw $09CA, $0003  ; Supers
    dw $0A1C, $0001  ; Samus position/state
    dw $0A1E, $0008  ; More position/state
    dw $0AF6, $0050  ; Samus X
    dw $0AF8, $0000  ; Samus subpixel X
    dw $0AFA, $008B  ; Samus Y
    dw #$FFFF

preset_zfackpdr_kraid_and_grapple_more_hopper_pain:
    dw #preset_zfackpdr_kraid_and_grapple_spazer_revisit ; Kraid and Grapple: Spazer Revisit
    dw $078D, $A7CC  ; DDB
    dw $079B, $B138  ; MDB
    dw $090F, $7000  ; Screen subpixel X position
    dw $0911, $0600  ; Screen X position in pixels
    dw $0913, $1C00  ; Screen subpixel Y position
    dw $0915, $0000  ; Screen Y position in pixels
    dw $0917, $0480  ; Layer 2 X position
    dw $0919, $0000  ; Layer 2 Y position
    dw $09C2, $0092  ; Health
    dw $09CA, $0005  ; Supers
    dw $0AF6, $06D3  ; Samus X
    dw $0AF8, $AFFF  ; Samus subpixel X
    dw #$FFFF

preset_zfackpdr_kraid_and_grapple_grapple_bugs:
    dw #preset_zfackpdr_kraid_and_grapple_more_hopper_pain ; Kraid and Grapple: More Hopper Pain
    dw $078D, $8648  ; DDB
    dw $079B, $8F34  ; MDB
    dw $090F, $4FFF  ; Screen subpixel X position
    dw $0911, $0200  ; Screen X position in pixels
    dw $0913, $0000  ; Screen subpixel Y position
    dw $0917, $0200  ; Layer 2 X position
    dw $09C2, $004B  ; Health
    dw $09C6, $0004  ; Missiles
    dw $09CA, $0004  ; Supers
    dw $09CE, $0004  ; Pbs
    dw $0AF6, $02D1  ; Samus X
    dw $0AF8, $7FFF  ; Samus subpixel X
    dw $0AFA, $009B  ; Samus Y
    dw $D8B2, $6F6A  ; Doors
    dw #$FFFF

preset_zfackpdr_kraid_and_grapple_grapple_lake:
    dw #preset_zfackpdr_kraid_and_grapple_grapple_bugs ; Kraid and Grapple: Grapple Bugs
    dw $078D, $8750  ; DDB
    dw $079B, $8FF0  ; MDB
    dw $090F, $0000  ; Screen subpixel X position
    dw $0911, $0400  ; Screen X position in pixels
    dw $0915, $009A  ; Screen Y position in pixels
    dw $0917, $03C0  ; Layer 2 X position
    dw $0919, $009A  ; Layer 2 Y position
    dw $09A2, $7105  ; Equipped Items
    dw $09A4, $7105  ; Collected Items
    dw $09C2, $0041  ; Health
    dw $09CA, $0003  ; Supers
    dw $0A1C, $0002  ; Samus position/state
    dw $0A1E, $0004  ; More position/state
    dw $0AF6, $0437  ; Samus X
    dw $0AF8, $6000  ; Samus subpixel X
    dw $0AFA, $010B  ; Samus Y
    dw $D872, $190E  ; Items
    dw $D8B2, $EF6A  ; Doors
    dw #$FFFF

preset_zfackpdr_wrecked_ship_entry_kihunter_climb:
    dw #preset_zfackpdr_kraid_and_grapple_grapple_lake ; Kraid and Grapple: Grapple Lake
    dw $078D, $87E0  ; DDB
    dw $079B, $901F  ; MDB
    dw $090F, $0B58  ; Screen subpixel X position
    dw $0911, $0000  ; Screen X position in pixels
    dw $0913, $7C00  ; Screen subpixel Y position
    dw $0915, $002A  ; Screen Y position in pixels
    dw $0917, $0000  ; Layer 2 X position
    dw $0919, $0024  ; Layer 2 Y position
    dw $09CA, $0004  ; Supers
    dw $0AF6, $0025  ; Samus X
    dw $0AF8, $0000  ; Samus subpixel X
    dw $0AFA, $009B  ; Samus Y
    dw #$FFFF

preset_zfackpdr_wrecked_ship_entry_red_tower_climb:
    dw #preset_zfackpdr_wrecked_ship_entry_kihunter_climb ; Wrecked Ship Entry: Kihunter Climb
    dw $078D, $84F8  ; DDB
    dw $079B, $904E  ; MDB
    dw $090F, $8800  ; Screen subpixel X position
    dw $0913, $4C00  ; Screen subpixel Y position
    dw $0915, $0025  ; Screen Y position in pixels
    dw $0919, $0025  ; Layer 2 Y position
    dw $09C2, $018F  ; Health
    dw $09C6, $0023  ; Missiles
    dw $09CA, $0006  ; Supers
    dw $0AFA, $008B  ; Samus Y
    dw #$FFFF

preset_zfackpdr_wrecked_ship_entry_red_brin_escape:
    dw #preset_zfackpdr_wrecked_ship_entry_red_tower_climb ; Wrecked Ship Entry: Red Tower Climb
    dw $078D, $8864  ; DDB
    dw $079B, $90AE  ; MDB
    dw $090F, $6C00  ; Screen subpixel X position
    dw $0913, $0000  ; Screen subpixel Y position
    dw $0915, $001B  ; Screen Y position in pixels
    dw $0919, $0014  ; Layer 2 Y position
    dw $09C2, $018D  ; Health
    dw $09C6, $0028  ; Missiles
    dw $09C8, $0028  ; Max missiles
    dw $0AF6, $0030  ; Samus X
    dw $0AF8, $63FF  ; Samus subpixel X
    dw $0AFC, $E400  ; Samus subpixel Y
    dw $D872, $590E  ; Items
    dw #$FFFF

preset_zfackpdr_wrecked_ship_entry_crateria_grapple_climb:
    dw #preset_zfackpdr_wrecked_ship_entry_red_brin_escape ; Wrecked Ship Entry: Red Brin Escape
    dw $078D, $824C  ; DDB
    dw $079B, $8194  ; MDB
    dw $07F3, $0009  ; Music Bank
    dw $07F5, $0003  ; Music Track
    dw $090F, $C600  ; Screen subpixel X position
    dw $0911, $0200  ; Screen X position in pixels
    dw $0913, $C000  ; Screen subpixel Y position
    dw $0915, $0000  ; Screen Y position in pixels
    dw $0917, $0200  ; Layer 2 X position
    dw $0919, $0000  ; Layer 2 Y position
    dw $09C2, $018F  ; Health
    dw $09CA, $0008  ; Supers
    dw $09D6, $0008  ; Reserves
    dw $0A1C, $0001  ; Samus position/state
    dw $0A1E, $0008  ; More position/state
    dw $0AF6, $02CD  ; Samus X
    dw $0AF8, $4300  ; Samus subpixel X
    dw $0AFC, $FFFF  ; Samus subpixel Y
    dw #$FFFF

preset_zfackpdr_wrecked_ship_entry_ship_entrance_lake:
    dw #preset_zfackpdr_wrecked_ship_entry_crateria_grapple_climb ; Wrecked Ship Entry: Crateria Grapple Climb
    dw $078D, $8258  ; DDB
    dw $079B, $84DA  ; MDB
    dw $07F3, $000C  ; Music Bank
    dw $07F5, $0005  ; Music Track
    dw $090F, $5F00  ; Screen subpixel X position
    dw $0911, $0100  ; Screen X position in pixels
    dw $0913, $D800  ; Screen subpixel Y position
    dw $0915, $0100  ; Screen Y position in pixels
    dw $0917, $00C0  ; Layer 2 X position
    dw $0919, $00C0  ; Layer 2 Y position
    dw $09CE, $0005  ; Pbs
    dw $09D6, $0028  ; Reserves
    dw $0AF6, $01D2  ; Samus X
    dw $0AF8, $61FF  ; Samus subpixel X
    dw $0AFA, $017B  ; Samus Y
    dw #$FFFF

preset_zfackpdr_wrecked_ship_entry_enter_ship:
    dw #preset_zfackpdr_wrecked_ship_entry_ship_entrance_lake ; Wrecked Ship Entry: Ship Entrance Lake
    dw $078D, $8330  ; DDB
    dw $079B, $8509  ; MDB
    dw $090F, $C000  ; Screen subpixel X position
    dw $0913, $0000  ; Screen subpixel Y position
    dw $0915, $0024  ; Screen Y position in pixels
    dw $0917, $0080  ; Layer 2 X position
    dw $0919, $0000  ; Layer 2 Y position
    dw $09C2, $015D  ; Health
    dw $09CA, $0009  ; Supers
    dw $0AF6, $01CF  ; Samus X
    dw $0AF8, $BFFF  ; Samus subpixel X
    dw $0AFA, $008B  ; Samus Y
    dw $D828, $0507  ; Bosses
    dw $D8B0, $0822  ; Doors
    dw #$FFFF

preset_zfackpdr_wrecked_ship_entry_spiky_tower_climb:
    dw #preset_zfackpdr_wrecked_ship_entry_enter_ship ; Wrecked Ship Entry: Enter Ship
    dw $078D, $9BA8  ; DDB
    dw $079B, $AEA4  ; MDB
    dw $07F3, $0030  ; Music Bank
    dw $090F, $9000  ; Screen subpixel X position
    dw $0917, $00C0  ; Layer 2 X position
    dw $0919, $001B  ; Layer 2 Y position
    dw $09C2, $0155  ; Health
    dw $0A1C, $0002  ; Samus position/state
    dw $0A1E, $0004  ; More position/state
    dw $0AF6, $0183  ; Samus X
    dw $0AF8, $D000  ; Samus subpixel X
    dw #$FFFF

preset_zfackpdr_wrecked_ship_entry_platforms_n_bots:
    dw #preset_zfackpdr_wrecked_ship_entry_spiky_tower_climb ; Wrecked Ship Entry: Spiky Tower Climb
    dw $078D, $9AC4  ; DDB
    dw $079B, $AC86  ; MDB
    dw $090F, $0800  ; Screen subpixel X position
    dw $0911, $0000  ; Screen X position in pixels
    dw $0913, $8000  ; Screen subpixel Y position
    dw $0915, $0200  ; Screen Y position in pixels
    dw $0917, $0000  ; Layer 2 X position
    dw $0919, $0200  ; Layer 2 Y position
    dw $09C2, $017D  ; Health
    dw $09CA, $0008  ; Supers
    dw $0AF6, $004A  ; Samus X
    dw $0AF8, $9800  ; Samus subpixel X
    dw $0AFA, $02A6  ; Samus Y
    dw #$FFFF

preset_zfackpdr_wrecked_ship_entry_antenna_climb:
    dw #preset_zfackpdr_wrecked_ship_entry_platforms_n_bots ; Wrecked Ship Entry: Platforms n Bots
    dw $078D, $99B0  ; DDB
    dw $079B, $A933  ; MDB
    dw $090F, $8000  ; Screen subpixel X position
    dw $0911, $00F6  ; Screen X position in pixels
    dw $0913, $0000  ; Screen subpixel Y position
    dw $0915, $0000  ; Screen Y position in pixels
    dw $0917, $00B8  ; Layer 2 X position
    dw $0919, $0000  ; Layer 2 Y position
    dw $09C2, $0153  ; Health
    dw $09CE, $0004  ; Pbs
    dw $0A1C, $0001  ; Samus position/state
    dw $0A1E, $0008  ; More position/state
    dw $0AF6, $0195  ; Samus X
    dw $0AF8, $8FFF  ; Samus subpixel X
    dw $0AFA, $008B  ; Samus Y
    dw #$FFFF

preset_zfackpdr_wrecked_ship_entry_phantoon:
    dw #preset_zfackpdr_wrecked_ship_entry_antenna_climb ; Wrecked Ship Entry: Antenna Climb
    dw $078D, $9878  ; DDB
    dw $079B, $A7FB  ; MDB
    dw $090F, $7001  ; Screen subpixel X position
    dw $0911, $0200  ; Screen X position in pixels
    dw $0913, $F000  ; Screen subpixel Y position
    dw $0915, $002B  ; Screen Y position in pixels
    dw $0917, $0180  ; Layer 2 X position
    dw $0919, $0020  ; Layer 2 Y position
    dw $09CA, $0007  ; Supers
    dw $0A1C, $0002  ; Samus position/state
    dw $0A1E, $0004  ; More position/state
    dw $0AF6, $0243  ; Samus X
    dw $0AF8, $CFFF  ; Samus subpixel X
    dw $0AFA, $009B  ; Samus Y
    dw $D8B8, $9E1C  ; Doors
    dw #$FFFF

preset_zfackpdr_gravity_phantoon_escape:
    dw #preset_zfackpdr_wrecked_ship_entry_phantoon ; Wrecked Ship Entry: Phantoon
    dw $078D, $9848  ; DDB
    dw $079B, $A6CB  ; MDB
    dw $07F3, $0027  ; Music Bank
    dw $07F5, $0003  ; Music Track
    dw $090F, $F000  ; Screen subpixel X position
    dw $0911, $0000  ; Screen X position in pixels
    dw $0913, $6400  ; Screen subpixel Y position
    dw $0915, $0000  ; Screen Y position in pixels
    dw $0917, $0001  ; Layer 2 X position
    dw $0919, $0000  ; Layer 2 Y position
    dw $09C2, $00EA  ; Health
    dw $09CA, $000A  ; Supers
    dw $09CE, $0005  ; Pbs
    dw $0A1C, $0001  ; Samus position/state
    dw $0A1E, $0008  ; More position/state
    dw $0AF6, $00B1  ; Samus X
    dw $0AF8, $0000  ; Samus subpixel X
    dw $0AFA, $00BB  ; Samus Y
    dw $D82A, $0102  ; Bosses
    dw $D8B8, $BE1C  ; Doors
    dw #$FFFF

preset_zfackpdr_gravity_empty_hand:
    dw #preset_zfackpdr_gravity_phantoon_escape ; Gravity: Phantoon Escape
    dw $078D, $986C  ; DDB
    dw $079B, $A9FE  ; MDB
    dw $07F3, $0030  ; Music Bank
    dw $07F5, $0006  ; Music Track
    dw $090F, $2000  ; Screen subpixel X position
    dw $0913, $E800  ; Screen subpixel Y position
    dw $0915, $0500  ; Screen Y position in pixels
    dw $0917, $0000  ; Layer 2 X position
    dw $0919, $03C0  ; Layer 2 Y position
    dw $09C2, $00E2  ; Health
    dw $0A1C, $0002  ; Samus position/state
    dw $0A1E, $0004  ; More position/state
    dw $0AF6, $002C  ; Samus X
    dw $0AF8, $4400  ; Samus subpixel X
    dw $0AFA, $058B  ; Samus Y
    dw $0AFC, $3BFF  ; Samus subpixel Y
    dw #$FFFF

preset_zfackpdr_gravity_lake_shortcut_supers:
    dw #preset_zfackpdr_gravity_empty_hand ; Gravity: Empty Hand
    dw $078D, $99D4  ; DDB
    dw $079B, $85EC  ; MDB
    dw $07F3, $000C  ; Music Bank
    dw $07F5, $0005  ; Music Track
    dw $090F, $9C00  ; Screen subpixel X position
    dw $0913, $EC00  ; Screen subpixel Y position
    dw $0915, $021F  ; Screen Y position in pixels
    dw $0919, $0197  ; Layer 2 Y position
    dw $09C2, $00F6  ; Health
    dw $0A1C, $0001  ; Samus position/state
    dw $0A1E, $0008  ; More position/state
    dw $0AF6, $00D3  ; Samus X
    dw $0AF8, $0FFF  ; Samus subpixel X
    dw $0AFA, $029B  ; Samus Y
    dw $0AFC, $8BFF  ; Samus subpixel Y
    dw #$FFFF

preset_zfackpdr_gravity_grapple_lake_2:
    dw #preset_zfackpdr_gravity_lake_shortcut_supers ; Gravity: Lake Shortcut Supers
    dw $078D, $980C  ; DDB
    dw $079B, $AAAC  ; MDB
    dw $07F3, $0030  ; Music Bank
    dw $07F5, $0006  ; Music Track
    dw $090F, $1000  ; Screen subpixel X position
    dw $0913, $4000  ; Screen subpixel Y position
    dw $0915, $031F  ; Screen Y position in pixels
    dw $0919, $0257  ; Layer 2 Y position
    dw $09C2, $00C3  ; Health
    dw $09CA, $000F  ; Supers
    dw $09CC, $000F  ; Max supers
    dw $09CE, $0003  ; Pbs
    dw $0AF6, $0050  ; Samus X
    dw $0AF8, $A800  ; Samus subpixel X
    dw $0AFA, $03BB  ; Samus Y
    dw $0AFC, $FFFF  ; Samus subpixel Y
    dw $D878, $2B4C  ; Items
    dw #$FFFF

preset_zfackpdr_gravity_robot_boxing:
    dw #preset_zfackpdr_gravity_grapple_lake_2 ; Gravity: Grapple Lake
    dw $078D, $9818  ; DDB
    dw $090F, $1400  ; Screen subpixel X position
    dw $0913, $0000  ; Screen subpixel Y position
    dw $0915, $0000  ; Screen Y position in pixels
    dw $0919, $0000  ; Layer 2 Y position
    dw $09C2, $00DC  ; Health
    dw $09C6, $0023  ; Missiles
    dw $0AF6, $00CB  ; Samus X
    dw $0AF8, $5000  ; Samus subpixel X
    dw $0AFA, $008B  ; Samus Y
    dw $D8B0, $1822  ; Doors
    dw #$FFFF

preset_zfackpdr_gravity_gravity_2:
    dw #preset_zfackpdr_gravity_robot_boxing ; Gravity: Robot Boxing
    dw $078D, $9A34  ; DDB
    dw $079B, $A69E  ; MDB
    dw $090F, $4000  ; Screen subpixel X position
    dw $09A2, $7125  ; Equipped Items
    dw $09A4, $7125  ; Collected Items
    dw $09C2, $0075  ; Health
    dw $0A1C, $009B  ; Samus position/state
    dw $0A1E, $0000  ; More position/state
    dw $0AF6, $0078  ; Samus X
    dw $0AF8, $6393  ; Samus subpixel X
    dw $0AFA, $0088  ; Samus Y
    dw $D878, $3B4C  ; Items
    dw #$FFFF

preset_zfackpdr_gravity_red_brin_revisit:
    dw #preset_zfackpdr_gravity_gravity_2 ; Gravity: Gravity
    dw $078D, $827C  ; DDB
    dw $079B, $84AB  ; MDB
    dw $07F3, $0009  ; Music Bank
    dw $07F5, $0005  ; Music Track
    dw $090F, $8000  ; Screen subpixel X position
    dw $0911, $0100  ; Screen X position in pixels
    dw $0913, $2800  ; Screen subpixel Y position
    dw $0915, $0500  ; Screen Y position in pixels
    dw $0917, $00C0  ; Layer 2 X position
    dw $0919, $03C0  ; Layer 2 Y position
    dw $09C2, $0071  ; Health
    dw $0A1C, $0002  ; Samus position/state
    dw $0A1E, $0004  ; More position/state
    dw $0AF6, $0135  ; Samus X
    dw $0AF8, $0000  ; Samus subpixel X
    dw $0AFA, $058B  ; Samus Y
    dw $0AFC, $B3FF  ; Samus subpixel Y
    dw #$FFFF

preset_zfackpdr_gravity_cac_hallway:
    dw #preset_zfackpdr_gravity_red_brin_revisit ; Gravity: Red Brin Revisit
    dw $078D, $88E8  ; DDB
    dw $079B, $90AE  ; MDB
    dw $07F3, $0012  ; Music Bank
    dw $090F, $C400  ; Screen subpixel X position
    dw $0911, $0000  ; Screen X position in pixels
    dw $0913, $0000  ; Screen subpixel Y position
    dw $0915, $001C  ; Screen Y position in pixels
    dw $0917, $0000  ; Layer 2 X position
    dw $0919, $0015  ; Layer 2 Y position
    dw $09C2, $0085  ; Health
    dw $09C6, $001F  ; Missiles
    dw $09CE, $0005  ; Pbs
    dw $0A1C, $0001  ; Samus position/state
    dw $0A1E, $0008  ; More position/state
    dw $0AF6, $00CE  ; Samus X
    dw $0AF8, $BFFF  ; Samus subpixel X
    dw $0AFA, $008B  ; Samus Y
    dw $0AFC, $FFFF  ; Samus subpixel Y
    dw #$FFFF

preset_zfackpdr_gravity_red_tower_down_again:
    dw #preset_zfackpdr_gravity_cac_hallway ; Gravity: Cac Hallway
    dw $078D, $887C  ; DDB
    dw $079B, $9110  ; MDB
    dw $090F, $F000  ; Screen subpixel X position
    dw $0911, $0300  ; Screen X position in pixels
    dw $0913, $9C00  ; Screen subpixel Y position
    dw $0915, $0000  ; Screen Y position in pixels
    dw $0917, $02A0  ; Layer 2 X position
    dw $0919, $0000  ; Layer 2 Y position
    dw $09C2, $01F3  ; Health
    dw $09C4, $01F3  ; Max health
    dw $09C6, $0024  ; Missiles
    dw $09C8, $002D  ; Max missiles
    dw $09D6, $0064  ; Reserves
    dw $0A1C, $0002  ; Samus position/state
    dw $0A1E, $0004  ; More position/state
    dw $0AF6, $0331  ; Samus X
    dw $0AF8, $EFFF  ; Samus subpixel X
    dw $D874, $4906  ; Items
    dw #$FFFF

preset_zfackpdr_gravity_kihunter_club:
    dw #preset_zfackpdr_gravity_red_tower_down_again ; Gravity: Red Tower Down Again
    dw $078D, $8894  ; DDB
    dw $079B, $907D  ; MDB
    dw $090F, $7000  ; Screen subpixel X position
    dw $0913, $7400  ; Screen subpixel Y position
    dw $0915, $0300  ; Screen Y position in pixels
    dw $0917, $0300  ; Layer 2 X position
    dw $0919, $0300  ; Layer 2 Y position
    dw $09C2, $01E1  ; Health
    dw $0A1C, $0001  ; Samus position/state
    dw $0A1E, $0008  ; More position/state
    dw $0AF6, $03B4  ; Samus X
    dw $0AF8, $2FFF  ; Samus subpixel X
    dw $0AFA, $038B  ; Samus Y
    dw $D8B4, $0642  ; Doors
    dw #$FFFF

preset_zfackpdr_gravity_kraid_tower_revisit:
    dw #preset_zfackpdr_gravity_kihunter_club ; Gravity: Kihunter Club
    dw $078D, $8804  ; DDB
    dw $079B, $8FF0  ; MDB
    dw $090F, $F000  ; Screen subpixel X position
    dw $0911, $0400  ; Screen X position in pixels
    dw $0913, $9C00  ; Screen subpixel Y position
    dw $0917, $03C0  ; Layer 2 X position
    dw $09C2, $01E4  ; Health
    dw $0A1C, $0002  ; Samus position/state
    dw $0A1E, $0004  ; More position/state
    dw $0AF6, $045A  ; Samus X
    dw $0AF8, $4FFF  ; Samus subpixel X
    dw $0AFA, $03AB  ; Samus Y
    dw #$FFFF

preset_zfackpdr_gravity_hopper_madness_three:
    dw #preset_zfackpdr_gravity_kraid_tower_revisit ; Gravity: Kraid Tower Revisit
    dw $078D, $8744  ; DDB
    dw $079B, $8DA3  ; MDB
    dw $0911, $01D5  ; Screen X position in pixels
    dw $0913, $D400  ; Screen subpixel Y position
    dw $0915, $0100  ; Screen Y position in pixels
    dw $0917, $015F  ; Layer 2 X position
    dw $0919, $0100  ; Layer 2 Y position
    dw $0AF6, $0238  ; Samus X
    dw $0AF8, $E800  ; Samus subpixel X
    dw $0AFA, $017B  ; Samus Y
    dw #$FFFF

preset_zfackpdr_space_jump_maridia_reentry:
    dw #preset_zfackpdr_gravity_hopper_madness_three ; Gravity: Hopper Madness Three
    dw $078D, $8738  ; DDB
    dw $079B, $B138  ; MDB
    dw $090F, $3000  ; Screen subpixel X position
    dw $0911, $0600  ; Screen X position in pixels
    dw $0913, $4C00  ; Screen subpixel Y position
    dw $0915, $0000  ; Screen Y position in pixels
    dw $0917, $0480  ; Layer 2 X position
    dw $0919, $0000  ; Layer 2 Y position
    dw $09C2, $0174  ; Health
    dw $0AF6, $0659  ; Samus X
    dw $0AF8, $2000  ; Samus subpixel X
    dw $0AFA, $009B  ; Samus Y
    dw #$FFFF

preset_zfackpdr_space_jump_crumble_spark_setup:
    dw #preset_zfackpdr_space_jump_maridia_reentry ; Space Jump: Maridia Reentry
    dw $078D, $9D04  ; DDB
    dw $079B, $B1EC  ; MDB
    dw $07F3, $001B  ; Music Bank
    dw $07F5, $0006  ; Music Track
    dw $090F, $5780  ; Screen subpixel X position
    dw $0911, $0000  ; Screen X position in pixels
    dw $0913, $93FF  ; Screen subpixel Y position
    dw $0917, $0000  ; Layer 2 X position
    dw $09C2, $019C  ; Health
    dw $09C6, $0021  ; Missiles
    dw $0AF6, $0043  ; Samus X
    dw $0AF8, $8600  ; Samus subpixel X
    dw $0AFA, $00BB  ; Samus Y
    dw $D8BA, $4000  ; Doors
    dw #$FFFF

preset_zfackpdr_space_jump_hidden_fish_tunnel:
    dw #preset_zfackpdr_space_jump_crumble_spark_setup ; Space Jump: Crumble Spark Setup
    dw $078D, $9D40  ; DDB
    dw $079B, $B7D4  ; MDB
    dw $090F, $9880  ; Screen subpixel X position
    dw $0911, $0100  ; Screen X position in pixels
    dw $0913, $3C00  ; Screen subpixel Y position
    dw $0915, $0400  ; Screen Y position in pixels
    dw $0917, $00C0  ; Layer 2 X position
    dw $0919, $0300  ; Layer 2 Y position
    dw $09C2, $014C  ; Health
    dw $0AF6, $014E  ; Samus X
    dw $0AF8, $0C80  ; Samus subpixel X
    dw $0AFA, $048B  ; Samus Y
    dw #$FFFF

preset_zfackpdr_space_jump_crumble_gap_scam:
    dw #preset_zfackpdr_space_jump_hidden_fish_tunnel ; Space Jump: Hidden Fish Tunnel
    dw $078D, $A124  ; DDB
    dw $079B, $B7A1  ; MDB
    dw $090F, $5800  ; Screen subpixel X position
    dw $0911, $0000  ; Screen X position in pixels
    dw $0913, $1400  ; Screen subpixel Y position
    dw $0915, $0000  ; Screen Y position in pixels
    dw $0917, $0000  ; Layer 2 X position
    dw $0919, $0000  ; Layer 2 Y position
    dw $09CE, $0004  ; Pbs
    dw $0A1C, $0028  ; Samus position/state
    dw $0A1E, $0504  ; More position/state
    dw $0AF6, $0051  ; Samus X
    dw $0AF8, $5800  ; Samus subpixel X
    dw $0AFA, $008B  ; Samus Y
    dw #$FFFF

preset_zfackpdr_space_jump_toilet_up:
    dw #preset_zfackpdr_space_jump_crumble_gap_scam ; Space Jump: Crumble Gap Scam
    dw $078D, $A460  ; DDB
    dw $079B, $BC46  ; MDB
    dw $090F, $4000  ; Screen subpixel X position
    dw $0913, $9000  ; Screen subpixel Y position
    dw $0915, $001F  ; Screen Y position in pixels
    dw $0919, $0017  ; Layer 2 Y position
    dw $09CA, $000E  ; Supers
    dw $0A1C, $0002  ; Samus position/state
    dw $0A1E, $0004  ; More position/state
    dw $0AF6, $0086  ; Samus X
    dw $0AF8, $9C00  ; Samus subpixel X
    dw $0AFA, $00AB  ; Samus Y
    dw $D8BC, $2002  ; Doors
    dw #$FFFF

preset_zfackpdr_space_jump_fortress:
    dw #preset_zfackpdr_space_jump_toilet_up ; Space Jump: Toilet Up
    dw $078D, $A2EC  ; DDB
    dw $079B, $BA68  ; MDB
    dw $090F, $0000  ; Screen subpixel X position
    dw $0913, $3000  ; Screen subpixel Y position
    dw $0915, $0200  ; Screen Y position in pixels
    dw $0919, $0180  ; Layer 2 Y position
    dw $09C2, $015B  ; Health
    dw $09C6, $0023  ; Missiles
    dw $0AF6, $0027  ; Samus X
    dw $0AF8, $F000  ; Samus subpixel X
    dw $0AFA, $028B  ; Samus Y
    dw #$FFFF

preset_zfackpdr_space_jump_toilet_down:
    dw #preset_zfackpdr_space_jump_fortress ; Space Jump: Fortress
    dw $078D, $A2E0  ; DDB
    dw $079B, $B53E  ; MDB
    dw $0911, $0017  ; Screen X position in pixels
    dw $0913, $0000  ; Screen subpixel Y position
    dw $0915, $001C  ; Screen Y position in pixels
    dw $0917, $0011  ; Layer 2 X position
    dw $0919, $001C  ; Layer 2 Y position
    dw $09C2, $0144  ; Health
    dw $09C6, $0025  ; Missiles
    dw $09CA, $000F  ; Supers
    dw $09CE, $0002  ; Pbs
    dw $0AF6, $00B7  ; Samus X
    dw $0AF8, $2000  ; Samus subpixel X
    dw $0AFA, $008B  ; Samus Y
    dw $D8BC, $220A  ; Doors
    dw #$FFFF

preset_zfackpdr_space_jump_mocktroid_sand_hall:
    dw #preset_zfackpdr_space_jump_toilet_down ; Space Jump: Toilet Down
    dw $078D, $A508  ; DDB
    dw $079B, $BC73  ; MDB
    dw $07F5, $0005  ; Music Track
    dw $090F, $CBFF  ; Screen subpixel X position
    dw $0911, $00FC  ; Screen X position in pixels
    dw $0913, $AC00  ; Screen subpixel Y position
    dw $0915, $0200  ; Screen Y position in pixels
    dw $0917, $00FC  ; Layer 2 X position
    dw $0919, $0200  ; Layer 2 Y position
    dw $0AF6, $0179  ; Samus X
    dw $0AF8, $BFFF  ; Samus subpixel X
    dw $0AFA, $028B  ; Samus Y
    dw #$FFFF

preset_zfackpdr_space_jump_botwoon:
    dw #preset_zfackpdr_space_jump_mocktroid_sand_hall ; Space Jump: Mocktroid Sand Hall
    dw $078D, $A4F0  ; DDB
    dw $079B, $BCA6  ; MDB
    dw $090F, $AFFF  ; Screen subpixel X position
    dw $0911, $0000  ; Screen X position in pixels
    dw $0913, $0000  ; Screen subpixel Y position
    dw $0915, $001D  ; Screen Y position in pixels
    dw $0917, $0000  ; Layer 2 X position
    dw $0919, $001D  ; Layer 2 Y position
    dw $09C2, $00CF  ; Health
    dw $09C6, $0027  ; Missiles
    dw $09CA, $000E  ; Supers
    dw $0A1C, $0001  ; Samus position/state
    dw $0A1E, $0008  ; More position/state
    dw $0AF6, $00C2  ; Samus X
    dw $0AF8, $FFFF  ; Samus subpixel X
    dw $0AFA, $008B  ; Samus Y
    dw $D8BC, $A20A  ; Doors
    dw #$FFFF

preset_zfackpdr_space_jump_tube_maze:
    dw #preset_zfackpdr_space_jump_botwoon ; Space Jump: Botwoon
    dw $078D, $9C8C  ; DDB
    dw $079B, $BCD5  ; MDB
    dw $090F, $B000  ; Screen subpixel X position
    dw $0913, $E400  ; Screen subpixel Y position
    dw $0915, $0000  ; Screen Y position in pixels
    dw $0919, $0000  ; Layer 2 Y position
    dw $09C2, $0144  ; Health
    dw $09C6, $002B  ; Missiles
    dw $09CA, $000F  ; Supers
    dw $09CE, $0005  ; Pbs
    dw $0A1C, $0002  ; Samus position/state
    dw $0A1E, $0004  ; More position/state
    dw $0AF6, $003E  ; Samus X
    dw $0AF8, $3000  ; Samus subpixel X
    dw $D82C, $0002  ; Bosses
    dw $D8BA, $6000  ; Doors
    dw #$FFFF

preset_zfackpdr_space_jump_gate_scam_five:
    dw #preset_zfackpdr_space_jump_tube_maze ; Space Jump: Tube Maze
    dw $078D, $A55C  ; DDB
    dw $079B, $BD33  ; MDB
    dw $090F, $D17F  ; Screen subpixel X position
    dw $0911, $0100  ; Screen X position in pixels
    dw $0913, $E800  ; Screen subpixel Y position
    dw $0915, $04FE  ; Screen Y position in pixels
    dw $0917, $00E0  ; Layer 2 X position
    dw $0919, $04FE  ; Layer 2 Y position
    dw $09C2, $0171  ; Health
    dw $09C6, $0032  ; Missiles
    dw $09C8, $0032  ; Max missiles
    dw $09CE, $0004  ; Pbs
    dw $0A1C, $0001  ; Samus position/state
    dw $0A1E, $0008  ; More position/state
    dw $0AF6, $01AB  ; Samus X
    dw $0AF8, $9FFF  ; Samus subpixel X
    dw $0AFA, $058B  ; Samus Y
    dw $D87C, $1000  ; Items
    dw #$FFFF

preset_zfackpdr_space_jump_draygon:
    dw #preset_zfackpdr_space_jump_gate_scam_five ; Space Jump: Gate Scam Five
    dw $078D, $A5B0  ; DDB
    dw $079B, $BD91  ; MDB
    dw $090F, $C000  ; Screen subpixel X position
    dw $0911, $0000  ; Screen X position in pixels
    dw $0913, $A401  ; Screen subpixel Y position
    dw $0915, $0000  ; Screen Y position in pixels
    dw $0917, $0000  ; Layer 2 X position
    dw $0919, $0000  ; Layer 2 Y position
    dw $09C2, $0141  ; Health
    dw $09CA, $000C  ; Supers
    dw $0A1C, $0002  ; Samus position/state
    dw $0A1E, $0004  ; More position/state
    dw $0AF6, $002C  ; Samus X
    dw $0AF8, $3000  ; Samus subpixel X
    dw $0AFA, $008B  ; Samus Y
    dw $D8BE, $0004  ; Doors
    dw #$FFFF

preset_zfackpdr_maridia_escape_draygon_escape:
    dw #preset_zfackpdr_space_jump_draygon ; Space Jump: Draygon
    dw $078D, $9C74  ; DDB
    dw $079B, $BDBE  ; MDB
    dw $07F3, $0024  ; Music Bank
    dw $07F5, $0003  ; Music Track
    dw $090F, $5000  ; Screen subpixel X position
    dw $0913, $8BFF  ; Screen subpixel Y position
    dw $09A2, $7325  ; Equipped Items
    dw $09A4, $7325  ; Collected Items
    dw $09C2, $007F  ; Health
    dw $09C6, $0007  ; Missiles
    dw $09CA, $0003  ; Supers
    dw $09CE, $0005  ; Pbs
    dw $0AF6, $003E  ; Samus X
    dw $0AF8, $0000  ; Samus subpixel X
    dw $D82C, $0003  ; Bosses
    dw $D87C, $3000  ; Items
    dw $D8BA, $7000  ; Doors
    dw #$FFFF

preset_zfackpdr_maridia_escape_spikey_chozo:
    dw #preset_zfackpdr_maridia_escape_draygon_escape ; Maridia Escape: Draygon Escape
    dw $078D, $A568  ; DDB
    dw $079B, $BDEB  ; MDB
    dw $07F3, $001B  ; Music Bank
    dw $07F5, $0005  ; Music Track
    dw $090F, $1000  ; Screen subpixel X position
    dw $0913, $DFFF  ; Screen subpixel Y position
    dw $09C2, $00A2  ; Health
    dw $09C6, $000B  ; Missiles
    dw $0AF6, $0075  ; Samus X
    dw $0AF8, $5000  ; Samus subpixel X
    dw $0AFA, $0063  ; Samus Y
    dw $D8BE, $0005  ; Doors
    dw #$FFFF

preset_zfackpdr_maridia_escape_grassy_tower:
    dw #preset_zfackpdr_maridia_escape_spikey_chozo ; Maridia Escape: Spikey Chozo
    dw $078D, $A634  ; DDB
    dw $079B, $BE76  ; MDB
    dw $090F, $3000  ; Screen subpixel X position
    dw $0911, $0200  ; Screen X position in pixels
    dw $0913, $D800  ; Screen subpixel Y position
    dw $0915, $0100  ; Screen Y position in pixels
    dw $0917, $01C0  ; Layer 2 X position
    dw $0919, $0100  ; Layer 2 Y position
    dw $09C2, $0084  ; Health
    dw $0A1C, $0001  ; Samus position/state
    dw $0A1E, $0008  ; More position/state
    dw $0AF6, $02C7  ; Samus X
    dw $0AF8, $4FFF  ; Samus subpixel X
    dw $0AFA, $018B  ; Samus Y
    dw #$FFFF

preset_zfackpdr_maridia_escape_plasma:
    dw #preset_zfackpdr_maridia_escape_grassy_tower ; Maridia Escape: Grassy Tower
    dw $078D, $A694  ; DDB
    dw $079B, $BED6  ; MDB
    dw $090F, $D001  ; Screen subpixel X position
    dw $0911, $0000  ; Screen X position in pixels
    dw $0913, $4C00  ; Screen subpixel Y position
    dw $0915, $000C  ; Screen Y position in pixels
    dw $0917, $0000  ; Layer 2 X position
    dw $0919, $000C  ; Layer 2 Y position
    dw $09C2, $00C1  ; Health
    dw $09C6, $0007  ; Missiles
    dw $0A1C, $0002  ; Samus position/state
    dw $0A1E, $0004  ; More position/state
    dw $0AF6, $001A  ; Samus X
    dw $0AF8, $4000  ; Samus subpixel X
    dw $0AFA, $007B  ; Samus Y
    dw #$FFFF

preset_zfackpdr_maridia_escape_toilet_down_2:
    dw #preset_zfackpdr_maridia_escape_plasma ; Maridia Escape: Plasma
    dw $078D, $A6C4  ; DDB
    dw $079B, $BF05  ; MDB
    dw $090F, $8B00  ; Screen subpixel X position
    dw $0911, $0300  ; Screen X position in pixels
    dw $0913, $6400  ; Screen subpixel Y position
    dw $0915, $001F  ; Screen Y position in pixels
    dw $0917, $0240  ; Layer 2 X position
    dw $0919, $0017  ; Layer 2 Y position
    dw $09A6, $100B  ; Beams
    dw $09A8, $100F  ; Beams
    dw $09C2, $00DD  ; Health
    dw $09C6, $0009  ; Missiles
    dw $09CA, $0004  ; Supers
    dw $09CE, $0003  ; Pbs
    dw $0AF6, $03B8  ; Samus X
    dw $0AF8, $8FFF  ; Samus subpixel X
    dw $0AFA, $00AB  ; Samus Y
    dw $D87E, $0002  ; Items
    dw $D8BE, $00C5  ; Doors
    dw #$FFFF

preset_zfackpdr_maridia_escape_hot_air_baloons:
    dw #preset_zfackpdr_maridia_escape_toilet_down_2 ; Maridia Escape: Toilet Down
    dw $078D, $A01C  ; DDB
    dw $079B, $B4B5  ; MDB
    dw $090F, $4000  ; Screen subpixel X position
    dw $0911, $0100  ; Screen X position in pixels
    dw $0913, $3000  ; Screen subpixel Y position
    dw $0915, $0024  ; Screen Y position in pixels
    dw $0917, $0100  ; Layer 2 X position
    dw $0919, $0024  ; Layer 2 Y position
    dw $09C2, $00E2  ; Health
    dw $09C6, $000B  ; Missiles
    dw $09CA, $0006  ; Supers
    dw $0A1C, $0001  ; Samus position/state
    dw $0A1E, $0008  ; More position/state
    dw $0AF6, $01DB  ; Samus X
    dw $0AF8, $FFFF  ; Samus subpixel X
    dw $0AFA, $008B  ; Samus Y
    dw #$FFFF

preset_zfackpdr_maridia_escape_crab_hall:
    dw #preset_zfackpdr_maridia_escape_hot_air_baloons ; Maridia Escape: Hot Air Baloons
    dw $078D, $A100  ; DDB
    dw $079B, $B770  ; MDB
    dw $07F5, $0006  ; Music Track
    dw $090F, $A000  ; Screen subpixel X position
    dw $0911, $0300  ; Screen X position in pixels
    dw $0913, $9800  ; Screen subpixel Y position
    dw $0915, $0100  ; Screen Y position in pixels
    dw $0917, $0300  ; Layer 2 X position
    dw $0919, $0100  ; Layer 2 Y position
    dw $09C2, $00D3  ; Health
    dw $09C6, $000D  ; Missiles
    dw $09CE, $0004  ; Pbs
    dw $0AF6, $03D1  ; Samus X
    dw $0AF8, $5FFF  ; Samus subpixel X
    dw $0AFA, $018B  ; Samus Y
    dw $D8BC, $A20E  ; Doors
    dw #$FFFF

preset_zfackpdr_maridia_escape_shaktool_revisit:
    dw #preset_zfackpdr_maridia_escape_crab_hall ; Maridia Escape: Crab Hall
    dw $078D, $9D7C  ; DDB
    dw $079B, $B1BF  ; MDB
    dw $07F5, $0005  ; Music Track
    dw $090F, $E000  ; Screen subpixel X position
    dw $0913, $2800  ; Screen subpixel Y position
    dw $0917, $0240  ; Layer 2 X position
    dw $0919, $00C0  ; Layer 2 Y position
    dw $09C2, $012D  ; Health
    dw $09CE, $0005  ; Pbs
    dw $0AF6, $03D0  ; Samus X
    dw $0AF8, $2FFF  ; Samus subpixel X
    dw #$FFFF

preset_zfackpdr_maridia_escape_brinstar_reentry:
    dw #preset_zfackpdr_maridia_escape_shaktool_revisit ; Maridia Escape: Shaktool Revisit
    dw $078D, $9CA4  ; DDB
    dw $079B, $B10B  ; MDB
    dw $090F, $1C00  ; Screen subpixel X position
    dw $0911, $0500  ; Screen X position in pixels
    dw $0913, $03FF  ; Screen subpixel Y position
    dw $0917, $03C0  ; Layer 2 X position
    dw $0919, $0100  ; Layer 2 Y position
    dw $09C2, $0119  ; Health
    dw $09C6, $000F  ; Missiles
    dw $0AF6, $05CC  ; Samus X
    dw $0AF8, $2F7F  ; Samus subpixel X
    dw #$FFFF

preset_zfackpdr_maridia_escape_grapple_lake_3:
    dw #preset_zfackpdr_maridia_escape_brinstar_reentry ; Maridia Escape: Brinstar Reentry
    dw $078D, $8750  ; DDB
    dw $079B, $8FF0  ; MDB
    dw $07F3, $0012  ; Music Bank
    dw $090F, $F000  ; Screen subpixel X position
    dw $0911, $0400  ; Screen X position in pixels
    dw $0913, $0000  ; Screen subpixel Y position
    dw $0915, $009A  ; Screen Y position in pixels
    dw $0919, $009A  ; Layer 2 Y position
    dw $09C2, $0111  ; Health
    dw $0A1C, $0002  ; Samus position/state
    dw $0A1E, $0004  ; More position/state
    dw $0AF6, $042F  ; Samus X
    dw $0AF8, $2000  ; Samus subpixel X
    dw $0AFA, $010B  ; Samus Y
    dw #$FFFF

preset_zfackpdr_maridia_escape_red_tower_passthrough:
    dw #preset_zfackpdr_maridia_escape_grapple_lake_3 ; Maridia Escape: Grapple Lake
    dw $078D, $84F8  ; DDB
    dw $079B, $904E  ; MDB
    dw $090F, $9000  ; Screen subpixel X position
    dw $0911, $0000  ; Screen X position in pixels
    dw $0915, $001B  ; Screen Y position in pixels
    dw $0917, $0000  ; Layer 2 X position
    dw $0919, $001B  ; Layer 2 Y position
    dw $09C2, $01F3  ; Health
    dw $09C6, $0032  ; Missiles
    dw $09CA, $0008  ; Supers
    dw $0AF6, $0036  ; Samus X
    dw $0AF8, $7000  ; Samus subpixel X
    dw $0AFA, $008B  ; Samus Y
    dw #$FFFF

preset_zfackpdr_maridia_escape_enter_norfair:
    dw #preset_zfackpdr_maridia_escape_red_tower_passthrough ; Maridia Escape: Red Tower Passthrough
    dw $078D, $8870  ; DDB
    dw $079B, $90E3  ; MDB
    dw $090F, $B000  ; Screen subpixel X position
    dw $0913, $3C00  ; Screen subpixel Y position
    dw $0915, $0000  ; Screen Y position in pixels
    dw $0919, $0000  ; Layer 2 Y position
    dw $0AF6, $005D  ; Samus X
    dw $0AF8, $5000  ; Samus subpixel X
    dw $0AFA, $006B  ; Samus Y
    dw #$FFFF

preset_zfackpdr_maridia_escape_lava_dive:
    dw #preset_zfackpdr_maridia_escape_enter_norfair ; Maridia Escape: Enter Norfair
    dw $078D, $935C  ; DDB
    dw $079B, $9DC2  ; MDB
    dw $07F3, $0015  ; Music Bank
    dw $090F, $3E00  ; Screen subpixel X position
    dw $0911, $00E9  ; Screen X position in pixels
    dw $0913, $9C00  ; Screen subpixel Y position
    dw $0915, $0326  ; Screen Y position in pixels
    dw $0917, $00AE  ; Layer 2 X position
    dw $0919, $025C  ; Layer 2 Y position
    dw $09C2, $01EC  ; Health
    dw $09C6, $002C  ; Missiles
    dw $09CA, $0009  ; Supers
    dw $09CE, $0004  ; Pbs
    dw $0AF6, $0184  ; Samus X
    dw $0AF8, $8000  ; Samus subpixel X
    dw $0AFA, $03DB  ; Samus Y
    dw $D8B4, $2642  ; Doors
    dw #$FFFF

preset_zfackpdr_lower_norfair_ln_main_hall:
    dw #preset_zfackpdr_maridia_escape_lava_dive ; Maridia Escape: Lava Dive
    dw $078D, $9158  ; DDB
    dw $079B, $989A  ; MDB
    dw $07F3, $0018  ; Music Bank
    dw $090F, $4000  ; Screen subpixel X position
    dw $0911, $0400  ; Screen X position in pixels
    dw $0913, $0000  ; Screen subpixel Y position
    dw $0915, $0100  ; Screen Y position in pixels
    dw $0917, $0300  ; Layer 2 X position
    dw $0919, $00F0  ; Layer 2 Y position
    dw $09C2, $01B2  ; Health
    dw $09C6, $002E  ; Missiles
    dw $0A1C, $009B  ; Samus position/state
    dw $0A1E, $0000  ; More position/state
    dw $0AF6, $0480  ; Samus X
    dw $0AF8, $AFFF  ; Samus subpixel X
    dw $0AFA, $0188  ; Samus Y
    dw $0AFC, $0000  ; Samus subpixel Y
    dw #$FFFF

preset_zfackpdr_lower_norfair_bubble_hopper_madness:
    dw #preset_zfackpdr_lower_norfair_ln_main_hall ; Lower Norfair: LN Main Hall
    dw $078D, $8EAC  ; DDB
    dw $090F, $9401  ; Screen subpixel X position
    dw $0911, $0300  ; Screen X position in pixels
    dw $0913, $9C00  ; Screen subpixel Y position
    dw $0915, $031F  ; Screen Y position in pixels
    dw $0917, $0240  ; Layer 2 X position
    dw $0919, $02ED  ; Layer 2 Y position
    dw $09C2, $01C1  ; Health
    dw $09C6, $0030  ; Missiles
    dw $09CE, $0002  ; Pbs
    dw $0A1C, $0001  ; Samus position/state
    dw $0A1E, $0008  ; More position/state
    dw $0AF6, $0353  ; Samus X
    dw $0AF8, $9400  ; Samus subpixel X
    dw $0AFA, $03AF  ; Samus Y
    dw $0AFC, $4BFF  ; Samus subpixel Y
    dw $D820, $3801  ; Events
    dw $D8B6, $4003  ; Doors
    dw #$FFFF

preset_zfackpdr_lower_norfair_rising_kihunters:
    dw #preset_zfackpdr_lower_norfair_bubble_hopper_madness ; Lower Norfair: Bubble Hopper Madness
    dw $078D, $8E94  ; DDB
    dw $079B, $9869  ; MDB
    dw $090F, $4000  ; Screen subpixel X position
    dw $0911, $0000  ; Screen X position in pixels
    dw $0913, $1800  ; Screen subpixel Y position
    dw $0915, $0300  ; Screen Y position in pixels
    dw $0917, $0000  ; Layer 2 X position
    dw $0919, $0300  ; Layer 2 Y position
    dw $09C2, $011A  ; Health
    dw $09CE, $0005  ; Pbs
    dw $0A1C, $0002  ; Samus position/state
    dw $0A1E, $0004  ; More position/state
    dw $0AF6, $003D  ; Samus X
    dw $0AF8, $D000  ; Samus subpixel X
    dw $0AFA, $039B  ; Samus Y
    dw $0AFC, $FFFF  ; Samus subpixel Y
    dw #$FFFF

preset_zfackpdr_lower_norfair_ball_maze:
    dw #preset_zfackpdr_lower_norfair_rising_kihunters ; Lower Norfair: Rising Kihunters
    dw $078D, $8E58  ; DDB
    dw $079B, $9ABB  ; MDB
    dw $090F, $A000  ; Screen subpixel X position
    dw $0911, $0097  ; Screen X position in pixels
    dw $0913, $8800  ; Screen subpixel Y position
    dw $0915, $0000  ; Screen Y position in pixels
    dw $0917, $0084  ; Layer 2 X position
    dw $0919, $0000  ; Layer 2 Y position
    dw $09C2, $00FF  ; Health
    dw $09CA, $000A  ; Supers
    dw $0AF6, $00F8  ; Samus X
    dw $0AF8, $DFFF  ; Samus subpixel X
    dw $0AFA, $009B  ; Samus Y
    dw $D8B6, $4023  ; Doors
    dw #$FFFF

preset_zfackpdr_lower_norfair_dragon_ruins:
    dw #preset_zfackpdr_lower_norfair_ball_maze ; Lower Norfair: Ball Maze
    dw $078D, $8F9C  ; DDB
    dw $079B, $9BF6  ; MDB
    dw $090F, $F800  ; Screen subpixel X position
    dw $0911, $0000  ; Screen X position in pixels
    dw $0913, $0000  ; Screen subpixel Y position
    dw $0915, $021B  ; Screen Y position in pixels
    dw $0917, $0000  ; Layer 2 X position
    dw $0919, $0194  ; Layer 2 Y position
    dw $09C2, $0082  ; Health
    dw $09C6, $0032  ; Missiles
    dw $09CA, $0009  ; Supers
    dw $09CE, $0004  ; Pbs
    dw $0AF6, $0025  ; Samus X
    dw $0AF8, $0000  ; Samus subpixel X
    dw $0AFA, $028B  ; Samus Y
    dw #$FFFF

preset_zfackpdr_lower_norfair_monkey_bars:
    dw #preset_zfackpdr_lower_norfair_dragon_ruins ; Lower Norfair: Dragon Ruins
    dw $078D, $90B0  ; DDB
    dw $079B, $9C52  ; MDB
    dw $090F, $5000  ; Screen subpixel X position
    dw $0911, $0300  ; Screen X position in pixels
    dw $0913, $EC00  ; Screen subpixel Y position
    dw $0915, $0016  ; Screen Y position in pixels
    dw $0917, $0300  ; Layer 2 X position
    dw $0919, $0016  ; Layer 2 Y position
    dw $09C2, $009A  ; Health
    dw $09CA, $000B  ; Supers
    dw $09CE, $0005  ; Pbs
    dw $0A1C, $0001  ; Samus position/state
    dw $0A1E, $0008  ; More position/state
    dw $0AF6, $03DB  ; Samus X
    dw $0AF8, $FFFF  ; Samus subpixel X
    dw $0AFA, $009B  ; Samus Y
    dw $0AFC, $CFFF  ; Samus subpixel Y
    dw $D8B6, $4223  ; Doors
    dw #$FFFF

preset_zfackpdr_lower_norfair_crumble_lobby:
    dw #preset_zfackpdr_lower_norfair_monkey_bars ; Lower Norfair: Monkey Bars
    dw $078D, $9050  ; DDB
    dw $079B, $9B96  ; MDB
    dw $090F, $6000  ; Screen subpixel X position
    dw $0911, $0200  ; Screen X position in pixels
    dw $0913, $9400  ; Screen subpixel Y position
    dw $0915, $0300  ; Screen Y position in pixels
    dw $0917, $0180  ; Layer 2 X position
    dw $0919, $0240  ; Layer 2 Y position
    dw $09C2, $00C7  ; Health
    dw $09CA, $000C  ; Supers
    dw $0AF6, $02D1  ; Samus X
    dw $0AF8, $1FFF  ; Samus subpixel X
    dw $0AFA, $038B  ; Samus Y
    dw $0AFC, $FFFF  ; Samus subpixel Y
    dw #$FFFF

preset_zfackpdr_lower_norfair_metal_ninja_pirates:
    dw #preset_zfackpdr_lower_norfair_crumble_lobby ; Lower Norfair: Crumble Lobby
    dw $078D, $9038  ; DDB
    dw $079B, $9B65  ; MDB
    dw $090F, $5000  ; Screen subpixel X position
    dw $0911, $0000  ; Screen X position in pixels
    dw $0913, $D800  ; Screen subpixel Y position
    dw $0915, $0022  ; Screen Y position in pixels
    dw $0917, $0000  ; Layer 2 X position
    dw $0919, $0019  ; Layer 2 Y position
    dw $09C2, $0072  ; Health
    dw $09CA, $000B  ; Supers
    dw $0AF6, $00CA  ; Samus X
    dw $0AF8, $E000  ; Samus subpixel X
    dw $0AFA, $008B  ; Samus Y
    dw $D8B6, $42A3  ; Doors
    dw #$FFFF

preset_zfackpdr_lower_norfair_ridley_entrance:
    dw #preset_zfackpdr_lower_norfair_metal_ninja_pirates ; Lower Norfair: Metal Ninja Pirates
    dw $078D, $9020  ; DDB
    dw $079B, $9C83  ; MDB
    dw $090F, $CFFF  ; Screen subpixel X position
    dw $0911, $0200  ; Screen X position in pixels
    dw $0913, $9000  ; Screen subpixel Y position
    dw $0915, $0000  ; Screen Y position in pixels
    dw $0917, $0180  ; Layer 2 X position
    dw $0919, $0000  ; Layer 2 Y position
    dw $09C2, $0145  ; Health
    dw $09CA, $000F  ; Supers
    dw $0AF6, $02D1  ; Samus X
    dw $0AF8, $BFFF  ; Samus subpixel X
    dw $D8B6, $4AA3  ; Doors
    dw #$FFFF

preset_zfackpdr_lower_norfair_ridley:
    dw #preset_zfackpdr_lower_norfair_ridley_entrance ; Lower Norfair: Ridley Entrance
    dw $078D, $9104  ; DDB
    dw $079B, $9CDD  ; MDB
    dw $07F5, $0004  ; Music Track
    dw $090F, $C000  ; Screen subpixel X position
    dw $0911, $02E3  ; Screen X position in pixels
    dw $0913, $C800  ; Screen subpixel Y position
    dw $0917, $022A  ; Layer 2 X position
    dw $09C2, $0108  ; Health
    dw $09CE, $0002  ; Pbs
    dw $0A1C, $0002  ; Samus position/state
    dw $0A1E, $0004  ; More position/state
    dw $0AF6, $0347  ; Samus X
    dw $0AF8, $C000  ; Samus subpixel X
    dw #$FFFF

preset_zfackpdr_ln_escape_ridley_escape:
    dw #preset_zfackpdr_lower_norfair_ridley ; Lower Norfair: Ridley
    dw $078D, $8E10  ; DDB
    dw $079B, $9BC3  ; MDB
    dw $07F3, $0024  ; Music Bank
    dw $07F5, $0003  ; Music Track
    dw $0911, $0100  ; Screen X position in pixels
    dw $0913, $F000  ; Screen subpixel Y position
    dw $0915, $001F  ; Screen Y position in pixels
    dw $0917, $00C0  ; Layer 2 X position
    dw $0919, $001D  ; Layer 2 Y position
    dw $09C2, $0257  ; Health
    dw $09C4, $0257  ; Max health
    dw $09D6, $0000  ; Reserves
    dw $0A1C, $0001  ; Samus position/state
    dw $0A1E, $0008  ; More position/state
    dw $0AF6, $0150  ; Samus X
    dw $0AF8, $CFFF  ; Samus subpixel X
    dw $0AFA, $00AB  ; Samus Y
    dw $D82A, $0103  ; Bosses
    dw $D876, $8540  ; Items
    dw $D8B4, $A642  ; Doors
    dw #$FFFF

preset_zfackpdr_ln_escape_crumble_lobby_revisit:
    dw #preset_zfackpdr_ln_escape_ridley_escape ; LN Escape: Ridley Escape
    dw $078D, $8FFC  ; DDB
    dw $079B, $9B96  ; MDB
    dw $07F3, $0018  ; Music Bank
    dw $07F5, $0005  ; Music Track
    dw $090F, $1001  ; Screen subpixel X position
    dw $0911, $0200  ; Screen X position in pixels
    dw $0913, $5BFF  ; Screen subpixel Y position
    dw $0915, $0300  ; Screen Y position in pixels
    dw $0917, $0180  ; Layer 2 X position
    dw $0919, $0240  ; Layer 2 Y position
    dw $09C2, $0248  ; Health
    dw $09D6, $0064  ; Reserves
    dw $0AF6, $02C5  ; Samus X
    dw $0AF8, $9000  ; Samus subpixel X
    dw $0AFA, $038B  ; Samus Y
    dw #$FFFF

preset_zfackpdr_ln_escape_ln_main_hall_revisit:
    dw #preset_zfackpdr_ln_escape_crumble_lobby_revisit ; LN Escape: Crumble Lobby Revisit
    dw $078D, $9014  ; DDB
    dw $079B, $9B38  ; MDB
    dw $090F, $8000  ; Screen subpixel X position
    dw $0913, $E400  ; Screen subpixel Y position
    dw $0915, $0000  ; Screen Y position in pixels
    dw $0919, $0000  ; Layer 2 Y position
    dw $09C2, $0232  ; Health
    dw $0AF6, $02D3  ; Samus X
    dw $0AF8, $7FFF  ; Samus subpixel X
    dw $0AFA, $008B  ; Samus Y
    dw #$FFFF

preset_zfackpdr_ln_escape_lava_dive_revisit:
    dw #preset_zfackpdr_ln_escape_ln_main_hall_revisit ; LN Escape: LN Main Hall Revisit
    dw $078D, $8E7C  ; DDB
    dw $079B, $9D37  ; MDB
    dw $07F5, $0003  ; Music Track
    dw $090F, $E000  ; Screen subpixel X position
    dw $0911, $0000  ; Screen X position in pixels
    dw $0913, $DC00  ; Screen subpixel Y position
    dw $0915, $0100  ; Screen Y position in pixels
    dw $0917, $0000  ; Layer 2 X position
    dw $0919, $00C0  ; Layer 2 Y position
    dw $09CA, $000C  ; Supers
    dw $0AF6, $00CB  ; Samus X
    dw $0AF8, $6FFF  ; Samus subpixel X
    dw $0AFA, $018B  ; Samus Y
    dw #$FFFF

preset_zfackpdr_ln_escape_norfair_lobby_revisit:
    dw #preset_zfackpdr_ln_escape_lava_dive_revisit ; LN Escape: Lava Dive Revisit
    dw $078D, $9170  ; DDB
    dw $079B, $9D93  ; MDB
    dw $07F3, $0015  ; Music Bank
    dw $07F5, $0005  ; Music Track
    dw $090F, $0000  ; Screen subpixel X position
    dw $0911, $0200  ; Screen X position in pixels
    dw $0913, $0000  ; Screen subpixel Y position
    dw $0915, $021C  ; Screen Y position in pixels
    dw $0917, $0180  ; Layer 2 X position
    dw $0919, $0195  ; Layer 2 Y position
    dw $09C2, $022D  ; Health
    dw $0AF6, $02C7  ; Samus X
    dw $0AF8, $EFFF  ; Samus subpixel X
    dw $0AFA, $028B  ; Samus Y
    dw #$FFFF

preset_zfackpdr_ln_escape_red_tower_revisit:
    dw #preset_zfackpdr_ln_escape_norfair_lobby_revisit ; LN Escape: Norfair Lobby Revisit
    dw $078D, $8D80  ; DDB
    dw $079B, $9FCF  ; MDB
    dw $090F, $7000  ; Screen subpixel X position
    dw $0913, $6401  ; Screen subpixel Y position
    dw $0915, $0100  ; Screen Y position in pixels
    dw $0919, $00C0  ; Layer 2 Y position
    dw $09C2, $0232  ; Health
    dw $0AF6, $02CA  ; Samus X
    dw $0AF8, $3FFF  ; Samus subpixel X
    dw $0AFA, $016B  ; Samus Y
    dw #$FFFF

preset_zfackpdr_ln_escape_red_brin_elevator_2:
    dw #preset_zfackpdr_ln_escape_red_tower_revisit ; LN Escape: Red Tower Revisit
    dw $078D, $8888  ; DDB
    dw $079B, $9110  ; MDB
    dw $07F3, $0012  ; Music Bank
    dw $090F, $0000  ; Screen subpixel X position
    dw $0911, $001A  ; Screen X position in pixels
    dw $0913, $E400  ; Screen subpixel Y position
    dw $0915, $001F  ; Screen Y position in pixels
    dw $0917, $0016  ; Layer 2 X position
    dw $0919, $001B  ; Layer 2 Y position
    dw $09C2, $01B8  ; Health
    dw $0A1C, $0002  ; Samus position/state
    dw $0A1E, $0004  ; More position/state
    dw $0AF6, $00BA  ; Samus X
    dw $0AF8, $03FF  ; Samus subpixel X
    dw $0AFA, $00AB  ; Samus Y
    dw #$FFFF

preset_zfackpdr_ln_escape_canonball_revisit:
    dw #preset_zfackpdr_ln_escape_red_brin_elevator_2 ; LN Escape: Red Brin Elevator
    dw $078D, $8930  ; DDB
    dw $079B, $8194  ; MDB
    dw $07F5, $0003  ; Music Track
    dw $090F, $D000  ; Screen subpixel X position
    dw $0911, $0200  ; Screen X position in pixels
    dw $0913, $C000  ; Screen subpixel Y position
    dw $0915, $0000  ; Screen Y position in pixels
    dw $0917, $0200  ; Layer 2 X position
    dw $0919, $0000  ; Layer 2 Y position
    dw $09C2, $01B9  ; Health
    dw $09C6, $002F  ; Missiles
    dw $09CE, $0004  ; Pbs
    dw $0A1C, $0001  ; Samus position/state
    dw $0A1E, $0008  ; More position/state
    dw $0AF6, $02CA  ; Samus X
    dw $0AF8, $8000  ; Samus subpixel X
    dw $0AFA, $008B  ; Samus Y
    dw #$FFFF

preset_zfackpdr_ln_escape_old_mb_revisit:
    dw #preset_zfackpdr_ln_escape_canonball_revisit ; LN Escape: Canonball Revisit
    dw $078D, $821C  ; DDB
    dw $079B, $8420  ; MDB
    dw $07F3, $0009  ; Music Bank
    dw $07F5, $0005  ; Music Track
    dw $090F, $F000  ; Screen subpixel X position
    dw $0913, $CC00  ; Screen subpixel Y position
    dw $0917, $01C0  ; Layer 2 X position
    dw $09C2, $01BE  ; Health
    dw $09C6, $0031  ; Missiles
    dw $09CA, $000D  ; Supers
    dw $09CE, $0005  ; Pbs
    dw $0AF8, $4FFF  ; Samus subpixel X
    dw $0AFA, $006B  ; Samus Y
    dw #$FFFF

preset_zfackpdr_ln_escape_g4:
    dw #preset_zfackpdr_ln_escape_old_mb_revisit ; LN Escape: Old MB Revisit
    dw $078D, $8168  ; DDB
    dw $079B, $80AD  ; MDB
    dw $07F5, $0003  ; Music Track
    dw $090F, $8000  ; Screen subpixel X position
    dw $0911, $0000  ; Screen X position in pixels
    dw $0913, $B800  ; Screen subpixel Y position
    dw $0917, $0000  ; Layer 2 X position
    dw $0A1C, $0002  ; Samus position/state
    dw $0A1E, $0004  ; More position/state
    dw $0AF6, $0041  ; Samus X
    dw $0AF8, $4000  ; Samus subpixel X
    dw $0AFA, $00BB  ; Samus Y
    dw #$FFFF

preset_zfackpdr_tourian_enter_tourian:
    dw #preset_zfackpdr_ln_escape_g4 ; LN Escape: G4
    dw $078D, $8444  ; DDB
    dw $079B, $81C3  ; MDB
    dw $07F5, $0006  ; Music Track
    dw $090F, $F000  ; Screen subpixel X position
    dw $0913, $8000  ; Screen subpixel Y position
    dw $0915, $011F  ; Screen Y position in pixels
    dw $09C2, $01CB  ; Health
    dw $09C6, $0032  ; Missiles
    dw $09CA, $000C  ; Supers
    dw $09CE, $0004  ; Pbs
    dw $0A1C, $0001  ; Samus position/state
    dw $0A1E, $0008  ; More position/state
    dw $0AF6, $0065  ; Samus X
    dw $0AF8, $8000  ; Samus subpixel X
    dw $0AFA, $019B  ; Samus Y
    dw $D820, $3FC1  ; Events
    dw $D8B2, $EF6E  ; Doors
    dw #$FFFF

preset_zfackpdr_tourian_acid_spark:
    dw #preset_zfackpdr_tourian_enter_tourian ; Tourian: Enter Tourian
    dw $078D, $A9C4  ; DDB
    dw $079B, $C521  ; MDB
    dw $07F3, $001E  ; Music Bank
    dw $07F5, $0005  ; Music Track
    dw $090F, $3003  ; Screen subpixel X position
    dw $0913, $1800  ; Screen subpixel Y position
    dw $0915, $004A  ; Screen Y position in pixels
    dw $0919, $0045  ; Layer 2 Y position
    dw $09C2, $01A5  ; Health
    dw $09CE, $0003  ; Pbs
    dw $0A1C, $0002  ; Samus position/state
    dw $0A1E, $0004  ; More position/state
    dw $0AF6, $0025  ; Samus X
    dw $0AF8, $FFFF  ; Samus subpixel X
    dw $0AFA, $00DB  ; Samus Y
    dw #$FFFF

preset_zfackpdr_tourian_pirate_debocle_:
    dw #preset_zfackpdr_tourian_acid_spark ; Tourian: Acid Spark
    dw $078D, $A9B8  ; DDB
    dw $079B, $C4D3  ; MDB
    dw $090F, $9000  ; Screen subpixel X position
    dw $0913, $3401  ; Screen subpixel Y position
    dw $0915, $0053  ; Screen Y position in pixels
    dw $0919, $004D  ; Layer 2 Y position
    dw $09C2, $00F0  ; Health
    dw $0A1C, $0041  ; Samus position/state
    dw $0A1E, $0404  ; More position/state
    dw $0AF6, $001A  ; Samus X
    dw $0AF8, $4000  ; Samus subpixel X
    dw $0AFA, $00C9  ; Samus Y
    dw #$FFFF

preset_zfackpdr_tourian_false_lava:
    dw #preset_zfackpdr_tourian_pirate_debocle_ ; Tourian: Pirate Debocle 
    dw $078D, $A97C  ; DDB
    dw $079B, $C464  ; MDB
    dw $090F, $5100  ; Screen subpixel X position
    dw $0913, $4400  ; Screen subpixel Y position
    dw $0915, $0200  ; Screen Y position in pixels
    dw $0919, $0180  ; Layer 2 Y position
    dw $09C2, $009E  ; Health
    dw $0A1C, $0002  ; Samus position/state
    dw $0A1E, $0004  ; More position/state
    dw $0AF6, $0042  ; Samus X
    dw $0AF8, $0400  ; Samus subpixel X
    dw $0AFA, $029B  ; Samus Y
    dw #$FFFF

preset_zfackpdr_tourian_generator:
    dw #preset_zfackpdr_tourian_false_lava ; Tourian: False Lava
    dw $078D, $A934  ; DDB
    dw $079B, $C3D6  ; MDB
    dw $090F, $8400  ; Screen subpixel X position
    dw $0913, $0000  ; Screen subpixel Y position
    dw $0915, $0400  ; Screen Y position in pixels
    dw $0919, $0300  ; Layer 2 Y position
    dw $09CA, $000B  ; Supers
    dw $0A1C, $0089  ; Samus position/state
    dw $0A1E, $1508  ; More position/state
    dw $0AF6, $00DB  ; Samus X
    dw $0AF8, $FFFF  ; Samus subpixel X
    dw $0AFA, $04BB  ; Samus Y
    dw #$FFFF

preset_zfackpdr_tourian_enter_night:
    dw #preset_zfackpdr_tourian_generator ; Tourian: Generator
    dw $078D, $AA60  ; DDB
    dw $079B, $C223  ; MDB
    dw $07F5, $0004  ; Music Track
    dw $090F, $0000  ; Screen subpixel X position
    dw $0913, $AC00  ; Screen subpixel Y position
    dw $0915, $001F  ; Screen Y position in pixels
    dw $0919, $0001  ; Layer 2 Y position
    dw $09C2, $0080  ; Health
    dw $09C6, $0015  ; Missiles
    dw $09CA, $0001  ; Supers
    dw $09D2, $0001  ; Currently selected item
    dw $0A1C, $0041  ; Samus position/state
    dw $0A1E, $0404  ; More position/state
    dw $0AF6, $009E  ; Samus X
    dw $0AF8, $8000  ; Samus subpixel X
    dw $0AFA, $00D9  ; Samus Y
    dw $D82C, $0403  ; Bosses
    dw #$FFFF

preset_zfackpdr_tourian_first_metroid:
    dw #preset_zfackpdr_tourian_enter_night ; Tourian: Enter Night
    dw $078D, $A874  ; DDB
    dw $079B, $C24E  ; MDB
    dw $07F3, $0045  ; Music Bank
    dw $090F, $C000  ; Screen subpixel X position
    dw $0911, $0300  ; Screen X position in pixels
    dw $0913, $2800  ; Screen subpixel Y position
    dw $0915, $0200  ; Screen Y position in pixels
    dw $09D2, $0000  ; Currently selected item
    dw $0A1C, $0001  ; Samus position/state
    dw $0A1E, $0008  ; More position/state
    dw $0AF6, $03B4  ; Samus X
    dw $0AF8, $7000  ; Samus subpixel X
    dw $0AFA, $028B  ; Samus Y
    dw #$FFFF

preset_zfackpdr_tourian_metroid_platforms:
    dw #preset_zfackpdr_tourian_first_metroid ; Tourian: First Metroid
    dw $078D, $A880  ; DDB
    dw $079B, $C279  ; MDB
    dw $090F, $A000  ; Screen subpixel X position
    dw $0911, $0200  ; Screen X position in pixels
    dw $0913, $8000  ; Screen subpixel Y position
    dw $0915, $0000  ; Screen Y position in pixels
    dw $0917, $0001  ; Layer 2 X position
    dw $0919, $0000  ; Layer 2 Y position
    dw $09C2, $0099  ; Health
    dw $09C6, $0016  ; Missiles
    dw $09CA, $0002  ; Supers
    dw $0AF6, $02CE  ; Samus X
    dw $0AF8, $BFFF  ; Samus subpixel X
    dw $0AFA, $00AB  ; Samus Y
    dw $D8BE, $08C5  ; Doors
    dw #$FFFF

preset_zfackpdr_tourian_metroid_platforms_loop:
    dw #preset_zfackpdr_tourian_metroid_platforms ; Tourian: Metroid Platforms
    dw $078D, $A8B0  ; DDB
    dw $079B, $C2D3  ; MDB
    dw $090F, $C000  ; Screen subpixel X position
    dw $0913, $9C00  ; Screen subpixel Y position
    dw $0915, $0021  ; Screen Y position in pixels
    dw $09C2, $01B0  ; Health
    dw $09C6, $0029  ; Missiles
    dw $09CA, $0006  ; Supers
    dw $09CE, $0005  ; Pbs
    dw $0A1C, $0002  ; Samus position/state
    dw $0A1E, $0004  ; More position/state
    dw $0AF6, $0238  ; Samus X
    dw $0AF8, $B000  ; Samus subpixel X
    dw $0AFA, $008B  ; Samus Y
    dw #$FFFF

preset_zfackpdr_tourian_metroid_hall_and_tower:
    dw #preset_zfackpdr_tourian_metroid_platforms_loop ; Tourian: Metroid Platforms Loop
    dw $078D, $A898  ; DDB
    dw $079B, $C300  ; MDB
    dw $0911, $0000  ; Screen X position in pixels
    dw $0913, $0000  ; Screen subpixel Y position
    dw $0915, $001D  ; Screen Y position in pixels
    dw $0917, $0000  ; Layer 2 X position
    dw $0919, $0301  ; Layer 2 Y position
    dw $09C2, $0257  ; Health
    dw $09C6, $0032  ; Missiles
    dw $09CA, $0008  ; Supers
    dw $0AF6, $0032  ; Samus X
    dw $0AF8, $6000  ; Samus subpixel X
    dw $D822, $0021  ; Events
    dw $D8BE, $58C5  ; Doors
    dw #$FFFF

preset_zfackpdr_tourian_metroid_toilet:
    dw #preset_zfackpdr_tourian_metroid_hall_and_tower ; Tourian: Metroid Hall and Tower
    dw $078D, $A8F8  ; DDB
    dw $079B, $C3D6  ; MDB
    dw $090F, $0000  ; Screen subpixel X position
    dw $0913, $8400  ; Screen subpixel Y position
    dw $0915, $0022  ; Screen Y position in pixels
    dw $0917, $0001  ; Layer 2 X position
    dw $0919, $0000  ; Layer 2 Y position
    dw $09CA, $000F  ; Supers
    dw $0A1C, $0001  ; Samus position/state
    dw $0A1E, $0008  ; More position/state
    dw $0AF6, $00D4  ; Samus X
    dw $0AF8, $9FFF  ; Samus subpixel X
    dw $D822, $0027  ; Events
    dw $D8BE, $D8C5  ; Doors
    dw $D8C0, $0002  ; Doors
    dw #$FFFF

preset_zfackpdr_mother_brain_baby_skip:
    dw #preset_zfackpdr_tourian_metroid_toilet ; Tourian: Metroid Toilet
    dw $078D, $AA30  ; DDB
    dw $079B, $C6E2  ; MDB
    dw $07F5, $0006  ; Music Track
    dw $090F, $E000  ; Screen subpixel X position
    dw $0913, $0000  ; Screen subpixel Y position
    dw $0915, $001B  ; Screen Y position in pixels
    dw $0917, $0000  ; Layer 2 X position
    dw $0919, $0014  ; Layer 2 Y position
    dw $0A1C, $0002  ; Samus position/state
    dw $0A1E, $0004  ; More position/state
    dw $0AF6, $002C  ; Samus X
    dw $0AF8, $C000  ; Samus subpixel X
    dw $D822, $003F  ; Events
    dw $D8C0, $00A2  ; Doors
    dw #$FFFF

preset_zfackpdr_mother_brain_sandy_elevator:
    dw #preset_zfackpdr_mother_brain_baby_skip ; Mother Brain: Baby Skip
    dw $078D, $AAD8  ; DDB
    dw $079B, $C784  ; MDB
    dw $07F3, $001E  ; Music Bank
    dw $07F5, $0005  ; Music Track
    dw $090F, $0000  ; Screen subpixel X position
    dw $0913, $A800  ; Screen subpixel Y position
    dw $0915, $0000  ; Screen Y position in pixels
    dw $0919, $0000  ; Layer 2 Y position
    dw $09C2, $024D  ; Health
    dw $0AF6, $009F  ; Samus X
    dw $0AF8, $8FFF  ; Samus subpixel X
    dw $0AFA, $005B  ; Samus Y
    dw #$FFFF

preset_zfackpdr_mother_brain_ball_maze_2:
    dw #preset_zfackpdr_mother_brain_sandy_elevator ; Mother Brain: Sandy Elevator
    dw $078D, $AAE4  ; DDB
    dw $079B, $C80F  ; MDB
    dw $090F, $3000  ; Screen subpixel X position
    dw $0913, $F800  ; Screen subpixel Y position
    dw $0915, $0038  ; Screen Y position in pixels
    dw $0919, $0031  ; Layer 2 Y position
    dw $0A1C, $001D  ; Samus position/state
    dw $0A1E, $0408  ; More position/state
    dw $0AF6, $00CC  ; Samus X
    dw $0AF8, $BFFF  ; Samus subpixel X
    dw $0AFA, $00B9  ; Samus Y
    dw #$FFFF

preset_zfackpdr_mother_brain_mother_brain_2:
    dw #preset_zfackpdr_mother_brain_ball_maze_2 ; Mother Brain: Ball Maze
    dw $078D, $AA00  ; DDB
    dw $079B, $C19A  ; MDB
    dw $090F, $F400  ; Screen subpixel X position
    dw $0913, $4000  ; Screen subpixel Y position
    dw $0915, $0100  ; Screen Y position in pixels
    dw $0919, $00C0  ; Layer 2 Y position
    dw $09C2, $020E  ; Health
    dw $09CA, $000E  ; Supers
    dw $0A1C, $0002  ; Samus position/state
    dw $0A1E, $0004  ; More position/state
    dw $0AF6, $0045  ; Samus X
    dw $0AF8, $0000  ; Samus subpixel X
    dw $0AFA, $019B  ; Samus Y
    dw $D8BE, $D9C5  ; Doors
    dw #$FFFF

preset_zfackpdr_mother_brain_mother_brain_2_2:
    dw #preset_zfackpdr_mother_brain_mother_brain_2 ; Mother Brain: Mother Brain
    dw $078D, $A820  ; DDB
    dw $079B, $C1CB  ; MDB
    dw $07F3, $0021  ; Music Bank
    dw $07F5, $0000  ; Music Track
    dw $090F, $C000  ; Screen subpixel X position
    dw $0913, $D000  ; Screen subpixel Y position
    dw $0915, $0000  ; Screen Y position in pixels
    dw $0919, $0000  ; Layer 2 Y position
    dw $09C2, $01C9  ; Health
    dw $09C6, $0019  ; Missiles
    dw $09CA, $0009  ; Supers
    dw $0AF6, $00E9  ; Samus X
    dw $0AF8, $BFFF  ; Samus subpixel X
    dw $0AFA, $00C3  ; Samus Y
    dw $D820, $3FC5  ; Events
    dw #$FFFF

preset_zfackpdr_mother_brain_mother_brain_3:
    dw #preset_zfackpdr_mother_brain_mother_brain_2_2 ; Mother Brain: Mother Brain 2
    dw $07F3, $0048  ; Music Bank
    dw $07F5, $0005  ; Music Track
    dw $090F, $F000  ; Screen subpixel X position
    dw $0913, $8C00  ; Screen subpixel Y position
    dw $09A6, $1009  ; Beams
    dw $09C2, $0257  ; Health
    dw $09C6, $0000  ; Missiles
    dw $09CA, $0000  ; Supers
    dw $09CE, $0000  ; Pbs
    dw $0A1C, $0006  ; Samus position/state
    dw $0A76, $8000  ; Hyper beam
    dw $0AF6, $00CD  ; Samus X
    dw $0AF8, $A600  ; Samus subpixel X
    dw #$FFFF

preset_zfackpdr_mother_brain_escape:
    dw #preset_zfackpdr_mother_brain_mother_brain_3 ; Mother Brain: Mother Brain 3
    dw $07F3, $0024  ; Music Bank
    dw $07F5, $0007  ; Music Track
    dw $090F, $E000  ; Screen subpixel X position
    dw $0913, $9C00  ; Screen subpixel Y position
    dw $09C2, $021B  ; Health
    dw $0A1C, $0002  ; Samus position/state
    dw $0AF6, $0031  ; Samus X
    dw $0AF8, $4000  ; Samus subpixel X
    dw $D820, $7FC5  ; Events
    dw $D82C, $0603  ; Bosses
    dw #$FFFF

preset_zfackpdr_mother_brain_ball_maze_revisit:
    dw #preset_zfackpdr_mother_brain_escape ; Mother Brain: Escape
    dw $078D, $A868  ; DDB
    dw $079B, $C613  ; MDB
    dw $090F, $9000  ; Screen subpixel X position
    dw $0911, $0600  ; Screen X position in pixels
    dw $0917, $0480  ; Layer 2 X position
    dw $09C2, $017B  ; Health
    dw $0A1C, $0001  ; Samus position/state
    dw $0A1E, $0008  ; More position/state
    dw $0AF6, $06BC  ; Samus X
    dw $0AF8, $BFFF  ; Samus subpixel X
    dw $0AFA, $008B  ; Samus Y
    dw #$FFFF

preset_zfackpdr_mother_brain_tourian_elevator_spark:
    dw #preset_zfackpdr_mother_brain_ball_maze_revisit ; Mother Brain: Ball Maze Revisit
    dw $078D, $A8E0  ; DDB
    dw $079B, $C83E  ; MDB
    dw $090F, $4000  ; Screen subpixel X position
    dw $0911, $0100  ; Screen X position in pixels
    dw $0913, $8C00  ; Screen subpixel Y position
    dw $0915, $0023  ; Screen Y position in pixels
    dw $0917, $00C0  ; Layer 2 X position
    dw $0919, $0020  ; Layer 2 Y position
    dw $09C2, $00C2  ; Health
    dw $0AF6, $01DB  ; Samus X
    dw $0AF8, $FFFF  ; Samus subpixel X
    dw $0AFA, $00AB  ; Samus Y
    dw #$FFFF

preset_zfackpdr_mother_brain_pirate_frenzy:
    dw #preset_zfackpdr_mother_brain_tourian_elevator_spark ; Mother Brain: Tourian Elevator Spark
    dw $078D, $83F0  ; DDB
    dw $079B, $87F9  ; MDB
    dw $090F, $8000  ; Screen subpixel X position
    dw $0911, $0300  ; Screen X position in pixels
    dw $0913, $0000  ; Screen subpixel Y position
    dw $0915, $0033  ; Screen Y position in pixels
    dw $0917, $0240  ; Layer 2 X position
    dw $0919, $0026  ; Layer 2 Y position
    dw $09C2, $0041  ; Health
    dw $0A1C, $0002  ; Samus position/state
    dw $0A1E, $0004  ; More position/state
    dw $0AF6, $03A2  ; Samus X
    dw $0AF8, $0FFF  ; Samus subpixel X
    dw $0AFA, $009B  ; Samus Y
    dw #$FFFF

preset_zfackpdr_mother_brain_purple_stairs_revisit_2:
    dw #preset_zfackpdr_mother_brain_pirate_frenzy ; Mother Brain: Pirate Frenzy
    dw $078D, $8390  ; DDB
    dw $079B, $86D2  ; MDB
    dw $090F, $1000  ; Screen subpixel X position
    dw $0911, $0000  ; Screen X position in pixels
    dw $0913, $4C00  ; Screen subpixel Y position
    dw $0915, $001C  ; Screen Y position in pixels
    dw $0917, $0000  ; Layer 2 X position
    dw $0919, $0015  ; Layer 2 Y position
    dw $0A1C, $0001  ; Samus position/state
    dw $0A1E, $0008  ; More position/state
    dw $0AF6, $00C6  ; Samus X
    dw $0AF8, $2000  ; Samus subpixel X
    dw $0AFA, $008B  ; Samus Y
    dw #$FFFF
