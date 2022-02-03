; --------------
; Custom Presets
; --------------

; Backward compatibility was promised. Just because it's unused, doesn't mean you can use it.

custom_preset_save:
{
    LDA !sram_custom_preset_slot
    ASL : XBA : TAX ; multiply by 200h (slot offset)
    LDA #$5AFE : STA !PRESET_SLOTS+$00,X   ; mark this slot as "SAFE" to load
    LDA #$01EE : STA !PRESET_SLOTS+$02,X   ; record slot size for future compatibility
;    LDA $078B : STA !PRESET_SLOTS+$04,X    ; Elevator Index
    LDA $078D : STA !PRESET_SLOTS+$06,X    ; DDB
;    LDA $078F : STA !PRESET_SLOTS+$08,X    ; DoorOut Index
    LDA $079B : STA !PRESET_SLOTS+$0A,X    ; MDB
;    LDA $079F : STA !PRESET_SLOTS+$0C,X    ; Region
;    LDA $07C3 : STA !PRESET_SLOTS+$0E,X    ; GFX Pointers
;    LDA $07C5 : STA !PRESET_SLOTS+$10,X    ; GFX Pointers
;    LDA $07C7 : STA !PRESET_SLOTS+$12,X    ; GFX Pointers
    LDA $07F3 : STA !PRESET_SLOTS+$14,X    ; Music Bank
    LDA $07F5 : STA !PRESET_SLOTS+$16,X    ; Music Track
    LDA $090F : STA !PRESET_SLOTS+$18,X    ; Screen subpixel X position
    LDA $0911 : STA !PRESET_SLOTS+$1A,X    ; Screen X position in pixels
    LDA $0913 : STA !PRESET_SLOTS+$1C,X    ; Screen subpixel Y position
    LDA $0915 : STA !PRESET_SLOTS+$1E,X    ; Screen Y position in pixels
    LDA $093F : STA !PRESET_SLOTS+$20,X    ; Ceres escape flag
    LDA $09A2 : STA !PRESET_SLOTS+$22,X    ; Equipped Items
    LDA $09A4 : STA !PRESET_SLOTS+$24,X    ; Collected Items
    LDA $09A6 : STA !PRESET_SLOTS+$26,X    ; Beams
    LDA $09A8 : STA !PRESET_SLOTS+$28,X    ; Beams
    LDA $09C0 : STA !PRESET_SLOTS+$2A,X    ; Manual/Auto reserve tank
    LDA $09C2 : STA !PRESET_SLOTS+$2C,X    ; Health
    LDA $09C4 : STA !PRESET_SLOTS+$2E,X    ; Max health
    LDA $09C6 : STA !PRESET_SLOTS+$30,X    ; Missiles
    LDA $09C8 : STA !PRESET_SLOTS+$32,X    ; Max missiles
    LDA $09CA : STA !PRESET_SLOTS+$34,X    ; Supers
    LDA $09CC : STA !PRESET_SLOTS+$36,X    ; Max supers
    LDA $09CE : STA !PRESET_SLOTS+$38,X    ; Pbs
    LDA $09D0 : STA !PRESET_SLOTS+$3A,X    ; Max pbs
    LDA $09D2 : STA !PRESET_SLOTS+$3C,X    ; Currently selected item
    LDA $09D4 : STA !PRESET_SLOTS+$3E,X    ; Max reserves
    LDA $09D6 : STA !PRESET_SLOTS+$40,X    ; Reserves
    LDA $0A1C : STA !PRESET_SLOTS+$42,X    ; Samus position/state
    LDA $0A1E : STA !PRESET_SLOTS+$44,X    ; More position/state
    LDA $0A68 : STA !PRESET_SLOTS+$46,X    ; Flash suit
    LDA $0A76 : STA !PRESET_SLOTS+$48,X    ; Hyper beam
    LDA $0AF6 : STA !PRESET_SLOTS+$4A,X    ; Samus X
    LDA $0AFA : STA !PRESET_SLOTS+$4C,X    ; Samus Y
    LDA $0B3F : STA !PRESET_SLOTS+$4E,X    ; Blue suit

    ; Copy SRAM
    ; This was deemed unnecessary but remains reserved for backward compatibility
;    TXA : CLC : ADC #$005F : TAX
  .save_sram_loop
;    DEX : PHX : TXA : AND #$01FF : TAX
;    LDA $7ED7C0,X : PLX : STA !PRESET_SLOTS+$50,X
;    DEX : TXA : BIT #$0100 : BEQ .save_sram_loop

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

    LDA $0AF8 : STA $7031EA,X ; Samus subpixel X
    LDA $0AFC : STA $7031EC,X ; Samus subpixel Y
    ; next available byte is $7031EE

    RTL
}

custom_preset_load:
{
    LDA !sram_custom_preset_slot
    ASL : XBA : TAX              ; multiply by 200h
                                 ; skip past "5AFE" word
                                 ; skip past size for now
;    LDA !PRESET_SLOTS+$04,X : STA $078B    ; Elevator Index
    LDA !PRESET_SLOTS+$06,X : STA $078D    ; DDB
;    LDA !PRESET_SLOTS+$08,X : STA $078F    ; DoorOut Index
    LDA !PRESET_SLOTS+$0A,X : STA $079B    ; MDB
;    LDA !PRESET_SLOTS+$0C,X : STA $079F    ; Region
;    LDA !PRESET_SLOTS+$0E,X : STA $07C3    ; GFX Pointers
;    LDA !PRESET_SLOTS+$10,X : STA $07C5    ; GFX Pointers
;    LDA !PRESET_SLOTS+$12,X : STA $07C7    ; GFX Pointers
    LDA !PRESET_SLOTS+$14,X : STA $07F3    ; Music Bank
    LDA !PRESET_SLOTS+$16,X : STA $07F5    ; Music Track
    LDA !PRESET_SLOTS+$18,X : STA $090F    ; Screen subpixel X position
    LDA !PRESET_SLOTS+$1A,X : STA $0911    ; Screen X position in pixels
    LDA !PRESET_SLOTS+$1C,X : STA $0913    ; Screen subpixel Y position
    LDA !PRESET_SLOTS+$1E,X : STA $0915    ; Screen Y position in pixels
    LDA !PRESET_SLOTS+$20,X : STA $093F    ; Ceres escape flag
    LDA !PRESET_SLOTS+$22,X : STA $09A2    ; Equipped Items
    LDA !PRESET_SLOTS+$24,X : STA $09A4    ; Collected Items
    LDA !PRESET_SLOTS+$26,X : STA $09A6    ; Beams
    LDA !PRESET_SLOTS+$28,X : STA $09A8    ; Beams
    LDA !PRESET_SLOTS+$2A,X : STA $09C0    ; Manual/Auto reserve tank
    LDA !PRESET_SLOTS+$2C,X : STA $09C2    ; Health
    LDA !PRESET_SLOTS+$2E,X : STA $09C4    ; Max health
    LDA !PRESET_SLOTS+$30,X : STA $09C6    ; Missiles
    LDA !PRESET_SLOTS+$32,X : STA $09C8    ; Max missiles
    LDA !PRESET_SLOTS+$34,X : STA $09CA    ; Supers
    LDA !PRESET_SLOTS+$36,X : STA $09CC    ; Max supers
    LDA !PRESET_SLOTS+$38,X : STA $09CE    ; Pbs
    LDA !PRESET_SLOTS+$3A,X : STA $09D0    ; Max pbs
    LDA !PRESET_SLOTS+$3C,X : STA $09D2    ; Currently selected item
    LDA !PRESET_SLOTS+$3E,X : STA $09D4    ; Max reserves
    LDA !PRESET_SLOTS+$40,X : STA $09D6    ; Reserves
    LDA !PRESET_SLOTS+$42,X : STA $0A1C    ; Samus position/state
    LDA !PRESET_SLOTS+$44,X : STA $0A1E    ; More position/state
    LDA !PRESET_SLOTS+$46,X : STA $0A68    ; Flash suit
    LDA !PRESET_SLOTS+$48,X : STA $0A76    ; Hyper beam
    LDA !PRESET_SLOTS+$4A,X : STA $0AF6    ; Samus X
    LDA !PRESET_SLOTS+$4C,X : STA $0AFA    ; Samus Y
    LDA !PRESET_SLOTS+$4E,X : STA $0B3F    ; Blue suit

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

    LDA !PRESET_SLOTS+$1B0,X : STA $0917    ; Layer 2 X position
    LDA !PRESET_SLOTS+$1B2,X : STA $0919    ; Layer 2 Y position
    LDA !PRESET_SLOTS+$1B4,X : STA $0921    ; BG2 X offset
    LDA !PRESET_SLOTS+$1B6,X : STA $0923    ; BG2 Y offset

    LDA !PRESET_SLOTS+$02,X : CMP #$01BA : BMI .done_no_scrolls
    LDA #$5AFE : STA !ram_custom_preset
    LDA $703002,X : CMP #$01EC : BMI .done_with_scrolls
    LDA $7031EA,X : STA $0AF8    ; Samus subpixel X
    LDA $7031EC,X : STA $0AFC    ; Samus subpixel Y

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
    %ai16()
    LDA !ram_custom_preset : CMP #$5AFE : BNE .category_presets
    BRL .custom_presets

  .category_presets
    %a8() : %i16()
    LDA #$01 : LDX !ROOM_ID      ; X = room ID
    CPX #$C000 : BMI +           ; organized by room ID so we only have to check half
    BRL .halfway

  .topdone
    PLP
    RTL

+   CPX #$A011 : BNE +           ; bottom-left of Etecoons Etank
    STA $7ECD25 : STA $7ECD26
    BRA .topdone
+   CPX #$A3AE : BNE +           ; hidden area behind Alpha Power Bombs
    LDY !SAMUS_X : CPY #$0100    ; no fix if Xpos > 255
    BPL .topdone
    STA $7ECD20
+   CPX #$A408 : BNE +           ; top of Below Spazer Room
    LDY !SAMUS_Y : CPY #$00B0    ; no fix if Ypos > 176
    BPL .topdone
    LDA #$02
    STA $7ECD20 : STA $7ECD21
    BRA .topdone
+   CPX #$A6A1 : BNE +           ; Elevator to Upper Norfair (from Kraid's area)
    STA $7ECD20
    BRA .topdone
+   CPX #$AC83 : BNE +           ; left of Green Bubbles Missile Room (Norfair Reserve)
    STA $7ECD20
    BRA .topdone
+   CPX #$AE32 : BNE +           ; bottom of Volcano Room
    STA $7ECD26
    BRA .topdone
+   CPX #$B07A : BNE +           ; top of Bat Cave
    STA $7ECD20
    BRA .topdone
+   CPX #$B1E5 : BNE +           ; bottom of Acid Chozo Room
    STA $7ECD26 : STA $7ECD27 : STA $7ECD28
    LDA #$00 : STA $7ECD23 : STA $7ECD24
    BRA .done
+   CPX #$B283 : BNE +           ; bottom of GT's Room
    LDY !SAMUS_Y : CPY #$00D0    ; no fix if Ypos < 208
    BMI .done
    STA $7ECD22 : STA $7ECD23    ; leaving GT's room
    LDA #$02
    STA $7ECD20 : STA $7ECD21
+   CPX #$B3A5 : BNE +           ; Pre-Pillars
    LDY !SAMUS_Y : CPY #$0199    ; no scroll fix if Ypos < 409
    BMI ++
    STA $7ECD22 : STA $7ECD24    ; bottom of Pre-Pillars
    LDA #$00 : STA $7ECD21
    BRA .done
++  LDA #$02 : STA $7ECD21       ; middle/top of Pre-Pillars
    BRA .done
+   CPX #$B4AD : BNE +           ; top of Worst Room in the Game
    LDA #$02 : STA $7ECD20
+   CPX #$B585 : BNE .done       ; top of Kihunter Stairs
    LDY !SAMUS_Y : CPY #$008C    ; no scroll fix if Ypos > 140
    BPL .done
    STA $7ECD20
    LDA #$00 : STA $7ECD23

  .done
    PLP
    RTL

  .halfway
    CPX #$DF45 : BMI +           ; Ceres rooms set BG1 offsets manually
    BRL .ceres
+   CPX #$C98E : BNE +           ; bottom-left of Bowling Room
    LDA #$00 : STA $7ECD26 : STA $7ECD27
    STA $7ECD28 : STA $7ECD29
    STA $7ECD2A : STA $7ECD2B
    BRA .done
+   CPX #$CAF6 : BNE +           ; WS Shaft
    LDY !SAMUS_X : CPY #$05A0    ; fix East Supers if Xpos > 1440
    BPL ++
    LDA #$02                     ; lower area before Basement
    STA $7ECD48 : STA $7ECD4E
    BRA .done
++  STA $7ECD49                  ; hidden area before WS East Supers
    BRA .done
+   CPX #$CBD5 : BNE +           ; top of Electric Death Room (WS E-Tank)
    LDA #$02
    STA $7ECD20
    BRA .done
+   CPX #$CC6F : BNE +           ; right of Basement (Phantoon)
    STA $7ECD24
    BRA .bottomdone
+   CPX #$D1A3 : BNE +           ; bottom of Crab Shaft
    STA $7ECD26
    LDA #$02 : STA $7ECD24
    BRA .bottomdone
+   CPX #$D21C : BNE +           ; Crab Hole
    LDY !SAMUS_Y : CPY #$00D0
    BMI ++    
    STA $7ECD21                  ; bottom of Crab Hole
    LDA #$00 : STA $7ECD20
    BRA .bottomdone
++  LDA #$02 : STA $7ECD20       ; top of Crab Hole
    BRA .bottomdone
+   CPX #$D48E : BNE +           ; Oasis (bottom of Toilet)
    LDA #$02
    STA $7ECD20 : STA $7ECD21
    BRA .bottomdone
+   CPX #$D69A : BNE .bottomdone ; Pants Room (door to Shaktool)
    STA $7ECD21
    LDA #$00 : STA $7ECD22

  .bottomdone
    PLP
    RTL

  .ceres
    LDA #$00 : STA $7E005F       ; Initialize mode 7
    CPX #$DF45 : BNE +           ; Ceres Elevator
    LDA #$00 : STA $7E091E : STA $7E0920
    BRL .ceresdone

+   STA $7E0078 : STA $7E0079    ; Ceres Elevator room already does this
    STA $7E007A : STA $7E007B    ; Other rooms should zero out the values
    STA $7E007C : STA $7E007D
    STA $7E007E : STA $7E007F
    STA $7E0080 : STA $7E0081
    STA $7E0082 : STA $7E0083

    CPX #$DF8D : BNE +           ; Ceres Falling Tiles
    LDA #$01 : STA $7E091E
    LDA #$02 : STA $7E0920
    BRA .ceresdone
+   CPX #$DFD7 : BNE +           ; Ceres Magnet Stairs
    LDA #$03 : STA $7E091E
    LDA #$02 : STA $7E0920
    BRA .ceresdone
+   CPX #$E021 : BNE +           ; Ceres Dead Scientists
    LDA #$04 : STA $7E091E
    LDA #$03 : STA $7E0920
    BRA .ceresdone
+   CPX #$E06B : BNE +           ; Ceres 58 Escape
    LDA #$06 : STA $7E091E
    LDA #$03 : STA $7E0920
    BRA .ceresdone
+   CPX #$E0B5 : BNE .ceresdone  ; Ceres Ridley
    LDA #$08 : STA $7E091E
    LDA #$03 : STA $7E0920

  .ceresdone
    PLP
    RTL

  .custom_presets
    PHB
    LDA !sram_custom_preset_slot
    ASL : XBA
    CLC : ADC #$31E9 : TAX       ; X = Source
    LDY #$CD51 : LDA #$0031      ; Y = Destination, A = Size-1
    MVP $F07E                    ; srcBank, destBank
    LDA #$0000 : STA !ram_custom_preset
    PLB
    PLP
    RTL
}

preset_special_fixes:
{
    ; Big Pink Power Bomb blocks before Mission Impossible
    LDA !ROOM_ID : CMP #$9D19 : BNE +
    LDA !SAMUS_Y : CMP #$02C0 : BMI +
    CMP #$03C9 : BPL +
    LDA #$00FF
    STA $7F2208 : STA $7F220A : STA $7F22A8 : STA $7F22AA
    STA $7F2348 : STA $7F234A : STA $7F23E8 : STA $7F23EA
    BRA .done

    ; Leaving Hi-Jump Boots when left of column
+   LDA !ROOM_ID : CMP #$A9E5 : BNE +
    LDA !SAMUS_X : CMP #$0095 : BPL +
    LDA #$00FF
    STA $7F0052 : STA $7F0072 : STA $7F0092
    BRA .done

    ; Top of Kihunter Stairs before Firefleas
    LDA !ROOM_ID : CMP #$B585 : BNE +
    LDA !SAMUS_Y : CMP #$00F0 : BMI +
    LDA #$00FF
    STA $7F036E : STA $7F0370 : STA $7F0374 : STA $7F0376
    STA $7F03D4 : STA $7F0610 : STA $7F0612
;    BRA .done

  .done
+   RTL
}

