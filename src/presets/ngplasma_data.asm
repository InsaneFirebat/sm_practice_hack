
preset_ngplasma_ceres_station_ceres_elevator:
    dw #$0000
    dw $078D, $AB58 ; DDB
    dw $079B, $DF45 ; MDB
    dw $07F3, $002D ; Music Bank
    dw $07F5, $0006 ; Music Track
    dw $090F, $0000 ; Screen subpixel X position.
    dw $0911, $0000 ; Screen X position in pixels
    dw $0913, $0000 ; Screen subpixel Y position
    dw $0915, $0000 ; Screen Y position in pixels
    dw $093F, $0000 ; Ceres escape flag
    dw $09A2, $F32F ; Equipped Items
    dw $09A4, $F32F ; Collected Items
    dw $09A6, $100B ; Beams
    dw $09A8, $100F ; Beams
    dw $09C0, $0001 ; Manual/Auto reserve tank
    dw $09C2, $002C ; Health
    dw $09C4, $05DB ; Max health
    dw $09C6, $00E6 ; Missiles
    dw $09C8, $00E6 ; Max missiles
    dw $09CA, $0032 ; Supers
    dw $09CC, $0032 ; Max supers
    dw $09CE, $0032 ; Pbs
    dw $09D0, $0032 ; Max pbs
    dw $09D2, $0000 ; Currently selected item
    dw $09D4, $0190 ; Max reserves
    dw $09D6, $0190 ; Reserves
    dw $0A1C, $0000 ; Samus position/state
    dw $0A1E, $0000 ; More position/state
    dw $0A68, $0000 ; Flash suit
    dw $0A76, $0000 ; Hyper beam
    dw $0AF6, $0080 ; Samus X
    dw $0AFA, $0048 ; Samus Y
    dw $0B3F, $0000 ; Blue suit
    dw $D820, $0000 ; Events, Items, Doors
    dw $D822, $0000 ; Events, Items, Doors
    dw $D828, $0000 ; Events, Items, Doors
    dw $D82A, $0000 ; Events, Items, Doors
    dw $D82C, $0000 ; Events, Items, Doors
    dw $D82E, $0000 ; Events, Items, Doors
    dw $D870, $0000 ; Events, Items, Doors
    dw $D872, $0000 ; Events, Items, Doors
    dw $D874, $0000 ; Events, Items, Doors
    dw $D876, $0000 ; Events, Items, Doors
    dw $D878, $0000 ; Events, Items, Doors
    dw $D87A, $0000 ; Events, Items, Doors
    dw $D87C, $0000 ; Events, Items, Doors
    dw $D87E, $0000 ; Events, Items, Doors
    dw $D880, $0000 ; Events, Items, Doors
    dw $D882, $0000 ; Events, Items, Doors
    dw $D884, $0000 ; Events, Items, Doors
    dw $D8B0, $0000 ; Events, Items, Doors
    dw $D8B2, $0000 ; Events, Items, Doors
    dw $D8B4, $0000 ; Events, Items, Doors
    dw $D8B8, $0000 ; Events, Items, Doors
    dw $D8BA, $0000 ; Events, Items, Doors
    dw $D8BC, $0000 ; Events, Items, Doors
    dw $D8BE, $0000 ; Events, Items, Doors
    dw $D8C0, $0000 ; Events, Items, Doors
    dw $D8C2, $0000 ; Events, Items, Doors
    dw $D8C4, $0000 ; Events, Items, Doors
    dw $D90C, $0000 ; Events, Items, Doors
    dw $D91A, $0000 ; Events, Items, Doors
    dw #$FFFF
.after

preset_ngplasma_ceres_station_magnet_stairs:
    dw #preset_ngplasma_ceres_station_ceres_elevator ; Ceres Station: Ceres Elevator
    dw $078D, $AB4C ; DDB
    dw $079B, $DF8D ; MDB
    dw $090F, $BE00 ; Screen subpixel X position.
    dw $0911, $0100 ; Screen X position in pixels
    dw $0913, $0800 ; Screen subpixel Y position
    dw $0A1C, $0001 ; Samus position/state
    dw $0A1E, $0008 ; More position/state
    dw $0AF6, $01B9 ; Samus X
    dw $0AFA, $009A ; Samus Y
    dw #$FFFF
.after

preset_ngplasma_ceres_station_ceres_ridley:
    dw #preset_ngplasma_ceres_station_magnet_stairs ; Ceres Station: Magnet Stairs
    dw $078D, $AB94 ; DDB
    dw $079B, $E06B ; MDB
    dw $090F, $6000 ; Screen subpixel X position.
    dw $0913, $0000 ; Screen subpixel Y position
    dw $09CE, $0031 ; Pbs
    dw $0AF6, $01B3 ; Samus X
    dw $0AFA, $008B ; Samus Y
    dw #$FFFF
.after

preset_ngplasma_ceres_station_magnet_stairs_escape:
    dw #preset_ngplasma_ceres_station_ceres_ridley ; Ceres Station: Ceres Ridley
    dw $078D, $ABA0 ; DDB
    dw $079B, $E021 ; MDB
    dw $07F3, $0024 ; Music Bank
    dw $07F5, $0007 ; Music Track
    dw $090F, $8F00 ; Screen subpixel X position.
    dw $0911, $0000 ; Screen X position in pixels
    dw $0913, $0400 ; Screen subpixel Y position
    dw $093F, $0002 ; Ceres escape flag
    dw $09C2, $0001 ; Health
    dw $09CE, $0030 ; Pbs
    dw $0A1C, $0002 ; Samus position/state
    dw $0A1E, $0004 ; More position/state
    dw $0AF6, $0046 ; Samus X
    dw $0AFA, $009A ; Samus Y
    dw $D82E, $0001 ; Events, Items, Doors
    dw #$FFFF
.after

preset_ngplasma_wrecked_ship_ship:
    dw #preset_ngplasma_ceres_station_magnet_stairs_escape ; Ceres Station: Magnet Stairs Escape
    dw $078D, $88FE ; DDB
    dw $079B, $91F8 ; MDB
    dw $07F3, $000C ; Music Bank
    dw $07F5, $0005 ; Music Track
    dw $090F, $6000 ; Screen subpixel X position.
    dw $0911, $0400 ; Screen X position in pixels
    dw $0913, $0000 ; Screen subpixel Y position
    dw $0915, $03D0 ; Screen Y position in pixels
    dw $093F, $0000 ; Ceres escape flag
    dw $09C2, $05DB ; Health
    dw $0A1C, $0000 ; Samus position/state
    dw $0A1E, $0000 ; More position/state
    dw $0AF6, $0481 ; Samus X
    dw $0AFA, $0440 ; Samus Y
    dw $D8F8, $0001 ; Events, Items, Doors
    dw $D914, $0005 ; Events, Items, Doors
    dw $D918, $0000 ; Events, Items, Doors
    dw $D91C, $1010 ; Events, Items, Doors
    dw #$FFFF
.after

preset_ngplasma_wrecked_ship_moat:
    dw #preset_ngplasma_wrecked_ship_ship ; Wrecked Ship: Ship
    dw $078D, $8AD2 ; DDB
    dw $079B, $948C ; MDB
    dw $090F, $97FF ; Screen subpixel X position.
    dw $0911, $0200 ; Screen X position in pixels
    dw $0913, $C800 ; Screen subpixel Y position
    dw $0915, $0000 ; Screen Y position in pixels
    dw $09C6, $00E5 ; Missiles
    dw $09CA, $0031 ; Supers
    dw $09CE, $002F ; Pbs
    dw $0A1C, $0001 ; Samus position/state
    dw $0A1E, $0008 ; More position/state
    dw $0AF6, $02B2 ; Samus X
    dw $0AFA, $008B ; Samus Y
    dw $D8B0, $2001 ; Events, Items, Doors
    dw #$FFFF
.after

preset_ngplasma_wrecked_ship_ocean:
    dw #preset_ngplasma_wrecked_ship_moat ; Wrecked Ship: Moat
    dw $078D, $8A36 ; DDB
    dw $079B, $95FF ; MDB
    dw $090F, $0000 ; Screen subpixel X position.
    dw $0911, $0100 ; Screen X position in pixels
    dw $0913, $0400 ; Screen subpixel Y position
    dw $0AF6, $01A2 ; Samus X
    dw $D91A, $0001 ; Events, Items, Doors
    dw #$FFFF
.after

preset_ngplasma_wrecked_ship_entering_wrecked_ship:
    dw #preset_ngplasma_wrecked_ship_ocean ; Wrecked Ship: Ocean
    dw $078D, $8AEA ; DDB
    dw $079B, $93FE ; MDB
    dw $090F, $1000 ; Screen subpixel X position.
    dw $0911, $0700 ; Screen X position in pixels
    dw $0913, $0000 ; Screen subpixel Y position
    dw $0915, $0414 ; Screen Y position in pixels
    dw $09CA, $0030 ; Supers
    dw $0AF6, $0787 ; Samus X
    dw $0AFA, $04A4 ; Samus Y
    dw $D8B0, $3001 ; Events, Items, Doors
    dw $D91A, $0004 ; Events, Items, Doors
    dw #$FFFF
.after

preset_ngplasma_wrecked_ship_phantoon:
    dw #preset_ngplasma_wrecked_ship_entering_wrecked_ship ; Wrecked Ship: Entering Wrecked Ship
    dw $078D, $A21C ; DDB
    dw $079B, $CC6F ; MDB
    dw $07F3, $0030 ; Music Bank
    dw $090F, $D3FF ; Screen subpixel X position.
    dw $0911, $0400 ; Screen X position in pixels
    dw $0913, $AC00 ; Screen subpixel Y position
    dw $0915, $0000 ; Screen Y position in pixels
    dw $09CA, $002E ; Supers
    dw $09CE, $002E ; Pbs
    dw $0AF6, $04D0 ; Samus X
    dw $0AFA, $008B ; Samus Y
    dw $D8C0, $0030 ; Events, Items, Doors
    dw $D91A, $0005 ; Events, Items, Doors
    dw #$FFFF
.after

preset_ngplasma_wrecked_ship_wrecked_ship_shaft:
    dw #preset_ngplasma_wrecked_ship_phantoon ; Wrecked Ship: Phantoon
    dw $078D, $A2C4 ; DDB
    dw $07F5, $0006 ; Music Track
    dw $090F, $6000 ; Screen subpixel X position.
    dw $0911, $0235 ; Screen X position in pixels
    dw $0913, $0000 ; Screen subpixel Y position
    dw $09C6, $00E6 ; Missiles
    dw $09CA, $0030 ; Supers
    dw $09CE, $002F ; Pbs
    dw $0A1C, $0002 ; Samus position/state
    dw $0A1E, $0004 ; More position/state
    dw $0AF6, $02CF ; Samus X
    dw $0AFA, $006B ; Samus Y
    dw $D82A, $0100 ; Events, Items, Doors
    dw $D8C0, $0070 ; Events, Items, Doors
    dw #$FFFF
.after

preset_ngplasma_wrecked_ship_leaving_wrecked_ship:
    dw #preset_ngplasma_wrecked_ship_wrecked_ship_shaft ; Wrecked Ship: Wrecked Ship Shaft
    dw $078D, $A294 ; DDB
    dw $079B, $CAF6 ; MDB
    dw $090F, $D800 ; Screen subpixel X position.
    dw $0911, $0400 ; Screen X position in pixels
    dw $0913, $A000 ; Screen subpixel Y position
    dw $0915, $0318 ; Screen Y position in pixels
    dw $0AF6, $0467 ; Samus X
    dw $0AFA, $038B ; Samus Y
    dw $D8C0, $0074 ; Events, Items, Doors
    dw $D91A, $0006 ; Events, Items, Doors
    dw #$FFFF
.after

preset_ngplasma_wrecked_ship_kihunters_revisit:
    dw #preset_ngplasma_wrecked_ship_leaving_wrecked_ship ; Wrecked Ship: Leaving Wrecked Ship
    dw $078D, $89CA ; DDB
    dw $079B, $95FF ; MDB
    dw $07F3, $000C ; Music Bank
    dw $07F5, $0005 ; Music Track
    dw $090F, $0000 ; Screen subpixel X position.
    dw $0911, $0000 ; Screen X position in pixels
    dw $0913, $0000 ; Screen subpixel Y position
    dw $0915, $0004 ; Screen Y position in pixels
    dw $0AF6, $0037 ; Samus X
    dw $0AFA, $0093 ; Samus Y
    dw $D91A, $000A ; Events, Items, Doors
    dw #$FFFF
.after

preset_ngplasma_red_tower_red_brinstar_elevator:
    dw #preset_ngplasma_wrecked_ship_kihunters_revisit ; Wrecked Ship: Kihunters Revisit
    dw $078D, $8B02 ; DDB
    dw $079B, $A322 ; MDB
    dw $07F3, $0012 ; Music Bank
    dw $090F, $D000 ; Screen subpixel X position.
    dw $0915, $0238 ; Screen Y position in pixels
    dw $09CE, $002D ; Pbs
    dw $0A1C, $009B ; Samus position/state
    dw $0A1E, $0000 ; More position/state
    dw $0AF6, $0080 ; Samus X
    dw $0AFA, $02A8 ; Samus Y
    dw $D8B0, $7001 ; Events, Items, Doors
    dw $D8B2, $0001 ; Events, Items, Doors
    dw #$FFFF
.after

preset_ngplasma_red_tower_hellway:
    dw #preset_ngplasma_red_tower_red_brinstar_elevator ; Red Tower: Red Brinstar Elevator
    dw $090F, $7FFF ; Screen subpixel X position.
    dw $0913, $8C00 ; Screen subpixel Y position
    dw $0915, $0500 ; Screen Y position in pixels
    dw $09CE, $002C ; Pbs
    dw $0A1C, $0002 ; Samus position/state
    dw $0A1E, $0004 ; More position/state
    dw $0AF6, $0099 ; Samus X
    dw $0AFA, $058B ; Samus Y
    dw $D8B6, $1000 ; Events, Items, Doors
    dw #$FFFF
.after

preset_ngplasma_red_tower_red_tower_2:
    dw #preset_ngplasma_red_tower_hellway ; Red Tower: Hellway
    dw $078D, $90AE ; DDB
    dw $079B, $A2F7 ; MDB
    dw $090F, $1001 ; Screen subpixel X position.
    dw $0913, $A400 ; Screen subpixel Y position
    dw $0915, $0000 ; Screen Y position in pixels
    dw $0AF6, $0034 ; Samus X
    dw $0AFA, $008B ; Samus Y
    dw #$FFFF
.after

preset_ngplasma_red_tower_skree_boost:
    dw #preset_ngplasma_red_tower_red_tower_2 ; Red Tower: Red Tower
    dw $078D, $907E ; DDB
    dw $079B, $A253 ; MDB
    dw $090F, $4000 ; Screen subpixel X position.
    dw $0913, $0000 ; Screen subpixel Y position
    dw $0915, $0919 ; Screen Y position in pixels
    dw $0A1C, $0001 ; Samus position/state
    dw $0A1E, $0008 ; More position/state
    dw $0AF6, $0062 ; Samus X
    dw $0AFA, $098B ; Samus Y
    dw #$FFFF
.after

preset_ngplasma_red_tower_below_spazer:
    dw #preset_ngplasma_red_tower_skree_boost ; Red Tower: Skree Boost
    dw $078D, $9042 ; DDB
    dw $079B, $A3DD ; MDB
    dw $090F, $3000 ; Screen subpixel X position.
    dw $0911, $0100 ; Screen X position in pixels
    dw $0913, $FC00 ; Screen subpixel Y position
    dw $0915, $0000 ; Screen Y position in pixels
    dw $0AF6, $01DE ; Samus X
    dw $0AFA, $008B ; Samus Y
    dw #$FFFF
.after

preset_ngplasma_red_tower_breaking_maridia_tube:
    dw #preset_ngplasma_red_tower_below_spazer ; Red Tower: Below Spazer
    dw $078D, $9102 ; DDB
    dw $079B, $A408 ; MDB
    dw $090F, $5000 ; Screen subpixel X position.
    dw $0913, $5C00 ; Screen subpixel Y position
    dw $0915, $0100 ; Screen Y position in pixels
    dw $09CA, $0031 ; Supers
    dw $0AF6, $01B3 ; Samus X
    dw $0AFA, $018B ; Samus Y
    dw #$FFFF
.after

preset_ngplasma_norfair_preridley_business_center:
    dw #preset_ngplasma_red_tower_breaking_maridia_tube ; Red Tower: Breaking Maridia Tube
    dw $078D, $9246 ; DDB
    dw $079B, $A7DE ; MDB
    dw $07F3, $0015 ; Music Bank
    dw $0911, $0000 ; Screen X position in pixels
    dw $0913, $0000 ; Screen subpixel Y position
    dw $0915, $0238 ; Screen Y position in pixels
    dw $09CE, $002B ; Pbs
    dw $0A1C, $009B ; Samus position/state
    dw $0A1E, $0000 ; More position/state
    dw $0AF6, $0080 ; Samus X
    dw $0AFA, $02A8 ; Samus Y
    dw $D820, $0800 ; Events, Items, Doors
    dw #$FFFF
.after

preset_ngplasma_norfair_preridley_frog_speedway:
    dw #preset_ngplasma_norfair_preridley_business_center ; Norfair Pre-Ridley: Business Center
    dw $090F, $9000 ; Screen subpixel X position.
    dw $0915, $051B ; Screen Y position in pixels
    dw $0A1C, $0001 ; Samus position/state
    dw $0A1E, $0008 ; More position/state
    dw $0AF6, $0040 ; Samus X
    dw $0AFA, $058B ; Samus Y
    dw #$FFFF
.after

preset_ngplasma_norfair_preridley_kronic_boost:
    dw #preset_ngplasma_norfair_preridley_frog_speedway ; Norfair Pre-Ridley: Frog Speedway
    dw $078D, $96BA ; DDB
    dw $079B, $AEB4 ; MDB
    dw $090F, $4000 ; Screen subpixel X position.
    dw $0911, $0200 ; Screen X position in pixels
    dw $0913, $8C00 ; Screen subpixel Y position
    dw $0915, $0000 ; Screen Y position in pixels
    dw $0AF6, $02C6 ; Samus X
    dw $0AFA, $008B ; Samus Y
    dw $D91A, $000B ; Events, Items, Doors
    dw #$FFFF
.after

preset_ngplasma_norfair_preridley_ln_main_hall:
    dw #preset_ngplasma_norfair_preridley_kronic_boost ; Norfair Pre-Ridley: Kronic Boost
    dw $078D, $96F6 ; DDB
    dw $079B, $B236 ; MDB
    dw $07F3, $0018 ; Music Bank
    dw $090F, $E000 ; Screen subpixel X position.
    dw $0911, $0400 ; Screen X position in pixels
    dw $0913, $0000 ; Screen subpixel Y position
    dw $0915, $0200 ; Screen Y position in pixels
    dw $09C2, $05D8 ; Health
    dw $09CE, $002A ; Pbs
    dw $0A1C, $009B ; Samus position/state
    dw $0A1E, $0000 ; More position/state
    dw $0AF6, $0480 ; Samus X
    dw $0AFA, $0288 ; Samus Y
    dw $D8BA, $0100 ; Events, Items, Doors
    dw #$FFFF
.after

preset_ngplasma_norfair_preridley_fast_pillars_setup:
    dw #preset_ngplasma_norfair_preridley_ln_main_hall ; Norfair Pre-Ridley: LN Main Hall
    dw $090F, $B000 ; Screen subpixel X position.
    dw $0911, $0700 ; Screen X position in pixels
    dw $0913, $B000 ; Screen subpixel Y position
    dw $0A1C, $0001 ; Samus position/state
    dw $0A1E, $0008 ; More position/state
    dw $0AF6, $07AF ; Samus X
    dw $0AFA, $028B ; Samus Y
    dw #$FFFF
.after

preset_ngplasma_norfair_preridley_worst_room_in_the_game:
    dw #preset_ngplasma_norfair_preridley_fast_pillars_setup ; Norfair Pre-Ridley: Fast Pillars Setup
    dw $078D, $9912 ; DDB
    dw $079B, $B457 ; MDB
    dw $090F, $D000 ; Screen subpixel X position.
    dw $0911, $0300 ; Screen X position in pixels
    dw $0913, $5400 ; Screen subpixel Y position
    dw $0915, $0000 ; Screen Y position in pixels
    dw $09C2, $0596 ; Health
    dw $09CE, $002B ; Pbs
    dw $0AF6, $03D3 ; Samus X
    dw $0AFA, $008B ; Samus Y
    dw #$FFFF
.after

preset_ngplasma_norfair_preridley_amphitheatre:
    dw #preset_ngplasma_norfair_preridley_worst_room_in_the_game ; Norfair Pre-Ridley: Worst Room in the Game
    dw $078D, $994E ; DDB
    dw $079B, $B4AD ; MDB
    dw $090F, $3000 ; Screen subpixel X position.
    dw $0911, $0000 ; Screen X position in pixels
    dw $0913, $0000 ; Screen subpixel Y position
    dw $0915, $011D ; Screen Y position in pixels
    dw $0AF6, $00A9 ; Samus X
    dw $0AFA, $018B ; Samus Y
    dw #$FFFF
.after

preset_ngplasma_norfair_preridley_kihunter_stairs:
    dw #preset_ngplasma_norfair_preridley_amphitheatre ; Norfair Pre-Ridley: Amphitheatre
    dw $078D, $997E ; DDB
    dw $079B, $B4E5 ; MDB
    dw $090F, $0000 ; Screen subpixel X position.
    dw $0911, $0259 ; Screen X position in pixels
    dw $0913, $4C00 ; Screen subpixel Y position
    dw $0915, $0037 ; Screen Y position in pixels
    dw $09C2, $05AA ; Health
    dw $0AF6, $02B9 ; Samus X
    dw $0AFA, $00BB ; Samus Y
    dw #$FFFF
.after

preset_ngplasma_norfair_preridley_wasteland:
    dw #preset_ngplasma_norfair_preridley_kihunter_stairs ; Norfair Pre-Ridley: Kihunter Stairs
    dw $078D, $99A2 ; DDB
    dw $079B, $B585 ; MDB
    dw $090F, $5600 ; Screen subpixel X position.
    dw $0911, $0200 ; Screen X position in pixels
    dw $0913, $0000 ; Screen subpixel Y position
    dw $0915, $0419 ; Screen Y position in pixels
    dw $09C2, $05BE ; Health
    dw $09CE, $0029 ; Pbs
    dw $0A1C, $0079 ; Samus position/state
    dw $0A1E, $1108 ; More position/state
    dw $0AF6, $024D ; Samus X
    dw $0AFA, $0489 ; Samus Y
    dw $D8BA, $4100 ; Events, Items, Doors
    dw #$FFFF
.after

preset_ngplasma_norfair_preridley_metal_pirates:
    dw #preset_ngplasma_norfair_preridley_wasteland ; Norfair Pre-Ridley: Wasteland
    dw $078D, $99EA ; DDB
    dw $079B, $B5D5 ; MDB
    dw $090F, $D000 ; Screen subpixel X position.
    dw $0911, $0100 ; Screen X position in pixels
    dw $0915, $021B ; Screen Y position in pixels
    dw $09C2, $0585 ; Health
    dw $09CA, $0030 ; Supers
    dw $09CE, $0028 ; Pbs
    dw $0A1C, $0002 ; Samus position/state
    dw $0A1E, $0004 ; More position/state
    dw $0AF6, $015B ; Samus X
    dw $0AFA, $028B ; Samus Y
    dw $D8BA, $C100 ; Events, Items, Doors
    dw $D91A, $000C ; Events, Items, Doors
    dw #$FFFF
.after

preset_ngplasma_norfair_preridley_plowerhouse:
    dw #preset_ngplasma_norfair_preridley_metal_pirates ; Norfair Pre-Ridley: Metal Pirates
    dw $078D, $9A1A ; DDB
    dw $079B, $B62B ; MDB
    dw $090F, $A000 ; Screen subpixel X position.
    dw $0911, $0194 ; Screen X position in pixels
    dw $0913, $FC00 ; Screen subpixel Y position
    dw $0915, $0000 ; Screen Y position in pixels
    dw $09C2, $05DB ; Health
    dw $09CA, $0032 ; Supers
    dw $0AF6, $01FA ; Samus X
    dw $0AFA, $00BB ; Samus Y
    dw $D820, $0801 ; Events, Items, Doors
    dw $D8BC, $0001 ; Events, Items, Doors
    dw #$FFFF
.after

preset_ngplasma_norfair_preridley_ridley:
    dw #preset_ngplasma_norfair_preridley_plowerhouse ; Norfair Pre-Ridley: Plowerhouse
    dw $078D, $995A ; DDB
    dw $079B, $B37A ; MDB
    dw $090F, $7000 ; Screen subpixel X position.
    dw $0911, $0000 ; Screen X position in pixels
    dw $0913, $7000 ; Screen subpixel Y position
    dw $09C2, $05D8 ; Health
    dw $09CA, $0031 ; Supers
    dw $0AF6, $003D ; Samus X
    dw $0AFA, $009B ; Samus Y
    dw $D8BA, $D100 ; Events, Items, Doors
    dw #$FFFF
.after

preset_ngplasma_norfair_postridley_leaving_ridley:
    dw #preset_ngplasma_norfair_preridley_ridley ; Norfair Pre-Ridley: Ridley
    dw $078D, $98BE ; DDB
    dw $090F, $0000 ; Screen subpixel X position.
    dw $0911, $00F2 ; Screen X position in pixels
    dw $0913, $FC00 ; Screen subpixel Y position
    dw $09C2, $0592 ; Health
    dw $09CA, $0013 ; Supers
    dw $0A1C, $0081 ; Samus position/state
    dw $0A1E, $0308 ; More position/state
    dw $0AF6, $0152 ; Samus X
    dw $0AFA, $004B ; Samus Y
    dw $D82A, $0101 ; Events, Items, Doors
    dw $D8BA, $D500 ; Events, Items, Doors
    dw #$FFFF
.after

preset_ngplasma_norfair_postridley_reverse_plowerhouse:
    dw #preset_ngplasma_norfair_postridley_leaving_ridley ; Norfair Post-Ridley: Leaving Ridley
    dw $090F, $E000 ; Screen subpixel X position.
    dw $0911, $0200 ; Screen X position in pixels
    dw $0913, $AC00 ; Screen subpixel Y position
    dw $0A1C, $0001 ; Samus position/state
    dw $0A1E, $0008 ; More position/state
    dw $0AF6, $02B4 ; Samus X
    dw $0AFA, $008B ; Samus Y
    dw #$FFFF
.after

preset_ngplasma_norfair_postridley_wasteland_revisit:
    dw #preset_ngplasma_norfair_postridley_reverse_plowerhouse ; Norfair Post-Ridley: Reverse Plowerhouse
    dw $078D, $9966 ; DDB
    dw $079B, $B62B ; MDB
    dw $090F, $1000 ; Screen subpixel X position.
    dw $0913, $E400 ; Screen subpixel Y position
    dw $09C2, $0573 ; Health
    dw $0A1C, $0089 ; Samus position/state
    dw $0A1E, $1508 ; More position/state
    dw $0AF6, $02DB ; Samus X
    dw $0AFA, $00AB ; Samus Y
    dw #$FFFF
.after

preset_ngplasma_norfair_postridley_kihunter_stairs_revisit:
    dw #preset_ngplasma_norfair_postridley_wasteland_revisit ; Norfair Post-Ridley: Wasteland Revisit
    dw $078D, $9A3E ; DDB
    dw $079B, $B5D5 ; MDB
    dw $090F, $9000 ; Screen subpixel X position.
    dw $0911, $0500 ; Screen X position in pixels
    dw $0913, $9400 ; Screen subpixel Y position
    dw $09C2, $053A ; Health
    dw $09CE, $0027 ; Pbs
    dw $0A1C, $0002 ; Samus position/state
    dw $0A1E, $0004 ; More position/state
    dw $0AF6, $0588 ; Samus X
    dw $0AFA, $005B ; Samus Y
    dw $D91A, $000D ; Events, Items, Doors
    dw #$FFFF
.after

preset_ngplasma_norfair_postridley_fireflea_room:
    dw #preset_ngplasma_norfair_postridley_kihunter_stairs_revisit ; Norfair Post-Ridley: Kihunter Stairs Revisit
    dw $078D, $9A26 ; DDB
    dw $079B, $B585 ; MDB
    dw $090F, $1180 ; Screen subpixel X position.
    dw $0911, $0000 ; Screen X position in pixels
    dw $0913, $3800 ; Screen subpixel Y position
    dw $0915, $0003 ; Screen Y position in pixels
    dw $09C2, $054E ; Health
    dw $09CE, $0026 ; Pbs
    dw $0A1C, $0001 ; Samus position/state
    dw $0A1E, $0008 ; More position/state
    dw $0AF6, $00B9 ; Samus X
    dw $0AFA, $008B ; Samus Y
    dw #$FFFF
.after

preset_ngplasma_norfair_postridley_springball_maze:
    dw #preset_ngplasma_norfair_postridley_fireflea_room ; Norfair Post-Ridley: Fireflea Room
    dw $078D, $9A02 ; DDB
    dw $079B, $B6EE ; MDB
    dw $090F, $0000 ; Screen subpixel X position.
    dw $0911, $0100 ; Screen X position in pixels
    dw $0913, $0000 ; Screen subpixel Y position
    dw $0915, $0000 ; Screen Y position in pixels
    dw $0A1C, $0002 ; Samus position/state
    dw $0A1E, $0004 ; More position/state
    dw $0AF6, $016C ; Samus X
    dw $D91A, $000E ; Events, Items, Doors
    dw #$FFFF
.after

preset_ngplasma_norfair_postridley_three_musketeers:
    dw #preset_ngplasma_norfair_postridley_springball_maze ; Norfair Post-Ridley: Springball Maze
    dw $078D, $9A92 ; DDB
    dw $079B, $B510 ; MDB
    dw $090F, $4600 ; Screen subpixel X position.
    dw $0911, $0000 ; Screen X position in pixels
    dw $0913, $3000 ; Screen subpixel Y position
    dw $0915, $0000 ; Screen Y position in pixels
    dw $0AF6, $0069 ; Samus X
    dw $D91A, $000F ; Events, Items, Doors
    dw #$FFFF
.after

preset_ngplasma_norfair_postridley_double_chamber:
    dw #preset_ngplasma_norfair_postridley_three_musketeers ; Norfair Post-Ridley: Three Musketeers
    dw $078D, $99AE ; DDB
    dw $079B, $B656 ; MDB
    dw $090F, $C000 ; Screen subpixel X position.
    dw $0911, $0100 ; Screen X position in pixels
    dw $0913, $0400 ; Screen subpixel Y position
    dw $0915, $0015 ; Screen Y position in pixels
    dw $0AF6, $016C ; Samus X
    dw $D91A, $0010 ; Events, Items, Doors
    dw #$FFFF
.after

preset_ngplasma_norfair_postridley_bubble_mountain:
    dw #preset_ngplasma_norfair_postridley_double_chamber ; Norfair Post-Ridley: Double Chamber
    dw $078D, $9A4A ; DDB
    dw $079B, $AD5E ; MDB
    dw $07F3, $0015 ; Music Bank
    dw $090F, $7000 ; Screen subpixel X position.
    dw $0911, $0000 ; Screen X position in pixels
    dw $0913, $A400 ; Screen subpixel Y position
    dw $0915, $0004 ; Screen Y position in pixels
    dw $09C6, $00E4 ; Missiles
    dw $0AF6, $0088 ; Samus X
    dw #$FFFF
.after

preset_ngplasma_norfair_postridley_business_center_revisit:
    dw #preset_ngplasma_norfair_postridley_bubble_mountain ; Norfair Post-Ridley: Bubble Mountain
    dw $078D, $97DA ; DDB
    dw $079B, $B167 ; MDB
    dw $090F, $D000 ; Screen subpixel X position.
    dw $0913, $9000 ; Screen subpixel Y position
    dw $0915, $0000 ; Screen Y position in pixels
    dw $09C2, $0553 ; Health
    dw $09C6, $00E1 ; Missiles
    dw $09CA, $0014 ; Supers
    dw $09CE, $0025 ; Pbs
    dw $0A1C, $008A ; Samus position/state
    dw $0A1E, $1504 ; More position/state
    dw $0AF6, $0025 ; Samus X
    dw $D91A, $0011 ; Events, Items, Doors
    dw #$FFFF
.after

preset_ngplasma_kraids_lair_entering_kraids_lair:
    dw #preset_ngplasma_norfair_postridley_business_center_revisit ; Norfair Post-Ridley: Business Center Revisit
    dw $078D, $92EE ; DDB
    dw $079B, $A6A1 ; MDB
    dw $07F3, $0012 ; Music Bank
    dw $07F5, $0003 ; Music Track
    dw $090F, $2000 ; Screen subpixel X position.
    dw $0913, $0000 ; Screen subpixel Y position
    dw $0A1C, $009B ; Samus position/state
    dw $0A1E, $0000 ; More position/state
    dw $0AF6, $0080 ; Samus X
    dw $0AFA, $0086 ; Samus Y
    dw #$FFFF
.after

preset_ngplasma_kraids_lair_warehouse_kihunters:
    dw #preset_ngplasma_kraids_lair_entering_kraids_lair ; Kraids Lair: Entering Kraids Lair
    dw $078D, $923A ; DDB
    dw $079B, $A471 ; MDB
    dw $07F5, $0005 ; Music Track
    dw $090F, $8000 ; Screen subpixel X position.
    dw $0911, $0100 ; Screen X position in pixels
    dw $0913, $0BFF ; Screen subpixel Y position
    dw $0915, $0100 ; Screen Y position in pixels
    dw $09CA, $0013 ; Supers
    dw $0A1C, $0027 ; Samus position/state
    dw $0A1E, $0508 ; More position/state
    dw $0AF6, $0167 ; Samus X
    dw $0AFA, $0190 ; Samus Y
    dw #$FFFF
.after

preset_ngplasma_kraids_lair_kraid_hallway:
    dw #preset_ngplasma_kraids_lair_warehouse_kihunters ; Kraids Lair: Warehouse Kihunters
    dw $078D, $9156 ; DDB
    dw $079B, $A4DA ; MDB
    dw $090F, $9000 ; Screen subpixel X position.
    dw $0913, $E7FF ; Screen subpixel Y position
    dw $0915, $00FA ; Screen Y position in pixels
    dw $09C6, $00E0 ; Missiles
    dw $0A1C, $0001 ; Samus position/state
    dw $0A1E, $0008 ; More position/state
    dw $0AF6, $016B ; Samus X
    dw $0AFA, $018B ; Samus Y
    dw $D91A, $0012 ; Events, Items, Doors
    dw #$FFFF
.after

preset_ngplasma_kraids_lair_kraid:
    dw #preset_ngplasma_kraids_lair_kraid_hallway ; Kraids Lair: Kraid Hallway
    dw $078D, $919E ; DDB
    dw $079B, $A56B ; MDB
    dw $07F3, $0027 ; Music Bank
    dw $07F5, $0006 ; Music Track
    dw $090F, $5000 ; Screen subpixel X position.
    dw $0913, $9000 ; Screen subpixel Y position
    dw $0915, $0100 ; Screen Y position in pixels
    dw $0AF6, $01D4 ; Samus X
    dw $D8B8, $0024 ; Events, Items, Doors
    dw #$FFFF
.after

preset_ngplasma_kraids_lair_leaving_kraid:
    dw #preset_ngplasma_kraids_lair_kraid ; Kraids Lair: Kraid
    dw $078D, $91B6 ; DDB
    dw $079B, $A59F ; MDB
    dw $07F5, $0003 ; Music Track
    dw $090F, $4000 ; Screen subpixel X position.
    dw $0911, $0000 ; Screen X position in pixels
    dw $0913, $B400 ; Screen subpixel Y position
    dw $09C2, $0547 ; Health
    dw $09CA, $000F ; Supers
    dw $09CE, $0024 ; Pbs
    dw $0A1C, $0002 ; Samus position/state
    dw $0A1E, $0004 ; More position/state
    dw $0AF6, $0054 ; Samus X
    dw $D828, $0100 ; Events, Items, Doors
    dw $D8B8, $00A4 ; Events, Items, Doors
    dw #$FFFF
.after

preset_ngplasma_kraids_lair_kraid_hallway_revisit:
    dw #preset_ngplasma_kraids_lair_leaving_kraid ; Kraids Lair: Leaving Kraid
    dw $078D, $91CE ; DDB
    dw $079B, $A56B ; MDB
    dw $090F, $0000 ; Screen subpixel X position.
    dw $0913, $5400 ; Screen subpixel Y position
    dw $09C2, $0542 ; Health
    dw $0AF6, $005B ; Samus X
    dw #$FFFF
.after

preset_ngplasma_kraids_lair_warehouse_zealas:
    dw #preset_ngplasma_kraids_lair_kraid_hallway_revisit ; Kraids Lair: Kraid Hallway Revisit
    dw $078D, $9192 ; DDB
    dw $079B, $A4DA ; MDB
    dw $07F3, $0012 ; Music Bank
    dw $07F5, $0005 ; Music Track
    dw $090F, $D000 ; Screen subpixel X position.
    dw $0911, $0104 ; Screen X position in pixels
    dw $0913, $AC00 ; Screen subpixel Y position
    dw $0915, $0000 ; Screen Y position in pixels
    dw $09C2, $0556 ; Health
    dw $09C6, $00DC ; Missiles
    dw $09CA, $0013 ; Supers
    dw $0AF6, $0173 ; Samus X
    dw $0AFA, $00AB ; Samus Y
    dw $D8B8, $00AC ; Events, Items, Doors
    dw $D91A, $0013 ; Events, Items, Doors
    dw #$FFFF
.after

preset_ngplasma_kraids_lair_leaving_kraids_lair:
    dw #preset_ngplasma_kraids_lair_warehouse_zealas ; Kraids Lair: Warehouse Zealas
    dw $078D, $913E ; DDB
    dw $079B, $A6A1 ; MDB
    dw $07F5, $0003 ; Music Track
    dw $090F, $A000 ; Screen subpixel X position.
    dw $0911, $0200 ; Screen X position in pixels
    dw $0913, $9000 ; Screen subpixel Y position
    dw $0915, $001C ; Screen Y position in pixels
    dw $09C6, $00DE ; Missiles
    dw $0AF6, $02BD ; Samus X
    dw $0AFA, $009B ; Samus Y
    dw #$FFFF
.after

preset_ngplasma_maridia_entering_maridia:
    dw #preset_ngplasma_kraids_lair_leaving_kraids_lair ; Kraids Lair: Leaving Kraids Lair
    dw $090F, $6000 ; Screen subpixel X position.
    dw $0911, $0000 ; Screen X position in pixels
    dw $0913, $8BFF ; Screen subpixel Y position
    dw $0915, $0000 ; Screen Y position in pixels
    dw $09CA, $0012 ; Supers
    dw $0AF6, $0067 ; Samus X
    dw $0AFA, $008B ; Samus Y
    dw #$FFFF
.after

preset_ngplasma_maridia_fish_tank:
    dw #preset_ngplasma_maridia_entering_maridia ; Maridia: Entering Maridia
    dw $078D, $A330 ; DDB
    dw $079B, $CFC9 ; MDB
    dw $07F3, $001B ; Music Bank
    dw $07F5, $0006 ; Music Track
    dw $090F, $2FFF ; Screen subpixel X position.
    dw $0911, $0103 ; Screen X position in pixels
    dw $0913, $2400 ; Screen subpixel Y position
    dw $0915, $05F1 ; Screen Y position in pixels
    dw $0A1C, $0001 ; Samus position/state
    dw $0A1E, $0008 ; More position/state
    dw $0AF6, $016B ; Samus X
    dw $0AFA, $068B ; Samus Y
    dw $D91A, $0015 ; Events, Items, Doors
    dw #$FFFF
.after

preset_ngplasma_maridia_mt_everest:
    dw #preset_ngplasma_maridia_fish_tank ; Maridia: Fish Tank
    dw $078D, $A3F0 ; DDB
    dw $079B, $D0B9 ; MDB
    dw $090F, $C000 ; Screen subpixel X position.
    dw $0911, $010B ; Screen X position in pixels
    dw $0913, $8C00 ; Screen subpixel Y position
    dw $0915, $031F ; Screen Y position in pixels
    dw $0AF6, $0187 ; Samus X
    dw $0AFA, $03BB ; Samus Y
    dw #$FFFF
.after

preset_ngplasma_maridia_botwoon:
    dw #preset_ngplasma_maridia_mt_everest ; Maridia: Mt Everest
    dw $078D, $A468 ; DDB
    dw $079B, $D1A3 ; MDB
    dw $090F, $9000 ; Screen subpixel X position.
    dw $0911, $0100 ; Screen X position in pixels
    dw $0913, $B400 ; Screen subpixel Y position
    dw $0915, $0300 ; Screen Y position in pixels
    dw $09C2, $051A ; Health
    dw $09CA, $0011 ; Supers
    dw $0A1C, $0027 ; Samus position/state
    dw $0A1E, $0508 ; More position/state
    dw $0AF6, $01B5 ; Samus X
    dw $0AFA, $0390 ; Samus Y
    dw $D8C0, $8074 ; Events, Items, Doors
    dw #$FFFF
.after

preset_ngplasma_maridia_aqueduct:
    dw #preset_ngplasma_maridia_botwoon ; Maridia: Botwoon
    dw $078D, $A72C ; DDB
    dw $079B, $D617 ; MDB
    dw $07F5, $0005 ; Music Track
    dw $0911, $0300 ; Screen X position in pixels
    dw $0913, $F800 ; Screen subpixel Y position
    dw $0915, $0011 ; Screen Y position in pixels
    dw $09CE, $0023 ; Pbs
    dw $0A1C, $0001 ; Samus position/state
    dw $0A1E, $0008 ; More position/state
    dw $0AF6, $03A6 ; Samus X
    dw $0AFA, $008B ; Samus Y
    dw $D91A, $0017 ; Events, Items, Doors
    dw #$FFFF
.after

preset_ngplasma_maridia_halfie:
    dw #preset_ngplasma_maridia_aqueduct ; Maridia: Aqueduct
    dw $078D, $A918 ; DDB
    dw $079B, $D7E4 ; MDB
    dw $090F, $1000 ; Screen subpixel X position.
    dw $0911, $0000 ; Screen X position in pixels
    dw $0913, $9400 ; Screen subpixel Y position
    dw $0915, $001F ; Screen Y position in pixels
    dw $09C2, $05DB ; Health
    dw $09C6, $00DF ; Missiles
    dw $09CA, $0013 ; Supers
    dw $0AF6, $0079 ; Samus X
    dw $0AFA, $009B ; Samus Y
    dw $D82C, $0002 ; Events, Items, Doors
    dw $D91A, $0018 ; Events, Items, Doors
    dw #$FFFF
.after

preset_ngplasma_maridia_draygon:
    dw #preset_ngplasma_maridia_halfie ; Maridia: Halfie
    dw $078D, $A7F8 ; DDB
    dw $079B, $D78F ; MDB
    dw $090F, $2000 ; Screen subpixel X position.
    dw $0913, $9C00 ; Screen subpixel Y position
    dw $0915, $0200 ; Screen Y position in pixels
    dw $09C2, $056F ; Health
    dw $09C6, $00E1 ; Missiles
    dw $09CA, $0011 ; Supers
    dw $0A1C, $0002 ; Samus position/state
    dw $0A1E, $0004 ; More position/state
    dw $0AF6, $005C ; Samus X
    dw $0AFA, $028B ; Samus Y
    dw $D8C2, $0C00 ; Events, Items, Doors
    dw $D91A, $0019 ; Events, Items, Doors
    dw #$FFFF
.after

preset_ngplasma_maridia_womple_jump:
    dw #preset_ngplasma_maridia_draygon ; Maridia: Draygon
    dw $078D, $A96C ; DDB
    dw $090F, $4000 ; Screen subpixel X position.
    dw $0913, $3000 ; Screen subpixel Y position
    dw $0915, $0000 ; Screen Y position in pixels
    dw $09C2, $0525 ; Health
    dw $09C6, $00DD ; Missiles
    dw $0A68, $0001 ; Flash suit
    dw $0AF6, $0040 ; Samus X
    dw $0AFA, $008B ; Samus Y
    dw $D82C, $0003 ; Events, Items, Doors
    dw $D8C2, $4C00 ; Events, Items, Doors
    dw $D91A, $001A ; Events, Items, Doors
    dw #$FFFF
.after

preset_ngplasma_maridia_reverse_botwoon_hallway:
    dw #preset_ngplasma_maridia_womple_jump ; Maridia: Draygon
    dw $078D, $A7E0 ; DDB
    dw $079B, $D913 ; MDB
    dw $090F, $0000 ; Screen subpixel X position.
    dw $0913, $3000 ; Screen subpixel Y position
    dw $09C2, $04ED ; Health
    dw $09C6, $00D5 ; Missiles
    dw $0AF6, $00A1 ; Samus X
    dw $D82C, $0003 ; Events, Items, Doors
    dw $D8C2, $4C00 ; Events, Items, Doors
    dw $D91A, $001A ; Events, Items, Doors
    dw #$FFFF
.after

preset_ngplasma_maridia_aqueduct_revisit:
    dw #preset_ngplasma_maridia_reverse_botwoon_hallway ; Maridia: Reverse Botwoon Hallway
    dw $078D, $A90C ; DDB
    dw $079B, $D617 ; MDB
    dw $090F, $5000 ; Screen subpixel X position.
    dw $0913, $8BFF ; Screen subpixel Y position
    dw $0915, $001B ; Screen Y position in pixels
    dw $0AF6, $009C ; Samus X
    dw $0AFA, $008B ; Samus Y
    dw $D8C2, $6C00 ; Events, Items, Doors
    dw $D91A, $001B ; Events, Items, Doors
    dw #$FFFF
.after

preset_ngplasma_maridia_crab_shaft_revisit:
    dw #preset_ngplasma_maridia_aqueduct_revisit ; Maridia: Aqueduct Revisit
    dw $078D, $A768 ; DDB
    dw $079B, $D5A7 ; MDB
    dw $090F, $8000 ; Screen subpixel X position.
    dw $0911, $0002 ; Screen X position in pixels
    dw $0913, $0000 ; Screen subpixel Y position
    dw $0915, $00F9 ; Screen Y position in pixels
    dw $0AF6, $0070 ; Samus X
    dw $0AFA, $018B ; Samus Y
    dw $D91A, $001D ; Events, Items, Doors
    dw #$FFFF
.after

preset_ngplasma_maridia_mt_everest_revisit:
    dw #preset_ngplasma_maridia_crab_shaft_revisit ; Maridia: Crab Shaft Revisit
    dw $078D, $A708 ; DDB
    dw $079B, $D1A3 ; MDB
    dw $07F5, $0006 ; Music Track
    dw $0911, $0000 ; Screen X position in pixels
    dw $0913, $CFFF ; Screen subpixel Y position
    dw $0915, $0210 ; Screen Y position in pixels
    dw $0AFA, $028B ; Samus Y
    dw #$FFFF
.after

preset_ngplasma_crateria_red_brinstar_gate:
    dw #preset_ngplasma_maridia_mt_everest_revisit ; Maridia: Womple Jump
    dw $078D, $A42C ; DDB
    dw $079B, $D104 ; MDB
    dw $090F, $3801 ; Screen subpixel X position.
    dw $0913, $2800 ; Screen subpixel Y position
    dw $0915, $0000 ; Screen Y position in pixels
    dw $0AF6, $007C ; Samus X
    dw $0AFA, $008B ; Samus Y
    dw #$FFFF
.after

preset_ngplasma_crateria_crateria_kihunters_final:
    dw #preset_ngplasma_crateria_red_brinstar_gate ; Crateria: Red Brinstar Gate
    dw $078D, $90BA ; DDB
    dw $079B, $962A ; MDB
    dw $07F3, $0012 ; Music Bank
    dw $07F5, $0003 ; Music Track
    dw $090F, $2000 ; Screen subpixel X position.
    dw $0913, $5800 ; Screen subpixel Y position
    dw $09CA, $0010 ; Supers
    dw $0A1C, $0001 ; Samus position/state
    dw $0A1E, $0008 ; More position/state
    dw $0AF6, $006E ; Samus X
    dw $0AFA, $005B ; Samus Y
    dw #$FFFF
.after

preset_ngplasma_crateria_landing_site:
    dw #preset_ngplasma_crateria_crateria_kihunters_final ; Crateria: Crateria Kihunters Final
    dw $078D, $8AF6 ; DDB
    dw $079B, $948C ; MDB
    dw $07F5, $0005 ; Music Track
    dw $090F, $A400 ; Screen subpixel X position.
    dw $0911, $00BC ; Screen X position in pixels
    dw $0913, $9800 ; Screen subpixel Y position
    dw $09C6, $00D4 ; Missiles
    dw $0A1C, $0002 ; Samus position/state
    dw $0A1E, $0004 ; More position/state
    dw $0AF6, $0134 ; Samus X
    dw $0AFA, $00AB ; Samus Y
    dw #$FFFF
.after

preset_ngplasma_crateria_terminator_etank:
    dw #preset_ngplasma_crateria_landing_site ; Crateria: Landing Site
    dw $078D, $8916 ; DDB
    dw $079B, $92FD ; MDB
    dw $07F3, $0009 ; Music Bank
    dw $090F, $6000 ; Screen subpixel X position.
    dw $0911, $0100 ; Screen X position in pixels
    dw $0913, $0800 ; Screen subpixel Y position
    dw $09C6, $00D6 ; Missiles
    dw $0AF6, $0130 ; Samus X
    dw $0AFA, $009B ; Samus Y
    dw #$FFFF
.after

preset_ngplasma_crateria_green_pirate_shaft:
    dw #preset_ngplasma_crateria_terminator_etank ; Crateria: Terminator Etank
    dw $078D, $895E ; DDB
    dw $079B, $990D ; MDB
    dw $090F, $F500 ; Screen subpixel X position.
    dw $0911, $0000 ; Screen X position in pixels
    dw $0913, $0000 ; Screen subpixel Y position
    dw $0915, $01FA ; Screen Y position in pixels
    dw $0AF6, $005C ; Samus X
    dw $0AFA, $029A ; Samus Y
    dw $D91A, $001E ; Events, Items, Doors
    dw #$FFFF
.after

preset_ngplasma_tourian_metroids_1:
    dw #preset_ngplasma_crateria_green_pirate_shaft ; Crateria: Green Pirate Shaft
    dw $078D, $9222 ; DDB
    dw $079B, $DAAE ; MDB
    dw $07F3, $001E ; Music Bank
    dw $090F, $0001 ; Screen subpixel X position.
    dw $0913, $93FF ; Screen subpixel Y position
    dw $0915, $0300 ; Screen Y position in pixels
    dw $09C2, $050B ; Health
    dw $09C6, $00D8 ; Missiles
    dw $09CA, $000F ; Supers
    dw $0AF6, $003A ; Samus X
    dw $0AFA, $038B ; Samus Y
    dw $D820, $0FC1 ; Events, Items, Doors
    dw $D8B2, $4001 ; Events, Items, Doors
    dw $D90C, $0100 ; Events, Items, Doors
    dw $D91A, $0020 ; Events, Items, Doors
    dw #$FFFF
.after

preset_ngplasma_tourian_metroids_2:
    dw #preset_ngplasma_tourian_metroids_1 ; Tourian: Metroids 1
    dw $078D, $A984 ; DDB
    dw $079B, $DAE1 ; MDB
    dw $090F, $2000 ; Screen subpixel X position.
    dw $0913, $7400 ; Screen subpixel Y position
    dw $0915, $0000 ; Screen Y position in pixels
    dw $09C2, $0502 ; Health
    dw $09C6, $00DA ; Missiles
    dw $09CA, $000C ; Supers
    dw $09CE, $0025 ; Pbs
    dw $0AF6, $003C ; Samus X
    dw $0AFA, $008B ; Samus Y
    dw $D822, $0001 ; Events, Items, Doors
    dw $D8C4, $0001 ; Events, Items, Doors
    dw #$FFFF
.after

preset_ngplasma_tourian_metroids_3:
    dw #preset_ngplasma_tourian_metroids_2 ; Tourian: Metroids 2
    dw $078D, $A9B4 ; DDB
    dw $079B, $DB31 ; MDB
    dw $090F, $A000 ; Screen subpixel X position.
    dw $0913, $B400 ; Screen subpixel Y position
    dw $0915, $011F ; Screen Y position in pixels
    dw $09C2, $0557 ; Health
    dw $09C6, $00E4 ; Missiles
    dw $09CE, $0026 ; Pbs
    dw $0A1C, $0001 ; Samus position/state
    dw $0A1E, $0008 ; More position/state
    dw $0AF6, $00C0 ; Samus X
    dw $0AFA, $018B ; Samus Y
    dw $D822, $0003 ; Events, Items, Doors
    dw $D8C4, $0003 ; Events, Items, Doors
    dw #$FFFF
.after

preset_ngplasma_tourian_metroids_4:
    dw #preset_ngplasma_tourian_metroids_3 ; Tourian: Metroids 3
    dw $078D, $A9CC ; DDB
    dw $079B, $DB7D ; MDB
    dw $090F, $4000 ; Screen subpixel X position.
    dw $0911, $0500 ; Screen X position in pixels
    dw $0915, $0000 ; Screen Y position in pixels
    dw $09C2, $0589 ; Health
    dw $09C6, $00E6 ; Missiles
    dw $09CA, $0010 ; Supers
    dw $09CE, $0028 ; Pbs
    dw $0AF6, $05A8 ; Samus X
    dw $0AFA, $008B ; Samus Y
    dw $D822, $0007 ; Events, Items, Doors
    dw $D8C4, $0007 ; Events, Items, Doors
    dw #$FFFF
.after

preset_ngplasma_tourian_baby_skip:
    dw #preset_ngplasma_tourian_metroids_4 ; Tourian: Metroids 4
    dw $078D, $AA14 ; DDB
    dw $079B, $DC65 ; MDB
    dw $07F3, $0045 ; Music Bank
    dw $07F5, $0006 ; Music Track
    dw $090F, $9000 ; Screen subpixel X position.
    dw $0911, $0100 ; Screen X position in pixels
    dw $0913, $0C00 ; Screen subpixel Y position
    dw $09C2, $05DB ; Health
    dw $09CA, $0013 ; Supers
    dw $09CE, $002A ; Pbs
    dw $0A1C, $0002 ; Samus position/state
    dw $0A1E, $0004 ; More position/state
    dw $0AF6, $01D7 ; Samus X
    dw $0AFA, $00AB ; Samus Y
    dw $D822, $000F ; Events, Items, Doors
    dw $D8C4, $000F ; Events, Items, Doors
    dw #$FFFF
.after

preset_ngplasma_tourian_gadora_room:
    dw #preset_ngplasma_tourian_baby_skip ; Tourian: Baby Skip
    dw $078D, $AA44 ; DDB
    dw $079B, $DCFF ; MDB
    dw $07F3, $001E ; Music Bank
    dw $07F5, $0005 ; Music Track
    dw $090F, $C000 ; Screen subpixel X position.
    dw $0911, $0000 ; Screen X position in pixels
    dw $0913, $1000 ; Screen subpixel Y position
    dw $0915, $011F ; Screen Y position in pixels
    dw $09CA, $0012 ; Supers
    dw $0A1C, $0001 ; Samus position/state
    dw $0A1E, $0008 ; More position/state
    dw $0AF6, $00C0 ; Samus X
    dw $0AFA, $019B ; Samus Y
    dw $D8C4, $00AF ; Events, Items, Doors
    dw #$FFFF
.after

preset_ngplasma_tourian_zeb_skip:
    dw #preset_ngplasma_tourian_gadora_room ; Tourian: Gadora Room
    dw $078D, $AAA4 ; DDB
    dw $079B, $DDF3 ; MDB
    dw $090F, $3000 ; Screen subpixel X position.
    dw $0913, $0000 ; Screen subpixel Y position
    dw $0915, $0219 ; Screen Y position in pixels
    dw $09CA, $0010 ; Supers
    dw $0A1C, $0002 ; Samus position/state
    dw $0A1E, $0004 ; More position/state
    dw $0AF6, $003E ; Samus X
    dw $0AFA, $028B ; Samus Y
    dw $D8C4, $03AF ; Events, Items, Doors
    dw #$FFFF
.after

preset_ngplasma_tourian_escape_room_3:
    dw #preset_ngplasma_tourian_zeb_skip ; Tourian: Zeb Skip
    dw $078D, $AAEC ; DDB
    dw $079B, $DE7A ; MDB
    dw $07F3, $0024 ; Music Bank
    dw $07F5, $0007 ; Music Track
    dw $090F, $BFFF ; Screen subpixel X position.
    dw $0913, $2800 ; Screen subpixel Y position
    dw $0915, $0100 ; Screen Y position in pixels
    dw $09A6, $1009 ; Beams
    dw $09C6, $0045 ; Missiles
    dw $09CA, $0000 ; Supers
    dw $09CE, $0000 ; Pbs
    dw $0A1C, $0001 ; Samus position/state
    dw $0A1E, $0008 ; More position/state
    dw $0A76, $8000 ; Hyper beam
    dw $0AF6, $00DC ; Samus X
    dw $0AFA, $018B ; Samus Y
    dw $D820, $4FCD ; Events, Items, Doors
    dw $D82C, $0203 ; Events, Items, Doors
    dw #$FFFF
.after

preset_ngplasma_tourian_escape_room_4:
    dw #preset_ngplasma_tourian_escape_room_3 ; Tourian: Escape Room 3
    dw $078D, $AB04 ; DDB
    dw $079B, $DEA7 ; MDB
    dw $090F, $4000 ; Screen subpixel X position.
    dw $0911, $0500 ; Screen X position in pixels
    dw $0913, $0000 ; Screen subpixel Y position
    dw $0915, $001C ; Screen Y position in pixels
    dw $0AF6, $05DC ; Samus X
    dw $0AFA, $008B ; Samus Y
    dw #$FFFF
.after

preset_ngplasma_tourian_escape_parlor:
    dw #preset_ngplasma_tourian_escape_room_4 ; Tourian: Escape Room 4
    dw $078D, $AB34 ; DDB
    dw $079B, $96BA ; MDB
    dw $090F, $A000 ; Screen subpixel X position.
    dw $0911, $0100 ; Screen X position in pixels
    dw $0913, $6801 ; Screen subpixel Y position
    dw $0915, $0000 ; Screen Y position in pixels
    dw $09C2, $0548 ; Health
    dw $0A1C, $0002 ; Samus position/state
    dw $0A1E, $0004 ; More position/state
    dw $0AF6, $01CD ; Samus X
    dw $0AFA, $004B ; Samus Y
    dw $D90C, $FF00 ; Events, Items, Doors
    dw #$FFFF
.after
