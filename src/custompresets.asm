; --------------
; Custom Presets
; --------------

org $83C700
print pc, " custompresets start"

custom_preset_save:
{
    LDA !sram_custom_preset_slot
    ASL : XBA : TAX ; multiply by 200h (slot offset)
    LDA #$5AFE : STA !PRESET_SLOTS+$00,X   ; mark this slot as "SAFE" to load
    LDA #$01EE : STA !PRESET_SLOTS+$02,X   ; record slot size for future compatibility
    LDA $078B : STA !PRESET_SLOTS+$04,X    ; Elevator Index
    LDA $078D : STA !PRESET_SLOTS+$06,X    ; DDB
    LDA $078F : STA !PRESET_SLOTS+$08,X    ; DoorOut Index
    LDA $079B : STA !PRESET_SLOTS+$0A,X    ; MDB
    LDA $079F : STA !PRESET_SLOTS+$0C,X    ; Region
    LDA $07C3 : STA !PRESET_SLOTS+$0E,X    ; GFX Pointers
    LDA $07C5 : STA !PRESET_SLOTS+$10,X    ; GFX Pointers
    LDA $07C7 : STA !PRESET_SLOTS+$12,X    ; GFX Pointers
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

    INX                                     ; Restore X for sanity
    LDA $0917 : STA !PRESET_SLOTS+$1B0,X    ; Layer 2 X position
    LDA $0919 : STA !PRESET_SLOTS+$1B2,X    ; Layer 2 Y position
    LDA $0921 : STA !PRESET_SLOTS+$1B4,X    ; BG2 X offset
    LDA $0923 : STA !PRESET_SLOTS+$1B6,X    ; BG2 Y offset

    PHX : PHB
    TXA : CLC : ADC #$31B8 : TAY ; Y = Destination
    LDX #$CD20 : LDA #$0031      ; X = Source, A = Size
    MVN $7EF0                    ; srcBank, destBank
    PLB : PLX

    LDA $0AF8 : STA $7031EA,X    ; Samus subpixel X
    LDA $0AFC : STA $7031EC,X    ; Samus subpixel Y
    ; next available byte is $7031EE

    RTL
}

custom_preset_load:
{
    LDA !sram_custom_preset_slot
    ASL : XBA : TAX              ; multiply by 200h
                                 ; skip past "5AFE" word
                                 ; skip past size for now
    LDA !PRESET_SLOTS+$04,X : STA $078B    ; Elevator Index
    LDA !PRESET_SLOTS+$06,X : STA $078D    ; DDB
    LDA !PRESET_SLOTS+$08,X : STA $078F    ; DoorOut Index
    LDA !PRESET_SLOTS+$0A,X : STA $079B    ; MDB
    LDA !PRESET_SLOTS+$0C,X : STA $079F    ; Region
    LDA !PRESET_SLOTS+$0E,X : STA $07C3    ; GFX Pointers
    LDA !PRESET_SLOTS+$10,X : STA $07C5    ; GFX Pointers
    LDA !PRESET_SLOTS+$12,X : STA $07C7    ; GFX Pointers
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
    ; Fixes bad scrolling caused by a loading into a position that
    ; is normally hidden until passing over a red scroll block.
    ; These fixes can often be found in nearby door asm.
    PHP
    %ai16()
    LDA !ram_custom_preset : CMP #$5AFE : BNE .category_presets
    BRL .custom_presets

  .category_presets
    %a8() : %i16()
    LDA #$01 : LDX $079B         ; X = room ID
    CPX #$A4B1 : BPL .halfway    ; organized by room ID so we only have to check half

+   CPX #$8091 : BNE +           ; Preset: Pirate Ship Ridley - Ridley
    STA $7ECD21
    LDA #$00 : STA $7ECD20
    BRA .end
+   CPX #$87B7 : BNE +           ; Preset: Chozodia - Waterway Speedkeep
    LDA #$02 : STA $7ECD25
    BRA .end
+   CPX #$96BA : BNE +           ; Preset: Tourian - Tourian Escape
    STA $7ECD3E
    BRA .end
+   CPX #$9AD9 : BNE +           ; Preset: Cleanup 1 - Super Door Over Crumples
    STA $7ECD39 : STA $7ECD3D
    LDA #$00 : STA $7ECD38
    BRA .end
+   CPX #$9F11 : BNE +
    LDY $0AFA : CPY #$029A       ; two presets, each with scroll issues
    BPL ++                       ; branch if Ypos > 666
    STA $7ECD21                  ; Preset: Pirate Ship Ridley - Two Gate
    BRA .end
++  STA $7ECD25 : STA $7ECD26    ; Preset: Pirate Ship Draygon - Underground Path
    STA $7ECD27 : STA $7ECD28 : STA $7ECD29
    BRA .end
+   CPX #$A011 : BNE +           ; Preset: Cleanup 1 - Crumble Pillers
    STA $7ECD26
    BRA .end
+   CPX #$A3AE : BNE +           ; Preset: Cleanup 2 - Slick Space Boost
    LDA #$00 : STA $7ECD32

  .end
    PLP
    RTL

  .halfway
+   CPX #$A4B1 : BNE +           ; Preset: Cleanup 2 - Mini Kraid Long Room
    STA $7ECD28 : STA $7ECD29
    BRA .done
+   CPX #$A618 : BNE +           ; Preset: Lower Norfair - Leaving Spark Puzzle
    STA $7ECD20 : STA $7ECD21 : STA $7ECD22
    BRA .done
+   CPX #$B6EE : BNE +           ; Preset: Lower Norfair - Chain Spark Puzzle
    STA $7ECD37
    BRA .done
+   CPX #$C0E4 : BNE +           ; Preset: Pirate Ship Ridley - Kihunter Zoo
    STA $7ECD2A : STA $7ECD2B
    STA $7ECD2D : STA $7ECD2E
    BRA .done
+   CPX #$C2B0 : BNE +           ; Preset: Pirate Shipe Ridley - Inside Outside Spark
    LDA #$04 : STA $1982
    STA $1984 : STA $1986
    BRA +
+   CPX #$DB31 : BNE +           ; Preset: Tourian - Blind Speedkeep
    STA $7ECD22
    LDA #$00 : STA $7ECD21
    BRA .done
+   CPX #$DE4D : BNE +           ; Preset: Tourian - Vault Missile
    STA $7ECD22
    BRA .done

  .done
+   PLP
    RTL

  .custom_presets
    PHB
    LDA !sram_custom_preset_slot
    ASL : XBA
    CLC : ADC #$31E9 : TAX       ; X = Source
    LDY #$CD52 : LDA #$0031      ; Y = Destination, A = Size-1
    MVP $F07E                    ; srcBank, destBank
    LDA #$0000 : STA !ram_custom_preset
    PLB
    PLP
    RTL
}

print pc, " custompresets end"
warnpc $B3C000 ; mainmenu.asm

