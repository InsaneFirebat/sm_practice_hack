; ----------------
; Phantoon hijacks
; ----------------
{
    ; Intro
org $A7D4A9
    JSL hook_phantoon_init
    NOP
    BNE $3D

    ; 1st pattern
org $A7D5A6
    JSL hook_phantoon_1st_rng
    BRA $10

    ; 2nd pattern
org $A7D07C
    JSL hook_phantoon_2nd_rng
    BRA $0F

    ; Phantoon eye close timer
org $A7D064
    JSL hook_phantoon_eyeclose

    ; Phantoon flame pattern
org $A7CFD6
    JSL hook_phantoon_flame_pattern

    ; Phantoon flame direction
org $8699EB
    JSL hook_phantoon_flame_direction
    BRA $05
}


; --------------
; Botwoon hijack
; --------------
{
org $B39943
    ; $B3:9943 22 11 81 80 JSL $808111[$80:8111]
    JSL hook_botwoon_move

org $B398C1
    JSL hook_botwoon_spit
}


; ---------------
; Draygon hijacks
; ---------------
{
org $A58ADC
    JSR hook_draygon_rng_left

org $A5899D
    JSR hook_draygon_rng_right
}


; ----------------
; Crocomire hijack
; ----------------
{
org $A48753
    JSR hook_crocomire_rng
}


; -------------
; Kraid hijacks
; -------------
{
org $A786A7
KraidWaitTable:
    ; Overwrite unused palette
    dw #$0080, #$0040, #$0080, #$00C0, #$0100, #$0140, #$0180, #$01C0

org $A7AA69
    JMP kraid_intro_skip
kraid_intro_skip_return:

org $A7AE0D
    LDA !ram_kraid_wait_rng : BNE kraid_wait_load_delay
    LDA !CACHED_RANDOM_NUMBER : AND #$0007
kraid_wait_load_delay:
    ASL : TAX : LDA.w KraidWaitTable,X
warnpc $A7AE1E

org $A7BDBF
    JSR hook_kraid_claw_rng
}


; -----------------
; "Set rng" hijacks
; -----------------
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
    NOP : NOP

    ; $A8:B798 A9 17 00    LDA #$0017
    ; $A8:B79B 8D E5 05    STA $05E5  [$7E:05E5]
org $A8B798
    JSL hook_beetom_set_rng
    NOP : NOP
}


; -----
; Hooks
; -----

org !ORG_RNG_BANK83
print pc, " rng start"

hook_hopper_set_rng:
{
    LDA #$0001 : STA !ram_room_has_set_rng
    JML $808111
}

hook_lavarocks_set_rng:
{
    LDA #$0001 : STA !ram_room_has_set_rng
    LDA #$0011 : STA !CACHED_RANDOM_NUMBER
    RTL
}

hook_beetom_set_rng:
{
    LDA #$0001 : STA !ram_room_has_set_rng
    LDA #$0017 : STA !CACHED_RANDOM_NUMBER
    RTL
}

; Patch to the following code (which waits a few frames
;  before spawning flames in a circle)
; $A7:D4A9 DE B0 0F    DEC $0FB0,x[$7E:0FB0]    ; decrement timer
; $A7:D4AC F0 02       BEQ $02    [$D4B0]       ; if zero, proceed
; $A7:D4AE 10 3D       BPL $3D    [$D4ED]       ; else, return
hook_phantoon_init:
{
    LDA !sram_cutscenes : AND !CUTSCENE_FAST_PHANTOON : BNE .skip_cutscene

    DEC $0FB0,X
    RTL

  .skip_cutscene
    ; get rid of the return address
    PLA     ; pop 2 bytes
    PHP     ; push 1
    PLA     ; pop 2 (for a total of 3 bytes popped)

    ; start boss music & fade-in animation
    JML $A7D50F
}

; Table of Phantoon pattern durations & directions
; bit 0 is direction, remaining bits are duration
; Note that later entries in the table will tend to occur slightly more often.
phan_pattern_table:
    dw $003C<<1|1 ; fast left
    dw $003C<<1|0 ; fast right
    dw $0168<<1|1 ;  mid left
    dw $0168<<1|0 ;  mid right
    dw $02D0<<1|1 ; slow left
    dw $02D0<<1|0 ; slow right


; Patch to the following code, to determine Phantoon's first-round direction and pattern
; $A7:D5A6 AD B6 05    LDA $05B6  [$7E:05B6]    ; Frame counter
; $A7:D5A9 4A          LSR A
; $A7:D5AA 29 03 00    AND #$0003
; $A7:D5AD 0A          ASL A
; $A7:D5AE A8          TAY
; $A7:D5AF B9 53 CD    LDA $CD53,y[$A7:CD59]    ; Number of frames to figure-8
; $A7:D5B2 8D E8 0F    STA $0FE8  [$7E:0FE8]
; $A7:D5B5 22 11 81 80 JSL $808111[$80:8111]    ; RNG
; $A7:D5B9 89 01 00    BIT #$0001               ; Sets Z for left pattern, !Z for right
hook_phantoon_1st_rng:
{
    ; If set to all-on or all-off, don't mess with RNG.
    LDA !ram_phantoon_rng_round_1 : BEQ .no_manip
    CMP #$003F : BNE choose_phantoon_pattern

  .no_manip
    LDA !FRAME_COUNTER
    LSR : AND #$0003 : ASL : TAY
    LDA $CD53,Y : STA $0FE8
    JSL $808111
    BIT #$0001
    RTL
}

; Patch to the following code, to determine Phantoon's second-round direction and pattern
; Also affects patterns during Phantoon's invisible phase
; $A7:D07C 22 11 81 80 JSL $808111[$80:8111]
; $A7:D080 29 07 00    AND #$0007
; $A7:D083 0A          ASL A
; $A7:D084 A8          TAY
; $A7:D085 B9 53 CD    LDA $CD53,y[$A7:CD5B]
; $A7:D088 8D E8 0F    STA $0FE8  [$7E:0FE8]
; $A7:D08B AD B6 05    LDA $05B6  [$7E:05B6]
; $A7:D08E 89 01 00    BIT #$0001
hook_phantoon_2nd_rng:
{
    ; If set to all-on or all-off, don't mess with RNG.
    LDA !ram_phantoon_rng_round_2 : BEQ .no_manip
    CMP #$003F : BNE choose_phantoon_pattern

  .no_manip
    JSL $808111
    AND #$0007 : ASL : TAY
    LDA $CD53,Y : STA $0FE8
    ; Intentional fallthrough to invert logic
}

hook_phantoon_invert:
{
    LDA !ram_phantoon_rng_inverted : BEQ .vanilla_inverted
    CMP #$0001 : BEQ .inverted
    CMP #$0002 : BEQ .not_inverted

    ; Random
    LDA !CACHED_RANDOM_NUMBER : BIT #$0080
    RTL

  .inverted
    LDA #$0000 : BIT #$0001
    RTL

  .not_inverted
    LDA #$0001 : BIT #$0001
    RTL

  .vanilla_inverted
    LDA !FRAME_COUNTER : BIT #$0001
    RTL
}

; Selects a Phantoon pattern from a bitmask (passed in A).
choose_phantoon_pattern:
{
    PHX     ; push enemy index
    PHA     ; push pattern mask

    ; get random number in range 0-7
    JSL $808111
    AND #$0007 : TAX

    ; play a game of eeny-meeny-miny-moe with the enabled patterns
    ; X = number of enabled patterns to find before stopping
    ; Y = index in phan_pattern_table of pattern currently being checked
    ; A = bitmask of enabled patterns
  .reload
    LDA $01,S   ; reload pattern mask
    LDY #$0006  ; number of patterns (decremented immediately to index of last pattern)
  .loop
    DEY
    LSR
    BCC .skip

    ; Pattern index Y is enabled
    DEX         ; is this the last one?
    BMI .done
    BRA .loop   ; no, keep looping

  .skip
    ; Pattern Y is not enabled, try the next pattern
    BEQ .reload ; if we've tried all the patterns, start over
    BRA .loop

  .done
    ; We've found the pattern to use.
    PLA ; we don't need the pattern mask anymore
    TYA : ASL : TAX
    LDA.l phan_pattern_table,X
    PLX         ; pop enemy index

    ; Check if Phantoon is in the round 2 AI state
    LDY $0FB2
    CPY #$D6E2
    BNE .round1

    ; Save the pattern timer, check the direction,
    ; and set Phantoon's starting point and pattern index.
    LSR
    STA $0FE8
    BCS .round2left

    ; Right pattern
    LDA #$0088
    LDY #$00D0
    BRA .round2done

  .round2left
    LDA #$018F
    LDY #$0030

  .round2done
    STA $0FA8  ; Index into figure-8 movement table
    STY $0F7A  ; X position
    LDA #$0060
    STA $0F7E  ; Y position
    BRA hook_phantoon_invert

  .round1
    ; Save the pattern timer and check the direction
    LSR
    STA $0FE8
    BCS .round1left

    ; Round 1 right pattern
    SEP #$02
    RTL

  .round1left:
    REP #$02
    RTL
}

hook_phantoon_eyeclose:
{
    LDA !ram_phantoon_rng_eyeclose : BEQ .no_manip
    DEC : ASL ; return with 0-slow, 2-mid, 4-fast
    RTL

  .no_manip
    LDA !CACHED_RANDOM_NUMBER
    AND #$0007 : ASL   ; overwritten code
    RTL
}

hook_phantoon_flame_pattern:
{
    JSL $808111 ; Trying to preserve the number of RNG calls being done in the frame

    LDA !ram_phantoon_rng_flames : TAY
    LDA !ram_phantoon_rng_next_flames : STA !ram_phantoon_rng_flames
    TYA : STA !ram_phantoon_rng_next_flames : BEQ .no_manip
    DEC
    RTL

  .no_manip
    LDA !CACHED_RANDOM_NUMBER
    RTL
}

hook_phantoon_flame_direction:
{
    LDA !ram_phantoon_flame_direction : BEQ .no_manip
    DEC : BEQ .left

  .right
    LDA #$0080
    RTL

  .no_manip
    LDA $05B6 : BIT #$0001 : BEQ .right

  .left
    LDA #$FF80
    RTL
}

hook_botwoon_move:
{
    LDA !ram_botwoon_rng : BEQ .no_manip
    ; 0 = head visible, 1 = behind wall
    LDA $7E8026 : BNE .hidden
    ; check if first round, $7E8022 unused by Botwoon
    LDA $7E8022 : BEQ .first_round

    ; preserve number of RNG calls in the frame
    JSL $808111
    ; return chosen pattern
    LDA !ram_botwoon_second
    RTL

  .first_round
    ; preserve number of RNG calls in the frame
    JSL $808111
    ; mark first round complete
    LDA #$0001 : STA $7E8022
    ; return chosen pattern
    LDA !ram_botwoon_first
    RTL

  .hidden
    LDA !ram_botwoon_hidden : BEQ .no_manip
    ; preserve number of RNG calls in the frame
    JSL $808111
    ; return chosen pattern
    LDA !ram_botwoon_hidden
    RTL

  .no_manip
    ; return random pattern
    JML $808111
}

hook_botwoon_spit:
{
    LDA !ram_botwoon_spit : BEQ .no_manip
    ; preserve number of RNG calls in the frame
    JSL $808111
    ; return chosen pattern
    LDA !ram_botwoon_spit
    RTL

  .no_manip
    ; return random pattern
    JML $808111
}

ridley_init_freespace:
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
    JML ridley_init_hook_return

  .continue
    LDA #$A377
    JML ridley_init_hook_return
}

print pc, " rng end"
;warnpc $83B400 ; custompresets.asm


;org $A4F700
org !ORG_RNG_BANKA4
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
    LDA !CACHED_RANDOM_NUMBER
    RTS
}
print pc, " crocomire rng end"


;org $A5FA00
org !ORG_RNG_BANKA5
print pc, " draygon rng start"

hook_draygon_rng_left:
{
    LDA !ram_draygon_rng_left : BEQ .no_manip
    DEC    ; return with 1-swoop or 0-goop
    RTS

  .no_manip
    LDA !CACHED_RANDOM_NUMBER
    RTS
}

hook_draygon_rng_right:
{
    LDA !ram_draygon_rng_right : BEQ .no_manip
    DEC    ; return with 1-swoop or 0-goop
    RTS

  .no_manip
    LDA !CACHED_RANDOM_NUMBER
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

org $A6A360
    LDA  ridley_init_hook

; Fix ceres ridley door instruction list to keep door visible when skipping ridley fight
org $A6F55C
hook_ceres_ridley_door_instructions:
    dw $F678, ridley_ceres_door_original_instructions
    dw $80ED, ridley_ceres_door_escape_instructions

; Lock ceres ridley door if timer not started or if boss not dead
org $A6F66A
    LDA $0943 : BEQ $F6
    LDA $7ED82E


org !ORG_RNG_BANKA6
print pc, " ridley rng start"

;ridley_init_hook:
;{
;    LDA $079B : CMP #$E0B5 : BNE .continue
;    LDA $7ED82E : BIT #$0001 : BEQ .continue
;
;    ; Ceres Ridley is already dead, so skip to the escape
;    ; We do need to mark Ceres Ridley alive
;    ; to keep the door locked until the timer starts
;    AND #$FFFE : STA $7ED82E
;
;    ; Clear out the room main asm so it doesn't also trigger the escape
;    STZ $07DF
;
;    ; Set up the escape timer routine
;    LDA #$0001 : STA $093F
;    LDA #$E0E6 : STA $0A5A
;
;    ; Jump to the escape
;    LDA #$AB37
;    STA $0FA8
;    JMP ($0FA8)
;
;  .continue
;    LDA #$A377
;    STA $0FA8
;    JMP ($0FA8)
;}

ridley_init_hook:
{
    JML ridley_init_freespace

  .return
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


org !ORG_RNG_BANKA7
print pc, " kraid rng start"

hook_kraid_claw_rng:
{
    LDA !ram_kraid_claw_rng : BEQ .no_manip
    DEC : DEC     ; return -1 (laggy) or 0 (laggier)
    RTS

  .no_manip
    LDA !CACHED_RANDOM_NUMBER
    RTS
}

kraid_intro_skip:
    LDA !sram_cutscenes : AND !CUTSCENE_FAST_KRAID : BEQ .noSkip
    LDA #$0001
    JMP kraid_intro_skip_return

  .noSkip
    LDA #$012C
    JMP kraid_intro_skip_return

print pc, " kraid rng end"

