;=======================================================
;InfoHUD timers and stuff
;=======================================================

org $809490
    jmp $9497    ; skip resetting player 2 inputs

org $8094DF
    plp            ; patch out resetting of controller 2 buttons and enable debug mode
    rtl

org $828B4B        ; disable debug functions
    JML ih_debug_patch

org $809B51
    JMP $9BFB    ;skip drawing auto reserve icon and normal energy numbers and tanks during HUD routine

org $82AED9      ;routine to draw auto reserve icon on HUD from equip screen
    NOP : NOP : NOP

org $82AEAF      ;routine to remove auto reserve icon on HUD from equip screen
    NOP : NOP : NOP

org $828115
    JSL ih_max_etank_code

org $90A91B      ;minimap drawing routine
    RTL

org $90A8EF      ;minimap update during HUD loading
    ; Make sure it only runs when you start a new game
    LDA $0998 : AND #$00FF : CMP #$0006 : BNE +
    JSL reset_all_counters
    +
    RTL

org $90E6AA      ;hijack, runs on gamestate = 08 (main gameplay), handles most updating HUD information
    JSL ih_gamemode_frame : NOP : NOP

org $9493FB      ;hijack, runs when Samus hits a door BTS
    JSL ih_before_room_transition

org $9493B8      ;hijack, runs when Samus hits a door BTS
    JSL ih_before_room_transition

org $82E764      ;hijack, runs when Samus is coming out of a room transition
    JSL ih_after_room_transition : RTS

org $90F1E4      ;hijack, runs when an elevator is activated
    JSL ih_elevator_activation

org $90A7F7      ;skip drawing minimap grid when entering boss rooms
    BRA FinishDrawMinimap

org $90A80A      ;normally runs after minimap grid has been drawn
    FinishDrawMinimap:
    LDA $179C

org $809B4C      ;hijack, HUD routine (game timer by Quote58)
    JSL ih_hud_code : NOP

org $82894F      ;hijack, main game loop: runs EVERY frame (used for room transition timer)
    JSL ih_game_loop_code

org $84889F      ;hijack, runs every time an item is picked up
    JSL ih_get_item_code

org $91DAD8      ;hijack, runs after a shinespark has been charged
    JSL ih_shinespark_code

org $8095fc         ;hijack, end of NMI routine to update realtime frames
    JML ih_nmi_end

org $A98874         ; update seg timer after MB1 fight
    JSL ih_mb1_segment

org $A9BE23         ; update seg timer when baby spawns (off-screen) in MB2 fight
    JSL ih_mb2_segment

org $A6A17C         ;Ridley AI init, overwrites a junk LDA
    JSR ResetCountDamageRid

org $A6FEBC          ; free space
ResetCountDamageRid:
{
    LDA #$0000
    STA !ram_countdamage : STA !sram_countdamage
    RTS
}

org $A7CE64         ;Phantoon AI init
    JSR ResetCountDamagePhan

org $A7FF90         ; free space
ResetCountDamagePhan:
{
    LDA #$0000
    STA $0F90,X     ;we overwrote this instruction (was STZ) to get here
    STA !ram_countdamage : STA !sram_countdamage
    RTS
}

org $A0A866         ; hijack damage routine to count total damage dealt
    JSR CountDamage

org $A0F9E0         ; count damage in free space at end of bank
CountDamage:
{
    CLC : LDA !ram_countdamage : ADC $187A
    STA !sram_countdamage : STA !ram_countdamage
    LDA $0F8C,X : SEC : SBC $187A : RTS
}

org $948F49        ; RTS this routine to enable walk through walls
    JSR NoClip
    RTS

org $A6F135
    JSR SteamCollision

org $9AB200         ; graphics for HUD
incbin ../resources/hudgfx.bin


; Main bank stuff
org $DFE000
print pc, " infohud start"
ih_max_etank_code:
{
    ; Reset max-etanks value
    LDA #$0000 : STA !ram_max_etanks
    LDA $7EC200,X
    RTL
}

ih_debug_patch:
{
    LDA $05D1
    BNE +
    JML $828B54
+   JSL $B49809
    JML $828B4F
}

ih_nmi_end:
{
    %ai16()

    LDA !ram_realtime_room : INC : STA !ram_realtime_room

    ; Segment real timer
    {
        LDA !ram_seg_rt_frames : INC : STA !ram_seg_rt_frames : CMP.w #60 : BNE +
        LDA #$0000 : STA !ram_seg_rt_frames
        LDA !ram_seg_rt_seconds : INC : STA !ram_seg_rt_seconds : CMP.w #60 : BNE +
        LDA #$0000 : STA !ram_seg_rt_seconds
        LDA !ram_seg_rt_minutes : INC : STA !ram_seg_rt_minutes
        +
    }

    LDA !ram_slowdown_mode : BNE +

    JMP .done

+   CMP #$FFFF
    BEQ .pause

    LDA !ram_slowdown_frames : BNE .delay
    LDA !ram_slowdown_mode : STA !ram_slowdown_frames
    LDA !ram_slowdown_controller_1 : STA !IH_CONTROLLER_PRI_PREV
    LDA !ram_slowdown_controller_2 : STA !IH_CONTROLLER_SEC_PREV

    JSL $809459
    JMP .done

  .delay
    CMP !ram_slowdown_mode : BNE +

    LDA !IH_CONTROLLER_PRI : EOR !IH_CONTROLLER_PRI_NEW : STA !ram_slowdown_controller_1
    LDA !IH_CONTROLLER_SEC : EOR !IH_CONTROLLER_SEC_NEW : STA !ram_slowdown_controller_2

    LDA !ram_slowdown_frames

+   DEC : STA !ram_slowdown_frames

    %a8() : LDA #$01 : STA $05B4 : %a16()
    JMP .done

  .pause
    LDA !ram_slowdown_frames : BNE +

    INC : STA !ram_slowdown_frames
    LDA !IH_CONTROLLER_PRI : EOR !IH_CONTROLLER_PRI_NEW : STA !ram_slowdown_controller_1
    LDA !IH_CONTROLLER_SEC : EOR !IH_CONTROLLER_SEC_NEW : STA !ram_slowdown_controller_2

+   LDA !IH_CONTROLLER_SEC_NEW : CMP !IH_PAUSE : BEQ .frameAdvance

    CMP !IH_RESET : BNE +

    LDA #$0000 : STA !ram_slowdown_mode : STA !ram_slowdown_frames
    JMP .done

+   %a8() : LDA #$01 : STA $05B4 : %a16()
    JMP .done

  .frameAdvance
    LDA #$0000 : STA !ram_slowdown_frames
    LDA !ram_slowdown_controller_1 : STA $97
    LDA !ram_slowdown_controller_2 : STA $99
    JSL $809459

  .done
    PLY
    PLX
    PLA
    PLD
    PLB
    RTI
}

ih_gamemode_frame:
{
    PHA
    LDA !ram_gametime_room : CMP #$EA5F : BEQ +
    INC : STA !ram_gametime_room

+   PLA
    ; overwritten code
    STZ $0A30
    STZ $0A32
    RTL
}

ih_after_room_transition:
{
    PHX
    PHY

    LDA !ram_transition_counter : STA !ram_last_door_lag_frames
    LDA #$0000 : STA !ram_transition_flag

    ; Update HUD
    JSL ih_update_hud_code

    ; Reset gametime/transition timer
    LDA #$0000 : STA !ram_transition_counter

    ; Reset realtime timer
    LDA #$0000 : STA !ram_realtime_room

    PLY
    PLX

    ; original hijacked code
    LDA #$0008
    STA $0998
    RTL
}

ih_before_room_transition:
{
    PHA
    PHX
    PHY

    ; save and reset timers
    LDA !ram_transition_flag : CMP #$0001 : BEQ .done
    LDA #$0001 : STA !ram_transition_flag
    LDA #$0000 : STA !ram_room_has_set_rng

    ; Lag
    LDA !ram_realtime_room : SEC : SBC !ram_transition_counter : STA !ram_last_room_lag
    LDA #$0000 : STA !ram_transition_counter

    ; Gametime
    LDA !ram_gametime_room : STA !ram_last_gametime_room
    LDA #$0000 : STA !ram_gametime_room

    ; Realtime
    LDA !ram_realtime_room : STA !ram_last_realtime_room
    LDA #$0000 : STA !ram_realtime_room

    ; Save temp variables
    LDA $12 : PHA
    LDA $14 : PHA

    ; Update HUD
    JSL ih_update_hud_code

    ; Restore temp variables
    PLA : STA $14
    PLA : STA $12

  .done
    ; Run standard code and return
    PLY
    PLX
    PLA
    STA $0998
    CLC
    RTL
}

ih_elevator_activation:
{
    PHA
    ; Only update if we're in a room and activate an elevator.
    ; Otherwise this will also run when you enter a room already riding one.
    LDA $0998 : CMP #$0008 : BNE .done

    JSL ih_update_hud_early

  .done
    PLA
    STZ $0A56
    SEC
    RTL
}

ih_mb1_segment:
{
    ; runs during MB1 cutscene when you regain control of Samus, just before music change
    JSL $90F084    ; we overwrote this instruction to get here

    JSL ih_update_hud_early
    RTL
}

ih_mb2_segment:
{
    ; runs during baby spawn routine for MB2
    STA $7E7854    ; we overwrote this instruction to get here

    JSL ih_update_hud_early
    RTL
}

ih_update_hud_code:
{
    PHX
    PHY
    PHP
    PHB

    ; Bank 80
    PEA $8080 : PLB : PLB

    LDA #$FFFF : STA !ram_last_hp : STA !ram_enemy_hp

    LDA !sram_frame_counter_mode : BNE .ingameRoom

    ; Real time
    {
        ; Divide real time by 60, save seconds, frame seperately
        {
            STZ $4205
            LDA !ram_last_realtime_room : STA $4204
            %a8()
            LDA #$3C : STA $4206
            PHA : PLA : PHA : PLA
            %a16()
            LDA $4214 : STA !ram_tmp_1
            LDA $4216 : STA !ram_tmp_2
        }

        ; Draw seconds
        LDA !ram_tmp_1 : JSR Hex2Dec : LDX #$003C : JSR Draw3

        ; Draw decimal seperator
        LDA #$0CCB : STA $7EC642

        ; Draw frames
        LDA !ram_tmp_2 : ASL : TAX
        LDA HexToNumberGFX1, X : STA $7EC644
        LDA HexToNumberGFX2, X : STA $7EC646

        BRA .pct
    }

    ; Room time
    .ingameRoom
    {
        ; Divide game time by 60, save seconds, frames seperately
        {
            STZ $4205
            LDA !ram_last_gametime_room : STA $4204
            %a8()
            LDA #$3C : STA $4206
            PHA : PLA : PHA : PLA
            %a16()
            LDA $4214 : STA !ram_tmp_3
            LDA $4216 : STA !ram_tmp_4
        }

        ; Draw seconds
        LDA !ram_tmp_3 : JSR Hex2Dec : LDX #$003C : JSR Draw3

        ; Draw decimal seperator
        LDA #$0CCB : STA $7EC642

        ; Draw frames
        LDA !ram_tmp_4 : ASL : TAX
        LDA HexToNumberGFX1, X : STA $7EC644
        LDA HexToNumberGFX2, X : STA $7EC646
    }

    ; Draw Item percent
    .pct
    {
        LDA !sram_display_mode : DEC : BEQ .skipPercent
        LDA #$0000 : STA !ram_pct_1

        ; Max HP (E tanks)
        LDA $09C4 : SEC : SBC #$0063 : CLC : INC : JSR CalcEtank : LDA $4214 : STA !ram_etanks

        ; Max Reserve Tanks
        LDA $09D4 : JSR CalcEtank

        ; Max Missiles, Supers & Power Bombs
        LDA $09C8 : CLC : ADC $09CC : CLC : ADC $09D0 : JSR CalcItem

        ; Collected items
        JSR CalcLargeItem

        ; Collected beams & charge
        JSR CalcBeams

        ; Percent counter -> decimal form and drawn on HUD
        LDA !ram_pct_1 : JSR Hex2Dec : LDX #$0012 : JSR Draw3

        ; Percent symbol on HUD
        LDA #$0C0A : STA $7EC618
    }

    ; E-tanks
    LDA !ram_etanks : JSR Hex2Dec : LDX #$0054 : JSR Draw3

    .skipPercent
    ; Lag
    LDA !ram_last_room_lag : JSR Hex2Dec : LDX #$0082 : JSR Draw3

    ; Skip door lag and segment timer when shinetune enabled
    LDA !sram_display_mode : CMP #$0007 : BEQ .end

    ; Door lag
    LDA !ram_last_door_lag_frames : JSR Hex2Dec : LDX #$00C2 : JSR Draw3

    ; Segment timer
    {
        LDA !sram_frame_counter_mode : BNE .ingameSeg
        LDA.w #!ram_seg_rt_frames : STA $00
        LDA #$007F : STA $02
        BRA .drawSeg

      .ingameSeg
        LDA #$09DA : STA $00
        LDA #$007E : STA $02

      .drawSeg
        ; Frames
        LDA [$00] : INC $00 : INC $00 : ASL : TAX
        LDA HexToNumberGFX1, X : STA $7EC6BC
        LDA HexToNumberGFX2, X : STA $7EC6BE

        ; Seconds
        LDA [$00] : INC $00 : INC $00 : ASL : TAX
        LDA HexToNumberGFX1, X : STA $7EC6B6
        LDA HexToNumberGFX2, X : STA $7EC6B8

        ; Minutes
        LDA [$00] : JSR Hex2Dec : LDX #$00AE : JSR Draw3

        ; Draw decimal seperators
        LDA #$0CCB : STA $7EC6B4 : STA $7EC6BA
    }

    .end
    PLB
    PLP
    PLY
    PLX

    RTL
}

ih_update_hud_early:
{
    PHA
    PHX
    PHY

    ; calculate lag frames
    LDA !ram_realtime_room : SEC : SBC !ram_transition_counter : STA !ram_last_room_lag

    LDA !ram_gametime_room : STA !ram_last_gametime_room
    LDA !ram_realtime_room : STA !ram_last_realtime_room

    ; save temp variables
    LDA $12 : PHA
    LDA $14 : PHA

    ; Update HUD
    JSL ih_update_hud_code

    ; restore temp variables
    PLA : STA $14
    PLA : STA $12

    ; Run standard code and return
    PLY
    PLX
    PLA
}

ih_hud_code:
{
    %ai16()

    ; fix data bank register
    PHB
    PEA $8080
    PLB
    PLB

    ; -- input display--
    ; -- check if we want to update --
    LDA !IH_CONTROLLER_PRI : CMP !ram_ih_controller : BEQ .status_display

    ; -- read input
    TAY
    LDX #$0000;

-   TYA
    AND ControllerTable1, X
    BEQ +
    LDA ControllerGfx1, X
    JMP ++
+   LDA #$2C0F
++  STA $7EC608, X
    INX
    INX
    CPX #$00C
    BNE -

    LDX #$0000;

-   TYA
    AND ControllerTable2, X
    BEQ +
    LDA ControllerGfx2, X
    JMP ++
+   LDA #$2C0F
++  STA $7EC648, X
    INX
    INX
    CPX #$000C
    BNE -

    TYA
    STA !ram_ih_controller

  .status_display
    LDA !sram_display_mode : ASL : TAX
    JSR (.status_display_table,X)

    ; Samus' HP
    LDA #$0C0E : STA $7EC690 ; erase stale decimal tile
    LDA $09C2 : CMP !ram_last_hp : BEQ .end : STA !ram_last_hp
    JSR Hex2Dec : LDX #$0092 : JSR Draw4
    LDA #$0C0E : STA $7EC690 ; erase stale decimal tile

  .end
    PLB
    ; overwritten code
    REP #$30
    LDA $7E09C0
    RTL

  .status_display_table
    dw status_enemyhp
    dw status_roomstrat
    dw status_chargetimer
    dw status_xfactor
    dw status_cooldowncounter
    dw status_shinetimer
    dw status_dashcounter
    dw status_shinefinetune
    dw status_iframecounter
    dw status_spikesuit
    dw status_lagcounter
    dw status_xpos
    dw status_ypos
    dw status_hspeed
    dw status_vspeed
    dw status_quickdrop
    dw status_walljump
    dw status_shottimer
    dw status_countdamage
    dw status_ridleygrab
    dw status_ramwatch
}

status_roomstrat:
{
    LDA !sram_room_strat : ASL : TAX
    JSR (.status_room_table,X)
    RTS

  .status_room_table
    dw status_mbhp
    dw status_moatcwj
    dw status_shinetopb
    dw status_botwooncf
    dw status_elevatorcf
    dw status_robotflush
    dw status_kihuntermanip
}

status_shinetimer:
{
    LDA !ram_armed_shine_duration : CMP !ram_shine_counter : BEQ .done
    STA !ram_shine_counter : CMP #$0000 : BNE .charge : LDA #$00B4

  .charge
    JSR Hex2Dec : LDX #$0088 : JSR Draw4

  .done
    RTS
}

status_shinetopb:
{
    LDA $09C2 : STA !ram_last_hp
    LDA !ram_armed_shine_duration : CMP !ram_shine_counter : BEQ .clearcounter
    STA !ram_shine_counter : CMP #$0000 : BNE .charge : LDA #$00B4

  .charge
    JSR Hex2Dec : LDX #$0088 : JSR Draw4
    LDA !ram_roomstrat_counter : CMP #$FFFF : BEQ .clearpb
    CMP $09CE : BNE .drawpb

  .done
    RTS

  .clearcounter
    CMP #$00B4 : BNE .done
    LDA #$FFFF : STA !ram_roomstrat_counter
    RTS

  .clearpb
    LDA #$0057 : STA $7EC692 : STA $7EC694 : STA $7EC696 : STA $7EC698
    BRA .setcounter

  .drawpb
    LDA !ram_armed_shine_duration : JSR Hex2Dec : LDX #$0092 : JSR Draw4

  .setcounter
    LDA $09CE : STA !ram_roomstrat_counter
    RTS
}

status_botwooncf:
{
    LDA !ram_roomstrat_counter : CMP $09CE : BNE .pbcheck
    LDA !ram_roomstrat_state : CMP #$0000 : BEQ .setxy
    CMP #$0020 : BMI .inc
    LDA $0AF6 : CMP !ram_xpos : BNE .inc
    LDA $0AFA : CMP #$00B7 : BNE .inc
    LDA $0B2E : CMP #$0000 : BNE .inc
    LDA $0B2C : CMP #$0000 : BNE .inc
    LDA #$0C67 : STA $7EC68A
    BRA .timecheck

  .pbcheck
    LDA !ram_ypos : CMP #$00B7 : BEQ .startpb
    LDA #$0057 : STA $7EC688
    BRA .setpb

  .startpb
    LDA #$0001 : STA !ram_roomstrat_state
    LDA #$0C67 : STA $7EC688

  .setpb
    LDA $09CE : STA !ram_roomstrat_counter
    LDA #$0057 : STA $7EC68A : STA $7EC68C : STA $7EC68E
    RTS

  .setxy
    LDA $0AF6 : STA !ram_xpos
    LDA $0AFA : STA !ram_ypos
    RTS

  .inc
    LDA !ram_roomstrat_state : CMP #$00C0 : BPL .reset
    INC : STA !ram_roomstrat_state
    RTS

  .early
    LDA #$0099 : SEC : SBC !ram_roomstrat_state : CMP #$000A : BPL .earlymiss
    ASL A : TAY : LDA.w NumberGFXTable,Y : STA $7EC68E

  .earlyprint
    LDA #$0C6C : STA $7EC68C
    BRA .inc

  .timecheck
    LDA !ram_roomstrat_state : CMP #$0099 : BEQ .frameperfect : BMI .early
    SEC : SBC #$0099 : CMP #$000A : BPL .latemiss
    ASL A : TAY : LDA.w NumberGFXTable,Y : STA $7EC68E

  .lateprint
    LDA #$0C68 : STA $7EC68C

  .reset
    LDA #$0000 : STA !ram_roomstrat_state
    RTS

  .earlymiss
    LDA #$0C66 : STA $7EC68E
    BRA .earlyprint

  .latemiss
    LDA #$0C66 : STA $7EC68E
    BRA .lateprint

  .frameperfect
    LDA #$0C67 : STA $7EC68C : STA $7EC68E
    BRA .reset
}

status_elevatorcf:
{
    LDA !ram_roomstrat_counter : CMP $09CE : BNE .roomcheck
    LDA !ram_roomstrat_state : CMP #$0000 : BEQ .setxy
    CMP #$005A : BMI .inc
    LDA $0AF6 : CMP !ram_xpos : BNE .downcheck
    LDA $0AFA : CMP !ram_ypos : BNE .downcheck
    LDA $0B2E : CMP #$0000 : BNE .downcheck
    LDA $0B2C : CMP #$0000 : BNE .downcheck
    LDA #$0C67 : STA $7EC68A

  .downcheck
    LDA !IH_CONTROLLER_PRI_NEW : AND !IH_INPUT_DOWN : CMP #$0000 : BEQ .inc
    BRA .timecheck

  .setxy
    LDA $0AF6 : STA !ram_xpos
    LDA $0AFA : STA !ram_ypos
    RTS

  .roomcheck
    LDA $079B : CMP #$94CC : BEQ .forgotten : CMP #$962A : BEQ .redbrin : CMP #$97B5 : BEQ .morph
    CMP #$9938 : BEQ .greenbrin : CMP #$AF3F : BEQ .lowernorfair : CMP #$A6A1 : BEQ .warehouse
    LDA #$0057 : STA $7EC688
    BRA .setpb

  .inc
    LDA !ram_roomstrat_state : CMP #$00C0 : BPL .reset
    INC : STA !ram_roomstrat_state
    RTS

  .forgotten
  .redbrin
    LDA #$0080 : CMP !ram_xpos : BEQ .questionpb
    LDA #$00AB : CMP !ram_ypos : BEQ .goodpb
    BRA .badpb

  .morph
  .greenbrin
  .lowernorfair
  .warehouse
    LDA #$0080 : CMP !ram_xpos : BEQ .questionpb
    LDA #$008B : CMP !ram_ypos : BEQ .goodpb
    BRA .badpb

  .questionpb
    LDA #$0C0A : STA $7EC688
    BRA .setpb

  .timecheck
    LDA !ram_roomstrat_state : CMP #$009A : BEQ .frameperfect : BMI .early
    SEC : SBC #$009A : CMP #$000A : BPL .latemiss
    ASL A : TAY : LDA.w NumberGFXTable,Y : STA $7EC68E

  .lateprint
    LDA #$0C68 : STA $7EC68C

  .reset
    LDA #$0000 : STA !ram_roomstrat_state
    RTS

  .badpb
    LDA #$0C66 : STA $7EC688
    BRA .setpb

  .goodpb
    LDA #$0C67 : STA $7EC688

  .setpb
    LDA $09CE : STA !ram_roomstrat_counter
    LDA #$0001 : STA !ram_roomstrat_state
    LDA #$0057 : STA $7EC68A : STA $7EC68C : STA $7EC68E
    RTS

  .early
    LDA #$009A : SEC : SBC !ram_roomstrat_state : CMP #$000A : BPL .earlymiss
    ASL A : TAY : LDA.w NumberGFXTable,Y : STA $7EC68E

  .earlyprint
    LDA #$0C6C : STA $7EC68C
    BRA .reset

  .frameperfect
    LDA #$0C67 : STA $7EC68C : STA $7EC68E
    BRA .reset

  .earlymiss
    LDA #$0C66 : STA $7EC68E
    BRA .earlyprint

  .latemiss
    LDA #$0C66 : STA $7EC68E
    BRA .lateprint
}

status_chargetimer:
{
    LDA #$003D : SEC : SBC $0CD0 : CMP !ram_charge_counter : BEQ .done : STA !ram_charge_counter
    CMP #$0000 : BPL .charging : LDA #$0000

  .charging
    JSR Hex2Dec : LDX #$008A : JSR Draw3

  .done
    RTS
}

status_xfactor:
{
    LDA #$0079 : SEC : SBC $0CD0 : CMP !ram_xfac_counter : BEQ .done : STA !ram_xfac_counter
    JSR Hex2Dec : LDX #$008A : JSR Draw3

  .done
    RTS
}

status_dashcounter:
{
    LDA $0B3F : AND #$00FF : CMP !ram_dash_counter : BEQ .done : STA !ram_dash_counter
    JSR Hex2Dec : LDX #$008A : JSR Draw3

  .done
    RTS
}

status_mbhp:
{
    LDA $0FCC : CMP !ram_mb_hp : BEQ .done : STA !ram_mb_hp
    JSR Hex2Dec : LDX #$0088 : JSR Draw4

  .done
    RTS
}

status_robotflush:
{
  ; Checking hit on first robot
  ; 0x0C0E is a blank space
    LDA #$0C0E : STA $7EC688
    LDA $0FEA : CMP #$0030 : BMI .checkfirstfall
    LDA #$0C3C : STA $7EC688

  .checkfirstfall
    LDA #$0C0E : STA $7EC68A
    LDA $0FBE : CMP #$0280 : BMI .checksecondhit
    LDA #$0C3C : STA $7EC68A

  .checksecondhit
    LDA #$0C0E : STA $7EC68C
    LDA $102A : CMP #$0030 : BMI .checksecondfall
    LDA #$0C3D : STA $7EC68C

  .checksecondfall
    LDA #$0C0E : STA $7EC68E
    LDA $0FFE : CMP #$0280 : BMI .done
    LDA #$0C3D : STA $7EC68E

  .done
    RTS
}

status_moatcwj:
{
    LDA $0AFA : CMP !ram_ypos : BEQ .didxchange : STA !ram_ypos
    LDA $0AF6

  .onchange
    STA !ram_xpos
    LDA !ram_roomstrat_state : CMP #$0000 : BEQ .done
    LDA !IH_CONTROLLER_PRI_NEW : AND !IH_INPUT_JUMP : CMP #$0000 : BEQ .inc
    LDA !ram_roomstrat_state : CMP #$0001 : BNE .checkfirstjump
    BRL .checksecondjump

  .checkfirstjump
    LDA !ram_roomstrat_counter : CMP #$0013 : BEQ .firstframeperfect : BMI .firstearly
    SEC : SBC #$0013 : CMP #$000A : BPL .firstlatemiss
    ASL A : TAY : LDA.w NumberGFXTable,Y : STA $7EC68A

  .firstlateprint
    LDA #$0C68 : STA $7EC688
    LDA #$0000 : STA !ram_roomstrat_state : STA !ram_roomstrat_counter
    RTS

  .inc
    LDA !ram_roomstrat_counter : INC : STA !ram_roomstrat_counter
    RTS

  .didxchange
    LDA $0AF6 : CMP !ram_xpos : BNE .onchange
    BRL .nochange

  .firstframeperfect
    LDA #$0C67 : STA $7EC688 : STA $7EC68A
    LDA #$0001 : STA !ram_roomstrat_state : STA !ram_roomstrat_counter

  .done
    RTS

  .firstlatemiss
    LDA #$0C66 : STA $7EC68A
    BRA .firstlateprint

  .firstearly
    LDA #$0013 : SEC : SBC !ram_roomstrat_counter : CMP #$000A : BPL .firstearlymiss
    ASL A : TAY : LDA.w NumberGFXTable,Y : STA $7EC68A

  .firstearlyprint
    LDA #$0C6C : STA $7EC688
    LDA #$0000 : STA !ram_roomstrat_state : STA !ram_roomstrat_counter
    RTS

  .firstearlymiss
    LDA #$0C66 : STA $7EC68A
    BRA .firstearlyprint

  .inccheck
    LDA !ram_roomstrat_state : CMP #$0000 : BEQ .done
    CMP !ram_xpos : BEQ .donenochange
    LDA !ram_xpos : CMP #$00EB : BNE .incconfirm
    LDA !ram_ypos : CMP #$0084 : BEQ .donenochange

  .incconfirm
    LDA !ram_roomstrat_counter : INC : STA !ram_roomstrat_counter
    RTS

  .nochange
    LDA !ram_ypos : CMP #$008B : BNE .incorrectstartpos
    LDA !ram_xpos : CMP #$0015 : BEQ .startcounter : CMP #$02DB : BEQ .startcounter

  .incorrectstartpos
    LDA !IH_CONTROLLER_PRI : AND #$0300 : CMP #$0000 : BNE .inccheck
    LDA !ram_roomstrat_state : CMP #$0000 : BEQ .donenochange
    LDA #$0000 : STA !ram_roomstrat_state : STA !ram_roomstrat_counter
    LDA #$0057 : STA $7EC688 : STA $7EC68A : STA $7EC68C : STA $7EC68E

  .donenochange
    RTS

  .startcounter
    CMP !ram_roomstrat_state : BEQ .resetcounter
    STA !ram_roomstrat_state
    LDA #$0C67 : STA $7EC688
    LDA #$0057 : STA $7EC68A : STA $7EC68C : STA $7EC68E

  .resetcounter
    LDA #$0000 : STA !ram_roomstrat_counter
    RTS

  .checksecondjump
    LDA !ram_roomstrat_counter : CMP #$0048 : BEQ .secondframe1 : BMI .secondearly
    CMP #$0049 : BEQ .secondframe2
    SEC : SBC #$0049 : CMP #$000A : BPL .secondlatemiss
    ASL A : TAY : LDA.w NumberGFXTable,Y : STA $7EC68E

  .secondlateprint
    LDA #$0C68 : STA $7EC68C
    BRA .clear

  .secondframe1
    LDA #$0C00 : STA $7EC68E
    BRA .secondgotit

  .secondframe2
    LDA #$0C01 : STA $7EC68E

  .secondgotit
    LDA #$0C67 : STA $7EC68C

  .clear
    LDA #$0000 : STA !ram_roomstrat_state : STA !ram_roomstrat_counter
    RTS

  .secondlatemiss
    LDA #$0C66 : STA $7EC68E
    BRA .secondlateprint

  .secondearly
    LDA #$0048 : SEC : SBC !ram_roomstrat_counter : CMP #$000A : BPL .secondearlymiss
    ASL A : TAY : LDA.w NumberGFXTable,Y : STA $7EC68E

  .secondearlyprint
    LDA #$0C6C : STA $7EC68C
    BRA .clear

  .secondearlymiss
    LDA #$0C66 : STA $7EC68E
    BRA .secondearlyprint
}

status_hspeed:
{
    LDA $09C2 : STA !ram_last_hp
    LDA $0B44 : CLC : ADC $0B48 : TAY
    LDA $0B42 : ADC $0B46 : CMP !ram_horizontal_speed : BEQ .checksubpixel
    STA !ram_horizontal_speed : TYA : STA !ram_subpixel_pos
    LDA !ram_horizontal_speed : JSR Hex2Dec : LDX #$0088 : JSR Draw4
    LDA !ram_subpixel_pos : BRA .drawsubpixel

  .checksubpixel
    TYA : CMP !ram_subpixel_pos : BEQ .done : STA !ram_subpixel_pos

  .drawsubpixel
    LDX #$0092 : JSR Draw4Hex

  .done
    LDA #$0CCB : STA $7EC690 ; decimal
    RTS
}

status_vspeed:
{
    LDA $09C2 : STA !ram_last_hp
    LDA $0B2E : CMP !ram_vertical_speed : BEQ .checksubpixel
    STA !ram_vertical_speed : JSR Hex2Dec : LDX #$0088 : JSR Draw4
    LDA $0B2C : BRA .drawsubpixel

  .checksubpixel
    LDA $0B2C : CMP !ram_subpixel_pos : BEQ .done

  .drawsubpixel
    STA !ram_subpixel_pos : LDX #$0092 : JSR Draw4Hex

  .done
    LDA #$0CCB : STA $7EC690 ; decimal
    RTS
}

status_iframecounter:
{
    LDA $18A8 : CMP !ram_iframe_counter : BEQ .done : STA !ram_iframe_counter
    JSR Hex2Dec : LDX #$008A : JSR Draw3

  .done
    RTS
}

status_spikesuit:
{
    LDA !IH_CONTROLLER_PRI_NEW : AND !IH_INPUT_JUMP : CMP #$0000 : BEQ .nojump
    LDA $09A2 : AND #$0002 : CMP #$0000 : BEQ .jumpup
    LDA !IH_CONTROLLER_PRI : AND !IH_INPUT_UP : CMP #$0000 : BNE .nojump
    LDA !ram_roomstrat_state : CMP #$0002 : BEQ .checkspark : CMP #$0004 : BEQ .checkspark
    CMP #$0000 : BNE .donewait : BRL .nojumpnoup

  .jumpup
    LDA !ram_roomstrat_state : CMP #$0006 : BEQ .donewait
    CMP #$0002 : BEQ .checkspark : CMP #$0004 : BEQ .checkspark
    BRL .first

  .nojump
    LDA !ram_roomstrat_state : CMP #$0000 : BNE .donewait
    LDA !IH_CONTROLLER_PRI_NEW : AND !IH_INPUT_UP : CMP #$0000 : BNE .jumpup

  .nojumpnoup
    LDA !ram_roomstrat_counter : CMP #$0000 : BEQ .done : CMP #$0014 : BPL .resetstate
    INC : STA !ram_roomstrat_counter
    LDA $18A8 : CMP #$003C : BEQ .firstearly

  .done
    RTS

  .donewait
    LDA $18A8 : CMP #$0000 : BNE .done

  .resetstate
    LDA #$0000 : STA !ram_roomstrat_state : STA !ram_roomstrat_counter
    RTS

  .checkspark
    LDA $18A8 : CMP #$0033 : BEQ .frameperfect : BPL .secondearly
    LDA #$0C68 : STA $7EC68C
    LDA #$0033 : SEC : SBC $18A8 : CMP #$000A : BPL .secondmiss
    ASL A : TAY : LDA.w NumberGFXTable,Y : STA $7EC68E
    BRA .endstate

  .firstearly
    LDA #$0C6C : STA $7EC688
    LDA #$0057 : STA $7EC68A : STA $7EC68C : STA $7EC68E
    LDA #$0002 : STA !ram_roomstrat_state
    RTS

  .frameperfect
    LDA #$0C67 : STA $7EC68C : STA $7EC68E
    BRA .endstate

  .secondearly
    LDA #$0C6C : STA $7EC68C
    LDA $18A8 : SEC : SBC #$0033 : CMP #$000A : BPL .secondmiss
    ASL A : TAY : LDA.w NumberGFXTable,Y : STA $7EC68E

  .endstate
    LDA #$0006 : STA !ram_roomstrat_state
    RTS

  .firstmiss
    LDA #$0C66 : STA $7EC68A
    BRA .endstate

  .secondmiss
    LDA #$0C66 : STA $7EC68E
    BRA .endstate

  .first
    LDA $18A8 : CMP #$0000 : BEQ .damagewait : CMP #$003C : BEQ .damageunmorph
    CMP #$003B : BEQ .prepspark1 : CMP #$003A : BEQ .prepspark2
    LDA #$0057 : STA $7EC68C : STA $7EC68E
    LDA #$0C68 : STA $7EC688
    LDA #$003A : SEC : SBC $18A8 : CMP #$000A : BPL .firstmiss
    ASL A : TAY : LDA.w NumberGFXTable,Y : STA $7EC68A
    LDA #$0002 : STA !ram_roomstrat_state
    RTS

  .damagewait
    LDA #$0001 : STA !ram_roomstrat_counter
    LDA #$0057 : STA $7EC688 : STA $7EC68A : STA $7EC68C : STA $7EC68E
    RTS

  .damageunmorph
    LDA #$0C6C : STA $7EC688
    LDY #$0002 : LDA.w NumberGFXTable,Y : STA $7EC68A
    LDA #$0057 : STA $7EC68C : STA $7EC68E
    LDA #$0002 : STA !ram_roomstrat_state
    RTS

  .prepspark1
    LDA #$0002 : STA !ram_roomstrat_state
    BRA .prepspark

  .prepspark2
    LDA #$0004 : STA !ram_roomstrat_state

  .prepspark
    TAY : LDA.w NumberGFXTable,Y : STA $7EC68A
    LDA #$0C67 : STA $7EC688
    LDA #$0057 : STA $7EC68C : STA $7EC68E
    RTS
}

status_lagcounter:
{
    LDA !ram_lag_counter : CMP !ram_last_lag_counter : BEQ .done : STA !ram_last_lag_counter
    %a8() : STA $211B : XBA : STA $211B : LDA #$64 : STA $211C : %a16() : LDA $2134
    STA $4204 : %a8() : LDA #$E1 : STA $4206 : %a16()
    PHA : PLA : PHA : PLA : LDA $4214
    JSR Hex2Dec : LDX #$0088 : JSR Draw3
    LDA #$0C0A : STA $7EC68E

  .done
    RTS
}

status_xpos:
{
    LDA $09C2 : STA !ram_last_hp
    LDA $0AF6 : CMP !ram_xpos : BEQ .checksubpixel
    STA !ram_xpos : JSR Hex2Dec : LDX #$0088 : JSR Draw4
    LDA $0AF8 : BRA .drawsubpixel

  .checksubpixel
    LDA $0AF8 : CMP !ram_subpixel_pos : BEQ .done

  .drawsubpixel
    STA !ram_subpixel_pos : LDX #$0092 : JSR Draw4Hex

  .done
    LDA #$0CCB : STA $7EC690 ; decimal
    RTS
}

status_ypos:
{
    LDA $09C2 : STA !ram_last_hp
    LDA $0AFA : CMP !ram_ypos : BEQ .checksubpixel
    STA !ram_ypos : JSR Hex2Dec : LDX #$0088 : JSR Draw4
    LDA $0AFC : BRA .drawsubpixel

  .checksubpixel
    LDA $0AFC : CMP !ram_subpixel_pos : BEQ .done

  .drawsubpixel
    STA !ram_subpixel_pos : LDX #$0092 : JSR Draw4Hex

  .done
    LDA #$0CCB : STA $7EC690 ; decimal
    RTS
}

status_cooldowncounter:
{
    LDA $0CCC : CMP !ram_cooldown_counter : BEQ .done : STA !ram_cooldown_counter
    JSR Hex2Dec : LDX #$008A : JSR Draw3

  .done
    RTS
}

status_shinefinetune:
{
    LDA $09C2 : STA !ram_last_hp
    LDA !ram_dash_counter : CMP #$0003 : BEQ .checkgearshift3
    CMP #$00FF : BEQ .checkgearshiftinvalid : CMP #$0004 : BNE .checkgearshift012
    LDA $0B3F : AND #$00FF : CMP !ram_dash_counter : BEQ .inc4 : STA !ram_dash_counter
    LDA !ram_shinefinetune_late_4 : JSR Hex2Dec : LDX #$00C0 : JSR Draw4

  .reset
    LDA #$0000 : STA !ram_shine_counter
    STA !ram_shinefinetune_early_1 : STA !ram_shinefinetune_late_1
    STA !ram_shinefinetune_early_2 : STA !ram_shinefinetune_late_2
    STA !ram_shinefinetune_early_3 : STA !ram_shinefinetune_late_3
    STA !ram_shinefinetune_early_4 : STA !ram_shinefinetune_late_4
    RTS

  .inc4
    LDA !ram_shinefinetune_late_4 : INC : STA !ram_shinefinetune_late_4
    RTS

  .checkgearshiftinvalid
    LDA $0B3F : AND #$00FF : CMP #$0000 : BNE .donegearshift

  .checkgearshift012
    LDA $0B3F : AND #$00FF : CMP #$0004 : BEQ .donegearshift

  .checkgearshift3
    LDA $0B3F : AND #$00FF : CMP !ram_dash_counter : BEQ .check0123 : STA !ram_dash_counter
    CMP #$0000 : BEQ .reset
    BRL .draw1234

  .check0123
    CMP #$0000 : BNE .check123
    LDA !IH_CONTROLLER_PRI : AND !IH_INPUT_RUN : CMP #$0000 : BEQ .nodash0
    LDA !ram_shinefinetune_early_1 : INC : STA !ram_shinefinetune_early_1

  .donegearshift
    RTS

  .nodash0
    STA !ram_shinefinetune_early_1
    RTS

  .check123
    LDA !ram_shine_counter : INC : STA !ram_shine_counter
    LDA !ram_dash_counter : CMP #$0003 : BNE .check12
    BRL .check3

  .check12
    CMP #$0001 : BEQ .check1
    CMP #$0002 : BNE .donegearshift
    BRL .check2

  .nodashearlymissprint1
    LDA #$0C66 : STA $7EC698
    RTS

  .nodash1
    CMP !ram_shine_dash_held_late : BNE .nodashheldlate1
    LDA !ram_shinefinetune_early_2 : CMP #$0000 : BEQ .checklatemiss1
    LDA #$00FF : STA !ram_dash_counter
    LDA #$001A : SEC : SBC !ram_shinefinetune_early_2 : JSR Hex2Dec : LDX #$0090 : JSR Draw3
    LDA #$0C6C : STA $7EC696
    LDA #$001B : SEC : SBC !ram_shine_counter : CMP #$000A : BPL .nodashearlymissprint1
    ASL A : TAY : LDA.w NumberGFXTable,Y : STA $7EC698
    RTS

  .nodashheldlate1
    STA !ram_shine_dash_held_late
    LDA !ram_shinefinetune_late_1 : JSR Hex2Dec : LDX #$008C : JSR Draw2
    RTS

  .check1
    LDA !IH_CONTROLLER_PRI : AND !IH_INPUT_RUN : CMP #$0000 : BEQ .nodash1
    LDA !IH_CONTROLLER_PRI_NEW : AND !IH_INPUT_RUN : CMP #$0000 : BNE .setnextearly1
    LDA !ram_shine_dash_held_late : CMP #$0000 : BEQ .donecheck1
    LDA !ram_shinefinetune_late_1 : INC : STA !ram_shinefinetune_late_1

  .donecheck1
    RTS

  .checklatemiss1
    LDA !ram_shine_counter : CMP #$0023 : BMI .donecheck1
    LDA #$00FF : STA !ram_dash_counter
    LDA #$0C68 : STA $7EC692

  .checklatemissprint1
    LDA #$0C66 : STA $7EC694
    BRL .clear2

  .checklate1
    LDA #$00FF : STA !ram_dash_counter
    LDA #$0C68 : STA $7EC692
    LDA !ram_shine_counter : SEC : SBC #$001A : CMP #$000A : BPL .checklatemissprint1
    ASL A : TAY : LDA.w NumberGFXTable,Y : STA $7EC694
    BRL .clear2

  .setnextearly1
    LDA !ram_shine_counter : CMP #$001A : BPL .checklate1
    LDA !ram_shine_counter : STA !ram_shinefinetune_early_2
    RTS

  .nodashearlymissprint2
    LDA #$0C66 : STA $7EC6B6
    LDA #$0057 : STA $7EC6B8
    RTS

  .nodash2
    CMP !ram_shine_dash_held_late : BNE .nodashheldlate2
    LDA !ram_shinefinetune_early_3 : CMP #$0000 : BEQ .checklatemiss2
    LDA #$00FF : STA !ram_dash_counter
    LDA #$0016 : SEC : SBC !ram_shinefinetune_early_3 : JSR Hex2Dec : LDX #$00AE : JSR Draw3
    LDA #$0C6C : STA $7EC6B4
    LDA #$0017 : SEC : SBC !ram_shine_counter : CMP #$000A : BPL .nodashearlymissprint2
    ASL A : TAY : LDA.w NumberGFXTable,Y : STA $7EC6B6
    LDA #$0057 : STA $7EC6B8
    RTS

  .nodashheldlate2
    STA !ram_shine_dash_held_late
    LDA !ram_shinefinetune_late_2 : JSR Hex2Dec : LDX #$0096 : JSR Draw2
    RTS

  .check2
    LDA !IH_CONTROLLER_PRI : AND !IH_INPUT_RUN : CMP #$0000 : BEQ .nodash2
    LDA !IH_CONTROLLER_PRI_NEW : AND !IH_INPUT_RUN : CMP #$0000 : BNE .setnextearly2
    LDA !ram_shine_dash_held_late : CMP #$0000 : BEQ .donecheck2
    LDA !ram_shinefinetune_late_2 : INC : STA !ram_shinefinetune_late_2

  .donecheck2
    RTS

  .checklatemiss2
    LDA !ram_shine_counter : CMP #$0023 : BMI .donecheck2
    LDA #$00FF : STA !ram_dash_counter
    LDA #$0C68 : STA $7EC6B0

  .checklatemissprint2
    LDA #$0C66 : STA $7EC6B2
    BRL .clear3

  .checklate2
    LDA #$00FF : STA !ram_dash_counter
    LDA #$0C68 : STA $7EC6B0
    LDA !ram_shine_counter : SEC : SBC #$0016 : CMP #$000A : BPL .checklatemissprint2
    ASL A : TAY : LDA.w NumberGFXTable,Y : STA $7EC6B2
    BRL .clear3

  .setnextearly2
    LDA !ram_shine_counter : CMP #$0016 : BPL .checklate2
    LDA !ram_shine_counter : STA !ram_shinefinetune_early_3
    RTS

  .nodashearlymissprint3
    LDA #$0C66 : STA $7EC6C0
    LDA #$0057 : STA $7EC6C2
    RTS

  .nodash3
    CMP !ram_shine_dash_held_late : BNE .nodashheldlate3
    LDA !ram_shinefinetune_early_4 : CMP #$0000 : BEQ .checklatemiss3
    LDA #$00FF : STA !ram_dash_counter
    LDA #$0012 : SEC : SBC !ram_shinefinetune_early_4 : JSR Hex2Dec : LDX #$00B8 : JSR Draw3
    LDA #$0C6C : STA $7EC6BE
    LDA #$0013 : SEC : SBC !ram_shine_counter : CMP #$000A : BPL .nodashearlymissprint3
    ASL A : TAY : LDA.w NumberGFXTable,Y : STA $7EC6C0
    LDA #$0057 : STA $7EC6C2
    RTS

  .nodashheldlate3
    STA !ram_shine_dash_held_late
    LDA !ram_shinefinetune_late_3 : JSR Hex2Dec : LDX #$00B4 : JSR Draw2
    LDA #$0057 : STA $7EC6B8
    RTS

  .check3
    LDA !IH_CONTROLLER_PRI : AND !IH_INPUT_RUN : CMP #$0000 : BEQ .nodash3
    LDA !IH_CONTROLLER_PRI_NEW : AND !IH_INPUT_RUN : CMP #$0000 : BNE .setnextearly3
    LDA !ram_shine_dash_held_late : CMP #$0000 : BEQ .donecheck3
    LDA !ram_shinefinetune_late_3 : INC : STA !ram_shinefinetune_late_3

  .donecheck3
    RTS

  .checklatemiss3
    LDA !ram_shine_counter : CMP #$0023 : BMI .donecheck3
    LDA #$00FF : STA !ram_dash_counter
    LDA #$0C68 : STA $7EC6BA

  .checklatemissprint3
    LDA #$0C66 : STA $7EC6BC
    BRA .clear4

  .checklate3
    LDA #$00FF : STA !ram_dash_counter
    LDA #$0C68 : STA $7EC6BA
    LDA !ram_shine_counter : SEC : SBC #$0012 : CMP #$000A : BPL .checklatemissprint3
    ASL A : TAY : LDA.w NumberGFXTable,Y : STA $7EC6BC
    BRA .clear4

  .setnextearly3
    LDA !ram_shine_counter : CMP #$0012 : BPL .checklate3
    LDA !ram_shine_counter : STA !ram_shinefinetune_early_4
    RTS

  .clear1
    LDA #$0057 : STA $7EC68C : STA $7EC68E : STA $7EC690 : STA $7EC692 : STA $7EC694

  .clear2
    LDA #$0057 : STA $7EC696 : STA $7EC698 : STA $7EC6AE : STA $7EC6B0 : STA $7EC6B2

  .clear3
    LDA #$0057 : STA $7EC6B4 : STA $7EC6B6 : STA $7EC6B8 : STA $7EC6BA : STA $7EC6BC

  .clear4
    LDA #$0057 : STA $7EC6BE : STA $7EC6C0 : STA $7EC6C2 : STA $7EC6C4 : STA $7EC6C6
    RTS

  .drawearly4
    LDA #$0012 : SEC : SBC !ram_shinefinetune_early_4 : JSR Hex2Dec : JSR Draw3
    BRA .clear4

  .drawearly3
    LDA #$0016 : SEC : SBC !ram_shinefinetune_early_3 : JSR Hex2Dec : LDX #$00AE : JSR Draw3
    BRA .clear3

  .draw4
    LDA !ram_shinefinetune_late_3 : JSR Hex2Dec : LDX #$00B4 : JSR Draw2
    LDA !ram_shinefinetune_early_4 : CMP #$0000 : BNE .drawearly4
    LDA !ram_shine_counter : STA !ram_shinefinetune_early_4
    LDA !IH_CONTROLLER_PRI_NEW : AND !IH_INPUT_RUN : CMP #$0000 : BEQ .drawearly4
    LDA #$0012 : STA !ram_shinefinetune_early_4
    BRA .drawearly4

  .draw3
    LDA !ram_shinefinetune_late_2 : JSR Hex2Dec : LDX #$0096 : JSR Draw2
    LDA !ram_shinefinetune_early_3 : CMP #$0000 : BNE .drawearly3
    LDA !ram_shine_counter : STA !ram_shinefinetune_early_3
    LDA !IH_CONTROLLER_PRI_NEW : AND !IH_INPUT_RUN : CMP #$0000 : BEQ .drawearly3
    LDA #$0016 : STA !ram_shinefinetune_early_3
    BRA .drawearly3

  .draw1234
    STA !ram_shine_dash_held_late : STA !ram_shine_counter
    CMP #$0004 : BEQ .draw4
    CMP #$0003 : BEQ .draw3
    CMP #$0002 : BEQ .draw2
    CMP #$0001 : BEQ .draw1
    RTS

  .draw2
    LDA !ram_shinefinetune_late_1 : JSR Hex2Dec : LDX #$008C : JSR Draw2
    LDA !ram_shinefinetune_early_2 : CMP #$0000 : BNE .drawearly2
    LDA !ram_shine_counter : STA !ram_shinefinetune_early_2
    LDA !IH_CONTROLLER_PRI_NEW : AND !IH_INPUT_RUN : CMP #$0000 : BEQ .drawearly2
    LDA #$001A : STA !ram_shinefinetune_early_2

  .drawearly2
    LDA #$001A : SEC : SBC !ram_shinefinetune_early_2 : JSR Hex2Dec : JSR Draw3
    BRL .clear2

  .draw1
    LDA !ram_shinefinetune_early_1 : CMP #$0064 : BPL .draw1miss
    JSR Hex2Dec : LDX #$0088 : JSR Draw2
    BRL .clear1

  .draw1miss
    LDA #$0C66 : STA $7EC688 : STA $7EC68A
    BRL .clear1
}

status_quickdrop:
{
    LDA !IH_CONTROLLER_PRI_NEW : AND !IH_INPUT_LEFT : CMP #$0000 : BNE .leftright
    LDA !IH_CONTROLLER_PRI_NEW : AND !IH_INPUT_RIGHT : CMP #$0000 : BNE .leftright
    LDA !ram_quickdrop_counter : CMP #$0000 : BEQ .done : CMP #$0014 : BPL .reset
    LDA !ram_quickdrop_counter : INC : STA !ram_quickdrop_counter
    RTS

  .leftright
    LDA #$0057 : STA $7EC688 : STA $7EC68A
    LDA !ram_quickdrop_counter : CMP #$0000 : BEQ .firstleftright
    JSR Hex2Dec : LDX #$008C : JSR Draw2

  .setcounter
    LDA #$0001 : STA !ram_quickdrop_counter

  .done
    RTS

  .firstleftright
    LDA #$0057 : STA $7EC68C : STA $7EC68E
    BRA .setcounter

  .reset
    LDA #$0000 : STA !ram_quickdrop_counter
    RTS
}

status_walljump:
{
    LDA !IH_CONTROLLER_PRI_NEW : AND !IH_INPUT_LEFT : CMP #$0000 : BNE .leftright
    LDA !IH_CONTROLLER_PRI_NEW : AND !IH_INPUT_RIGHT : CMP #$0000 : BNE .leftright
    LDA !ram_walljump_counter : CMP #$0000 : BEQ .done : CMP #$0014 : BPL .reset
    LDA !IH_CONTROLLER_PRI_NEW : AND !IH_INPUT_JUMP : CMP #$0000 : BNE .jump
    LDA !ram_walljump_counter : INC : STA !ram_walljump_counter
    RTS

  .leftright
    LDA #$0001 : STA !ram_walljump_counter

  .done
    RTS

  .jump
    LDA !ram_walljump_counter : JSR Hex2Dec : LDX #$008C : JSR Draw2
    BRL .roomcheck

  .toolow
    LDA !ram_walljump_counter : CMP #$0009 : BNE .clear
    LDA #$0C66 : STA $7EC68A

  .lowprint
    LDA #$0C68 : STA $7EC688
    BRA .reset

  .yes
    LDA !ram_walljump_counter : CMP #$0009 : BNE .clear
    LDA #$0C09 : STA $7EC68A
    BRA .highprint

  .ignore
    LDA !ram_walljump_counter : CMP #$0009 : BNE .reset

  .clear
    LDA #$0057 : STA $7EC688 : STA $7EC68A

  .reset
    LDA #$0000 : STA !ram_walljump_counter
    RTS

  .low
    SEC : SBC !ram_ypos : CMP #$0050 : BPL .ignore : CMP #$000B : BPL .toolow
    DEC : ASL A : TAY
    LDA !ram_walljump_counter : CMP #$0009 : BNE .clear
    LDA.w NumberGFXTable,Y : STA $7EC68A
    BRA .lowprint

  .toohigh
    LDA !ram_walljump_counter : CMP #$0009 : BNE .clear
    LDA #$0C66 : STA $7EC68A

  .highprint
    LDA #$0C6D : STA $7EC688
    BRA .reset

  .heightcheck
    LDA $0AFA : CMP !ram_ypos : BEQ .yes : BPL .low
    LDA !ram_ypos : SEC : SBC $0AFA : CMP #$0050 : BPL .ignore : CMP #$000A : BPL .toohigh
    ASL A : TAY
    LDA !ram_walljump_counter : CMP #$0009 : BNE .clear
    LDA.w NumberGFXTable,Y : STA $7EC68A
    BRA .highprint

  .roomcheck
    LDA $079B : CMP #$B4AD : BEQ .writg : CMP #$D2AA : BEQ .plasma : CMP #$ACB3 : BEQ .bubble
    BRL .clear

  .writg
    LDA #$042E : STA !ram_ypos
    BRA .heightcheck

  .plasma
    LDA #$014E : STA !ram_ypos
    BRA .heightcheck

  .bubble
    LDA #$0116 : STA !ram_ypos
    BRA .heightcheck
}

status_shottimer:
{
    LDA !IH_CONTROLLER_PRI_NEW : AND !IH_INPUT_SHOOT : CMP #$0000 : BEQ .inc
    LDA !ram_shot_timer : JSR Hex2Dec : LDX #$0088 : JSR Draw4
    LDA #$0000 : STA !ram_shot_timer

  .inc
    LDA !ram_shot_timer : INC : STA !ram_shot_timer
    RTS
}

status_countdamage:
{
    LDA !ram_countdamage : CMP !ram_countdamage_hud : BEQ .done : STA !ram_countdamage_hud
    JSR Hex2Dec : LDX #$0088 : JSR Draw4

  .done
    RTS
}

status_ridleygrab:
{
    LDA $7E800A : CMP !ram_ridleygrab : BEQ .done : STA !ram_ridleygrab
    JSR Hex2Dec : LDX #$008A : JSR Draw3

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
    LDA !ram_watch_write_lock : BEQ .done
    LDA !ram_watch_left : TAX
    LDA !ram_watch_write : STA $7E0000,X

  .done
    RTS
}

status_kihuntermanip:
{
print pc, " <-- break here for kihunter manip"     ; DFF4AD
    LDA $079B : CMP #$B585 : BEQ .roomStairs
    LDA $079B : CMP #$B656 : BEQ .jumpMusketeers
    JMP .done
  .jumpMusketeers
    JMP .roomMusketeers

; Kihunter Stairs
  .roomStairs
    LDA #$0C0E : STA $7EC68C : STA $7EC68E          ; draw blank spaces
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
    LDA #$0C61 : STA $7EC618                        ; draw up arrow

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
    LDA #$0C61 : STA $7EC658                        ; draw up arrow

  .FinishY4
    LDA $0F7E,X : STA !ram_enemy4_last_ypos         ; store last_ypos for next frame

    JMP .done


; Three Musketeers
  .roomMusketeers
    LDA $09C2 : STA !ram_last_hp                    ; prevent SamusHP from overwriting our work later
    LDA #$0C0E : STA $7EC68C : STA $7EC68E          ; draw blank spaces
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
    LDA #$0C61 : STA $7EC658                        ; draw up arrow

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

status_enemyhp:
{
    LDA $0F8C : CMP !ram_enemy_hp : BEQ .done : STA !ram_enemy_hp
    JSR Hex2Dec : LDX #$0088 : JSR Draw4

  .done
    RTS
}


;---SUBROUTINES---
Hex2Dec:
{
    STA $4204

    %a8()
    LDA #$64 : STA $4206 ; divide by 100d
    %a16()
    PEA $0000 : PLA
    LDA $4214 : STA $12
    LDA $4216 : STA $4204

    %a8()
    LDA #$0A : STA $4206
    %a16()
    PEA $0000 : PLA
    LDA $4214 : ASL A : STA $16
    LDA $4216 : ASL A : STA $18
    LDA $12 : STA $4204

    %a8()
    LDA #$0A : STA $4206
    %a16()
    PEA $0000 : PLA
    LDA $4214 : ASL A : STA $12
    LDA $4216 : ASL A : STA $14
    RTS
}

Draw2:
{
    LDA #$0057 : STA $7EC600,X

    ; Second digit
    LDY $18 : LDA.w NumberGFXTable,Y : STA $7EC602,X

    ; First digit (if non-zero)
    LDY $16 : BEQ .done : LDA.w NumberGFXTable,Y : STA $7EC600,X

  .done
    INX #4
    RTS
}

Draw3:
{
    LDA #$0057 : STA $7EC600,X : STA $7EC602,X

    ; Third digit
    LDY $18 : LDA.w NumberGFXTable,Y : STA $7EC604,X

    ; Check if done
    LDA $16 : ORA $14 : BEQ .done

    ; Second digit
    LDY $16 : LDA.w NumberGFXTable,Y : STA $7EC602,X

    ; First digit (if non-zero)
    LDY $14 : BEQ .done : LDA.w NumberGFXTable,Y : STA $7EC600,X

  .done
    INX #6
    RTS
}

Draw4:
{
    LDA #$0057 : STA $7EC600,X : STA $7EC602,X : STA $7EC604,X

    ; Fourth digit
    LDY $18 : LDA.w NumberGFXTable,Y : STA $7EC606,X

    ; Check if done
    LDA $16 : ORA $14 : ORA $12 : BEQ .done

    ; third digit
    LDY $16 : LDA.w NumberGFXTable,Y : STA $7EC604,X

    ; Check if done
    LDA $14 : ORA $12 : BEQ .done

    ; Second digit
    LDY $14 : LDA.w NumberGFXTable,Y : STA $7EC602,X

    ; First digit (if non-zero)
    LDY $12 : BEQ .done : LDA.w NumberGFXTable,Y : STA $7EC600,X

  .done
    INX #8
    RTS
}

Draw4Hex:
{
    STA $12 : AND #$F000              ; get first digit (X000)
    XBA : LSR #4                      ; move it to last digit (000X)
    ASL : TAY : LDA.w HexGFXTable,Y   ; load tilemap address with 2x digit as index
    STA $7EC600,X                     ; draw digit to HUD

    LDA $12 : AND #$0F00              ; (0X00)
    XBA
    ASL : TAY : LDA.w HexGFXTable,Y
    STA $7EC602,X

    LDA $12 : AND #$00F0              ; (00X0)
    LSR #4
    ASL : TAY : LDA.w HexGFXTable,Y
    STA $7EC604,X

    LDA $12 : AND #$000F              ; (000X)
    ASL : TAY : LDA.w HexGFXTable,Y
    STA $7EC606,X

    RTS
}

CalcEtank:
{
    STA $4204
    %a8()
    LDA #$64 : STA $4206
    %a16()
    PEA $0000 : PLA
    LDA $4214 : CLC : ADC !ram_pct_1 : STA !ram_pct_1
    RTS
}

CalcItem:
{
    STZ $4214 : STA $4204
    %a8()
    LDA #$05 : STA $4206
    %a16()
    PEA $0000 : PLA
    LDA $4214 : CLC : ADC !ram_pct_1 : STA !ram_pct_1
    RTS
}

CalcLargeItem:
{
    LDA $09A4
    LDX #$0000
  .loop
    BIT #$0001 : BEQ .noItem

    INX

  .noItem
    LSR : BNE .loop
    TXA : CLC : ADC !ram_pct_1 : STA !ram_pct_1
    RTS
}

CalcBeams:
{
    PHP
    %a8()
    LDA $09A8
    LDX #$0000
  .loop
    BIT #$01 : BEQ .noItem

    INX

  .noItem
    LSR : BNE .loop

    LDA $09A9 : CMP #$10 : BNE .done

    INX

  .done
    TXA : CLC : ADC !ram_pct_1 : STA !ram_pct_1

    PLP
    RTS
}

ForceCountDamage:
{
    LDA !sram_countdamage : STA !ram_countdamage
    JSR Hex2Dec : LDX #$0088 : JSR Draw4
    RTL
}


ih_game_loop_code:
{
    PHA

    LDA !ram_transition_counter : INC : STA !ram_transition_counter

    LDA !ram_magic_pants_1 : BEQ .infiniteammo
    JSR magic_pants

  .infiniteammo
    LDA !ram_infinite_ammo : CMP !ram_infiniteammo_check : BMI .reset_ammo_check
    LDA !ram_infinite_ammo : BEQ .handle_inputs
    JSR infinite_ammo
    BRA .handle_inputs

  .reset_ammo_check
    LDA #$0000 : STA !ram_infiniteammo_check
    LDA !ram_ammo_missiles : STA $7E09C6
    LDA !ram_ammo_supers : STA $7E09CA
    LDA !ram_ammo_powerbombs : STA $7E09CE

    ; handle inputs
  .handle_inputs
    LDA !IH_CONTROLLER_SEC_NEW : BEQ .done
    CMP !IH_PAUSE : BEQ .toggle_pause
    CMP !IH_SLOWDOWN : BEQ .toggle_slowdown
    CMP !IH_SPEEDUP : BEQ .toggle_speedup
    CMP !IH_RESET : BEQ .reset_slowdown
    CMP !IH_STATUS_R : BEQ .inc_statusdisplay
    CMP !IH_STATUS_L : BEQ .dec_statusdisplay

  .done
    PLA
    JSL $808111
    RTL

  .toggle_pause
    LDA #$FFFF
    STA !ram_slowdown_mode
    LDA #$0000
    STA !ram_slowdown_frames
    JMP .done

  .toggle_slowdown
    LDA !ram_slowdown_mode
    INC A
    STA !ram_slowdown_mode
    JMP .done

  .toggle_speedup
    LDA !ram_slowdown_mode
    BEQ +
    DEC A
    STA !ram_slowdown_mode
+   JMP .done

  .reset_slowdown
    LDA #$0000
    STA !ram_slowdown_mode
    STA !ram_slowdown_frames
    JMP .done

  .inc_statusdisplay
    LDA !sram_display_mode
    INC A
    CMP #$0010
    BNE +
    LDA #$0000
+   STA !sram_display_mode
    JMP .update_status

  .dec_statusdisplay
    LDA !sram_display_mode
    DEC A
    CMP #$FFFF
    BNE +
    LDA #$000F
+   STA !sram_display_mode
    JMP .update_status


  .update_status
    LDA #$0000
    STA !ram_armed_shine_duration
    STA !ram_charge_counter
    STA !ram_xfac_counter
    INC A
    STA !ram_dash_counter
    STA !ram_iframe_counter
    STA !ram_xpos
    STA !ram_ypos
    STA !ram_horizontal_speed
    STA !ram_vertical_speed
    STA !ram_subpixel_pos
    STA !ram_mb_hp
    STA !ram_enemy_hp
    STA !ram_shine_counter
    STA !ram_countdamage_hud
    JMP .done
}

magic_pants:
{
    LDA $0A96 : CMP #$0009 : BEQ .check
    LDA !ram_magic_pants_2 : BEQ +
    LDA !ram_magic_pants_3 : STA $7EC194
    LDA !ram_magic_pants_4 : STA $7EC196
    LDA !ram_magic_pants_5 : STA $7EC19E
    LDA #$0000 : STA !ram_magic_pants_2
+   RTS

  .check
    LDA $0A1C : CMP #$0009 : BEQ .flash
    CMP #$000A : BEQ .flash
    RTS

  .flash
    LDA !ram_magic_pants_2 : BNE +
    LDA $7EC194 : STA !ram_magic_pants_3
    LDA $7EC196 : STA !ram_magic_pants_4
    LDA $7EC19E : STA !ram_magic_pants_5
+   LDA #$FFFF : STA $7EC194 : STA $7EC196 : STA $7EC19E : STA !ram_magic_pants_2
    RTS
}

infinite_ammo:
{
    LDA !ram_infiniteammo_check : BNE + ; 0 if first time it's been run
    INC : STA !ram_infiniteammo_check
    ; preserve ammo counts
    LDA $7E09C6 : STA !ram_ammo_missiles
    LDA $7E09CA : STA !ram_ammo_supers
    LDA $7E09CE : STA !ram_ammo_powerbombs

    ; lock ammo to specific values
+   LDA #$01A4 : STA $7E09C6  ; missiles
    LDA #$0045 : STA $7E09CA  ; supers
    LDA #$0045 : STA $7E09CE  ; pbs
    RTS
}

ih_get_item_code:
{
    PHA

    ; calculate lag frames
    LDA !ram_realtime_room : SEC : SBC !ram_transition_counter : STA !ram_last_room_lag

    LDA !ram_gametime_room : STA !ram_last_gametime_room
    LDA !ram_realtime_room : STA !ram_last_realtime_room

    ; save temp variables
    LDA $12 : PHA
    LDA $14 : PHA

    ; Update HUD
    JSL ih_update_hud_code

    ; restore temp variables
    PLA : STA $14
    PLA : STA $12

    PLA
    JSL $80818E
    RTL
}


ih_shinespark_code:
{
    DEC
    STA !ram_armed_shine_duration
    STA $0A68
    RTL
}

print pc, " infohud end"


org $94DC00
NoClip:
{
    LDA !ram_noclip : BEQ .originalcode
    RTS
  .originalcode
    STZ $14 : LDA $20
    JMP $8F4D
}

org $A6FFE0
SteamCollision:
{
    LDA !ram_steamcollision : BEQ .originalcode
    PLA : LDA $0F86,x : JMP $F13B
  .originalcode
    LDA $0F86,x : RTS
}


; Stuff that needs to be placed in bank 80
org $80D300
print pc, " infohud bank80 start"
NumberGFXTable:
    dw #$0C09, #$0C00, #$0C01, #$0C02, #$0C03, #$0C04, #$0C05, #$0C06, #$0C07, #$0C08
    dw #$0C10, #$0C11, #$0C12, #$0C13, #$0C14, #$0C15, #$0C16, #$0C17, #$0C18, #$0C19
    dw #$0C1A, #$0C20, #$0C21, #$0C22, #$0C23, #$0C24, #$0C25, #$0C26, #$0C27, #$0C28
    dw #$0C29, #$0C2A, #$0C2B, #$0C2C, #$0C2D, #$0C2E, #$0C2F, #$0C30, #$0C31, #$0C33
    dw #$0C4D, #$0C6E, #$0C4F, #$0C55, #$0C56, #$0C58, #$0C59, #$0C5A, #$0C5B, #$0C5C
    dw #$0C5D, #$0C5E, #$0C5F, #$0C8D, #$0C8E, #$0C8F, #$0CD2, #$0CD4, #$0CD5, #$0CD6
    dw #$0CD7, #$0CD8, #$0CD9, #$0CDA, #$0CDB, #$0CCA

HexGFXTable:
    dw #$0C70, #$0C71, #$0C72, #$0C73, #$0C74, #$0C75, #$0C76, #$0C77, #$0C78, #$0C79, #$0C7A, #$0C7B, #$0C7C, #$0C7D, #$0C7E, #$0C7F, #$0C6E

ControllerTable1:
    dw $0020, $0800, $0010, $4000, $0040, $2000
ControllerTable2:
    dw $0200, $0400, $0100, $8000, $0080, $1000
ControllerGfx1:
    dw $0C68, $0C61, $0C69, $0C67, $0C66, $0C6A
ControllerGfx2:
    dw $0C60, $0C63, $0C62, $0C65, $0C64, $0C6B

HexToNumberGFX1:
    dw $0C09, $0C09, $0C09, $0C09, $0C09, $0C09, $0C09, $0C09, $0C09, $0C09
    dw $0C00, $0C00, $0C00, $0C00, $0C00, $0C00, $0C00, $0C00, $0C00, $0C00
    dw $0C01, $0C01, $0C01, $0C01, $0C01, $0C01, $0C01, $0C01, $0C01, $0C01
    dw $0C02, $0C02, $0C02, $0C02, $0C02, $0C02, $0C02, $0C02, $0C02, $0C02
    dw $0C03, $0C03, $0C03, $0C03, $0C03, $0C03, $0C03, $0C03, $0C03, $0C03
    dw $0C04, $0C04, $0C04, $0C04, $0C04, $0C04, $0C04, $0C04, $0C04, $0C04

HexToNumberGFX2:
    dw $0C09, $0C00, $0C01, $0C02, $0C03, $0C04, $0C05, $0C06, $0C07, $0C08
    dw $0C09, $0C00, $0C01, $0C02, $0C03, $0C04, $0C05, $0C06, $0C07, $0C08
    dw $0C09, $0C00, $0C01, $0C02, $0C03, $0C04, $0C05, $0C06, $0C07, $0C08
    dw $0C09, $0C00, $0C01, $0C02, $0C03, $0C04, $0C05, $0C06, $0C07, $0C08
    dw $0C09, $0C00, $0C01, $0C02, $0C03, $0C04, $0C05, $0C06, $0C07, $0C08
    dw $0C09, $0C00, $0C01, $0C02, $0C03, $0C04, $0C05, $0C06, $0C07, $0C08

print pc, " infohud bank80 end"

org $8098CB  ; Initial HUD tilemap
    dw $2C0F, $2C0F, $2C0F, $2C0F, $2C0F, $2C0F, $2C0F, $2C0F
    dw $2C0F, $2C0F, $2C0F, $2C0F, $2C0F, $2C0F, $2C0F, $2C0F
    dw $2C0F, $2C0F, $2C0F, $2C0F, $2C0F, $2C0F, $2C0F, $2C0F
    dw $2C0F, $2C0F, $2C0F, $2C0F, $2C0F, $2C0F, $2C0F, $2C0F
    dw $2C0F, $2C0F, $2C0F, $2C0F, $2C0F, $2C0F, $2C0F, $2C0F
    dw $2C0F, $2C0F, $2C0F, $2C0F, $2C0F, $2C0F, $2C0F, $2C0F
    dw $2C0F, $2C0F, $2C0F, $2C0F, $2C0F, $2C0F, $2C0F, $2C0F
    dw $2C0F, $2C0F, $2C0F, $2C0F, $2C0F, $2C0F, $2C0F, $2C0F
    dw $2C0F, $2C0F, $2C0F, $2C0F, $2C0F, $2C0F, $2C09, $2C0F
    dw $2C0F, $2C0F, $2C0F, $2C0F, $2C0F, $2C0F, $2C0F, $2C0F
    dw $2C0F, $2C0F, $2C0F, $2C0F, $2C0F, $2C0F, $2C0F, $2C0F
    dw $2C0F, $2C0F, $2C0F, $2C0F, $2C0F, $2C0F, $2C0F, $2C0F

 
; Main Menu Tilemap
org $81B40A
    ;           P      R      A      C      T      I      C      E                
    dw $200F, $200D, $000D, $200A, $200C, $002C, $2022, $200C, $200E, $200F, $FFFE
    dw $200F, $2038, $003A, $201A, $201C, $0011, $2011, $201C, $201E, $200F, $FFFF


org $8EDC40
    ;                         S      M  
    dw $000F, $000F, $000F, $007C, $0076

org $8EDC80
    ;    P      R      A      C      T      I      C      E  
    dw $0079, $007B, $006A, $006C, $007D, $0072, $006C, $006E

org $8EDCC0
    ;                  H      A      C      K  
    dw $000F, $000F, $0071, $006A, $006C, $0074

org $8EDC70
    ;                  S      M         
    dw $000F, $000F, $007C, $0076

org $8EDCB0
    ;           レ      ン     シ      ュ      ウ    top half of "renshuu"
    dw $000F, $00D5, $00D2, $00F8, $0117, $00D1

org $8EDCF0
    ;           レ      ン     シ      ュ      ウ    bottom half of "renshuu"
    dw $000F, $00E5, $00E2, $0108, $0127, $00E1
