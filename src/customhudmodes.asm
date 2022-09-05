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
    ; convert negative speeds to positive
    LDA !SAMUS_Y_SPEED : BPL .positive
    EOR #$FFFF : INC

  .positive
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
    LDA $4216 : ASL : TAY
    LDA.l NumberGFXTable,X : STA !HUD_TILEMAP+$8A
    BRA .subspeed

  .blanktens
    ; ones digit
    LDA $4216 : ASL : TAX
    LDA.l NumberGFXTable,X : STA !HUD_TILEMAP+$8A
    ; tens digit
    LDA !IH_BLANK : STA !HUD_TILEMAP+$88

  .subspeed
    LDA !IH_DECIMAL : STA !HUD_TILEMAP+$88

    ; draw first decimal place of subspeed in hex
    LDA !SAMUS_Y_SUBSPEED : XBA : AND #$00F0 : LSR #3 : TAY
    LDA.l HexGFXTable,X : STA !HUD_TILEMAP+$88

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
    LDA $7E0F7E,X : CMP #$0270 : BCC .Enemy6X         ; check if Y <270h
    LDA #$F000 : STA !ram_radar1 : BRL .skipEnemy6    ; set skip flag

    ; X Position
  .Enemy6X
    ; check X position, set position bit on radar
    LDA $7E0F7A,X
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
    LDA $7E0F7E,X : CMP !ram_enemy6_last_ypos : BCC .upEnemy6
    STA !ram_enemy6_last_ypos
    CMP #$0252 : BCC +
    LDA !ram_radar1 : AND #$00FF : ORA #$0800 : BRA ++
+   LDA !ram_radar1 : AND #$00FF : ORA #$0400
++  STA !ram_radar1 : BRA .checkEnemy7

  .upEnemy6
    STA !ram_enemy6_last_ypos
    CMP #$0252 : BCC +
    LDA !ram_radar1 : AND #$00FF : ORA #$0200 : BRA ++
+   LDA !ram_radar1 : AND #$00FF : ORA #$0100
++  STA !ram_radar1 : BRA .checkEnemy7

  .skipEnemy6
    LDA #$FFFF : STA !ram_radar1

  .checkEnemy7
    LDX #$01C0
    LDA $7E0F7E,X : CMP #$0270 : BCC .Enemy7X      ; check if Y <270h
    LDA #$FFFF : STA !ram_radar2 : BRL .drawEnemy6

    ; X Position
  .Enemy7X
    LDA $7E0F7A,X
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
    LDA $7E0F7E,X : CMP !ram_enemy7_last_ypos : BCC .upEnemy7
    STA !ram_enemy7_last_ypos
    CMP #$0252 : BCC +
    LDA !ram_radar2 : AND #$00FF : ORA #$0800 : BRA ++
+   LDA !ram_radar2 : AND #$00FF : ORA #$0400
++  STA !ram_radar2 : BRA .drawEnemy6

  .upEnemy7
    STA !ram_enemy7_last_ypos
    CMP #$0252 : BCC +
    LDA !ram_radar2 : AND #$00FF : ORA #$0200 : BRA ++
+   LDA !ram_radar2 : AND #$00FF : ORA #$0100
++  STA !ram_radar2


; Draw stuff
; Don't draw the enemy if first nibble is non-zero
; Second bit determines arrow direction and color:
; 8 = far away moving down, 4 = close moving up
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
    LDA !IH_BLANK : STA !HUD_TILEMAP+$8E
    BRA .iFrames

  .stuck
    LDA #$106B : STA !HUD_TILEMAP+$8E

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
    RTS

  .draw_N
    LDA !IH_LETTER_N : STA !HUD_TILEMAP+$8E

  .done
    RTS
}

status_ridleyai:
{
    ; check if Ridley's room
    LDA !ROOM_ID : CMP #$B32E : BNE .enemyhp

    ; load AI pointer and check if it matches the HUD
    LDA $0FA8 : CMP !ram_HUD_check : BNE .update_HUD

    ; fallbacks for convenience
    LDA !ENEMY_HP : BEQ .ridleygrab
  .enemyhp
    JMP status_enemyhp
  .ridleygrab
    JMP .status_ridleygrab

  .update_HUD
    STA !ram_HUD_check
    CMP #$C000 : BMI + : JMP .dead
+   CMP #$B2F3 : BPL + : JMP .stall
+   BNE + : JMP .B2F3 ; liftoff
+   CMP #$B613 : BPL .bottom_half
    ; top half
    CMP #$B493 : BPL .top_split
+   CMP #$B321 : BNE + : JMP .B321 ; choose ai
+   CMP #$B3EC : BNE + : JMP .B3EC ; move
+   CMP #$B3F8 : BNE + : JMP .B3F8 ; move middle
+   CMP #$B441 : BNE + : JMP .B441 ; swoop start
    ; swoop positioning
+   LDA.w #RidleyAIText_B455 : STA $C1
    JMP .draw_branch

  .top_split
    BNE + : JMP .B493 ; swoop dive
+   CMP #$B4D1 : BNE + : JMP .B4D1 ; swooping
+   CMP #$B4D1 : BNE + : JMP .B4D1 ; climb
+   CMP #$B516 : BNE + : JMP .B516 ; climbing
+   CMP #$B594 : BNE + : JMP .B594 ; swoop end
    ; hover
+   LDA.w #RidleyAIText_B5E5 : STA $C1
    JMP .draw_branch

  .bottom_half
    BNE + : JMP .B613 ; hover 2
+   CMP #$BB8F : BPL .bottom_split
    CMP #$B6A7 : BNE + : JMP .B6A7 ; pogo start
+   CMP #$B6DD : BNE + : JMP .B6DD ; pogo start 2
+   CMP #$B70E : BNE + : JMP .B70E ; pogo down
+   CMP #$B7B9 : BNE + : JMP .B7B9 ; pogo up
    ; lunge
+   LDA.w #RidleyAIText_BAB7 : STA $C1
    JMP .draw_branch

  .bottom_split
    BNE + : JMP .BB8F ; grabbed
+   CMP #$BBC4 : BNE + : JMP .BBC4 ; grab move
+   CMP #$BBF1 : BNE + : JMP .BBF1 ; dropping
+   CMP #$BC2E : BNE + : JMP .BC2E ; dropped
+   CMP #$BC54 : BNE + : JMP .BC54 ; hover start
    ; dodge power bomb
+   LDA.w #RidleyAIText_BD4E : STA $C1
    JMP .draw_branch

  .stall
    LDA.w #RidleyAIText_WAIT : STA $C1
    JMP .draw_branch

  .dead
    CMP #$C538 : BNE + : JMP .C538 ; dead move
+   CMP #$C588 : BNE + : JMP .C588 ; explode
    ; otherwise end
+   LDA.w #RidleyAIText_DEAD : STA $C1
    JMP .draw_branch

  .B2F3 ; liftoff
    LDA.w #RidleyAIText_B2F3 : STA $C1
    JMP .draw_branch
  .B321 ; choose ai
    LDA.w #RidleyAIText_B321 : STA $C1
    JMP .draw_branch
  .B3EC ; move
    LDA.w #RidleyAIText_B3EC : STA $C1
    JMP .draw_branch
  .B3F8 ; move mid
    LDA.w #RidleyAIText_B3F8 : STA $C1
    JMP .draw_branch
  .B441 ; swoop start
    LDA.w #RidleyAIText_B441 : STA $C1
    JMP .draw_branch
  .B493 ; swoop dive
    LDA.w #RidleyAIText_B493 : STA $C1
    BRA .draw_branch
  .B4D1 ; swooping
    LDA.w #RidleyAIText_B4D1 : STA $C1
    BRA .draw_branch
  .B516 ; climb
    LDA.w #RidleyAIText_B516 : STA $C1
    BRA .draw_branch
  .B554 ; climbing
    LDA.w #RidleyAIText_B554 : STA $C1
    BRA .draw_branch
  .B594 ; swoop end
    LDA.w #RidleyAIText_B594 : STA $C1
    BRA .draw_branch
  .B613 ; hover 2
    LDA.w #RidleyAIText_B613 : STA $C1
    BRA .draw_branch
  .B6A7 ; pogo start
    LDA.w #RidleyAIText_B6A7 : STA $C1
    BRA .draw_branch
  .B6DD ; pogo start 2
    LDA.w #RidleyAIText_B6DD : STA $C1
    BRA .draw_branch
  .B70E ; pogo down
    LDA.w #RidleyAIText_B70E : STA $C1
    BRA .draw_branch
  .B7B9 ; pogo up
    LDA.w #RidleyAIText_B7B9 : STA $C1
    BRA .draw_branch
  .BB8F ; grabbed
    LDA.w #RidleyAIText_BB8F : STA $C1
    BRA .draw_branch
  .BBC4 ; grab move
    LDA.w #RidleyAIText_BBC4 : STA $C1
    BRA .draw_branch
  .BBF1 ; dropping
    LDA.w #RidleyAIText_BBF1 : STA $C1
    BRA .draw_branch
  .BC2E ; dropped
    LDA.w #RidleyAIText_BC2E : STA $C1
    BRA .draw_branch
  .BC54 ; hover start
    LDA.w #RidleyAIText_BC54 : STA $C1
    BRA .draw_branch
  .C538 ; dead move
    LDA.w #RidleyAIText_C538 : STA $C1
    BRA .draw_branch
  .C588 ; explode
    LDA.w #RidleyAIText_C588 : STA $C1

  .draw_branch
    %ai8()
    LDA.b #RidleyAIText>>16 : STA $C3
    LDA #$2C : STA $C5
    LDY #$00 : LDX #$00
-   LDA [$C1],Y : CMP #$FF : BEQ .blank_tiles
    STA !HUD_TILEMAP+$B0,X
    INY
    LDA $C5 : STA !HUD_TILEMAP+$B1,X
    INX #2
    BRA -

  .blank_tiles
    CPX #$1A : BPL .left_HUD
    %a16()
-   LDA !IH_BLANK : STA !HUD_TILEMAP+$B0,X
    INX #2 : CPX #$1A : BMI -

  .left_HUD
    %ai16()
    LDA !ENEMY_HP : BEQ .status_ridleygrab
    JMP status_enemyhp

  .status_ridleygrab
    LDA $7E800A : CMP !ram_HUD_bottom : BEQ .done
    STA !ram_HUD_bottom
    LDX #$008C : JSR Draw2
    LDA !IH_BLANK : STA !HUD_TILEMAP+$8A

  .done
    RTS

RidleyAIText:
    table ../resources/HUDfont.tbl
  .WAIT : db "STALLING"     : db $FF
  .B2F3 : db "LIFTOFF"      : db $FF
  .B321 : db "CHOOSE AI"    : db $FF
  .B3EC : db "MOVE"         : db $FF
  .B3F8 : db "MOVE TO MID"  : db $FF
  .B441 : db "SWOOP START"  : db $FF
  .B455 : db "SWOOP MOVE"   : db $FF
  .B493 : db "SWOOP DIVE"   : db $FF
  .B4D1 : db "SWOOPING"     : db $FF
  .B516 : db "CLIMB"        : db $FF
  .B554 : db "CLIMBING"     : db $FF
  .B594 : db "SWOOP END"    : db $FF
  .B5E5 : db "HOVER"        : db $FF
  .B613 : db "HOVER 2"      : db $FF
  .B6A7 : db "POGO START"   : db $FF
  .B6DD : db "POGO START 2" : db $FF
  .B70E : db "POGO DOWN"    : db $FF
  .B7B9 : db "POGO UP"      : db $FF
  .BAB7 : db "LUNGE"        : db $FF
  .BB8F : db "GRAB SAMUS"   : db $FF
  .BBC4 : db "GRAB MOVE"    : db $FF
  .BBF1 : db "DROP SAMUS"   : db $FF
  .BC2E : db "DROPPED"      : db $FF
  .BC54 : db "HOVER START"  : db $FF
  .BD4E : db "DODGE PB"     : db $FF
  .C538 : db "DEAD MOVE"    : db $FF
  .C588 : db "EXPLODE"      : db $FF
  .DEAD : db "END"          : db $FF
    table ../resources/normal.tbl
}
