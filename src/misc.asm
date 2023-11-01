; Patch out copy protection
org $008000
    db $FF


; Set SRAM size
org $00FFD8
if !FEATURE_TINYSTATES
    db $07 ; 128kb
else
if !FEATURE_SD2SNES
    db $08 ; 256kb
else
    db $05 ; 64kb
endif
endif


; Set version in game header
org $00FFDB
    db !VERSION_HEADER


; Write offset to hack RAM for cout's timer tracking tool
org $80FFF0
    dl !WRAM_START


; Enable version display
org $8B8697
    NOP

; 'Ver.' OAM entry X positions
;$8B:8774             dw 0074, 006C, 0064
org $8B8774
    dw $0060, $0058, $0050

; Version string OAM entry X positions
;$8B:8764             db $80, $88, $90, $98, $A0, $A8, $B0, $B8, $C0, $C8, $D0, $D8, $E0, $E8, $F0, $F8
org $8B8764 ; center version string
    db $68, $70, $78, $80, $88, $90, $98, $A0, $A8, $B0, $B8, $C0, $C8, $D0, $D8, $E0

if !FEATURE_PAL
org $8BF6DC
else
org $8BF754
endif
    db #$20, #($30+!VERSION_MAJOR)
    db #$2E, #($30+!VERSION_MINOR)
    db #$2E, #($30+!VERSION_BUILD)
if !VERSION_REV_1
    db #$2E, #($30+!VERSION_REV_1)
    db #($30+!VERSION_REV_2)
    db #$20, #$20
else
if !VERSION_REV_2
    db #$2E, #($30+!VERSION_REV_2)
    db #$20, #$20, #$20
else
    db #$20, #$20, #$20, #$20, #$20
endif
endif


; Fix Zebes planet tiling error
org $8C9607
    dw #$0E2F


; Turn off health alarm
if !FEATURE_PAL
org $90EA89
else
org $90EA8C
endif
    LDA !sram_healthalarm : ASL : PHX : TAX
    JMP (healthalarm_turn_off_table,X)

; Turn on health alarm
if !FEATURE_PAL
org $90EA9A
else
org $90EA9D
endif
    LDA !sram_healthalarm : ASL : PHX : TAX
    JMP (healthalarm_turn_on_table,X)

; Turn on health alarm
if !FEATURE_PAL
org $90F336
    JSR $EA9A
else
org $90F339
    JSR $EA9D
endif
    BRA $02

; Turn on health alarm from bank 91
if !FEATURE_PAL
org $91E63F
else
org $91E6DA
endif
    JML healthalarm_turn_on_remote


if !PRESERVE_WRAM_DURING_SPACETIME
org $90ACF6
    JSR original_load_projectile_palette

org $90AD18
    JMP spacetime_routine
endif


; Skips the waiting time after teleporting
if !FEATURE_PAL
org $90E874
else
org $90E877
endif
    LDA $07F5
    JSL $808FC1 ; queue room music track
    BRA $18


; $82:8BB3 22 69 91 A0 JSL $A09169[$A0:9169]  ; Handles Samus getting hurt?
org $828BB3
if !FEATURE_VANILLAHUD
    ; Vanilla HUD build doesn't need artificial lag
else
    JSL gamemode_end
endif


; Replace unnecessary logic checking controller input to toggle debug CPU brightness
; with logic to collect the v-counter data
org $828AB1
misc_debug_brightness:
    %a8() : LDA $4201 : ORA #$80 : STA $4201 : %ai16()
    LDA $2137 : LDA $213D : STA !ram_vcounter_data

    ; For efficiency, re-implement the debug brightness logic here
    LDA $0DF4 : BEQ .skipDebugBrightness
    %a8() : LDA $51 : AND #$F0 : ORA #$05 : STA $2100 : %a16()
    BRA .skipDebugBrightness
warnpc .skipDebugBrightness

org $828ADD       ; Resume original logic
  .skipDebugBrightness


org $CF8BBF       ; Set map scroll beep to high priority
    dw $2A97


org $808F24
    JSL hook_set_music_track
    BRA $00

org $808F65
    JML hook_set_music_data

org $88B446
    JSL random_bubble_sfx

if !FEATURE_PAL
org $82F067
else
org $82F071
endif
    JSL IconCancelMenu
    NOP


org $90D000       ; hijack, runs when a shinespark is activated
    JMP ih_shinespark_activation


; Continue drawing escape timer after reaching ship
if !FEATURE_PAL
org $90E905
else
org $90E908
endif
    JSR preserve_escape_timer

; Stop drawing timer when its VRAM is overwritten
if !FEATURE_PAL
org $A2AC15
else
org $A2ABFD
endif
    JML clear_escape_timer

; Fast bowling chozo cutscene
if !FEATURE_PAL
org $84D671
else
org $84D66B
endif
    JSL lock_samus_bowling


; Preserve Hyper Beam if activated by preset
org $82805B
    JSL PreserveHyperBeam


org $87D000
print pc, " misc start"

hook_set_music_track:
; $80:8F24 9C F6 07    STZ $07F6  [$7E:07F6]  ;/
; $80:8F27 8D 40 21    STA $2140  [$7E:2140]  ; APU IO 0 = [music track]
{
    STZ $07F6
    PHA
    LDA !sram_music_toggle : CMP #$01 : BNE .music_off

  .play_music
    PLA : STA $2140
    RTL

  .music_off
    ; option to force fanfare music
    LDA !sram_fanfare_toggle : CMP #$02 : BNE .no_music
    LDA !MUSIC_TRACK : BEQ .play_music
    CMP #$02 : BEQ .play_music

  .no_music
    PLA
    RTL
}

hook_set_music_data:
{
    STA $07F3 : TAX ; overwritten code
    LDA !sram_music_toggle : CMP #$0002 : BEQ .fast_no_music
    JML $808F69

  .fast_no_music
    JML $808F89
}

random_bubble_sfx:
{
    TAY ; preserve A
    LDA !sram_random_bubble_sfx : BNE .mute
    TYA
    JML $8090CB ; overwritten code

  .mute
    RTL
}

gamemode_end:
{
   ; overwritten logic
if !FEATURE_PAL
    JSL $A09179
else
    JSL $A09169
endif

    ; If minimap is disabled or shown, we ignore artificial lag
    LDA $05F7 : BNE .endlag
    LDA !ram_minimap : BNE .endlag

    ; Ignore artifical lag if sprite features are active
    LDA !ram_sprite_feature_flags : BNE .endlag

    ; Artificial lag, multiplied by 16 to get loop count
    ; Each loop takes 5 clock cycles (assuming branch taken)
    ; For reference, 41 loops ~= 1 scanline
    LDA !sram_artificial_lag : BEQ .endlag

    ; To account for various changes, we may need to tack on more clock cycles
    ; These can be removed as code is added to maintain CPU parity during normal gameplay
    LDA !sram_top_display_mode : CMP !TOP_HUD_VANILLA_INDEX : BEQ .vanilla_display_lag_loop
    LDA !ram_frames_held : BNE .vanilla_display_lag_loop
    LDA !sram_artificial_lag
    ASL #4
if !FEATURE_SD2SNES
; skip 6 cycles for auto-savestate in doors check
else
    NOP #3 ; Add 6 more clock cycles
endif
    NOP  ; Add 2 more clock cycles
    CLC : ADC #$000B ; Add 60 cycles including CLC+ADC
    TAX
  .lagloop
    DEX : BNE .lagloop
  .endlag
    RTL

  .vanilla_display_lag_loop
    ; Vanilla display logic uses more CPU so reduce artificial lag
    LDA !sram_artificial_lag
    DEC : BEQ .endlag ; Remove 76 clock cycles
    DEC : BEQ .endlag ; Remove 76 clock cycles
    ASL #2
    INC ; Add 4 loops (22 clock cycles including the INC)
    ASL #2
if !FEATURE_SD2SNES
else
    INC  ; Add 1 loop (7 clock cycles including the INC)
endif
    NOP #2 ; Add 4 more clock cycles
    CLC : ADC #$000B ; Add 60 cycles including CLC+ADC
    TAX
  .vanilla_lagloop
    DEX : BNE .vanilla_lagloop
    RTL
}

stop_all_sounds:
{
; If sounds are not enabled, the game won't clear the sounds
    LDA !DISABLE_SOUNDS : PHA
    STZ !DISABLE_SOUNDS
    JSL $82BE17  ; Cancel sound effects
    PLA : STA !DISABLE_SOUNDS

    ; Makes the game check Samus' health again, to see if we need annoying sound
    STZ !SAMUS_HEALTH_WARNING
    RTL
}

GameModeExtras:
{
    ; The following shortcuts will only be checked if the main flag is enabled
    ; Set flag if any less common shortcuts are configured
    LDA !sram_ctrl_reset_segment_timer : BNE .enabled
    LDA !sram_ctrl_reset_segment_later : BNE .enabled
    LDA !sram_ctrl_kill_enemies : BNE .enabled
    LDA !sram_ctrl_full_equipment : BNE .enabled
    LDA !sram_ctrl_save_custom_preset : BNE .enabled
    LDA !sram_ctrl_load_custom_preset : BNE .enabled
    LDA !sram_ctrl_inc_custom_preset : BNE .enabled
    LDA !sram_ctrl_dec_custom_preset : BNE .enabled
    LDA !sram_ctrl_toggle_tileviewer : BNE .enabled
    LDA !sram_ctrl_force_stand : BNE .enabled
    LDA !sram_ctrl_update_timers : BNE .enabled
    RTL

  .enabled
    STA !ram_game_mode_extras
    RTL
}

IconCancelMenu:
{
    ; Reset to default menu shortcut if L+R+Sl+X held
    LDA !IH_CONTROLLER_PRI : CMP #$2060 : BNE .done
    LDA #$3000 : STA !sram_ctrl_menu

  .done
    ; overwritten code
    LDA !IH_CONTROLLER_PRI_NEW : BIT #$1380
    RTL
}

PreserveHyperBeam:
{
    ; flag set by NG+ Hyper presets
    LDA !ram_hyper_beam : STA !SAMUS_HYPER_BEAM
    JML $80C437 ; overwritten code
}
print pc, " misc end"


org $90F800
print pc, " misc bank90 start"

lock_samus_bowling:
{
    LDA !sram_cutscenes : BIT !CUTSCENE_FAST_BOWLING : BNE .speedup
    LDA #$0000
if !FEATURE_PAL
    JML $90F081
else
    JML $90F084
endif

  .speedup
    LDA #$0000
if !FEATURE_PAL
    JSL $90F081
else
    JSL $90F084
endif
    LDA.w #locked_samus_speedup_movement_handler
    STA $0A42
    RTL
}

locked_samus_speedup_movement_handler:
{
    ; Original logic
    PHP : PHB : PHK : PLB
    %ai16()
    JSR $AECE     ; Handle projectiles
if !FEATURE_PAL
    JSR $EAFF     ; Handle Samus movement
else
    JSR $EB02     ; Handle Samus movement
endif

    ; Bowling cutscene runs for 1938 frames, which is divisible by 6
    ; We can therefore run two extra passes per frame
    ; without having to check if the cutscene has ended
    ; (we could do five extra passes but the rendering is not good)

    ; Execute first extra pass
    JSL $868104   ; Enemy projectile handler
    JSL $8485B4   ; PLM handler
if !FEATURE_PAL
    JSL $A08FE4   ; Main enemy routine
    JSR $AECE     ; Handle projectiles
    JSR $EAFF     ; Handle Samus movement
else
    JSL $A08FD4   ; Main enemy routine
    JSR $AECE     ; Handle projectiles
    JSR $EB02     ; Handle Samus movement
endif

    ; Execute second extra pass
    JSL $868104   ; Enemy projectile handler
    JSL $8485B4   ; PLM handler
if !FEATURE_PAL
    JSL $A08FE4   ; Main enemy routine
    JSR $AECE     ; Handle projectiles
    JSR $EAFF     ; Handle Samus movement
else
    JSL $A08FD4   ; Main enemy routine
    JSR $AECE     ; Handle projectiles
    JSR $EB02     ; Handle Samus movement
endif

    PLB : PLP : RTL
}


healthalarm_turn_on_table:
    dw healthalarm_turn_on_never
    dw healthalarm_turn_on_vanilla
    dw healthalarm_turn_on_pb_fix
    dw healthalarm_turn_on_improved

healthalarm_turn_on_improved:
    ; Do not sound alarm until below 30 combined health
    LDA $09C2 : CLC : ADC $09D6 : CMP #$001E : BPL healthalarm_turn_on_done

healthalarm_turn_on_pb_fix:
    ; Do not sound alarm if it won't play due to power bomb explosion
    LDA $0592 : BMI healthalarm_turn_on_done

healthalarm_turn_on_vanilla:
    LDA #$0002 : JSL $80914D

healthalarm_turn_on_never:
    LDA #$0001 : STA !SAMUS_HEALTH_WARNING

healthalarm_turn_on_done:
    PLX : RTS

healthalarm_turn_off_table:
    dw healthalarm_turn_off_never
    dw healthalarm_turn_off_vanilla
    dw healthalarm_turn_off_pb_fix
    dw healthalarm_turn_off_improved

healthalarm_turn_off_improved:
healthalarm_turn_off_pb_fix:
    ; Do not stop alarm if it won't stop due to power bomb explosion
    LDA $0592 : BMI healthalarm_turn_off_done

healthalarm_turn_off_vanilla:
    LDA #$0001 : JSL $80914D

healthalarm_turn_off_never:
    STZ !SAMUS_HEALTH_WARNING

healthalarm_turn_off_done:
    PLX : RTS

healthalarm_turn_on_remote:
if !FEATURE_PAL
    JSR $EA9A
else
    JSR $EA9D
endif
    PLB : PLP : RTL


if !PRESERVE_WRAM_DURING_SPACETIME
original_load_projectile_palette:
{
    AND #$0FFF : ASL : TAY
    LDA #$0090 : XBA : STA $01
    LDA $C3C9,Y : STA $00
    LDY #$0000
    LDX #$0000

  .original_load_palette_loop
    LDA [$00],Y
    STA $7EC1C0,X
    INX : INX : INY : INY
    CPY #$0020 : BMI .original_load_palette_loop
    RTS
}

spacetime_routine:
{
    ; The normal routine shouldn't come here, but sanity check just in case
    ; Also skips out if spacetime but Y value is positive
    INY : INY : CPY #$0000 : BPL .normal_load_palette

    ; Sanity check that X is 0 (if not then do the original routine)
    CPX #$0000 : BNE .normal_load_palette

    ; Spacetime
    LDA $00 : STA !ram_spacetime_read_address
    LDA $02 : STA !ram_spacetime_read_bank
    TYA : DEC : DEC : STA !ram_spacetime_y

    ; Check if Y will cause us to reach infohud
    CLC : ADC #($7EC608-$7EC1E0) : CMP #$0000 : BPL .normal_load_palette

    ; It will, so run our own loop
    INX : INX
  .loop_before_infohud
    LDA [$00],Y
    STA $7EC1C0,X
    INX : INX : INY : INY
    CPX #($7EC608-$7EC1C0) : BMI .loop_before_infohud
 
    ; Check if we should skip over infohud
    LDA !ram_spacetime_infohud : BEQ .check_wram_overwrite_infohud

    ; Skip over infohud and check for wram
    TXA : CLC : ADC #($7EC6C8-$7EC608) : TAX
    TYA : CLC : ADC #($7EC6C8-$7EC608) : TAY
    CPY #$0020 : BMI .check_wram
    RTS

  .normal_load_loop
    LDA [$00],Y
    STA $7EC1C0,X
    INY : INY
  .normal_load_palette
    INX : INX
    CPY #$0020 : BMI .normal_load_loop
    RTS

  .check_wram_overwrite_infohud
    ; Check if Y will cause us to reach WRAM
    TYA : CLC : ADC #(!WRAM_START-$7EC62A) : CMP #$0000 : BPL .normal_load_palette
    BRA .loop_before_wram

  .check_wram
    ; Check if Y will cause us to reach WRAM
    TYA : CLC : ADC #(!WRAM_START-$7EC6EA) : CMP #$0000 : BPL .normal_load_palette

    ; It will, so run our own loop
  .loop_before_wram
    LDA [$00],Y
    STA $7EC1C0,X
    INX : INX : INY : INY
    CPX #(!WRAM_START-$7EC1C0) : BMI .loop_before_wram

    ; Skip over WRAM and resume normal loop
    TXA : CLC : ADC !WRAM_SIZE : TAX
    TYA : CLC : ADC !WRAM_SIZE : TAY
    CPY #$0020 : BMI .normal_load_loop
    RTS
}
endif


ih_shinespark_activation:
{
    ; store timer when shinespark activated
    LDA !SAMUS_SHINE_TIMER : STA !ram_activated_shine_duration

    LDA #$D068 ; overwritten code
    JMP $D003 ; return
}


preserve_escape_timer:
{
    ; check if timer is active
    LDA $0943 : BEQ .done
    JSL $809F6C ; Draw timer

  .done
if !FEATURE_PAL
    JMP $EA7C
else
    JMP $EA7F ; overwritten code
endif
}

clear_escape_timer:
{
    ; clear timer status
    STZ $0943

    ; overwritten code
if !FEATURE_PAL
    LDA #$AC33
else
    LDA #$AC1B
endif
    STA $0FB2,X
    STZ $0DEC
    RTL
}

print pc, " misc bank90 end"


org $8BFA00
print pc, " misc bank8B start"

; Decompression optimization adapted from Kejardon, with fixes by PJBoy and Maddo
; Compression format: One byte (XXX YYYYY) or two byte (111 XXX YY-YYYYYYYY) headers
; XXX = instruction, YYYYYYYYYY = counter
optimized_decompression_end:
{
    PLB : PLP
    RTL
}

optimized_decompression:
{
    PHP : %a8() : %i16()
    ; Set bank
    PHB : LDA $49 : PHA : PLB

    STZ $50 : LDY #$0000

  .next_byte
    LDA ($47)
    INC $47 : BNE .read_command_skip_inc
    INC $48 : BNE .read_command_skip_inc
    JSR decompression_increment_bank
  .read_command_skip_inc
    STA $4A
    CMP #$FF : BEQ optimized_decompression_end
    CMP #$E0 : BCC .one_byte_size

    ; Two byte size
    ASL : ASL : ASL
    AND #$E0 : PHA
    LDA $4A : AND #$03 : XBA

    LDA ($47)
    INC $47 : BNE .read_extended_size_skip_inc
    INC $48 : BNE .read_extended_size_skip_inc
    JSR decompression_increment_bank
  .read_extended_size_skip_inc
    BRA .data_read

  .one_byte_size
    AND #$E0 : PHA
    TDC : LDA $4A : AND #$1F

  .data_read
    TAX : INX : PLA
    BMI .option4567 : BEQ .option0
    CMP #$20 : BEQ .option1
    CMP #$40 : BEQ .option2
    BRL .option3

  .option0:
    ; Option X = 0: Directly copy Y bytes
    LDA ($47)
    INC $47 : BNE .option0_read_skip_inc
    INC $48 : BNE .option0_read_skip_inc
    JSR decompression_increment_bank
  .option0_read_skip_inc
    STA [$4C],Y
    INY : DEX : BNE .option0
    BRL .next_byte

  .option1:
    ; Option X = 1: Copy the next byte Y times
    LDA ($47)
    INC $47 : BNE .option1_read_skip_inc
    INC $48 : BNE .option1_read_skip_inc
    JSR decompression_increment_bank
  .option1_read_skip_inc
    STA [$4C],Y
    INY : DEX : BNE .option1_read_skip_inc
    BRL .next_byte

  .option2:
    ; Option X = 2: Copy the next two bytes, one at a time, for the next Y bytes
    ; Apply PJ's fix to divide X by 2 and set carry if X was odd
    REP #$20 : TXA : LSR : TAX : SEP #$20
    LDA ($47)
    INC $47 : BNE .option2_lsb_read_skip_inc
    INC $48 : BNE .option2_lsb_read_skip_inc
    JSR decompression_increment_bank
  .option2_lsb_read_skip_inc
    XBA : LDA ($47)
    INC $47 : BNE .option2_msb_read_skip_inc
    INC $48 : BNE .option2_msb_read_skip_inc
    JSR decompression_increment_bank
  .option2_msb_read_skip_inc
    XBA
    ; Apply Maddo's fix accounting for single copy (X = 1 before divide by 2)
    INX : DEX : BEQ .option2_single_copy
    REP #$20
  .option2_loop
    STA [$4C],Y
    INY : INY : DEX : BNE .option2_loop
    ; PJ's fix to account for case where X was odd
    SEP #$20
  .option2_single_copy
    BCC .option2_end
    STA [$4C],Y : INY
  .option2_end
    BRL .next_byte

  .option4567:
    CMP #$C0 : AND #$20 : STA $4F : BCS .option67

    ; Option X = 4: Copy Y bytes starting from a given address in the decompressed data
    ; Option X = 5: Copy and invert (EOR #$FF) Y bytes starting from a given address in the decompressed data
    LDA ($47)
    INC $47 : BNE .option45_lsb_read_skip_inc
    INC $48 : BNE .option45_lsb_read_skip_inc
    JSR decompression_increment_bank
  .option45_lsb_read_skip_inc
    XBA : LDA ($47)
    INC $47 : BNE .option45_msb_read_skip_inc
    INC $48 : BNE .option45_msb_read_skip_inc
    JSR decompression_increment_bank
  .option45_msb_read_skip_inc
    XBA : REP #$21
    ADC $4C : STY $44 : SEC

  .option_dictionary
    SBC $44 : STA $44
    SEP #$20
    LDA $4E : BCS .skip_carry_subtraction
    DEC
  .skip_carry_subtraction
    STA $46
    LDA $4F : BNE .option5_loop

  .option4_loop
    LDA [$44],Y
    STA [$4C],Y
    INY : DEX : BNE .option4_loop
    BRL .next_byte

  .option5_loop
    LDA [$44],Y
    EOR #$FF
    STA [$4C],Y
    INY : DEX : BNE .option5_loop
    BRL .next_byte

  .option67
    ; Option X = 6: Copy Y bytes starting from a given number of bytes ago in the decompressed data
    ; Option X = 7: Copy and invert (EOR #$FF) Y bytes starting from a given number of bytes ago in the decompressed data
    TDC : LDA ($47)
    INC $47 : BNE .option67_read_skip_inc
    INC $48 : BNE .option67_read_skip_inc
    JSR decompression_increment_bank
  .option67_read_skip_inc
    REP #$20
    STA $44 : LDA $4C
    BRA .option_dictionary

  .option3
    ; Option X = 3: Incrementing fill Y bytes starting with next byte
    LDA ($47)
    INC $47 : BNE .option3_read_skip_inc
    INC $48 : BNE .option3_read_skip_inc
    JSR decompression_increment_bank
  .option3_read_skip_inc
    STA [$4C],Y
    INC : INY : DEX : BNE .option3_read_skip_inc
    BRL .next_byte
}

decompression_increment_bank:
{
    PHA
    PHB : PLA
    INC
    PHA : PLB
    LDA #$80 : STA $48
    PLA
    RTS
}
print pc, " misc bank8B end"

