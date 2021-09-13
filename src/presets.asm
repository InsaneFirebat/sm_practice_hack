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
if !FEATURE_PAL
    JSL $91DF72  ; Initialise Samus
else
    JSL $91E00D  ; Initialise Samus
endif

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
if !FEATURE_PAL
    JSL $A08CE7  ; Load enemies
else
    JSL $A08CD7  ; Load enemies
endif
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
if !FEATURE_PAL
    JSL $91DE4B
else
    JSL $91DEBA
endif

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
    STZ $0795 ; clear door transition flag

    ; Option to clear enemies, 1 = kill
    LDA !sram_preset_enemies : BEQ .enemies
    LDA #$0000

    ; 8000 = solid to Samus, 0400 = Ignore Samus projectiles
-   TAX : LDA $0F86,X : BIT #$8400 : BNE +
    ORA #$0200 : STA $0F86,X

+   TXA : CLC : ADC #$0040 : CMP #$0400 : BNE -
    ; JSL $A08A6D ; Clear enemy data and process enemy set ;; Pinkus probably disabled this call because it's already been executed
    BRA .done

  .enemies
    LDA !ram_custom_preset : BEQ .done
    JSL custom_preset_enemy_data

  .done
    LDA #$0000 : STA !ram_custom_preset
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
    STA $0795   ; "Currently transitioning"
    STA $0797   ; "Currently transitioning"
    PLB
    RTL
}

preset_to_memory:
{
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
}

preset_banks:
{
  dw preset_spazer_crateria_ship>>16
  dw preset_kpdr21_crateria_ship>>16
  dw preset_prkd_crateria_ship>>16
  dw preset_pkrd_crateria_ship>>16
  dw preset_kpdr25_bombs_ceres_elevator>>16
  dw preset_gtclassic_crateria_ship>>16
  dw preset_gtmax_crateria_ship>>16
  dw preset_14ice_crateria_ceres_elevator>>16
  dw preset_14speed_crateria_ceres_elevator>>16
  dw preset_100early_crateria_ceres_elevator>>16
  dw preset_hundo_bombs_ceres_elevator>>16
  dw preset_rbo_bombs_ceres_elevator>>16
  dw preset_ngplasma_ceres_station_ceres_elevator>>16
  dw preset_nghyper_ceres_station_ceres_elevator>>16
  dw preset_nintendopower_crateria_ship>>16
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
if !FEATURE_PAL
    JSL $A08A2E  ; Load enemies
else
    JSL $A08A1E  ; Load enemies
endif
    JSL $82E071  ; Clear music
    JSR $A12B    ; Play 14h frames of music
    JSL $82E09B  ; Execute subroutine $82:E09B
    JSL $82E113  ; Execute subroutine $82:E113
    JSL $80A23F  ; VRAM $4800..4FFF = 3838h
    JSL $82E7D3  ; Execute subroutine $82:E7D3
    JSL $89AB82  ; Load FX1
    JSL $82E97C  ; Execute subroutine $82:E97C

    JSR preset_scroll_fixes
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

    LDA #$E695 : STA $0A42 ; Unlock Samus
    LDA #$E725 : STA $0A44 ; Unlock Samus
    STZ $0E18 ; Set elevator to inactive

+   LDA #$0000 : STA $05F5  ; Enable sounds
    JSL stop_all_sounds

    LDA #$E737 : STA $099C  ; Pointer to next frame's room transition code = $82:E737
    PLB
    PLP
    RTL
}

preset_scroll_fixes:
{
    ; Fixes bad scrolling caused by a loading into a position that
    ; is normally hidden until passing over a red scroll block.
    ; These fixes can often be found in nearby door asm.
    PHP : %a8() : %i16()
    LDX $079B : LDA #$01
+   CPX #$A011 : BNE +        ; bottom-left of Etecoons Etank
    STA $7ECD25 : STA $7ECD26
    BRA .done
+   CPX #$AE32 : BNE +        ; bottom of Volcano Room
    STA $7ECD26
    BRA .done
+   CPX #$B07A : BNE +        ; top of Bat Cave
    STA $7ECD20
    BRA .done
+   CPX #$B1E5 : BNE +        ; bottom of Acid Chozo Room
    STA $7ECD26 : STA $7ECD27 : STA $7ECD28
    LDA #$00 : STA $7ECD23 : STA $7ECD24
    BRA .done
+   CPX #$B3A5 : BNE +        ; bottom of Pre-Pillars
    STA $7ECD22 : STA $7ECD24
    LDA #$00 : STA $7ECD21
    BRA .done
+   CPX #$CC6F : BNE +        ; right of Basement (Phantoon)
    STA $7ECD24
    BRA .done
+   CPX #$D8C5 : BNE .done    ; Pants Room (door to Shaktool)
    LDA #$00 : STA $7ECD22

  .done
    PLP
    RTS
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
    LDA $09A2 : ORA #$0004 : STA $09A2 : STA $09A4                     ; turn on morph
    ; beams
+   JSL $808111                                                        ; get new random number
    AND #$100F : STA $09A8                                             ; collected beams
    AND #$000C : CMP #$000C : BNE .beams_done                          ; check for Spazer+Plasma
    LDA !sram_presetrando_beampref : BEQ .random_pref                  ; check beam preference, 0 = random
    DEC : BEQ .spazer                                                  ; after decrement, 0 = spazer, 1 = plasma
  .plasma
    LDA $09A8 : AND #$100B : STA $09A6 : BRA +                         ; unequip Spazer
  .spazer
    LDA $09A8 : AND #$1007 : STA $09A6 : BRA +                         ; unequip Plasma
  .random_pref
    LDA $05B6 : AND #$0001 : BEQ .spazer                               ; get random bit
    BRA .plasma
  .beams_done
    LDA $09A8 : STA $09A6
    
    ; charge
+   LDA !sram_presetrando_charge : BEQ +                               ; check if charge forced
    LDA $09A8 : ORA #$1000 : STA $09A8                                 ; equip charge beam and store equipped beams
    LDA $09A6 : ORA #$1000 : STA $09A6                                 ; store equipped beams

    ; reserves
+   LDA !sram_presetrando_max_reserves : BEQ .no_reserves              ; check if max = 0
    LDA $05E5 : AND #$F000 : LSR #4 : XBA                              ; reuse random number
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
    LDA $05E5 : AND #$0FF0 : LSR #4                                    ; reuse random number
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
    JSL $808111 : AND #$00FF                                           ; get new random number
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
    LDA $05E5 : XBA : AND #$00FF                                       ; get new random number
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
    JSL $808111 : AND #$000F                                           ; get new random number
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
print pc, " preset_start_gameplay end"
warnpc $80FFC0

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


org $FE8000    ; 749Eh bytes used / B62h bytes free
incsrc presets/prkd_menu.asm   ; E6Ah bytes
incsrc presets/kpdr21_menu.asm   ; F91h bytes
incsrc presets/hundo_menu.asm   ; 1220h bytes
incsrc presets/100early_menu.asm   ; 1320h bytes
incsrc presets/rbo_menu.asm   ; D97h bytes
incsrc presets/kpdr25_menu.asm   ; 69Fh bytes
incsrc presets/gtclassic_menu.asm   ; D7Ch bytes
incsrc presets/14ice_menu.asm   ; 7C6h bytes
incsrc presets/14speed_menu.asm   ; 7EBh bytes
print pc, " preset_menu.asm bankFE end"

org $FF8000    ; 5666h bytes used / 299Ah bytes free
incsrc presets/allbosskpdr_menu.asm   ; 942h bytes
incsrc presets/allbosspkdr_menu.asm   ; 9B0h bytes
incsrc presets/allbossprkd_menu.asm   ; 9BEh bytes
incsrc presets/pkrd_menu.asm   ; E6Ah bytes
incsrc presets/ngplasma_menu.asm   ; 85Ch bytes
incsrc presets/nghyper_menu.asm   ; 864h bytes
incsrc presets/nintendopower_menu.asm   ; 70Ch bytes
incsrc presets/spazer_menu.asm   ; F91h bytes
incsrc presets/gtmax_menu.asm   ; 137Bh bytes
print pc, " preset_menu.asm bankFF end"

org $E18000
incsrc presets/prkd_data.asm ; 2EAAh bytes
incsrc presets/hundo_data.asm ; 42A2h bytes
print pc, " preset_data.asm BankE1 end"

org $E28000
incsrc presets/kpdr21_data.asm ; 2FF6h bytes
incsrc presets/rbo_data.asm ; 3274h bytes
print pc, " preset_data.asm BankE2 end"

org $E38000
incsrc presets/gtclassic_data.asm ; 2B5Eh bytes
incsrc presets/14ice_data.asm ; 1E95h bytes
incsrc presets/14speed_data.asm ; 1EE6h bytes
print pc, " preset_data.asm BankE3 end"

org $E48000
incsrc presets/allbosskpdr_data.asm ; 2400h bytes
incsrc presets/allbosspkdr_data.asm ; 2484h bytes
incsrc presets/allbossprkd_data.asm ; 2568h bytes
print pc, " preset_data.asm BankE4 end"

org $E58000
incsrc presets/100early_data.asm ; 423Ch bytes
incsrc presets/spazer_data.asm ; 3024h bytes
print pc, " preset_data.asm BankE5 end"

org $E68000
incsrc presets/pkrd_data.asm ; 2EBCh bytes
incsrc presets/gtmax_data.asm ; 420Ah bytes
print pc, " preset_data.asm BankE6 end"

org $E78000
incsrc presets/kpdr25_data.asm ; 1E3Ah bytes
incsrc presets/nintendopower_data.asm ; 20F8h bytes
incsrc presets/ngplasma_data.asm ; 1B5Ah bytes
incsrc presets/nghyper_data.asm ; 1B70h bytes
print pc, " preset_data.asm BankE7 end"
