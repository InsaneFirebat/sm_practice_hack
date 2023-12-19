
; Mother Brain right door asm pointer
org $83AAD2
hook_layout_asm_rinkashaft_door2:
    dw #layout_asm_mbhp

; Mother Brain left door
org $83AAEA
hook_layout_asm_tourianescape1_door0:
    dw #layout_asm_mbhp

; Magnet Stairs left door
org $83AB6E
hook_layout_asm_fallingtile_door1:
    dw #layout_asm_magnetstairs

; Magnet Stairs right door
org $83AB92
hook_layout_asm_deadscientist_door0:
    dw #layout_asm_magnetstairs

; Ceres Ridley modified state check to support presets
org $8FE0C0
hook_layout_asm_ceres_ridley_state_check:
    dw layout_asm_ceres_ridley_state_check

; Ceres Ridley setup asm when timer is not running
org $8FE0DF
hook_layout_asm_ceres_ridley_no_timer:
    dw layout_asm_ceres_ridley_no_timer


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

layout_asm_ceres_ridley_state_check:
{
    LDA $0943 : BEQ .noTimer
    LDA $0001,X : TAX
    JMP $E5E6
  .noTimer
    STZ $093F
    INX : INX : INX
    RTS
}

layout_asm_ceres_ridley_no_timer:
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


org !ORG_LAYOUT_BANKA1
print pc, " layout bankA1 start"

layout_asm_statues_oob_viewer_enemies:
    dw $D73F, #$0080, #$01B0, #$0000, #$2C00, #$0000, #$0000, #$0240
    db #$FF, #$FF, #$00

print pc, " layout bankA1 end"


org !ORG_LAYOUT_BANKB4
print pc, " layout bankB4 start"

layout_asm_statues_oob_viewer_enemy_set:
    db #$FF, #$FF, #$00

print pc, " layout bankB4 end"
