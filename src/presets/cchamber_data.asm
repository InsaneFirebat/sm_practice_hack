
preset_cchamber_crateria_puzzle_1:
    dw #$0000
    dw $078D, $8916  ; DDB
    dw $079B, $9E9F  ; MDB
    dw $07F3, $000F  ; Music Bank
    dw $07F5, $0005  ; Music Track
    dw $090F, $0000  ; Screen subpixel X position
    dw $0911, $00E1  ; Screen X position in pixels
    dw $0913, $C401  ; Screen subpixel Y position
    dw $0915, $0100  ; Screen Y position in pixels
    dw $0917, $00A8  ; Layer 2 X position
    dw $0919, $00C0  ; Layer 2 Y position
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
    dw $0A1C, $0002  ; Samus position/state
    dw $0A1E, $0004  ; More position/state
    dw $0A68, $0000  ; Flash suit
    dw $0A76, $0000  ; Hyper beam
    dw $0AF6, $0181  ; Samus X
    dw $0AF8, $A000  ; Samus subpixel X
    dw $0AFA, $014B  ; Samus Y
    dw $0AFC, $FFFF  ; Samus subpixel Y
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

preset_cchamber_crateria_puzzle_2:
    dw #preset_cchamber_crateria_puzzle_1 ; Crateria: Puzzle 1
    dw $078D, $8E9E  ; DDB
    dw $079B, $92FD  ; MDB
    dw $090F, $A001  ; Screen subpixel X position
    dw $0911, $0100  ; Screen X position in pixels
    dw $0913, $1000  ; Screen subpixel Y position
    dw $0915, $01F5  ; Screen Y position in pixels
    dw $0917, $00C0  ; Layer 2 X position
    dw $0919, $0177  ; Layer 2 Y position
    dw $09A2, $0004  ; Equipped Items
    dw $09A4, $0004  ; Collected Items
    dw $0AF6, $014A  ; Samus X
    dw $0AF8, $D000  ; Samus subpixel X
    dw $0AFA, $028B  ; Samus Y
    dw $D872, $0400  ; Items
    dw #$FFFF

preset_cchamber_crateria_puzzle_3:
    dw #preset_cchamber_crateria_puzzle_2 ; Crateria: Puzzle 2
    dw $090F, $C000  ; Screen subpixel X position
    dw $0911, $0200  ; Screen X position in pixels
    dw $0913, $0000  ; Screen subpixel Y position
    dw $0915, $021B  ; Screen Y position in pixels
    dw $0917, $0180  ; Layer 2 X position
    dw $0919, $0194  ; Layer 2 Y position
    dw $09A6, $1000  ; Beams
    dw $09A8, $1000  ; Beams
    dw $0A1C, $0001  ; Samus position/state
    dw $0A1E, $0008  ; More position/state
    dw $0AF6, $02BB  ; Samus X
    dw $0AF8, $6BFF  ; Samus subpixel X
    dw $D870, $1000  ; Items
    dw #$FFFF

preset_cchamber_crateria_puzzle_4:
    dw #preset_cchamber_crateria_puzzle_3 ; Crateria: Puzzle 3
    dw $078D, $8BB6  ; DDB
    dw $090F, $4000  ; Screen subpixel X position
    dw $0911, $0100  ; Screen X position in pixels
    dw $0915, $011B  ; Screen Y position in pixels
    dw $0917, $00C0  ; Layer 2 X position
    dw $0919, $00D4  ; Layer 2 Y position
    dw $09A2, $1004  ; Equipped Items
    dw $09A4, $1004  ; Collected Items
    dw $0A1C, $0002  ; Samus position/state
    dw $0A1E, $0004  ; More position/state
    dw $0AF6, $0138  ; Samus X
    dw $0AF8, $E400  ; Samus subpixel X
    dw $0AFA, $018B  ; Samus Y
    dw $D820, $0001  ; Events
    dw $D828, $0004  ; Bosses
    dw $D870, $1080  ; Items
    dw $D8B2, $2800  ; Doors
    dw #$FFFF

preset_cchamber_crateria_puzzle_5:
    dw #preset_cchamber_crateria_puzzle_4 ; Crateria: Puzzle 4
    dw $078D, $88FC  ; DDB
    dw $079B, $9F11  ; MDB
    dw $090F, $0000  ; Screen subpixel X position
    dw $0911, $0000  ; Screen X position in pixels
    dw $0913, $9000  ; Screen subpixel Y position
    dw $0915, $0000  ; Screen Y position in pixels
    dw $0917, $0000  ; Layer 2 X position
    dw $0919, $0000  ; Layer 2 Y position
    dw $09C6, $0005  ; Missiles
    dw $09C8, $0005  ; Max missiles
    dw $0A1C, $0001  ; Samus position/state
    dw $0A1E, $0008  ; More position/state
    dw $0AF6, $00C1  ; Samus X
    dw $0AF8, $7FFF  ; Samus subpixel X
    dw $0AFA, $008B  ; Samus Y
    dw $D874, $0002  ; Items
    dw #$FFFF

preset_cchamber_crateria_puzzle_5_gate:
    dw #preset_cchamber_crateria_puzzle_5 ; Crateria: Puzzle 5
    dw $078D, $8ECE  ; DDB
    dw $079B, $9F64  ; MDB
    dw $090F, $6FFF  ; Screen subpixel X position
    dw $0911, $0200  ; Screen X position in pixels
    dw $0913, $BC00  ; Screen subpixel Y position
    dw $0915, $011B  ; Screen Y position in pixels
    dw $0917, $0180  ; Layer 2 X position
    dw $0919, $00D4  ; Layer 2 Y position
    dw $0A1C, $0002  ; Samus position/state
    dw $0A1E, $0004  ; More position/state
    dw $0AF6, $02A2  ; Samus X
    dw $0AF8, $6000  ; Samus subpixel X
    dw $0AFA, $018B  ; Samus Y
    dw !PRESET_DOORS, $0001  ; Doors closed
    dw !PRESET_ENEMIES, $0001 ; Enemies alive
    dw #$FFFF

preset_cchamber_crateria_puzzle_5_super:
    dw #preset_cchamber_crateria_puzzle_5_gate ; Crateria: Puzzle 5 Gate
    dw $078D, $8EF2  ; DDB
    dw $079B, $A1AD  ; MDB
    dw $090F, $0C00  ; Screen subpixel X position
    dw $0911, $0000  ; Screen X position in pixels
    dw $0913, $A7FE  ; Screen subpixel Y position
    dw $0915, $0000  ; Screen Y position in pixels
    dw $0917, $0000  ; Layer 2 X position
    dw $0919, $0000  ; Layer 2 Y position
    dw $0AF6, $0031  ; Samus X
    dw $0AF8, $4C00  ; Samus subpixel X
    dw $0AFA, $008B  ; Samus Y
    dw !PRESET_DOORS, $0000  ; Doors opened
    dw !PRESET_ENEMIES, $0001 ; Enemies cleared
    dw #$FFFF

preset_cchamber_crateria_puzzle_6:
    dw #preset_cchamber_crateria_puzzle_5_super ; Crateria: Puzzle 5 Super
    dw $078D, $8EB6  ; DDB
    dw $079B, $92FD  ; MDB
    dw $090F, $4000  ; Screen subpixel X position
    dw $0911, $0400  ; Screen X position in pixels
    dw $0913, $E400  ; Screen subpixel Y position
    dw $0915, $041F  ; Screen Y position in pixels
    dw $0917, $0300  ; Layer 2 X position
    dw $0919, $0317  ; Layer 2 Y position
    dw $09CA, $0001  ; Supers
    dw $09CC, $0001  ; Max supers
    dw $0AF6, $043A  ; Samus X
    dw $0AF8, $0000  ; Samus subpixel X
    dw $0AFA, $0496  ; Samus Y
    dw $0AFC, $CBFF  ; Samus subpixel Y
    dw $D874, $0012  ; Items
    dw #$FFFF

preset_cchamber_brinstar_puzzle_7:
    dw #preset_cchamber_crateria_puzzle_6 ; Crateria: Puzzle 6
    dw $078D, $89A6  ; DDB
    dw $079B, $99BD  ; MDB
    dw $090F, $D000  ; Screen subpixel X position
    dw $0911, $0000  ; Screen X position in pixels
    dw $0913, $0000  ; Screen subpixel Y position
    dw $0915, $041D  ; Screen Y position in pixels
    dw $0917, $0001  ; Layer 2 X position
    dw $0919, $0315  ; Layer 2 Y position
    dw $09C2, $0053  ; Health
    dw $09C6, $000A  ; Missiles
    dw $09C8, $000A  ; Max missiles
    dw $09CA, $0000  ; Supers
    dw $0A1C, $0001  ; Samus position/state
    dw $0A1E, $0008  ; More position/state
    dw $0AF6, $00BD  ; Samus X
    dw $0AF8, $9FFF  ; Samus subpixel X
    dw $0AFA, $048B  ; Samus Y
    dw $0AFC, $FFFF  ; Samus subpixel Y
    dw $D870, $1280  ; Items
    dw #$FFFF

preset_cchamber_brinstar_puzzle_8:
    dw #preset_cchamber_brinstar_puzzle_7 ; Brinstar: Puzzle 7
    dw $078D, $8CBE  ; DDB
    dw $079B, $9E52  ; MDB
    dw $090F, $F000  ; Screen subpixel X position
    dw $0911, $0100  ; Screen X position in pixels
    dw $0913, $4000  ; Screen subpixel Y position
    dw $0915, $0102  ; Screen Y position in pixels
    dw $0917, $00C0  ; Layer 2 X position
    dw $0919, $00C1  ; Layer 2 Y position
    dw $09A2, $3004  ; Equipped Items
    dw $09A4, $3004  ; Collected Items
    dw $09C2, $0063  ; Health
    dw $09C6, $000F  ; Missiles
    dw $09C8, $000F  ; Max missiles
    dw $09CA, $0001  ; Supers
    dw $0AF6, $01B9  ; Samus X
    dw $0AF8, $BFFF  ; Samus subpixel X
    dw $0AFA, $018B  ; Samus Y
    dw $D870, $3280  ; Items
    dw $D872, $0600  ; Items
    dw #$FFFF

preset_cchamber_brinstar_puzzle_9:
    dw #preset_cchamber_brinstar_puzzle_8 ; Brinstar: Puzzle 8
    dw $078D, $8E92  ; DDB
    dw $079B, $9AD9  ; MDB
    dw $090F, $5000  ; Screen subpixel X position
    dw $0911, $0300  ; Screen X position in pixels
    dw $0913, $5400  ; Screen subpixel Y position
    dw $0915, $0800  ; Screen Y position in pixels
    dw $0917, $0300  ; Layer 2 X position
    dw $0919, $0600  ; Layer 2 Y position
    dw $0AF6, $03C4  ; Samus X
    dw $0AF8, $6FFF  ; Samus subpixel X
    dw $0AFA, $088B  ; Samus Y
    dw #$FFFF

preset_cchamber_brinstar_puzzle_a:
    dw #preset_cchamber_brinstar_puzzle_9 ; Brinstar: Puzzle 9
    dw $078D, $8CD6  ; DDB
    dw $079B, $9BC8  ; MDB
    dw $090F, $87FF  ; Screen subpixel X position
    dw $0911, $0200  ; Screen X position in pixels
    dw $0913, $CC00  ; Screen subpixel Y position
    dw $0915, $0100  ; Screen Y position in pixels
    dw $0917, $0180  ; Layer 2 X position
    dw $0919, $00C0  ; Layer 2 Y position
    dw $09C2, $005D  ; Health
    dw $09C6, $0014  ; Missiles
    dw $09C8, $0014  ; Max missiles
    dw $0AF6, $02C7  ; Samus X
    dw $0AF8, $4000  ; Samus subpixel X
    dw $0AFA, $018B  ; Samus Y
    dw $D872, $0601  ; Items
    dw #$FFFF

preset_cchamber_maridia_puzzle_b:
    dw #preset_cchamber_brinstar_puzzle_a ; Brinstar: Puzzle A
    dw $078D, $8D5A  ; DDB
    dw $079B, $CA08  ; MDB
    dw $090F, $4000  ; Screen subpixel X position
    dw $0911, $0300  ; Screen X position in pixels
    dw $0913, $7C00  ; Screen subpixel Y position
    dw $0915, $0000  ; Screen Y position in pixels
    dw $0917, $0240  ; Layer 2 X position
    dw $0919, $0000  ; Layer 2 Y position
    dw $0AF6, $03D1  ; Samus X
    dw $0AF8, $3FFF  ; Samus subpixel X
    dw $0AFA, $008B  ; Samus Y
    dw #$FFFF

preset_cchamber_maridia_puzzle_c:
    dw #preset_cchamber_maridia_puzzle_b ; Maridia: Puzzle B
    dw $078D, $A420  ; DDB
    dw $079B, $D21C  ; MDB
    dw $07F3, $001B  ; Music Bank
    dw $090F, $D880  ; Screen subpixel X position
    dw $0911, $0000  ; Screen X position in pixels
    dw $0913, $D800  ; Screen subpixel Y position
    dw $0915, $00F3  ; Screen Y position in pixels
    dw $0917, $0000  ; Layer 2 X position
    dw $0919, $00F3  ; Layer 2 Y position
    dw $09A2, $7104  ; Equipped Items
    dw $09A4, $7104  ; Collected Items
    dw $09C2, $0063  ; Health
    dw $09D2, $0004  ; Currently selected item
    dw $0A1C, $0002  ; Samus position/state
    dw $0A1E, $0004  ; More position/state
    dw $0AF6, $0046  ; Samus X
    dw $0AF8, $BFFF  ; Samus subpixel X
    dw $0AFA, $015B  ; Samus Y
    dw $D870, $B280  ; Items
    dw $D872, $0603  ; Items
    dw #$FFFF

preset_cchamber_maridia_puzzle_d:
    dw #preset_cchamber_maridia_puzzle_c ; Maridia: Puzzle C
    dw $078D, $A504  ; DDB
    dw $079B, $D252  ; MDB
    dw $090F, $E000  ; Screen subpixel X position
    dw $0913, $6800  ; Screen subpixel Y position
    dw $0915, $0000  ; Screen Y position in pixels
    dw $0919, $0000  ; Layer 2 Y position
    dw $0A1C, $0001  ; Samus position/state
    dw $0A1E, $0008  ; More position/state
    dw $0AF6, $00BC  ; Samus X
    dw $0AF8, $67FF  ; Samus subpixel X
    dw $0AFA, $008B  ; Samus Y
    dw #$FFFF

preset_cchamber_maridia_puzzle_e:
    dw #preset_cchamber_maridia_puzzle_d ; Maridia: Puzzle D
    dw $078D, $A534  ; DDB
    dw $079B, $D646  ; MDB
    dw $090F, $6000  ; Screen subpixel X position
    dw $0911, $00FE  ; Screen X position in pixels
    dw $0913, $0000  ; Screen subpixel Y position
    dw $0915, $021D  ; Screen Y position in pixels
    dw $0917, $00FE  ; Layer 2 X position
    dw $0919, $0195  ; Layer 2 Y position
    dw $09D2, $0000  ; Currently selected item
    dw $0AF6, $0187  ; Samus X
    dw $0AF8, $4000  ; Samus subpixel X
    dw $0AFA, $028B  ; Samus Y
    dw #$FFFF

preset_cchamber_maridia_puzzle_f:
    dw #preset_cchamber_maridia_puzzle_e ; Maridia: Puzzle E
    dw $078D, $A4BC  ; DDB
    dw $079B, $D1DD  ; MDB
    dw $090F, $4000  ; Screen subpixel X position
    dw $0911, $0000  ; Screen X position in pixels
    dw $0913, $1800  ; Screen subpixel Y position
    dw $0915, $011C  ; Screen Y position in pixels
    dw $0917, $0000  ; Layer 2 X position
    dw $0919, $011C  ; Layer 2 Y position
    dw $09C6, $0019  ; Missiles
    dw $09C8, $0019  ; Max missiles
    dw $0A1C, $0002  ; Samus position/state
    dw $0A1E, $0004  ; More position/state
    dw $0AF6, $0041  ; Samus X
    dw $0AF8, $1FFF  ; Samus subpixel X
    dw $0AFA, $018B  ; Samus Y
    dw $D880, $4000  ; Items
    dw #$FFFF

preset_cchamber_maridia_puzzle_g:
    dw #preset_cchamber_maridia_puzzle_f ; Maridia: Puzzle F
    dw $078D, $A4D4  ; DDB
    dw $079B, $D95E  ; MDB
    dw $090F, $3800  ; Screen subpixel X position
    dw $0913, $7000  ; Screen subpixel Y position
    dw $0915, $0000  ; Screen Y position in pixels
    dw $0919, $0000  ; Layer 2 Y position
    dw $0AF6, $004D  ; Samus X
    dw $0AF8, $DBFF  ; Samus subpixel X
    dw $0AFA, $00BB  ; Samus Y
    dw $D82C, $0002  ; Bosses
    dw #$FFFF

preset_cchamber_norfair_entry:
    dw #preset_cchamber_maridia_puzzle_g ; Maridia: Puzzle G
    dw $078D, $931E  ; DDB
    dw $079B, $A815  ; MDB
    dw $07F3, $0018  ; Music Bank
    dw $090F, $9000  ; Screen subpixel X position
    dw $0911, $0400  ; Screen X position in pixels
    dw $0913, $0000  ; Screen subpixel Y position
    dw $0915, $0200  ; Screen Y position in pixels
    dw $0917, $0300  ; Layer 2 X position
    dw $0919, $0180  ; Layer 2 Y position
    dw $09A6, $1002  ; Beams
    dw $09A8, $1002  ; Beams
    dw $0AF6, $0437  ; Samus X
    dw $0AF8, $DFFF  ; Samus subpixel X
    dw $0AFA, $028B  ; Samus Y
    dw $D882, $0010  ; Items
    dw $D8C2, $2000  ; Doors
    dw #$FFFF

preset_cchamber_norfair_gravity:
    dw #preset_cchamber_norfair_entry ; Norfair: Entry
    dw $078D, $9312  ; DDB
    dw $079B, $A923  ; MDB
    dw $090F, $2000  ; Screen subpixel X position
    dw $0911, $0800  ; Screen X position in pixels
    dw $0913, $ABFF  ; Screen subpixel Y position
    dw $0915, $0000  ; Screen Y position in pixels
    dw $0917, $0600  ; Layer 2 X position
    dw $0919, $0000  ; Layer 2 Y position
    dw $0AF6, $0839  ; Samus X
    dw $0AF8, $F000  ; Samus subpixel X
    dw $0AFA, $008B  ; Samus Y
    dw #$FFFF

preset_cchamber_norfair_puzzle_h:
    dw #preset_cchamber_norfair_gravity ; Norfair: Gravity
    dw $078D, $93A2  ; DDB
    dw $079B, $A8F8  ; MDB
    dw $090F, $C000  ; Screen subpixel X position
    dw $0911, $0000  ; Screen X position in pixels
    dw $0913, $0000  ; Screen subpixel Y position
    dw $0915, $021D  ; Screen Y position in pixels
    dw $0917, $0000  ; Layer 2 X position
    dw $0919, $0195  ; Layer 2 Y position
    dw $09A2, $7124  ; Equipped Items
    dw $09A4, $7124  ; Collected Items
    dw $09C2, $005A  ; Health
    dw $0A1C, $0001  ; Samus position/state
    dw $0A1E, $0008  ; More position/state
    dw $0AF6, $00B0  ; Samus X
    dw $0AF8, $0000  ; Samus subpixel X
    dw $0AFA, $028B  ; Samus Y
    dw $D876, $0008  ; Items
    dw #$FFFF

preset_cchamber_norfair_springball:
    dw #preset_cchamber_norfair_puzzle_h ; Norfair: Puzzle H
    dw $078D, $9396  ; DDB
    dw $079B, $AFCE  ; MDB
    dw $0911, $0300  ; Screen X position in pixels
    dw $0913, $4C00  ; Screen subpixel Y position
    dw $0915, $001C  ; Screen Y position in pixels
    dw $0917, $0240  ; Layer 2 X position
    dw $0919, $0015  ; Layer 2 Y position
    dw $09C2, $0046  ; Health
    dw $09C4, $00C7  ; Max health
    dw $09C6, $000E  ; Missiles
    dw $0AF6, $03C5  ; Samus X
    dw $0AF8, $7FFF  ; Samus subpixel X
    dw $0AFA, $008B  ; Samus Y
    dw $D876, $0208  ; Items
    dw #$FFFF

preset_cchamber_norfair_puzzle_i:
    dw #preset_cchamber_norfair_springball ; Norfair: Springball
    dw $078D, $9762  ; DDB
    dw $079B, $B139  ; MDB
    dw $090F, $0000  ; Screen subpixel X position
    dw $0911, $0000  ; Screen X position in pixels
    dw $0913, $3C00  ; Screen subpixel Y position
    dw $0915, $0300  ; Screen Y position in pixels
    dw $0917, $0001  ; Layer 2 X position
    dw $0919, $0240  ; Layer 2 Y position
    dw $09A2, $7126  ; Equipped Items
    dw $09A4, $7126  ; Collected Items
    dw $0AF6, $00C7  ; Samus X
    dw $0AF8, $1FFF  ; Samus subpixel X
    dw $0AFA, $038B  ; Samus Y
    dw $D874, $001A  ; Items
    dw #$FFFF

preset_cchamber_norfair_minikraid:
    dw #preset_cchamber_norfair_puzzle_i ; Norfair: Puzzle I
    dw $078D, $96BA  ; DDB
    dw $079B, $AEB4  ; MDB
    dw $090F, $5002  ; Screen subpixel X position
    dw $0913, $E400  ; Screen subpixel Y position
    dw $0915, $0000  ; Screen Y position in pixels
    dw $0917, $0000  ; Layer 2 X position
    dw $0919, $0000  ; Layer 2 Y position
    dw $09C2, $008D  ; Health
    dw $09C6, $0019  ; Missiles
    dw $0A1C, $0002  ; Samus position/state
    dw $0A1E, $0004  ; More position/state
    dw $0AF6, $0029  ; Samus X
    dw $0AF8, $0000  ; Samus subpixel X
    dw $0AFA, $008B  ; Samus Y
    dw #$FFFF

preset_cchamber_tourian_puzzle_j:
    dw #preset_cchamber_norfair_minikraid ; Norfair: MiniKraid
    dw $078D, $96F6  ; DDB
    dw $079B, $DAAE  ; MDB
    dw $07F3, $0009  ; Music Bank
    dw $07F5, $0006  ; Music Track
    dw $090F, $C000  ; Screen subpixel X position
    dw $0913, $CC00  ; Screen subpixel Y position
    dw $0915, $0300  ; Screen Y position in pixels
    dw $0917, $0001  ; Layer 2 X position
    dw $0919, $0240  ; Layer 2 Y position
    dw $09C2, $0073  ; Health
    dw $0AF6, $0039  ; Samus X
    dw $0AF8, $1000  ; Samus subpixel X
    dw $0AFA, $038B  ; Samus Y
    dw $D90C, $0100  ; Map Stations
    dw #$FFFF

preset_cchamber_tourian_puzzle_k:
    dw #preset_cchamber_tourian_puzzle_j ; Tourian: Puzzle J
    dw $078D, $A9C0  ; DDB
    dw $079B, $DAE1  ; MDB
    dw $090F, $8000  ; Screen subpixel X position
    dw $0913, $6000  ; Screen subpixel Y position
    dw $0915, $0000  ; Screen Y position in pixels
    dw $0917, $0000  ; Layer 2 X position
    dw $0919, $0000  ; Layer 2 Y position
    dw $09C2, $00C7  ; Health
    dw $0AF6, $0053  ; Samus X
    dw $0AF8, $5000  ; Samus subpixel X
    dw $0AFA, $008B  ; Samus Y
    dw #$FFFF

preset_cchamber_tourian_puzzle_l:
    dw #preset_cchamber_tourian_puzzle_k ; Tourian: Puzzle K
    dw $078D, $A9B4  ; DDB
    dw $079B, $DB31  ; MDB
    dw $090F, $6000  ; Screen subpixel X position
    dw $0913, $0000  ; Screen subpixel Y position
    dw $0915, $0119  ; Screen Y position in pixels
    dw $0919, $00D2  ; Layer 2 Y position
    dw $09D2, $0004  ; Currently selected item
    dw $0A1C, $0001  ; Samus position/state
    dw $0A1E, $0008  ; More position/state
    dw $0AF6, $00C7  ; Samus X
    dw $0AF8, $4000  ; Samus subpixel X
    dw $0AFA, $018B  ; Samus Y
    dw #$FFFF

preset_cchamber_tourian_puzzle_m:
    dw #preset_cchamber_tourian_puzzle_l ; Tourian: Puzzle L
    dw $078D, $A9E4  ; DDB
    dw $079B, $DBCD  ; MDB
    dw $090F, $8000  ; Screen subpixel X position
    dw $0913, $AC00  ; Screen subpixel Y position
    dw $0915, $0100  ; Screen Y position in pixels
    dw $0919, $00C0  ; Layer 2 Y position
    dw $09D2, $0000  ; Currently selected item
    dw $0AF6, $00C2  ; Samus X
    dw $0AF8, $EFFF  ; Samus subpixel X
    dw #$FFFF

preset_cchamber_tourian_invisible_maze:
    dw #preset_cchamber_tourian_puzzle_m ; Tourian: Puzzle M
    dw $078D, $91F2  ; DDB
    dw $079B, $DDC4  ; MDB
    dw $07F3, $001E  ; Music Bank
    dw $090F, $0000  ; Screen subpixel X position
    dw $0911, $00E0  ; Screen X position in pixels
    dw $0913, $2FFF  ; Screen subpixel Y position
    dw $0915, $0000  ; Screen Y position in pixels
    dw $0917, $00A8  ; Layer 2 X position
    dw $0919, $0000  ; Layer 2 Y position
    dw $09CA, $0000  ; Supers
    dw $0AF6, $017A  ; Samus X
    dw $0AF8, $9FFF  ; Samus subpixel X
    dw $0AFA, $00AB  ; Samus Y
    dw #$FFFF

preset_cchamber_tourian_ridley:
    dw #preset_cchamber_tourian_invisible_maze ; Tourian: Invisible Maze
    dw $078D, $AA50  ; DDB
    dw $079B, $DE4D  ; MDB
    dw $07F3, $000F  ; Music Bank
    dw $07F5, $0005  ; Music Track
    dw $0911, $0022  ; Screen X position in pixels
    dw $0913, $A400  ; Screen subpixel Y position
    dw $0917, $0019  ; Layer 2 X position
    dw $09A6, $100B  ; Beams
    dw $09A8, $100A  ; Beams
    dw $0A1C, $0002  ; Samus position/state
    dw $0A1E, $0004  ; More position/state
    dw $0A76, $3C08  ; Hyper beam
    dw $0AF6, $00C2  ; Samus X
    dw $0AF8, $E000  ; Samus subpixel X
    dw $D820, $4001  ; Events
    dw #$FFFF

preset_cchamber_tourian_puzzle_n:
    dw #preset_cchamber_tourian_ridley ; Tourian: Ridley
    dw $078D, $AAEC  ; DDB
    dw $079B, $DE7A  ; MDB
    dw $090F, $4000  ; Screen subpixel X position
    dw $0911, $0000  ; Screen X position in pixels
    dw $0913, $7800  ; Screen subpixel Y position
    dw $0915, $0100  ; Screen Y position in pixels
    dw $0917, $0000  ; Layer 2 X position
    dw $0919, $00C0  ; Layer 2 Y position
    dw $09CA, $0001  ; Supers
    dw $0A1C, $0001  ; Samus position/state
    dw $0A1E, $0008  ; More position/state
    dw $0AF6, $00AF  ; Samus X
    dw $0AF8, $8000  ; Samus subpixel X
    dw $0AFA, $0193  ; Samus Y
    dw $D82C, $0102  ; Bosses
    dw #$FFFF

preset_cchamber_tourian_puzzle_o:
    dw #preset_cchamber_tourian_puzzle_n ; Tourian: Puzzle N
    dw $078D, $AB04  ; DDB
    dw $079B, $DEA7  ; MDB
    dw $0911, $0500  ; Screen X position in pixels
    dw $0913, $0000  ; Screen subpixel Y position
    dw $0915, $001B  ; Screen Y position in pixels
    dw $0917, $03C0  ; Layer 2 X position
    dw $0919, $0014  ; Layer 2 Y position
    dw $0AF6, $05C5  ; Samus X
    dw $0AF8, $7BFF  ; Samus subpixel X
    dw $0AFA, $008B  ; Samus Y
    dw $D8C4, $0400  ; Doors
    dw #$FFFF

preset_cchamber_tourian_climb_spark:
    dw #preset_cchamber_tourian_puzzle_o ; Tourian: Puzzle O
    dw $078D, $AB1C  ; DDB
    dw $079B, $DEDE  ; MDB
    dw $090F, $0000  ; Screen subpixel X position
    dw $0911, $010C  ; Screen X position in pixels
    dw $0913, $CC00  ; Screen subpixel Y position
    dw $0915, $0119  ; Screen Y position in pixels
    dw $0917, $00C9  ; Layer 2 X position
    dw $0919, $00D2  ; Layer 2 Y position
    dw $0AF6, $0172  ; Samus X
    dw $0AF8, $4FFF  ; Samus subpixel X
    dw $0AFA, $018B  ; Samus Y
    dw #$FFFF
