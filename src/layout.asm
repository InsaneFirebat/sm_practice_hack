
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

; Ceres Ridley modified state check to support presets
org $8FE0C0
    dw layout_asm_ceres_ridley_room_state_check

; Ceres Ridley room setup asm when timer is not running
org $8FE0DF
    dw layout_asm_ceres_ridley_room_no_timer

; Green Pirates Shaft bottom-right door asm pointer
org $838C5C
    dw #layout_asm_cutscene_g4skip


org $8FEA00
print pc, " layout start"

layout_asm_cutscene_g4skip:
{
    LDA !sram_cutscenes : BIT !CUTSCENE_SKIP_G4 : BEQ .done

    ; Verify all four G4 bosses killed
    LDA $7ED828 : BIT #$0100 : BEQ .done
    LDA $7ED82C : BIT #$0001 : BEQ .done
    LDA $7ED82A : AND #$0101 : CMP #$0101 : BNE .done

    ; Set Tourian open
    LDA $7ED820 : ORA #$0400 : STA $7ED820

  .done
    RTS
}

layout_asm_mbhp:
{
    LDA !sram_display_mode : BNE .done
    LDA !IH_MODE_ROOMSTRAT_INDEX : STA !sram_display_mode
    LDA !IH_STRAT_MBHP_INDEX : STA !sram_room_strat

  .done
    RTS
}

layout_asm_ceres_ridley_room_state_check:
{
    LDA !TIMER_STATUS : BEQ .no_timer
    LDA $0001,X : TAX
    JMP $E5E6

  .no_timer
    STZ !CERES_STATUS
    INX #3
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

layout_asm_magnetstairs:
{
    PHP
    %a16()
    LDA !sram_magnetstairs : BEQ .done

    ; change tile type and BTS
    %a8()

    ; Convert solid tiles to slope tiles
    LDA #$10 : STA $7F01F9 : STA $7F02EB
    LDA #$53 : STA $7F64FD : STA $7F6576

  .done
    PLP
    RTS
}

layout_asm_baby_rng:
; from rng.asm
{
    LDA #$0001 : STA !ram_room_has_set_rng
    RTS
}

print pc, " layout end"

