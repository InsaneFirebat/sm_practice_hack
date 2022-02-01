; Phantoon hijacks
{
    ; 1st pattern
    org $A7D5B5
        ; $A7:D5B5 22 11 81 80 JSL $808111[$80:8111]
        JSL hook_phantoon_1st_dir_rng

    org $A7D5A6
        ; $A7:D5A6 AD B6 05    LDA $05B6  [$7E:05B6] ; Frame counter
        ; $A7:D5A9 4A          LSR A
        JSL hook_phantoon_1st_pat

    ; 2nd pattern
    org $A7D6E2
        ; $A7:D6E2 22 11 81 80 JSL $808111[$80:8111]
        JSL hook_phantoon_2nd_dir_rng

    org $A7D08B
        ; $A7:D08B AD B6 05    LDA $05B6  [$7E:05B6] ; Frame counter
        ; $A7:D08E 89 01 00    BIT #$0001
        JSL hook_phantoon_2nd_dir_2
        NOP : NOP

    org $A7D07C ; hijack, RNG call for second pattern
        ; $A7:D07C 22 11 81 80 JSL $808111[$80:8111]
        JSL hook_phantoon_2nd_pat

    org $A7D064 ; Phantoon eye close timer
        JSL hook_phantoon_eyeclose

    org $A7CFD6 ; Phantoon flame pattern
        JSL hook_phantoon_flame_pattern
}


; Botwoon hijacks
{
    org $B39943
        ; $B3:9943 22 11 81 80 JSL $808111[$80:8111]
        JSL hook_botwoon_rng
}


; Draygon hijacks
{
    org $A58ADC
        JSR hook_draygon_rng_left

    org $A5899D
        JSR hook_draygon_rng_right
}


; Crocomire hijack
{
    org $A48753
        JSR hook_crocomire_rng
}


; Kraid hijack
{
    org $A7BDBF
        JSR hook_kraid_rng
}


; "Set rng" hijacks
{
    ; $A3:AB0C A9 25 00    LDA #$0025
    ; $A3:AB0F 8D E5 05    STA $05E5  [$7E:05E5]
    ; $A3:AB12 22 11 81 80 JSL $808111[$80:8111]
    org $A3AB12
        JSL hook_hopper_set_rng

    ; $A2:B588 A9 11 00    LDA #$0011
    ; $A2:B58B 8D E5 05    STA $05E5  [$7E:05E5]
    org $A2B588
        JSL hook_lavarocks_set_rng
        NOP #2

    ; $A8:B798 A9 17 00    LDA #$0017
    ; $A8:B79B 8D E5 05    STA $05E5  [$7E:05E5]
    org $A8B798
        JSL hook_beetom_set_rng
        NOP #2
}


; Hooks

org $83B000
print pc, " rng start"

hook_hopper_set_rng:
{
    LDA #$0001 : STA !ram_room_has_set_rng
    JML $808111
}

hook_lavarocks_set_rng:
{
    LDA #$0001 : STA !ram_room_has_set_rng
    LDA #$0011
    STA $05E5
    RTL
}

hook_beetom_set_rng:
{
    LDA #$0001 : STA !ram_room_has_set_rng
    LDA #$0017
    STA $05E5
    RTL
}

hook_phantoon_1st_dir_rng:
{
    JSL $808111 ; Trying to preserve the number of RNG calls being done in the frame

    LDA !ram_phantoon_rng_1 : BEQ .no_manip
    PHX : TAX : LDA.l phantoon_dirs,X : PLX : AND #$00FF
    RTL

  .no_manip
    LDA $05E5
    RTL
}

hook_phantoon_1st_pat:
{
    LDA !ram_phantoon_rng_1 : BEQ .no_manip
    PHX : TAX : LDA.l phantoon_pats,X : PLX : AND #$00FF
    RTL

  .no_manip
    LDA $05B6 : LSR A
    RTL
}

hook_phantoon_2nd_dir_rng:
{
    JSL $808111 ; Trying to preserve the number of RNG calls being done in the frame

    LDA !ram_phantoon_rng_2 : BEQ .no_manip

    PHX : TAX : LDA.l phantoon_dirs,X : PLX : AND #$00FF
    EOR #$0001
    RTL

  .no_manip
    LDA $05E5
    RTL
}

hook_phantoon_2nd_dir_2:
{
    LDA !ram_phantoon_rng_2 : BEQ .no_manip

    ; I don't quite understand this part, but it works ¯\_(ツ)_/¯
    LDA #$0001
    BIT #$0001
    RTL

  .no_manip
    LDA $05B6 : BIT #$0001
    RTL
}

hook_phantoon_2nd_pat:
{
    JSL $808111 ; Trying to preserve the number of RNG calls being done in the frame

    LDA !ram_phantoon_rng_2 : BEQ .no_manip

    PHX : TAX : LDA.l phantoon_pats,X : PLX : AND #$00FF
    RTL

  .no_manip
    LDA $05E5
    RTL
}

hook_phantoon_eyeclose:
{
    LDA !ram_phantoon_rng_3 : BEQ .no_manip
    DEC : ASL ; return with 0-slow, 2-mid, 4-fast
    RTL

  .no_manip
    LDA $05E5 ; return with random number
    AND #$0007 : ASL   ; overwritten code
    RTL
}

hook_phantoon_flame_pattern:
{
    JSL $808111 ; Trying to preserve the number of RNG calls being done in the frame

    LDA !ram_phantoon_rng_4 : TAY
    LDA !ram_phantoon_rng_5 : STA !ram_phantoon_rng_4
    TYA : STA !ram_phantoon_rng_5 : BEQ .no_manip
    DEC
    RTL

  .no_manip
    LDA $05E5 ; return with random number
    RTL
}

phantoon_dirs:
    db #$FF
    db #$01, #$01, #$01
    db #$00, #$00, #$00

phantoon_pats:
    db #$FF
    db #$01, #$02, #$03
    db #$01, #$02, #$03


hook_botwoon_rng:
{
    JSL $808111 ; Trying to preserve the number of RNG calls being done in the frame

    LDA !ram_botwoon_rng : BEQ .no_manip
    RTL

  .no_manip
    LDA $05E5
    RTL
}

print pc, " rng end"


;org $A4F700
org $A4FFA0
print pc, " crocomire rng start"

hook_crocomire_rng:
{
    LDA !ram_crocomire_rng : BEQ .no_manip
    DEC : BEQ .step
    LDA #$0000    ; return with <400 for swipe
    RTS

  .step
    LDA #$0400    ; return with 400+ for step
    RTS

  .no_manip
    LDA $05E5     ; return with random number (overwritten code)
    RTS
}
print pc, " crocomire rng end"


;org $A5FA00
org $A5FD50
print pc, " draygon rng start"

hook_draygon_rng_left:
{
    LDA !ram_draygon_rng_left : BEQ .no_manip
    DEC    ; return with 1-swoop or 0-goop
    RTS

  .no_manip
    LDA $05E5   ; return with random number (overwritten code)
    RTS
}

hook_draygon_rng_right:
{
    LDA !ram_draygon_rng_right : BEQ .no_manip
    DEC    ; return with 1-swoop or 0-goop
    RTS

  .no_manip
    LDA $05E5   ; return with random number (overwritten code)
    RTS
}
print pc, " draygon rng end"


; This is actually for preset support instead of RNG
; Keep Ceres Ridley enemy alive even if the main boss flag is set
org $A6A0FC
    LSR : BCC $0F
    CPX #$0006 : BEQ $0A
    LDA $0F86

org $A6A2F2
    JMP ceres_ridley_draw_metroid

org $A6A361
    dw ridley_init_hook

; Fix ceres ridley door instruction list to keep door visible when skipping ridley fight
org $A6F55C
    dw $F678, ridley_ceres_door_original_instructions
    dw $80ED, ridley_ceres_door_escape_instructions

; Lock ceres ridley door if timer not started or if boss not dead
org $A6F66A
    LDA $0943 : BEQ $F6
    LDA $7ED82E


org $A6FEC0
print pc, " ridley rng start"

ridley_init_hook:
{
    LDA $079B : CMP #$E0B5 : BNE .continue
    LDA $7ED82E : BIT #$0001 : BEQ .continue

    ; Ceres Ridley is already dead, so skip to the escape
    ; We do need to mark Ceres Ridley alive
    ; to keep the door locked until the timer starts
    AND #$FFFE : STA $7ED82E

    ; Clear out the room main asm so it doesn't also trigger the escape
    STZ $07DF

    ; Set up the escape timer routine
    LDA #$0001 : STA $093F
    LDA #$E0E6 : STA $0A5A

    ; Jump to the escape
    LDA #$AB37
    STA $0FA8
    JMP ($0FA8)

  .continue
    LDA #$A377
    STA $0FA8
    JMP ($0FA8)
}

ceres_ridley_draw_metroid:
{
    LDA $7ED82E : BIT #$0001 : BNE .end
    LDA $093F : BNE .end
    JSR $BF1A

  .end
    JMP $A2FA
}

ridley_ceres_door_original_instructions:
    dw $F6A6
    dw #$0002, $FA13
    dw $F66A, $F55C
    dw $F6B0
    dw $80ED, $F598

ridley_ceres_door_escape_instructions:
    dw $F6B0
    dw #$0002, $FA13
    dw $F66A, $F55C
    dw $80ED, $F598

print pc, " ridley rng end"


org $A7FFB6
print pc, " kraid rng start"
hook_kraid_rng:
{
    LDA !ram_kraid_rng : BEQ .no_manip
    DEC : DEC     ; return -1 (laggy) or 0 (laggier)
    RTS

  .no_manip
    LDA $05E5     ; return with random number (overwritten code)
    RTS
}
print pc, " kraid rng end"

