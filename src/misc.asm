; Patch out copy protection
org $008000
    db $FF

; Set SRAM size
org $00FFD8
if !FEATURE_SD2SNES
    db $08 ; 256kb
else
    db $05 ; 64kb
endif


; Skip intro
; $82:EEDF A9 95 A3    LDA #$A395
org $82EEDF
    LDA #$C100

; Fix Zebes planet tiling error
org $8C9607
    dw #$0E2F


; Enable version display
org $8B8697
    NOP

org $8BF754
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


; Skips the waiting time after teleporting
org $90E877
    BRA $1F


; Adds frames when unpausing (nmi is turned off during vram transfers)
; $80:A16B 22 4B 83 80 JSL $80834B[$80:834B]
org $80A16B
    JSL hook_unpause


; $82:8BB3 22 69 91 A0 JSL $A09169[$A0:9169]  ; Handles Samus getting hurt?
org $828BB3
    JSL gamemode_end


; Replace unnecessary logic checking controller input to toggle debug CPU brightness
; with logic to collect the v-counter data
org $828AB1
    %a8() : LDA $4201 : ORA #$80 : STA $4201 : %ai16()
    LDA $2137 : LDA $213D : STA !ram_vcounter_data

    ; For efficiency, re-implement the debug brightness logic here
    LDA $0DF4 : BEQ .skip_debug_brightness
    %a8() : LDA $51 : AND #$F0 : ORA #$05 : STA $2100 : %a16()
    BRA .skip_debug_brightness

warnpc $828ADD
org $828ADD       ; Resume original logic
    .skip_debug_brightness


org $CF8BBF       ; Set map scroll beep to high priority
    dw $2A97


; $80:8F24 9C F6 07    STZ $07F6  [$7E:07F6]  ;/
; $80:8F27 8D 40 21    STA $2140  [$7E:2140]  ; APU IO 0 = [music track]
org $808F24
    JSL hook_set_music_track
    NOP #2

; $80:8F65 8D F3 07    STA $07F3  [$7E:07F3]  ;} Music data = [music entry] & FFh
; $80:8F68 AA          TAX                    ; X = [music data]
org $808F65
    JML hook_set_music_data


; swap Enemy HP to MB HP when entering MB's room
;org $83AAD2 ; Where is MB's room? Probably not here
;    dw #MotherBrainHP


; Ceres Ridley modified state check to support presets
org $8FE0C0
    dw layout_asm_ceres_ridley_room_state_check

; Ceres Ridley room setup asm when timer is not running
org $8FE0DF
    dw layout_asm_ceres_ridley_room_no_timer


org $8FEA00 ; free space for door asm
print pc, " misc bank8F start"
;org $8FEA00 ; free space for door asm
;org $8FF9F9 ; This org is safe but all of this is commented out because I don't even know where MB's room is -IFB
MotherBrainHP:
{
;    LDA !sram_display_mode : BNE .done
;    LDA #!IH_MODE_ROOMSTRAT_INDEX : STA !sram_display_mode
;    LDA #!IH_STRAT_MBHP_INDEX : STA !sram_room_strat

  .done
;    RTS
}


layout_asm_ceres_ridley_room_state_check:
{
    LDA $0943 : BEQ .no_timer
    LDA $0001,X : TAX
    JMP $E5E6
  .no_timer
    STZ $093F
    INX : INX : INX
    RTS
}

layout_asm_ceres_ridley_room_no_timer:
{
    ; Same as original setup asm, except force blue background
    PHP
    SEP #$20
    LDA #$66 : STA $5D
    PLP
    JSL $88DDD0
    LDA #$0009 : STA $07EB
    RTS
}

print pc, " misc bank8F end"


org $87D000
print pc, " misc start"

hook_set_music_track:
{
    STZ $07F6
    PHA
    LDA !sram_music_toggle : CMP #$02 : BEQ .fast_no_music
    CMP #$01 : BNE .no_music
    LDA $07F3 : BEQ .no_music
    PLA : STA $2140
    RTL

  .fast_no_music
    STZ $07F5
  .no_music
    PLA
    RTL
}

hook_set_music_data:
{
    TAX
    LDA !sram_music_toggle : CMP #$0002 : BEQ .fast_no_music
    TXA : STA $07F3
    JML $808F69

  .fast_no_music
    JML $808F89
}

hook_unpause:
{
    ; RT room
    LDA !ram_realtime_room : CLC : ADC.w #41 : STA !ram_realtime_room

    ; RT seg
    LDA !ram_seg_rt_frames : CLC : ADC.w #41 : STA !ram_seg_rt_frames
    CMP.w #60 : BCC .done
    SEC : SBC.w #60 : STA !ram_seg_rt_frames

    LDA !ram_seg_rt_seconds : INC : STA !ram_seg_rt_seconds
    CMP.w #60 : BCC .done
    LDA #$0000 : STA !ram_seg_rt_seconds

    LDA !ram_seg_rt_minutes : INC : STA !ram_seg_rt_minutes

  .done
    ; Replace overwritten logic to enable NMI
    JSL $80834B
    RTL
}

gamemode_end:
{
   ; overwritten logic
    JSL $A09169

    ; If minimap is disabled or shown, we ignore artificial lag
    LDA $05F7 : BNE .endlag
    LDA !ram_minimap : BNE .endlag

    ; Ignore artifical lag if OOB viewer is active
    LDA !ram_sprite_features_active : BNE .endlag

    ; Artificial lag, multiplied by 16 to get loop count
    ; Each loop takes 5 clock cycles (assuming branch taken)
    ; For reference, 41 loops ~= 1 scanline
    LDA !sram_artificial_lag : BEQ .endlag

    ; To account for various changes, we may need to tack on more clock cycles
    ; These can be removed as code is added to maintain CPU parity during normal gameplay
    ASL
    ASL
    INC  ; Add 4 loops (22 clock cycles including the INC)
    ASL
    INC  ; Add 2 loops (12 clock cycles including the INC)
    ASL
    NOP  ; Add 2 more clock cycles
    TAX
  .lagloop
    DEX : BNE .lagloop
  .endlag
    RTL
}

stop_all_sounds:
{
    ; If $05F5 is non-zero, the game won't clear the sounds
    LDA $05F5 : PHA
    LDA #$0000 : STA $05F5
    JSL $82BE17
    PLA : STA $05F5

    ; Makes the game check Samus' health again, to see if we need annoying sound
    LDA #$0000 : STA $0A6A
    RTL
}


original_load_projectile_palette_long:
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
    RTL
}

spacetime_routine_long:
{
    ; The normal routine shouldn't come here, but sanity check just in case
    ; Also skips out if spacetime but Y value is positive
    INY : INY : CPY #$0000 : BPL .normal_load_palette

    ; Spacetime, sanity check that X is 0 (if not then do the original routine)
    CPX #$0000 : BNE .normal_load_palette

    ; Spacetime, check if Y will cause us to reach WRAM
    TYA : CLC : ADC #(!WRAM_START-$7EC1E2) : CMP #$0000 : BPL .normal_load_palette

    ; It will, so run our own loop
    INX : INX
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

  .normal_load_loop
    LDA [$00],Y
    STA $7EC1C0,X
    INY : INY
  .normal_load_palette
    INX : INX
    CPY #$0020 : BMI .normal_load_loop
    RTL
}
print pc, " misc start"


;org $90FF90
org $90F6C1
print pc, " misc bank90 start"
original_load_projectile_palette:
    JSL original_load_projectile_palette_long
    RTS

spacetime_routine:
    JSL spacetime_routine_long
    RTS

print pc, " misc bank90 end"


; -----------
; Axeil Hacks
; -----------

; Next 4 org's spread out the bomb graphics on the HUD
org $80E2C9
    STA $7EC6AE : STA $7EC6B4 : STA $7EC6BA

org $90F876
    BEQ .jump_AC1C

org $90F889
    LDX #$000C ; was 8

org $90F88F
-   DEY : BNE + : SBC #$03FF
+   STA $7EC6AE,X
    DEX #6 ; was 4
    BPL -
    PLX
    PLY
  .jump_AC1C
    JMP $AC1C
warnpc $90F8A7


; --------------
; Redesign Hacks
; --------------

if !FEATURE_REDESIGN
; Rewrite morph lock code
org $80D000
    LDA !ram_cm_menu_active : BEQ +
    LDA $4218
    RTS

+   LDA $4218 : STA $CB
    EOR $C7 : AND $CB : STA $CF

    ; check for morph lock flag
    LDA $09A1 : BMI .gameMode
    LDA $4218
    RTS

  .gameMode
    LDA $0998 : CMP #$0008 : BEQ .morphLock
    CMP #$000C : BEQ .morphLock
    CMP #$0012 : BEQ .morphLock
    CMP #$001A : BNE +
    LDA $09A1 : AND #$7FFF : STA $09A1
+   LDA $4218
    RTS 

  .morphLock
    LDA $09A2 : AND #$0100 : BNE +
    LDA #$FFFF : EOR $09B4 : AND $4218
    AND #$F3FF
    RTS

+   LDA $4218
    AND #$F3FF
    RTS
endif

