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


; Skip intro
; $82:EEDF A9 95 A3    LDA #$A395
org $82EEDF
if !FEATURE_PAL
    LDA #$C065
else
    LDA #$C100
endif


; Fix Zebes planet tiling error
org $8C9607
    dw #$0E2F


; Suit periodic damage
org $8DE37C
    ; Replaced the check and also take one additional byte
    ; Thus the following logic is the same but shifted down
    AND !ram_suits_periodic_damage_check : BNE $29
    LDA $0A4E : CLC : ADC #$4000 : STA $0A4E
    ; We don't have enough space to add the carry bit inline,
    ; so we need to jump to freespace, but only do that if the carry bit is set
    BCC $06
    JMP increment_periodic_damage


org $8DFFF1
print pc, " misc bank8D start"

increment_periodic_damage:
{
    LDA $0A50 : INC : STA $0A50
    JMP $E394
}

print pc, " misc bank8D end"


; We now have three separate periodic damage routines,
; so we need to load an index to jump to the correct routine
org $90E72B
    LDA !sram_suit_properties : ASL : PHA
    JSR misc_overwritten_movement_routine

; Handle periodic damage based on suit properties
; Overwritten logic will be transferred
org $90E74D
    PLA : PHX : TAX
    JSR (periodic_damage_table,X)
    PLX : NOP : NOP

; Transfer logic here by overwriting redundant end of periodic damage
; Also repoint jump and branch to avoid the redundant section
if !FEATURE_PAL
org $90E9D3
    JMP $EA32
else
org $90E9D6
    JMP $EA35
endif

if !FEATURE_PAL
org $90EA2A
else
org $90EA2D
endif
    BPL $06

; Optimize CPU by overwriting our PLP/RTS
; and skipping over the PHP/REP #$30 in the pause check routine
if !FEATURE_PAL
org $90EA38
else
org $90EA3B
    ; The optimizations were too good,
    ; now need to waste 6 cycles to balance CPU
    NOP : NOP : NOP
    BRA $08
endif

; Optimize CPU by removing RTS so we go straight to the low health check
if !FEATURE_PAL
org $90EA7B
else
org $90EA7E
endif
    NOP


; Suit enemy damage
if !FEATURE_PAL
org $A0A473
else
org $A0A463
endif
    BIT #$0020 : BEQ .checksuit
    LSR $12
  .checksuit
    AND !ram_suits_enemy_damage_check : BEQ .return
    LSR $12
  .return
    LDA $12
    RTL


; Suit metroid damage
if !FEATURE_PAL
org $A3EEF4
else
org $A3EED8
endif
    LDA #$C000 : STA $12
    LDA $09A2 : AND !ram_suits_enemy_damage_check : BEQ .metroidcheckgravity
    LSR $12
  .metroidcheckgravity
    LDA $09A2 : BIT #$0020 : BEQ .metroidnogravity
    LSR $12
  .metroidnogravity
    ; Continue vanilla routine


if !PRESERVE_WRAM_DURING_SPACETIME
org $90ACF6
    JSR original_load_projectile_palette

org $90AD18
    JMP spacetime_routine
endif


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

org $87D000
print pc, " misc start"
hook_set_music_track:
{
    STZ $07F6

    PHA
    LDA !sram_music_toggle : BEQ .noMusic
    PLA : STA $2140
    RTL

  .noMusic
    PLA
    RTL
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
if !FEATURE_PAL
    JSL $A09179
else
    JSL $A09169
endif

    ; If minimap is disabled or shown, we ignore artificial lag
    LDA $05F7 : BNE .endlag
    LDA !ram_minimap : BNE .endlag

    ; Ignore artifical lag if OOB viewer is active
    LDA !ram_oob_watch_active : BNE .endlag

    ; Artificial lag, multiplied by 16 to get loop count
    ; Each loop takes 5 clock cycles (assuming branch taken)
    ; For reference, 41 loops ~= 1 scanline
    LDA !sram_artificial_lag : BEQ .endlag
    ASL #4 : TAX
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

    LDA !sram_healthalarm : BEQ .RTL
    ; Makes the game check Samus' health again, to see if we need annoying sound
    LDA #$0000 : STA $0A6A

  .RTL
    RTL
}
print pc, " misc end"


org $90F800
print pc, " misc bank90 start"
misc_overwritten_movement_routine:
    ; We overwrote an unnecessary JSR, a STZ command, and a jump to the movement routine
    STZ $0A6E
    JMP ($0A58)

periodic_damage_table:
if !FEATURE_PAL
    dw $E9CB   ; vanilla routine
else
    dw $E9CE   ; vanilla routine
endif
    dw periodic_damage_balanced
    dw periodic_damage_progressive

; Make our minor adjustments and jump back to the vanilla routine
periodic_damage_balanced:
{
    PHP : REP #$30
    LDA $0A78 : BEQ $03
if !FEATURE_PAL
    JMP $EA32
else
    JMP $EA35
endif
    LDA $09A2 : BIT #$0001 : BNE $03
if !FEATURE_PAL
    JMP $EA0E   ; Varia not equipped
    JMP $E9F9   ; Varia equipped
else
    JMP $EA11   ; Varia not equipped
    JMP $E9FC   ; Varia equipped
endif
}

periodic_damage_progressive:
{
    PHP : REP #$30
    LDA $0A78 : BEQ $03
    ; Nothing to do, jump back to vanilla routine
if !FEATURE_PAL
    JMP $EA32
else
    JMP $EA35
endif

    LDA $09A2 : BIT #$0020 : BEQ .nogravity
    ; Gravity equipped, so halve damage
    LDA $0A4F : LSR
    PHA : XBA : AND #$FF00 : STA $0A4E
    PLA : XBA : AND #$00FF : STA $0A50

  .nogravity
    LDA $09A2 : BIT #$0001 : BEQ .novaria
    ; Varia equipped, so halve damage
    LDA $0A4F : LSR
    PHA : XBA : AND #$FF00 : STA $0A4E
    PLA : XBA : AND #$00FF : STA $0A50

  .novaria
    ; Jump back into the vanilla routine
if !FEATURE_PAL
    JMP $EA0E
else
    JMP $EA11
endif
}


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
    RTS
}
endif
print pc, " misc bank90 end"


;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;;;;;;;; Custom Build Hijacks ;;;;;;;;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

org $90FA00 ; careful of minimap.asm using freespace above
print pc, " misc bank90 start"
HealthAlarm:
{
    LDA !sram_healthalarm : BEQ .disabled
    LDX $0A6A : BNE .return
    LDA #$0002 : JSL $80914D
    LDA #$0001 : STA $0A6A
    RTS
    
  .disabled
    LDA $0A6A : BEQ .return
    STZ $0A6A
    LDA #$0001 : JSL $80914D
    
  .return
    RTS
}

HealthAlarm2:
{
    LDA !sram_healthalarm : BEQ .skip
    LDA #$0002 ; overwritten code
    JMP $F33C

  .skip
    JMP $F340
}
warnpc $90FFFF
print pc, " misc bank90 end"


org $91FFF0
print pc, " misc bank91 start"
HealthAlarm3:
{
    LDA !sram_healthalarm : BEQ .skip
    LDA #$0002 ; overwritten code
    JMP $E6DA

  .skip
    JMP $E6DE
}
warnpc $91FFFF
print pc, " misc bank91 end"


org $83AB92 ; Magnet Stairs (bottom) door asm pointer
    dw #MagnetStairFix

org $83AB6E ; Magnet Stairs (top) door asm pointer
    dw #MagnetStairFix

org $83AAD2
    dw #MotherBrainHP

org $8FEA00 ; free space for door asm
print pc, " misc door asm start"
MagnetStairFix:
{
    LDA !ram_magnetstairs : BEQ .done

    ; change tile type and BTS
    PHP : %a8()
    LDA #$10 : STA $7F01F9 : STA $7F02EB
    LDA #$53 : STA $7F64FD : STA $7F6576
    PLP

  .done
    RTS
}

MotherBrainHP:
{
    LDA !sram_display_mode : BNE .done
    LDA #!IH_MODE_ROOMSTRAT_INDEX : STA !sram_display_mode
    LDA #!IH_STRAT_MBHP_INDEX : STA !sram_room_strat

  .done
    RTS
}

warnpc $8FFFFF
print pc, " misc door asm end"


org $A6FEBC      ; free space
print pc, " misc bankA6 start"
ResetCountDamageRid:
{
    PHA
    LDA #$0000
    STA !ram_countdamage : STA !sram_countdamage
    PLA
    RTS
}
warnpc $A6FFE0
print pc, " misc bankA6 end"


org $A7FF90         ; free space
print pc, " misc bankA7 start"
ResetCountDamagePhan:
{
    PHA
    LDA #$0000
    STA $0F90,X     ;we overwrote this instruction to get here
    STA !ram_countdamage : STA !sram_countdamage
    PLA
    RTS
}

print pc, " misc bankA7 end"


org $A0F9DC         ; count damage in free space at end of bank
print pc, " misc bankA0 start"
CountDamage:
{
    CLC : LDA !ram_countdamage : ADC $187A
    STA !sram_countdamage : STA !ram_countdamage
    LDA $0F8C,X ; original code
    RTS
}

CountDamageShinespark:
{
    LDA !ram_countdamage : CLC : ADC $12
    STA !sram_countdamage : STA !ram_countdamage
    LDA $0F8C,X ; original code
    RTS
}

print pc, " misc bankA0 end"


;;;;;;;;; Custom Build Hijacks ;;;;;;;;;

if !FEATURE_EXTRAS

org $94DC00
print pc, " EXTRAS=1 misc bank94 start"
NoClip:
{
    LDA !ram_noclip : BEQ .originalcode
    RTS
  .originalcode
    STZ $14 : LDA $20
    JMP $8F4D
}

print pc, " EXTRAS=1 misc bank94 end"


org $A6FFE0
print pc, " EXTRAS=1 misc bankA6 end"
SteamCollision:
{
    LDA !ram_steamcollision : BEQ .originalcode
    PLA : LDA $0F86,x : JMP $F13B
  .originalcode
    LDA $0F86,x : RTS
}
print pc, " EXTRAS=1 misc bankA6 end"
endif
