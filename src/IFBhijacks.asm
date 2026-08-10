
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;;;;;;;; Custom Build Hijacks ;;;;;;;;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;


if !FEATURE_PAL
org $A6A18C
else             ; Ridley AI init, reset !ram_countdamage
org $A6A17C
endif
    JSR ResetCountDamageRid

if !FEATURE_PAL
org $A7CEAB
else             ; Phantoon AI init
org $A7CE77
endif
    JSL ResetCountDamagePhan

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

if !FEATURE_PAL
org $A0A63B
else             ; power bomb damage hijack
org $A0A62B
endif
    JSR EnemyDamagePowerBomb

if !FEATURE_EXTRAS
org $948F49      ; RTS this routine to enable walk through walls
    JSR NoClip
    RTS

org $A6F135
    JSR SteamCollision
endif


%startfree(A6)
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
    PLA : LDA !ENEMY_PROPERTIES,X : JMP $F13B
  .originalcode
    LDA !ENEMY_PROPERTIES,X : RTS
}
endif


ResetCountDamagePhan:
{
    TAY ; overwritten code
    LDA #$0000 : STA !ram_countdamage : STA !sram_countdamage
if !FEATURE_PAL
    LDA $CEC2,Y
else ; overwritten code
    LDA $CE8E,Y
endif
    RTL
}
%endfree(A6)


%startfree(A0)
CountDamage:
{
    LDA !ram_pacifist : BNE .no_damage
    CLC : LDA !ram_countdamage : ADC $187A
    STA !sram_countdamage : STA !ram_countdamage
    LDA !ENEMY_HP,X ; original code
    RTS

  .no_damage
    ; pull return address and jump past saving enemy hp
    PLA
if !FEATURE_PAL
    JMP $A8CA
else
    JMP $A8BA
endif
}

CountDamageShinespark:
{
    LDA !ram_pacifist : BNE .no_damage
    LDA !ram_countdamage : CLC : ADC $12
    STA !sram_countdamage : STA !ram_countdamage
    LDA !ENEMY_HP,X ; original code
    RTS

  .no_damage
    ; pull return address and jump past saving enemy hp
    PLA
if !FEATURE_PAL
    JMP $A86A
else
    JMP $A55A
endif
}

EnemyDamagePowerBomb:
{
    LDA !ram_pacifist : BNE .no_damage
    LDA !ram_countdamage : CLC : ADC $12
    STA !sram_countdamage : STA !ram_countdamage
    LDA !ENEMY_HP,X ; original code
    RTS

  .no_damage
    PLA ; pull return address and jump past storing enemy hp
if !FEATURE_PAL
    JMP $A64C
else
    JMP $A63C
endif
%endfree(A0)


%startfree(94)
if !FEATURE_EXTRAS
NoClip:
{
    LDA !ram_noclip : BEQ .originalcode
    RTS
  .originalcode
    STZ $14 : LDA $20
    JMP $8F4D
}
endif
%endfree(94)

