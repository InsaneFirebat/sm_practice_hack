
; ====================================
; Custom InfoHUD modes and room strats
; ====================================

%startfree(F0)

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
    LDA #$0000 : CMP !SAMUS_KNOCKBACK_DIRECTION : BEQ .failedCheckJumpInput
    RTS

  .failedHoldingRight
    LDA #$0001 : CMP !SAMUS_KNOCKBACK_DIRECTION : BEQ .failedCheckJumpInput
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
    LDA #$0000 : CMP !SAMUS_KNOCKBACK_DIRECTION : BEQ .checkJumpInput
    ; directional input does not match knockback direction
    
  .holdingRight
    LDA #$0001 : CMP !SAMUS_KNOCKBACK_DIRECTION : BEQ .checkJumpInput
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

status_door_dashspeed:
{
    ; draw whole number in decimal
    LDA !SAMUS_X_RUNSPEED : STA $4204
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
    LDA !SAMUS_X_SUBRUNSPEED : AND #$F000 : XBA : LSR #3 : TAX
    LDA.l HexGFXTable,X : STA !HUD_TILEMAP+$8E

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

status_door_chargetimer:
{
    LDA !SAMUS_CHARGE_TIMER : CMP #$003C : BPL .charged
    LDA #$003C : SEC : SBC !SAMUS_CHARGE_TIMER
    LDX #$0088 : JMP Draw4

  .charged
    LDA !IH_BLANK : STA !HUD_TILEMAP+$88 : STA !HUD_TILEMAP+$8A
    LDA !IH_SHINESPARK : STA !HUD_TILEMAP+$8C
    LDA !SAMUS_CHARGE_TIMER : SEC : SBC #$003C
    ASL : TAX
    LDA NumberGFXTable,X : STA !HUD_TILEMAP+$8E
    RTS
}

status_door_dashcounter:
{
    LDA !SAMUS_DASH_COUNTER : LDX #$0088 : JMP Draw4
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
  .enemyhp ; assumed to be zero index
    dw status_enemyhp
  .chargetimer
    dw status_chargetimer
  .shottimer
    dw status_shottimer
  .cooldown
    dw status_cooldown
  .xfactor
    dw status_xfactor
  .shinetimer
    dw status_shinetimer
  .dashcounter
    dw status_dashcounter
  .shinetune
    dw status_shinetune
  .hspeed
    dw status_hspeed
  .dashspeed
    dw status_dashspeed
  .vspeed
    dw status_vspeed
  .iframecounter
    dw status_iframecounter
  .spikesuit
    dw status_spikesuit
  .xpos
    dw status_xpos
  .ypos
    dw status_ypos
  .camerapos
    dw status_camerapos
  .lagcounter
    dw status_lagcounter
  .cpuusage
    dw status_cpuusage
  .quickdrop
    dw status_quickdrop
  .walljump
    dw status_walljump
  .doublesbj
    dw status_doublesbj
  .countdamage
    dw status_countdamage
  .armpump
    dw status_armpump
  .pumpcounter
    dw status_pumpcounter
  .ceresridley
    dw status_ceresridley
  .doorskip
    dw status_doorskip
  .tacotank
    dw status_tacotank
  .pitdoor
    dw status_pitdoor
  .moondance
    dw status_moondance
  .kraidradar
    dw status_kraidradar
  .gateglitch
    dw status_gateglitch
  .moatcwj
    dw status_moatcwj
  .robotflush
    dw status_robotflush
  .shinetopb
    dw status_shinetopb
  .elevatorcf
    dw status_elevatorcf
  .botwooncf
    dw status_botwooncf
  .draygonai
    dw status_draygonai
  .snailclip
    dw status_snailclip
  .wasteland
    dw status_wasteland
  .ridleyai
    dw status_ridleyai
  .kihuntermanip
    dw status_kihuntermanip
  .downbackzeb
    dw status_downbackzeb
  .zebskip
    dw status_zebskip
  .mbhp
    dw status_mbhp
  .twocries
    dw status_twocries
  .ramwatch
    dw status_ramwatch
  .end

superhud_top_table:
  .off ; assumed to be zero index
    dw status_enemyhp_done
  .chargetimer
    dw topHUD_chargetimer
  .shottimer
    dw topHUD_shottimer
  .cooldown
    dw topHUD_cooldown
  .xfactor
    dw topHUD_xfactor
  .shinetimer
    dw topHUD_shinetimer
  .dashcounter
    dw topHUD_dashcounter
  .hspeed
    dw topHUD_hspeed
  .dashspeed
    dw topHUD_dashspeed
  .iframecounter
    dw topHUD_iframecounter
  .lagcounter
    dw status_lagcounter
  .cpuusage
    dw topHUD_cpuusage
  .itempercent
    dw topHUD_itempercent
  .reserves
    dw topHUD_reserves
  .statusicons
    dw topHUD_statusicons
  .tilecounter
    dw topHUD_tilecounter
  .end

superhud_middle_table:
  .off ; assumed to be zero index
    dw status_enemyhp_done
  .chargetimer
    dw middleHUD_chargetimer
  .shottimer
    dw middleHUD_shottimer
  .cooldown
    dw middleHUD_cooldown
  .xfactor
    dw middleHUD_xfactor
  .shinetimer
    dw middleHUD_shinetimer
  .dashcounter
    dw middleHUD_dashcounter
  .hspeed
    dw middleHUD_hspeed
  .dashspeed
    dw middleHUD_dashspeed
  .iframecounter
    dw middleHUD_iframecounter
  .lagcounter
    dw status_lagcounter
  .cpuusage
    dw middleHUD_cpuusage
  .itempercent
    dw middleHUD_itempercent
  .reserves
    dw middleHUD_reserves
  .statusicons
    dw middleHUD_statusicons
  .tilecounter
    dw middleHUD_tilecounter
  .end

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
    LDA !IH_BLANK : STA !HUD_TILEMAP+$14
    LDA #$003C : STA !ram_HUD_top
    RTS

  .pressedShot
    LDA #$0000 : STA !ram_HUD_top_counter

  .charging
    LDA #$003C : SEC : SBC !SAMUS_CHARGE_TIMER
    CMP !ram_HUD_top : BEQ .done
    STA !ram_HUD_top
    CMP #$0001 : BPL .drawCharge

    ; Beam charged
    LDA !IH_SHINESPARK : STA !HUD_TILEMAP+$16
    LDA !SAMUS_CHARGE_TIMER : SEC : SBC #$003C
    ASL : TAX
    LDA NumberGFXTable,X : STA !HUD_TILEMAP+$18
    RTS

  .drawCharge
    LDX #$0014 : JSR Draw3

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
    LDA !IH_BLANK : STA !HUD_TILEMAP+$54
    LDA #$003C : STA !ram_HUD_middle
    RTS

  .pressedShot
    LDA #$0000 : STA !ram_HUD_middle_counter

  .charging
    LDA #$003C : SEC : SBC !SAMUS_CHARGE_TIMER
    CMP !ram_HUD_middle : BEQ .done : STA !ram_HUD_middle
    CMP #$0001 : BPL .drawCharge

    ; Beam charged
    LDA !IH_SHINESPARK : STA !HUD_TILEMAP+$56
    LDA !SAMUS_CHARGE_TIMER : SEC : SBC #$003C
    ASL : TAX
    LDA NumberGFXTable,X : STA !HUD_TILEMAP+$58
    RTS

  .drawCharge
    LDX #$0054 : JSR Draw3

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

topHUD_cooldown:
{
    LDA !SAMUS_COOLDOWN : CMP !ram_HUD_top : BEQ .done : STA !ram_HUD_top
    LDX #$0014 : JSR Draw3

  .done
    RTS
}

middleHUD_cooldown:
{
    LDA !SAMUS_COOLDOWN : CMP !ram_HUD_middle : BEQ .done : STA !ram_HUD_middle
    LDX #$0054 : JSR Draw3

  .done
    RTS
}

topHUD_shinetimer:
{
    LDA !ram_armed_shine_duration : BNE .nonZero

    ; count up to 36 frames of shinespark being late
    LDA !ram_HUD_top_counter : CMP !SAFEWORD : BEQ .done
    CMP #$0024 : BPL .reset
    INC : STA !ram_HUD_top_counter
    ASL : TAX
    LDA NumberGFXTable,X : STA !HUD_TILEMAP+$14

    LDA !SAMUS_MOVEMENT_TYPE : AND #$00FF : CMP #$0002 : BEQ .late
    BRA .draw

  .reset
    LDA !IH_BLANK : STA !HUD_TILEMAP+$14
    BRA .draw

  .late
    ; arbitrary value indicating normal jumping pose already observed
    LDA !SAFEWORD : STA !ram_HUD_top_counter
    BRA .draw

  .nonZero
    LDA !IH_BLANK : STA !HUD_TILEMAP+$14
    LDA #$0000 : STA !ram_HUD_top_counter

  .draw
    LDA !ram_armed_shine_duration : CMP !ram_HUD_top : BEQ .done
    STA !ram_HUD_top
    LDX #$0016 : JSR Draw2

  .done
    RTS
}

middleHUD_shinetimer:
{
    LDA !ram_armed_shine_duration : BNE .nonZero

    ; count up to 36 frames of shinespark being late
    LDA !ram_HUD_middle_counter : CMP !SAFEWORD : BEQ .done
    CMP #$0024 : BPL .reset
    INC : STA !ram_HUD_middle_counter
    ASL : TAX
    LDA NumberGFXTable,X : STA !HUD_TILEMAP+$54

    LDA !SAMUS_MOVEMENT_TYPE : AND #$00FF : CMP #$0002 : BEQ .late
    BRA .draw

  .reset
    LDA !IH_BLANK : STA !HUD_TILEMAP+$54
    BRA .draw

  .late
    ; arbitrary value indicating normal jumping pose already observed
    LDA !SAFEWORD : STA !ram_HUD_middle_counter
    BRA .draw

  .nonZero
    LDA !IH_BLANK : STA !HUD_TILEMAP+$54
    LDA #$0000 : STA !ram_HUD_middle_counter

  .draw
    LDA !ram_armed_shine_duration : CMP !ram_HUD_middle : BEQ .done
    STA !ram_HUD_middle
    LDX #$0056 : JSR Draw2

  .done
    RTS
}

topHUD_dashcounter:
{
    LDA !SAMUS_DASH_COUNTER : AND #$00FF : CMP !ram_dash_counter : BEQ .done
    STA !ram_dash_counter
    ASL : TAX
    LDA HexGFXTable,X : STA !HUD_TILEMAP+$18

  .done
    RTS
}

middleHUD_dashcounter:
{
    LDA !SAMUS_DASH_COUNTER : AND #$00FF : CMP !ram_dash_counter : BEQ .done
    STA !ram_dash_counter
    ASL : TAX
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
    %a8()
    ; 16bit PPU multiplier, write twice
    STA $211B : XBA : STA $211B
    ; multiply by 100
    LDA #$64 : STA $211C
    %a16()
    ; multiplication result
    LDA $2134 : STA $4204
    %a8()
    ; divide by 225 lines
    LDA #$E1 : STA $4206
    %a16()
    PEA $0000 : PLA
    ; % CPU time consumed
    LDA $4214
    LDX #$0014 : JSR Draw2
    LDA !IH_PERCENT : STA !HUD_TILEMAP+$18
    RTS
}

middleHUD_cpuusage:
{
    LDA !ram_vcounter_data : AND #$00FF
    %a8()
    ; 16bit PPU multiplier, write twice
    STA $211B : XBA : STA $211B
    ; multiply by 100
    LDA #$64 : STA $211C
    %a16()
    ; multiplication result
    LDA $2134 : STA $4204
    %a8()
    ; divide by 225 lines
    LDA #$E1 : STA $4206
    %a16()
    PEA $0000 : PLA
    ; % CPU time consumed
    LDA $4214
    LDX #$0054 : JSR Draw2
    LDA !IH_PERCENT : STA !HUD_TILEMAP+$58
    RTS
}

topHUD_hspeed:
{
    ; subspeed + submomentum into high byte of Hspeed
    LDA !SAMUS_X_SUBRUNSPEED : CLC : ADC !SAMUS_X_SUBMOMENTUM
    AND #$F000 : STA $12

    ; speed + momentum + carry into low byte of Hspeed
    LDA !SAMUS_X_RUNSPEED : ADC !SAMUS_X_MOMENTUM
    AND #$00FF : ORA $12

    ; maybe skip drawing
    CMP !ram_HUD_top : BEQ .done
    STA !ram_HUD_top

    ; draw whole number in decimal
    AND #$00FF : ASL : TAY : LDA.w HexGFXTable,Y : STA !HUD_TILEMAP+$14
    LDA !IH_DECIMAL : STA !HUD_TILEMAP+$16

    ; draw fraction in hex
    LDA !ram_HUD_top : AND #$F000 : XBA : LSR #3 : TAY
    LDA.w HexGFXTable,Y : STA !HUD_TILEMAP+$18

  .done
    RTS
}

middleHUD_hspeed:
{
    ; subspeed + submomentum into high byte of Hspeed
    LDA !SAMUS_X_SUBRUNSPEED : CLC : ADC !SAMUS_X_SUBMOMENTUM
    AND #$F000 : STA $12

    ; speed + momentum + carry into low byte of Hspeed
    LDA !SAMUS_X_RUNSPEED : ADC !SAMUS_X_MOMENTUM
    AND #$00FF : ORA $12

    ; maybe skip drawing
    CMP !ram_HUD_middle : BEQ .done
    STA !ram_HUD_middle

    ; draw whole number in decimal
    AND #$00FF : ASL : TAY : LDA.w HexGFXTable,Y : STA !HUD_TILEMAP+$54
    LDA !IH_DECIMAL : STA !HUD_TILEMAP+$56

    ; draw fraction in hex
    LDA !ram_HUD_middle : AND #$F000 : XBA : LSR #3 : TAY
    LDA.w HexGFXTable,Y : STA !HUD_TILEMAP+$58

  .done
    RTS
}

topHUD_dashspeed:
{
    LDA !SAMUS_X_SUBRUNSPEED : AND #$F000 : STA $12
    LDA !SAMUS_X_RUNSPEED : AND #$00FF : ORA $12

    ; maybe skip drawing
    CMP !ram_HUD_top : BEQ .done
    STA !ram_HUD_top

    ; draw whole number in decimal
    AND #$00FF : ASL : TAY : LDA.w HexGFXTable,Y : STA !HUD_TILEMAP+$14
    LDA !IH_DECIMAL : STA !HUD_TILEMAP+$16

    ; draw fraction in hex
    LDA !ram_HUD_top : AND #$F000 : XBA : LSR #3 : TAY
    LDA.w HexGFXTable,Y : STA !HUD_TILEMAP+$18

  .done
    RTS
}

middleHUD_dashspeed:
{
    LDA !SAMUS_X_SUBRUNSPEED : AND #$F000 : STA $12
    LDA !SAMUS_X_RUNSPEED : AND #$00FF : ORA $12

    ; maybe skip drawing
    CMP !ram_HUD_middle : BEQ .done
    STA !ram_HUD_middle

    ; draw whole number in decimal
    AND #$00FF : ASL : TAY : LDA.w HexGFXTable,Y : STA !HUD_TILEMAP+$54
    LDA !IH_DECIMAL : STA !HUD_TILEMAP+$56

    ; draw fraction in hex
    LDA !ram_HUD_middle : AND #$F000 : XBA : LSR #3 : TAY
    LDA.w HexGFXTable,Y : STA !HUD_TILEMAP+$58

  .done
    RTS
}

topHUD_shottimer:
{
    LDA !IH_CONTROLLER_PRI_NEW : AND !IH_INPUT_SHOT : BEQ .inc
    LDA !ram_HUD_top_counter
    LDX #$0014 : JSR Draw3
    LDA #$0000 : STA !ram_HUD_top_counter

  .inc
    LDA !ram_HUD_top_counter : INC : STA !ram_HUD_top_counter
    RTS
}

middleHUD_shottimer:
{
    LDA !IH_CONTROLLER_PRI_NEW : AND !IH_INPUT_SHOT : BEQ .inc
    LDA !ram_HUD_middle_counter
    LDX #$0054 : JSR Draw3
    LDA #$0000 : STA !ram_HUD_middle_counter

  .inc
    LDA !ram_HUD_middle_counter : INC : STA !ram_HUD_middle_counter
    RTS
}

topHUD_itempercent:
{
    LDA !SAMUS_BEAMS_COLLECTED : CLC : ADC !SAMUS_HP_MAX : ADC !SAMUS_RESERVE_MAX
    ADC !SAMUS_MISSILES_MAX : ADC !SAMUS_SUPERS_MAX : ADC !SAMUS_PBS_MAX
    CMP !ram_HUD_top_counter : BEQ .checkMajors
    STA !ram_HUD_top_counter
    LDA !SAMUS_ITEMS_COLLECTED
    BRA .calculate

  .checkMajors
    LDA !SAMUS_ITEMS_COLLECTED : CMP !ram_HUD_top : BEQ .done

  .calculate
    STA !ram_HUD_top

    ; Max HP and Reserves
    LDA !SAMUS_HP_MAX : CLC : ADC !SAMUS_RESERVE_MAX
    JSR CalcEtank : STA $C1

    ; Max Missiles, Supers and Power Bombs
    LDA !SAMUS_MISSILES_MAX : CLC : ADC !SAMUS_SUPERS_MAX : ADC !SAMUS_PBS_MAX
    JSR CalcItem : CLC : ADC $C1 : STA $C1

    ; Collected items
    JSR CalcLargeItem : CLC : ADC $C1 : STA $C1

    ; Collected beams and charge
    JSR CalcBeams : CLC : ADC $C1

    ; Percent counter -> decimal form and drawn on HUD
    LDX #$0012 : JSR Draw3
    LDA !IH_PERCENT : STA !HUD_TILEMAP+$18

  .done
    RTS
}

middleHUD_itempercent:
{
    LDA !SAMUS_BEAMS_COLLECTED : CLC : ADC !SAMUS_HP_MAX : ADC !SAMUS_RESERVE_MAX
    ADC !SAMUS_MISSILES_MAX : ADC !SAMUS_SUPERS_MAX : ADC !SAMUS_PBS_MAX
    CMP !ram_HUD_middle_counter : BEQ .checkMajors
    STA !ram_HUD_middle_counter
    LDA !SAMUS_ITEMS_COLLECTED
    BRA .calculate

  .checkMajors
    LDA !SAMUS_ITEMS_COLLECTED : CMP !ram_HUD_middle : BEQ .done

  .calculate
    STA !ram_HUD_middle

    ; Max HP and Reserves
    LDA !SAMUS_HP_MAX : CLC : ADC !SAMUS_RESERVE_MAX
    JSR CalcEtank : STA $C1

    ; Max Missiles, Supers and Power Bombs
    LDA !SAMUS_MISSILES_MAX : CLC : ADC !SAMUS_SUPERS_MAX : ADC !SAMUS_PBS_MAX
    JSR CalcItem : CLC : ADC $C1 : STA $C1

    ; Collected items
    JSR CalcLargeItem : CLC : ADC $C1 : STA $C1

    ; Collected beams and charge
    JSR CalcBeams : CLC : ADC $C1

    ; Percent counter -> decimal form and drawn on HUD
    LDX #$0052 : JSR Draw3
    LDA !IH_PERCENT : STA !HUD_TILEMAP+$58

  .done
    RTS
}

topHUD_reserves:
{
    LDA !SAMUS_RESERVE_MAX : BEQ .noReserves
    CMP !ram_HUD_top : BEQ .checkReserves
    STA !ram_HUD_top
    LDA !SAMUS_RESERVE_ENERGY
    BRA .drawReserves

  .checkReserves
    LDA !SAMUS_RESERVE_ENERGY : CMP !ram_HUD_top_counter : BEQ .checkAuto

  .drawReserves
    STA !ram_HUD_top_counter
    LDX #$0014 : JSR Draw3

  .checkAuto
    LDA !SAMUS_RESERVE_MODE : CMP #$0001 : BEQ .autoOn
    LDA !IH_BLANK : STA !HUD_TILEMAP+$1A
    RTS

  .autoOn
    LDA !SAMUS_RESERVE_ENERGY : BEQ .autoEmpty
    LDA !IH_RESERVE_AUTO : STA !HUD_TILEMAP+$1A
    RTS

  .autoEmpty
    LDA !IH_RESERVE_EMPTY : STA !HUD_TILEMAP+$1A
    RTS

  .noReserves
    CMP !ram_HUD_top : BEQ .done
    STA !ram_HUD_top
    LDA !IH_BLANK
    STA !HUD_TILEMAP+$14 : STA !HUD_TILEMAP+$16
    STA !HUD_TILEMAP+$18 : STA !HUD_TILEMAP+$1A

  .done
    RTS
}

middleHUD_reserves:
{
    LDA !SAMUS_RESERVE_MAX : BEQ .noReserves
    CMP !ram_HUD_middle : BEQ .checkReserves
    STA !ram_HUD_middle
    LDA !SAMUS_RESERVE_ENERGY
    BRA .drawReserves

  .checkReserves
    LDA !SAMUS_RESERVE_ENERGY : CMP !ram_HUD_middle_counter : BEQ .checkAuto

  .drawReserves
    STA !ram_HUD_middle_counter
    LDX #$0054 : JSR Draw3

  .checkAuto
    LDA !SAMUS_RESERVE_MODE : CMP #$0001 : BEQ .autoOn
    LDA !IH_BLANK : STA !HUD_TILEMAP+$5A
    RTS

  .autoOn
    LDA !SAMUS_RESERVE_ENERGY : BEQ .autoEmpty
    LDA !IH_RESERVE_AUTO : STA !HUD_TILEMAP+$5A
    RTS

  .autoEmpty
    LDA !IH_RESERVE_EMPTY : STA !HUD_TILEMAP+$5A
    RTS

  .noReserves
    CMP !ram_HUD_middle : BEQ .done
    STA !ram_HUD_middle
    LDA !IH_BLANK
    STA !HUD_TILEMAP+$54 : STA !HUD_TILEMAP+$56
    STA !HUD_TILEMAP+$58 : STA !HUD_TILEMAP+$5A

  .done
    RTS
}

topHUD_statusicons:
{
    ; health bomb
    LDA !HEALTH_BOMB_FLAG : BEQ .clearHealthBomb
    LDA !SAMUS_HP : CMP #$0032 : BMI .inHealthBomb
    LDA !IH_LETTER_E : STA !HUD_TILEMAP+$14
    BRA .checkElevator

  .inHealthBomb
    LDA !IH_HEALTHBOMB : STA !HUD_TILEMAP+$14
    BRA .checkElevator

  .clearHealthBomb
    LDA !IH_BLANK : STA !HUD_TILEMAP+$14

    ; elevator
  .checkElevator
    LDA !ELEVATOR_PROPERTIES : BEQ .clearElevator
    LDA !IH_ELEVATOR : STA !HUD_TILEMAP+$16
    BRA .checkSpark

  .clearElevator
    LDA !IH_BLANK : STA !HUD_TILEMAP+$16

    ; shinespark
  .checkSpark
    LDA !SAMUS_SHINE_TIMER : BEQ .clearSpark
    LDA !IH_SHINESPARK : STA !HUD_TILEMAP+$18
    BRA .checkReserves

  .clearSpark
    LDA !IH_BLANK : STA !HUD_TILEMAP+$18

    ; reserve tank
  .checkReserves
    LDA !SAMUS_RESERVE_MODE : CMP #$0001 : BNE .clearReserve
    LDA !SAMUS_RESERVE_ENERGY : BEQ .empty
    LDA !SAMUS_RESERVE_MAX : BEQ .clearReserve
    LDA !IH_RESERVE_AUTO : STA !HUD_TILEMAP+$1A
    RTS

  .empty
    LDA !SAMUS_RESERVE_MAX : BEQ .clearReserve
    LDA !IH_RESERVE_EMPTY : STA !HUD_TILEMAP+$1A
    RTS

  .clearReserve
    LDA !IH_BLANK : STA !HUD_TILEMAP+$1A
    RTS
}

middleHUD_statusicons:
{
    ; health bomb
    LDA !HEALTH_BOMB_FLAG : BEQ .clearHealthBomb
    LDA !SAMUS_HP : CMP #$0032 : BMI .inHealthBomb
    LDA !IH_LETTER_E : STA !HUD_TILEMAP+$54
    BRA .checkElevator

  .inHealthBomb
    LDA !IH_HEALTHBOMB : STA !HUD_TILEMAP+$54
    BRA .checkElevator

  .clearHealthBomb
    LDA !IH_BLANK : STA !HUD_TILEMAP+$54

    ; elevator
  .checkElevator
    LDA !ELEVATOR_PROPERTIES : BEQ .clearElevator
    LDA !IH_ELEVATOR : STA !HUD_TILEMAP+$56
    BRA .checkSpark

  .clearElevator
    LDA !IH_BLANK : STA !HUD_TILEMAP+$56

    ; shinespark
  .checkSpark
    LDA !SAMUS_SHINE_TIMER : BEQ .clearSpark
    LDA !IH_SHINESPARK : STA !HUD_TILEMAP+$58
    BRA .checkReserves

  .clearSpark
    LDA !IH_BLANK : STA !HUD_TILEMAP+$58

    ; reserve tank
  .checkReserves
    LDA !SAMUS_RESERVE_MODE : CMP #$0001 : BNE .clearReserve
    LDA !SAMUS_RESERVE_ENERGY : BEQ .empty
    LDA !SAMUS_RESERVE_MAX : BEQ .clearReserve
    LDA !IH_RESERVE_AUTO : STA !HUD_TILEMAP+$5A
    RTS

  .empty
    LDA !SAMUS_RESERVE_MAX : BEQ .clearReserve
    LDA !IH_RESERVE_EMPTY : STA !HUD_TILEMAP+$5A
    RTS

  .clearReserve
    LDA !IH_BLANK : STA !HUD_TILEMAP+$5A
    RTS
}

topHUD_tilecounter:
{
    LDA !ram_map_counter : CMP !ram_HUD_top : BEQ .done : STA !ram_HUD_top
    LDX #$0014 : JSR Draw3

  .done
    RTS
}

middleHUD_tilecounter:
{
    LDA !ram_map_counter : CMP !ram_HUD_middle : BEQ .done : STA !ram_HUD_middle
    LDX #$0054 : JSR Draw3

  .done
    RTS
}

status_kihuntermanip:
{
    LDA !ROOM_ID : CMP.w #ROOM_RedKihunterShaft : BEQ .roomStairs

  .done
    RTS

  .roomStairs
    LDA !IH_BLANK : STA !HUD_TILEMAP+$8C : STA !HUD_TILEMAP+$90

    ; start with top kihunter, enemy0
    LDX #$0000

    ; Y position, check if below (greater than) Y = 500
    LDA !ENEMY_Y,X : CMP #$01F4 : BPL .topYSuccess
    LDA !IH_LETTER_N : STA !HUD_TILEMAP+$88 : STA !HUD_TILEMAP+$8A
    STA !HUD_TILEMAP+$8E : BRA .movementEnemy0

  .topYSuccess
    LDA !IH_LETTER_Y : STA !HUD_TILEMAP+$88

    ; X position, check if left of (less than) X = 168
    LDA !ENEMY_X,X : CMP #$00A8 : BMI .topXSuccess
    LDA !IH_LETTER_N : STA !HUD_TILEMAP+$8A
    BRA .movementEnemy0

  .topXSuccess
    LDA !IH_LETTER_Y : STA !HUD_TILEMAP+$8A

  .movementEnemy0
    ; check for change in enemy0 xpos
    LDA !ENEMY_X,X : CMP !ram_enemy0_last_xpos : BEQ .finishX0
    BMI .leftX0
    LDA !IH_ARROW_RIGHT : STA !HUD_TILEMAP+$16
    BRA .finishX0
  .leftX0
    LDA !IH_ARROW_LEFT : STA !HUD_TILEMAP+$16
  .finishX0
    LDA !ENEMY_X,X : STA !ram_enemy0_last_xpos

    ; check for change in enemy0 ypos
    LDA !ENEMY_Y,X : CMP !ram_enemy0_last_ypos : BEQ .finishY0
    BMI .upY0
    LDA !IH_ARROW_DOWN : STA !HUD_TILEMAP+$18
    BRA .finishY0
  .upY0
    LDA !IH_ARROW_UP : STA !HUD_TILEMAP+$18
  .finishY0
    LDA !ENEMY_Y,X : STA !ram_enemy0_last_ypos

    ; bottom kihunter, enemy4
    LDX #$0100

    ; Y position, check if below (greater than) Y = 790
    LDA !ENEMY_Y,X : CMP #$0316 : BPL .bottomYSuccess
    LDA !IH_LETTER_N : STA !HUD_TILEMAP+$8E : BRA .movementEnemy4

  .bottomYSuccess
    LDA !IH_LETTER_Y : STA !HUD_TILEMAP+$8E

  .movementEnemy4
    ; check for change in enemy4 xpos
    LDA !ENEMY_X,X : CMP !ram_enemy4_last_xpos : BEQ .finishX4
    BMI .leftX4
    LDA !IH_ARROW_RIGHT : STA !HUD_TILEMAP+$56
    BRA .finishX4
  .leftX4
    LDA !IH_ARROW_LEFT : STA !HUD_TILEMAP+$56
  .finishX4
    LDA !ENEMY_X,X : STA !ram_enemy4_last_xpos

    ; check for change in enemy4 ypos
    LDA !ENEMY_Y,X : CMP !ram_enemy4_last_ypos : BEQ .finishY4
    BMI .upY4
    LDA !IH_ARROW_DOWN : STA !HUD_TILEMAP+$58
    BRA .finishY4
  .upY4
    LDA !IH_ARROW_UP : STA !HUD_TILEMAP+$58
  .finishY4
    LDA !ENEMY_Y,X : STA !ram_enemy4_last_ypos

    RTS
}

status_kraidradar:
{
    LDA !ROOM_ID : CMP.w #ROOM_Kraid : BNE .skip

    ; stop tracking when Kraid takes damage
    LDA !ENEMY_HP : CMP #$03E8 : BEQ .setup

  .skip
    RTS

  .setup
    LDA !SAMUS_HP : STA !ram_last_hp ; suppress Samus HP
    LDA !IH_BLANK : STA !HUD_TILEMAP+$88 : STA !HUD_TILEMAP+$8A ; clear space on HUD
    STA !HUD_TILEMAP+$8C : STA !HUD_TILEMAP+$8E : STA !HUD_TILEMAP+$90
    STA !HUD_TILEMAP+$92 : STA !HUD_TILEMAP+$94 : STA !HUD_TILEMAP+$96
    STA !HUD_TILEMAP+$98

    ; Detect and draw Samus first
    ; check if sweet spot (2 missile KQK using bomb setup)
    LDY !SAMUS_X : CPY #$004B : BEQ .greenSamus
    LDA !IH_MORPH_BALL_YELLOW
    BRA .checkSamusX

  .greenSamus
    LDA !IH_MORPH_BALL_GREEN

  .checkSamusX
    CPY #$0060 : BPL .samusXrightSide
    CPY #$0030 : BMI .samusXpos1
    CPY #$0040 : BMI .samusXpos2
    CPY #$0050 : BMI .samusXpos3
    STA !HUD_TILEMAP+$92
    BRA .checkEnemies
  .samusXpos1
    STA !HUD_TILEMAP+$8C
    BRA .checkEnemies
  .samusXpos2
    STA !HUD_TILEMAP+$8E
    BRA .checkEnemies
  .samusXpos3
    STA !HUD_TILEMAP+$90
    BRA .checkEnemies
  .samusXrightSide
    CPY #$0070 : BMI .samusXpos5
    CPY #$0080 : BMI .samusXpos6
    STA !HUD_TILEMAP+$98
    BRA .checkEnemies
  .samusXpos5
    STA !HUD_TILEMAP+$94
    BRA .checkEnemies
  .samusXpos6
    STA !HUD_TILEMAP+$96

    ; Detect stuff
  .checkEnemies
    ; Enemy 6 (good fingernail)
    LDX #$0180

    ; Y position, check if Y < 624
    LDA !ENEMY_Y,X : CMP #$0270 : BCC .enemy6X
    LDA #$FFFF : STA !ram_radar6 : BRA .checkEnemy7

  .enemy6X
    ; check X position, set position bit on radar
    LDA #$0000
    LDY !ENEMY_X,X
    CPY #$0020 : BMI .enemy6X_store
    INC
    CPY #$0030 : BMI .enemy6X_store
    INC
    CPY #$0040 : BMI .enemy6X_store
    INC
    CPY #$0050 : BMI .enemy6X_store
    INC
    CPY #$0060 : BMI .enemy6X_store
    INC
    CPY #$0070 : BMI .enemy6X_store
    INC
    CPY #$0080 : BMI .enemy6X_store
    INC
  .enemy6X_store
    ASL : STA !ram_radar6

    ; check if Y position is moving up or down
    LDA !ENEMY_Y,X : CMP !ram_enemy6_last_ypos : BCC .enemy6Y_movingUp
    STA !ram_enemy6_last_ypos
    ; check if Y position is high or low, Y < 594
    CMP #$0252 : BCC .enemy6YHigh_movingDown
    LDA !ram_radar6 : ORA #$0800
    BRA .enemy6Y_store
  .enemy6YHigh_movingDown
    LDA !ram_radar6 : ORA #$0400
    BRA .enemy6Y_store

  .enemy6Y_movingUp
    STA !ram_enemy6_last_ypos
    ; check if Y position is high or low, Y < 594
    CMP #$0252 : BCC .enemy6YHigh_movingUp
    LDA !ram_radar6 : AND #$00FF : ORA #$0200 : BRA .enemy6Y_store
  .enemy6YHigh_movingUp
    LDA !ram_radar6 : AND #$00FF : ORA #$0100
  .enemy6Y_store
    STA !ram_radar6

  .checkEnemy7
    ; Enemy 7 (bad fingernail)
    LDX #$01C0

    ; Y position, check if Y < 624
    LDA !ENEMY_Y,X : CMP #$0270 : BCC .enemy7X
    LDA #$FFFF : STA !ram_radar7
    BRA .drawEnemy6

  .enemy7X
    ; check X position, set position bit on radar
    LDA #$0000
    LDY !ENEMY_X,X
    CPY #$0020 : BMI .enemy7X_store : INC
    CPY #$0030 : BMI .enemy7X_store : INC
    CPY #$0040 : BMI .enemy7X_store : INC
    CPY #$0050 : BMI .enemy7X_store : INC
    CPY #$0060 : BMI .enemy7X_store : INC
    CPY #$0070 : BMI .enemy7X_store : INC
    CPY #$0080 : BMI .enemy7X_store : INC
  .enemy7X_store
    ASL : STA !ram_radar7

    ; check if Y position is moving up or down
    LDA !ENEMY_Y,X : CMP !ram_enemy7_last_ypos : BCC .enemy7Y_movingUp
    STA !ram_enemy7_last_ypos
    ; check if Y position is high or low, Y < 594
    CMP #$0252 : BCC .enemy7YHigh_movingDown
    LDA !ram_radar7 : ORA #$0800
    BRA .enemy7Y_store
  .enemy7YHigh_movingDown
    LDA !ram_radar7 : ORA #$0400
    BRA .enemy7Y_store

  .enemy7Y_movingUp
    STA !ram_enemy7_last_ypos
    ; check if Y position is high or low, Y < 594
    CMP #$0252 : BCC .enemy7YHigh_movingUp
    LDA !ram_radar7 : AND #$00FF : ORA #$0200
    BRA .enemy7Y_store
  .enemy7YHigh_movingUp
    LDA !ram_radar7 : AND #$00FF : ORA #$0100
  .enemy7Y_store
    STA !ram_radar7

; Draw stuff
; Don't draw the enemy if first nibble is non-zero
; Second bit determines arrow direction and color:
; 8 = far away moving down, 4 = close moving down
; 2 = far away moving up, 1 = close moving up
; Low byte contains the position offset
; The bottom-left tile of the HUD is unused
  .drawEnemy6
    ; Enemy 6 (good fingernail)
    LDA !ram_radar6 : BIT #$F000 : BNE .drawEnemy7
    AND #$00FF : TAX
    LDA !ram_radar6 : AND #$0F00 : CMP #$0800 : BEQ .farDown6
    CMP #$0400 : BEQ .closeDown6
    CMP #$0200 : BEQ .farUp6

    LDA !IH_ARROW_UP_PINK_OUTLINE : STA !HUD_TILEMAP+$8A,X
    BRA .drawEnemy7
  .farUp6
    LDA !IH_ARROW_UP : STA !HUD_TILEMAP+$8A,X
    BRA .drawEnemy7
  .closeDown6
    LDA !IH_ARROW_DOWN_PINK_OUTLINE : STA !HUD_TILEMAP+$8A,X
    BRA .drawEnemy7
  .farDown6
    LDA !IH_ARROW_DOWN : STA !HUD_TILEMAP+$8A,X

  .drawEnemy7
    ; Enemy 7 (bad fingernail)
    LDA !ram_radar7 : AND #$F000 : BNE .done
    AND #$00FF : TAX
    LDA !ram_radar7 : AND #$0F00 : CMP #$0800 : BEQ .farDown7
    CMP #$0400 : BEQ .closeDown7
    CMP #$0200 : BEQ .farUp7

    LDA !IH_ARROW_UP_RED : STA !HUD_TILEMAP+$8A,X
    BRA .done
  .farUp7
    LDA !IH_ARROW_UP_GREY : STA !HUD_TILEMAP+$8A,X
    BRA .done
  .closeDown7
    LDA !IH_ARROW_DOWN_RED : STA !HUD_TILEMAP+$8A,X
    BRA .done
  .farDown7
    LDA !IH_ARROW_DOWN_GREY : STA !HUD_TILEMAP+$8A,X

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
    LDA !ROOM_ID : CMP.w #ROOM_MotherBrain : BNE .end

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
    LDA !ROOM_ID : CMP.w #ROOM_Pit : BNE .done
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
    LDA !ROOM_ID : CMP.w #ROOM_Draygon : BNE .done

    ; load AI pointer and check if it matches the HUD
    LDA !ENEMY_FUNCTION_POINTER : CMP !ram_HUD_check : BNE .update_HUD

    ; update enemy HP on idle frames
    JMP status_enemyhp

  .done
    RTS

  .update_HUD
    STA !ram_HUD_check

    %ai8()
    ; use high byte of pointer to index prefix table
    XBA : SEC : SBC #$87 : BCC .unknown
    TAX : LDA.l DraygonAI_prefix_table,X : TAX
    %a16()

    LDA !ENEMY_FUNCTION_POINTER ; reload AI pointer
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
if !FEATURE_PAL
    dw $872B, $879B                      ; [$00+6] 87
    dw $8804, $88C1                      ; [$04+2] 88
    dw $8932, $8961, $89C3               ; [$08+6] 89
    dw $8A10, $8A60, $8AA0               ; [$0E+6] 8A
    dw $8B1A, $8B62, $8BBE               ; [$14+6] 8B
    dw $8C43, $8C9E, $8CE4               ; [$1A+6] 8C
    dw $8D40, $8DC2                      ; [$20+4] 8D
    dw $8E29                             ; [$24+2] 8E
    dw $8F20, $8F2D, $8F2E, $8FE6        ; [$26+8] 8F
    dw $90E4                             ; [$2E+2] 90
    dw $9115, $9134, $9138, $9164, $9195 ; [$30+A] 91
    dw $92A4, $92BB                      ; [$3A+4] 92
                                         ; 93  ->  END
    dw $94B9                             ; [$3E+2] 94
else
    dw $871B, $878B, $87F4               ; [$00+6] 87
    dw $88B1                             ; [$06+2] 88
    dw $8922, $8951, $89B3               ; [$08+6] 89
    dw $8A00, $8A50, $8A90               ; [$0E+6] 8A
    dw $8B0A, $8B52, $8BAE               ; [$14+6] 8B
    dw $8C33, $8C8E, $8CD4               ; [$1A+6] 8C
    dw $8D30, $8DB2                      ; [$20+4] 8D
    dw $8E19                             ; [$24+2] 8E
    dw $8F10, $8F1D, $8F1E, $8FD6        ; [$26+8] 8F
    dw $90D4                             ; [$2E+2] 90
    dw $9105, $9124, $9128, $9154, $9185 ; [$30+A] 91
    dw $9294, $92AB                      ; [$3A+4] 92
                                         ; 93  ->  END
    dw $94A9                             ; [$3E+2] 94
endif

DraygonAI_prefix_table:
; Table to skip ahead to the correct entries based on the high byte
; Unused entries are filled with $40 (the last element in the table) to finish the search faster
if !FEATURE_PAL
    ;   87   88   89   8A   8B   8C   8D   8E   8F   90   91   92        94
    db $00, $04, $08, $0E, $14, $1A, $20, $24, $26, $2E, $30, $3A, $40, $3E
    db $40, $40, $40, $40, $40, $40, $40, $40, $40, $40, $40, $40, $40, $40 ; up to A1
else
    ;   87   88   89   8A   8B   8C   8D   8E   8F   90   91   92        94
    db $00, $06, $08, $0E, $14, $1A, $20, $24, $26, $2E, $30, $3A, $40, $3E
    db $40, $40, $40, $40, $40, $40, $40, $40, $40, $40, $40, $40, $40, $40 ; up to A1
endif

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
    dw #DraygonAIText_UNKN ; UNKNOWN

DraygonAIText:
%table(HUDfont)
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
%table(normal)
}

%endfree(F0)
