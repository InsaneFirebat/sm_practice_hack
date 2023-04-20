
if !FEATURE_REDESIGN

; Mother Brain right door asm pointer
org $83AAD2
    dw #layout_asm_mbhp

; Mother Brain left door asm pointer
org $83AAEA
    dw #layout_asm_mbhp

; Magnet Stairs left door asm pointer
org $83AB6E
    dw #layout_asm_magnetstairs

; Magnet Stairs right door asm pointer
org $83AB92
    dw #layout_asm_magnetstairs

endif

; Ceres Ridley modified state check to support presets
org $8FE0C0
    dw layout_asm_ceres_ridley_room_state_check

; Ceres Ridley room setup asm when timer is not running
org $8FE0DF
    dw layout_asm_ceres_ridley_room_no_timer


;org $8FEA00
org !ORG_LAYOUT
print pc, " layout start"

layout_asm_mbhp:
{
    LDA !sram_display_mode : BNE .done
    LDA !IH_MODE_ROOMSTRAT_INDEX : STA !sram_display_mode
    LDA !IH_STRAT_MBHP_INDEX : STA !sram_room_strat

  .done
    RTS
}

layout_asm_magnetstairs:
{
    PHP
    %a16()
    LDA !sram_room_layout : BIT !ROOM_LAYOUT_MAGNET_STAIRS : BEQ .done

    ; change tile type and BTS
    %a8()

    ; Convert solid tiles to slope tiles
    LDA #$10 : STA $7F01F9 : STA $7F02EB
    LDA #$53 : STA $7F64FD : STA $7F6576

  .done
    PLP
    RTS
}

if !FEATURE_REDESIGN
else
org $8FFB80 ; Axeil has very little freespace in $8F
endif
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
    %a8()
    LDA #$66 : STA $5D
    PLP
    JSL $88DDD0
    LDA #$0009 : STA $07EB
    RTS
}

if !FEATURE_REDESIGN
else
warnpc $8FFBA8 ; Axeil code
endif
