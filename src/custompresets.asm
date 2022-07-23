; --------------
; Custom Presets
; --------------

org $83B400
print pc, " custom presets start"

; Backward compatibility was promised. Just because it's unused, doesn't mean you can use it.

custom_preset_save:
{
    LDA !sram_custom_preset_slot
    ; multiply by 200h (slot offset)
    ASL : XBA : TAX
    LDA #$5AFE : STA !PRESET_SLOTS+$00,X ; mark this slot as "SAFE" to load
    LDA #$01EE : STA !PRESET_SLOTS+$02,X ; record slot size for future compatibility
;    LDA $078B : STA !PRESET_SLOTS+$04,X    ; Elevator Index
    LDA $078D : STA !PRESET_SLOTS+$06,X                   ; DDB
;    LDA $078F : STA !PRESET_SLOTS+$08,X    ; DoorOut Index
    LDA $079B : STA !PRESET_SLOTS+$0A,X                   ; MDB
;    LDA $079F : STA !PRESET_SLOTS+$0C,X    ; Region
;    LDA $07C3 : STA !PRESET_SLOTS+$0E,X    ; GFX Pointers
;    LDA $07C5 : STA !PRESET_SLOTS+$10,X    ; GFX Pointers
;    LDA $07C7 : STA !PRESET_SLOTS+$12,X    ; GFX Pointers
    LDA !MUSIC_DATA : STA !PRESET_SLOTS+$14,X             ; Music Bank
    LDA !MUSIC_TRACK : STA !PRESET_SLOTS+$16,X            ; Music Track
    LDA $090F : STA !PRESET_SLOTS+$18,X                   ; Screen subpixel X position
    LDA !LAYER1_X : STA !PRESET_SLOTS+$1A,X               ; Screen X position in pixels
    LDA $0913 : STA !PRESET_SLOTS+$1C,X                   ; Screen subpixel Y position
    LDA !LAYER1_Y : STA !PRESET_SLOTS+$1E,X               ; Screen Y position in pixels
    LDA $093F : STA !PRESET_SLOTS+$20,X                   ; Ceres escape flag
    LDA !SAMUS_ITEMS_EQUIPPED : STA !PRESET_SLOTS+$22,X   ; Equipped Items
    LDA !SAMUS_ITEMS_COLLECTED : STA !PRESET_SLOTS+$24,X  ; Collected Items
    LDA !SAMUS_BEAMS_EQUIPPED : STA !PRESET_SLOTS+$26,X   ; Beams
    LDA !SAMUS_BEAMS_COLLECTED : STA !PRESET_SLOTS+$28,X  ; Beams
    LDA !SAMUS_RESERVE_MODE : STA !PRESET_SLOTS+$2A,X     ; Manual/Auto reserve tank
    LDA !SAMUS_HP : STA !PRESET_SLOTS+$2C,X               ; Health
    LDA !SAMUS_HP_MAX : STA !PRESET_SLOTS+$2E,X           ; Max health
    LDA !SAMUS_MISSILES : STA !PRESET_SLOTS+$30,X         ; Missiles
    LDA !SAMUS_MISSILES_MAX : STA !PRESET_SLOTS+$32,X     ; Max missiles
    LDA !SAMUS_SUPERS : STA !PRESET_SLOTS+$34,X           ; Supers
    LDA !SAMUS_SUPERS_MAX : STA !PRESET_SLOTS+$36,X       ; Max supers
    LDA !SAMUS_PBS : STA !PRESET_SLOTS+$38,X              ; Pbs
    LDA !SAMUS_PBS_MAX : STA !PRESET_SLOTS+$3A,X          ; Max pbs
    LDA $09D2 : STA !PRESET_SLOTS+$3C,X                   ; Currently selected item
    LDA !SAMUS_RESERVE_MAX : STA !PRESET_SLOTS+$3E,X      ; Max reserves
    LDA !SAMUS_RESERVE_ENERGY : STA !PRESET_SLOTS+$40,X   ; Reserves
    LDA !SAMUS_POSE : STA !PRESET_SLOTS+$42,X             ; Samus position/state
    LDA !SAMUS_POSE_DIRECTION : STA !PRESET_SLOTS+$44,X   ; More position/state
    LDA $0A68 : STA !PRESET_SLOTS+$46,X                   ; Flash suit
    LDA !SAMUS_HYPER_BEAM : STA !PRESET_SLOTS+$48,X       ; Hyper beam
    LDA !SAMUS_X : STA !PRESET_SLOTS+$4A,X                ; Samus X
    LDA !SAMUS_Y : STA !PRESET_SLOTS+$4C,X                ; Samus Y
    LDA !SAMUS_DASH_COUNTER : STA !PRESET_SLOTS+$4E,X     ; Blue suit

    ; Copy SRAM
    ; This was deemed unnecessary but remains reserved for backward compatibility
    TXA : CLC : ADC #$005F : TAX
  .save_sram_loop
    DEX : PHX : TXA : AND #$01FF : TAX
    LDA $7ED7C0,X : PLX : STA !PRESET_SLOTS+$50,X
    DEX : TXA : BIT #$0100 : BEQ .save_sram_loop

    ; Copy Events, Items, Doors
    ; Much of this is unnecessary for vanilla but remains reserved for backward compatibility
    TXA : CLC : ADC #$0100 : TAX
  .save_events_items_doors_loop
    DEX : PHX : TXA : AND #$01FF : TAX
    LDA $7ED820,X : PLX : STA !PRESET_SLOTS+$B0,X
    DEX : TXA : BIT #$0100 : BEQ .save_events_items_doors_loop

    INX ; Restore X for sanity
    LDA $0917 : STA !PRESET_SLOTS+$1B0,X ; Layer 2 X position
    LDA $0919 : STA !PRESET_SLOTS+$1B2,X ; Layer 2 Y position
    LDA $0921 : STA !PRESET_SLOTS+$1B4,X ; BG2 X offset
    LDA $0923 : STA !PRESET_SLOTS+$1B6,X ; BG2 Y offset

    PHX : PHB
    TXA : CLC : ADC #$31B8 : TAY ; Y = Destination
    LDX #$CD20 : LDA #$0031      ; X = Source, A = Size
    MVN $7EF0                    ; srcBank, destBank
    PLB : PLX

    LDA !SAMUS_X_SUBPX : STA $7031EA,X ; Samus subpixel X
    LDA !SAMUS_Y_SUBPX : STA $7031EC,X ; Samus subpixel Y
    ; next available byte is $7031EE

    RTL
}

custom_preset_load:
{
    LDA !sram_custom_preset_slot
    ; multiply by 200h
    ASL : XBA : TAX
    ; skip past "5AFE" word
    ; skip past size for now
;    LDA !PRESET_SLOTS+$04,X : STA $078B    ; Elevator Index
    LDA !PRESET_SLOTS+$06,X : STA $078D                   ; DDB
;    LDA !PRESET_SLOTS+$08,X : STA $078F    ; DoorOut Index
    LDA !PRESET_SLOTS+$0A,X : STA $079B                   ; MDB
;    LDA !PRESET_SLOTS+$0C,X : STA $079F    ; Region
;    LDA !PRESET_SLOTS+$0E,X : STA $07C3    ; GFX Pointers
;    LDA !PRESET_SLOTS+$10,X : STA $07C5    ; GFX Pointers
;    LDA !PRESET_SLOTS+$12,X : STA $07C7    ; GFX Pointers
    LDA !PRESET_SLOTS+$14,X : STA !MUSIC_DATA             ; Music Bank
    LDA !PRESET_SLOTS+$16,X : STA !MUSIC_TRACK            ; Music Track
    LDA !PRESET_SLOTS+$18,X : STA $090F                   ; Screen subpixel X position
    LDA !PRESET_SLOTS+$1A,X : STA !LAYER1_X               ; Screen X position in pixels
    LDA !PRESET_SLOTS+$1C,X : STA $0913                   ; Screen subpixel Y position
    LDA !PRESET_SLOTS+$1E,X : STA !LAYER1_Y               ; Screen Y position in pixels
    LDA !PRESET_SLOTS+$20,X : STA $093F                   ; Ceres escape flag
    LDA !PRESET_SLOTS+$22,X : STA !SAMUS_ITEMS_EQUIPPED   ; Equipped Items
    LDA !PRESET_SLOTS+$24,X : STA !SAMUS_ITEMS_COLLECTED  ; Collected Items
    LDA !PRESET_SLOTS+$26,X : STA !SAMUS_BEAMS_EQUIPPED   ; Beams
    LDA !PRESET_SLOTS+$28,X : STA !SAMUS_BEAMS_COLLECTED  ; Beams
    LDA !PRESET_SLOTS+$2A,X : STA !SAMUS_RESERVE_MODE     ; Manual/Auto reserve tank
    LDA !PRESET_SLOTS+$2C,X : STA !SAMUS_HP               ; Health
    LDA !PRESET_SLOTS+$2E,X : STA !SAMUS_HP_MAX           ; Max health
    LDA !PRESET_SLOTS+$30,X : STA !SAMUS_MISSILES         ; Missiles
    LDA !PRESET_SLOTS+$32,X : STA !SAMUS_MISSILES_MAX     ; Max missiles
    LDA !PRESET_SLOTS+$34,X : STA !SAMUS_SUPERS           ; Supers
    LDA !PRESET_SLOTS+$36,X : STA !SAMUS_SUPERS_MAX       ; Max supers
    LDA !PRESET_SLOTS+$38,X : STA !SAMUS_PBS              ; Pbs
    LDA !PRESET_SLOTS+$3A,X : STA !SAMUS_PBS_MAX          ; Max pbs
    LDA !PRESET_SLOTS+$3C,X : STA $09D2                   ; Currently selected item
    LDA !PRESET_SLOTS+$3E,X : STA !SAMUS_RESERVE_MAX      ; Max reserves
    LDA !PRESET_SLOTS+$40,X : STA !SAMUS_RESERVE_ENERGY   ; Reserves
    LDA !PRESET_SLOTS+$42,X : STA !SAMUS_POSE             ; Samus position/state
    LDA !PRESET_SLOTS+$44,X : STA !SAMUS_POSE_DIRECTION   ; More position/state
    LDA !PRESET_SLOTS+$46,X : STA $0A68                   ; Flash suit
    LDA !PRESET_SLOTS+$48,X : STA !SAMUS_HYPER_BEAM       ; Hyper beam
    LDA !PRESET_SLOTS+$4A,X : STA !SAMUS_X                ; Samus X
    LDA !PRESET_SLOTS+$4C,X : STA !SAMUS_Y                ; Samus Y
    LDA !PRESET_SLOTS+$4E,X : STA !SAMUS_DASH_COUNTER     ; Blue suit

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

    LDA !PRESET_SLOTS+$1B0,X : STA $0917 ; Layer 2 X position
    LDA !PRESET_SLOTS+$1B2,X : STA $0919 ; Layer 2 Y position
    LDA !PRESET_SLOTS+$1B4,X : STA $0921 ; BG2 X offset
    LDA !PRESET_SLOTS+$1B6,X : STA $0923 ; BG2 Y offset

    LDA !PRESET_SLOTS+$02,X : CMP #$01BA : BMI .done_no_scrolls
    LDA #$5AFE : STA !ram_custom_preset
    LDA $703002,X : CMP #$01EC : BMI .done_with_scrolls
    LDA $7031EA,X : STA !SAMUS_X_SUBPX ; Samus subpixel X
    LDA $7031EC,X : STA !SAMUS_Y_SUBPX ; Samus subpixel Y

  .done_with_scrolls
    RTL

    ; next available byte is $7031EE

  .done_no_scrolls
    LDA #$0000 : STA !ram_custom_preset
    RTL
}

preset_scroll_fixes:
{
    ; Fixes bad scrolling caused by loading into a position that
    ; is normally hidden until passing over a red scroll block.
    ; These fixes can often be found in nearby door asm.
    PHP
    PHB
    %ai16()
    STZ $0921 : STZ $0923
    LDA !ram_custom_preset : CMP #$5AFE : BNE .category_presets
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
    CPX #$A75D : BPL .norfair
    CPX #$92FD : BEQ .parlor
    CPX #$9CB3 : BEQ .dachora
    CPX #$9D19 : BEQ .big_pink
    CPX #$9F64 : BEQ .taco_tank_room
    CPX #$A011 : BEQ .etecoons_etank
    CPX #$A253 : BEQ .red_tower
    CPX #$A3AE : BEQ .alpha_pbs
    CPX #$A408 : BEQ .below_spazer
    CPX #$A6A1 : BEQ .warehouse_entrance
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
    CPX #$A8B9 : BEQ .ice_snake_room
    CPX #$A9E5 : BEQ .hjb_room
    CPX #$AC83 : BEQ .green_bubble_missiles
    CPX #$AE32 : BEQ .volcano_room
    CPX #$B07A : BEQ .bat_cave
    CPX #$B1E5 : BEQ .acid_chozo_room
    CPX #$B283 : BEQ .golden_torizo
    CPX #$B3A5 : BEQ .fast_pillars_setup
    CPX #$B4AD : BEQ .worst_room
    CPX #$B585 : BEQ .kihunter_stairs
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
    STA $CD2D : STA $CD2E : STA $CD2F
    STZ $CD26 : STZ $CD27
    STZ $CD28 : STZ $CD29
    STZ $CD2A : STZ $CD2B
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
    CPX #$DF45 : BPL .ceres
    CPX #$C98E : BEQ .bowling
    CPX #$CAF6 : BEQ .wrecked_ship_shaft
    CPX #$CBD5 : BEQ .electric_death
    CPX #$CC6F : BEQ .basement
    CPX #$D1A3 : BEQ .crab_shaft
    CPX #$D21C : BEQ .crab_hole
    CPX #$D48E : BEQ .oasis
    CPX #$D69A : BEQ .pants_room
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
    STZ $091E : STZ $0920
    BRA .ceresdone

  .ceres
    STZ $5F                      ; Initialize mode 7
    CPX #$DF45 : BEQ .ceres_elevator
    %a16() : STZ $78             ; Ceres Elevator room already does this
    STZ $7A : STZ $7C            ; Other Ceres rooms should zero out the values
    STZ $7E : STZ $80
    STZ $82 : %a8()
    CPX #$DF8D : BEQ .ceres_falling_tiles
    CPX #$DFD7 : BEQ .ceres_magnet_stairs
    CPX #$E021 : BEQ .ceres_dead_scientists
    CPX #$E06B : BEQ .ceres_58_escape
    CPX #$E0B5 : BEQ .ceres_ridley
  .ceresdone
    PLB
    PLP
    RTL

  .ceres_falling_tiles
    LDA #$01 : STA $091E
    LDA #$02 : STA $0920
    BRA .ceresdone

  .ceres_magnet_stairs
    LDA #$03 : STA $091E
    LDA #$02 : STA $0920
    BRA .ceresdone

  .ceres_dead_scientists
    LDA #$04 : STA $091E
    LDA #$03 : STA $0920
    BRA .ceresdone

  .ceres_58_escape
    LDA #$06 : STA $091E
    LDA #$03 : STA $0920
    BRA .ceresdone

  .ceres_ridley
    LDA #$08 : STA $091E
    LDA #$03 : STA $0920
    BRA .ceresdone

  .custom_presets
    LDA !sram_custom_preset_slot
    ASL : XBA
    CLC : ADC #$31E9 : TAX       ; X = Source
    LDY #$CD51 : LDA #$0031      ; Y = Destination, A = Size-1
    MVP $F07E                    ; srcBank, destBank
    TDC : STA !ram_custom_preset

    %a8()
    ; X = room ID
    LDX !ROOM_ID : CPX #$DF45 : BMI .specialized_fixes
    BRL .ceres ; For ceres, use same fixes as category presets

    ; -----------------------------------------------
    ; Specialized Fixes (Category and Custom Presets)
    ; -----------------------------------------------
  .specialized_parlor
    ; no fix if Ypos > 208
    LDY !SAMUS_Y : CPY #$00D0 : BPL .specialdone
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
    BRA .specialdone

  .specialized_big_pink
    ; no fix if Ypos < 704
    LDY !SAMUS_Y : CPY #$02C0 : BMI .specialdone
    ; no fix if Ypos > 969
    CPY #$03C9 : BPL .specialdone
    %a16() : LDA #$00FF
    STA $7F2208 : STA $7F220A : STA $7F22A8 : STA $7F22AA
    STA $7F2348 : STA $7F234A : STA $7F23E8 : STA $7F23EA
    BRA .specialdone

  .specialized_fixes
    CPX #$92FD : BEQ .specialized_parlor
    CPX #$9D19 : BEQ .specialized_big_pink
    CPX #$9F64 : BEQ .specialized_taco_tank_room
    CPX #$A9E5 : BEQ .specialized_hjb_room
    CPX #$B585 : BEQ .specialized_kihunter_stairs

  .specialdone
    PLB
    PLP
    RTL

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
    BRA .specialdone
}

preset_special_fixes:
{
    LDA #$00FF : LDY !ROOM_ID

    ; Big Pink Power Bomb blocks before Mission Impossible
    CPY #$9D19 : BNE +
    LDX !SAMUS_Y : CPX #$02C0 : BMI +
    CPX #$03C9 : BPL +
    STA $7F2208 : STA $7F220A : STA $7F22A8 : STA $7F22AA
    STA $7F2348 : STA $7F234A : STA $7F23E8 : STA $7F23EA
    BRA .done

    ; Leaving Hi-Jump Boots when left of column
+   CPY #$A9E5 : BNE +
    LDX !SAMUS_X : CPX #$0095 : BPL +
    STA $7F0052 : STA $7F0072 : STA $7F0092
    BRA .done

    ; Top of Kihunter Stairs before Firefleas
+   CPY #$B585 : BNE +
    LDX !SAMUS_Y : CPX #$00F0 : BPL +
    STA $7F036E : STA $7F0370 : STA $7F0374 : STA $7F0376
    STA $7F03D4 : STA $7F0610 : STA $7F0612
    BRA .done

    ; Power Bomb blocks at Blue Brinstar E-tank
+   CPY #$9F64 : BNE +
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
    LDA.l #preset_category_banks>>16 : STA $18 ; bank of category list in $18
    LDA !sram_preset_category : ASL : TAY      ; selected category index in Y
    LDA.l #preset_category_submenus : STA $16  ; pointer to category list in $16
    LDA [$16],Y : TAX                          ; pointer to submenu table in X
    LDA.l #preset_category_banks : STA $16     ; bank of submenu table in $16
    LDA [$16],Y : STA $18                      ; pointer to category grouping table in $18

    STX $16 : LDY #$0000                       ; pointer to submenu table in $16, reset Y
  .toploop                                     ; count number of preset groups in Y
    INY #2
    LDA [$16],Y : BNE .toploop
    TYA : LSR : TAY

    LDA $12 : XBA : AND #$00FF : STA $4204     ; divide random number...
    %a8()
    STY $4206                                  ; by number of preset groups
    %a16()
    PEA $0000 : PLA : PEA $0000 : PLA
    LDA $4216 : ASL : TAY                      ; random preset group index in Y
    LDA [$16],Y : STA $16                      ; random preset group macro pointer in $16
    LDY #$0004 : LDA [$16],Y : STA $16         ; preset group table pointer in $16

    LDY #$0000
  .subloop                                     ; count number of presets in the group in Y
    INY #2
    LDA [$16],Y : BNE .subloop
    TYA : LSR : TAY

    LDA $12 : AND #$00FF : STA $4204           ; divide random number...
    %a8()
    STY $14 : STY $4206                        ; divide bottom half of random number by Y
    %a16()
    PEA $0000 : PLA : PEA $0000 : PLA
    LDA $4216 : STA $12                        ; randomly selected preset

    ASL : TAY
    LDA [$16],Y : STA $16                      ; random preset macro pointer in $16
    LDY #$0004 : LDA [$16],Y                   ; finally reached the pointer to the preset
    STA !ram_load_preset

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
+   LDA !sram_presetrando_max_reserves : BEQ .no_reserves              ; check if max = 0
    LDA !ram_seed_Y : AND #$F000 : LSR #4 : XBA                        ; reuse random number
    CMP !sram_presetrando_max_reserves : BPL .cap_reserves             ; check if capped
    ASL : TAX : LDA.l PresetRandoReserveTable,X                       ; load value from table
    STA !SAMUS_RESERVE_MAX : STA !SAMUS_RESERVE_ENERGY                                      ; store reserves
    BRA +

  .cap_reserves
    BEQ .reserves_done                                                 ; check for 0 condition (value is equal to max)
    SEC : SBC !sram_presetrando_max_reserves                           ; subtract max from random number
    CMP !sram_presetrando_max_reserves : BPL .cap_reserves             ; check if capped again (loop)

  .reserves_done
    ASL : TAX : LDA.l PresetRandoReserveTable,X                       ; load a proper value from table
    STA !SAMUS_RESERVE_MAX : STA !SAMUS_RESERVE_ENERGY                                              ; store capped reserves
    BRA +

  .no_reserves
    STZ !SAMUS_RESERVE_MAX : STZ !SAMUS_RESERVE_ENERGY                                              ; capped at zero

    ; missiles
+   LDA !sram_presetrando_max_missiles : BEQ .no_missiles              ; check if max = 0
    LDA !ram_seed_X : AND #$0FF0 : LSR #4                              ; reuse random number
    CMP !sram_presetrando_max_missiles : BPL .cap_missiles             ; check if capped
    ASL : TAX : LDA.l PresetRandoAmmoTable,X                       ; load a proper value from table
    STA !SAMUS_MISSILES : STA !SAMUS_MISSILES_MAX                                      ; store random missiles
    BRA +

  .cap_missiles
    BEQ .missiles_done                                                 ; check for 0 condition (value is equal to max)
    SEC : SBC !sram_presetrando_max_missiles
    CMP !sram_presetrando_max_missiles : BPL .cap_missiles

  .missiles_done
    ASL : TAX : LDA.l PresetRandoAmmoTable,X
    STA !SAMUS_MISSILES : STA !SAMUS_MISSILES_MAX                                              ; store capped missiles
    BRA +

  .no_missiles
    STZ !SAMUS_MISSILES : STZ !SAMUS_MISSILES_MAX                                              ; capped at zero

    ; supers
+   LDA !sram_presetrando_max_supers : BEQ .no_supers                  ; check if max = 0
    JSL MenuRNG : AND #$00FF                                           ; get new random number
    CMP !sram_presetrando_max_supers : BPL .cap_supers                 ; check if capped
    ASL : TAX : LDA.l PresetRandoAmmoTable,X
    STA !SAMUS_SUPERS : STA !SAMUS_SUPERS_MAX                                      ; store random supers
    BRA +

  .cap_supers
    BEQ .supers_done                                                   ; check for 0 condition (value is equal to max)
    SEC : SBC !sram_presetrando_max_supers
    CMP !sram_presetrando_max_supers : BPL .cap_supers

  .supers_done
    ASL : TAX : LDA.l PresetRandoAmmoTable,X
    STA !SAMUS_SUPERS : STA !SAMUS_SUPERS_MAX                                              ; store capped supers
    BRA +

  .no_supers
    STZ !SAMUS_SUPERS : STZ !SAMUS_SUPERS_MAX                                              ; capped at zero

    ; pbs
+   LDA !sram_presetrando_max_pbs : BEQ .no_pbs                        ; check if max = 0
    LDA !ram_seed_Y : XBA : AND #$00FF                                 ; get new random number
    CMP !sram_presetrando_max_pbs : BPL .cap_pbs                       ; check if capped
    ASL : TAX : LDA.l PresetRandoAmmoTable,X
    STA !SAMUS_PBS : STA !SAMUS_PBS_MAX                                      ; store random pbs
    BRA +

  .cap_pbs
    BEQ .pbs_done                                                      ; check for 0 condition (value is equal to max)
    SEC : SBC !sram_presetrando_max_pbs
    CMP !sram_presetrando_max_pbs : BPL .cap_pbs

  .pbs_done
    ASL : TAX : LDA.l PresetRandoAmmoTable,X
    STA !SAMUS_PBS : STA !SAMUS_PBS_MAX                                              ; store capped pbs
    BRA +

  .no_pbs
    STZ !SAMUS_PBS : STZ !SAMUS_PBS_MAX                                              ; capped at zero

    ; etanks
+   LDA !sram_presetrando_max_etanks : BEQ .no_etanks                  ; check if max = 0
    JSL MenuRNG2 : AND #$000F                                          ; get new random number
    CMP !sram_presetrando_max_etanks : BPL .cap_etanks                 ; check if capped
    ASL : TAX : LDA.l PresetRandoETankTable,X                         ; load value from table
    STA !SAMUS_HP : STA !SAMUS_HP_MAX : BRA .done                                  ; store energy

  .cap_etanks
    BEQ .etanks_done                                                   ; check for 0 condition (value is equal to max)
    SEC : SBC !sram_presetrando_max_etanks
    CMP !sram_presetrando_max_etanks : BPL .cap_etanks

  .etanks_done
    ASL : TAX : LDA.l PresetRandoETankTable,X                         ; load value from table
    STA !SAMUS_HP : STA !SAMUS_HP_MAX                                              ; store energy
    BRA .done

  .no_etanks
    LDA #$0063 : STA !SAMUS_HP : STA !SAMUS_HP_MAX                                 ; capped at zero (99)

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
