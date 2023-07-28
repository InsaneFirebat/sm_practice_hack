; ====================================
; Custom InfoHUD modes and room strats
; ====================================

; When adding or removing infohud modes,
; also update infohud.asm: inc_statusdisplay and dec_statusdisplay
; lookup tables must also be updated in infohudmodes.asm

status_countdamage:
{
    LDA !ram_countdamage : CMP !ram_HUD_bottom : BEQ .done : STA !ram_HUD_bottom
    LDX #$0088 : JSR Draw4

  .done
    RTS
}

status_dboost:
{
; http://patrickjohnston.org/bank/91#fEDB0 comments explain knockback direction
;    $0A52: Knockback direction
;        1: Up left
;        2: Up right
;        4: Down left
;        5: Down right
;    $0A54: Knockback X direction. 0 = left, 1 = right
;    $18AA: Knockback timer

    LDA !SAMUS_MOVEMENT_TYPE : AND #$00FF
    CMP #$000A : BEQ .knockback
;    CMP #$0019 : BEQ .dboost
    LDA !ram_dboost_state : BEQ .done
    DEC : BEQ .reset     ; 1 = needs reset
    DEC : BEQ .kbExpired ; 2 = knockback expired
  ;.damaged              ; 3 = damage detected
    LDA !SAMUS_KNOCKBACK_TIMER : BEQ .kbExpired : BRA .knockback
    
  .kbExpired
    LDA #$0002 : STA !ram_dboost_state
    LDA !ram_dboost_counter : CMP #$0014 : BPL .giveUp ; give up 20 frames after kb expires
    INC : STA !ram_dboost_counter
    LDA !IH_CONTROLLER_PRI : AND #$0300
    CMP #$0200 : BEQ .failedHoldingLeft
    CMP #$0100 : BEQ .failedHoldingRight
  .done
    RTS

  .failedHoldingLeft
    LDA #$0000 : CMP $0A54 : BEQ .failedCheckJumpInput
    RTS

  .failedHoldingRight
    LDA #$0001 : CMP $0A54 : BEQ .failedCheckJumpInput
    RTS

  .failedCheckJumpInput
    LDA !IH_CONTROLLER_PRI : AND !IH_INPUT_JUMP : BEQ .printfailed
    RTS

  .printfailed
    LDX #$008C : LDA !ram_dboost_counter : JSR Draw2
    LDA !IH_LETTER_L : STA !HUD_TILEMAP+$8A

  .giveUp
    LDA #$0001 : STA !ram_dboost_state
    RTS

  .reset
    LDA #$0000
    STA !ram_dboost_state
    STA !ram_dboost_kbmax
    STA !ram_dboost_kb
    STA !ram_dboost_counter
    
  .knockback
    LDA !SAMUS_KNOCKBACK_TIMER : CMP !ram_dboost_kbmax : BMI .knockbackContinues
    STA !ram_dboost_kbmax
    
  .knockbackContinues
    LDA #$0003 : STA !ram_dboost_state : BRA .direction
    
  .direction
    LDA !IH_CONTROLLER_PRI : AND #$0300
    CMP #$0200 : BEQ .holdingLeft
    CMP #$0100 : BEQ .holdingRight
    ; no directional input code here
    
  .holdingLeft
    LDA #$0000 : CMP $0A54 : BEQ .checkJumpInput
    ; directional input does not match knockback direction
    
  .holdingRight
    LDA #$0001 : CMP $0A54 : BEQ .checkJumpInput
    ; directional input does not match knockback direction
    
  .checkJumpInput
    LDA !IH_CONTROLLER_PRI : AND !IH_INPUT_JUMP : BEQ .dboostInitiated
    ; not holding jump
    
  .dboostInitiated
    LDA #$0001 : STA !ram_dboost_state
    LDA !SAMUS_KNOCKBACK_TIMER : STA !ram_dboost_kb
    SEC : LDA !ram_dboost_kbmax : SBC !ram_dboost_kb
    LDX #$008C : JSR Draw2 : LDA !IH_LETTER_Y : STA !HUD_TILEMAP+$8A

    RTS
}

status_door_hspeed:
{

    ; subspeed + submomentum into low byte of Hspeed
    LDA !SAMUS_X_SUBRUNSPEED : CLC : ADC !SAMUS_X_SUBMOMENTUM
    AND #$FF00 : XBA : STA !ram_horizontal_speed

    ; speed + momentum + carry into high byte of Hspeed
    LDA !SAMUS_X_RUNSPEED : ADC !SAMUS_X_MOMENTUM
    AND #$00FF : XBA : ORA !ram_horizontal_speed

    ; draw whole number in decimal
    AND #$FF00 : XBA

    ; convert to decimal form
    STA $4204
    %a8()
    ; divide by 10
    LDA #$0A : STA $4206
    %a16()
    PEA $0000 : PLA ; wait for CPU math

    ; draw integer speed value
    LDA $4214 : BEQ .blanktens
    ; tens digit
    ASL : TAX
    LDA.l NumberGFXTable,X : STA !HUD_TILEMAP+$88
    ; ones digit
    LDA $4216 : ASL : TAX
    LDA.l NumberGFXTable,X : STA !HUD_TILEMAP+$8A
    BRA .subspeed

  .blanktens
    ; ones digit
    LDA $4216 : ASL : TAX
    LDA.l NumberGFXTable,X : STA !HUD_TILEMAP+$8A
    ; tens digit
    LDA !IH_BLANK : STA !HUD_TILEMAP+$88

  .subspeed
    LDA !IH_DECIMAL : STA !HUD_TILEMAP+$8C

    ; draw fraction in hex
    LDA !ram_horizontal_speed : AND #$00F0 : LSR #3 : TAX
    LDA.l HexGFXTable,X : STA !HUD_TILEMAP+$8E

  .done
    RTS
}

status_door_vspeed:
{
    ; draw two digits of speed in decimal form
    LDA !SAMUS_Y_SPEED : STA $4204
    %a8()
    ; divide by 10
    LDA #$0A : STA $4206
    %a16()
    PEA $0000 : PLA ; wait for CPU math
    LDA $4214 : BEQ .blanktens
    ASL : TAX
    LDA.l NumberGFXTable,X : STA !HUD_TILEMAP+$88

    ; Ones digit
    LDA $4216 : ASL : TAY
    LDA.l NumberGFXTable,X : STA !HUD_TILEMAP+$8A
    BRA .subspeed

  .blanktens
    LDA $4216 : ASL : TAX
    LDA.l NumberGFXTable,X : STA !HUD_TILEMAP+$88
    LDA !IH_BLANK : STA !HUD_TILEMAP+$8A

  .subspeed
    LDA !IH_DECIMAL : STA !HUD_TILEMAP+$8A

    LDA !SAMUS_Y_SUBSPEED : XBA : AND #$00F0 : LSR #3 : TAY
    LDA.l HexGFXTable,X : STA !HUD_TILEMAP+$8C

    RTS
}

status_door_xpos:
{
    LDA !SAMUS_X : LDX #$0088 : JMP Draw4
}

status_door_ypos:
{
    LDA !SAMUS_Y : LDX #$0088 : JMP Draw4
}


; ===========
; ROOM STRATS
; ===========

status_superhud:
{
  .HUD
    LDA !sram_superhud_top : BEQ +
    ASL : TAX
    JSR (superhud_top_table,X)

+   LDA !sram_superhud_middle : BEQ +
    ASL : TAX
    JSR (superhud_middle_table,X)

+   LDA !sram_superhud_bottom : ASL : TAX
    JMP (superhud_bottom_table,X)

superhud_bottom_table:
    dw status_enemyhp
    dw status_chargetimer
    dw status_xfactor
    dw status_cooldowncounter
    dw status_shinetimer
    dw status_iframecounter
    dw status_spikesuit
    dw status_xpos
    dw status_ypos
    dw status_hspeed
    dw status_quickdrop
    dw status_walljump
    dw status_shottimer
    dw status_countdamage
    dw status_ramwatch
    dw status_moatcwj
    dw status_gateglitch
    dw status_tacotank
    dw status_robotflush
    dw status_elevatorcf
    dw status_botwooncf
    dw status_doorskip

superhud_top_table:
    dw topHUD_off
    dw topHUD_xfactor
    dw topHUD_shinetimer
    dw topHUD_iframecounter
    dw status_lagcounter
    dw topHUD_cpuusage
    dw topHUD_shottimer
    dw topHUD_chargetimer
    dw topHUD_dashcounter
    dw topHUD_cooldowncounter

superhud_middle_table:
    dw middleHUD_off
    dw middleHUD_xfactor
    dw middleHUD_shinetimer
    dw middleHUD_iframecounter
    dw status_lagcounter
    dw middleHUD_cpuusage
    dw middleHUD_shottimer
    dw middleHUD_chargetimer
    dw middleHUD_dashcounter
    dw middleHUD_cooldowncounter

topHUD_off:
middleHUD_off:
{
    ; we shouldn't be here, but just in case...
    RTS
}

topHUD_chargetimer:
{
    LDA !IH_CONTROLLER_PRI_NEW : AND !IH_INPUT_SHOT : BNE .pressedShot
    LDA !IH_CONTROLLER_PRI : AND !IH_INPUT_SHOT : BNE .charging

    ; count up to 36 frames of shot released
    LDA !ram_HUD_top_counter : CMP #$0024 : BPL .reset
    INC : STA !ram_HUD_top_counter
    ASL : TAX
    LDA NumberGFXTable,X : STA !HUD_TILEMAP+$14
    RTS

  .reset
    LDA !IH_BLANK : STA !HUD_TILEMAP+$14 : STA !HUD_TILEMAP+$16
    LDA NumberGFXTable+122 : STA !HUD_TILEMAP+$18
    RTS

  .pressedShot
    LDA #$0000 : STA !ram_HUD_top_counter

  .charging
    LDA #$003D : SEC : SBC !SAMUS_CHARGE_TIMER : CMP !ram_HUD_top : BEQ .done : STA !ram_HUD_top
    CMP #$0000 : BPL .drawCharge
    LDA #$0000

  .drawCharge
    ASL : TAX
    LDA NumberGFXTable,X : STA !HUD_TILEMAP+$18
    LDA !IH_BLANK : STA !HUD_TILEMAP+$16

  .done
    RTS
}

middleHUD_chargetimer:
{
    LDA !IH_CONTROLLER_PRI_NEW : AND !IH_INPUT_SHOT : BNE .pressedShot
    LDA !IH_CONTROLLER_PRI : AND !IH_INPUT_SHOT : BNE .charging

    ; count up to 36 frames of shot released
    LDA !ram_HUD_middle_counter : CMP #$0024 : BPL .reset
    INC : STA !ram_HUD_middle_counter
    ASL : TAX
    LDA NumberGFXTable,X : STA !HUD_TILEMAP+$54
    RTS

  .reset
    LDA !IH_BLANK : STA !HUD_TILEMAP+$54 : STA !HUD_TILEMAP+$56
    LDA NumberGFXTable+122 : STA !HUD_TILEMAP+$58
    RTS

  .pressedShot
    LDA #$0000 : STA !ram_HUD_middle_counter

  .charging
    LDA #$003D : SEC : SBC !SAMUS_CHARGE_TIMER : CMP !ram_HUD_middle : BEQ .done : STA !ram_HUD_middle
    CMP #$0000 : BPL .drawCharge
    LDA #$0000

  .drawCharge
    ASL : TAX
    LDA NumberGFXTable,X : STA !HUD_TILEMAP+$58
    LDA !IH_BLANK : STA !HUD_TILEMAP+$56

  .done
    RTS
}

topHUD_xfactor:
{
    LDA #$0079 : SEC : SBC !SAMUS_CHARGE_TIMER : CMP !ram_HUD_top : BEQ .done : STA !ram_HUD_top
    LDX #$0014 : JSR Draw3

  .done
    RTS
}

middleHUD_xfactor:
{
    LDA #$0079 : SEC : SBC !SAMUS_CHARGE_TIMER : CMP !ram_HUD_middle : BEQ .done : STA !ram_HUD_middle
    LDX #$0054 : JSR Draw3

  .done
    RTS
}

topHUD_cooldowncounter:
{
    LDA !SAMUS_COOLDOWN : CMP !ram_HUD_top : BEQ .done : STA !ram_HUD_top
    LDX #$0014 : JSR Draw3

  .done
    RTS
}

middleHUD_cooldowncounter:
{
    LDA !SAMUS_COOLDOWN : CMP !ram_HUD_middle : BEQ .done : STA !ram_HUD_middle
    LDX #$0054 : JSR Draw3

  .done
    RTS
}

topHUD_shinetimer:
{
    LDA !ram_armed_shine_duration : CMP !ram_HUD_top : BEQ .done
    STA !ram_HUD_top : BNE .charge : LDA #$00B4

  .charge
    LDX #$0014 : JSR Draw3

  .done
    RTS
}

middleHUD_shinetimer:
{
    LDA !ram_armed_shine_duration : CMP !ram_HUD_middle : BEQ .done
    STA !ram_HUD_middle : BNE .charge : LDA #$00B4

  .charge
    LDX #$0054 : JSR Draw3

  .done
    RTS
}

topHUD_dashcounter:
{
    LDA !SAMUS_DASH_COUNTER : AND #$00FF : CMP !ram_dash_counter : BEQ .done
    STA !ram_dash_counter : ASL : TAX
    LDA HexGFXTable,X : STA !HUD_TILEMAP+$18

  .done
    RTS
}

middleHUD_dashcounter:
{
    LDA !SAMUS_DASH_COUNTER : AND #$00FF : CMP !ram_dash_counter : BEQ .done
    STA !ram_dash_counter : ASL : TAX
    LDA HexGFXTable,X : STA !HUD_TILEMAP+$58

  .done
    RTS
}

topHUD_iframecounter:
{
    LDA !SAMUS_IFRAME_TIMER : CMP !ram_HUD_top : BEQ .done : STA !ram_HUD_top
    LDX #$0014 : JSR Draw3

  .done
    RTS
}

middleHUD_iframecounter:
{
    LDA !SAMUS_IFRAME_TIMER : CMP !ram_HUD_middle : BEQ .done : STA !ram_HUD_middle
    LDX #$0054 : JSR Draw3

  .done
    RTS
}

topHUD_cpuusage:
{
    LDA !ram_vcounter_data : AND #$00FF
    %a8() : STA $211B : XBA : STA $211B : LDA #$64 : STA $211C : %a16()
    LDA $2134 : STA $4204
    %a8() : LDA #$E1 : STA $4206 : %a16()
    PHA : PLA : PHA : PLA : LDA $4214
    LDX #$0014 : JSR Draw2
    LDA !IH_PERCENT : STA !HUD_TILEMAP+$18

    RTS
}

middleHUD_cpuusage:
{
    LDA !ram_vcounter_data : AND #$00FF
    %a8() : STA $211B : XBA : STA $211B : LDA #$64 : STA $211C : %a16()
    LDA $2134 : STA $4204
    %a8() : LDA #$E1 : STA $4206 : %a16()
    PHA : PLA : PHA : PLA : LDA $4214
    LDX #$0054 : JSR Draw2
    LDA !IH_PERCENT : STA !HUD_TILEMAP+$58

    RTS
}

topHUD_shottimer:
{
    LDA !IH_CONTROLLER_PRI_NEW : AND !IH_INPUT_SHOT : BEQ .inc
    LDA !ram_shot_timer : LDX #$0014 : JSR Draw3
    LDA #$0000 : STA !ram_shot_timer

  .inc
    LDA !ram_shot_timer : INC : STA !ram_shot_timer
    RTS
}

middleHUD_shottimer:
{
    LDA !IH_CONTROLLER_PRI_NEW : AND !IH_INPUT_SHOT : BEQ .inc
    LDA !ram_shot_timer : LDX #$0054 : JSR Draw3
    LDA #$0000 : STA !ram_shot_timer

  .inc
    LDA !ram_shot_timer : INC : STA !ram_shot_timer
    RTS
}

}

status_kihuntermanip:
{
    LDA !ROOM_ID : CMP #$B585 : BEQ .roomStairs
    LDA !ROOM_ID : CMP #$B656 : BEQ .jumpMusketeers
    JMP .done
  .jumpMusketeers
    JMP .roomMusketeers
; Kihunter Stairs
  .roomStairs
    LDA !IH_BLANK : STA !HUD_TILEMAP+$8C : STA !HUD_TILEMAP+$8E       ; draw blank spaces
    STA !HUD_TILEMAP+$90 : STA !HUD_TILEMAP+$92 : STA !HUD_TILEMAP+$94
    STA !HUD_TILEMAP+$96 : STA !HUD_TILEMAP+$98 : STA !HUD_TILEMAP+$14
; top kihunter
    LDX #$0000                                      ; start with top kihunter, enemy0
    
    ; Y position
    LDA !ENEMY_Y,X : CMP #$01F4 : BPL .topYSuccess     ; check if below (greater than) Y = 500d
    LDA !IH_LETTER_N : STA !HUD_TILEMAP+$88 : STA !HUD_TILEMAP+$8A    ; draw N's and return
    STA !HUD_TILEMAP+$8E : BRA .movementEnemy0
  .topYSuccess
    LDA !IH_LETTER_Y : STA !HUD_TILEMAP+$88                  ; draw Y
    LDA !IH_LETTER_N : STA !HUD_TILEMAP+$8A                  ; draw N and continue to Xpos
    
    ; X position
    LDA !ENEMY_X,X : CMP #$00A8 : BMI .topXSuccess     ; check if left of (less than) X = 168d
    LDA !IH_LETTER_N : STA !HUD_TILEMAP+$8A : BRA .movementEnemy0  ; draw N and return
    
  .topXSuccess
    LDA !IH_LETTER_Y : STA !HUD_TILEMAP+$8A                  ; draw Y
    ; movement arrows
  .movementEnemy0
    ; X position
    LDA !ENEMY_X,X : CMP !ram_enemy0_last_xpos         ; check enemy xpos
    BEQ .FinishX0 : BMI .LeftX0                     ; next enemy if no change, left if xpos decreased
    LDA #$0C62 : STA !HUD_TILEMAP+$16                        ; draw right arrow
    BRA .FinishX0

  .LeftX0
    LDA #$0C60 : STA !HUD_TILEMAP+$16                        ; draw left arrow
  .FinishX0
    LDA !ENEMY_X,X : STA !ram_enemy0_last_xpos         ; store last_xpos for next frame
    
    ; Y position
    LDA !ENEMY_Y,X : CMP !ram_enemy0_last_ypos         ; check enemy ypos
    BEQ .FinishY0 : BMI .UpY0                       ; next enemy if no change, left if ypos decreased
    LDA #$0C63 : STA !HUD_TILEMAP+$18                        ; draw down arrow
    BRA .FinishY0

  .UpY0
    LDA !IH_ARROW_UP : STA !HUD_TILEMAP+$18                  ; draw up arrow

  .FinishY0
    LDA !ENEMY_Y,X : STA !ram_enemy0_last_ypos         ; store last_ypos for next frame
    
; bottom kihunter
    LDX #$0100                                      ; change to bottom kihunter, enemy4
    
    ; Y position
    LDA !ENEMY_Y,X : CMP #$0316 : BPL .botYSuccess     ; check if below (greater than) Y = 790d
    LDA !IH_LETTER_N : STA !HUD_TILEMAP+$8E : BRA .movementEnemy4  ; draw N and return
    
  .botYSuccess
    LDA !IH_LETTER_Y : STA !HUD_TILEMAP+$8E                  ; draw Y
    ; movement arrows

  .movementEnemy4
    ; X position
    LDA !ENEMY_X,X : CMP !ram_enemy4_last_xpos         ; check enemy xpos
    BEQ .FinishX4 : BMI .LeftX4                     ; next enemy if no change, left if xpos decreased
    LDA #$0C62 : STA !HUD_TILEMAP+$56                        ; draw right arrow
    BRA .FinishX4

  .LeftX4
    LDA #$0C60 : STA !HUD_TILEMAP+$56                        ; draw left arrow

  .FinishX4
    LDA !ENEMY_X,X : STA !ram_enemy4_last_xpos         ; store last_xpos for next frame

    ; Y position
    LDA !ENEMY_Y,X : CMP !ram_enemy4_last_ypos         ; check enemy xpos
    BEQ .FinishY4 : BMI .UpY4                       ; next enemy if no change, left if xpos decreased
    LDA #$0C63 : STA !HUD_TILEMAP+$58                        ; draw down arrow
    BRA .FinishY4

  .UpY4
    LDA !IH_ARROW_UP : STA !HUD_TILEMAP+$58                  ; draw up arrow

  .FinishY4
    LDA !ENEMY_Y,X : STA !ram_enemy4_last_ypos         ; store last_ypos for next frame
    JMP .done

; Three Musketeers
  .roomMusketeers
    LDA !SAMUS_HP : STA !ram_last_hp                    ; prevent SamusHP from overwriting our work later
    LDA !IH_BLANK : STA !HUD_TILEMAP+$8C : STA !HUD_TILEMAP+$8E       ; draw blank spaces
    STA !HUD_TILEMAP+$90 : STA !HUD_TILEMAP+$92 : STA !HUD_TILEMAP+$94
    STA !HUD_TILEMAP+$96 : STA !HUD_TILEMAP+$98 : STA !HUD_TILEMAP+$14

; top kihunter
    LDX #$0200                                      ; start with top kihunter (enemy8)
    LDA !ENEMY_X,X : CMP #$018C : BPL .success2Top     ; branch if right of (greater than) X = 396d
    CMP #$0157 : BPL .successTop                    ; branch if right of (greater than) X = 343d
    LDA !IH_LETTER_N : STA !HUD_TILEMAP+$16 : STA !HUD_TILEMAP+$18    ; draw N in both slots
    BRA .movementTop

  .success2Top
    LDA !IH_LETTER_Y : STA !HUD_TILEMAP+$16 : STA !HUD_TILEMAP+$18    ; draw Y in both slots
    BRA .movementTop
    
  .successTop
    LDA !IH_LETTER_Y : STA !HUD_TILEMAP+$16                  ; draw Y in first slot
    LDA !IH_LETTER_N : STA !HUD_TILEMAP+$18                  ; draw N in second slot

  .movementTop
    LDA !ENEMY_X,X : CMP !ram_enemy8_last_xpos         ; check xpos again
    BMI .X8Left                                     ; next enemy if no change, left if xpos decreased
    LDA #$0C62 : STA !HUD_TILEMAP+$56                        ; draw right arrow
    BRA .X8Finish

  .X8Left
    LDA #$0C60 : STA !HUD_TILEMAP+$56                        ; draw left arrow

  .X8Finish
    LDA !ENEMY_X,X : STA !ram_enemy8_last_xpos         ; store last_xpos for next frame
    ; Y position
    LDA !ENEMY_Y,X : CMP !ram_enemy8_last_ypos         ; check enemy xpos
    BEQ .Y8Finish : BMI .Y8Up                       ; next enemy if no change, left if xpos decreased
    LDA #$0C63 : STA !HUD_TILEMAP+$58                        ; draw down arrow
    BRA .Y8Finish

  .Y8Up
    LDA !IH_ARROW_UP : STA !HUD_TILEMAP+$58                  ; draw up arrow

  .Y8Finish
    LDA !ENEMY_Y,X : STA !ram_enemy8_last_ypos         ; store last_ypos for next frame

; middle kihunter
    LDX #$0180                                      ; change to middle kihunter (enemy6)
    LDA !ENEMY_X,X : CMP #$0157 : BMI .successMiddle   ; check if left of (less than) X = 343d
    LDA !IH_LETTER_N : STA !HUD_TILEMAP+$88 : BRA .movementMiddle  ; draw N and return
    
  .successMiddle
    LDA !IH_LETTER_Y : STA !HUD_TILEMAP+$88                  ; draw Y
    
  .movementMiddle
    LDA !ENEMY_X,X : CMP !ram_enemy6_last_xpos         ; check xpos again
    BMI .X6Left                                     ; next enemy if no change, left if xpos decreased
    LDA #$0C62 : STA !HUD_TILEMAP+$8C                        ; draw right arrow
    BRA .X6Finish

  .X6Left
    LDA #$0C60 : STA !HUD_TILEMAP+$8C                        ; draw left arrow

  .X6Finish
    LDA !ENEMY_X,X : STA !ram_enemy6_last_xpos         ; store last_xpos for next frame

    ; Y position
    LDA !ENEMY_Y,X : CMP !ram_enemy6_last_ypos         ; check enemy xpos
    BEQ .Y6Finish : BMI .Y6Up                       ; next enemy if no change, left if xpos decreased
    LDA #$0C63 : STA !HUD_TILEMAP+$8E                        ; draw down arrow
    BRA .Y6Finish

  .Y6Up
    LDA #$0C61 : STA !HUD_TILEMAP+$8E                        ; draw up arrow

  .Y6Finish
    LDA !ENEMY_Y,X : STA !ram_enemy6_last_ypos         ; store last_ypos for next frame

; bottom kihunter
    LDX #$0100                                      ; change to bottom kihunter (enemy4)
    LDA !ENEMY_X,X : CMP #$0157 : BPL .successBottom   ; check if right of (greater than) X = 343d
    LDA !IH_LETTER_N : STA !HUD_TILEMAP+$92 : BRA .movementBottom  ; draw N and return
    
  .successBottom
    LDA !IH_LETTER_Y : STA !HUD_TILEMAP+$92                  ; draw Y
    
  .movementBottom
    LDA !ENEMY_X,X : CMP !ram_enemy4_last_xpos         ; check xpos again
    BMI .X4Left                                     ; next enemy if no change, left if xpos decreased
    LDA #$0C62 : STA !HUD_TILEMAP+$96                        ; draw right arrow
    BRA .X4Finish

  .X4Left
    LDA #$0C60 : STA !HUD_TILEMAP+$96                        ; draw left arrow

  .X4Finish
    LDA !ENEMY_X,X : STA !ram_enemy4_last_xpos         ; store last_xpos for next frame

    ; Y position
    LDA !ENEMY_Y,X : CMP !ram_enemy4_last_ypos         ; check enemy xpos
    BEQ .Y4Finish : BMI .Y4Up                       ; next enemy if no change, left if xpos decreased
    LDA #$0C63 : STA !HUD_TILEMAP+$98                        ; draw down arrow
    BRA .Y4Finish

  .Y4Up
    LDA #$0C61 : STA !HUD_TILEMAP+$98                        ; draw up arrow

  .Y4Finish
    LDA !ENEMY_Y,X : STA !ram_enemy4_last_ypos         ; store last_ypos for next frame

  .done
    RTS
}

status_kraidradar:
{
    LDA !ROOM_ID : CMP #$A59F : BNE .skip              ; check for Kraid's room
    LDA !ENEMY_HP : CMP #$03E8 : BEQ .setup             ; stop tracking when Kraid takes damage

  .skip
    RTS

  .setup
    LDA !SAMUS_HP : STA !ram_last_hp                    ; suppress Samus HP
    LDA !IH_BLANK : STA !HUD_TILEMAP+$88 : STA !HUD_TILEMAP+$8A       ; clear space on HUD
    STA !HUD_TILEMAP+$8C : STA !HUD_TILEMAP+$8E : STA !HUD_TILEMAP+$90
    STA !HUD_TILEMAP+$92 : STA !HUD_TILEMAP+$94 : STA !HUD_TILEMAP+$96
    STA !HUD_TILEMAP+$98

; Detect and draw Samus first

    ; check if sweet spot (2 missile KQK)
    LDY $0AF6 : CPY #$004B : BEQ .greenSamus ; just the popular bomb setup atm
    LDA #$00C9 : BRA .checkSamusX

  .greenSamus
    LDA #$10C9

  .checkSamusX
    CPY #$0030 : BPL + : STA !HUD_TILEMAP+$8C : BRA .checkEnemies
+   CPY #$0040 : BPL + : STA !HUD_TILEMAP+$8E : BRA .checkEnemies
+   CPY #$0050 : BPL + : STA !HUD_TILEMAP+$90 : BRA .checkEnemies
+   CPY #$0060 : BPL + : STA !HUD_TILEMAP+$92 : BRA .checkEnemies
+   CPY #$0070 : BPL + : STA !HUD_TILEMAP+$94 : BRA .checkEnemies
+   CPY #$0080 : BPL + : STA !HUD_TILEMAP+$96 : BRA .checkEnemies
+   STA !HUD_TILEMAP+$98

; Detect stuff

    ; Enemy 6
  .checkEnemies
    LDX #$0180
    LDA !ENEMY_Y,X : CMP #$0270 : BCC .Enemy6X        ; check if Y <270h
    LDA #$F000 : STA !ram_radar1 : BRL .skipEnemy6    ; set skip flag

    ; X Position
  .Enemy6X
    ; check X position, set position bit on radar
    LDA !ENEMY_X,X
    CMP #$0020 : BPL + : LDA #$0080 : STA !ram_radar1 : BRA .Enemy6Y
+   CMP #$0030 : BPL + : LDA #$0040 : STA !ram_radar1 : BRA .Enemy6Y
+   CMP #$0040 : BPL + : LDA #$0020 : STA !ram_radar1 : BRA .Enemy6Y
+   CMP #$0050 : BPL + : LDA #$0010 : STA !ram_radar1 : BRA .Enemy6Y
+   CMP #$0060 : BPL + : LDA #$0008 : STA !ram_radar1 : BRA .Enemy6Y
+   CMP #$0070 : BPL + : LDA #$0004 : STA !ram_radar1 : BRA .Enemy6Y
+   CMP #$0080 : BPL + : LDA #$0002 : STA !ram_radar1 : BRA .Enemy6Y
+   LDA #$0001 : STA !ram_radar1

  .Enemy6Y
    ; Y Position
    LDA !ENEMY_Y,X : CMP !ram_enemy6_last_ypos : BCC .upEnemy6
    STA !ram_enemy6_last_ypos
    CMP #$0252 : BCC +
    LDA !ram_radar1 : AND #$00FF : ORA #$0800 : BRA .Enemy6Y_store
+   LDA !ram_radar1 : AND #$00FF : ORA #$0400
  .Enemy6Y_store
    STA !ram_radar1 : BRA .checkEnemy7

  .upEnemy6
    STA !ram_enemy6_last_ypos
    CMP #$0252 : BCC +
    LDA !ram_radar1 : AND #$00FF : ORA #$0200 : BRA .upEnemy6_store
+   LDA !ram_radar1 : AND #$00FF : ORA #$0100
  .upEnemy6_store
    STA !ram_radar1 : BRA .checkEnemy7

  .skipEnemy6
    LDA #$FFFF : STA !ram_radar1

  .checkEnemy7
    LDX #$01C0
    LDA !ENEMY_Y,X : CMP #$0270 : BCC .Enemy7X      ; check if Y <270h
    LDA #$FFFF : STA !ram_radar2 : BRL .drawEnemy6

    ; X Position
  .Enemy7X
    LDA !ENEMY_X,X
+   CMP #$0020 : BPL + : LDA #$0080 : STA !ram_radar2 : BRA .Enemy7Y
+   CMP #$0030 : BPL + : LDA #$0040 : STA !ram_radar2 : BRA .Enemy7Y
+   CMP #$0040 : BPL + : LDA #$0020 : STA !ram_radar2 : BRA .Enemy7Y
+   CMP #$0050 : BPL + : LDA #$0010 : STA !ram_radar2 : BRA .Enemy7Y
+   CMP #$0060 : BPL + : LDA #$0008 : STA !ram_radar2 : BRA .Enemy7Y
+   CMP #$0070 : BPL + : LDA #$0004 : STA !ram_radar2 : BRA .Enemy7Y
+   CMP #$0080 : BPL + : LDA #$0002 : STA !ram_radar2 : BRA .Enemy7Y
+   LDA #$0001 : STA !ram_radar2

  .Enemy7Y
    ; Y Position
    LDA !ENEMY_Y,X : CMP !ram_enemy7_last_ypos : BCC .upEnemy7
    STA !ram_enemy7_last_ypos
    CMP #$0252 : BCC +
    LDA !ram_radar2 : AND #$00FF : ORA #$0800 : BRA .Enemy7Y_store
+   LDA !ram_radar2 : AND #$00FF : ORA #$0400
  .Enemy7Y_store
    STA !ram_radar2 : BRA .drawEnemy6

  .upEnemy7
    STA !ram_enemy7_last_ypos
    CMP #$0252 : BCC +
    LDA !ram_radar2 : AND #$00FF : ORA #$0200 : BRA .upEnemy7_store
+   LDA !ram_radar2 : AND #$00FF : ORA #$0100
  .upEnemy7_store
    STA !ram_radar2


; Draw stuff
; Don't draw the enemy if first nibble is non-zero
; Second bit determines arrow direction and color:
; 8 = far away moving down, 4 = close moving down
; 2 = far away moving up, 1 = close moving up
; Low byte contains one non-zero bit to mark its position
; The bottom-left tile of the HUD is unused
  .drawEnemy6
    ; Enemy 6
    LDA !ram_radar1 : AND #$F000 : BNE .drawEnemy7
    LDA !ram_radar1 : AND #$00FF
    LSR : BEQ .R1P8
    LSR : BEQ .R1P7
    LSR : BEQ .R1P6
    LSR : BEQ .R1P5
    LSR : BEQ .R1P4
    LSR : BEQ .R1P3
    LSR : BEQ .R1P2
    LSR : BEQ .R1P1
    
  .R1P8
    LDX #$000E : BRA +
  .R1P7
    LDX #$000C : BRA +
  .R1P6
    LDX #$000A : BRA +
  .R1P5
    LDX #$0008 : BRA +
  .R1P4
    LDX #$0006 : BRA +
  .R1P3
    LDX #$0004 : BRA +
  .R1P2
    LDX #$0002 : BRA +
  .R1P1
    LDX #$0000

+   LDA !ram_radar1 : AND #$0F00
    CMP #$0800 : BEQ .farDown6
    CMP #$0400 : BEQ .closeDown6
    CMP #$0200 : BEQ .farUp6

    LDA #$0861 : STA !HUD_TILEMAP+$8A,X : BRA .drawEnemy7
  .farUp6
    LDA #$0C61 : STA !HUD_TILEMAP+$8A,X : BRA .drawEnemy7
  .closeDown6
    LDA #$0863 : STA !HUD_TILEMAP+$8A,X : BRA .drawEnemy7
  .farDown6
    LDA #$0C63 : STA !HUD_TILEMAP+$8A,X

    ; Enemy 7
  .drawEnemy7
    LDA !ram_radar2 : AND #$F000 : BNE .done
    LDA !ram_radar2 : AND #$00FF
    LSR : BEQ .R2P8
    LSR : BEQ .R2P7
    LSR : BEQ .R2P6
    LSR : BEQ .R2P5
    LSR : BEQ .R2P4
    LSR : BEQ .R2P3
    LSR : BEQ .R2P2
    LSR : BEQ .R2P1
    
  .R2P8
    LDX #$000E : BRA +
  .R2P7
    LDX #$000C : BRA +
  .R2P6
    LDX #$000A : BRA +
  .R2P5
    LDX #$0008 : BRA +
  .R2P4
    LDX #$0006 : BRA +
  .R2P3
    LDX #$0004 : BRA +
  .R2P2
    LDX #$0002 : BRA +
  .R2P1
    LDX #$0000

+   LDA !ram_radar2 : AND #$0F00
    CMP #$0800 : BEQ .farDown7
    CMP #$0400 : BEQ .closeDown7
    CMP #$0200 : BEQ .farUp7

    LDA #$1C61 : STA !HUD_TILEMAP+$8A,X : BRA .done
  .farUp7
    LDA #$1461 : STA !HUD_TILEMAP+$8A,X : BRA .done
  .closeDown7
    LDA #$1C63 : STA !HUD_TILEMAP+$8A,X : BRA .done
  .farDown7
    LDA #$1463 : STA !HUD_TILEMAP+$8A,X

  .done
    RTS
}

status_ceresridley:
{
    ; displays number of shots until Ridley "dies"
    LDA $7E781A : CMP !ram_HUD_check : BEQ .done
    STA !ram_HUD_check
    LDX #$0088 : JSR Draw4

  .done
    RTS
}

status_zebskip:
{
    ; check if MB room, $DD58
    LDA !ROOM_ID : CMP #$DD58 : BNE .end

    ; check if first zeb dead, $7ED821 : AND #$0008
    LDA $7ED820 : AND #$0008 : BNE .secondZeb

    ; check if X position is beyond first zeb
    ; exit if first zeb alive and X beyond first zeb
    LDA !SAMUS_X : CMP #$0334 : BMI .end
    BRA .firstZeb

  .end
    RTS

  .firstZeb
    LDA !SAMUS_X : CMP #$0345 : BMI .stuck
    LDA !IH_BLANK : STA !HUD_TILEMAP+$8E
    BRA .iFrames

  .secondZeb
    ; check if X is beyond 2nd zeb, exit if so
    LDA !SAMUS_X : CMP #$0274 : BMI .end
    CMP #$0285 : BMI .stuck
    LDA !IH_BLANK : STA !HUD_TILEMAP+$8E : STA !HUD_TILEMAP+$90
    BRA .iFrames

  .stuck
    LDA #$106B : STA !HUD_TILEMAP+$8E
    LDA !IH_BLANK : STA !HUD_TILEMAP+$90

  .iFrames
    LDA !SAMUS_IFRAME_TIMER : BEQ .noIframes
    AND #$00FF ; don't draw out-of-range garbage
    LDX #$0088 : JSR Draw2
    RTS

  .noIframes
    LDA #$2009 : STA !HUD_TILEMAP+$8A
    LDA !IH_BLANK : STA !HUD_TILEMAP+$88
    RTS
}

status_pitdoor:
{
    LDA !ROOM_ID : CMP #$975C : BNE .done
    LDA $7EDE64 : BNE .draw_N
    LDA !IH_LETTER_Y : STA !HUD_TILEMAP+$8E
    LDA !sram_display_mode_reward : BEQ .done
    %sfxenergy()
    RTS

  .draw_N
    LDA !IH_LETTER_N : STA !HUD_TILEMAP+$8E

  .done
    RTS
}

status_draygonai:
{
    ; check if Draygon's room
    LDA !ROOM_ID : CMP #$DA60 : BNE .enemyhp

    ; load AI pointer and check if it matches the HUD
    LDA $0FA8 : CMP !ram_HUD_check : BNE .update_HUD

  .enemyhp
    ; update enemy HP on idle frames
    JMP status_enemyhp

  .update_HUD
    STA !ram_HUD_check

    %ai8()
    ; use high byte of pointer to index prefix table
    XBA : SEC : SBC #$87 : BCC .unknown
    TAX : LDA.l DraygonAI_prefix_table,X : TAX
    %a16()

    LDA $0FA8 ; reload AI pointer
  .loop_pointers
    ; search table starting from prefix offset
    CMP.l DraygonAI_pointers,X : BEQ .found
    INX #2
    CPX #$40 : BCC .loop_pointers

  .unknown
    ; unknown text pointer
    %ai16()
    LDA.w #DraygonAIText_UNKN
    BRA .draw_branch

  .found
    LDA.l DraygonAI_text_table,X

  .draw_branch
    STA $C1 ; data address
    %ai8()
    LDA.b #DraygonAIText>>16 : STA $C3 ; data bank
    LDY #$00 : TYX
  .loop_text
    LDA [$C1],Y : CMP #$FF : BEQ .blank_tiles
    STA !HUD_TILEMAP+$B0,X ; tile ID
    LDA #$0C : STA !HUD_TILEMAP+$B1,X ; palette
    INY : INX #2
    BRA .loop_text

  .blank_tiles
    ; clear out any remaining tiles
    CPX #$1A : BPL .left_HUD
    %a16()
  .loop_blank
    LDA !IH_BLANK : STA !HUD_TILEMAP+$B0,X
    INX #2 : CPX #$1A : BMI .loop_blank

  .left_HUD
    %ai16()
    JMP status_enemyhp

; this data could live anywhere in the ROM
DraygonAI_pointers:
    dw $871B, $878B, $87F4               ; [$00+6] 87
    dw $88B1                             ; [$06+2] 88
    dw $8922, $8951, $89B3               ; [$08+6] 89
    dw $8A00, $8A50, $8A90               ; [$0E+6] 8A
    dw $8B0A, $8B52, $8BAE               ; [$14+6] 8B
    dw $8C33, $8C8E, $8CD4               ; [$1A+6] 8C
    dw $8D30, $8DB2                      ; [$20+4] 8D
    dw $8E19                             ; [$24+2] 8E
    dw $8F10, $8F1D, $8FD6               ; [$26+6] 8F
    dw $90D4                             ; [$2C+2] 90
    dw $9105, $9124, $9128, $9154, $9185 ; [$2E+A] 91
    dw $9294, $92AB                      ; [$38+4] 92
                                         ; 93  ->  END
    dw $94A9                             ; [$3C+2] 94

DraygonAI_prefix_table:
; Table to skip ahead to the correct entries based on the high byte
; Unused entries are filled with $40 (the last element in the table) to finish the search faster
    ;   87   88   89   8A   8B   8C   8D   8E   8F   90   91   92        94
    db $00, $06, $08, $0E, $14, $1A, $20, $24, $26, $2C, $2E, $38, $40, $3C
    db $40, $40, $40, $40, $40, $40, $40, $40, $40, $40, $40, $40, $40, $40 ; up to A1

DraygonAI_text_table:
    dw #DraygonAIText_871B ; INIT EVIRS
    dw #DraygonAIText_878B ; IDLE
    dw #DraygonAIText_87F4 ; SET SWOOP R
    dw #DraygonAIText_88B1 ; SWOOP RIGHTv
    dw #DraygonAIText_8922 ; SWOOP RIGHT>
    dw #DraygonAIText_8951 ; SWOOP RIGHT^
    dw #DraygonAIText_89B3 ; SET SWOOP L
    dw #DraygonAIText_8A00 ; SWOOP LEFT v
    dw #DraygonAIText_8A50 ; SWOOP LEFT <
    dw #DraygonAIText_8A90 ; SWOOP LEFT ^
    dw #DraygonAIText_8B0A ; SET GOOP R
    dw #DraygonAIText_8B52 ; GOOP R SEEK
    dw #DraygonAIText_8BAE ; GOOP R SPIT
    dw #DraygonAIText_8C33 ; GOOP R DONE
    dw #DraygonAIText_8C8E ; SET GOOP L
    dw #DraygonAIText_8CD4 ; GOOP L SEEK
    dw #DraygonAIText_8D30 ; GOOP L SPIT
    dw #DraygonAIText_8DB2 ; GOOP L DONE
    dw #DraygonAIText_8E19 ; CHASE SAMUS
    dw #DraygonAIText_9128 ; DROP SAMUS (duplicate)
    dw #DraygonAIText_8F1D ; NOTHING
    dw #DraygonAIText_8F1E ; GRAB START
    dw #DraygonAIText_8FD6 ; GRABBED
    dw #DraygonAIText_90D4 ; SPANK
    dw #DraygonAIText_9105 ; FINAL SPANK
    dw #DraygonAIText_94A9 ; HOLD SAMUS (duplicate)
    dw #DraygonAIText_9128 ; DROP SAMUS
    dw #DraygonAIText_9154 ; FLOAT AWAY
    dw #DraygonAIText_9185 ; WASTING TIME
    dw #DraygonAIText_9294 ; WAIT EVIRS
    dw #DraygonAIText_92AB ; SINK N FLOOR
    dw #DraygonAIText_94A9 ; HOLD SAMUS

DraygonAIText:
table ../resources/HUDfont.tbl
  .871B : db "INIT EVIRS"   : db $FF
  .878B : db "IDLE"         : db $FF
  .87F4 : db "SET SWOOP R"  : db $FF
  .88B1 : db "SWOOP RIGHTv" : db $FF
  .8922 : db "SWOOP RIGHT>" : db $FF
  .8951 : db "SWOOP RIGHT^" : db $FF
  .89B3 : db "SET SWOOP L"  : db $FF
  .8A00 : db "SWOOP LEFT v" : db $FF
  .8A50 : db "SWOOP LEFT <" : db $FF
  .8A90 : db "SWOOP LEFT ^" : db $FF
  .8B0A : db "SET GOOP R"   : db $FF
  .8B52 : db "GOOP R SEEK"  : db $FF
  .8BAE : db "GOOP R SPIT"  : db $FF
  .8C33 : db "GOOP R DONE"  : db $FF
  .8C8E : db "SET GOOP L"   : db $FF
  .8CD4 : db "GOOP L SEEK"  : db $FF
  .8D30 : db "GOOP L SPIT"  : db $FF
  .8DB2 : db "GOOP L DONE"  : db $FF
  .8E19 : db "CHASE SAMUS"  : db $FF
;  .8F10 : db "DROP SAMUS"   : db $FF
  .8F1D : db "NOTHING"      : db $FF
  .8F1E : db "GRAB START"   : db $FF
  .8FD6 : db "GRABBED"      : db $FF
  .90D4 : db "SPANK"        : db $FF
  .9105 : db "FINAL SPANK"  : db $FF
;  .9124 : db "HOLD SAMUS"   : db $FF
  .9128 : db "DROP SAMUS"   : db $FF
  .9154 : db "FLOAT AWAY"   : db $FF
  .9185 : db "WASTING TIME" : db $FF
  .9294 : db "WAIT EVIRS"   : db $FF
  .92AB : db "SINK N FLOOR" : db $FF
  .94A9 : db "HOLD SAMUS"   : db $FF
  .UNKN : db "UNKNOWN"      : db $FF
table ../resources/normal.tbl
}

