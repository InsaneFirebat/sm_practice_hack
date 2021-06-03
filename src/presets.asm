org $82FA00
print pc, " presets start"
preset_load:
{
    PHP

    LDA !MUSIC_BANK : STA !SRAM_MUSIC_BANK
    LDA !MUSIC_TRACK : STA !SRAM_MUSIC_TRACK

    JSL $809E93  ; Clear timer RAM
    JSR $819B  ; Initialise IO registers
    JSR $82E2  ; Load standard BG3 tiles and sprite tiles, clear tilemaps
    JSR $82C5  ; Load initial palette
    JSL $91E00D  ; Initialise Samus

    JSL preset_load_preset

    JSL preset_start_gameplay  ; Start gameplay
    JSL $809A79  ; HUD routine when game is loading

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

    LDA #$0001
    STA $0723  ; Screen fade delay = 1
    STA $0725  ; Screen fade counter = 1

    JSL $80834B  ; Enable NMI with $84 options
    JSL $868000  ; Enable enemy projectiles
    JSL $8483AD  ; Enable PLMs
    JSL $8DC4C2  ; Enable palette FX objects
    JSL $888288  ; Enable HDMA objects
    JSL $878000  ; Enable animated tile objects
    JSL $908E0F  ; Something to do with setting $0AD2 FX1-related

    LDA #$0006 : STA $0DA0
  .loopSomething
    JSL $A08CD7  ; Load enemies
    JSL $808338  ; Wait for NMI
    DEC $0DA0  ; Decrement $0DA0
    BPL .loopSomething

    LDA #$0008 : STA $0998
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

    LDA !SRAM_MUSIC_BANK
    CMP !MUSIC_BANK
    BEQ .load_music_track

    ; loads new music bank
    LDA #$FF00 : CLC : ADC !MUSIC_BANK
    JSL !MUSIC_ROUTINE

  .load_music_track
    LDA !MUSIC_TRACK
    JSL !MUSIC_ROUTINE

    JSL reset_all_counters

    ; Clear enemies (8000 = solid to Samus, 0400 = Ignore Samus projectiles)
    LDA #$0000
    -
    TAX : LDA $0F86,X : BIT #$8400 : BNE +
    ORA #$0200 : STA $0F86,X
    +
    TXA : CLC : ADC #$0040 : CMP #$0400 : BNE -
    ; JSL $A08A6D
    PLP
    RTL
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

preset_load_preset:
  PHB
    LDA !sram_preset_category : ASL : TAX
    LDA.l preset_banks,X : %a8() : PHA : PLB : %a16()

    LDA !ram_load_preset : STA !sram_last_preset : STA $C1
    LDA #$0000 : STA !ram_load_preset

    LDX #$0000
  .loop_path
    LDA $C1 : STA $7FF000,X
    INX #2
    LDA ($C1) : STA $C1 : BNE .loop_path

  ; then traverse $7FF000 from the first preset until the last one, and apply them
  .loop_presets
    DEX #2 : BMI .done

    JSR preset_to_memory
    BRA .loop_presets

  .done
    LDA #$0000
    STA $7E09D2 ; Current selected weapon
    STA $7E0A04 ; Auto-cancel item
    STA $0795   ; "Currently transitioning"
    STA $0797   ; "Currently transitioning"
  PLB
    RTL


preset_to_memory:
  PHX
    STZ $00
    LDA $7FF000,X
    INC #2 : TAY

  .loop
    LDA ($00),Y : INY : INY : CMP #$FFFF : BEQ .done : STA $C3
    LDA ($00),Y : INY : STA $C5
    LDA ($00),Y : INY : AND #$00FF : CMP #$0001 : BEQ .one

  .two
    LDA ($00),Y : INY : INY : STA [$C3]
    INX #6
    BRA .loop

  .one
    %a8()
    LDA ($00),Y : INY : STA [$C3]
    %a16()
    INX #5
    BRA .loop

  .done
  PLX
    RTS

preset_banks:
{
  dw preset_spazer_crateria_ship>>16
  dw preset_gtclassic_crateria_ship>>16
  dw preset_kpdr21_crateria_ship>>16
  dw preset_ngplasma_ceres_station_ceres_elevator>>16
  dw preset_prkd_crateria_ship>>16
  dw preset_pkrd_crateria_ship>>16
  dw preset_kpdr25_bombs_ceres_elevator>>16
  dw preset_14ice_crateria_ceres_elevator>>16
  dw preset_14speed_crateria_ceres_elevator>>16
  dw preset_nghyper_ceres_station_ceres_elevator>>16
  dw preset_100early_crateria_ceres_elevator>>16
  dw preset_hundo_bombs_ceres_elevator>>16
  dw preset_rbo_bombs_ceres_elevator>>16
  dw preset_allbosskpdr_crateria_ceres_elevator>>16
  dw preset_allbosspkdr_crateria_ceres_elevator>>16
  dw preset_allbossprkd_crateria_ceres_elevator>>16
}

print pc, " presets end"


org $80F000
print pc, " preset_start_gameplay start"
preset_start_gameplay:
{
    PHP
    PHB
    PHK : PLB
    %ai16()
    SEI  ; Enable interrupts
    STZ $420B  ; Disable all (H)DMA
    STZ $07E9  ; Clear $07E9
    STZ $0943  ; Disable timer

    JSL $828A9A  ; Execute subroutine $82:8A9A

    LDA #$FFFF : STA $05F5  ; Disable sounds

    JSL $80835D  ; Disable NMI
    JSL $80985F  ; Disable horizontal and vertical timer interrupts
    JSL $82E76B  ; Execute subroutine $82:E76B
    JSR $A12B    ; Play 14h frames of music
    JSL $878016  ; Clear misc. animations
    JSL $88829E  ; Execute subroutine $88:829E
    JSL $8882C1  ; Execute subroutine $88:82C1
    JSL $8483C3  ; Clear PLMs
    JSL $868016  ; Clear E/R projectiles
    JSL $8DC4D8  ; Clear $8D PLM-esque headers
    JSR Randomize_Preset_Equipment
    JSL $90AC8D  ; Update beam graphics
    JSL $82E139  ; Load target colours for common sprites, beams and slashing enemies / pickups
    JSL $A08A1E  ; Load enemies
    JSL $82E071  ; Clear music
    JSR $A12B    ; Play 14h frames of music
    JSL $82E09B  ; Execute subroutine $82:E09B
    JSL $82E113  ; Execute subroutine $82:E113
    JSL $80A23F  ; VRAM $4800..4FFF = 3838h
    JSL $82E7D3  ; Execute subroutine $82:E7D3
    JSL $89AB82  ; Load FX1
    JSL $82E97C  ; Execute subroutine $82:E97C

    JSR $A2F9    ; Calculate layer 2 X position
    JSR $A33A    ; Calculate layer 2 Y position
    LDA $0917 : STA $0921  ; BG2 X scroll = layer 2 X scroll position
    LDA $0919 : STA $0923  ; BG2 Y scroll = layer 2 Y scroll position
    JSR $A37B    ; Calculate BG positions
    JSL $80A176  ; Display the viewable part of the room
    JSL $80834B  ; Enable NMI

    LDA #$0004 : STA $A7  ; Set optional next interrupt to Main gameplay

    JSL $80982A  ; Enable horizontal and vertical timer interrupts
    JSR $A12B    ; Play 14h frames of music

    LDA #$0000 : STA $05F5  ; Enable sounds
    JSL stop_all_sounds

    LDA #$E737 : STA $099C  ; Pointer to next frame's room transition code = $82:E737
    PLB
    PLP
    RTL
}

Randomize_Preset_Equipment:
{
    LDA !sram_presetrando : BNE .randomize
    RTS
  .randomize
    PHX
    ; equipment
    LDA $05E5 : AND #$F32F                                             ; get current random number
    STA $09A2 : STA $09A4                                              ; store equipment
    LDA !sram_presetrando_morph : BEQ +                                ; check if morph forced
    LDA $09A2 : ADC #$0004 : STA $09A2 : STA $09A4                     ; turn on morph

    ; beams
+   JSL $808111                                                        ; get new random number
    AND #$100F : STA $09A8                                             ; collected beams
    AND #$000C : CMP #$000C : BNE .beams_ok                            ; check for Spazer+Plasma
    LDA !sram_presetrando_beampref : BEQ .spazer                       ; check beam preference, 0 = spazer, 1 = plasma
    LDA $09A8 : SBC #$0004 : STA $09A6 : BRA +                         ; unequip Spazer
  .spazer
    LDA $09A8 : SBC #$0008 : STA $09A6 : BRA +                         ; unequip Plasma
  .beams_ok
    LDA $09A8 : STA $09A6                                              ; store equipped beams

    ; reserves
+   LDA $05E5 : AND #$F000 : LSR #4 : XBA                              ; reuse random number
    CMP !sram_presetrando_max_reserves : BPL .cap_reserves : ASL       ; check if capped
    TAX : LDA presetrando_reservetable,X                               ; load value from table
    STA $09D4 : STA $09D6 : BRA +                                      ; store reserves
  .cap_reserves
    SEC : SBC !sram_presetrando_max_reserves
    CMP !sram_presetrando_max_reserves : BPL .cap_reserves
    ASL : TAX : LDA presetrando_reservetable,X                         ; 
    STA $09D4 : STA $09D6                                              ; store capped reserves

    ; missiles
+   LDA $05E5 : AND #$0FF0 : LSR #4                                    ; reuse random number
    CMP !sram_presetrando_max_missiles : BPL .cap_missiles : ASL       ; check if capped
    TAX : LDA presetrando_missiletable,X
    STA $09C6 : STA $09C8 : BRA +                                      ; store random missiles
  .cap_missiles
    SEC : SBC !sram_presetrando_max_missiles
    CMP !sram_presetrando_max_missiles : BPL .cap_missiles
    ASL : TAX : LDA presetrando_missiletable,X
    STA $09C6 : STA $09C8                                              ; store capped missiles

    ; supers
+   JSL $808111 : AND #$00FF                                           ; get new random number
    CMP !sram_presetrando_max_supers : BPL .cap_supers : ASL           ; check if capped
    TAX : LDA presetrando_supertable,X
    STA $09CA : STA $09CC : BRA +                                      ; store random supers
  .cap_supers
    SEC : SBC !sram_presetrando_max_supers
    CMP !sram_presetrando_max_supers : BPL .cap_supers
    ASL : TAX : LDA presetrando_pbtable,X
    STA $09CA : STA $09CC                                              ; store capped supers

    ; pbs
+   LDA $05E5 : XBA : AND #$00FF                                       ; get new random number
    CMP !sram_presetrando_max_pbs : BPL .cap_pbs : ASL                 ; check if capped
    TAX : LDA presetrando_pbtable,X
    STA $09CE : STA $09D0 : BRA +                                      ; store random pbs
  .cap_pbs
    SEC : SBC !sram_presetrando_max_pbs
    CMP !sram_presetrando_max_pbs : BPL .cap_pbs
    ASL : TAX : LDA presetrando_pbtable,X
    STA $09CE : STA $09D0                                              ; store capped pbs

    ; etanks
+   JSL $808111 : AND #$000F                                           ; get new random number
    CMP !sram_presetrando_max_etanks : BPL .cap_etanks : ASL           ; check if capped
    TAX : LDA presetrando_etanktable,X                                 ; load value from table
    STA $09C2 : STA $09C4 : BRA .done                                  ; store energy
  .cap_etanks
    SEC : SBC !sram_presetrando_max_etanks
    CMP !sram_presetrando_max_etanks : BPL .cap_etanks
    ASL : TAX : LDA presetrando_etanktable,X                           ; load value from table
    STA $09C2 : STA $09C4                                              ; store energy

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

org $85B000
print pc, " Randomize presets start"


LoadRandomPreset:
    PHY : PHX
    JSL $808111
print pc, " <-- breakpoint here for preset rando"
    ASL : AND #$00FF : TAY
    LDA !sram_preset_category : ASL : TAX
    JSR (RandomizableCategoryTable,X)
    PLX : PLY
    RTL

RandomizableCategoryTable:
    dw CurrentCategorySpazer
    dw CurrentCategoryGtclassic
    dw CurrentCategoryKpdr21
    dw CategoryNotYetSupported ; CurrentCategoryNgplasma
    dw CurrentCategoryPrkd
    dw CategoryNotYetSupported ; CurrentCategoryPkrd
    dw CategoryNotYetSupported ; CurrentCategoryKpdr25
    dw CategoryNotYetSupported ; CurrentCategory14ice
    dw CategoryNotYetSupported ; CurrentCategory14speed
    dw CategoryNotYetSupported ; CurrentCategoryNghyper
    dw CategoryNotYetSupported ; CurrentCategory100early
    dw CategoryNotYetSupported ; CurrentCategoryHundo
    dw CategoryNotYetSupported ; CurrentCategoryRbo
    dw CategoryNotYetSupported ; CurrentCategoryAllbosskpdr
    dw CategoryNotYetSupported ; CurrentCategoryAllbosspkdr
    dw CategoryNotYetSupported ; CurrentCategoryAllbossprkd

CurrentCategoryKpdr21:
    LDA Kpdr21RandoTable,Y : STA !ram_load_preset
    RTS

CurrentCategoryKpdr22:
    LDA Kpdr22RandoTable,Y : STA !ram_load_preset
    RTS

CurrentCategoryPrkd:
    LDA PrkdRandoTable,Y : STA !ram_load_preset
    RTS

CurrentCategoryGtclassic:
    LDA GtclassicRandoTable,Y : STA !ram_load_preset
    RTS

CurrentCategorySpazer:
    LDA SpazerRandoTable, Y : STA !ram_load_preset
    RTS

CategoryNotYetSupported:
    ; do nothing
    RTS

Kpdr21RandoTable:
    dw $8A38, $8A84, $8AC4, $8B2E, $8B74, $8BB4, $8C06, $8C46, $8CA4, $8CF0, $8D24, $8D6A, $8DE0, $8E2C, $8E6C, $8EB2
    dw $8F1C, $8F56, $8FC6, $9012, $9046, $909E, $90DE, $9118, $9158, $91BC, $91FC, $9272, $92A6, $92CE, $9314, $934E
    dw $93B2, $93FE, $9438, $9466, $9494, $94E6, $9550, $95C6, $9624, $965E, $96B0, $9714, $9754, $97B2, $97D4, $9832
    dw $986C, $98C4, $993A, $996E, $99EA, $9A5A, $9A94, $9AFE, $9B32, $9B66, $9BA6, $9BE6, $9C32, $9C8A, $9CC4, $9CF2
    dw $9D38, $9DA2, $9DE2, $9E3A, $9E8C, $9EE4, $9F54, $9F5E, $9F9E, $9FD8, $A00C, $A05E, $A09E, $A10E, $A14E, $A194
    dw $A1DA, $A238, $A272, $A2CA, $A31C, $A356, $A38A, $A3C4, $A3FE, $A444, $A472, $A4CA, $A4FE, $A54A, $A590, $A5C4
    dw $A610, $A66E, $A6BA, $A6F4, $A752, $A7A4, $A7CC, $A80C, $A840, $A892, $A8D8, $A90C, $A946, $A998, $A9F0, $AA5A
    dw $AAA0, $AAD4, $AB38, $ABA2, $ABEE, $AC4C, $ACD4, $AD38, $AD90, $ADD6, $AE22, $AE74, $AECC, $AF12, $AF88, $AFB6

Kpdr22RandoTable:
    dw $8A2C, $8A78, $8AB8, $8B22, $8B68, $8BA8, $8BFA, $8C3A, $8C98, $8CE4, $8D18, $8D5E, $8DD4, $8E20, $8E60, $8EA6
    dw $8F1C, $8F56, $8FC6, $9012, $9046, $909E, $90DE, $9118, $9158, $91BC, $91FC, $9272, $92A6, $92CE, $9314, $934E
    dw $93B2, $93FE, $9438, $9466, $9494, $94E6, $9550, $95C6, $9624, $965E, $96B0, $9714, $9754, $97B2, $97D4, $9832
    dw $986C, $98C4, $993A, $996E, $99EA, $9A5A, $9A94, $9AFE, $9B32, $9B66, $9BA6, $9BE6, $9C32, $9C8A, $9CC4, $9CF2
    dw $9D38, $9DA2, $9DE2, $9E3A, $9E8C, $9EE4, $9F54, $9F5E, $9F9E, $9FD8, $A00C, $A05E, $A09E, $A10E, $A14E, $A194
    dw $A1DA, $A238, $A272, $A2CA, $A31C, $A356, $A38A, $A3C4, $A3FE, $A444, $A472, $A4CA, $A4FE, $A54A, $A590, $A5C4
    dw $A610, $A66E, $A6BA, $A6F4, $A752, $A7A4, $A7CC, $A80C, $A840, $A892, $A8D8, $A90C, $A946, $A998, $A9F0, $AA5A
    dw $AAA0, $AAD4, $AB38, $ABA2, $ABEE, $AC4C, $ACD4, $AD38, $AD90, $ADD6, $AE22, $AE74, $AECC, $AF12, $AF88, $AFB6

PrkdRandoTable:
    dw $CA84, $CAD6, $CB2E, $CB86, $CBC6, $CC2A, $CC70, $CCE6, $CD32, $CD78, $CDE2, $CE28, $CE6E, $CEBA, $CEF4, $CF46
    dw $CFB0, $D020, $D084, $D0D6, $D0F2, $D14A, $D190, $D1D0, $D234, $D256, $D2BA, $D2F4, $D352, $D3C8, $D408, $D484
    dw $D4F4, $D522, $D580, $D5F0, $D62A, $D66A, $D6AA, $D70E, $D760, $D7AC, $D81C, $D88C, $D8DE, $D92A, $D96A, $D9BC
    dw $DA0E, $DA4E, $DAAC, $DAF2, $DB2C, $DB6C, $DBCA, $DC34, $DC74, $DCEA, $DD30, $DD7C, $DDC8, $DE0E, $DE5A, $DE8E
    dw $DECE, $DF0E, $DF3C, $DF8E, $DFF2, $E038, $E06C, $E0A6, $E104, $E15C, $E184, $E1C4, $E1F8, $E244, $E28A, $E2C4
    dw $E2FE, $E34A, $E38A, $E3F4, $E44C, $E47A, $E4CC, $E54E, $E59A, $E5E0, $E632, $E66C, $E6DC, $E716, $E750, $E796
    dw $E80C, $E852, $E8B0, $E90E, $E972, $E9C4, $E9CE, $E9FC, $EA2A, $EA64, $EAA4, $EAEA, $EB30, $EB9A, $EBFE, $EC4A
    dw $ECA8, $ECF4, $ED52, $EDBC, $EDF0, $EE42, $EEA0, $EEEC, $EF38, $EF8A, $EFE2, $F02E, $F06E, $F0E4, $F118, $CA56

GtclassicRandoTable:
    dw $8750, $8750, $87A8, $87D6, $8828, $8880, $88D8, $8918, $897C, $89CE, $8A44, $8A96, $8A96, $8AF4, $8B40, $8B8C
    dw $8B8C, $8B8C, $8BD8, $8C1E, $8C52, $8CA4, $8D0E, $8D60, $8D9A, $8DDA, $8E1A, $8E54, $8EA6, $8EF2, $8F26, $8F72
    dw $8FF4, $903A, $9086, $90D2, $9124, $9124, $9182, $91E6, $9226, $9260, $92A6, $92D4, $92D4, $92D4, $9326, $936C
    dw $93A0, $93E6, $93E6, $93E6, $988E, $9934, $9986, $9986, $99D2, $9A0C, $9A46, $9A8C, $9A8C, $9AF0, $9B3C, $9B3C
    dw $9B76, $9BC8, $9C1A, $9C1A, $9C42, $9C8E, $9C8E, $9CD4, $9D26, $9D66, $9D9A, $9DD4, $9E26, $9E66, $9EC4, $9F34
    dw $9F6E, $9F9C, $9FD6, $A04C, $A092, $A092, $A0EA, $A148, $A19A, $A1A4, $A1CC, $A1CC, $A200, $A240, $A27A, $A2AE
    dw $A2F4, $A328, $A392, $A3FC, $A42A, $A482, $A4C8, $A50E, $A50E, $A572, $A5B2, $A610, $A644, $A690, $A6EE, $A76A
    dw $A7C8, $A7C8, $A7FC, $A85A, $A8B8, $A904, $A950, $A950, $A950, $A99C, $A9F4, $A9F4, $AA3A, $AAAA, $AADE, $AB12

SpazerRandoTable:
    dw $CC2E, $CC7A, $CCBA, $CD24, $CD6A, $CDAA, $CDFC, $CE3C, $CEB8, $CF04, $CF38, $CF7E, $CFF4, $D040, $D080, $D0C6
    dw $D14E, $D188, $D1F8, $D244, $D278, $D2D0, $D310, $D34A, $D38A, $D3EE, $D42E, $D4A4, $D4D8, $D500, $D546, $D580
    dw $D5E4, $D630, $D66A, $D698, $D6C6, $D718, $D782, $D7F8, $D856, $D890, $D8E2, $D946, $D986, $D9E4, $DA06, $DA64
    dw $DA9E, $DAF6, $DB6C, $DBA0, $DC1C, $DC8C, $DCC6, $DD30, $DD64, $DD98, $DDD8, $DE18, $DE64, $DEBC, $DEF6, $DF24
    dw $DF6A, $DFD4, $E014, $E06C, $E0BE, $E116, $E186, $E190, $E1D0, $E20A, $E23E, $E290, $E2D0, $E340, $E380, $E3C6
    dw $E40C, $E46A, $E4A4, $E4FC, $E54E, $E588, $E5BC, $E5F6, $E630, $E676, $E6A4, $E6FC, $E730, $E77C, $E7C2, $E7F6
    dw $E842, $E8A0, $E8EC, $E926, $E984, $E9D6, $E9FE, $EA3E, $EA72, $EAC4, $EB0A, $EB3E, $EB78, $EBCA, $EC22, $EC8C
    dw $ECD2, $ED06, $ED6A, $EDD4, $EE20, $EE7E, $EF06, $EF6A, $EFC2, $F008, $F054, $F0A6, $F0FE, $F144, $F1BA, $F1E8
}
print pc, " Randomize presets end"


print pc, " preset_start_gameplay end"
org $E08000 
  ; 42A2 (length in hex)
  print pc, " hundo data start"
  incsrc presets/hundo_data.asm
  print pc, " hundo data end"

  ; 2EAA (length in hex)
  print pc, " prkd data start"
  incsrc presets/prkd_data.asm
  print pc, " prkd data end"

org $E18000
  ; 3024 (length in hex)
  print pc, " kpdr21 data start"
  incsrc presets/kpdr21_data.asm
  print pc, " kpdr21 data end"

  ; 1E3A (length in hex)
  print pc, " kpdr25 data start"
  incsrc presets/kpdr25_data.asm
  print pc, " kpdr25 data end"

org $E28000
  ; 2B5E (length in hex)
  print pc, " gtclassic data start"
  incsrc presets/gtclassic_data.asm
  print pc, " gtclassic data end"

  ; 1E95 (length in hex)
  print pc, " 14ice data start"
  incsrc presets/14ice_data.asm
  print pc, " 14ice data end"

  ; 1EE6 (length in hex)
  print pc, " 14speed data start"
  incsrc presets/14speed_data.asm
  print pc, " 14speed data end"

org $E38000
  
  ; 2400 (length in hex)
  print pc, " allbosskpdr data start"
  incsrc presets/allbosskpdr_data.asm
  print pc, " allbosskpdr data end"

  ; 2484 (length in hex)
  print pc, " allbosspkdr data start"
  incsrc presets/allbosspkdr_data.asm
  print pc, " allbosspkdr data end"

  ; 2568 (length in hex)
  print pc, " allbossprkd data start"
  incsrc presets/allbossprkd_data.asm
  print pc, " allbossprkd data end"

org $E48000
  
  ; 423C (length in hex)
  print pc, " 100early data start"
  incsrc presets/100early_data.asm
  print pc, " 100early data end"

  ; 3024 (length in hex)
  print pc, " spazer data start"
  incsrc presets/spazer_data.asm
  print pc, " spazer data end"

org $E58000
  
  ; 1B5A (length in hex)
  print pc, " ngplasma data start"
  incsrc presets/ngplasma_data.asm
  print pc, " ngplasma data end"

  ; 1B70 (length in hex)
  print pc, " nghyper data start"
  incsrc presets/nghyper_data.asm
  print pc, " nghyper data end"

  ; 3274 (length in hex)
  print pc, " rbo data start"
  incsrc presets/rbo_data.asm
  print pc, " rbo data end"

org $E68000

  ; 2EBC (length in hex)
  print pc, " pkrd data start"
  incsrc presets/pkrd_data.asm
  print pc, " pkrd data end"
