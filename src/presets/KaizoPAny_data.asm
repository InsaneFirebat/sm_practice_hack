
preset_KaizoPAny_bombs_landing:
    dw #$0000
    dw $078D, $88FE  ; DDB
    dw $079B, $91F8  ; MDB
    dw $07F3, $0036  ; Music Bank
    dw $07F5, $0005  ; Music Track
    dw $090F, $8000  ; Screen subpixel X position
    dw $0911, $0400  ; Screen X position in pixels
    dw $0913, $0000  ; Screen subpixel Y position
    dw $0915, $03D0  ; Screen Y position in pixels
    dw $0917, $0200  ; Layer 2 X position
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
    dw $0AF6, $0481  ; Samus X
    dw $0AF8, $0000  ; Samus subpixel X
    dw $0AFA, $0440  ; Samus Y
    dw $0AFC, $0000  ; Samus subpixel Y
    dw $0B3F, $0000  ; Blue suit
    dw $D820, $0000  ; Events
    dw $D822, $0000  ; Events
    dw $D828, $0000  ; Bosses
    dw $D82A, $0000  ; Bosses
    dw $D82C, $0000  ; Bosses
    dw $D82E, $0001  ; Bosses
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
    dw $D908, $FFFF  ; Map Stations
    dw $D90A, $FFFF  ; Map Stations
    dw $D90C, $00FF  ; Map Stations
    dw #$FFFF

preset_KaizoPAny_bombs_gauntlet:
    dw #preset_KaizoPAny_bombs_landing ; Bombs: Landing
    dw $078D, $8B3E  ; DDB
    dw $079B, $92FD  ; MDB
    dw $090F, $3C00  ; Screen subpixel X position
    dw $0915, $001B  ; Screen Y position in pixels
    dw $0917, $0300  ; Layer 2 X position
    dw $0919, $0014  ; Layer 2 Y position
    dw $09A2, $0004  ; Equipped Items
    dw $09A4, $0004  ; Collected Items
    dw $09C2, $0027  ; Health
    dw $0A1C, $0001  ; Samus position/state
    dw $0A1E, $0008  ; More position/state
    dw $0AF6, $04CE  ; Samus X
    dw $0AF8, $D3FF  ; Samus subpixel X
    dw $0AFA, $008B  ; Samus Y
    dw $0AFC, $FFFF  ; Samus subpixel Y
    dw $D872, $0400  ; Items
    dw #$FFFF

preset_KaizoPAny_bombs_green_brin:
    dw #preset_KaizoPAny_bombs_gauntlet ; Bombs: Gauntlet
    dw $078D, $8C22  ; DDB
    dw $079B, $9938  ; MDB
    dw $090F, $8FFF  ; Screen subpixel X position
    dw $0911, $0000  ; Screen X position in pixels
    dw $0913, $D800  ; Screen subpixel Y position
    dw $0915, $0000  ; Screen Y position in pixels
    dw $0917, $0000  ; Layer 2 X position
    dw $0919, $0000  ; Layer 2 Y position
    dw $09C2, $0063  ; Health
    dw $0A1C, $0002  ; Samus position/state
    dw $0A1E, $0004  ; More position/state
    dw $0AF6, $00DB  ; Samus X
    dw $0AF8, $FFFF  ; Samus subpixel X
    dw $0AFA, $009B  ; Samus Y
    dw #$FFFF

preset_KaizoPAny_bombs_grapple:
    dw #preset_KaizoPAny_bombs_green_brin ; Bombs: Green Brin
    dw $078D, $9006  ; DDB
    dw $079B, $9AD9  ; MDB
    dw $07F3, $000F  ; Music Bank
    dw $090F, $B000  ; Screen subpixel X position
    dw $0913, $0C00  ; Screen subpixel Y position
    dw $0915, $0500  ; Screen Y position in pixels
    dw $0919, $03C0  ; Layer 2 Y position
    dw $0A1C, $0001  ; Samus position/state
    dw $0A1E, $0008  ; More position/state
    dw $0AF6, $0031  ; Samus X
    dw $0AF8, $A000  ; Samus subpixel X
    dw $0AFA, $058B  ; Samus Y
    dw #$FFFF

preset_KaizoPAny_bombs_norfair_entry:
    dw #preset_KaizoPAny_bombs_grapple ; Bombs: Grapple
    dw $078D, $8D5A  ; DDB
    dw $079B, $9D19  ; MDB
    dw $07F3, $0018  ; Music Bank
    dw $090F, $3000  ; Screen subpixel X position
    dw $0911, $0400  ; Screen X position in pixels
    dw $0913, $0000  ; Screen subpixel Y position
    dw $0915, $051B  ; Screen Y position in pixels
    dw $0917, $0300  ; Layer 2 X position
    dw $0919, $03D4  ; Layer 2 Y position
    dw $09A2, $4004  ; Equipped Items
    dw $09A4, $4004  ; Collected Items
    dw $09C2, $0027  ; Health
    dw $09D2, $0004  ; Currently selected item
    dw $0AF6, $04D4  ; Samus X
    dw $0AF8, $EFFF  ; Samus subpixel X
    dw $D872, $0480  ; Items
    dw #$FFFF

preset_KaizoPAny_bombs_bombs_hell:
    dw #preset_KaizoPAny_bombs_norfair_entry ; Bombs: Norfair Entry
    dw $078D, $9816  ; DDB
    dw $079B, $A7DE  ; MDB
    dw $090F, $AB80  ; Screen subpixel X position
    dw $0911, $0000  ; Screen X position in pixels
    dw $0915, $0600  ; Screen Y position in pixels
    dw $0917, $0000  ; Layer 2 X position
    dw $0919, $0480  ; Layer 2 Y position
    dw $09C2, $0063  ; Health
    dw $0AF6, $00CE  ; Samus X
    dw $0AF8, $CF80  ; Samus subpixel X
    dw $0AFA, $068B  ; Samus Y
    dw $D820, $0001  ; Events
    dw $D8B4, $8000  ; Doors
    dw #$FFFF

preset_KaizoPAny_bombs_norfair_exit:
    dw #preset_KaizoPAny_bombs_bombs_hell ; Bombs: Bombs Hell
    dw $078D, $953A  ; DDB
    dw $079B, $ACB3  ; MDB
    dw $090F, $D000  ; Screen subpixel X position
    dw $0915, $010D  ; Screen Y position in pixels
    dw $0919, $00C9  ; Layer 2 Y position
    dw $09A2, $5004  ; Equipped Items
    dw $09A4, $5004  ; Collected Items
    dw $0A1C, $0002  ; Samus position/state
    dw $0A1E, $0004  ; More position/state
    dw $0AF6, $0028  ; Samus X
    dw $0AF8, $0000  ; Samus subpixel X
    dw $0AFA, $019B  ; Samus Y
    dw $D876, $2000  ; Items
    dw #$FFFF

preset_KaizoPAny_spring_green_brin_return:
    dw #preset_KaizoPAny_bombs_norfair_exit ; Bombs: Norfair Exit
    dw $078D, $8D12  ; DDB
    dw $079B, $A201  ; MDB
    dw $07F3, $000F  ; Music Bank
    dw $090F, $5000  ; Screen subpixel X position
    dw $0913, $B000  ; Screen subpixel Y position
    dw $0915, $0000  ; Screen Y position in pixels
    dw $0919, $0000  ; Layer 2 Y position
    dw $09D2, $0000  ; Currently selected item
    dw $0A1C, $0001  ; Samus position/state
    dw $0A1E, $0008  ; More position/state
    dw $0AF6, $00D4  ; Samus X
    dw $0AFA, $008B  ; Samus Y
    dw $D8B8, $0800  ; Doors
    dw #$FFFF

preset_KaizoPAny_spring_crateria_spike_hall:
    dw #preset_KaizoPAny_spring_green_brin_return ; Spring: Green Brin Return
    dw $078D, $8C16  ; DDB
    dw $079B, $99BD  ; MDB
    dw $07F3, $0036  ; Music Bank
    dw $090F, $8000  ; Screen subpixel X position
    dw $0913, $C400  ; Screen subpixel Y position
    dw $0915, $02F7  ; Screen Y position in pixels
    dw $0917, $0001  ; Layer 2 X position
    dw $0919, $0239  ; Layer 2 Y position
    dw $09C2, $004F  ; Health
    dw $0AF6, $0062  ; Samus X
    dw $0AF8, $A000  ; Samus subpixel X
    dw $0AFA, $038B  ; Samus Y
    dw #$FFFF

preset_KaizoPAny_spring_red_tower:
    dw #preset_KaizoPAny_spring_crateria_spike_hall ; Spring: Crateria Spike hall
    dw $078D, $896A  ; DDB
    dw $079B, $91F8  ; MDB
    dw $090F, $0000  ; Screen subpixel X position
    dw $0911, $0800  ; Screen X position in pixels
    dw $0913, $0000  ; Screen subpixel Y position
    dw $0915, $041B  ; Screen Y position in pixels
    dw $0917, $0400  ; Layer 2 X position
    dw $0919, $0000  ; Layer 2 Y position
    dw $09C2, $0063  ; Health
    dw $0A1C, $0005  ; Samus position/state
    dw $0AF6, $08C3  ; Samus X
    dw $0AF8, $3BFF  ; Samus subpixel X
    dw $0AFA, $048B  ; Samus Y
    dw #$FFFF

preset_KaizoPAny_spring_red_tower_escape:
    dw #preset_KaizoPAny_spring_red_tower ; Spring: Red Tower
    dw $078D, $904E  ; DDB
    dw $079B, $A618  ; MDB
    dw $07F3, $0012  ; Music Bank
    dw $090F, $2000  ; Screen subpixel X position
    dw $0911, $0000  ; Screen X position in pixels
    dw $0915, $0000  ; Screen Y position in pixels
    dw $0917, $0000  ; Layer 2 X position
    dw $09A2, $7004  ; Equipped Items
    dw $09A4, $7004  ; Collected Items
    dw $0A1C, $0001  ; Samus position/state
    dw $0AF6, $0055  ; Samus X
    dw $0AF8, $0000  ; Samus subpixel X
    dw $0AFA, $008B  ; Samus Y
    dw $D876, $2400  ; Items
    dw #$FFFF

preset_KaizoPAny_spring_crat_kihunter_escape:
    dw #preset_KaizoPAny_spring_red_tower_escape ; Spring: Red Tower Escape
    dw $078D, $90BA  ; DDB
    dw $079B, $962A  ; MDB
    dw $07F5, $0003  ; Music Track
    dw $090F, $F000  ; Screen subpixel X position
    dw $0913, $C000  ; Screen subpixel Y position
    dw $09C2, $0022  ; Health
    dw $09D2, $0004  ; Currently selected item
    dw $0A1C, $0002  ; Samus position/state
    dw $0A1E, $0004  ; More position/state
    dw $0AF6, $007A  ; Samus X
    dw $0AF8, $EFFF  ; Samus subpixel X
    dw $0AFA, $00AB  ; Samus Y
    dw #$FFFF

preset_KaizoPAny_spring_screw:
    dw #preset_KaizoPAny_spring_crat_kihunter_escape ; Spring: Crat Kihunter Escape
    dw $078D, $8D5A  ; DDB
    dw $079B, $9D19  ; MDB
    dw $07F3, $0018  ; Music Bank
    dw $07F5, $0005  ; Music Track
    dw $090F, $D000  ; Screen subpixel X position
    dw $0911, $0400  ; Screen X position in pixels
    dw $0915, $051B  ; Screen Y position in pixels
    dw $0917, $0300  ; Layer 2 X position
    dw $0919, $03D4  ; Layer 2 Y position
    dw $09C2, $0063  ; Health
    dw $0A1C, $0001  ; Samus position/state
    dw $0A1E, $0008  ; More position/state
    dw $0AF6, $04DD  ; Samus X
    dw $0AF8, $BFFF  ; Samus subpixel X
    dw $0AFA, $058B  ; Samus Y
    dw #$FFFF

preset_KaizoPAny_spring_high_jump:
    dw #preset_KaizoPAny_spring_screw ; Spring: Screw
    dw $078D, $9246  ; DDB
    dw $079B, $A7DE  ; MDB
    dw $090F, $3FFF  ; Screen subpixel X position
    dw $0911, $0000  ; Screen X position in pixels
    dw $0913, $4400  ; Screen subpixel Y position
    dw $0915, $030A  ; Screen Y position in pixels
    dw $0917, $0000  ; Layer 2 X position
    dw $0919, $0247  ; Layer 2 Y position
    dw $09A2, $700C  ; Equipped Items
    dw $09A4, $700C  ; Collected Items
    dw $09D2, $0000  ; Currently selected item
    dw $0AF6, $00E1  ; Samus X
    dw $0AFA, $038B  ; Samus Y
    dw $D8B8, $0808  ; Doors
    dw #$FFFF

preset_KaizoPAny_spring_crateria_spike_hall_2:
    dw #preset_KaizoPAny_spring_high_jump ; Spring: High Jump
    dw $078D, $8C16  ; DDB
    dw $079B, $99BD  ; MDB
    dw $07F3, $0036  ; Music Bank
    dw $090F, $D000  ; Screen subpixel X position
    dw $0913, $0C00  ; Screen subpixel Y position
    dw $0915, $0410  ; Screen Y position in pixels
    dw $0917, $0001  ; Layer 2 X position
    dw $0919, $030C  ; Layer 2 Y position
    dw $09A2, $710C  ; Equipped Items
    dw $09A4, $710C  ; Collected Items
    dw $0AF6, $003F  ; Samus X
    dw $0AF8, $A000  ; Samus subpixel X
    dw $0AFA, $048B  ; Samus Y
    dw $D876, $2402  ; Items
    dw #$FFFF

preset_KaizoPAny_spring_charge:
    dw #preset_KaizoPAny_spring_crateria_spike_hall_2 ; Spring: Crateria spike hall 2
    dw $078D, $896A  ; DDB
    dw $079B, $91F8  ; MDB
    dw $090F, $3000  ; Screen subpixel X position
    dw $0911, $07FE  ; Screen X position in pixels
    dw $0913, $0000  ; Screen subpixel Y position
    dw $0915, $00FB  ; Screen Y position in pixels
    dw $0917, $03FF  ; Layer 2 X position
    dw $0919, $0000  ; Layer 2 Y position
    dw $0AF6, $085E  ; Samus X
    dw $0AF8, $0FFF  ; Samus subpixel X
    dw $0AFA, $016B  ; Samus Y
    dw #$FFFF

preset_KaizoPAny_spring_maridia_entry:
    dw #preset_KaizoPAny_spring_charge ; Spring: Charge
    dw $078D, $8A7E  ; DDB
    dw $079B, $94FD  ; MDB
    dw $07F3, $001B  ; Music Bank
    dw $07F5, $0006  ; Music Track
    dw $090F, $F000  ; Screen subpixel X position
    dw $0911, $0600  ; Screen X position in pixels
    dw $0915, $0409  ; Screen Y position in pixels
    dw $0917, $0300  ; Layer 2 X position
    dw $09A6, $1000  ; Beams
    dw $09A8, $1000  ; Beams
    dw $0AF6, $06CB  ; Samus X
    dw $0AF8, $F400  ; Samus subpixel X
    dw $0AFA, $0490  ; Samus Y
    dw $D870, $0400  ; Items
    dw #$FFFF

preset_KaizoPAny_spring_spring_2:
    dw #preset_KaizoPAny_spring_maridia_entry ; Spring: Maridia Entry
    dw $078D, $A6B4  ; DDB
    dw $079B, $D9FE  ; MDB
    dw $07F5, $0005  ; Music Track
    dw $090F, $E800  ; Screen subpixel X position
    dw $0911, $0000  ; Screen X position in pixels
    dw $0913, $8400  ; Screen subpixel Y position
    dw $0915, $0100  ; Screen Y position in pixels
    dw $0917, $0000  ; Layer 2 X position
    dw $0919, $00C0  ; Layer 2 Y position
    dw $09A6, $1002  ; Beams
    dw $09A8, $1002  ; Beams
    dw $09D2, $0004  ; Currently selected item
    dw $0A1C, $0002  ; Samus position/state
    dw $0A1E, $0004  ; More position/state
    dw $0AF6, $0028  ; Samus X
    dw $0AF8, $43FF  ; Samus subpixel X
    dw $0AFA, $0194  ; Samus Y
    dw $0AFC, $77FF  ; Samus subpixel Y
    dw $D882, $0400  ; Items
    dw $D8C2, $0008  ; Doors
    dw #$FFFF

preset_KaizoPAny_wrecked_ship_varia_backtrack:
    dw #preset_KaizoPAny_spring_spring_2 ; Spring: Spring
    dw $078D, $8A2A  ; DDB
    dw $079B, $91F8  ; MDB
    dw $07F3, $0036  ; Music Bank
    dw $090F, $B000  ; Screen subpixel X position
    dw $0913, $7C00  ; Screen subpixel Y position
    dw $0915, $021A  ; Screen Y position in pixels
    dw $0919, $0000  ; Layer 2 Y position
    dw $09A2, $710E  ; Equipped Items
    dw $09A4, $710E  ; Collected Items
    dw $09C2, $0022  ; Health
    dw $09D2, $0000  ; Currently selected item
    dw $0A1C, $0008  ; Samus position/state
    dw $0AF6, $0038  ; Samus X
    dw $0AF8, $9800  ; Samus subpixel X
    dw $0AFA, $028B  ; Samus Y
    dw $0AFC, $FFFF  ; Samus subpixel Y
    dw $D870, $0404  ; Items
    dw #$FFFF

preset_KaizoPAny_wrecked_ship_varia_hell:
    dw #preset_KaizoPAny_wrecked_ship_varia_backtrack ; Wrecked Ship: Varia Backtrack
    dw $078D, $9246  ; DDB
    dw $079B, $A7DE  ; MDB
    dw $07F3, $0018  ; Music Bank
    dw $090F, $0000  ; Screen subpixel X position
    dw $0913, $0000  ; Screen subpixel Y position
    dw $0915, $036B  ; Screen Y position in pixels
    dw $0919, $0290  ; Layer 2 Y position
    dw $09C2, $0063  ; Health
    dw $0A1C, $0001  ; Samus position/state
    dw $0A1E, $0008  ; More position/state
    dw $0AF6, $00DB  ; Samus X
    dw $0AF8, $FFFF  ; Samus subpixel X
    dw $0AFA, $03DE  ; Samus Y
    dw $0AFC, $3000  ; Samus subpixel Y
    dw #$FFFF

preset_KaizoPAny_wrecked_ship_plasma_spring:
    dw #preset_KaizoPAny_wrecked_ship_varia_hell ; Wrecked Ship: Varia Hell
    dw $078D, $929A  ; DDB
    dw $079B, $AFA3  ; MDB
    dw $090F, $2401  ; Screen subpixel X position
    dw $0915, $0000  ; Screen Y position in pixels
    dw $0919, $0000  ; Layer 2 Y position
    dw $0AF6, $0027  ; Samus X
    dw $0AF8, $4000  ; Samus subpixel X
    dw $0AFA, $008B  ; Samus Y
    dw $0AFC, $FFFF  ; Samus subpixel Y
    dw $D8B6, $0004  ; Doors
    dw #$FFFF

preset_KaizoPAny_wrecked_ship_varia_get:
    dw #preset_KaizoPAny_wrecked_ship_plasma_spring ; Wrecked Ship: Plasma Spring
    dw $078D, $9672  ; DDB
    dw $079B, $ADDE  ; MDB
    dw $07F5, $0003  ; Music Track
    dw $090F, $4000  ; Screen subpixel X position
    dw $09A6, $100A  ; Beams
    dw $09A8, $100A  ; Beams
    dw $09C2, $003C  ; Health
    dw $0A1C, $0008  ; Samus position/state
    dw $0A1E, $0004  ; More position/state
    dw $0AF6, $0036  ; Samus X
    dw $0AF8, $7FFF  ; Samus subpixel X
    dw $D878, $0010  ; Items
    dw #$FFFF

preset_KaizoPAny_wrecked_ship_crateria_spike_hall_3:
    dw #preset_KaizoPAny_wrecked_ship_varia_get ; Wrecked Ship: Varia Get
    dw $078D, $8C16  ; DDB
    dw $079B, $99BD  ; MDB
    dw $07F3, $0036  ; Music Bank
    dw $07F5, $0005  ; Music Track
    dw $090F, $1000  ; Screen subpixel X position
    dw $0913, $6000  ; Screen subpixel Y position
    dw $0915, $041C  ; Screen Y position in pixels
    dw $0917, $0001  ; Layer 2 X position
    dw $0919, $0315  ; Layer 2 Y position
    dw $09A2, $710F  ; Equipped Items
    dw $09A4, $710F  ; Collected Items
    dw $09C2, $0063  ; Health
    dw $0A1C, $0001  ; Samus position/state
    dw $0A1E, $0008  ; More position/state
    dw $0AF6, $003E  ; Samus X
    dw $0AF8, $8000  ; Samus subpixel X
    dw $0AFA, $048B  ; Samus Y
    dw $D878, $0012  ; Items
    dw #$FFFF

preset_KaizoPAny_wrecked_ship_maridia_return:
    dw #preset_KaizoPAny_wrecked_ship_crateria_spike_hall_3 ; Wrecked Ship: Crateria Spike hall 3
    dw $078D, $896A  ; DDB
    dw $079B, $91F8  ; MDB
    dw $090F, $F000  ; Screen subpixel X position
    dw $0911, $0800  ; Screen X position in pixels
    dw $0913, $0000  ; Screen subpixel Y position
    dw $0915, $041B  ; Screen Y position in pixels
    dw $0917, $0400  ; Layer 2 X position
    dw $0919, $0000  ; Layer 2 Y position
    dw $0A1C, $0007  ; Samus position/state
    dw $0AF6, $08D9  ; Samus X
    dw $0AF8, $8FFF  ; Samus subpixel X
    dw #$FFFF

preset_KaizoPAny_wrecked_ship_reverse_evirs:
    dw #preset_KaizoPAny_wrecked_ship_maridia_return ; Wrecked Ship: Maridia Return
    dw $078D, $8AD2  ; DDB
    dw $079B, $D646  ; MDB
    dw $07F3, $001B  ; Music Bank
    dw $090F, $D402  ; Screen subpixel X position
    dw $0911, $0000  ; Screen X position in pixels
    dw $0913, $5400  ; Screen subpixel Y position
    dw $0915, $02ED  ; Screen Y position in pixels
    dw $0917, $0000  ; Layer 2 X position
    dw $0919, $0231  ; Layer 2 Y position
    dw $0A1C, $0001  ; Samus position/state
    dw $0AF6, $00D6  ; Samus X
    dw $0AF8, $BFFF  ; Samus subpixel X
    dw $0AFA, $038B  ; Samus Y
    dw #$FFFF

preset_KaizoPAny_wrecked_ship_ws_entry:
    dw #preset_KaizoPAny_wrecked_ship_reverse_evirs ; Wrecked Ship: Reverse Evirs
    dw $078D, $A960  ; DDB
    dw $079B, $CE40  ; MDB
    dw $07F3, $0030  ; Music Bank
    dw $07F5, $0003  ; Music Track
    dw $090F, $4C00  ; Screen subpixel X position
    dw $0913, $7C00  ; Screen subpixel Y position
    dw $0915, $0000  ; Screen Y position in pixels
    dw $0917, $0001  ; Layer 2 X position
    dw $0919, $0000  ; Layer 2 Y position
    dw $09C2, $005C  ; Health
    dw $0AF6, $002B  ; Samus X
    dw $0AF8, $03FF  ; Samus subpixel X
    dw $0AFA, $008B  ; Samus Y
    dw #$FFFF

preset_KaizoPAny_wrecked_ship_phantoon:
    dw #preset_KaizoPAny_wrecked_ship_ws_entry ; Wrecked Ship: WS Entry
    dw $078D, $A21C  ; DDB
    dw $079B, $CC6F  ; MDB
    dw $07F5, $0005  ; Music Track
    dw $090F, $7000  ; Screen subpixel X position
    dw $0911, $0400  ; Screen X position in pixels
    dw $0913, $0000  ; Screen subpixel Y position
    dw $0915, $001D  ; Screen Y position in pixels
    dw $0917, $0300  ; Layer 2 X position
    dw $0919, $0015  ; Layer 2 Y position
    dw $09C2, $0063  ; Health
    dw $0AF6, $046A  ; Samus X
    dw $0AF8, $0000  ; Samus subpixel X
    dw $D8C0, $0010  ; Doors
    dw #$FFFF

preset_KaizoPAny_wrecked_ship_wave:
    dw #preset_KaizoPAny_wrecked_ship_phantoon ; Wrecked Ship: Phantoon
    dw $078D, $A240  ; DDB
    dw $079B, $CE8A  ; MDB
    dw $07F5, $0006  ; Music Track
    dw $090F, $4000  ; Screen subpixel X position
    dw $0911, $0000  ; Screen X position in pixels
    dw $0913, $6400  ; Screen subpixel Y position
    dw $0915, $0000  ; Screen Y position in pixels
    dw $0917, $0000  ; Layer 2 X position
    dw $0919, $0000  ; Layer 2 Y position
    dw $09A2, $F10F  ; Equipped Items
    dw $09A4, $F10F  ; Collected Items
    dw $0A1C, $0002  ; Samus position/state
    dw $0A1E, $0004  ; More position/state
    dw $0AF6, $002B  ; Samus X
    dw $0AF8, $BBFF  ; Samus subpixel X
    dw $D82A, $0100  ; Bosses
    dw $D880, $0020  ; Items
    dw $D8C0, $005C  ; Doors
    dw #$FFFF

preset_KaizoPAny_wrecked_ship_spiky_death_room:
    dw #preset_KaizoPAny_wrecked_ship_wave ; Wrecked Ship: Wave
    dw $078D, $A1C8  ; DDB
    dw $079B, $CAF6  ; MDB
    dw $090F, $8000  ; Screen subpixel X position
    dw $0911, $0400  ; Screen X position in pixels
    dw $0913, $0000  ; Screen subpixel Y position
    dw $0915, $041D  ; Screen Y position in pixels
    dw $0917, $0300  ; Layer 2 X position
    dw $0919, $0315  ; Layer 2 Y position
    dw $09A6, $100B  ; Beams
    dw $09A8, $100B  ; Beams
    dw $09C2, $0013  ; Health
    dw $0A1C, $00A4  ; Samus position/state
    dw $0A1E, $0008  ; More position/state
    dw $0AF6, $04DB  ; Samus X
    dw $0AF8, $FFFF  ; Samus subpixel X
    dw $0AFA, $048B  ; Samus Y
    dw $D880, $0028  ; Items
    dw $D8C0, $065C  ; Doors
    dw #$FFFF

preset_KaizoPAny_draygon_lava_dive:
    dw #preset_KaizoPAny_wrecked_ship_spiky_death_room ; Wrecked Ship: Spiky Death Room
    dw $078D, $938A  ; DDB
    dw $079B, $CA08  ; MDB
    dw $090F, $0600  ; Screen subpixel X position
    dw $0911, $0300  ; Screen X position in pixels
    dw $0913, $C000  ; Screen subpixel Y position
    dw $0915, $0000  ; Screen Y position in pixels
    dw $0917, $0240  ; Layer 2 X position
    dw $0919, $0000  ; Layer 2 Y position
    dw $09A6, $1009  ; Beams
    dw $09C2, $0063  ; Health
    dw $0A1C, $0001  ; Samus position/state
    dw $0AF6, $03D7  ; Samus X
    dw $0AF8, $1FFF  ; Samus subpixel X
    dw $0AFA, $008B  ; Samus Y
    dw #$FFFF

preset_KaizoPAny_draygon_temp_blue_supers:
    dw #preset_KaizoPAny_draygon_lava_dive ; Draygon: Lava Dive
    dw $078D, $A1BC  ; DDB
    dw $079B, $A8F8  ; MDB
    dw $07F3, $0024  ; Music Bank
    dw $07F5, $0000  ; Music Track
    dw $090F, $7600  ; Screen subpixel X position
    dw $0911, $0000  ; Screen X position in pixels
    dw $0917, $0000  ; Layer 2 X position
    dw $0A1C, $0009  ; Samus position/state
    dw $0A1E, $0108  ; More position/state
    dw $0AF6, $0027  ; Samus X
    dw $0AF8, $BFFF  ; Samus subpixel X
    dw #$FFFF

preset_KaizoPAny_draygon_ln_escape:
    dw #preset_KaizoPAny_draygon_temp_blue_supers ; Draygon: Temp Blue Supers
    dw $078D, $96F6  ; DDB
    dw $079B, $B236  ; MDB
    dw $07F3, $0018  ; Music Bank
    dw $07F5, $0005  ; Music Track
    dw $090F, $D000  ; Screen subpixel X position
    dw $0913, $2400  ; Screen subpixel Y position
    dw $0915, $0200  ; Screen Y position in pixels
    dw $0919, $0301  ; Layer 2 Y position
    dw $09C2, $004D  ; Health
    dw $09C6, $0005  ; Missiles
    dw $09C8, $0005  ; Max missiles
    dw $09CA, $000A  ; Supers
    dw $09CC, $000A  ; Max supers
    dw $0A1C, $008A  ; Samus position/state
    dw $0A1E, $1504  ; More position/state
    dw $0AF6, $0025  ; Samus X
    dw $0AF8, $0000  ; Samus subpixel X
    dw $0AFA, $028B  ; Samus Y
    dw $D870, $0434  ; Items
    dw $D876, $2C02  ; Items
    dw $D8BA, $0004  ; Doors
    dw #$FFFF

preset_KaizoPAny_draygon_crateria_spike_hall_4:
    dw #preset_KaizoPAny_draygon_ln_escape ; Draygon: LN Escape
    dw $078D, $8C16  ; DDB
    dw $079B, $99BD  ; MDB
    dw $07F3, $0036  ; Music Bank
    dw $090F, $8000  ; Screen subpixel X position
    dw $0913, $A400  ; Screen subpixel Y position
    dw $0915, $0410  ; Screen Y position in pixels
    dw $0917, $0001  ; Layer 2 X position
    dw $0919, $030C  ; Layer 2 Y position
    dw $09A6, $100B  ; Beams
    dw $09C2, $0063  ; Health
    dw $0A1C, $0001  ; Samus position/state
    dw $0A1E, $0008  ; More position/state
    dw $0AF6, $0046  ; Samus X
    dw $0AF8, $B000  ; Samus subpixel X
    dw $0AFA, $048B  ; Samus Y
    dw $D8BA, $2004  ; Doors
    dw #$FFFF

preset_KaizoPAny_draygon_main_street:
    dw #preset_KaizoPAny_draygon_crateria_spike_hall_4 ; Draygon: Crateria Spike Hall 4
    dw $078D, $A3B4  ; DDB
    dw $079B, $D017  ; MDB
    dw $07F3, $001B  ; Music Bank
    dw $07F5, $0006  ; Music Track
    dw $090F, $C000  ; Screen subpixel X position
    dw $0913, $3000  ; Screen subpixel Y position
    dw $0915, $021B  ; Screen Y position in pixels
    dw $0917, $0000  ; Layer 2 X position
    dw $0919, $0194  ; Layer 2 Y position
    dw $0A1C, $0002  ; Samus position/state
    dw $0A1E, $0004  ; More position/state
    dw $0AF6, $0068  ; Samus X
    dw $0AF8, $6D20  ; Samus subpixel X
    dw $0AFA, $028B  ; Samus Y
    dw #$FFFF

preset_KaizoPAny_draygon_crab_shaft:
    dw #preset_KaizoPAny_draygon_main_street ; Draygon: Main Street
    dw $078D, $A3C0  ; DDB
    dw $079B, $D0B9  ; MDB
    dw $090F, $557F  ; Screen subpixel X position
    dw $0911, $0400  ; Screen X position in pixels
    dw $0913, $A000  ; Screen subpixel Y position
    dw $0915, $0000  ; Screen Y position in pixels
    dw $0917, $0300  ; Layer 2 X position
    dw $0919, $0000  ; Layer 2 Y position
    dw $0A1C, $000B  ; Samus position/state
    dw $0A1E, $0108  ; More position/state
    dw $0AF6, $04DF  ; Samus X
    dw $0AF8, $6FFF  ; Samus subpixel X
    dw $0AFA, $008B  ; Samus Y
    dw #$FFFF

preset_KaizoPAny_draygon_draygon_2:
    dw #preset_KaizoPAny_draygon_crab_shaft ; Draygon: Crab Shaft
    dw $078D, $A738  ; DDB
    dw $079B, $D78F  ; MDB
    dw $07F5, $0005  ; Music Track
    dw $090F, $0400  ; Screen subpixel X position
    dw $0911, $0000  ; Screen X position in pixels
    dw $0913, $3000  ; Screen subpixel Y position
    dw $0915, $021F  ; Screen Y position in pixels
    dw $0917, $0000  ; Layer 2 X position
    dw $0919, $0197  ; Layer 2 Y position
    dw $09C6, $000A  ; Missiles
    dw $09C8, $000A  ; Max missiles
    dw $09CA, $0009  ; Supers
    dw $0A1C, $0002  ; Samus position/state
    dw $0A1E, $0004  ; More position/state
    dw $0AF6, $003D  ; Samus X
    dw $0AF8, $5FFF  ; Samus subpixel X
    dw $0AFA, $02BB  ; Samus Y
    dw $D882, $0420  ; Items
    dw $D8C0, $865C  ; Doors
    dw $D8C2, $0808  ; Doors
    dw #$FFFF

preset_KaizoPAny_draygon_draygon_escape:
    dw #preset_KaizoPAny_draygon_draygon_2 ; Draygon: Draygon
    dw $078D, $A924  ; DDB
    dw $079B, $DA60  ; MDB
    dw $07F3, $0024  ; Music Bank
    dw $07F5, $0003  ; Music Track
    dw $090F, $3CA0  ; Screen subpixel X position
    dw $0911, $0100  ; Screen X position in pixels
    dw $0913, $0000  ; Screen subpixel Y position
    dw $0915, $001D  ; Screen Y position in pixels
    dw $0917, $0001  ; Layer 2 X position
    dw $0919, $0000  ; Layer 2 Y position
    dw $09A2, $F30F  ; Equipped Items
    dw $09A4, $F30F  ; Collected Items
    dw $09CA, $000A  ; Supers
    dw $0A1C, $0005  ; Samus position/state
    dw $0A1E, $0008  ; More position/state
    dw $0AF6, $01B1  ; Samus X
    dw $0AF8, $A3FF  ; Samus subpixel X
    dw $0AFA, $008B  ; Samus Y
    dw $D82C, $0001  ; Bosses
    dw $D882, $0C20  ; Items
    dw $D8C2, $C808  ; Doors
    dw #$FFFF

preset_KaizoPAny_draygon_crab_shaft_escape:
    dw #preset_KaizoPAny_draygon_draygon_escape ; Draygon: Draygon Escape
    dw $078D, $A834  ; DDB
    dw $079B, $D5A7  ; MDB
    dw $07F3, $001B  ; Music Bank
    dw $07F5, $0005  ; Music Track
    dw $090F, $5800  ; Screen subpixel X position
    dw $0911, $0000  ; Screen X position in pixels
    dw $0913, $5C00  ; Screen subpixel Y position
    dw $0915, $01F8  ; Screen Y position in pixels
    dw $0917, $0000  ; Layer 2 X position
    dw $0919, $01F8  ; Layer 2 Y position
    dw $09C6, $0009  ; Missiles
    dw $0A1C, $0002  ; Samus position/state
    dw $0A1E, $0004  ; More position/state
    dw $0AF6, $0047  ; Samus X
    dw $0AF8, $1800  ; Samus subpixel X
    dw $0AFA, $028B  ; Samus Y
    dw $D8C2, $C848  ; Doors
    dw #$FFFF

preset_KaizoPAny_draygon_green_maridia_missiles:
    dw #preset_KaizoPAny_draygon_crab_shaft_escape ; Draygon: Crab Shaft Escape
    dw $078D, $8AD2  ; DDB
    dw $079B, $D646  ; MDB
    dw $090F, $E000  ; Screen subpixel X position
    dw $0913, $7800  ; Screen subpixel Y position
    dw $0915, $0300  ; Screen Y position in pixels
    dw $0919, $0240  ; Layer 2 Y position
    dw $09C6, $000A  ; Missiles
    dw $0A1C, $0001  ; Samus position/state
    dw $0A1E, $0008  ; More position/state
    dw $0AF6, $0081  ; Samus X
    dw $0AF8, $CFFF  ; Samus subpixel X
    dw $0AFA, $038B  ; Samus Y
    dw #$FFFF

preset_KaizoPAny_end_game_power_bombs:
    dw #preset_KaizoPAny_draygon_green_maridia_missiles ; Draygon: Green Maridia missiles
    dw $078D, $8A72  ; DDB
    dw $079B, $9552  ; MDB
    dw $07F5, $0006  ; Music Track
    dw $090F, $3F00  ; Screen subpixel X position
    dw $0913, $0000  ; Screen subpixel Y position
    dw $0915, $003B  ; Screen Y position in pixels
    dw $0919, $002C  ; Layer 2 Y position
    dw $09C6, $0014  ; Missiles
    dw $09C8, $0014  ; Max missiles
    dw $0A1C, $0002  ; Samus position/state
    dw $0A1E, $0004  ; More position/state
    dw $0AF6, $006A  ; Samus X
    dw $0AF8, $3FFF  ; Samus subpixel X
    dw $0AFA, $00AB  ; Samus Y
    dw $D870, $0437  ; Items
    dw #$FFFF

preset_KaizoPAny_end_game_maridia_cleanup:
    dw #preset_KaizoPAny_end_game_power_bombs ; End Game: Power Bombs
    dw $078D, $8A8A  ; DDB
    dw $079B, $94CC  ; MDB
    dw $07F3, $0009  ; Music Bank
    dw $07F5, $0003  ; Music Track
    dw $090F, $6000  ; Screen subpixel X position
    dw $0913, $3000  ; Screen subpixel Y position
    dw $0915, $0000  ; Screen Y position in pixels
    dw $0919, $0000  ; Layer 2 Y position
    dw $09CA, $0008  ; Supers
    dw $09CE, $0004  ; Pbs
    dw $09D0, $0005  ; Max pbs
    dw $0AF6, $0087  ; Samus X
    dw $0AF8, $8000  ; Samus subpixel X
    dw #$FFFF

preset_KaizoPAny_end_game_ridley:
    dw #preset_KaizoPAny_end_game_maridia_cleanup ; End Game: Maridia Clean-up
    dw $078D, $9792  ; DDB
    dw $079B, $ACB3  ; MDB
    dw $07F3, $0018  ; Music Bank
    dw $07F5, $0005  ; Music Track
    dw $090F, $F000  ; Screen subpixel X position
    dw $0911, $00DF  ; Screen X position in pixels
    dw $0913, $0000  ; Screen subpixel Y position
    dw $0915, $031C  ; Screen Y position in pixels
    dw $0917, $00A7  ; Layer 2 X position
    dw $0919, $0255  ; Layer 2 Y position
    dw $09C6, $002D  ; Missiles
    dw $09C8, $002D  ; Max missiles
    dw $09CA, $000A  ; Supers
    dw $0A1C, $0001  ; Samus position/state
    dw $0A1E, $0008  ; More position/state
    dw $0AF6, $0145  ; Samus X
    dw $0AF8, $0000  ; Samus subpixel X
    dw $0AFA, $03AB  ; Samus Y
    dw $D870, $0537  ; Items
    dw $D880, $4029  ; Items
    dw $D882, $0D30  ; Items
    dw #$FFFF

preset_KaizoPAny_end_game_acid_dive:
    dw #preset_KaizoPAny_end_game_ridley ; End Game: Ridley
    dw $078D, $99EA  ; DDB
    dw $079B, $B5D5  ; MDB
    dw $090F, $5FFF  ; Screen subpixel X position
    dw $0911, $0100  ; Screen X position in pixels
    dw $0913, $9400  ; Screen subpixel Y position
    dw $0915, $0218  ; Screen Y position in pixels
    dw $0917, $00C0  ; Layer 2 X position
    dw $0919, $0192  ; Layer 2 Y position
    dw $09A2, $F32F  ; Equipped Items
    dw $09A4, $F32F  ; Collected Items
    dw $09C2, $0054  ; Health
    dw $09CE, $0005  ; Pbs
    dw $0A1C, $0089  ; Samus position/state
    dw $0A1E, $1508  ; More position/state
    dw $0AF6, $01BB  ; Samus X
    dw $0AF8, $FFFF  ; Samus subpixel X
    dw $0AFA, $028B  ; Samus Y
    dw $D82A, $0101  ; Bosses
    dw $D878, $4012  ; Items
    dw $D8BA, $3C04  ; Doors
    dw #$FFFF

preset_KaizoPAny_end_game_tower_supers:
    dw #preset_KaizoPAny_end_game_acid_dive ; End Game: Acid Dive
    dw $078D, $90F6  ; DDB
    dw $079B, $9E11  ; MDB
    dw $090F, $2001  ; Screen subpixel X position
    dw $0911, $0000  ; Screen X position in pixels
    dw $0913, $6000  ; Screen subpixel Y position
    dw $0915, $011F  ; Screen Y position in pixels
    dw $0917, $0000  ; Layer 2 X position
    dw $0919, $00D7  ; Layer 2 Y position
    dw $09C2, $0063  ; Health
    dw $09C6, $003C  ; Missiles
    dw $09C8, $003C  ; Max missiles
    dw $09CA, $000F  ; Supers
    dw $09CC, $000F  ; Max supers
    dw $09CE, $0004  ; Pbs
    dw $09D0, $000A  ; Max pbs
    dw $0A1C, $0001  ; Samus position/state
    dw $0A1E, $0008  ; More position/state
    dw $0AF6, $0055  ; Samus X
    dw $0AF8, $0000  ; Samus subpixel X
    dw $0AFA, $01BB  ; Samus Y
    dw $D870, $8577  ; Items
    dw $D872, $0481  ; Items
    dw $D878, $4C12  ; Items
    dw $D8B6, $1004  ; Doors
    dw $D8BA, $BC04  ; Doors
    dw #$FFFF

preset_KaizoPAny_end_game_crateria_cleanup:
    dw #preset_KaizoPAny_end_game_tower_supers ; End Game: Tower Supers
    dw $078D, $8BE6  ; DDB
    dw $079B, $99BD  ; MDB
    dw $07F3, $0036  ; Music Bank
    dw $090F, $1000  ; Screen subpixel X position
    dw $0913, $5400  ; Screen subpixel Y position
    dw $0915, $0417  ; Screen Y position in pixels
    dw $0917, $0001  ; Layer 2 X position
    dw $0919, $0311  ; Layer 2 Y position
    dw $09C6, $0041  ; Missiles
    dw $09C8, $0041  ; Max missiles
    dw $09CA, $0014  ; Supers
    dw $09CC, $0014  ; Max supers
    dw $09CE, $0003  ; Pbs
    dw $0AF6, $0053  ; Samus X
    dw $0AF8, $1000  ; Samus subpixel X
    dw $0AFA, $048B  ; Samus Y
    dw $D870, $C577  ; Items
    dw $D872, $04A1  ; Items
    dw #$FFFF

preset_KaizoPAny_end_game_kraid_entry:
    dw #preset_KaizoPAny_end_game_crateria_cleanup ; End Game: Crateria clean-up
    dw $078D, $8B9E  ; DDB
    dw $079B, $9E9F  ; MDB
    dw $07F3, $001B  ; Music Bank
    dw $090F, $9000  ; Screen subpixel X position
    dw $0913, $D000  ; Screen subpixel Y position
    dw $0915, $0200  ; Screen Y position in pixels
    dw $0917, $0000  ; Layer 2 X position
    dw $0919, $0180  ; Layer 2 Y position
    dw $09C6, $0050  ; Missiles
    dw $09C8, $0050  ; Max missiles
    dw $09CA, $0012  ; Supers
    dw $09CE, $0001  ; Pbs
    dw $0A1C, $0002  ; Samus position/state
    dw $0A1E, $0004  ; More position/state
    dw $0AF6, $002C  ; Samus X
    dw $0AF8, $BFFF  ; Samus subpixel X
    dw $0AFA, $028B  ; Samus Y
    dw $D870, $CF77  ; Items
    dw $D872, $0CA1  ; Items
    dw $D8B2, $0208  ; Doors
    dw #$FFFF

preset_KaizoPAny_end_game_kraid_escape:
    dw #preset_KaizoPAny_end_game_kraid_entry ; End Game: Kraid entry
    dw $078D, $91B6  ; DDB
    dw $079B, $A59F  ; MDB
    dw $07F5, $0003  ; Music Track
    dw $0911, $0100  ; Screen X position in pixels
    dw $0913, $D800  ; Screen subpixel Y position
    dw $0915, $0100  ; Screen Y position in pixels
    dw $0917, $0001  ; Layer 2 X position
    dw $0919, $0000  ; Layer 2 Y position
    dw $09C6, $004E  ; Missiles
    dw $09CA, $000F  ; Supers
    dw $0A1C, $0001  ; Samus position/state
    dw $0A1E, $0008  ; More position/state
    dw $0AF6, $0189  ; Samus X
    dw $0AF8, $4FFF  ; Samus subpixel X
    dw $0AFA, $01AB  ; Samus Y
    dw $D828, $0100  ; Bosses
    dw $D8B8, $0848  ; Doors
    dw #$FFFF

preset_KaizoPAny_end_game_tourian:
    dw #preset_KaizoPAny_end_game_kraid_escape ; End Game: Kraid escape
    dw $078D, $8C16  ; DDB
    dw $079B, $99BD  ; MDB
    dw $07F3, $0036  ; Music Bank
    dw $07F5, $0005  ; Music Track
    dw $090F, $8000  ; Screen subpixel X position
    dw $0911, $0000  ; Screen X position in pixels
    dw $0913, $8BFF  ; Screen subpixel Y position
    dw $0915, $0600  ; Screen Y position in pixels
    dw $0919, $0480  ; Layer 2 Y position
    dw $09C6, $0064  ; Missiles
    dw $09C8, $0064  ; Max missiles
    dw $09CA, $0014  ; Supers
    dw $09CE, $000A  ; Pbs
    dw $0AF6, $00B6  ; Samus X
    dw $0AF8, $FFFF  ; Samus subpixel X
    dw $0AFA, $068B  ; Samus Y
    dw $D870, $CF7F  ; Items
    dw $D874, $2800  ; Items
    dw $D87A, $0001  ; Items
    dw $D8B8, $084B  ; Doors
    dw $D8C0, $875C  ; Doors
    dw #$FFFF

preset_KaizoPAny_end_game_baby_skip:
    dw #preset_KaizoPAny_end_game_tourian ; End Game: Tourian
    dw $078D, $AA14  ; DDB
    dw $079B, $DC65  ; MDB
    dw $07F3, $0045  ; Music Bank
    dw $07F5, $0006  ; Music Track
    dw $090F, $8001  ; Screen subpixel X position
    dw $0913, $C000  ; Screen subpixel Y position
    dw $0915, $0000  ; Screen Y position in pixels
    dw $0917, $0000  ; Layer 2 X position
    dw $0919, $0000  ; Layer 2 Y position
    dw $09CE, $0000  ; Pbs
    dw $0A1C, $008A  ; Samus position/state
    dw $0A1E, $1504  ; More position/state
    dw $0AF6, $0025  ; Samus X
    dw $0AF8, $0000  ; Samus subpixel X
    dw $0AFA, $00AB  ; Samus Y
    dw $D820, $07C1  ; Events
    dw $D822, $000F  ; Events
    dw $D8C4, $002F  ; Doors
    dw $D90C, $01FF  ; Map Stations
    dw #$FFFF

preset_KaizoPAny_end_game_mother_brain:
    dw #preset_KaizoPAny_end_game_baby_skip ; End Game: Baby Skip
    dw $078D, $AAA4  ; DDB
    dw $079B, $DDF3  ; MDB
    dw $07F3, $001E  ; Music Bank
    dw $07F5, $0005  ; Music Track
    dw $090F, $3000  ; Screen subpixel X position
    dw $0913, $0000  ; Screen subpixel Y position
    dw $0915, $021D  ; Screen Y position in pixels
    dw $0919, $0195  ; Layer 2 Y position
    dw $09C6, $0061  ; Missiles
    dw $09CA, $0000  ; Supers
    dw $0A1C, $0002  ; Samus position/state
    dw $0A1E, $0004  ; More position/state
    dw $0AF6, $0037  ; Samus X
    dw $0AF8, $8000  ; Samus subpixel X
    dw $0AFA, $028B  ; Samus Y
    dw $D8C4, $01AF  ; Doors
    dw #$FFFF
