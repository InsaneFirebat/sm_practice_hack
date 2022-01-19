
preset_nghyper_ceres_station_ceres_elevator:
    dw #$0000
    dw $078B, $0000 ; Elevator Index
    dw $078D, $AB58 ; DDB
    dw $079B, $DF45 ; MDB
    dw $07F3, $002D ; Music Bank
    dw $07F5, $0006 ; Music Track
    dw $090F, $0000 ; Screen subpixel X position.
    dw $0911, $0000 ; Screen X position in pixels
    dw $0913, $0000 ; Screen subpixel Y position
    dw $0915, $0000 ; Screen Y position in pixels
    dw $093F, $0000 ; Ceres escape flag
    dw $09A2, $0000 ; Equipped Items
    dw $09A4, $0000 ; Collected Items
    dw $09A6, $0000 ; Beams
    dw $09A8, $0000 ; Beams
    dw $09C0, $0000 ; Manual/Auto reserve tank
    dw $09C2, $0063 ; Health
    dw $09C4, $0063 ; Max health
    dw $09C6, $0000 ; Missiles
    dw $09C8, $0000 ; Max missiles
    dw $09CA, $0000 ; Supers
    dw $09CC, $0000 ; Max supers
    dw $09CE, $0000 ; Pbs
    dw $09D0, $0000 ; Max pbs
    dw $09D2, $0000 ; Currently selected item
    dw $09D4, $0000 ; Max reserves
    dw $09D6, $0000 ; Reserves
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
    dw $D8F8, $0000 ; Events, Items, Doors
    dw $D90C, $0000 ; Events, Items, Doors
    dw $D914, $0000 ; Events, Items, Doors
    dw $D918, $0000 ; Events, Items, Doors
    dw $D91A, $0000 ; Events, Items, Doors
    dw $D91C, $0000 ; Events, Items, Doors
    dw #$FFFF
.after

preset_nghyper_ceres_station_magnet_stairs:
    dw #preset_nghyper_ceres_station_ceres_elevator ; Ceres Station: Ceres Elevator
    dw $078D, $AB4C ; DDB
    dw $079B, $DF8D ; MDB
    dw $090F, $AB00 ; Screen subpixel X position.
    dw $0911, $0100 ; Screen X position in pixels
    dw $0913, $3800 ; Screen subpixel Y position
    dw $0A1C, $0001 ; Samus position/state
    dw $0A1E, $0008 ; More position/state
    dw $0AF6, $01BA ; Samus X
    dw $0AFA, $0099 ; Samus Y
    dw #$FFFF
.after

preset_nghyper_ceres_station_ceres_ridley:
    dw #preset_nghyper_ceres_station_magnet_stairs ; Ceres Station: Magnet Stairs
    dw $078D, $AB94 ; DDB
    dw $079B, $E06B ; MDB
    dw $090F, $6000 ; Screen subpixel X position.
    dw $0913, $0000 ; Screen subpixel Y position
    dw $09CE, $0031 ; Pbs
    dw $0AF6, $01B3 ; Samus X
    dw $0AFA, $008B ; Samus Y
    dw #$FFFF
.after

preset_nghyper_ceres_station_magnet_stairs_escape:
    dw #preset_nghyper_ceres_station_ceres_ridley ; Ceres Station: Ceres Ridley
    dw $078D, $ABA0 ; DDB
    dw $079B, $E021 ; MDB
    dw $07F3, $0024 ; Music Bank
    dw $07F5, $0007 ; Music Track
    dw $090F, $DE00 ; Screen subpixel X position.
    dw $0911, $0000 ; Screen X position in pixels
    dw $0913, $6C00 ; Screen subpixel Y position
    dw $093F, $0002 ; Ceres escape flag
    dw $09C2, $0001 ; Health
    dw $09CE, $0030 ; Pbs
    dw $0A1C, $0002 ; Samus position/state
    dw $0A1E, $0004 ; More position/state
    dw $0AF6, $0040 ; Samus X
    dw $0AFA, $0094 ; Samus Y
    dw $D82E, $0001 ; Events, Items, Doors
    dw #$FFFF
.after

preset_nghyper_wrecked_ship_ship:
    dw #preset_nghyper_ceres_station_magnet_stairs_escape ; Ceres Station: Magnet Stairs Escape
    dw $078D, $88FE ; DDB
    dw $079B, $91F8 ; MDB
    dw $07F3, $000C ; Music Bank
    dw $07F5, $0005 ; Music Track
    dw $090F, $0000 ; Screen subpixel X position.
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
    dw $D91C, $1010 ; Events, Items, Doors
    dw #$FFFF
.after

preset_nghyper_wrecked_ship_moat:
    dw #preset_nghyper_wrecked_ship_ship ; Wrecked Ship: Ship
    dw $078D, $8AD2 ; DDB
    dw $079B, $948C ; MDB
    dw $090F, $C000 ; Screen subpixel X position.
    dw $0911, $0200 ; Screen X position in pixels
    dw $0913, $8C00 ; Screen subpixel Y position
    dw $0915, $0000 ; Screen Y position in pixels
    dw $09C6, $00E5 ; Missiles
    dw $09CA, $0031 ; Supers
    dw $09CE, $002F ; Pbs
    dw $0A1C, $0001 ; Samus position/state
    dw $0A1E, $0008 ; More position/state
    dw $0AF6, $02B4 ; Samus X
    dw $0AFA, $008B ; Samus Y
    dw $D8B0, $2001 ; Events, Items, Doors
    dw #$FFFF
.after

preset_nghyper_wrecked_ship_ocean:
    dw #preset_nghyper_wrecked_ship_moat ; Wrecked Ship: Moat
    dw $078D, $8A36 ; DDB
    dw $079B, $95FF ; MDB
    dw $0911, $0100 ; Screen X position in pixels
    dw $0913, $EC00 ; Screen subpixel Y position
    dw $0AF6, $01A5 ; Samus X
    dw $D91A, $0001 ; Events, Items, Doors
    dw #$FFFF
.after

preset_nghyper_wrecked_ship_entering_wrecked_ship:
    dw #preset_nghyper_wrecked_ship_ocean ; Wrecked Ship: Ocean
    dw $078D, $8AEA ; DDB
    dw $079B, $93FE ; MDB
    dw $0911, $0700 ; Screen X position in pixels
    dw $0913, $0000 ; Screen subpixel Y position
    dw $0915, $040F ; Screen Y position in pixels
    dw $09CA, $0030 ; Supers
    dw $0AF6, $0799 ; Samus X
    dw $0AFA, $049B ; Samus Y
    dw $D8B0, $3001 ; Events, Items, Doors
    dw $D91A, $0004 ; Events, Items, Doors
    dw #$FFFF
.after

preset_nghyper_wrecked_ship_phantoon:
    dw #preset_nghyper_wrecked_ship_entering_wrecked_ship ; Wrecked Ship: Entering Wrecked Ship
    dw $078D, $A21C ; DDB
    dw $079B, $CC6F ; MDB
    dw $07F3, $0030 ; Music Bank
    dw $0911, $0400 ; Screen X position in pixels
    dw $0913, $0400 ; Screen subpixel Y position
    dw $0915, $0000 ; Screen Y position in pixels
    dw $09CA, $002E ; Supers
    dw $09CE, $002E ; Pbs
    dw $0AF6, $04CF ; Samus X
    dw $0AFA, $008B ; Samus Y
    dw $D8C0, $0030 ; Events, Items, Doors
    dw $D91A, $0005 ; Events, Items, Doors
    dw #$FFFF
.after

preset_nghyper_wrecked_ship_wrecked_ship_shaft:
    dw #preset_nghyper_wrecked_ship_phantoon ; Wrecked Ship: Phantoon
    dw $078D, $A2C4 ; DDB
    dw $07F5, $0006 ; Music Track
    dw $090F, $0000 ; Screen subpixel X position.
    dw $0911, $021C ; Screen X position in pixels
    dw $0913, $3000 ; Screen subpixel Y position
    dw $09C2, $05D1 ; Health
    dw $09C6, $00E6 ; Missiles
    dw $0A1C, $0002 ; Samus position/state
    dw $0A1E, $0004 ; More position/state
    dw $0AF6, $02BC ; Samus X
    dw $0AFA, $006B ; Samus Y
    dw $D82A, $0100 ; Events, Items, Doors
    dw $D8C0, $0070 ; Events, Items, Doors
    dw #$FFFF
.after

preset_nghyper_wrecked_ship_leaving_wrecked_ship:
    dw #preset_nghyper_wrecked_ship_wrecked_ship_shaft ; Wrecked Ship: Wrecked Ship Shaft
    dw $078D, $A294 ; DDB
    dw $079B, $CAF6 ; MDB
    dw $090F, $1800 ; Screen subpixel X position.
    dw $0911, $0400 ; Screen X position in pixels
    dw $0913, $0800 ; Screen subpixel Y position
    dw $0915, $0318 ; Screen Y position in pixels
    dw $0AF6, $0466 ; Samus X
    dw $0AFA, $038B ; Samus Y
    dw $D8C0, $0074 ; Events, Items, Doors
    dw $D91A, $0006 ; Events, Items, Doors
    dw #$FFFF
.after

preset_nghyper_wrecked_ship_kihunters_revisit:
    dw #preset_nghyper_wrecked_ship_leaving_wrecked_ship ; Wrecked Ship: Leaving Wrecked Ship
    dw $078D, $89CA ; DDB
    dw $079B, $95FF ; MDB
    dw $07F3, $000C ; Music Bank
    dw $07F5, $0005 ; Music Track
    dw $090F, $DC00 ; Screen subpixel X position.
    dw $0911, $0000 ; Screen X position in pixels
    dw $0913, $0000 ; Screen subpixel Y position
    dw $0915, $0008 ; Screen Y position in pixels
    dw $0AF6, $003C ; Samus X
    dw $0AFA, $0098 ; Samus Y
    dw $D91A, $000A ; Events, Items, Doors
    dw #$FFFF
.after

preset_nghyper_red_tower_red_brinstar_elevator:
    dw #preset_nghyper_wrecked_ship_kihunters_revisit ; Wrecked Ship: Kihunters Revisit
    dw $078D, $8B02 ; DDB
    dw $079B, $A322 ; MDB
    dw $07F3, $0012 ; Music Bank
    dw $090F, $F000 ; Screen subpixel X position.
    dw $0915, $0238 ; Screen Y position in pixels
    dw $09CE, $002C ; Pbs
    dw $0A1C, $009B ; Samus position/state
    dw $0A1E, $0000 ; More position/state
    dw $0AF6, $0080 ; Samus X
    dw $0AFA, $02A8 ; Samus Y
    dw $D8B0, $7001 ; Events, Items, Doors
    dw $D8B2, $0001 ; Events, Items, Doors
    dw #$FFFF
.after

preset_nghyper_red_tower_hellway:
    dw #preset_nghyper_red_tower_red_brinstar_elevator ; Red Tower: Red Brinstar Elevator
    dw $090F, $8000 ; Screen subpixel X position.
    dw $0913, $EC00 ; Screen subpixel Y position
    dw $0915, $0500 ; Screen Y position in pixels
    dw $09CE, $002B ; Pbs
    dw $0A1C, $0002 ; Samus position/state
    dw $0A1E, $0004 ; More position/state
    dw $0AF6, $0099 ; Samus X
    dw $0AFA, $058B ; Samus Y
    dw $D8B6, $1000 ; Events, Items, Doors
    dw #$FFFF
.after

preset_nghyper_red_tower_red_tower_2:
    dw #preset_nghyper_red_tower_hellway ; Red Tower: Hellway
    dw $078D, $90AE ; DDB
    dw $079B, $A2F7 ; MDB
    dw $090F, $0001 ; Screen subpixel X position.
    dw $0913, $CC00 ; Screen subpixel Y position
    dw $0915, $0000 ; Screen Y position in pixels
    dw $0AF6, $0025 ; Samus X
    dw $0AFA, $008B ; Samus Y
    dw #$FFFF
.after

preset_nghyper_red_tower_skree_boost:
    dw #preset_nghyper_red_tower_red_tower_2 ; Red Tower: Red Tower
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

preset_nghyper_red_tower_below_spazer:
    dw #preset_nghyper_red_tower_skree_boost ; Red Tower: Skree Boost
    dw $078D, $9042 ; DDB
    dw $079B, $A3DD ; MDB
    dw $090F, $9FFF ; Screen subpixel X position.
    dw $0911, $0100 ; Screen X position in pixels
    dw $0913, $C000 ; Screen subpixel Y position
    dw $0915, $0000 ; Screen Y position in pixels
    dw $0AF6, $01DB ; Samus X
    dw $0AFA, $009B ; Samus Y
    dw #$FFFF
.after

preset_nghyper_red_tower_breaking_maridia_tube:
    dw #preset_nghyper_red_tower_below_spazer ; Red Tower: Below Spazer
    dw $078D, $9102 ; DDB
    dw $079B, $A408 ; MDB
    dw $090F, $2000 ; Screen subpixel X position.
    dw $0913, $B000 ; Screen subpixel Y position
    dw $0915, $0100 ; Screen Y position in pixels
    dw $09CA, $002F ; Supers
    dw $0AF6, $01AF ; Samus X
    dw $0AFA, $018B ; Samus Y
    dw #$FFFF
.after

preset_nghyper_norfair_preridley_business_center:
    dw #preset_nghyper_red_tower_breaking_maridia_tube ; Red Tower: Breaking Maridia Tube
    dw $078D, $9246 ; DDB
    dw $079B, $A7DE ; MDB
    dw $07F3, $0015 ; Music Bank
    dw $0911, $0000 ; Screen X position in pixels
    dw $0913, $0000 ; Screen subpixel Y position
    dw $0915, $0238 ; Screen Y position in pixels
    dw $09CE, $002A ; Pbs
    dw $0A1C, $009B ; Samus position/state
    dw $0A1E, $0000 ; More position/state
    dw $0AF6, $0080 ; Samus X
    dw $0AFA, $02A8 ; Samus Y
    dw $D820, $0800 ; Events, Items, Doors
    dw #$FFFF
.after

preset_nghyper_norfair_preridley_frog_speedway:
    dw #preset_nghyper_norfair_preridley_business_center ; Norfair Pre-Ridley: Business Center
    dw $090F, $7001 ; Screen subpixel X position.
    dw $0915, $051B ; Screen Y position in pixels
    dw $0A1C, $0001 ; Samus position/state
    dw $0A1E, $0008 ; More position/state
    dw $0AF6, $0043 ; Samus X
    dw $0AFA, $058B ; Samus Y
    dw #$FFFF
.after

preset_nghyper_norfair_preridley_kronic_boost:
    dw #preset_nghyper_norfair_preridley_frog_speedway ; Norfair Pre-Ridley: Frog Speedway
    dw $078D, $96BA ; DDB
    dw $079B, $AEB4 ; MDB
    dw $090F, $C000 ; Screen subpixel X position.
    dw $0911, $0200 ; Screen X position in pixels
    dw $0913, $CC00 ; Screen subpixel Y position
    dw $0915, $0000 ; Screen Y position in pixels
    dw $0AF6, $02DB ; Samus X
    dw $0AFA, $008B ; Samus Y
    dw $D91A, $000B ; Events, Items, Doors
    dw #$FFFF
.after

preset_nghyper_norfair_preridley_ln_main_hall:
    dw #preset_nghyper_norfair_preridley_kronic_boost ; Norfair Pre-Ridley: Kronic Boost
    dw $078D, $96F6 ; DDB
    dw $079B, $B236 ; MDB
    dw $07F3, $0018 ; Music Bank
    dw $090F, $2000 ; Screen subpixel X position.
    dw $0911, $0400 ; Screen X position in pixels
    dw $0913, $0000 ; Screen subpixel Y position
    dw $0915, $0200 ; Screen Y position in pixels
    dw $09C2, $05CE ; Health
    dw $0A1C, $009B ; Samus position/state
    dw $0A1E, $0000 ; More position/state
    dw $0AF6, $0480 ; Samus X
    dw $0AFA, $0288 ; Samus Y
    dw $D8BA, $0100 ; Events, Items, Doors
    dw #$FFFF
.after

preset_nghyper_norfair_preridley_fast_pillars_setup:
    dw #preset_nghyper_norfair_preridley_ln_main_hall ; Norfair Pre-Ridley: LN Main Hall
    dw $090F, $B000 ; Screen subpixel X position.
    dw $0911, $0700 ; Screen X position in pixels
    dw $0913, $B000 ; Screen subpixel Y position
    dw $0A1C, $0001 ; Samus position/state
    dw $0A1E, $0008 ; More position/state
    dw $0AF6, $07AE ; Samus X
    dw $0AFA, $028B ; Samus Y
    dw #$FFFF
.after

preset_nghyper_norfair_preridley_worst_room_in_the_game:
    dw #preset_nghyper_norfair_preridley_fast_pillars_setup ; Norfair Pre-Ridley: Fast Pillars Setup
    dw $078D, $9912 ; DDB
    dw $079B, $B457 ; MDB
    dw $090F, $EEFF ; Screen subpixel X position.
    dw $0911, $0300 ; Screen X position in pixels
    dw $0913, $F000 ; Screen subpixel Y position
    dw $0915, $0000 ; Screen Y position in pixels
    dw $09C2, $0591 ; Health
    dw $09CE, $002B ; Pbs
    dw $0AF6, $03DB ; Samus X
    dw $0AFA, $008B ; Samus Y
    dw #$FFFF
.after

preset_nghyper_norfair_preridley_amphitheatre:
    dw #preset_nghyper_norfair_preridley_worst_room_in_the_game ; Norfair Pre-Ridley: Worst Room in the Game
    dw $078D, $994E ; DDB
    dw $079B, $B4AD ; MDB
    dw $090F, $B000 ; Screen subpixel X position.
    dw $0911, $0000 ; Screen X position in pixels
    dw $0913, $0000 ; Screen subpixel Y position
    dw $0915, $011D ; Screen Y position in pixels
    dw $0AF6, $00A9 ; Samus X
    dw $0AFA, $018B ; Samus Y
    dw #$FFFF
.after

preset_nghyper_norfair_preridley_kihunter_stairs:
    dw #preset_nghyper_norfair_preridley_amphitheatre ; Norfair Pre-Ridley: Amphitheatre
    dw $078D, $997E ; DDB
    dw $079B, $B4E5 ; MDB
    dw $090F, $8300 ; Screen subpixel X position.
    dw $0911, $0242 ; Screen X position in pixels
    dw $0915, $0044 ; Screen Y position in pixels
    dw $09C2, $0596 ; Health
    dw $0AF6, $02DF ; Samus X
    dw $0AFA, $00B4 ; Samus Y
    dw #$FFFF
.after

preset_nghyper_norfair_preridley_wasteland:
    dw #preset_nghyper_norfair_preridley_kihunter_stairs ; Norfair Pre-Ridley: Kihunter Stairs
    dw $078D, $99A2 ; DDB
    dw $079B, $B585 ; MDB
    dw $090F, $7000 ; Screen subpixel X position.
    dw $0911, $0200 ; Screen X position in pixels
    dw $0913, $5C00 ; Screen subpixel Y position
    dw $0915, $0419 ; Screen Y position in pixels
    dw $09C2, $05AA ; Health
    dw $09CE, $0029 ; Pbs
    dw $0A1C, $0079 ; Samus position/state
    dw $0A1E, $1108 ; More position/state
    dw $0AF6, $0247 ; Samus X
    dw $0AFA, $0489 ; Samus Y
    dw $D8BA, $4100 ; Events, Items, Doors
    dw #$FFFF
.after

preset_nghyper_norfair_preridley_metal_pirates:
    dw #preset_nghyper_norfair_preridley_wasteland ; Norfair Pre-Ridley: Wasteland
    dw $078D, $99EA ; DDB
    dw $079B, $B5D5 ; MDB
    dw $090F, $4000 ; Screen subpixel X position.
    dw $0911, $0100 ; Screen X position in pixels
    dw $0913, $0000 ; Screen subpixel Y position
    dw $0915, $021B ; Screen Y position in pixels
    dw $09C2, $0571 ; Health
    dw $09CE, $0028 ; Pbs
    dw $0A1C, $0002 ; Samus position/state
    dw $0A1E, $0004 ; More position/state
    dw $0AF6, $0168 ; Samus X
    dw $0AFA, $028B ; Samus Y
    dw $D8BA, $C100 ; Events, Items, Doors
    dw $D91A, $000C ; Events, Items, Doors
    dw #$FFFF
.after

preset_nghyper_norfair_preridley_plowerhouse:
    dw #preset_nghyper_norfair_preridley_metal_pirates ; Norfair Pre-Ridley: Metal Pirates
    dw $078D, $9A1A ; DDB
    dw $079B, $B62B ; MDB
    dw $090F, $5000 ; Screen subpixel X position.
    dw $0911, $018B ; Screen X position in pixels
    dw $0913, $D400 ; Screen subpixel Y position
    dw $0915, $0000 ; Screen Y position in pixels
    dw $09C2, $05DB ; Health
    dw $09CA, $0032 ; Supers
    dw $0AF6, $01F3 ; Samus X
    dw $0AFA, $00BB ; Samus Y
    dw $D820, $0801 ; Events, Items, Doors
    dw #$FFFF
.after

preset_nghyper_norfair_preridley_ridley:
    dw #preset_nghyper_norfair_preridley_plowerhouse ; Norfair Pre-Ridley: Plowerhouse
    dw $078D, $995A ; DDB
    dw $079B, $B37A ; MDB
    dw $090F, $4000 ; Screen subpixel X position.
    dw $0911, $0000 ; Screen X position in pixels
    dw $0913, $0800 ; Screen subpixel Y position
    dw $09C2, $05D8 ; Health
    dw $09CA, $0031 ; Supers
    dw $0AF6, $0040 ; Samus X
    dw $0AFA, $009B ; Samus Y
    dw $D8BA, $D100 ; Events, Items, Doors
    dw $D8BC, $0001 ; Events, Items, Doors
    dw #$FFFF
.after

preset_nghyper_norfair_postridley_leaving_ridley:
    dw #preset_nghyper_norfair_preridley_ridley ; Norfair Pre-Ridley: Ridley
    dw $078D, $98CA ; DDB
    dw $079B, $B32E ; MDB
    dw $07F3, $0024 ; Music Bank
    dw $07F5, $0003 ; Music Track
    dw $090F, $0000 ; Screen subpixel X position.
    dw $0913, $1000 ; Screen subpixel Y position
    dw $0915, $011F ; Screen Y position in pixels
    dw $09C2, $056A ; Health
    dw $0A1C, $0001 ; Samus position/state
    dw $0A1E, $0008 ; More position/state
    dw $0AF6, $0063 ; Samus X
    dw $0AFA, $019B ; Samus Y
    dw $D82A, $0101 ; Events, Items, Doors
    dw #$FFFF
.after

preset_nghyper_norfair_postridley_reverse_plowerhouse:
    dw #preset_nghyper_norfair_postridley_leaving_ridley ; Norfair Post-Ridley: Leaving Ridley
    dw $078D, $98BE ; DDB
    dw $079B, $B37A ; MDB
    dw $07F3, $0018 ; Music Bank
    dw $07F5, $0005 ; Music Track
    dw $090F, $8000 ; Screen subpixel X position.
    dw $0911, $0200 ; Screen X position in pixels
    dw $0913, $4000 ; Screen subpixel Y position
    dw $0915, $0000 ; Screen Y position in pixels
    dw $09C2, $0567 ; Health
    dw $0AF6, $02C1 ; Samus X
    dw $0AFA, $008B ; Samus Y
    dw $D8BA, $D500 ; Events, Items, Doors
    dw #$FFFF
.after

preset_nghyper_norfair_postridley_wasteland_revisit:
    dw #preset_nghyper_norfair_postridley_reverse_plowerhouse ; Norfair Post-Ridley: Reverse Plowerhouse
    dw $078D, $9966 ; DDB
    dw $079B, $B62B ; MDB
    dw $090F, $4000 ; Screen subpixel X position.
    dw $0913, $E400 ; Screen subpixel Y position
    dw $09C2, $0547 ; Health
    dw $0A1C, $0089 ; Samus position/state
    dw $0A1E, $1508 ; More position/state
    dw $0AF6, $02DB ; Samus X
    dw $0AFA, $00AB ; Samus Y
    dw #$FFFF
.after

preset_nghyper_norfair_postridley_kihunter_stairs_revisit:
    dw #preset_nghyper_norfair_postridley_wasteland_revisit ; Norfair Post-Ridley: Wasteland Revisit
    dw $078D, $9A3E ; DDB
    dw $079B, $B5D5 ; MDB
    dw $090F, $8900 ; Screen subpixel X position.
    dw $0911, $0500 ; Screen X position in pixels
    dw $0913, $9400 ; Screen subpixel Y position
    dw $09C2, $04ED ; Health
    dw $09CE, $0027 ; Pbs
    dw $0A1C, $0002 ; Samus position/state
    dw $0A1E, $0004 ; More position/state
    dw $0AF6, $058C ; Samus X
    dw $0AFA, $005B ; Samus Y
    dw $D91A, $000D ; Events, Items, Doors
    dw #$FFFF
.after

preset_nghyper_norfair_postridley_fireflea_room:
    dw #preset_nghyper_norfair_postridley_kihunter_stairs_revisit ; Norfair Post-Ridley: Kihunter Stairs Revisit
    dw $078D, $9A26 ; DDB
    dw $079B, $B585 ; MDB
    dw $090F, $CF00 ; Screen subpixel X position.
    dw $0911, $0000 ; Screen X position in pixels
    dw $0913, $8000 ; Screen subpixel Y position
    dw $0915, $0008 ; Screen Y position in pixels
    dw $09CE, $0026 ; Pbs
    dw $0A1C, $0001 ; Samus position/state
    dw $0A1E, $0008 ; More position/state
    dw $0AF6, $00B7 ; Samus X
    dw $0AFA, $008B ; Samus Y
    dw #$FFFF
.after

preset_nghyper_norfair_postridley_springball_maze:
    dw #preset_nghyper_norfair_postridley_fireflea_room ; Norfair Post-Ridley: Fireflea Room
    dw $078D, $9A02 ; DDB
    dw $079B, $B6EE ; MDB
    dw $090F, $0000 ; Screen subpixel X position.
    dw $0911, $0100 ; Screen X position in pixels
    dw $0913, $0000 ; Screen subpixel Y position
    dw $0915, $0000 ; Screen Y position in pixels
    dw $0A1C, $0002 ; Samus position/state
    dw $0A1E, $0004 ; More position/state
    dw $0AF6, $0169 ; Samus X
    dw $D91A, $000E ; Events, Items, Doors
    dw #$FFFF
.after

preset_nghyper_norfair_postridley_three_musketeers:
    dw #preset_nghyper_norfair_postridley_springball_maze ; Norfair Post-Ridley: Springball Maze
    dw $078D, $9A92 ; DDB
    dw $079B, $B510 ; MDB
    dw $090F, $9000 ; Screen subpixel X position.
    dw $0911, $0000 ; Screen X position in pixels
    dw $0913, $0000 ; Screen subpixel Y position
    dw $0915, $001D ; Screen Y position in pixels
    dw $0AF6, $0069 ; Samus X
    dw $D91A, $000F ; Events, Items, Doors
    dw #$FFFF
.after

preset_nghyper_norfair_postridley_double_chamber:
    dw #preset_nghyper_norfair_postridley_three_musketeers ; Norfair Post-Ridley: Three Musketeers
    dw $078D, $99AE ; DDB
    dw $079B, $B656 ; MDB
    dw $090F, $5FFF ; Screen subpixel X position.
    dw $0911, $0100 ; Screen X position in pixels
    dw $0913, $2C00 ; Screen subpixel Y position
    dw $0915, $000B ; Screen Y position in pixels
    dw $0AF6, $016E ; Samus X
    dw $D91A, $0010 ; Events, Items, Doors
    dw #$FFFF
.after

preset_nghyper_norfair_postridley_bubble_mountain:
    dw #preset_nghyper_norfair_postridley_double_chamber ; Norfair Post-Ridley: Double Chamber
    dw $078D, $9A4A ; DDB
    dw $079B, $AD5E ; MDB
    dw $07F3, $0015 ; Music Bank
    dw $090F, $3000 ; Screen subpixel X position.
    dw $0911, $0000 ; Screen X position in pixels
    dw $0913, $5800 ; Screen subpixel Y position
    dw $0915, $0002 ; Screen Y position in pixels
    dw $09C6, $00E4 ; Missiles
    dw $0AF6, $008D ; Samus X
    dw #$FFFF
.after

preset_nghyper_norfair_postridley_business_center_revisit:
    dw #preset_nghyper_norfair_postridley_bubble_mountain ; Norfair Post-Ridley: Bubble Mountain
    dw $078D, $97DA ; DDB
    dw $079B, $B167 ; MDB
    dw $090F, $2001 ; Screen subpixel X position.
    dw $0913, $D400 ; Screen subpixel Y position
    dw $0915, $0000 ; Screen Y position in pixels
    dw $09C6, $00E1 ; Missiles
    dw $09CA, $0032 ; Supers
    dw $09CE, $0025 ; Pbs
    dw $0AF6, $0031 ; Samus X
    dw $D91A, $0011 ; Events, Items, Doors
    dw #$FFFF
.after

preset_nghyper_kraids_lair_entering_kraids_lair:
    dw #preset_nghyper_norfair_postridley_business_center_revisit ; Norfair Post-Ridley: Business Center Revisit
    dw $078D, $92EE ; DDB
    dw $079B, $A6A1 ; MDB
    dw $07F3, $0012 ; Music Bank
    dw $07F5, $0003 ; Music Track
    dw $090F, $E000 ; Screen subpixel X position.
    dw $0913, $0000 ; Screen subpixel Y position
    dw $0A1C, $009B ; Samus position/state
    dw $0A1E, $0000 ; More position/state
    dw $0AF6, $0080 ; Samus X
    dw $0AFA, $0086 ; Samus Y
    dw #$FFFF
.after

preset_nghyper_kraids_lair_warehouse_kihunters:
    dw #preset_nghyper_kraids_lair_entering_kraids_lair ; Kraids Lair: Entering Kraids Lair
    dw $078D, $923A ; DDB
    dw $079B, $A471 ; MDB
    dw $07F5, $0005 ; Music Track
    dw $090F, $C000 ; Screen subpixel X position.
    dw $0911, $0100 ; Screen X position in pixels
    dw $0913, $B3FF ; Screen subpixel Y position
    dw $0915, $0100 ; Screen Y position in pixels
    dw $09C6, $00E3 ; Missiles
    dw $09CA, $0031 ; Supers
    dw $0A1C, $0001 ; Samus position/state
    dw $0A1E, $0008 ; More position/state
    dw $0AF6, $016A ; Samus X
    dw $0AFA, $018B ; Samus Y
    dw #$FFFF
.after

preset_nghyper_kraids_lair_kraid_hallway:
    dw #preset_nghyper_kraids_lair_warehouse_kihunters ; Kraids Lair: Warehouse Kihunters
    dw $078D, $9156 ; DDB
    dw $079B, $A4DA ; MDB
    dw $090F, $7000 ; Screen subpixel X position.
    dw $0913, $4800 ; Screen subpixel Y position
    dw $0915, $00FD ; Screen Y position in pixels
    dw $0AF6, $016B ; Samus X
    dw $D91A, $0012 ; Events, Items, Doors
    dw #$FFFF
.after

preset_nghyper_kraids_lair_kraid:
    dw #preset_nghyper_kraids_lair_kraid_hallway ; Kraids Lair: Kraid Hallway
    dw $078D, $919E ; DDB
    dw $079B, $A56B ; MDB
    dw $07F3, $0027 ; Music Bank
    dw $07F5, $0006 ; Music Track
    dw $090F, $B000 ; Screen subpixel X position.
    dw $0913, $3400 ; Screen subpixel Y position
    dw $0915, $0100 ; Screen Y position in pixels
    dw $0AF6, $01C7 ; Samus X
    dw $D8B8, $0024 ; Events, Items, Doors
    dw #$FFFF
.after

preset_nghyper_kraids_lair_leaving_kraid:
    dw #preset_nghyper_kraids_lair_kraid ; Kraids Lair: Kraid
    dw $078D, $91B6 ; DDB
    dw $079B, $A59F ; MDB
    dw $07F5, $0003 ; Music Track
    dw $090F, $0000 ; Screen subpixel X position.
    dw $0911, $0000 ; Screen X position in pixels
    dw $0913, $8800 ; Screen subpixel Y position
    dw $09C2, $04E9 ; Health
    dw $09CA, $0030 ; Supers
    dw $0A1C, $0002 ; Samus position/state
    dw $0A1E, $0004 ; More position/state
    dw $0AF6, $004E ; Samus X
    dw $D828, $0100 ; Events, Items, Doors
    dw #$FFFF
.after

preset_nghyper_kraids_lair_kraid_hallway_revisit:
    dw #preset_nghyper_kraids_lair_leaving_kraid ; Kraids Lair: Leaving Kraid
    dw $078D, $91CE ; DDB
    dw $079B, $A56B ; MDB
    dw $090F, $2000 ; Screen subpixel X position.
    dw $0913, $6400 ; Screen subpixel Y position
    dw $09C2, $04E5 ; Health
    dw $0AF6, $0052 ; Samus X
    dw $D8B8, $00A4 ; Events, Items, Doors
    dw #$FFFF
.after

preset_nghyper_kraids_lair_warehouse_zealas:
    dw #preset_nghyper_kraids_lair_kraid_hallway_revisit ; Kraids Lair: Kraid Hallway Revisit
    dw $078D, $9192 ; DDB
    dw $079B, $A4DA ; MDB
    dw $07F3, $0012 ; Music Bank
    dw $07F5, $0005 ; Music Track
    dw $090F, $5000 ; Screen subpixel X position.
    dw $0911, $00F2 ; Screen X position in pixels
    dw $0913, $7400 ; Screen subpixel Y position
    dw $0915, $0000 ; Screen Y position in pixels
    dw $09C2, $04EA ; Health
    dw $09CA, $0032 ; Supers
    dw $0AF6, $016E ; Samus X
    dw $0AFA, $00AB ; Samus Y
    dw $D8B8, $00AC ; Events, Items, Doors
    dw $D91A, $0013 ; Events, Items, Doors
    dw #$FFFF
.after

preset_nghyper_kraids_lair_leaving_kraids_lair:
    dw #preset_nghyper_kraids_lair_warehouse_zealas ; Kraids Lair: Warehouse Zealas
    dw $078D, $913E ; DDB
    dw $079B, $A6A1 ; MDB
    dw $07F5, $0003 ; Music Track
    dw $090F, $AFFF ; Screen subpixel X position.
    dw $0911, $0200 ; Screen X position in pixels
    dw $0913, $CC00 ; Screen subpixel Y position
    dw $0915, $001C ; Screen Y position in pixels
    dw $09C6, $00E6 ; Missiles
    dw $0AF6, $02D9 ; Samus X
    dw $0AFA, $009B ; Samus Y
    dw #$FFFF
.after

preset_nghyper_maridia_entering_maridia:
    dw #preset_nghyper_kraids_lair_leaving_kraids_lair ; Kraids Lair: Leaving Kraids Lair
    dw $090F, $6000 ; Screen subpixel X position.
    dw $0911, $0000 ; Screen X position in pixels
    dw $0913, $23FF ; Screen subpixel Y position
    dw $0915, $0000 ; Screen Y position in pixels
    dw $09CA, $0031 ; Supers
    dw $0AF6, $007F ; Samus X
    dw $0AFA, $008B ; Samus Y
    dw #$FFFF
.after

preset_nghyper_maridia_fish_tank:
    dw #preset_nghyper_maridia_entering_maridia ; Maridia: Entering Maridia
    dw $078D, $A330 ; DDB
    dw $079B, $CFC9 ; MDB
    dw $07F3, $001B ; Music Bank
    dw $07F5, $0006 ; Music Track
    dw $090F, $2000 ; Screen subpixel X position.
    dw $0911, $00F9 ; Screen X position in pixels
    dw $0913, $1C00 ; Screen subpixel Y position
    dw $0915, $05F4 ; Screen Y position in pixels
    dw $0A1C, $0001 ; Samus position/state
    dw $0A1E, $0008 ; More position/state
    dw $0AF6, $0167 ; Samus X
    dw $0AFA, $068B ; Samus Y
    dw $D91A, $0015 ; Events, Items, Doors
    dw #$FFFF
.after

preset_nghyper_maridia_mt_everest:
    dw #preset_nghyper_maridia_fish_tank ; Maridia: Fish Tank
    dw $078D, $A3F0 ; DDB
    dw $079B, $D0B9 ; MDB
    dw $090F, $8000 ; Screen subpixel X position.
    dw $0911, $0109 ; Screen X position in pixels
    dw $0913, $7000 ; Screen subpixel Y position
    dw $0915, $031F ; Screen Y position in pixels
    dw $0AF6, $0182 ; Samus X
    dw $0AFA, $03BB ; Samus Y
    dw #$FFFF
.after

preset_nghyper_maridia_aqueduct:
    dw #preset_nghyper_maridia_mt_everest ; Maridia: Mt Everest
    dw $078D, $A468 ; DDB
    dw $079B, $D1A3 ; MDB
    dw $090F, $4000 ; Screen subpixel X position.
    dw $0911, $0100 ; Screen X position in pixels
    dw $0913, $9FFF ; Screen subpixel Y position
    dw $0915, $0300 ; Screen Y position in pixels
    dw $09C2, $04AE ; Health
    dw $09CA, $0030 ; Supers
    dw $0A1C, $0079 ; Samus position/state
    dw $0A1E, $1108 ; More position/state
    dw $0AF6, $01B4 ; Samus X
    dw $0AFA, $0399 ; Samus Y
    dw $D8C0, $8074 ; Events, Items, Doors
    dw #$FFFF
.after

preset_nghyper_maridia_botwoon:
    dw #preset_nghyper_maridia_aqueduct ; Maridia: Aqueduct
    dw $078D, $A72C ; DDB
    dw $079B, $D617 ; MDB
    dw $07F5, $0005 ; Music Track
    dw $090F, $C000 ; Screen subpixel X position.
    dw $0911, $0300 ; Screen X position in pixels
    dw $0913, $4000 ; Screen subpixel Y position
    dw $0915, $0003 ; Screen Y position in pixels
    dw $09CE, $0024 ; Pbs
    dw $0A1C, $0001 ; Samus position/state
    dw $0A1E, $0008 ; More position/state
    dw $0AF6, $03A2 ; Samus X
    dw $0AFA, $008B ; Samus Y
    dw $D91A, $0017 ; Events, Items, Doors
    dw #$FFFF
.after

preset_nghyper_maridia_halfie:
    dw #preset_nghyper_maridia_botwoon ; Maridia: Botwoon
    dw $078D, $A918 ; DDB
    dw $079B, $D7E4 ; MDB
    dw $090F, $3000 ; Screen subpixel X position.
    dw $0911, $0000 ; Screen X position in pixels
    dw $0913, $8800 ; Screen subpixel Y position
    dw $0915, $001F ; Screen Y position in pixels
    dw $09C2, $0599 ; Health
    dw $09CE, $0025 ; Pbs
    dw $0AF6, $0054 ; Samus X
    dw $0AFA, $009B ; Samus Y
    dw $D82C, $0002 ; Events, Items, Doors
    dw $D91A, $0018 ; Events, Items, Doors
    dw #$FFFF
.after

preset_nghyper_maridia_draygon:
    dw #preset_nghyper_maridia_halfie ; Maridia: Halfie
    dw $078D, $A7F8 ; DDB
    dw $079B, $D78F ; MDB
    dw $0913, $4000 ; Screen subpixel Y position
    dw $0915, $0200 ; Screen Y position in pixels
    dw $09C2, $052E ; Health
    dw $09CA, $002E ; Supers
    dw $0A1C, $0002 ; Samus position/state
    dw $0A1E, $0004 ; More position/state
    dw $0AF6, $0069 ; Samus X
    dw $0AFA, $028B ; Samus Y
    dw $D8C2, $0C00 ; Events, Items, Doors
    dw $D91A, $0019 ; Events, Items, Doors
    dw #$FFFF
.after

preset_nghyper_maridia_womple_jump:
    dw #preset_nghyper_maridia_draygon ; Maridia: Draygon
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

preset_nghyper_maridia_reverse_botwoon_hallway:
    dw #preset_nghyper_maridia_womple_jump ; Maridia: Womple Jump
    dw $078D, $A7E0 ; DDB
    dw $079B, $D913 ; MDB
    dw $090F, $2000 ; Screen subpixel X position.
    dw $0913, $2800 ; Screen subpixel Y position
    dw $0915, $0200 ; Screen Y position in pixels
    dw $09C2, $04B5 ; Health
    dw $09C6, $00DB ; Missiles
    dw $0A68, $0000 ; Flash suit
    dw $0AF6, $00A7 ; Samus X
    dw $0AFA, $028B ; Samus Y
    dw #$FFFF
.after

preset_nghyper_maridia_aqueduct_revisit:
    dw #preset_nghyper_maridia_reverse_botwoon_hallway ; Maridia: Reverse Botwoon Hallway
    dw $078D, $A90C ; DDB
    dw $079B, $D617 ; MDB
    dw $090F, $C000 ; Screen subpixel X position.
    dw $0913, $B400 ; Screen subpixel Y position
    dw $0915, $001F ; Screen Y position in pixels
    dw $0AF6, $009D ; Samus X
    dw $0AFA, $008B ; Samus Y
    dw $D8C2, $6C00 ; Events, Items, Doors
    dw $D91A, $001B ; Events, Items, Doors
    dw #$FFFF
.after

preset_nghyper_maridia_crab_shaft_revisit:
    dw #preset_nghyper_maridia_aqueduct_revisit ; Maridia: Aqueduct Revisit
    dw $078D, $A768 ; DDB
    dw $079B, $D5A7 ; MDB
    dw $090F, $4000 ; Screen subpixel X position.
    dw $0913, $0000 ; Screen subpixel Y position
    dw $0915, $00FC ; Screen Y position in pixels
    dw $0AF6, $0071 ; Samus X
    dw $0AFA, $018B ; Samus Y
    dw $D91A, $001D ; Events, Items, Doors
    dw #$FFFF
.after

preset_nghyper_maridia_mt_everest_revisit:
    dw #preset_nghyper_maridia_crab_shaft_revisit ; Maridia: Crab Shaft Revisit
    dw $078D, $A708 ; DDB
    dw $079B, $D1A3 ; MDB
    dw $07F5, $0006 ; Music Track
    dw $090F, $9FFF ; Screen subpixel X position.
    dw $0913, $3400 ; Screen subpixel Y position
    dw $0915, $0202 ; Screen Y position in pixels
    dw $0AF6, $0070 ; Samus X
    dw $0AFA, $028B ; Samus Y
    dw #$FFFF
.after

preset_nghyper_crateria_red_brinstar_gate:
    dw #preset_nghyper_maridia_mt_everest_revisit ; Maridia: Mt Everest Revisit
    dw $078D, $A42C ; DDB
    dw $079B, $D104 ; MDB
    dw $090F, $7000 ; Screen subpixel X position.
    dw $0911, $0010 ; Screen X position in pixels
    dw $0913, $7C00 ; Screen subpixel Y position
    dw $0915, $0000 ; Screen Y position in pixels
    dw $0AF6, $0077 ; Samus X
    dw $0AFA, $008B ; Samus Y
    dw #$FFFF
.after

preset_nghyper_crateria_crateria_kihunters_final:
    dw #preset_nghyper_crateria_red_brinstar_gate ; Crateria: Red Brinstar Gate
    dw $078D, $90BA ; DDB
    dw $079B, $962A ; MDB
    dw $07F3, $0012 ; Music Bank
    dw $07F5, $0003 ; Music Track
    dw $090F, $0000 ; Screen subpixel X position.
    dw $0911, $0000 ; Screen X position in pixels
    dw $0913, $2C00 ; Screen subpixel Y position
    dw $09CA, $002D ; Supers
    dw $0A1C, $0001 ; Samus position/state
    dw $0A1E, $0008 ; More position/state
    dw $0AF6, $0068 ; Samus X
    dw $0AFA, $005B ; Samus Y
    dw #$FFFF
.after

preset_nghyper_crateria_landing_site:
    dw #preset_nghyper_crateria_crateria_kihunters_final ; Crateria: Crateria Kihunters Final
    dw $078D, $8AF6 ; DDB
    dw $079B, $948C ; MDB
    dw $07F5, $0005 ; Music Track
    dw $090F, $9000 ; Screen subpixel X position.
    dw $0911, $00F1 ; Screen X position in pixels
    dw $0913, $B400 ; Screen subpixel Y position
    dw $0A1C, $0002 ; Samus position/state
    dw $0A1E, $0004 ; More position/state
    dw $0AF6, $0159 ; Samus X
    dw $0AFA, $00BB ; Samus Y
    dw #$FFFF
.after

preset_nghyper_crateria_terminator_etank:
    dw #preset_nghyper_crateria_landing_site ; Crateria: Landing Site
    dw $078D, $8916 ; DDB
    dw $079B, $92FD ; MDB
    dw $07F3, $0009 ; Music Bank
    dw $090F, $9C00 ; Screen subpixel X position.
    dw $0911, $0100 ; Screen X position in pixels
    dw $0913, $5400 ; Screen subpixel Y position
    dw $0AF6, $012F ; Samus X
    dw $0AFA, $009B ; Samus Y
    dw #$FFFF
.after

preset_nghyper_crateria_green_pirate_shaft:
    dw #preset_nghyper_crateria_terminator_etank ; Crateria: Terminator Etank
    dw $078D, $895E ; DDB
    dw $079B, $990D ; MDB
    dw $090F, $A280 ; Screen subpixel X position.
    dw $0911, $0000 ; Screen X position in pixels
    dw $0913, $0000 ; Screen subpixel Y position
    dw $0915, $01FB ; Screen Y position in pixels
    dw $0AF6, $0063 ; Samus X
    dw $0AFA, $029B ; Samus Y
    dw $D91A, $001E ; Events, Items, Doors
    dw #$FFFF
.after

preset_nghyper_tourian_metroids_1:
    dw #preset_nghyper_crateria_green_pirate_shaft ; Crateria: Green Pirate Shaft
    dw $078D, $9222 ; DDB
    dw $079B, $DAAE ; MDB
    dw $07F3, $001E ; Music Bank
    dw $090F, $3001 ; Screen subpixel X position.
    dw $0913, $33FF ; Screen subpixel Y position
    dw $0915, $0300 ; Screen Y position in pixels
    dw $09C2, $04BA ; Health
    dw $09C6, $00DF ; Missiles
    dw $09CE, $0026 ; Pbs
    dw $0AF6, $003F ; Samus X
    dw $0AFA, $038B ; Samus Y
    dw $D820, $0FC1 ; Events, Items, Doors
    dw $D8B2, $4001 ; Events, Items, Doors
    dw $D90C, $0100 ; Events, Items, Doors
    dw $D91A, $0020 ; Events, Items, Doors
    dw #$FFFF
.after

preset_nghyper_tourian_metroids_2:
    dw #preset_nghyper_tourian_metroids_1 ; Tourian: Metroids 1
    dw $078D, $A984 ; DDB
    dw $079B, $DAE1 ; MDB
    dw $090F, $D000 ; Screen subpixel X position.
    dw $0913, $07FF ; Screen subpixel Y position
    dw $0915, $0000 ; Screen Y position in pixels
    dw $09C2, $03EE ; Health
    dw $09C6, $00E1 ; Missiles
    dw $09CA, $002F ; Supers
    dw $09CE, $0023 ; Pbs
    dw $0AF6, $003C ; Samus X
    dw $0AFA, $008B ; Samus Y
    dw $D822, $0001 ; Events, Items, Doors
    dw $D8C4, $0001 ; Events, Items, Doors
    dw #$FFFF
.after

preset_nghyper_tourian_metroids_3:
    dw #preset_nghyper_tourian_metroids_2 ; Tourian: Metroids 2
    dw $078D, $A9B4 ; DDB
    dw $079B, $DB31 ; MDB
    dw $090F, $4000 ; Screen subpixel X position.
    dw $0913, $0800 ; Screen subpixel Y position
    dw $0915, $011C ; Screen Y position in pixels
    dw $09C2, $03B4 ; Health
    dw $09C6, $00E3 ; Missiles
    dw $09CA, $0030 ; Supers
    dw $09CE, $0020 ; Pbs
    dw $0A1C, $0001 ; Samus position/state
    dw $0A1E, $0008 ; More position/state
    dw $0AF6, $00DA ; Samus X
    dw $0AFA, $018B ; Samus Y
    dw $D822, $0003 ; Events, Items, Doors
    dw $D8C4, $0003 ; Events, Items, Doors
    dw #$FFFF
.after

preset_nghyper_tourian_metroids_4:
    dw #preset_nghyper_tourian_metroids_3 ; Tourian: Metroids 3
    dw $078D, $A9CC ; DDB
    dw $079B, $DB7D ; MDB
    dw $090F, $0000 ; Screen subpixel X position.
    dw $0911, $0500 ; Screen X position in pixels
    dw $0913, $B800 ; Screen subpixel Y position
    dw $0915, $0000 ; Screen Y position in pixels
    dw $09C2, $0389 ; Health
    dw $09C6, $00E6 ; Missiles
    dw $09CA, $0031 ; Supers
    dw $09CE, $001D ; Pbs
    dw $0AF6, $05BB ; Samus X
    dw $0AFA, $008B ; Samus Y
    dw $D822, $0007 ; Events, Items, Doors
    dw $D8C4, $0007 ; Events, Items, Doors
    dw #$FFFF
.after

preset_nghyper_tourian_baby_skip:
    dw #preset_nghyper_tourian_metroids_4 ; Tourian: Metroids 4
    dw $078D, $AA14 ; DDB
    dw $079B, $DC65 ; MDB
    dw $07F3, $0045 ; Music Bank
    dw $07F5, $0006 ; Music Track
    dw $090F, $A000 ; Screen subpixel X position.
    dw $0911, $0100 ; Screen X position in pixels
    dw $09C2, $032E ; Health
    dw $09CE, $001A ; Pbs
    dw $0A1C, $0002 ; Samus position/state
    dw $0A1E, $0004 ; More position/state
    dw $0AF6, $01C9 ; Samus X
    dw $0AFA, $00AB ; Samus Y
    dw $D822, $000F ; Events, Items, Doors
    dw $D8C4, $000F ; Events, Items, Doors
    dw #$FFFF
.after

preset_nghyper_tourian_gadora_room:
    dw #preset_nghyper_tourian_baby_skip ; Tourian: Baby Skip
    dw $078D, $AA44 ; DDB
    dw $079B, $DCFF ; MDB
    dw $07F3, $001E ; Music Bank
    dw $07F5, $0005 ; Music Track
    dw $090F, $8001 ; Screen subpixel X position.
    dw $0911, $0000 ; Screen X position in pixels
    dw $0913, $1000 ; Screen subpixel Y position
    dw $0915, $011F ; Screen Y position in pixels
    dw $09CA, $0030 ; Supers
    dw $0A1C, $0001 ; Samus position/state
    dw $0A1E, $0008 ; More position/state
    dw $0AF6, $00BF ; Samus X
    dw $0AFA, $019B ; Samus Y
    dw $D8C4, $00AF ; Events, Items, Doors
    dw #$FFFF
.after

preset_nghyper_tourian_mother_brain_room:
    dw #preset_nghyper_tourian_gadora_room ; Tourian: Gadora Room
    dw $078D, $AAA4 ; DDB
    dw $079B, $DDF3 ; MDB
    dw $090F, $3FFF ; Screen subpixel X position.
    dw $0913, $0000 ; Screen subpixel Y position
    dw $0915, $021A ; Screen Y position in pixels
    dw $09CA, $002E ; Supers
    dw $0A1C, $0002 ; Samus position/state
    dw $0A1E, $0004 ; More position/state
    dw $0AF6, $003A ; Samus X
    dw $0AFA, $028B ; Samus Y
    dw $D8C4, $03AF ; Events, Items, Doors
    dw #$FFFF
.after

preset_nghyper_tourian_escape_room_3:
    dw #preset_nghyper_tourian_mother_brain_room ; Tourian: Mother Brain Room
    dw $078D, $AAEC ; DDB
    dw $079B, $DE7A ; MDB
    dw $07F3, $0024 ; Music Bank
    dw $07F5, $0007 ; Music Track
    dw $090F, $F000 ; Screen subpixel X position.
    dw $0913, $AC00 ; Screen subpixel Y position
    dw $0915, $00F2 ; Screen Y position in pixels
    dw $09A6, $1009 ; Beams
    dw $09C2, $05BD ; Health
    dw $09C6, $008E ; Missiles
    dw $09CA, $0000 ; Supers
    dw $09CE, $0000 ; Pbs
    dw $0A1C, $0001 ; Samus position/state
    dw $0A1E, $0008 ; More position/state
    dw $0A76, $8000 ; Hyper beam
    dw $0AF6, $00DF ; Samus X
    dw $0AFA, $018B ; Samus Y
    dw $D820, $4FE5 ; Events, Items, Doors
    dw $D82C, $0203 ; Events, Items, Doors
    dw #$FFFF
.after

preset_nghyper_tourian_escape_room_4:
    dw #preset_nghyper_tourian_escape_room_3 ; Tourian: Escape Room 3
    dw $078D, $AB04 ; DDB
    dw $079B, $DEA7 ; MDB
    dw $090F, $0000 ; Screen subpixel X position.
    dw $0911, $0500 ; Screen X position in pixels
    dw $0913, $F000 ; Screen subpixel Y position
    dw $0915, $001B ; Screen Y position in pixels
    dw $0AF6, $05D5 ; Samus X
    dw $0AFA, $008B ; Samus Y
    dw #$FFFF
.after

preset_nghyper_tourian_escape_parlor:
    dw #preset_nghyper_tourian_escape_room_4 ; Tourian: Escape Room 4
    dw $078D, $AB34 ; DDB
    dw $079B, $96BA ; MDB
    dw $090F, $7000 ; Screen subpixel X position.
    dw $0911, $0100 ; Screen X position in pixels
    dw $0913, $6801 ; Screen subpixel Y position
    dw $0915, $0000 ; Screen Y position in pixels
    dw $09C2, $052A ; Health
    dw $0A1C, $0002 ; Samus position/state
    dw $0A1E, $0004 ; More position/state
    dw $0AF6, $01CF ; Samus X
    dw $0AFA, $004B ; Samus Y
    dw $D90C, $FF00 ; Events, Items, Doors
    dw #$FFFF
.after
