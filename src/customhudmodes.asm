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

status_ridleygrab:
{
    LDA $7E800A : CMP !ram_HUD_bottom : BEQ .done : STA !ram_HUD_bottom
    LDX #$008A : JSR Draw3

  .done
    RTS
}

status_dboost:
{
print pc, " <--                                dboost"
    LDA $0A1F : AND #$00FF
    CMP #$000A : BEQ .knockback
;    CMP #$0019 : BEQ .dboost
    LDA !ram_dboost_state : BEQ .done
    DEC : BEQ .reset     ; 1 = needs reset
    DEC : BEQ .kbExpired ; 2 = knockback expired
  ;.damaged              ; 3 = damage detected
    LDA $18AA : BEQ .kbExpired : BRA .knockback
    
  .kbExpired
    LDA #$0002 : STA !ram_dboost_state
    LDA !ram_dboost_counter : CMP #$0014 : BPL .giveUp ; give up 20 frames after kb expires
    INC : STA !ram_dboost_counter
    LDA $8B : AND #$0300
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
    LDA $8B : AND !IH_INPUT_JUMP : BEQ .printfailed
    RTS

  .printfailed
    LDX #$008C : LDA !ram_dboost_counter : JSR Draw2
    LDA !IH_LETTER_L : STA $7EC68A

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
    LDA $18AA : CMP !ram_dboost_kbmax : BMI .knockbackContinues
    STA !ram_dboost_kbmax
    
  .knockbackContinues
    LDA #$0003 : STA !ram_dboost_state : BRA .direction
    
  .direction
    LDA $8B : AND #$0300
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
    LDA $8B : AND !IH_INPUT_JUMP : BEQ .dboostInitiated
    ; not holding jump
    
  .dboostInitiated
    LDA #$0001 : STA !ram_dboost_state
    LDA $18AA : STA !ram_dboost_kb
    SEC : LDA !ram_dboost_kbmax : SBC !ram_dboost_kb
    LDX #$008C : JSR Draw2 : LDA !IH_LETTER_Y : STA $7EC68A

    RTS
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

superhud_top_table:
    dw topHUD_off
    dw topHUD_xfactor
    dw topHUD_shinetimer
    dw topHUD_iframecounter
    dw topHUD_lagcounter
    dw topHUD_shottimer
    dw topHUD_chargetimer
    dw topHUD_dashcounter
    dw topHUD_cooldowncounter
    dw topHUD_ridleygrab

superhud_middle_table:
    dw middleHUD_off
    dw middleHUD_xfactor
    dw middleHUD_shinetimer
    dw middleHUD_iframecounter
    dw middleHUD_lagcounter
    dw middleHUD_shottimer
    dw middleHUD_chargetimer
    dw middleHUD_dashcounter
    dw middleHUD_cooldowncounter
    dw middleHUD_ridleygrab

topHUD_off:
middleHUD_off:
{
    ; we shouldn't be here, but just in case...
    RTS
}

topHUD_chargetimer:
{
    LDA #$003D : SEC : SBC $0CD0 : CMP !ram_HUD_top : BEQ .done : STA !ram_HUD_top
    CMP #$0000 : BPL .charging : LDA #$0000

  .charging
    LDX #$0014 : JSR Draw3

  .done
    RTS
}

middleHUD_chargetimer:
{
    LDA #$003D : SEC : SBC $0CD0 : CMP !ram_HUD_middle : BEQ .done : STA !ram_HUD_middle
    CMP #$0000 : BPL .charging : LDA #$0000

  .charging
    LDX #$0054 : JSR Draw3

  .done
    RTS
}

topHUD_xfactor:
{
    LDA #$0079 : SEC : SBC $0CD0 : CMP !ram_HUD_top : BEQ .done : STA !ram_HUD_top
    LDX #$0014 : JSR Draw3

  .done
    RTS
}

middleHUD_xfactor:
{
    LDA #$0079 : SEC : SBC $0CD0 : CMP !ram_HUD_middle : BEQ .done : STA !ram_HUD_middle
    LDX #$0054 : JSR Draw3

  .done
    RTS
}

topHUD_cooldowncounter:
{
    LDA $0CCC : CMP !ram_HUD_top : BEQ .done : STA !ram_HUD_top
    LDX #$0014 : JSR Draw3

  .done
    RTS
}

middleHUD_cooldowncounter:
{
    LDA $0CCC : CMP !ram_HUD_middle : BEQ .done : STA !ram_HUD_middle
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
    LDA $0B3F : AND #$00FF : CMP !ram_dash_counter : BEQ .done
    STA !ram_dash_counter : ASL : TAX
    LDA HexGFXTable,X : STA $7EC618

  .done
    RTS
}

middleHUD_dashcounter:
{
    LDA $0B3F : AND #$00FF : CMP !ram_dash_counter : BEQ .done
    STA !ram_dash_counter : ASL : TAX
    LDA HexGFXTable,X : STA $7EC658

  .done
    RTS
}

topHUD_ridleygrab:
{
    LDA $7E800A : CMP !ram_HUD_top : BEQ .done : STA !ram_HUD_top
    LDX #$0016 : JSR Draw2

  .done
    RTS
}

middleHUD_ridleygrab:
{
    LDA $7E800A : CMP !ram_HUD_middle : BEQ .done : STA !ram_HUD_middle
    LDX #$0056 : JSR Draw2

  .done
    RTS
}

topHUD_iframecounter:
{
    LDA $18A8 : CMP !ram_HUD_top : BEQ .done : STA !ram_HUD_top
    LDX #$0014 : JSR Draw3

  .done
    RTS
}

middleHUD_iframecounter:
{
    LDA $18A8 : CMP !ram_HUD_middle : BEQ .done : STA !ram_HUD_middle
    LDX #$0054 : JSR Draw3

  .done
    RTS
}

topHUD_lagcounter:
{
    LDA !ram_vcounter_data : AND #$00FF
    %a8() : STA $211B : XBA : STA $211B : LDA #$64 : STA $211C : %a16()
    LDA $2134 : STA $4204
    %a8() : LDA #$E1 : STA $4206 : %a16()
    PHA : PLA : PHA : PLA : LDA $4214
    LDX #$0014 : JSR Draw2
    LDA !IH_PERCENT : STA $7EC618

    RTS
}

middleHUD_lagcounter:
{
    LDA !ram_vcounter_data : AND #$00FF
    %a8() : STA $211B : XBA : STA $211B : LDA #$64 : STA $211C : %a16()
    LDA $2134 : STA $4204
    %a8() : LDA #$E1 : STA $4206 : %a16()
    PHA : PLA : PHA : PLA : LDA $4214
    LDX #$0054 : JSR Draw2
    LDA !IH_PERCENT : STA $7EC658

    RTS
}

topHUD_shottimer:
{
    LDA !IH_CONTROLLER_PRI_NEW : AND !IH_INPUT_SHOOT : BEQ .inc
    LDA !ram_shot_timer : LDX #$0014 : JSR Draw3
    LDA #$0000 : STA !ram_shot_timer

  .inc
    LDA !ram_shot_timer : INC : STA !ram_shot_timer
    RTS
}

middleHUD_shottimer:
{
    LDA !IH_CONTROLLER_PRI_NEW : AND !IH_INPUT_SHOOT : BEQ .inc
    LDA !ram_shot_timer : LDX #$0054 : JSR Draw3
    LDA #$0000 : STA !ram_shot_timer

  .inc
    LDA !ram_shot_timer : INC : STA !ram_shot_timer
    RTS
}

}

status_kihuntermanip:
{
    LDA $079B : CMP #$B585 : BEQ .roomStairs
    LDA $079B : CMP #$B656 : BEQ .jumpMusketeers
    JMP .done
  .jumpMusketeers
    JMP .roomMusketeers
; Kihunter Stairs
  .roomStairs
    LDA !IH_BLANK : STA $7EC68C : STA $7EC68E       ; draw blank spaces
    STA $7EC690 : STA $7EC692 : STA $7EC694
    STA $7EC696 : STA $7EC698 : STA $7EC614
; top kihunter
    LDX #$0000                                      ; start with top kihunter, enemy0
    
    ; Y position
    LDA $0F7E,X : CMP #$01F4 : BPL .topYSuccess     ; check if below (greater than) Y = 500d
    LDA !IH_LETTER_N : STA $7EC688 : STA $7EC68A    ; draw N's and return
    STA $7EC68E : BRA .movementEnemy0
  .topYSuccess
    LDA !IH_LETTER_Y : STA $7EC688                  ; draw Y
    LDA !IH_LETTER_N : STA $7EC68A                  ; draw N and continue to Xpos
    
    ; X position
    LDA $0F7A,X : CMP #$00A8 : BMI .topXSuccess     ; check if left of (less than) X = 168d
    LDA !IH_LETTER_N : STA $7EC68A : BRA .movementEnemy0  ; draw N and return
    
  .topXSuccess
    LDA !IH_LETTER_Y : STA $7EC68A                  ; draw Y
    ; movement arrows
  .movementEnemy0
    ; X position
    LDA $0F7A,X : CMP !ram_enemy0_last_xpos         ; check enemy xpos
    BEQ .FinishX0 : BMI .LeftX0                     ; next enemy if no change, left if xpos decreased
    LDA #$0C62 : STA $7EC616                        ; draw right arrow
    BRA .FinishX0

  .LeftX0
    LDA #$0C60 : STA $7EC616                        ; draw left arrow
  .FinishX0
    LDA $0F7A,X : STA !ram_enemy0_last_xpos         ; store last_xpos for next frame
    
    ; Y position
    LDA $0F7E,X : CMP !ram_enemy0_last_ypos         ; check enemy ypos
    BEQ .FinishY0 : BMI .UpY0                       ; next enemy if no change, left if ypos decreased
    LDA #$0C63 : STA $7EC618                        ; draw down arrow
    BRA .FinishY0

  .UpY0
    LDA !IH_ARROW_UP : STA $7EC618                  ; draw up arrow

  .FinishY0
    LDA $0F7E,X : STA !ram_enemy0_last_ypos         ; store last_ypos for next frame
    
; bottom kihunter
    LDX #$0100                                      ; change to bottom kihunter, enemy4
    
    ; Y position
    LDA $0F7E,X : CMP #$0316 : BPL .botYSuccess     ; check if below (greater than) Y = 790d
    LDA !IH_LETTER_N : STA $7EC68E : BRA .movementEnemy4  ; draw N and return
    
  .botYSuccess
    LDA !IH_LETTER_Y : STA $7EC68E                  ; draw Y
    ; movement arrows

  .movementEnemy4
    ; X position
    LDA $0F7A,X : CMP !ram_enemy4_last_xpos         ; check enemy xpos
    BEQ .FinishX4 : BMI .LeftX4                     ; next enemy if no change, left if xpos decreased
    LDA #$0C62 : STA $7EC656                        ; draw right arrow
    BRA .FinishX4

  .LeftX4
    LDA #$0C60 : STA $7EC656                        ; draw left arrow

  .FinishX4
    LDA $0F7A,X : STA !ram_enemy4_last_xpos         ; store last_xpos for next frame

    ; Y position
    LDA $0F7E,X : CMP !ram_enemy4_last_ypos         ; check enemy xpos
    BEQ .FinishY4 : BMI .UpY4                       ; next enemy if no change, left if xpos decreased
    LDA #$0C63 : STA $7EC658                        ; draw down arrow
    BRA .FinishY4

  .UpY4
    LDA !IH_ARROW_UP : STA $7EC658                  ; draw up arrow

  .FinishY4
    LDA $0F7E,X : STA !ram_enemy4_last_ypos         ; store last_ypos for next frame
    JMP .done

; Three Musketeers
  .roomMusketeers
    LDA $09C2 : STA !ram_last_hp                    ; prevent SamusHP from overwriting our work later
    LDA !IH_BLANK : STA $7EC68C : STA $7EC68E       ; draw blank spaces
    STA $7EC690 : STA $7EC692 : STA $7EC694
    STA $7EC696 : STA $7EC698 : STA $7EC614

; top kihunter
    LDX #$0200                                      ; start with top kihunter (enemy8)
    LDA $0F7A,X : CMP #$018C : BPL .success2Top     ; branch if right of (greater than) X = 396d
    CMP #$0157 : BPL .successTop                    ; branch if right of (greater than) X = 343d
    LDA !IH_LETTER_N : STA $7EC616 : STA $7EC618    ; draw N in both slots
    BRA .movementTop

  .success2Top
    LDA !IH_LETTER_Y : STA $7EC616 : STA $7EC618    ; draw Y in both slots
    BRA .movementTop
    
  .successTop
    LDA !IH_LETTER_Y : STA $7EC616                  ; draw Y in first slot
    LDA !IH_LETTER_N : STA $7EC618                  ; draw N in second slot

  .movementTop
    LDA $0F7A,X : CMP !ram_enemy8_last_xpos         ; check xpos again
    BMI .X8Left                                     ; next enemy if no change, left if xpos decreased
    LDA #$0C62 : STA $7EC656                        ; draw right arrow
    BRA .X8Finish

  .X8Left
    LDA #$0C60 : STA $7EC656                        ; draw left arrow

  .X8Finish
    LDA $0F7A,X : STA !ram_enemy8_last_xpos         ; store last_xpos for next frame
    ; Y position
    LDA $0F7E,X : CMP !ram_enemy8_last_ypos         ; check enemy xpos
    BEQ .Y8Finish : BMI .Y8Up                       ; next enemy if no change, left if xpos decreased
    LDA #$0C63 : STA $7EC658                        ; draw down arrow
    BRA .Y8Finish

  .Y8Up
    LDA !IH_ARROW_UP : STA $7EC658                  ; draw up arrow

  .Y8Finish
    LDA $0F7E,X : STA !ram_enemy8_last_ypos         ; store last_ypos for next frame

; middle kihunter
    LDX #$0180                                      ; change to middle kihunter (enemy6)
    LDA $0F7A,X : CMP #$0157 : BMI .successMiddle   ; check if left of (less than) X = 343d
    LDA !IH_LETTER_N : STA $7EC688 : BRA .movementMiddle  ; draw N and return
    
  .successMiddle
    LDA !IH_LETTER_Y : STA $7EC688                  ; draw Y
    
  .movementMiddle
    LDA $0F7A,X : CMP !ram_enemy6_last_xpos         ; check xpos again
    BMI .X6Left                                     ; next enemy if no change, left if xpos decreased
    LDA #$0C62 : STA $7EC68C                        ; draw right arrow
    BRA .X6Finish

  .X6Left
    LDA #$0C60 : STA $7EC68C                        ; draw left arrow

  .X6Finish
    LDA $0F7A,X : STA !ram_enemy6_last_xpos         ; store last_xpos for next frame

    ; Y position
    LDA $0F7E,X : CMP !ram_enemy6_last_ypos         ; check enemy xpos
    BEQ .Y6Finish : BMI .Y6Up                       ; next enemy if no change, left if xpos decreased
    LDA #$0C63 : STA $7EC68E                        ; draw down arrow
    BRA .Y6Finish

  .Y6Up
    LDA #$0C61 : STA $7EC68E                        ; draw up arrow

  .Y6Finish
    LDA $0F7E,X : STA !ram_enemy6_last_ypos         ; store last_ypos for next frame

; bottom kihunter
    LDX #$0100                                      ; change to bottom kihunter (enemy4)
    LDA $0F7A,X : CMP #$0157 : BPL .successBottom   ; check if right of (greater than) X = 343d
    LDA !IH_LETTER_N : STA $7EC692 : BRA .movementBottom  ; draw N and return
    
  .successBottom
    LDA !IH_LETTER_Y : STA $7EC692                  ; draw Y
    
  .movementBottom
    LDA $0F7A,X : CMP !ram_enemy4_last_xpos         ; check xpos again
    BMI .X4Left                                     ; next enemy if no change, left if xpos decreased
    LDA #$0C62 : STA $7EC696                        ; draw right arrow
    BRA .X4Finish

  .X4Left
    LDA #$0C60 : STA $7EC696                        ; draw left arrow

  .X4Finish
    LDA $0F7A,X : STA !ram_enemy4_last_xpos         ; store last_xpos for next frame

    ; Y position
    LDA $0F7E,X : CMP !ram_enemy4_last_ypos         ; check enemy xpos
    BEQ .Y4Finish : BMI .Y4Up                       ; next enemy if no change, left if xpos decreased
    LDA #$0C63 : STA $7EC698                        ; draw down arrow
    BRA .Y4Finish

  .Y4Up
    LDA #$0C61 : STA $7EC698                        ; draw up arrow

  .Y4Finish
    LDA $0F7E,X : STA !ram_enemy4_last_ypos         ; store last_ypos for next frame

  .done
    RTS
}

status_kraidradar:
{
    LDA $079B : CMP #$A59F : BNE .skip              ; check for Kraid's room
    LDA $0F8C : CMP #$03E8 : BEQ .setup             ; stop tracking when Kraid takes damage

  .skip
    RTS

  .setup
    LDA $09C2 : STA !ram_last_hp                    ; suppress Samus HP
    LDA !IH_BLANK : STA $7EC688 : STA $7EC68A       ; clear space on HUD
    STA $7EC68C : STA $7EC68E : STA $7EC690
    STA $7EC692 : STA $7EC694 : STA $7EC696
    STA $7EC698

; Detect and draw Samus first

    ; check if sweet spot (2 missile KQK)
    LDY $0AF6 : CPY #$004B : BEQ .greenSamus ; just the popular bomb setup atm
    LDA #$00C9 : BRA .checkSamusX

  .greenSamus
    LDA #$10C9

  .checkSamusX
    CPY #$0030 : BPL + : STA $7EC68C : BRA .checkEnemies
+   CPY #$0040 : BPL + : STA $7EC68E : BRA .checkEnemies
+   CPY #$0050 : BPL + : STA $7EC690 : BRA .checkEnemies
+   CPY #$0060 : BPL + : STA $7EC692 : BRA .checkEnemies
+   CPY #$0070 : BPL + : STA $7EC694 : BRA .checkEnemies
+   CPY #$0080 : BPL + : STA $7EC696 : BRA .checkEnemies
+   STA $7EC698

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

    LDA #$0861 : STA $7EC68A,X : BRA .drawEnemy7
  .farUp6
    LDA #$0C61 : STA $7EC68A,X : BRA .drawEnemy7
  .closeDown6
    LDA #$0863 : STA $7EC68A,X : BRA .drawEnemy7
  .farDown6
    LDA #$0C63 : STA $7EC68A,X

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

    LDA #$1C61 : STA $7EC68A,X : BRA .done
  .farUp7
    LDA #$1461 : STA $7EC68A,X : BRA .done
  .closeDown7
    LDA #$1C63 : STA $7EC68A,X : BRA .done
  .farDown7
    LDA #$1463 : STA $7EC68A,X

  .done
    RTS
}
