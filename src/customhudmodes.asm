; ====================================
; Custom InfoHUD modes and room strats
; ====================================

; When adding or removing infohud modes,
; also update infohud.asm: inc_statusdisplay and dec_statusdisplay

status_countdamage:
{
    LDA !ram_countdamage : CMP !ram_countdamage_hud : BEQ .done : STA !ram_countdamage_hud
    LDX #$0088 : JSR Draw4

  .done
    RTS
}

status_ridleygrab:
{
    LDA $7E800A : CMP !ram_ridleygrab : BEQ .done : STA !ram_ridleygrab
    LDX #$008A : JSR Draw3

  .done
    RTS
}

status_ramwatch:
{
    LDA $09C2 : STA !ram_last_hp
    LDA !ram_watch_left : CMP !ram_watch_left_hud : BNE .refreshLeft
-   LDA !ram_watch_right : CMP !ram_watch_right_hud : BNE .refreshRight : BRA .write

  .refreshLeft
    LDA !ram_watch_left : TAX : LDA $7E0000,X : STA !ram_watch_left_hud
    LDX #$0088 : JSR Draw4Hex : BRA -

  .refreshRight
    LDA !ram_watch_right : TAX : LDA $7E0000,X : STA !ram_watch_right_hud
    LDX #$0092 : JSR Draw4Hex

  .write
    LDA !ram_watch_edit_lock_left : BNE .lock_left
-   LDA !ram_watch_edit_lock_right : BNE .lock_right
    BRA .done

  .lock_left
    LDA !ram_watch_left : TAX
    LDA !ram_watch_edit_left : STA $7E0000,X
    BRA -

  .lock_right
    LDA !ram_watch_right : TAX
    LDA !ram_watch_edit_right : STA $7E0000,X

  .done
    RTS
}

; ===========
; ROOM STRATS
; ===========


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
    LDA #$0C6D : STA $7EC688 : STA $7EC68A          ; draw N's and return
    STA $7EC68E : BRA .movementEnemy0
  .topYSuccess
    LDA #$0C67 : STA $7EC688                        ; draw Y
    LDA #$0C6D : STA $7EC68A                        ; draw N and continue to Xpos
    
    ; X position
    LDA $0F7A,X : CMP #$00A8 : BMI .topXSuccess     ; check if left of (less than) X = 168d
    LDA #$0C6D : STA $7EC68A : BRA .movementEnemy0  ; draw N and return
    
  .topXSuccess
    LDA #$0C67 : STA $7EC68A                        ; draw Y
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
    LDA #$0C6D : STA $7EC68E : BRA .movementEnemy4  ; draw N and return
    
  .botYSuccess
    LDA #$0C67 : STA $7EC68E                        ; draw Y
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
    LDA #$0C6D : STA $7EC616 : STA $7EC618          ; draw N in both slots
    BRA .movementTop

  .success2Top
    LDA #$0C67 : STA $7EC616 : STA $7EC618          ; draw Y in both slots
    BRA .movementTop
    
  .successTop
    LDA #$0C67 : STA $7EC616                        ; draw Y in first slot
    LDA #$0C6D : STA $7EC618                        ; draw N in second slot

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
    LDA #$0C6D : STA $7EC688 : BRA .movementMiddle  ; draw N and return
    
  .successMiddle
    LDA #$0C67 : STA $7EC688                        ; draw Y
    
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
    LDA #$0C6D : STA $7EC692 : BRA .movementBottom  ; draw N and return
    
  .successBottom
    LDA #$0C67 : STA $7EC692                        ; draw Y
    
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

    LDY $0AF6 : CPY #$004B : BEQ .greenSamus
    LDA #$00C9 : BRA .checkX0

  .greenSamus
    LDA #$10C9

  .checkX0
    CPY #$0030 : BPL .samusX1
    STA $7EC68C : BRA .checkEnemies

  .samusX1
    CPY #$0040 : BPL .samusX2
    STA $7EC68E : BRA .checkEnemies

  .samusX2
    CPY #$0050 : BPL .samusX3
    STA $7EC690 : BRA .checkEnemies

  .samusX3
    CPY #$0060 : BPL .samusX4
    STA $7EC692 : BRA .checkEnemies

  .samusX4
    CPY #$0070 : BPL .samusX5
    STA $7EC694 : BRA .checkEnemies

  .samusX5
    CPY #$0080 : BPL .samusX6
    STA $7EC696 : BRA .checkEnemies

  .samusX6
    STA $7EC698

; Detect stuff

  .checkEnemies
    LDX #$0180 ; Enemy 6
    LDA $7E0F7E,X : CMP #$0270 : BCC .checkEnemy6      ; check if Y <270h
    LDA #$F000 : STA !ram_radar1 : BRL .skipEnemy6

  .checkEnemy6
    ; X Position
    LDA $7E0F7A,X
    CMP #$0020 : BPL .Enemy6X2
    LDA #$0080 : STA !ram_radar1
    BRA .Enemy6Y

  .Enemy6X2
    LDA $7E0F7A,X
    CMP #$0030 : BPL .Enemy6X3
    LDA #$0040 : STA !ram_radar1
    BRA .Enemy6Y

  .Enemy6X3
    LDA $7E0F7A,X
    CMP #$0040 : BPL .Enemy6X4
    LDA #$0020 : STA !ram_radar1
    BRA .Enemy6Y

  .Enemy6X4
    LDA $7E0F7A,X
    CMP #$0050 : BPL .Enemy6X5
    LDA #$0010 : STA !ram_radar1
    BRA .Enemy6Y

  .Enemy6X5
    LDA $7E0F7A,X
    CMP #$0060 : BPL .Enemy6X6
    LDA #$0008 : STA !ram_radar1
    BRA .Enemy6Y

  .Enemy6X6
    LDA $7E0F7A,X
    CMP #$0070 : BPL .Enemy6X7
    LDA #$0004 : STA !ram_radar1
    BRA .Enemy6Y

  .Enemy6X7
    LDA $7E0F7A,X
    CMP #$0080 : BPL .Enemy6X8
    LDA #$0002 : STA !ram_radar1
    BRA .Enemy6Y

  .Enemy6X8
    LDA #$0001 : STA !ram_radar1

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
    LDA $7E0F7E,X : CMP #$0270 : BCC +      ; check if Y <270h
    LDA #$FFFF : STA !ram_radar2 : BRL .drawEnemy6
    ; X Position
+   LDA $7E0F7A,X
    CMP #$0020 : BPL +
    LDA #$0080 : STA !ram_radar2
    BRA .Enemy7Y

+   LDA $7E0F7A,X
    CMP #$0030 : BPL +
    LDA #$0040 : STA !ram_radar2
    BRA .Enemy7Y

+   LDA $7E0F7A,X
    CMP #$0040 : BPL +
    LDA #$0020 : STA !ram_radar2
    BRA .Enemy7Y

+   LDA $7E0F7A,X
    CMP #$0050 : BPL +
    LDA #$0010 : STA !ram_radar2
    BRA .Enemy7Y

+   LDA $7E0F7A,X
    CMP #$0060 : BPL +
    LDA #$0008 : STA !ram_radar2
    BRA .Enemy7Y

+   LDA $7E0F7A,X
    CMP #$0070 : BPL +
    LDA #$0004 : STA !ram_radar2
    BRA .Enemy7Y

+   LDA $7E0F7A,X
    CMP #$0080 : BPL +
    LDA #$0002 : STA !ram_radar2
    BRA .Enemy7Y

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
