; Phantoon hijacks
{
if !NEW_PHANTOON_RNG
; new Phantoon RNG starts here
print "NEW_PHANTOON_RNG enabled!"
if !FEATURE_PAL
org $A7D5DA
else    ; 1st pattern
org $A7D5A6
endif
    JSL hook_phantoon_1st_rng
    REP $12 : NOP

if !FEATURE_PAL
org $A7D0B0
else    ; 2nd pattern
org $A7D07C
endif
    JSL hook_phantoon_2nd_rng
    REP $0B : NOP
; new Phantoon RNG ends here
else
; old Phantoon RNG starts here
if !FEATURE_PAL
org $A7D5E9
else    ; 1st direction
org $A7D5B5
endif
    ; $A7:D5B5 22 11 81 80 JSL $808111[$80:8111]
    JSL hook_phantoon_1st_dir_rng

if !FEATURE_PAL
org $A7D5DA
else    ; 1st pattern
org $A7D5A6
endif
    ; $A7:D5A6 AD B6 05    LDA $05B6  [$7E:05B6] ; Frame counter
    ; $A7:D5A9 4A          LSR A
    JSL hook_phantoon_1st_pat


if !FEATURE_PAL
org $A7D716
else    ; 2nd direction
org $A7D6E2
endif
    ; $A7:D6E2 22 11 81 80 JSL $808111[$80:8111]
    JSL hook_phantoon_2nd_dir_rng

if !FEATURE_PAL
org $A7D0BF
else    ; 2nd direction
org $A7D08B
endif
    ; $A7:D08B AD B6 05    LDA $05B6  [$7E:05B6] ; Frame counter
    ; $A7:D08E 89 01 00    BIT #$0001
    JSL hook_phantoon_2nd_dir_2
    NOP : NOP

if !FEATURE_PAL
org $A7D0B0
else    ; hijack, RNG call for second pattern
org $A7D07C
endif
    ; $A7:D07C 22 11 81 80 JSL $808111[$80:8111]
    JSL hook_phantoon_2nd_pat
; old Phantoon RNG ends here
endif


if !FEATURE_PAL
org $A7D098
else    ; Phantoon eye close timer
org $A7D064
endif
    JSL hook_phantoon_eyeclose

if !FEATURE_PAL
    org $A7D00A
else    ; Phantoon flame pattern
    org $A7CFD6
endif
    JSL hook_phantoon_flame_pattern
}


if !FEATURE_PAL
    org $A7D4DD
else    ; Intro
    org $A7D4A9
endif
    JSL hook_phantoon_init
    NOP : BNE $3D


; --------------
; Botwoon hijack
; --------------
{
if !FEATURE_PAL
org $B39953
else
org $B39943
endif
    ; $B3:9943 22 11 81 80 JSL $808111[$80:8111]
    JSL hook_botwoon_rng
}


; ---------------
; Draygon hijacks
; ---------------
{
if !FEATURE_PAL
org $A58AEC
else
org $A58ADC
endif
    JSR hook_draygon_rng_left

if !FEATURE_PAL
org $A589AD
else
org $A5899D
endif
    JSR hook_draygon_rng_right
}


; ----------------
; Crocomire hijack
; ----------------

if !FEATURE_PAL
org $A48763
else
org $A48753
endif
    JSR hook_crocomire_rng


; -------------
; Kraid hijacks
; -------------

if !FEATURE_PAL
org $A7BDF3
else    ; Kraid rng
org $A7BDBF
endif
    JSR hook_kraid_rng

if !FEATURE_PAL
org $A7AA7F
else    ; Kraid intro
org $A7AA69
endif
    JMP kraid_intro_skip : kraid_intro_skip_return:


; -----------------
; "Set rng" hijacks
; -----------------

    ; $A3:AB0C A9 25 00    LDA #$0025
    ; $A3:AB0F 8D E5 05    STA $05E5  [$7E:05E5]
    ; $A3:AB12 22 11 81 80 JSL $808111[$80:8111]
if !FEATURE_PAL
org $A3AB2E
else
org $A3AB12
endif
    JSL hook_hopper_set_rng

    ; $A2:B588 A9 11 00    LDA #$0011
    ; $A2:B58B 8D E5 05    STA $05E5  [$7E:05E5]
if !FEATURE_PAL
org $A2B5A0
else
org $A2B588
endif
    JSL hook_lavarocks_set_rng
    NOP #2

    ; $A8:B798 A9 17 00    LDA #$0017
    ; $A8:B79B 8D E5 05    STA $05E5  [$7E:05E5]
if !FEATURE_PAL
org $A8B7A8
else
org $A8B798
endif
    JSL hook_beetom_set_rng
    NOP #2


; -----
; Hooks
; -----

org $83B000
print pc, " rng start"

MenuRNG:
; Generates new random number
; 32-bit period (uses two 16-bit seeds)
; Make sure ram_seed_X and ram_seed_Y is initialized to something other than zero
{
    LDA !ram_seed_X : ASL #5
    EOR !ram_seed_X : STA $16

    LDA !ram_seed_Y : STA !ram_seed_X

    LDA $16 : LSR #3
    EOR $16 : STA $16

    LDA !ram_seed_Y : LSR
    EOR !ram_seed_Y : EOR $16
    STA !ram_seed_Y

    ; return y (in a)
    RTL	
}

MenuRNG2:
; 16-bit period xorshift (uses only ram_seed_X)
; Make sure ram_seed_X is not zero
{
    LDA !ram_seed_X
    STA $16
    ASL #2 : EOR $16 : STA $16
    LSR #5 : EOR $16 : STA $16
    ASL : EOR $16
    STA !ram_seed_X
    RTL
}


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

hook_phantoon_init:
; Patch to the following code (which waits a few frames
; before spawning flames in a circle)
; $A7:D4A9 DE B0 0F    DEC $0FB0,x[$7E:0FB0]    ; decrement timer
; $A7:D4AC F0 02       BEQ $02    [$D4B0]       ; if zero, proceed
; $A7:D4AE 10 3D       BPL $3D    [$D4ED]       ; else, return
{
    ; skip cutscene flag
    LDA !sram_phantoon_intro : BNE .skip_cutscene
    DEC $0FB0,X
    RTL

.skip_cutscene:
    ; get rid of the return address
    PLA ; pop 2 bytes
    PHP ; push 1
    PLA ; pop 2 (for a total of 3 bytes popped)

    ; start boss music & fade-in animation
if !FEATURE_PAL
    JML $A7D543
else
    JML $A7D50F
endif
}


if !NEW_PHANTOON_RNG
; new Phantoon RNG starts here

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
    ; If set to all-on or all-off, don't mess with RNG
    LDA !ram_phantoon_rng_1 : BEQ .no_manip
    CMP #$003F : BNE choose_phantoon_pattern

  .no_manip
    LDA $05B6 : LSR
    AND #$0003 : ASL : TAY
if !FEATURE_PAL
    LDA $CD87,Y
else
    LDA $CD53,Y
endif
    STA $0FE8
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
    ; If set to all-on or all-off, don't mess with RNG
    LDA !ram_phantoon_rng_2 : BEQ .no_manip
    CMP #$003F : BNE choose_phantoon_pattern

  .no_manip
    JSL $808111
    AND #$0007 : ASL : TAY
if !FEATURE_PAL
    LDA $CD87,Y
else
    LDA $CD53,Y
endif
    STA $0FE8
    LDA $05B6 : BIT #$0001
    RTL
}

choose_phantoon_pattern:
; Selects a Phantoon pattern from a bitmask (passed in A).
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
    LDA $01,S ; reload pattern mask
    LDY #$0006  ; number of patterns (decremented immediately to index of last pattern)

  .loop
    DEY
    LSR
    BCC .skip

    ; Pattern index Y is enabled
    DEX : BMI .done ; is this the last one?
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
    PLX ; pop enemy index

    ; Check if Phantoon is in the round 2 AI state
    LDY $0FB2
if !FEATURE_PAL
    CPY #$D716
else
    CPY #$D6E2
endif
    BEQ .round2

    ; If not, save the pattern timer and return the direction in the zero flag
    ; shift direction into carry
    LSR : STA $0FE8

    ; shift carry into A (and zero flag)
    LDA #$0000 : ROL
    RTL

  .round2
    ; Save the pattern timer, check the direction, and
    ; set Phantoon's starting point and pattern index.
    LSR : STA $0FE8 : BCS .left

    ; Right pattern
    LDA #$0088 : LDY #$00D0
    BRA .round2done

  .left
    LDA #$018F : LDY #$0030

  .round2done
    STA $0FA8  ; Index into figure-8 movement table
    STY $0F7A  ; X position
    LDA #$0060 : STA $0F7E  ; Y position
    RTL
}
; new Phantoon RNG ends here
else
; old Phantoon RNG starts here
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
; old Phantoon RNG ends here
endif


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


org $A4F700
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


org $A5FA00
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
if !FEATURE_PAL
org $A6A10C
else
org $A6A0FC
endif
    LSR : BCC $0F
    CPX #$0006 : BEQ $0A
    LDA $0F86

if !FEATURE_PAL
org $A6A302
else
org $A6A2F2
endif
    JMP ceres_ridley_draw_metroid

if !FEATURE_PAL
org $A6A371
else
org $A6A361
endif
    dw ridley_init_hook

; Fix ceres ridley door instruction list to keep door visible when skipping ridley fight
if !FEATURE_PAL
org $A6F533
    dw $F64F, ridley_ceres_door_original_instructions
else
org $A6F55C
    dw $F678, ridley_ceres_door_original_instructions
endif
    dw $80ED, ridley_ceres_door_escape_instructions

; Lock ceres ridley door if timer not started or if boss not dead
if !FEATURE_PAL
org $A6F641
else
org $A6F66A
endif
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
if !FEATURE_PAL
    LDA #$AB47
else
    LDA #$AB37
endif
    STA $0FA8
    JMP ($0FA8)

  .continue
if !FEATURE_PAL
    LDA #$A387
else
    LDA #$A377
endif
    STA $0FA8
    JMP ($0FA8)
}

ceres_ridley_draw_metroid:
{
    LDA $7ED82E : BIT #$0001 : BNE .end
    LDA $093F : BNE .end
if !FEATURE_PAL
    JSR $BF2A
else
    JSR $BF1A
endif

  .end
if !FEATURE_PAL
    JMP $A30A
else
    JMP $A2FA
endif
}

ridley_ceres_door_original_instructions:
if !FEATURE_PAL
    dw $F67D
    dw #$0002, $F9EA
    dw $F641, $F533
    dw $F687
    dw $80ED, $F56F
else
    dw $F6A6
    dw #$0002, $FA13
    dw $F66A, $F55C
    dw $F6B0
    dw $80ED, $F598
endif

ridley_ceres_door_escape_instructions:
if !FEATURE_PAL
    dw $F687
    dw #$0002, $F9EA
    dw $F641, $F533
    dw $80ED, $F56F
else
    dw $F6B0
    dw #$0002, $FA13
    dw $F66A, $F55C
    dw $80ED, $F598
endif

print pc, " ridley rng end"


org $A7FFB6
print pc, " kraid rng start"
hook_kraid_rng:
{
    LDA !ram_kraid_rng : BEQ .no_manip
    DEC #2 ; return -1 (laggy) or 0 (laggier)
    RTS

  .no_manip
    LDA $05E5 ; return with random number (overwritten code)
    RTS
}


kraid_intro_skip:
    LDA !sram_kraid_intro : BEQ .noSkip
    LDA #$0001
    JMP kraid_intro_skip_return

  .noSkip
if !FEATURE_PAL
    LDA #$00FA
else
    LDA #$012C
endif
    JMP kraid_intro_skip_return

print pc, " kraid rng end"

