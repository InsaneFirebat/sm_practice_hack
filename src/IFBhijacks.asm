;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;;;;;;;; Custom Build Hijacks ;;;;;;;;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;


org $809606      ; inc lag counter
    STX $05BA : INC $05A0

if !FEATURE_PAL
org $A6A18C
else             ; Ridley AI init, reset !ram_countdamage
org $A6A17C
endif
    JSR ResetCountDamageRid

if !FEATURE_PAL
org $A7CE98
else             ; Phantoon AI init
org $A7CE64
endif
    JSR ResetCountDamagePhan

if !FEATURE_PAL
org $A0A872
else             ; hijack damage routine to count total damage dealt
org $A0A862
endif
    JSR CountDamage

if !FEATURE_PAL
org $A0A55C
else             ; shinespark damage hijack
org $A0A54C
endif
    JSR CountDamageShinespark

if !FEATURE_EXTRAS
org $948F49      ; RTS this routine to enable walk through walls
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


org $A0FFC7         ; count damage in free space at end of bank
print pc, " misc bankA0 start"
CountDamage:
{
    LDA !ram_nodamage : BEQ .no_damage
    CLC : LDA !ram_countdamage : ADC $187A
    STA !sram_countdamage : STA !ram_countdamage
    LDA $0F8C,X ; original code
    RTS

  .no_damage
    ; pull return address and jump past saving enemy hp
    PLA
    JMP $A8BA
}

CountDamageShinespark:
{
    LDA !ram_nodamage : BEQ .no_damage
    LDA !ram_countdamage : CLC : ADC $12
    STA !sram_countdamage : STA !ram_countdamage
    LDA $0F8C,X ; original code
    RTS

  .no_damage
    ; pull return address and jump past saving enemy hp
    PLA
    JMP $A55A
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

