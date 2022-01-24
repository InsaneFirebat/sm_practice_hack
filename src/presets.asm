org $82FA00
print pc, " presets bank82 start"

preset_load:
{
    PHP
    LDA !MUSIC_DATA : STA !SRAM_MUSIC_DATA
    LDA !MUSIC_TRACK : STA !SRAM_MUSIC_TRACK

    JSL $809E93  ; Clear timer RAM
    JSR $819B    ; Initialize IO registers
    JSR $82E2    ; Load standard BG3 tiles and sprite tiles, clear tilemaps
    JSR $82C5    ; Load initial palette
if !FEATURE_PAL
    JSL $91DF72  ; Initialize Samus
else
    JSL $91E00D  ; Initialize Samus
endif

    JSL preset_load_preset

    JSL preset_start_gameplay  ; Start gameplay

    JSL $809A79  ; HUD routine when game is loading
    JSL $90AD22  ; Reset projectile data

    PHP
    %ai16()
    LDY #$0020 : LDX #$0000
  .paletteLoop
    LDA $7EC180,X : STA $7EC380,X  ; Target Samus' palette = [Samus' palette]
    INX #2
    DEY #2 : BNE .paletteLoop
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

    ; Transfer enemy tiles to VRAM and initialize enemies
    LDA #$0006 : STA $0DA0 ; loop counter
  .loopEnemyVRAM
if !FEATURE_PAL
    JSL $A08CE7
else
    JSL $A08CD7
endif
    JSL $808338  ; Wait for NMI
    DEC $0DA0
    BPL .loopEnemyVRAM

    LDA #$0008 : STA !GAMEMODE

    ; Set full brightness and forced blank off
    %a8() : LDA #$0F : STA $51 : %ai16()

    LDY #$0200 : LDX #$0000
  .paletteLoop2
    LDA $7EC200,X : STA $7EC000,X  ; Palettes = [target palettes]
    INX #2
    DEY #2 : BNE .paletteLoop2

    ; Fix Samus' palette
if !FEATURE_PAL
    JSL $91DE1F
else
    JSL $91DEBA
endif

    ; Re-upload OOB viewer tiles if needed
    LDA !ram_oob_watch_active : BEQ .done_upload_sprite_oob_tiles
    JSL upload_sprite_oob_tiles

  .done_upload_sprite_oob_tiles
    JSL reset_all_counters

    ; Clear enemies if not in certain rooms
    LDA $079B : CMP #$DD58 : BEQ .set_mb_state
    JSR clear_all_enemies
    BRA .done

  .set_mb_state
    ; If glass is broken, assume we should skip MB1
    LDA $7ED820 : BIT #$0004 : BEQ .done
    ; Set health to 1 as a hint this was done by a preset
    LDA #$0001 : STA $0FCC

  .done
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
    %ai16()
    PEA $8F00
    PLB : PLB
    JSR $DDF1  ; Load destination room CRE bitset
    JSR $DE12  ; Load door header
    JSR $DE6F  ; Load room header
    JSR $DEF2  ; Load state header
if !RAW_TILE_GRAPHICS
    JML load_raw_tile_graphics
else
    JMP $E78C
endif
}

reset_all_counters:
{
    LDA #$0000
    STA !ram_room_has_set_rng
    STA $09DA : STA $09DC : STA $09DE : STA $09E0 ; game time
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

    ; check if custom preset is being loaded
    LDA !ram_custom_preset : BEQ .category_preset
    JSL custom_preset_load
    BRA .done

  .category_preset
    JSR category_preset_load

  .done
    PLB
    RTL
}

category_preset_load:
{
    ; Get offset into preset data table
    LDA !sram_preset_category : STA $C3
    ASL : CLC : ADC $C3 : TAX

    ; Get starting preset data bank into $C5
    INX : LDA.l category_preset_data_table,X : STA $C4 : DEX

    ; Get preset address to load into $C3
    LDA !ram_load_preset : STA !sram_last_preset : STA $C3 : STA $7F0002
    LDA #$0000 : STA !ram_load_preset

    ; Get start of preset data into $C1
    LDA.l category_preset_data_table,X : LDX #$0000 : STA $C1

    ; If start of preset data is greater than preset address,
    ; then our preset address is in the next bank
    CMP $C3 : BCC .build_list_loop : BEQ .build_list_loop
    INC $C5

  .build_list_loop
    ; Build list of presets to traverse
    LDA [$C3] : BEQ .prepare_traverse_list_loop
    INX #2 : STA $7F0002,X
    CMP $C3 : STA $C3 : BCC .build_list_loop
    ; We just crossed back into the starting bank
    DEC $C5
    BRA .build_list_loop

  .prepare_traverse_list_loop
    ; Set bank to read data from
    STZ $00 : %a8() : LDA $C5 : PHA : PLB
    ; Set bank to store data to
    LDA #$7E : STA $C5 : %a16()

  .traverse_list_loop_with_bank_check
    ; Now traverse from the first preset until the last one
    LDA $7F0002,X : TAY : CMP $C1 : BCC .increment_bank_before_inner_loop
    INY #2
    BRA .inner_loop_with_bank_check_load_address

    ; For each preset, load and store address and value pairs
  .inner_loop_with_bank_check
    STA $C3 : INY #2
    CPY #$0000 : BEQ .increment_bank_before_load_value
    LDA ($00),Y : STA [$C3] : INY #2
  .inner_loop_with_bank_check_load_address
    CPY #$0000 : BEQ .increment_bank_before_load_address
    LDA ($00),Y : CMP #$FFFF : BNE .inner_loop_with_bank_check

    DEX #2 : BPL .traverse_list_loop_with_bank_check
    RTS

  .increment_bank_before_inner_loop
    %a8() : PHB : PLA : INC : PHA : PLB : %a16()
    INY #2
    BRA .inner_loop_load_address

  .increment_bank_before_load_address
    %a8() : PHB : PLA : INC : PHA : PLB : %a16()
    LDY #$8000
    BRA .inner_loop_load_address

  .increment_bank_before_load_value
    %a8() : PHB : PLA : INC : PHA : PLB : %a16()
    LDY #$8000
    BRA .inner_loop_load_value

  .traverse_list_loop
    ; Continue traversing from the first preset until the last one
    LDA $7F0002,X : TAY : INY #2
    BRA .inner_loop_load_address

    ; For each preset, load and store address and value pairs
  .inner_loop
    STA $C3 : INY #2
  .inner_loop_load_value
    LDA ($00),Y : STA [$C3] : INY #2
  .inner_loop_load_address
    LDA ($00),Y : CMP #$FFFF : BNE .inner_loop

    DEX #2 : BPL .traverse_list_loop
    RTS
}

category_preset_data_table:
  dl preset_kpdr21_crateria_ceres_elevator
;  dl preset_kpdr22_crateria_ceres_elevator
;  dl preset_spazer_crateria_ceres_elevator
  dl preset_prkd_crateria_ceres_elevator
;  dl preset_prkd15_crateria_ceres_elevator
  dl preset_pkrd_crateria_ship
  dl preset_kpdr25_bombs_ceres_elevator
  dl preset_gtclassic_crateria_ceres_elevator
  dl preset_gtmax_crateria_ship
  dl preset_100early_crateria_ceres_elevator
  dl preset_hundo_bombs_ceres_elevator
  dl preset_100map_varia_landing_site
  dl preset_14ice_crateria_ceres_elevator
  dl preset_14speed_crateria_ceres_elevator
  dl preset_rbo_bombs_ceres_elevator
  dl preset_ngplasma_ceres_station_ceres_elevator
  dl preset_nghyper_ceres_station_ceres_elevator
  dl preset_nintendopower_crateria_ship
  dl preset_allbosskpdr_crateria_ceres_elevator
  dl preset_allbosspkdr_crateria_ceres_elevator
  dl preset_allbossprkd_crateria_ceres_elevator

print pc, " presets bank82 end"


org $82E8D9
    JSL preset_room_setup_asm_fixes


org $80F000
print pc, " presets bank80 start"

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
    JSL preset_load_destination_state_and_tiles
    JSL $878016  ; Clear animated tile objects
    JSL $88829E  ; Wait until the end of a v-blank and clear (H)DMA enable flags

    ; Preserve layer 2 values we may have loaded from presets
    LDA $0923 : PHA
    LDA $0921 : PHA
    LDA $0919 : PHA
    LDA $0917 : PHA

    JSL $8882C1  ; Initialize special effects for new room
    JSL $8483C3  ; Clear PLMs
    JSL $868016  ; Clear enemy projectiles
    JSL $8DC4D8  ; Clear palette FX objects
    JSR Randomize_Preset_Equipment
    JSL $90AC8D  ; Update beam graphics
    JSL $82E139  ; Load target colours for common sprites, beams and slashing enemies / pickups
if !FEATURE_PAL
    JSL $A08A2E  ; Load enemies
else
    JSL $A08A1E  ; Load enemies
endif
    JSL $80A23F  ; Clear BG2 tilemap
if !RAW_TILE_GRAPHICS
    JSL preset_load_level_tile_tables_scrolls_plms_and_execute_asm
else
    JSL $82E7D3  ; Load level data, CRE, tile table, scroll data, create PLMs and execute door ASM and room setup ASM
endif

    JSR preset_scroll_fixes

    LDA !AREA_ID : CMP #$0006 : BEQ +
    LDA !LOAD_STATION_INDEX : CMP #$0012 : BEQ +
;    LDA !sram_preset_options : BIT !PRESETS_CLOSE_BLUE_DOORS : BNE +
    LDA !sram_preset_open_doors : BEQ +

    JSR preset_open_all_blue_doors

+   JSL $89AB82  ; Load FX
    JSL $82E97C  ; Load library background

    ; Pull layer 2 values, and use them if they are valid
    PLA : CMP #$5AFE : BEQ .calculate_layer_2
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

    LDA #$0004 : STA $A7   ; Set optional next interrupt to Main gameplay

    JSL $80982A  ; Enable horizontal and vertical timer interrupts

    LDA #$E695 : STA $0A42 ; Unlock Samus
    LDA #$E725 : STA $0A44 ; Unlock Samus
    STZ $0E18              ; Set elevator to inactive
    STZ $1C1F              ; Clear message box index
    STZ $0E1A              ; Clear health bomb flag
    STZ $0795 : STZ $0797  ; clear door transition flags
    LDA #$0000 : STA !ram_transition_flag

    LDA #$E737 : STA $099C ; Pointer to next frame's room transition code = $82:E737
    PLB
    PLP
    RTL
}

preset_open_all_blue_doors:
{
    PHP : PHB : PHX : PHY
    LDA #$8484 : STA $C3 : PHA : PLB : PLB

    ; First resolve all door PLMs where the door has previously been opened
    LDX #$004E
  .plm_search_loop
    LDA $1C37,X : BEQ .plm_search_done
    LDY $1D27,X : LDA $0000,Y : CMP #$8A72 : BEQ .plm_door_found
  .plm_search_resume
    DEX : DEX : BRA .plm_search_loop

  .plm_door_found
    LDA $1DC7,X : BMI .plm_search_resume
    PHX : JSL $80818E : LDA $7ED8B0,X : PLX
    AND $05E7 : BEQ .plm_search_resume

    ; Door has been previously opened
    ; Execute the next PLM instruction to set the BTS as a blue door
    LDA $0002,Y : TAY
    LDA $0000,Y : CMP #$86BC : BEQ .plm_delete
    INY : INY
    JSL preset_execute_plm_instruction

  .plm_delete
    STZ $1C37,X
    BRA .plm_search_resume

  .plm_search_done
    ; Now search all of the room BTS for doors
    LDA !ROOM_WIDTH_SCROLLS : STA $C7
    LDA !ROOM_WIDTH_BLOCKS : STA $C1 : ASL : STA $C3
    LDA $7F0000 : LSR : TAY
    STZ $C5 : TDC : %a8() : LDA #$7F : PHA : PLB

  .bts_search_loop
    LDA $6401,Y : AND #$FC : CMP #$40 : BEQ .bts_found
  .bts_continue
    DEY : BNE .bts_search_loop

    ; All blue doors opened
    PLY : PLX : PLB : PLP : RTS

  .bts_found
    %a16() : TYA : ASL : TAX : %a8()
    ; Convert BTS index to tile index
    ; Also verify this is a door and not a slope or half-tile
    %a16() : TYA : ASL : TAX : %a8()
    LDA $0001,X : BIT #$30 : BNE .bts_continue

    ; If this door has a red scroll, then leave it closed
    ; Most of the work is to determine the scroll index
    %a16() : TYA : DEC : LSR : LSR : LSR : LSR : STA $004204
    %a8() : LDA $C7 : STA $004206
    %a16() : PHA : PLA : PHA : PLA
    LDA $004216 : STA $C8
    LDA $004214 : LSR : LSR : LSR : LSR
    %a8() : STA $004202
    LDA $C7 : STA $004203
    PHA : PLA : TDC
    LDA $004216 : CLC : ADC $C8
    PHX : TAX : LDA $7ECD20,X : PLX
    CMP #$00 : BEQ .bts_continue

    ; Check what type of door we need to open
    LDA $6401,Y : BIT #$02 : BNE .bts_check_up_or_down
    BIT #$01 : BEQ .bts_facing_left_right
    LDA #$04 : STA $C6

  .bts_facing_left_right
    %a16() : LDA #$0082 : ORA $C5 : STA $0000,X
    TXA : CLC : ADC $C3 : TAX : LDA #$00A2 : ORA $C5 : STA $0000,X
    TXA : CLC : ADC $C3 : TAX : LDA #$08A2 : ORA $C5 : STA $0000,X
    TXA : CLC : ADC $C3 : TAX : LDA #$0882 : ORA $C5 : STA $0000,X
    TDC : %a8() : STA $C6 : STA $6401,Y
    %a16() : TYA : CLC : ADC $C1 : TAX : TDC : %a8() : STA $6401,X
    %a16() : TXA : CLC : ADC $C1 : TAX : TDC : %a8() : STA $6401,X
    %a16() : TXA : CLC : ADC $C1 : TAX : TDC : %a8() : STA $6401,X
    JMP .bts_continue

  .bts_check_up_or_down
    BIT #$01 : BEQ .bts_facing_up_down
    LDA #$08 : STA $C6

  .bts_facing_up_down
    %a16() : LDA #$0084 : ORA $C5 : STA $0006,X
    DEC : STA $0004,X : ORA #$0400 : STA $0002,X : INC : STA $0000,X
    TDC : %a8() : STA $C6 : STA $6401,Y
    STA $6402,Y : STA $6403,Y : STA $6404,Y
    JMP .bts_continue
}

preset_execute_plm_instruction:
{
    ; A = Bank 84 PLM instruction to execute
    ; $C3 already set to $84
    STA $C1
    ; PLM instruction ends with an RTS, but we need an RTL
    ; Have the RTS return to $848031 which is an RTL
    PEA $8030
    JML [$00C1]
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
    %a8() : %i16()
    LDA #$01 : LDX !ROOM_ID      ; X = room ID
    CPX #$C000 : BMI +           ; organized by room ID so we only have to check half
    BRL .halfway

    CPX #$A011 : BNE +           ; bottom-left of Etecoons Etank
    STA $7ECD25 : STA $7ECD26
    BRA .done
+   CPX #$AC83 : BNE +           ; left of Green Bubbles Missile Room (Norfair Reserve)
    STA $7ECD20
    BRA .done
+   CPX #$AE32 : BNE +           ; bottom of Volcano Room
    STA $7ECD26
    BRA .done
+   CPX #$B07A : BNE +           ; top of Bat Cave
    STA $7ECD20
    BRA .done
+   CPX #$B1E5 : BNE +           ; bottom of Acid Chozo Room
    STA $7ECD26 : STA $7ECD27 : STA $7ECD28
    LDA #$00 : STA $7ECD23 : STA $7ECD24
    BRA .done
+   CPX #$B3A5 : BNE +           ; bottom of Pre-Pillars
    LDY !SAMUS_Y : CPY #$0190    ; no scroll fix if Ypos < 400
    BMI .done
    STA $7ECD22 : STA $7ECD24
    LDA #$00 : STA $7ECD21
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
    RTS

  .halfway
    CPX #$DF45 : BPL .ceres      ; Ceres rooms set BG1 offsets manually
    CPX #$CAF6 : BNE +           ; bottom of WS Shaft
    LDA #$02
    STA $7ECD48 : STA $7ECD4E
    BRA .done
+   CPX #$CBD5 : BNE +           ; top of Electric Death Room (WS E-Tank)
    LDA #$02
    STA $7ECD20
    BRA .done
+   CPX #$CC6F : BNE +           ; right of Basement (Phantoon)
    STA $7ECD24
    BRA .done
+   CPX #$D1A3 : BNE +           ; bottom of Crab Shaft
    STA $7ECD26
    LDA #$02 : STA $7ECD24
    BRA .done
+   CPX #$D48E : BNE +           ; Oasis (bottom of Toilet)
    LDA #$02
    STA $7ECD20 : STA $7ECD21
    BRA .done
+   CPX #$D69A : BNE .done       ; Pants Room (door to Shaktool)
    STA $7ECD21
    LDA #$00 : STA $7ECD22
    BRA .done

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

LoadRandomPreset:
{
    PHY : PHX
    JSL $808111 : STA $12

    LDA #$00B8 : STA $18                       ; bank in $18
    LDA !sram_preset_category : ASL : TAY      ; selected category index in Y
    LDA #preset_category_submenus : STA $16    ; pointer to category list in $16
    LDA [$16],Y : TAX                          ; pointer to submenu table in X
    LDA #preset_category_banks : STA $16       ; bank of submenu table in $16
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
    %a8()
    STY $4206                                  ; by number of presets in the group
    %a16()
    PEA $0000 : PLA
    LDA $4216 : ASL : TAY                      ; random preset index in Y
    LDA [$16],Y : STA $16                      ; random preset macro pointer in $16
    LDY #$0004 : LDA [$16],Y                   ; finally reached the pointer to the preset

    STA !ram_load_preset

    PLX : PLY
    RTL
}

Randomize_Preset_Equipment:
{
    LDA !sram_presetrando : BNE .randomize
    RTS
  .randomize
    PHX
    ; equipment
    LDA !ram_seed_Y : AND #$F32F                                       ; get current random number
    STA $09A2 : STA $09A4                                              ; store equipment
    LDA !sram_presetrando_morph : BEQ +                                ; check if morph forced
    LDA $09A2 : ORA #$0004 : STA $09A2 : STA $09A4                     ; turn on morph

    ; beams
+   JSL MenuRNG                                                        ; get new random number
    AND #$100F : STA $09A8                                             ; collected beams
    AND #$000C : CMP #$000C : BNE .beams_done                          ; check for Spazer+Plasma
    LDA !sram_presetrando_beampref : BEQ .random_pref                  ; check beam preference, 0 = random
    DEC : BEQ .spazer                                                  ; after decrement, 0 = spazer, 1 = plasma
  .plasma
    LDA $09A8 : AND #$100B : STA $09A6 : BRA +                         ; unequip Spazer
  .spazer
    LDA $09A8 : AND #$1007 : STA $09A6 : BRA +                         ; unequip Plasma
  .random_pref
    LDA !ram_seed_X : AND #$0001 : BEQ .spazer                         ; get random bit
    BRA .plasma
  .beams_done
    LDA $09A8 : STA $09A6
    
    ; charge
+   LDA !sram_presetrando_charge : BEQ +                               ; check if charge forced
    LDA $09A8 : ORA #$1000 : STA $09A8                                 ; equip charge beam and store equipped beams
    LDA $09A6 : ORA #$1000 : STA $09A6                                 ; store equipped beams

    ; reserves
+   LDA !sram_presetrando_max_reserves : BEQ .no_reserves              ; check if max = 0
    LDA !ram_seed_Y : AND #$F000 : LSR #4 : XBA                        ; reuse random number
    CMP !sram_presetrando_max_reserves : BPL .cap_reserves             ; check if capped
    ASL : TAX : LDA presetrando_reservetable,X                         ; load value from table
    STA $09D4 : STA $09D6 : BRA +                                      ; store reserves
  .cap_reserves
    BEQ .reserves_done                                                 ; check for 0 condition (value is equal to max)
    SEC : SBC !sram_presetrando_max_reserves                           ; subtract max from random number
    CMP !sram_presetrando_max_reserves : BPL .cap_reserves             ; check if capped again (loop)
  .reserves_done
    ASL : TAX : LDA presetrando_reservetable,X                         ; load a proper value from table
    STA $09D4 : STA $09D6                                              ; store capped reserves
    BRA +
  .no_reserves
    STZ $09D4 : STZ $09D6                                              ; capped at zero

    ; missiles
+   LDA !sram_presetrando_max_missiles : BEQ .no_missiles              ; check if max = 0
    LDA !ram_seed_X : AND #$0FF0 : LSR #4                              ; reuse random number
    CMP !sram_presetrando_max_missiles : BPL .cap_missiles             ; check if capped
    ASL : TAX : LDA presetrando_missiletable,X                         ; load a proper value from table
    STA $09C6 : STA $09C8 : BRA +                                      ; store random missiles
  .cap_missiles
    BEQ .missiles_done                                                 ; check for 0 condition (value is equal to max)
    SEC : SBC !sram_presetrando_max_missiles
    CMP !sram_presetrando_max_missiles : BPL .cap_missiles
  .missiles_done
    ASL : TAX : LDA presetrando_missiletable,X
    STA $09C6 : STA $09C8                                              ; store capped missiles
    BRA +
  .no_missiles
    STZ $09C6 : STZ $09C8                                              ; capped at zero

    ; supers
+   LDA !sram_presetrando_max_supers : BEQ .no_supers                  ; check if max = 0
    JSL MenuRNG : AND #$00FF                                           ; get new random number
    CMP !sram_presetrando_max_supers : BPL .cap_supers                 ; check if capped
    ASL : TAX : LDA presetrando_supertable,X
    STA $09CA : STA $09CC : BRA +                                      ; store random supers
  .cap_supers
    BEQ .supers_done                                                   ; check for 0 condition (value is equal to max)
    SEC : SBC !sram_presetrando_max_supers
    CMP !sram_presetrando_max_supers : BPL .cap_supers
  .supers_done
    ASL : TAX : LDA presetrando_pbtable,X
    STA $09CA : STA $09CC                                              ; store capped supers
    BRA +
  .no_supers
    STZ $09CA : STZ $09CC                                              ; capped at zero

    ; pbs
+   LDA !sram_presetrando_max_pbs : BEQ .no_pbs                        ; check if max = 0
    LDA !ram_seed_Y : XBA : AND #$00FF                                 ; get new random number
    CMP !sram_presetrando_max_pbs : BPL .cap_pbs                       ; check if capped
    ASL : TAX : LDA presetrando_pbtable,X
    STA $09CE : STA $09D0 : BRA +                                      ; store random pbs
  .cap_pbs
    BEQ .pbs_done                                                      ; check for 0 condition (value is equal to max)
    SEC : SBC !sram_presetrando_max_pbs
    CMP !sram_presetrando_max_pbs : BPL .cap_pbs
  .pbs_done
    ASL : TAX : LDA presetrando_pbtable,X
    STA $09CE : STA $09D0                                              ; store capped pbs
    BRA +
  .no_pbs
    STZ $09CE : STZ $09D0                                              ; capped at zero

    ; etanks
+   LDA !sram_presetrando_max_etanks : BEQ .no_etanks                  ; check if max = 0
    JSL MenuRNG2 : AND #$000F                                          ; get new random number
    CMP !sram_presetrando_max_etanks : BPL .cap_etanks                 ; check if capped
    ASL : TAX : LDA presetrando_etanktable,X                           ; load value from table
    STA $09C2 : STA $09C4 : BRA .done                                  ; store energy
  .cap_etanks
    BEQ .etanks_done                                                   ; check for 0 condition (value is equal to max)
    SEC : SBC !sram_presetrando_max_etanks
    CMP !sram_presetrando_max_etanks : BPL .cap_etanks
  .etanks_done
    ASL : TAX : LDA presetrando_etanktable,X                           ; load value from table
    STA $09C2 : STA $09C4                                              ; store energy
    BRA .done
  .no_etanks
    LDA #$0063 : STA $09C2 : STA $09C4                                 ; capped at zero (99)

  .done
    PLX
    RTS

presetrando_missiletable:
    dw #$0000, #$0005, #$000A, #$000F, #$0014, #$0019, #$001E, #$0023, #$0028, #$002D, #$0032, #$0037, #$003C, #$0041, #$0046, #$004B
    dw #$0050, #$0055, #$005A, #$005F, #$0064, #$0069, #$006E, #$0073, #$0078, #$007D, #$0082, #$0087, #$008C, #$0091, #$0096, #$009B
    dw #$00A0, #$00A5, #$00AA, #$00AF, #$00B4, #$00B9, #$00BE, #$00C3, #$00C8, #$00CD, #$00D2, #$00D7, #$00DC, #$00E1, #$00E6, #$00EB
    dw #$00F0, #$00F5, #$00FA, #$00FF

presetrando_supertable:
    dw #$0000, #$0005, #$000A, #$000F, #$0014, #$0019, #$001E, #$0023, #$0028, #$002D, #$0032, #$0037, #$003C, #$0041, #$0046, #$004B
    dw #$0050, #$0055, #$005A, #$005F, #$0064, #$0069, #$006E, #$0073, #$0078, #$007D, #$0082, #$0087, #$008C, #$0091, #$0096, #$009B
    dw #$00A0, #$00A5, #$00AA, #$00AF, #$00B4, #$00B9, #$00BE, #$00C3, #$00C8, #$00CD, #$00D2, #$00D7, #$00DC, #$00E1, #$00E6, #$00EB
    dw #$00F0, #$00F5, #$00FA, #$00FF

presetrando_pbtable:
    dw #$0000, #$0005, #$000A, #$000F, #$0014, #$0019, #$001E, #$0023, #$0028, #$002D, #$0032, #$0037, #$003C, #$0041, #$0046, #$004B
    dw #$0050, #$0055, #$005A, #$005F, #$0064, #$0069, #$006E, #$0073, #$0078, #$007D, #$0082, #$0087, #$008C, #$0091, #$0096, #$009B
    dw #$00A0, #$00A5, #$00AA, #$00AF, #$00B4, #$00B9, #$00BE, #$00C3, #$00C8, #$00CD, #$00D2, #$00D7, #$00DC, #$00E1, #$00E6, #$00EB
    dw #$00F0, #$00F5, #$00FA, #$00FF

presetrando_reservetable:
    dw #$0000, #$0064, #$00C8, #$012C, #$0190

presetrando_etanktable:
    dw #$0063, #$00C7, #$012B, #$018F, #$01F3, #$0257, #$02BB, #$031F, #$0383, #$03E7, #$044B, #$04AF, #$0513, #$0517, #$05DB
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

add_grapple_and_xray_to_hud:
{
    ; Copied from $809AB1 to $809AC9
    LDA $09A2 : BIT #$8000 : BEQ $04
    JSL $809A3E            ; Add x-ray to HUD tilemap
    LDA $09A2 : BIT #$4000 : BEQ $04
    JSL $809A2E            ; Add grapple to HUD tilemap
    JMP .resume_infohud_icon_initialization
}

print pc, " presets bank80 end"
warnpc $80FC00


; $80:9AB1: Add x-ray and grapple HUD items if necessary
org $809AB1
    ; Skip x-ray and grapple if max HP is a multiple of 4,
    ; which is only possible if GT code was used
    LDA $09C4 : AND #$0003 : BEQ .resume_infohud_icon_initialization
    JMP add_grapple_and_xray_to_hud

warnpc $809AC9

; $80:9AC9: Resume original logic
org $809AC9
  .resume_infohud_icon_initialization



; -------------------
; Category Menus/Data
; -------------------

org $F18000    ; 76EBh bytes used / 915h bytes free
incsrc presets/prkd_menu.asm   ; E6Ah bytes
incsrc presets/prkd15_menu.asm   ; ~E6Ah bytes
incsrc presets/pkrd_menu.asm   ; E6Ah bytes
incsrc presets/kpdr21_menu.asm   ; F91h bytes
incsrc presets/kpdr22_menu.asm   ; ~F91h bytes
incsrc presets/spazer_menu.asm   ; ~F91h bytes
incsrc presets/kpdr25_menu.asm   ; 69Fh bytes
incsrc presets/14ice_menu.asm   ; 7C6h bytes
incsrc presets/14speed_menu.asm   ; 7EBh bytes
print pc, " preset_menu.asm bankF1 end"

org $F28000    ; 718Bh bytes used / E75h bytes free
incsrc presets/hundo_menu.asm   ; 1220h bytes
incsrc presets/100early_menu.asm   ; 1320h bytes
incsrc presets/100map_menu.asm   ; 1670h bytes
incsrc presets/gtclassic_menu.asm   ; D7Ch bytes
incsrc presets/gtmax_menu.asm   ; 1378h bytes
incsrc presets/rbo_menu.asm   ; D97h bytes
incsrc presets/nintendopower_menu.asm   ; 70Ch bytes
print pc, " preset_menu.asm bankF2 end"

org $F38000    ; 2D83h bytes used / 527Dh bytes free
incsrc presets/allbosskpdr_menu.asm   ; 942h bytes
incsrc presets/allbosspkdr_menu.asm   ; 9B0h bytes
incsrc presets/allbossprkd_menu.asm   ; 9BEh bytes
incsrc presets/ngplasma_menu.asm   ; 85Ch bytes
incsrc presets/nghyper_menu.asm   ; 864h bytes
print pc, " preset_menu.asm bankF3 end"


org $E8E000
check bankcross off
incsrc presets/prkd_data.asm ; 3C95h bytes
incsrc presets/prkd15_data.asm ; 3C95h bytes
incsrc presets/kpdr21_data.asm ; 3B17h bytes
incsrc presets/kpdr22_data.asm ; 3B17h bytes
incsrc presets/nintendopower_data.asm ; 2109h bytes
incsrc presets/gtclassic_data.asm ; 35B5h bytes
incsrc presets/14ice_data.asm ; 1EC1h bytes
incsrc presets/14speed_data.asm ; 1F2Ch bytes
incsrc presets/allbosskpdr_data.asm ; 2435h bytes
incsrc presets/allbosspkdr_data.asm ; 24ADh bytes
incsrc presets/allbossprkd_data.asm ; 2539h bytes
incsrc presets/100early_data.asm ; 4E29h bytes
incsrc presets/gtmax_data.asm ; 4E9Fh bytes
incsrc presets/kpdr25_data.asm ; 2F09h bytes
incsrc presets/rbo_data.asm ; 327Fh bytes
incsrc presets/pkrd_data.asm ; 2EE5h bytes
incsrc presets/100map_data.asm ; 57E5h bytes
incsrc presets/spazer_data.asm ; 313Dh bytes
incsrc presets/nghyper_data.asm ; 1B6Bh bytes
incsrc presets/ngplasma_data.asm ; 1B5Fh bytes
incsrc presets/hundo_data.asm ; 42B9h bytes
warnpc $F08000
check bankcross on
print pc, " crossbank preset_data.asm end"


