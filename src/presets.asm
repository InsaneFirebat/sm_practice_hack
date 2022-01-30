;org $82FA00
org $81F4D0
print pc, " presets start"

preset_load:
{
    PHP
    LDA !MUSIC_DATA : STA !SRAM_MUSIC_DATA
    LDA !MUSIC_TRACK : STA !SRAM_MUSIC_TRACK

    JSL $809E93  ; Clear timer RAM
    JSL preset_load_bank82 ; few JSR's in Bank 82
    JSL $91E00D  ; Initialise Samus

    JSL preset_load_preset

    JSL preset_start_gameplay  ; Start gameplay

    JSL $809A79  ; HUD routine when game is loading
    JSL $90AD22  ; Reset projectile data

    PHP
    REP #$30
    LDY #$0020
    LDX #$0000
  .paletteLoop
    LDA $7EC180,x : STA $7EC380,x  ; Target Samus' palette = [Samus' palette]
    INX #2
    DEY #2
    BNE .paletteLoop
    PLP

    LDA #$0000
    STA $7EC400  ; Used as door fade timer
    LDA #$0001
    STA $0723    ; Screen fade delay = 1
    STA $0725    ; Screen fade counter = 1

    JSL $80834B  ; Enable NMI with $84 options
    JSL $868000  ; Enable enemy projectiles
    JSL $8483AD  ; Enable PLMs
    JSL $8DC4C2  ; Enable palette FX objects
    JSL $888288  ; Enable HDMA objects
    JSL $878000  ; Enable animated tile objects
    JSL $908E0F  ; Set liquid physics type

    LDA #$0006 : STA $0DA0
  .loopSomething
    JSL $A08CD7  ; Transfer enemy tiles to VRAM and initialize enemies
    JSL $808338  ; Wait for NMI
    DEC $0DA0    ; Decrement $0DA0
    BPL .loopSomething

    LDA #$0008 : STA !GAMEMODE
    %a8() : LDA #$0F : STA $51 : %a16()

    PHP
    REP #$30
    LDY #$0200
    LDX #$0000
  .paletteLoop2
    LDA $7EC200,x
    STA $7EC000,x  ; Palettes = [target palettes]
    INX #2
    DEY #2
    BNE .paletteLoop2
    PLP

    ; Fix Samus' palette
    JSL $91DEBA

    ; Re-upload OOB viewer tiles if needed
    LDA !ram_oob_watch_active : BEQ +
    JSL upload_sprite_oob_tiles

    ; Re-upload OOB viewer tiles if needed
+   LDA !ram_oob_watch_active : BEQ .done_upload_sprite_oob_tiles
    JSL upload_sprite_oob_tiles

  .done_upload_sprite_oob_tiles
    JSL reset_all_counters

    ; Clear morph and door transition flags
    STZ $1F6B : STZ $0795
    LDA $09A1 : AND #$7FFF : STA $09A1

    ; Clear enemies if not in certain rooms
    LDA !ROOM_ID : CMP #$DD58 : BEQ .set_mb_state
    JSR clear_all_enemies
    BRA .done_clearing_enemies

  .set_mb_state
    ; If glass is broken, assume we should skip MB1
    LDA $7ED820 : BIT #$0004 : BEQ .done_clearing_enemies
    ; Set health to 1 as a hint this was done by a preset
    LDA #$0001 : STA $0FCC

  .done_clearing_enemies
    PLP
    RTL
}

clear_all_enemies:
{
    ; Clear enemies (8000 = solid to Samus, 0400 = Ignore Samus projectiles)
    LDA #$0000
  .loop
    TAX : LDA $0F86,X : BIT #$8400 : BNE .done_clearing
    ORA #$0200 : STA $0F86,X
  .done_clearing
    TXA : CLC : ADC #$0040 : CMP #$0400 : BNE .loop
    RTS
}

preset_load_destination_state_and_tiles:
{
    ; Original logic from $82E76B
    PHP : PHB
    REP #$30
    PEA $8F00
    PLB : PLB
    JSR $DDF1  ; Load destination room CRE bitset
    JSR $DE12  ; Load door header
    JSR $DE6F  ; Load room header
    JSR $DEF2  ; Load state header
    JMP $E78C
}

reset_all_counters:
{
    LDA #$0000
    STA !ram_room_has_set_rng
    STA $09DA : STA $09DC : STA $09DE : STA $09E0
    STA !ram_seg_rt_frames : STA !ram_seg_rt_seconds : STA !ram_seg_rt_minutes
    STA !ram_realtime_room : STA !ram_last_realtime_room
    STA !ram_gametime_room : STA !ram_last_gametime_room
    STA !ram_last_room_lag : STA !ram_last_door_lag_frames : STA !ram_transition_counter
    RTL
}

startgame_seg_timer:
{
    ; seg timer will be 1:50 (1 second, 50 frames) behind by the time it appears
    ; 20 frames more if the file was new
    ; initializing to 1:50 for now
    LDA #$0032 : STA !ram_seg_rt_frames
    LDA #$0001 : STA !ram_seg_rt_seconds
    LDA #$0000 : STA !ram_seg_rt_minutes
    JSL $808924    ; overwritten code
    RTL
}

preset_load_preset:
{
    PHB
    LDA #$0000
    STA $7E09D2 ; Current selected weapon
    STA $7E0A04 ; Auto-cancel item
    LDA #$5AFE : STA $0917 ; Load garbage into Layer 2 X position
    LDA #$FFFF : STA !ram_reset_segment_later

    ; check if custom preset is being loaded
    LDA !ram_custom_preset : BEQ .normal_preset
    JSL custom_preset_load
    BRA .done

  .normal_preset
    LDA !sram_preset_category : ASL : TAX
    LDA.l preset_banks,X : %a8() : PHA : PLB : %a16()

    LDA !ram_load_preset : STA !sram_last_preset : STA $C1
    LDA #$0000 : STA !ram_load_preset

    LDX #$0000
  .loop_path
    LDA $C1 : STA $7F0002,X
    INX #2
    LDA ($C1) : STA $C1 : BNE .loop_path

  ; then traverse from the first preset until the last one, and apply them
  .loop_presets
    DEX #2 : BMI .done
    JSR preset_to_memory
    BRA .loop_presets

  .done
    LDA #$0000
    STA $0795   ; "Currently transitioning"
    STA $0797   ; "Currently transitioning"
    PLB
    RTL
}

preset_to_memory:
{
    STZ $00
    LDA $7F0002,X
    INC #2 : TAY

  .loop
    LDA ($00),Y : INY : INY : CMP #$FFFF : BEQ .done : STA $C3
    LDA ($00),Y : INY : STA $C5
    LDA ($00),Y : INY : AND #$00FF : CMP #$0001 : BEQ .one

  .two
    LDA ($00),Y : INY : INY : STA [$C3]
    BRA .loop

  .one
    %a8()
    LDA ($00),Y : INY : STA [$C3]
    %a16()
    BRA .loop

  .done
    RTS
}

preset_banks:
{
  dw presets_redesign_crateria_ceres_elevator>>16
}
warnpc $81F77F
print pc, " presets end"


org $82FD80
preset_load_bank82:
{
    JSR $819B    ; Initialize IO registers
    JSR $82E2    ; Load standard BG3 tiles and sprite tiles, clear tilemaps
    JSR $82C5    ; Load initial palette
    RTL
}
warnpc $82FD9B

org $82E8D9
    JSL preset_room_setup_asm_fixes


;org $80F000
org $80F62E
print pc, " preset_start_gameplay start"

; This method is very similar to $80A07B (start gameplay)
preset_start_gameplay:
{
    PHP
    PHB
    PHK : PLB    ; DB = $80
    %ai16()
    SEI          ; Disable IRQ
    STZ $420B    ; Disable all (H)DMA
    STZ $07E9    ; Scrolling finished hook = 0
    STZ $0943    ; Timer status = inactive

    JSL $828A9A  ; Reset sound queues

    LDA #$FFFF : STA $05F5  ; Disable sounds

    JSL $80835D  ; Disable NMI
    JSL $80985F  ; Disable horizontal and vertical timer interrupts
    JSL $82E76B  ; Load destination room CRE bitset, door/room/state headers, tiles
    JSL $878016  ; Clear animated tile objects
    JSL $88829E  ; Wait until the end of a v-blank and clear (H)DMA enable flags

    ; Set Samus last position same as current position
    LDA !SAMUS_X : STA $0B10 : LDA !SAMUS_X_SUBPX : STA $0B12
    LDA !SAMUS_Y : STA $0B14 : LDA !SAMUS_Y_SUBPX : STA $0B16

    ; Set Samus last pose same as current pose
    LDA !SAMUS_POSE : STA $0A20

    ; Preserve layer 2 values we may have loaded from presets
    LDA $0923 : PHA
    LDA $0921 : PHA
    LDA $0919 : PHA
    LDA $0917 : PHA

    JSL $8882C1  ; Initialize special effects for new room
    JSL $8483C3  ; Clear PLMs
    JSL $868016  ; Clear enemy projectiles
    JSL $8DC4D8  ; Clear palette FX objects
    JSL $90AC8D  ; Update beam graphics
    JSL $82E139  ; Load target colours for common sprites, beams and slashing enemies / pickups
    JSL $A08A1E  ; Load enemies
    JSL $80A23F  ; Clear BG2 tilemap
    JSL $82E7D3  ; Load level data, CRE, tile table, scroll data, create PLMs and execute door ASM and room setup ASM
    JSL $89AB82  ; Load FX
    JSL $82E97C  ; Load library background

    ; Careful about Redesign vs Axeil rooms
    JSR preset_scroll_fixes

    ; Special fixes for specific presets
    LDA !PRESET_SPECIAL : BEQ +
    JSL preset_special_fixes

    ; Pull layer 2 values, and use them if they are valid
+   PLA : CMP #$5AFE : BEQ .calculate_layer_2
    STA $0917
    PLA : STA $0919
    PLA : STA $0921
    PLA : STA $0923
    BRA .layer_2_loaded

  .calculate_layer_2
    PLA : PLA : PLA        ; Values are not useful, but still need to pull them out of the stack
    JSR $A2F9              ; Calculate layer 2 X position
    JSR $A33A              ; Calculate layer 2 Y position
    LDA $0917 : STA $0921  ; BG2 X scroll = layer 2 X scroll position
    LDA $0919 : STA $0923  ; BG2 Y scroll = layer 2 Y scroll position

  .layer_2_loaded
    JSR $A37B    ; Calculate BG positions
    JSL $80A176  ; Display the viewable part of the room

    LDA #$0000 : STA $05F5  ; Enable sounds
    JSL stop_all_sounds

    ; Clear music queue
    STZ $0629 : STZ $062B : STZ $062D : STZ $062F
    STZ $0631 : STZ $0633 : STZ $0635 : STZ $0637
    STZ $0639 : STZ $063B : STZ $063D : STZ $063F

    ; If music off, treat music as already loaded
    LDA !sram_music_toggle : CMP #$0001 : BNE .done_music

    ; Compare to currently loaded music data
    LDA !SRAM_MUSIC_DATA : CMP !MUSIC_DATA : BEQ .done_load_music_data

    ; Clear track if necessary
    LDA !SRAM_MUSIC_TRACK : BEQ .load_music_data
    LDA #$0000 : JSL !MUSIC_ROUTINE

  .load_music_data
    LDA !MUSIC_DATA : TAX
    LDA !SRAM_MUSIC_DATA : STA !MUSIC_DATA
    TXA : CLC : ADC #$FF00 : JSL !MUSIC_ROUTINE
    BRA .load_music_track

  .done_load_music_data
    ; Compare to currently playing music
    LDA !SRAM_MUSIC_TRACK : CMP !MUSIC_TRACK : BEQ .done_music

  .load_music_track
    LDA !MUSIC_TRACK : TAX
    LDA !SRAM_MUSIC_TRACK : STA !MUSIC_TRACK
    TXA : JSL !MUSIC_ROUTINE

  .done_music
    JSL $80834B  ; Enable NMI

    LDA #$0004 : STA $A7  ; Set optional next interrupt to Main gameplay

    JSL $80982A  ; Enable horizontal and vertical timer interrupts

    LDA #$E695 : STA $0A42 ; Unlock Samus
    LDA #$E725 : STA $0A44 ; Unlock Samus
    LDA #$9F55 : STA $0A6C ; Set X speed table pointer
    STZ $0E18              ; Set elevator to inactive
    STZ $1C1F              ; Clear message box index
    STZ $0E1A              ; Clear health bomb flag
    STZ $0795 : STZ $0797  ; Clear door transition flags
    LDA #$0000 : STA !ram_transition_flag

    LDA #$E737 : STA $099C  ; Pointer to next frame's room transition code = $82:E737
    PLB
    PLP
    RTL
}

preset_room_setup_asm_fixes:
{
    ; Start with original logic
    PHP : PHB
    %ai16()
    LDX $07BB
    LDA $0018,X : BEQ .end

    ; Check if this is scrolling sky
    CMP #$91C9 : BEQ .scrolling_sky
    CMP #$91CE : BEQ .scrolling_sky

  .execute_setup_asm
    ; Resume execution
    JML $8FE89B

  .scrolling_sky
    ; If we got here through normal gameplay, allow scrolling sky
    LDA !GAMEMODE : CMP #$0006 : BEQ .execute_setup_asm
    CMP #$001F : BEQ .execute_setup_asm
    CMP #$0028 : BEQ .execute_setup_asm

    ; Disable scrolling sky asm
    STZ $07DF
    ; Clear layer 2 library bits (change 0181 to 0080)
    LDA #$0080 : STA $091B

  .end
    PLB : PLP : RTL
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
    %a8()
    LDA #$01 : LDX !ROOM_ID      ; X = room ID
    CPX #$D000 : BMI +           ; organized by room ID so we only have to check half
    BRL .ceres

if !FEATURE_REDESIGN
    CPX #$9D19 : BNE +           ; Preset: Hi Jump Boots - Charge Hoppers
    LDA #$02 : STA $7ECD2C : STA $7ECD2D
    STA $7ECD26 : STA $7ECD27 : STA $7ECD28
    BRA .end
+   CPX #$A923 : BNE +           ; Preset: Hi Jump Boots - Lake Spark
    LDA #$00 : STA $7ECD21
    BRA .end
+   CPX #$AB64 : BNE +           ; Preset: Lower Norfair - After Super Blockade
    LDA #$00 : STA $7ECD26 : STA $7ECD2B
    BRA .end
+   CPX #$ACB3 : BNE +           ; Preset: Grapple - Guardian Runback
    STA $7ECD23
    BRA .end
+   CPX #$CAF6 : BNE +           ; Preset: Tourian - M10 Kill 3
    STA $7ECD26 : STA $7ECD26
    STA $7ECD26 : STA $7ECD23
+   CPX #$CE8A : BNE +           ; Preset: Final Escape - Mushroom Run
    LDA #$00 : STA $7ECD20 : STA $7ECD21
endif

  .end
    PLP
    RTS

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
    RTS

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
    RTS
}

preset_special_fixes:
{
    ; Grapple - Guardian Runback
    LDA !ROOM_ID : CMP #$ACB3 : BNE +
    LDA #$00FF : LDX #$0000
-   STA $7F0678,X : INX #2
    CPX #$0012 : BMI -
    LDX #$0000
-   STA $7F0738,X : INX #2
    CPX #$0012 : BMI -

+   RTL
}

transfer_cgram_long:
{
    PHP
    %a16()
    %i8()
    JSR $933A
    PLP
    RTL
}

LoadRandomPreset:
{
    PHY : PHX
    JSL $808111 : STA $12     ; random number

    LDA #$00B8 : STA $18      ; this routine lives in bank B8
    LDA !sram_preset_category : ASL : TAY
    LDA #preset_category_submenus : STA $16
    LDA [$16],Y : TAX         ; preset category submenu table
    LDA #preset_category_banks : STA $16
    LDA [$16],Y : STA $18     ; preset category menu bank

    STX $16 : LDY #$0000
  .toploop
    INY #2
    LDA [$16],Y : BNE .toploop
    TYA : LSR : TAY           ; Y = size of preset category submenu table

    LDA $12 : XBA : AND #$00FF : STA $4204
    %a8()
    STY $4206                 ; divide top half of random number by Y
    %a16()
    PEA $0000 : PLA
    LDA $4216 : ASL : TAY     ; randomly selected subcategory
    LDA [$16],Y : STA $16     ; increment four bytes to get the subcategory table
    LDY #$0004 : LDA [$16],Y : STA $16

    LDY #$0000
  .subloop
    INY #2
    LDA [$16],Y : BNE .subloop
    TYA : LSR : TAY           ; Y = size of subcategory table

    LDA $12 : AND #$00FF : STA $4204
    %a8()
    STY $4206                 ; divide bottom half of random number by Y
    %a16()
    PEA $0000 : PLA
    LDA $4216 : ASL : TAY     ; randomly selected preset
    LDA [$16],Y : STA $16     ; increment four bytes to get the data
    LDY #$0004 : LDA [$16],Y

    STA !ram_load_preset

    PLX : PLY
    RTL
}


print pc, " preset_start_gameplay end"
warnpc $80FDFD

org $85B000
incsrc custompresets.asm


; -------------------
; Category Menus/Data
; -------------------

; Preset data/menus can be anywhere in the rom, even in separate banks

if !FEATURE_REDESIGN
org $FC8000
print pc, " Redesign any% data start"
incsrc presets/redesign_data.asm
print pc, " Redesign any% data end"

print pc, " Redesign any% menu start"
incsrc presets/redesign_menu.asm
print pc, " Redesign any% menu end"
else
; Using Redesign Presets as the new placeholder
; Most of them will still work to some degree
org $FD99D0
print pc, " Redesign any% data start"
incsrc presets/redesign_data.asm
print pc, " Redesign any% data end"

org $F4C7F2
print pc, " Redesign any% menu start"
incsrc presets/redesign_menu.asm
print pc, " Redesign any% menu end"
warnpc $F4EFFF
endif

