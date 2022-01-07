;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;;;;;;;; Custom Build Hijacks ;;;;;;;;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;


org $809606      ; inc lag counter
    STX $05BA : INC $05A0

org $A6A17C      ; Ridley AI init, reset !ram_countdamage
    JSR ResetCountDamageRid

org $A7CE64      ;Phantoon AI init
    JSR ResetCountDamagePhan

org $A0A54C
    JSR CountDamageShinespark

org $A0A862      ; hijack damage routine to count total damage dealt
    JSR CountDamage

if !FEATURE_EXTRAS
org $948F49        ; RTS this routine to enable walk through walls
    JSR NoClip
    RTS

org $A6F135
    JSR SteamCollision
endif


org $A6FFE0      ; free space
print pc, " misc bankA6 start"
ResetCountDamageRid:
{
    PHA
    LDA #$0000
    STA !ram_countdamage : STA !sram_countdamage
    PLA
    RTS
}

if !FEATURE_EXTRAS
SteamCollision:
{
    LDA !ram_steamcollision : BEQ .originalcode
    PLA : LDA $0F86,x : JMP $F13B
  .originalcode
    LDA $0F86,x : RTS
}
endif
print pc, " misc bankA6 end"

org $A7FFE0         ; free space
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

org $A0FFDC         ; count damage in free space at end of bank
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
endif
print pc, " EXTRAS=1 misc bank94 end"

