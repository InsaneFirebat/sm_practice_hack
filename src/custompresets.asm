; --------------
; Custom Presets
; --------------

org $83B400
print pc, " custompresets start"

; Backward compatibility was promised. Just because it's unused, doesn't mean you can use it.

if !FEATURE_TINYSTATES
custom_preset_save:
{
    LDA !sram_custom_preset_slot
    %presetslotsize() ; multiply by 100h (slot offset)
    LDA !SAFEWORD : STA $703000,X ; mark this slot as "SAFE" to load
    LDA #$00BE : STA $703002,X ; record slot size for future compatibility
    LDA !DOOR_ID : STA $703004,X
    LDA !ROOM_ID : STA $703006,X
    LDA !MUSIC_DATA : STA $703008,X
    LDA !MUSIC_TRACK : STA $70300A,X
    LDA !LAYER1_SUB_X : STA $70300C,X
    LDA !LAYER1_X : STA $70300E,X
    LDA !LAYER1_SUB_Y : STA $703010,X
    LDA !LAYER1_Y : STA $703012,X
    LDA !LAYER2_X : STA $703014,X
    LDA !LAYER2_Y : STA $703016,X
    LDA !BG2_X_SCROLL : STA $703018,X
    LDA !BG2_Y_SCROLL : STA $70301A,X
    LDA !CERES_STATUS : STA $70301C,X
    LDA !SAMUS_ITEMS_EQUIPPED : STA $70301E,X
    LDA !SAMUS_ITEMS_COLLECTED : STA $703020,X
    LDA !SAMUS_BEAMS_EQUIPPED : STA $703022,X
    LDA !SAMUS_BEAMS_COLLECTED : STA $703024,X
    LDA !SAMUS_RESERVE_MODE : STA $703026,X
    LDA !SAMUS_HP : STA $703028,X
    LDA !SAMUS_HP_MAX : STA $70302A,X
    LDA !SAMUS_MISSILES : STA $70302C,X
    LDA !SAMUS_MISSILES_MAX : STA $70302E,X
    LDA !SAMUS_SUPERS : STA $703030,X
    LDA !SAMUS_SUPERS_MAX : STA $703032,X
    LDA !SAMUS_PBS : STA $703034,X
    LDA !SAMUS_PBS_MAX : STA $703036,X
    LDA !SAMUS_ITEM_SELECTED : STA $703038,X
    LDA !SAMUS_RESERVE_MAX : STA $70303A,X
    LDA !SAMUS_RESERVE_ENERGY : STA $70303C,X
    LDA !SAMUS_POSE : STA $70303E,X
    LDA !SAMUS_POSE_DIRECTION : STA $703040,X
    LDA !SAMUS_SHINE_TIMER : STA $703042,X ; Flash suit
    LDA !SAMUS_HYPER_BEAM : STA $703044,X
    LDA !SAMUS_X : STA $703046,X
    LDA !SAMUS_X_SUBPX : STA $703048,X
    LDA !SAMUS_Y : STA $70304A,X
    LDA !SAMUS_Y_SUBPX : STA $70304C,X
    LDA !SAMUS_DASH_COUNTER : STA $70304E,X ; Blue suit
    LDA $7ED820 : STA $703050,X  ; Events
    LDA $7ED822 : STA $703052,X  ; Events
    LDA $7ED828 : STA $703054,X  ; Bosses
    LDA $7ED82A : STA $703056,X  ; Bosses
    LDA $7ED82C : STA $703058,X  ; Bosses
    LDA $7ED82E : STA $70305A,X  ; Bosses
    LDA $7ED870 : STA $70305C,X  ; Items
    LDA $7ED872 : STA $70305E,X  ; Items
    LDA $7ED874 : STA $703060,X  ; Items
    LDA $7ED876 : STA $703062,X  ; Items
    LDA $7ED878 : STA $703064,X  ; Items
    LDA $7ED87A : STA $703066,X  ; Items
    LDA $7ED87C : STA $703068,X  ; Items
    LDA $7ED87E : STA $70306A,X  ; Items
    LDA $7ED880 : STA $70306C,X  ; Items
    LDA $7ED882 : STA $70306E,X  ; Items
    LDA $7ED8B0 : STA $703070,X  ; Doors
    LDA $7ED8B2 : STA $703072,X  ; Doors
    LDA $7ED8B4 : STA $703074,X  ; Doors
    LDA $7ED8B6 : STA $703076,X  ; Doors
    LDA $7ED8B8 : STA $703078,X  ; Doors
    LDA $7ED8BA : STA $70307A,X  ; Doors
    LDA $7ED8BC : STA $70307C,X  ; Doors
    LDA $7ED8BE : STA $70307E,X  ; Doors
    LDA $7ED8C0 : STA $703080,X  ; Doors
    LDA $7ED8C2 : STA $703082,X  ; Doors
    LDA $7ED8C4 : STA $703084,X  ; Doors
    LDA $7ED908 : STA $703086,X  ; Map Stations
    LDA $7ED90A : STA $703088,X  ; Map Stations
    LDA $7ED90C : STA $70308A,X  ; Map Stations
    LDA $7ECD20 : STA $70308C,X  ; Scrolls
    LDA $7ECD22 : STA $70308E,X  ; Scrolls
    LDA $7ECD24 : STA $703090,X  ; Scrolls
    LDA $7ECD26 : STA $703092,X  ; Scrolls
    LDA $7ECD28 : STA $703094,X  ; Scrolls
    LDA $7ECD2A : STA $703096,X  ; Scrolls
    LDA $7ECD2C : STA $703098,X  ; Scrolls
    LDA $7ECD2E : STA $70309A,X  ; Scrolls
    LDA $7ECD30 : STA $70309C,X  ; Scrolls
    LDA $7ECD32 : STA $70309E,X  ; Scrolls
    LDA $7ECD34 : STA $7030A0,X  ; Scrolls
    LDA $7ECD36 : STA $7030A2,X  ; Scrolls
    LDA $7ECD38 : STA $7030A4,X  ; Scrolls
    LDA $7ECD3A : STA $7030A6,X  ; Scrolls
    LDA $7ECD3C : STA $7030A8,X  ; Scrolls
    LDA $7ECD3E : STA $7030AA,X  ; Scrolls
    LDA $7ECD40 : STA $7030AC,X  ; Scrolls
    LDA $7ECD42 : STA $7030AE,X  ; Scrolls
    LDA $7ECD44 : STA $7030B0,X  ; Scrolls
    LDA $7ECD46 : STA $7030B2,X  ; Scrolls
    LDA $7ECD48 : STA $7030B4,X  ; Scrolls
    LDA $7ECD4A : STA $7030B6,X  ; Scrolls
    LDA $7ECD4C : STA $7030B8,X  ; Scrolls
    LDA $7ECD4E : STA $7030BA,X  ; Scrolls
    LDA $7ECD50 : STA $7030BC,X  ; Scrolls
    LDA !AREA_ID : STA $7030BE,X
    ; next available byte is $7030C0
    RTL
}

custom_preset_load:
{
    LDA !sram_custom_preset_slot
    %presetslotsize() ; multiply by 100h (slot offset)
    ; skip past "5AFE" word
    ; skip past size for now
    LDA $703004,X : STA !DOOR_ID
    LDA $703006,X : STA !ROOM_ID
    LDA $703008,X : STA !MUSIC_DATA
    LDA $70300A,X : STA !MUSIC_TRACK
    LDA $70300C,X : STA !LAYER1_SUB_X
    LDA $70300E,X : STA !LAYER1_X
    LDA $703010,X : STA !LAYER1_SUB_Y
    LDA $703012,X : STA !LAYER1_Y
    LDA $703014,X : STA !LAYER2_X
    LDA $703016,X : STA !LAYER2_Y
    LDA $703018,X : STA !BG2_X_SCROLL
    LDA $70301A,X : STA !BG2_Y_SCROLL
    LDA $70301C,X : STA !CERES_STATUS
    LDA $70301E,X : STA !SAMUS_ITEMS_EQUIPPED
    LDA $703020,X : STA !SAMUS_ITEMS_COLLECTED
    LDA $703022,X : STA !SAMUS_BEAMS_EQUIPPED
    LDA $703024,X : STA !SAMUS_BEAMS_COLLECTED
    LDA $703026,X : STA !SAMUS_RESERVE_MODE
    LDA $703028,X : STA !SAMUS_HP
    LDA $70302A,X : STA !SAMUS_HP_MAX
    LDA $70302C,X : STA !SAMUS_MISSILES
    LDA $70302E,X : STA !SAMUS_MISSILES_MAX
    LDA $703030,X : STA !SAMUS_SUPERS
    LDA $703032,X : STA !SAMUS_SUPERS_MAX
    LDA $703034,X : STA !SAMUS_PBS
    LDA $703036,X : STA !SAMUS_PBS_MAX
    LDA $703038,X : STA !SAMUS_ITEM_SELECTED
    LDA $70303A,X : STA !SAMUS_RESERVE_MAX
    LDA $70303C,X : STA !SAMUS_RESERVE_ENERGY
    LDA $70303E,X : STA !SAMUS_POSE
    LDA $703040,X : STA !SAMUS_POSE_DIRECTION
    LDA $703042,X : STA !SAMUS_SHINE_TIMER ; Flash suit
    LDA $703044,X : STA !SAMUS_HYPER_BEAM
    LDA $703046,X : STA !SAMUS_X
    LDA $703048,X : STA !SAMUS_X_SUBPX
    LDA $70304A,X : STA !SAMUS_Y
    LDA $70304C,X : STA !SAMUS_Y_SUBPX
    LDA $70304E,X : STA !SAMUS_DASH_COUNTER ; Blue suit
    LDA $703050,X : STA $7ED820 ; Events
    LDA $703052,X : STA $7ED822 ; Events
    LDA $703054,X : STA $7ED828 ; Bosses
    LDA $703056,X : STA $7ED82A ; Bosses
    LDA $703058,X : STA $7ED82C ; Bosses
    LDA $70305A,X : STA $7ED82E ; Bosses
    LDA $70305C,X : STA $7ED870 ; Items
    LDA $70305E,X : STA $7ED872 ; Items
    LDA $703060,X : STA $7ED874 ; Items
    LDA $703062,X : STA $7ED876 ; Items
    LDA $703064,X : STA $7ED878 ; Items
    LDA $703066,X : STA $7ED87A ; Items
    LDA $703068,X : STA $7ED87C ; Items
    LDA $70306A,X : STA $7ED87E ; Items
    LDA $70306C,X : STA $7ED880 ; Items
    LDA $70306E,X : STA $7ED882 ; Items
    LDA $703070,X : STA $7ED8B0 ; Doors
    LDA $703072,X : STA $7ED8B2 ; Doors
    LDA $703074,X : STA $7ED8B4 ; Doors
    LDA $703076,X : STA $7ED8B6 ; Doors
    LDA $703078,X : STA $7ED8B8 ; Doors
    LDA $70307A,X : STA $7ED8BA ; Doors
    LDA $70307C,X : STA $7ED8BC ; Doors
    LDA $70307E,X : STA $7ED8BE ; Doors
    LDA $703080,X : STA $7ED8C0 ; Doors
    LDA $703082,X : STA $7ED8C2 ; Doors
    LDA $703084,X : STA $7ED8C4 ; Doors
    LDA $703086,X : STA $7ED908 ; Map Stations
    LDA $703088,X : STA $7ED90A ; Map Stations
    LDA $70308A,X : STA $7ED90C ; Map Stations
    LDA $7030BE,X : STA !AREA_ID
    ; set flag to load scrolls later
    LDA !SAFEWORD : STA !ram_custom_preset
    ; next available byte is $7030C0
    RTL
}
else
custom_preset_save:
{
    LDA !sram_custom_preset_slot
    %presetslotsize() ; multiply by 200h (slot offset)
    LDA !SAFEWORD : STA $703000,X ; mark this slot as "SAFE" to load
    LDA #$01EE : STA $703002,X ; record slot size for future compatibility
    LDA !LOAD_STATION_INDEX : STA $703004,X
    LDA !DOOR_ID : STA $703006,X
    LDA !DOOR_BTS : STA $703008,X
    LDA !ROOM_ID : STA $70300A,X
    LDA !AREA_ID : STA $70300C,X
    LDA $07C3 : STA $70300E,X ; GFX Pointers
    LDA $07C5 : STA $703010,X ; GFX Pointers
    LDA $07C7 : STA $703012,X ; GFX Pointers
    LDA !MUSIC_DATA : STA $703014,X
    LDA !MUSIC_TRACK : STA $703016,X
    LDA !LAYER1_SUB_X : STA $703018,X
    LDA !LAYER1_X : STA $70301A,X
    LDA !LAYER1_SUB_Y : STA $70301C,X
    LDA !LAYER1_Y : STA $70301E,X
    LDA !CERES_STATUS : STA $703020,X
    LDA !SAMUS_ITEMS_EQUIPPED : STA $703022,X
    LDA !SAMUS_ITEMS_COLLECTED : STA $703024,X
    LDA !SAMUS_BEAMS_EQUIPPED : STA $703026,X
    LDA !SAMUS_BEAMS_COLLECTED : STA $703028,X
    LDA !SAMUS_RESERVE_MODE : STA $70302A,X
    LDA !SAMUS_HP : STA $70302C,X
    LDA !SAMUS_HP_MAX : STA $70302E,X
    LDA !SAMUS_MISSILES : STA $703030,X
    LDA !SAMUS_MISSILES_MAX : STA $703032,X
    LDA !SAMUS_SUPERS : STA $703034,X
    LDA !SAMUS_SUPERS_MAX : STA $703036,X
    LDA !SAMUS_PBS : STA $703038,X
    LDA !SAMUS_PBS_MAX : STA $70303A,X
    LDA !SAMUS_ITEM_SELECTED : STA $70303C,X
    LDA !SAMUS_RESERVE_MAX : STA $70303E,X
    LDA !SAMUS_RESERVE_ENERGY : STA $703040,X
    LDA !SAMUS_POSE : STA $703042,X
    LDA !SAMUS_POSE_DIRECTION : STA $703044,X
    LDA !SAMUS_SHINE_TIMER : STA $703046,X ; Flash suit
    LDA !SAMUS_HYPER_BEAM : STA $703048,X
    LDA !SAMUS_X : STA $70304A,X
    LDA !SAMUS_Y : STA $70304C,X
    LDA !SAMUS_DASH_COUNTER : STA $70304E,X ; Blue suit

    ; Copy SRAM
    TXA : CLC : ADC #$005F : TAX
  .save_sram_loop
    DEX : PHX : TXA : AND #$01FF : TAX
    LDA $7ED7C0,X : PLX : STA !PRESET_SLOTS+$50,X
    DEX : TXA : BIT #$0100 : BEQ .save_sram_loop

    ; Copy Events, Items, Doors
    CLC : ADC #$0100 : TAX
  .save_events_items_doors_loop
    DEX : PHX : TXA : AND #$01FF : TAX
    LDA $7ED820,X : PLX : STA !PRESET_SLOTS+$B0,X
    DEX : TXA : BIT #$0100 : BEQ .save_events_items_doors_loop

    INX ; Restore X for sanity
    LDA !LAYER2_X : STA !PRESET_SLOTS+$1B0,X
    LDA !LAYER2_Y : STA !PRESET_SLOTS+$1B2,X
    LDA !BG2_X_SCROLL : STA !PRESET_SLOTS+$1B4,X
    LDA !BG2_Y_SCROLL : STA !PRESET_SLOTS+$1B6,X

    PHX : PHB
    TXA : CLC : ADC #$31B8 : TAY ; Y = Destination
    LDX #$CD20 : LDA #$0031      ; X = Source, A = Size
    MVN $7E70                    ; srcBank, destBank
    PLB : PLX

    LDA !SAMUS_X_SUBPX : STA $7031EA,X
    LDA !SAMUS_Y_SUBPX : STA $7031EC,X
    ; next available byte is $7031EE

    RTL
}

custom_preset_load:
{
    LDA !sram_custom_preset_slot
    %presetslotsize() ; multiply by 200h
    ; skip past "5AFE" word
    ; skip past size for now
    LDA !PRESET_SLOTS+$04,X : STA !LOAD_STATION_INDEX
    LDA !PRESET_SLOTS+$06,X : STA !DOOR_ID
    LDA !PRESET_SLOTS+$08,X : STA !DOOR_BTS
    LDA !PRESET_SLOTS+$0A,X : STA !ROOM_ID
    LDA !PRESET_SLOTS+$0C,X : STA !AREA_ID
    LDA !PRESET_SLOTS+$0E,X : STA $07C3 ; GFX Pointers
    LDA !PRESET_SLOTS+$10,X : STA $07C5 ; GFX Pointers
    LDA !PRESET_SLOTS+$12,X : STA $07C7 ; GFX Pointers
    LDA !PRESET_SLOTS+$14,X : STA !MUSIC_DATA
    LDA !PRESET_SLOTS+$16,X : STA !MUSIC_TRACK
    LDA !PRESET_SLOTS+$18,X : STA !LAYER1_SUB_X
    LDA !PRESET_SLOTS+$1A,X : STA !LAYER1_X
    LDA !PRESET_SLOTS+$1C,X : STA !LAYER1_SUB_Y
    LDA !PRESET_SLOTS+$1E,X : STA !LAYER1_Y
    LDA !PRESET_SLOTS+$20,X : STA !CERES_STATUS
    LDA !PRESET_SLOTS+$22,X : STA !SAMUS_ITEMS_EQUIPPED
    LDA !PRESET_SLOTS+$24,X : STA !SAMUS_ITEMS_COLLECTED
    LDA !PRESET_SLOTS+$26,X : STA !SAMUS_BEAMS_EQUIPPED
    LDA !PRESET_SLOTS+$28,X : STA !SAMUS_BEAMS_COLLECTED
    LDA !PRESET_SLOTS+$2A,X : STA !SAMUS_RESERVE_MODE
    LDA !PRESET_SLOTS+$2C,X : STA !SAMUS_HP
    LDA !PRESET_SLOTS+$2E,X : STA !SAMUS_HP_MAX
    LDA !PRESET_SLOTS+$30,X : STA !SAMUS_MISSILES
    LDA !PRESET_SLOTS+$32,X : STA !SAMUS_MISSILES_MAX
    LDA !PRESET_SLOTS+$34,X : STA !SAMUS_SUPERS
    LDA !PRESET_SLOTS+$36,X : STA !SAMUS_SUPERS_MAX
    LDA !PRESET_SLOTS+$38,X : STA !SAMUS_PBS
    LDA !PRESET_SLOTS+$3A,X : STA !SAMUS_PBS_MAX
    LDA !PRESET_SLOTS+$3C,X : STA !SAMUS_ITEM_SELECTED
    LDA !PRESET_SLOTS+$3E,X : STA !SAMUS_RESERVE_MAX
    LDA !PRESET_SLOTS+$40,X : STA !SAMUS_RESERVE_ENERGY
    LDA !PRESET_SLOTS+$42,X : STA !SAMUS_POSE
    LDA !PRESET_SLOTS+$44,X : STA !SAMUS_POSE_DIRECTION
    LDA !PRESET_SLOTS+$46,X : STA !SAMUS_SHINE_TIMER ; Flash suit
    LDA !PRESET_SLOTS+$48,X : STA !SAMUS_HYPER_BEAM
    LDA !PRESET_SLOTS+$4A,X : STA !SAMUS_X
    LDA !PRESET_SLOTS+$4C,X : STA !SAMUS_Y
    LDA !PRESET_SLOTS+$4E,X : STA !SAMUS_DASH_COUNTER ; Blue suit

    ; Copy SRAM
    TXA : CLC : ADC #$005F : TAX
  .load_sram_loop
    DEX : LDA !PRESET_SLOTS+$50,X : PHX : PHA
    TXA : AND #$01FF : TAX : PLA
    STA $7ED7C0,X : PLX
    DEX : TXA : BIT #$0100 : BEQ .load_sram_loop

    ; Copy Events, Items, Doors
    CLC : ADC #$0100 : TAX
  .load_events_items_doors_loop
    DEX : LDA !PRESET_SLOTS+$B0,X : PHX : PHA
    TXA : AND #$01FF : TAX : PLA
    STA $7ED820,X : PLX
    DEX : TXA : BIT #$0100 : BEQ .load_events_items_doors_loop

    ; Restore X for sanity, then check if we have layer 2 values
    INX : LDA !PRESET_SLOTS+$02,X : CMP #$01B0 : BEQ .done_no_scrolls

    LDA !PRESET_SLOTS+$1B0,X : STA !LAYER2_X
    LDA !PRESET_SLOTS+$1B2,X : STA !LAYER2_Y
    LDA !PRESET_SLOTS+$1B4,X : STA !BG2_X_SCROLL
    LDA !PRESET_SLOTS+$1B6,X : STA !BG2_Y_SCROLL

    LDA !PRESET_SLOTS+$02,X : CMP #$01BA : BMI .done_no_scrolls
    LDA !SAFEWORD : STA !ram_custom_preset

    LDA $703002,X : CMP #$01EC : BMI .done_with_scrolls
    LDA $7031EA,X : STA !SAMUS_X_SUBPX
    LDA $7031EC,X : STA !SAMUS_Y_SUBPX

  .done_with_scrolls
    RTL

    ; next available byte is $7031EE

  .done_no_scrolls
    LDA #$0000 : STA !ram_custom_preset
    RTL
}
endif

preset_scroll_fixes:
{
    ; Fixes bad scrolling caused by loading into a position that
    ; is normally hidden until passing over a red scroll block.
    ; These fixes can often be found in nearby door asm.
    PHP
    PHB
    %ai16()
    STZ !BG2_X_SCROLL : STZ !BG2_Y_SCROLL
    LDA !ram_custom_preset : CMP !SAFEWORD : BNE .category_presets
    BRL .custom_presets

  .category_presets
    PEA $7E7E : PLB : PLB
    %a8()
    LDA #$01 : LDX !ROOM_ID      ; X = room ID
    CPX #$C000 : BMI .tophalf    ; organized by room ID for efficiency
    BRL .halfway

    ; -------------------------------------------------
    ; Crateria/Brinstar Scroll Fixes (Category Presets)
    ; -------------------------------------------------
  .parlor
    LDY !SAMUS_Y : CPY #$00D0    ; fix varies depending on Y position
    BPL .parlor_lower
    STA $CD24
    BRL .specialized_parlor
  .parlor_lower
    INC : STA $CD26 : STA $CD28
    BRL .specialized_parlor

  .dachora
    LDY !SAMUS_X : CPY #$0405    ; no fix if Xpos < 1029
    BMI .topdone
    STA $CD24
    BRA .topdone

  .big_pink
    BRL .specialized_big_pink

  .big_pink_pbs
    BRL .specialized_big_pink_pbs

  .taco_tank_room
    BRL .specialized_taco_tank_room

  .etecoons_etank
    STA $CD25 : STA $CD26
    BRA .topdone

  .red_tower
    LDY !SAMUS_Y : CPY #$06A0    ; no fix if Ypos < 1696
    BMI .topdone
    STA $CD27
    BRA .topdone

  .alpha_pbs
    LDY !SAMUS_X : CPY #$0100    ; no fix if Xpos > 255
    BPL .topdone
    STA $CD20
    BRA .topdone

  .below_spazer
    LDY !SAMUS_Y : CPY #$00B0    ; no fix if Ypos > 176
    BPL .topdone
    INC : STA $CD20 : STA $CD21
  .topdone
    PLB
    PLP
    RTL

  .tophalf
    CPX.w #ROOM_IceBeamAcid : BPL .norfair
    CPX.w #ROOM_Parlor : BEQ .parlor
    CPX.w #ROOM_Dachora : BEQ .dachora
    CPX.w #ROOM_BigPink : BEQ .big_pink
    CPX.w #ROOM_PinkBrinstarPowerBombs : BEQ .big_pink_pbs
    CPX.w #ROOM_BlueBrinstarETank : BEQ .taco_tank_room
    CPX.w #ROOM_EtecoonETank : BEQ .etecoons_etank
    CPX.w #ROOM_RedTower : BEQ .red_tower
    CPX.w #ROOM_AlphaPowerBomb : BEQ .alpha_pbs
    CPX.w #ROOM_BelowSpazer : BEQ .below_spazer
    CPX.w #ROOM_WarehouseEntrance : BEQ .warehouse_entrance
    BRA .topdone

    ; -----------------------------------------
    ; Warehouse Scroll Fixes (Category Presets)
    ; -----------------------------------------
  .warehouse_entrance
    STA $CD20
    BRA .topdone

    ; ---------------------------------------------
    ; Upper Norfair Scroll Fixes (Category Presets)
    ; ---------------------------------------------
  .ice_beam_gates
    ; skip if Ypos < 720
    LDY !SAMUS_Y : CPY #$02D0 : BMI .norfairdone
    STA $CD38
    BRA .norfairdone

  .ice_snake_room
    LDY !SAMUS_X : CPY #$0100    ; fix varies depending on X position
    BPL .ice_snake_room_hidden
    INC : STA $CD22 : STZ $CD23
    BRA .norfairdone
  .ice_snake_room_hidden
    INC : STA $CD23 : STZ $CD22
    BRA .norfairdone

  .hjb_room
    BRL .specialized_hjb_room

  .green_bubble_missiles
    STA $CD20
    BRA .norfairdone

  .volcano_room
    STA $CD26
    BRA .norfairdone

  .bat_cave
    INC : STA $CD20
    BRA .norfairdone

  .norfair
    CPX.w #ROOM_IceBeamGate : BEQ .ice_beam_gates
    CPX.w #ROOM_IceBeamSnake : BEQ .ice_snake_room
    CPX.w #ROOM_HiJumpBoots : BEQ .hjb_room
    CPX.w #ROOM_GreenBubblesMissiles : BEQ .green_bubble_missiles
    CPX.w #ROOM_Volcano : BEQ .volcano_room
    CPX.w #ROOM_BatCave : BEQ .bat_cave
    CPX.w #ROOM_AcidStatue : BEQ .acid_chozo_room
    CPX.w #ROOM_GoldenTorizo : BEQ .golden_torizo
    CPX.w #ROOM_FastPillarsSetup : BEQ .fast_pillars_setup
    CPX.w #ROOM_WorstRoomInTheGame : BEQ .worst_room
    CPX.w #ROOM_RedKihunterShaft : BEQ .kihunter_stairs
  .norfairdone
    PLB
    PLP
    RTL

    ; ---------------------------------------------
    ; Lower Norfair Scroll Fixes (Category Presets)
    ; ---------------------------------------------
  .acid_chozo_room
    STA $CD26 : STA $CD27 : STA $CD28
    STZ $CD23 : STZ $CD24
    BRA .norfairdone

  .golden_torizo
    LDY !SAMUS_Y : CPY #$00D0    ; no fix if Ypos < 208
    BMI .norfairdone
    STA $CD22 : STA $CD23
    INC : STA $CD20 : STA $CD21
    BRA .norfairdone

  .fast_pillars_setup
    LDY !SAMUS_Y : CPY #$0199    ; fix varies depending on Y position
    BMI .above_pillars
    STA $CD22 : STA $CD24
    STZ $CD21
    BRA .norfairdone
  .above_pillars
    INC : STA $CD21
    BRA .norfairdone

  .worst_room
    INC : STA $CD20
    BRA .norfairdone

  .kihunter_stairs
    LDY !SAMUS_Y : CPY #$008C    ; no fix if Ypos > 140
    BPL .kihunter_stairs_done
    INC : STA $CD20
    STZ $CD23
  .kihunter_stairs_done
    BRL .specialized_kihunter_stairs

    ; --------------------------------------------
    ; Wrecked Ship Scroll Fixes (Category Presets)
    ; --------------------------------------------
  .bowling
    STA $CD2D : STA $CD2F : STA $CD2F
    %a16()
    STZ $CD26 : STZ $CD28
    STZ $CD2A
    BRA .halfwaydone

  .wrecked_ship_shaft
    LDY !SAMUS_X : CPY #$05A0    ; fix varies depending on X position
    BMI .lower_ws_shaft
    STA $CD49
    BRA .halfwaydone
  .lower_ws_shaft
    INC : STA $CD48 : STA $CD4E
    BRA .halfwaydone

  .electric_death
    INC : STA $CD20
    BRA .halfwaydone

  .basement
    STA $CD24
    BRA .halfwaydone

  .halfway
    CPX.w #ROOM_CeresElev : BPL .ceres
    CPX.w #ROOM_BowlingAlley : BEQ .bowling
    CPX.w #ROOM_WreckedShipMainShaft : BEQ .wrecked_ship_shaft
    CPX.w #ROOM_ElectricDeath : BEQ .electric_death
    CPX.w #ROOM_Basement : BEQ .basement
    CPX.w #ROOM_GlassTunnel : BEQ .main_street
    CPX.w #ROOM_CrabShaft : BEQ .crab_shaft
    CPX.w #ROOM_CrabHole : BEQ .crab_hole
    CPX.w #ROOM_Oasis : BEQ .oasis
    CPX.w #ROOM_EastPants : BEQ .pants_room
  .halfwaydone
    PLB
    PLP
    RTL

    ; -----------------------------------------------
    ; Maridia/Tourian Scroll Fixes (Category Presets)
    ; -----------------------------------------------
  .crab_shaft
    STA $CD26 : INC : STA $CD24
    BRA .halfwaydone

  .crab_hole
    LDY !SAMUS_Y : CPY #$00D0    ; fix varies depending on Y position
    BPL .lower_crab_hole
    INC : STA $CD20
    BRA .halfwaydone
  .lower_crab_hole
    STA $CD21 : STZ $CD20
    BRA .halfwaydone

  .main_street
    INC : STA $CD20
    BRA .halfwaydone

  .oasis
    INC : STA $CD20 : STA $CD21
    BRA .halfwaydone

  .pants_room
    STA $CD21 : STZ $CD22
    BRA .halfwaydone

    ; -----------------------------------------
    ; Ceres Fixes (Category and Custom Presets)
    ; -----------------------------------------
  .ceres_elevator
    STZ !BG1_X_OFFSET+1 : STZ !BG1_Y_OFFSET+1
    BRA .ceresdone

  .ceres
    STZ $5F ; Initialize mode 7
    CPX.w #ROOM_CeresElev : BEQ .ceres_elevator
    %a16() : STZ $78 ; Ceres Elevator room already does this
    STZ $7A : STZ $7C ; Other Ceres rooms should zero out the values
    STZ $7E : STZ $80 : STZ $82
    LDA #$0009 : STA $07EB : %a8()
    LDA #$09 : STA $56
    CPX.w #ROOM_FallingTile : BEQ .ceres_falling_tiles
    CPX.w #ROOM_MagnetStairs : BEQ .ceres_magnet_stairs
    CPX.w #ROOM_DeadScientist : BEQ .ceres_dead_scientists
    CPX.w #ROOM_58Escape : BEQ .ceres_58_escape
    CPX.w #ROOM_CeresRidley : BEQ .ceres_ridley
  .ceresdone
    PLB
    PLP
    RTL

  .ceres_falling_tiles
    LDA #$01 : STA !BG1_X_OFFSET+1
    LDA #$02 : STA !BG1_Y_OFFSET+1
    BRA .ceresdone

  .ceres_magnet_stairs
    LDA #$03 : STA !BG1_X_OFFSET+1
    LDA #$02 : STA !BG1_Y_OFFSET+1
    BRA .ceresdone

  .ceres_dead_scientists
    LDA #$04 : STA !BG1_X_OFFSET+1
    LDA #$03 : STA !BG1_Y_OFFSET+1
    BRA .ceresdone

  .ceres_58_escape
    LDA #$06 : STA !BG1_X_OFFSET+1
    LDA #$03 : STA !BG1_Y_OFFSET+1
    BRA .ceresdone

  .ceres_ridley
    LDA #$08 : STA !BG1_X_OFFSET+1
    LDA #$03 : STA !BG1_Y_OFFSET+1
    BRA .ceresdone

  .custom_presets
    LDA !sram_custom_preset_slot
    ASL : XBA
    CLC : ADC #$31E9 : TAX       ; X = Source
    LDY #$CD51 : LDA #$0031      ; Y = Destination, A = Size-1
    MVP $F07E                    ; srcBank, destBank
    LDA #$0000 : STA !ram_custom_preset

    %a8()
    ; X = room ID
    LDX !ROOM_ID : CPX.w #ROOM_CeresElev : BMI .specialized_fixes
    BRL .ceres ; For ceres, use same fixes as category presets

    ; -----------------------------------------------
    ; Specialized Fixes (Category and Custom Presets)
    ; -----------------------------------------------
  .specialized_parlor
    ; no fix if Ypos > 208
    LDY !SAMUS_Y : CPY #$00D0 : BPL .BRLspecialdone
    ; no fix if Xpos > 373
    LDY !SAMUS_X : CPY #$0175 : BPL .specialdone
    %a16()
    LDA #$00FF
    STA $7F05C0 : STA $7F05C2
    ; only clear bottom row if no power bombs
    LDY !SAMUS_PBS_MAX
    BEQ .specialdone
    STA $7F0520 : STA $7F0522
    STA $7F0480 : STA $7F0482

  .BRLspecialdone
    BRA .specialdone

  .specialized_big_pink
    ; spore spawn skip if Xpos > 1040
    LDY !SAMUS_X : CPY #$0410 : BPL .spore_spawn_skip
    ; no fix if Ypos < 704
    LDY !SAMUS_Y : CPY #$02C0 : BMI .specialdone
    ; no fix if Ypos > 969
    CPY #$03C9 : BPL .specialdone
    %a16() : LDA #$00FF
    STA $7F2208 : STA $7F220A : STA $7F22A8 : STA $7F22AA
    STA $7F2348 : STA $7F234A : STA $7F23E8 : STA $7F23EA
    BRA .specialdone

  .specialized_fixes
    CPX #ROOM_Parlor : BEQ .specialized_parlor
    CPX #ROOM_BigPink : BEQ .specialized_big_pink
    CPX #ROOM_BlueBrinstarETank : BEQ .specialized_taco_tank_room
    CPX #ROOM_HiJumpBoots : BEQ .specialized_hjb_room
    CPX #ROOM_RedKihunterShaft : BEQ .specialized_kihunter_stairs

  .specialdone
    PLB
    PLP
    RTL

  .spore_spawn_skip
    STA $CD3C : STA $CD3D
    BRA .specialdone

  .specialized_big_pink_pbs
    ; no fix if Ypos > 310
    LDY !SAMUS_Y : CPY #$0136 : BMI .specialdone
    STZ $CD21
    STA $CD22 : STA $CD23
    BRA .specialdone

  .specialized_taco_tank_room
    ; no fix if Xpos < 555
    LDY !SAMUS_X : CPY #$022B : BMI .specialdone
    ; no fix if no power bombs
    LDY !SAMUS_PBS_MAX : BEQ .specialdone
    %a16()
    LDA #$00FF : LDX #$0000
-   STA $7F1008,X : STA $7F1068,X
    INX #2 : CPX #$0011 : BMI -
    BRA .specialdone

  .specialized_hjb_room
    ; no fix if Xpos > 149
    LDY !SAMUS_X : CPY #$0095 : BPL .specialdone
    %a16()
    LDA #$00FF
    STA $7F0052 : STA $7F0072 : STA $7F0092
    BRA .specialdone

  .specialized_kihunter_stairs
    ; no fix if Ypos > 240
    LDY !SAMUS_Y : CPY #$00F0 : BPL .specialdone
    %a16()
    LDA #$00FF
    STA $7F036E : STA $7F0370 : STA $7F0374 : STA $7F0376
    STA $7F03D4 : STA $7F0610 : STA $7F0612
    BRL .specialdone
}

preset_special_fixes:
{
    LDA #$00FF : LDY !ROOM_ID

    ; Big Pink Power Bomb blocks before Mission Impossible
    CPY.w #ROOM_BigPink : BNE +
    LDX !SAMUS_Y : CPX #$02C0 : BMI +
    CPX #$03C9 : BPL +
    STA $7F2208 : STA $7F220A : STA $7F22A8 : STA $7F22AA
    STA $7F2348 : STA $7F234A : STA $7F23E8 : STA $7F23EA
    BRA .done

    ; Leaving Hi-Jump Boots when left of column
+   CPY.w #ROOM_HiJumpBoots : BNE +
    LDX !SAMUS_X : CPX #$0095 : BPL +
    STA $7F0052 : STA $7F0072 : STA $7F0092
    BRA .done

    ; Top of Kihunter Stairs before Firefleas
+   CPY.w #ROOM_RedKihunterShaft : BNE +
    LDX !SAMUS_Y : CPX #$00F0 : BPL +
    STA $7F036E : STA $7F0370 : STA $7F0374 : STA $7F0376
    STA $7F03D4 : STA $7F0610 : STA $7F0612
    BRA .done

    ; Power Bomb blocks at Blue Brinstar E-tank
+   CPY.w #ROOM_BlueBrinstarETank : BNE +
    LDX !SAMUS_X : CPX #$022B : BMI +
    LDX !SAMUS_PBS_MAX : BEQ +
    LDX #$0000
-   STA $7F1008,X : INX #2 : CPX #$0011 : BMI -
    LDX #$0000
-   STA $7F1068,X : INX #2 : CPX #$0011 : BMI -
;    BRA .done

  .done
+   RTL
}

LoadRandomPreset:
{
    PHY : PHX : PHB
    PHK : PLB
    LDA !ram_random_preset_rng : BEQ .seedrandom
    LDA !ram_random_preset_value : STA $12
    BRA .seedpicked

  .seedrandom
    JSL MenuRNG : STA $12

  .seedpicked
    LDA.w #preset_category_banks>>16 : STA $18 ; bank of category list in $18
    LDA !sram_preset_category : ASL : TAY      ; selected category index in Y
    LDA.w #preset_category_submenus : STA $16  ; pointer to category list in $16
    LDA [$16],Y : TAX                          ; pointer to submenu table in X
    LDA.w #preset_category_banks : STA $16     ; bank of submenu table in $16
    LDA [$16],Y : STA $18                      ; pointer to category grouping table in $18

    STX $16 : LDY #$0000                       ; pointer to submenu table in $16, reset Y
  .toploop                                     ; count number of preset groups in Y
    INY #2
    LDA [$16],Y : BNE .toploop
    TYA : LSR : TAY

    LDA $12 : XBA : AND #$00FF : STA $4204     ; divide random number...
    %i8()
    STY $4206                                  ; by number of preset groups
    %i16()
    PEA $0000 : PLA
    LDA $4216 : ASL : TAY                      ; random preset group index in Y
    LDA [$16],Y : STA $16                      ; random preset group macro pointer in $16
    LDY #$0004 : LDA [$16],Y : STA $16         ; preset group table pointer in $16

    LDY #$0000
  .subloop                                     ; count number of presets in the group in Y
    INY #2
    LDA [$16],Y : BNE .subloop
    TYA : LSR : TAY

    LDA $12 : AND #$00FF : STA $4204           ; divide random number...
    %i8()
    STY $4206 : STY $14                        ; divide bottom half of random number by Y
    %i16()
    CMP ($01,S),Y                              ; burn 8 CPU cycles
    LDA $4216 : STA $12                        ; randomly selected preset

    ASL : TAY
    LDA [$16],Y : STA $16                      ; random preset macro pointer in $16
    LDY #$0004 : LDA [$16],Y                   ; finally reached the pointer to the preset
    STA !ram_load_preset

    ; !FEATURE_DEV for crawling through preset categories in order
    LDA !ram_random_preset_rng : BEQ .done
    LDA !ram_random_preset_value : INC : STA !ram_random_preset_value
    LDA $12 : INC : CMP $14 : BMI .done
    LDA !ram_random_preset_value : XBA : INC : XBA
    AND #$FF00 : STA !ram_random_preset_value

  .done
    PLB : PLX : PLY
    RTL
}

Randomize_Preset_Equipment:
{
    LDA !sram_presetrando : BNE .randomize
    RTL

  .randomize
    PHX
    ; equipment
    LDA !ram_seed_Y : AND #$F32F
    STA !SAMUS_ITEMS_EQUIPPED : STA !SAMUS_ITEMS_COLLECTED

    ; check if morph forced
    LDA !sram_presetrando_morph : BEQ +
    ; turn on morph
    LDA !SAMUS_ITEMS_EQUIPPED : ORA #$0004 : STA !SAMUS_ITEMS_EQUIPPED : STA !SAMUS_ITEMS_COLLECTED

    ; beams
+   JSL MenuRNG
    AND #$100F : STA !SAMUS_BEAMS_COLLECTED
    ; check for Spazer+Plasma
    AND #$000C : CMP #$000C : BNE .beams_done
    ; check beam preference, 0 = random
    LDA !sram_presetrando_beampref : BEQ .random_pref
    ; after decrement, 0 = spazer, 1 = plasma
    DEC : BEQ .spazer

  .plasma
    LDA !SAMUS_BEAMS_COLLECTED : AND #$100B : STA !SAMUS_BEAMS_EQUIPPED
    BRA +
  .spazer
    LDA !SAMUS_BEAMS_COLLECTED : AND #$1007 : STA !SAMUS_BEAMS_EQUIPPED
    BRA +
  .random_pref
    LDA !ram_seed_X : AND #$0001 : BEQ .spazer
    BRA .plasma
  .beams_done
    LDA !SAMUS_BEAMS_COLLECTED : STA !SAMUS_BEAMS_EQUIPPED

    ; check if charge forced
+   LDA !sram_presetrando_charge : BEQ +
    ; equip charge beam
    LDA !SAMUS_BEAMS_COLLECTED : ORA #$1000 : STA !SAMUS_BEAMS_COLLECTED                              
    LDA !SAMUS_BEAMS_EQUIPPED : ORA #$1000 : STA !SAMUS_BEAMS_EQUIPPED

    ; reserves
+   LDA !sram_presetrando_max_reserves : BEQ .no_reserves   ; check if max = 0
    LDA !ram_seed_Y : AND #$F000 : LSR #4 : XBA             ; reuse random number
    CMP !sram_presetrando_max_reserves : BPL .cap_reserves  ; check if capped
    ASL : TAX : LDA.l PresetRandoReserveTable,X             ; load value from table
    STA !SAMUS_RESERVE_MAX : STA !SAMUS_RESERVE_ENERGY      ; store reserves
    BRA +

  .cap_reserves
    BEQ .reserves_done                                      ; check for 0 condition (value is equal to max)
    SEC : SBC !sram_presetrando_max_reserves                ; subtract max from random number
    CMP !sram_presetrando_max_reserves : BPL .cap_reserves  ; check if capped again (loop)

  .reserves_done
    ASL : TAX : LDA.l PresetRandoReserveTable,X             ; load a proper value from table
    STA !SAMUS_RESERVE_MAX : STA !SAMUS_RESERVE_ENERGY      ; store capped reserves
    BRA +

  .no_reserves
    STZ !SAMUS_RESERVE_MAX : STZ !SAMUS_RESERVE_ENERGY      ; capped at zero

    ; missiles
+   LDA !sram_presetrando_max_missiles : BEQ .no_missiles   ; check if max = 0
    LDA !ram_seed_X : AND #$0FF0 : LSR #4                   ; reuse random number
    CMP !sram_presetrando_max_missiles : BPL .cap_missiles  ; check if capped
    ASL : TAX : LDA.l PresetRandoAmmoTable,X                ; load a proper value from table
    STA !SAMUS_MISSILES : STA !SAMUS_MISSILES_MAX           ; store random missiles
    BRA +

  .cap_missiles
    BEQ .missiles_done                                      ; check for 0 condition (value is equal to max)
    SEC : SBC !sram_presetrando_max_missiles
    CMP !sram_presetrando_max_missiles : BPL .cap_missiles

  .missiles_done
    ASL : TAX : LDA.l PresetRandoAmmoTable,X
    STA !SAMUS_MISSILES : STA !SAMUS_MISSILES_MAX           ; store capped missiles
    BRA +

  .no_missiles
    STZ !SAMUS_MISSILES : STZ !SAMUS_MISSILES_MAX           ; capped at zero

    ; supers
+   LDA !sram_presetrando_max_supers : BEQ .no_supers       ; check if max = 0
    JSL MenuRNG : AND #$00FF                                ; get new random number
    CMP !sram_presetrando_max_supers : BPL .cap_supers      ; check if capped
    ASL : TAX : LDA.l PresetRandoAmmoTable,X
    STA !SAMUS_SUPERS : STA !SAMUS_SUPERS_MAX               ; store random supers
    BRA +

  .cap_supers
    BEQ .supers_done                                        ; check for 0 condition (value is equal to max)
    SEC : SBC !sram_presetrando_max_supers
    CMP !sram_presetrando_max_supers : BPL .cap_supers

  .supers_done
    ASL : TAX : LDA.l PresetRandoAmmoTable,X
    STA !SAMUS_SUPERS : STA !SAMUS_SUPERS_MAX               ; store capped supers
    BRA +

  .no_supers
    STZ !SAMUS_SUPERS : STZ !SAMUS_SUPERS_MAX               ; capped at zero

    ; pbs
+   LDA !sram_presetrando_max_pbs : BEQ .no_pbs             ; check if max = 0
    LDA !ram_seed_Y : XBA : AND #$00FF                      ; get new random number
    CMP !sram_presetrando_max_pbs : BPL .cap_pbs            ; check if capped
    ASL : TAX : LDA.l PresetRandoAmmoTable,X
    STA !SAMUS_PBS : STA !SAMUS_PBS_MAX                     ; store random pbs
    BRA +

  .cap_pbs
    BEQ .pbs_done                                           ; check for 0 condition (value is equal to max)
    SEC : SBC !sram_presetrando_max_pbs
    CMP !sram_presetrando_max_pbs : BPL .cap_pbs

  .pbs_done
    ASL : TAX : LDA.l PresetRandoAmmoTable,X
    STA !SAMUS_PBS : STA !SAMUS_PBS_MAX                     ; store capped pbs
    BRA +

  .no_pbs
    STZ !SAMUS_PBS : STZ !SAMUS_PBS_MAX                     ; capped at zero

    ; etanks
+   LDA !sram_presetrando_max_etanks : BEQ .no_etanks       ; check if max = 0
    JSL MenuRNG2 : AND #$000F                               ; get new random number
    CMP !sram_presetrando_max_etanks : BPL .cap_etanks      ; check if capped
    ASL : TAX : LDA.l PresetRandoETankTable,X               ; load value from table
    STA !SAMUS_HP : STA !SAMUS_HP_MAX : BRA .done           ; store energy

  .cap_etanks
    BEQ .etanks_done                                        ; check for 0 condition (value is equal to max)
    SEC : SBC !sram_presetrando_max_etanks
    CMP !sram_presetrando_max_etanks : BPL .cap_etanks

  .etanks_done
    ASL : TAX : LDA.l PresetRandoETankTable,X               ; load value from table
    STA !SAMUS_HP : STA !SAMUS_HP_MAX                       ; store energy
    BRA .done

  .no_etanks
    LDA #$0063 : STA !SAMUS_HP : STA !SAMUS_HP_MAX          ; capped at zero (99)

  .done
    PLX
    RTL

PresetRandoAmmoTable:
    dw #$0000, #$0005, #$000A, #$000F, #$0014, #$0019, #$001E, #$0023, #$0028, #$002D, #$0032, #$0037, #$003C, #$0041, #$0046, #$004B
    dw #$0050, #$0055, #$005A, #$005F, #$0064, #$0069, #$006E, #$0073, #$0078, #$007D, #$0082, #$0087, #$008C, #$0091, #$0096, #$009B
    dw #$00A0, #$00A5, #$00AA, #$00AF, #$00B4, #$00B9, #$00BE, #$00C3, #$00C8, #$00CD, #$00D2, #$00D7, #$00DC, #$00E1, #$00E6, #$00EB
    dw #$00F0, #$00F5, #$00FA, #$00FF

PresetRandoReserveTable:
    dw #$0000, #$0064, #$00C8, #$012C, #$0190

PresetRandoETankTable:
    dw #$0063, #$00C7, #$012B, #$018F, #$01F3, #$0257, #$02BB, #$031F, #$0383, #$03E7, #$044B, #$04AF, #$0513, #$0517, #$05DB
}

warnpc $B3C000 ; mainmenu.asm
print pc, " custom presets end"
