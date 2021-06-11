;=======================================================
;InfoHUD timers and stuff
;=======================================================

org $809490
    jmp $9497    ; skip resetting player 2 inputs

org $8094DF
    plp          ; patch out resetting of controller 2 buttons and enable debug mode
    rtl

org $828B4B      ; disable debug functions
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
    ; It actually runs when you finish the cutscenes after Ceres
    JSL post_ceres_timers
    +
    RTL

org $82EE92      ;runs on START GAME
    JSL startgame_seg_timer

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

org $8095fc      ;hijack, end of NMI routine to update realtime frames
    JML ih_nmi_end

org $A98874      ; update timers after MB1 fight
    JSL ih_mb1_segment

org $A9BE23      ; update timers when baby spawns (off-screen) in MB2 fight
    JSL ih_mb2_segment

org $90D340      ; update timers when shinespark bonk sound plays
    JSL ih_shinespark_segment

org $A0B9AE      ; update timers when Ridley drops spawn
    JSL ih_drops_segment

org $A0B9E1      ; update timers when Crocomire drops spawn
    JSL ih_drops_segment

org $A0BA14      ; update timers when Phantoon drops spawn
    JSL ih_drops_segment

org $A0BA47      ; update timers when Botwoon drops spawn
    JSL ih_drops_segment

org $A0BA7A      ; update timers when Kraid drops spawn
    JSL ih_drops_segment

org $A0BAAD      ; update timers when Bomb Torizo drops spawn
    JSL ih_drops_segment

org $A0BAE0      ; update timers when Golden Torizo drops spawn
    JSL ih_drops_segment

org $A0BB13      ; update timers when Spore Spawn drops spawn
    JSL ih_drops_segment

org $A0BB46      ; update timers when Draygon drops spawn
    JSL ih_drops_segment

org $A6A17C      ; Ridley AI init, overwrites a junk LDA
    JSR ResetCountDamageRid

org $A6FEBC      ; free space
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

org $828AB0       ; hijack spare CPU usage routine
{
    ; This vanilla routine wastes 34 CPU cycles and runs near the
    ; end of the main game loop. Useless instructions are added
    ; after our code to simulate the remaining waste on fast exit
    LDA !ram_magic_pants_state : BEQ +        ; 8 cycles
    JSL space_pants_helper
+   LDA !sram_custompalette : BEQ +           ; 8 cycles
    JSL CustomizePalettes
+   PHA : PLA : PHA : PLA                     ; 14 cycles
    NOP : NOP                                 ; 4 cycles
    RTL
}

warnpc $828AE3

org $9AB200         ; graphics for HUD
incbin ../resources/hudgfx.bin


; Main bank stuff
org $F08000    ; Moved from $E08000
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

ih_shinespark_segment:
{
    ; runs when shinespark bonk sound plays
    JSL $80914D ; overwritten code
    JSL ih_update_hud_early
    RTL
}

ih_drops_segment:
{
    ; runs when boss drops spawn (except Torizos)
    JSL ih_update_hud_early
    JSL $808111 ; overwritten code
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
        LDA !ram_tmp_1 : LDX #$003C : JSR Draw3

        ; Draw decimal seperator
        LDA !IH_DECIMAL : STA $7EC642

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
        LDA !ram_tmp_3 : LDX #$003C : JSR Draw3

        ; Draw decimal seperator
        LDA !IH_DECIMAL : STA $7EC642

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
        LDA !ram_pct_1 : LDX #$0012 : JSR Draw3

        ; Percent symbol on HUD
        LDA !IH_PERCENT : STA $7EC618
    }

    ; E-tanks
    LDA !ram_etanks : LDX #$0054 : JSR Draw3

    .skipPercent
    ; Lag
    LDA !ram_last_room_lag : LDX #$0080 : JSR Draw4

    ; Skip door lag and segment timer when shinetune enabled
    LDA !sram_display_mode : CMP #$0007 : BEQ .end

    ; Door lag
    LDA !ram_last_door_lag_frames : LDX #$00C2 : JSR Draw3

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
        LDA [$00] : LDX #$00AE : JSR Draw3

        ; Draw decimal seperators
        LDA !IH_DECIMAL : STA $7EC6B4 : STA $7EC6BA
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
    RTL
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
    LDX #$0092 : JSR Draw4
    LDA !IH_BLANK : STA $7EC690 ; erase stale decimal tile

  .end
    PLB
    ; overwritten code
    REP #$30
    LDA $7E09C0
    RTL
}

incsrc infohudmodes.asm

;---SUBROUTINES---
Draw2:
{
    STA $4204
    %a8()
    LDA #$0A : STA $4206   ; divide by 10
    %a16()
    PEA $0000 : PLA
    LDA $4214 : STA $16

    ; Ones digit
    LDA $4216 : ASL A : TAY : LDA.w NumberGFXTable,Y : STA $7EC602,X

    ; Tens digit
    LDA $16 : BEQ .blanktens : ASL A : TAY : LDA.w NumberGFXTable,Y : STA $7EC600,X

  .done
    INX #4
    RTS

  .blanktens
    LDA #$0057 : STA $7EC600,X
    BRA .done
}

Draw3:
{
    STA $4204
    %a8()
    LDA #$0A : STA $4206   ; divide by 10
    %a16()
    PEA $0000 : PLA
    LDA $4214 : STA $16

    ; Ones digit
    LDA $4216 : ASL A : TAY : LDA.w NumberGFXTable,Y : STA $7EC604,X

    LDA $16 : BEQ .blanktens
    STA $4204
    %a8()
    LDA #$0A : STA $4206   ; divide by 10
    %a16()
    PEA $0000 : PLA
    LDA $4214 : STA $14

    ; Tens digit
    LDA $4216 : ASL A : TAY : LDA.w NumberGFXTable,Y : STA $7EC602,X

    ; Hundreds digit
    LDA $14 : BEQ .blankhundreds : ASL A : TAY : LDA.w NumberGFXTable,Y : STA $7EC600,X

  .done
    INX #6
    RTS

  .blanktens
    LDA #$0057 : STA $7EC600,X : STA $7EC602,X
    BRA .done

  .blankhundreds
    LDA #$0057 : STA $7EC600,X
    BRA .done
}

Draw4:
{
    STA $4204
    %a8()
    LDA #$0A : STA $4206   ; divide by 10
    %a16()
    PEA $0000 : PLA
    LDA $4214 : STA $16

    ; Ones digit
    LDA $4216 : ASL A : TAY : LDA.w NumberGFXTable,Y : STA $7EC606,X

    LDA $16 : BEQ .blanktens
    STA $4204
    %a8()
    LDA #$0A : STA $4206   ; divide by 10
    %a16()
    PEA $0000 : PLA
    LDA $4214 : STA $14

    ; Tens digit
    LDA $4216 : ASL A : TAY : LDA.w NumberGFXTable,Y : STA $7EC604,X

    LDA $14 : BEQ .blankhundreds
    STA $4204
    %a8()
    LDA #$0A : STA $4206   ; divide by 10
    %a16()
    PEA $0000 : PLA
    LDA $4214 : STA $12

    ; Hundreds digit
    LDA $4216 : ASL A : TAY : LDA.w NumberGFXTable,Y : STA $7EC602,X

    ; Thousands digit
    LDA $12 : BEQ .blankthousands : ASL A : TAY : LDA.w NumberGFXTable,Y : STA $7EC600,X

  .done
    INX #8
    RTS

  .blanktens
    LDA #$0057 : STA $7EC600,X : STA $7EC602,X : STA $7EC604,X
    BRA .done

  .blankhundreds
    LDA #$0057 : STA $7EC600,X : STA $7EC602,X
    BRA .done

  .blankthousands
    LDA #$0057 : STA $7EC600,X
    BRA .done
}

Draw4Hex:
{
    STA $12 : AND #$F000              ; get first digit (X000)
    XBA : LSR #3                      ; move it to last digit (000X) and shift left one
    TAY : LDA.w HexGFXTable,Y         ; load tilemap address with 2x digit as index
    STA $7EC600,X                     ; draw digit to HUD

    LDA $12 : AND #$0F00              ; (0X00)
    XBA : ASL
    TAY : LDA.w HexGFXTable,Y
    STA $7EC602,X

    LDA $12 : AND #$00F0              ; (00X0)
    LSR #3 : TAY : LDA.w HexGFXTable,Y
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
    LDX #$0088 : JSR Draw4
    RTL
}


ih_game_loop_code:
{
    PHA

    LDA !ram_transition_counter : INC : STA !ram_transition_counter
    LDA !ram_magic_pants_enabled : BEQ .infiniteammo
    CMP #$0001 : BEQ .magicpants
    CMP #$0002 : BEQ .spacepants

    ; both are enabled, check Samus movement type to decide
    LDA $0A1F : AND #$00FF : CMP #$0003 : BEQ .spacepants    ; check if spin jumping
    LDA $0A1F : AND #$00FF : CMP #$0001 : BEQ .magicpants    ; check if running
    BRA .infiniteammo

  .magicpants
    JSR magic_pants
    BRA .infiniteammo

  .spacepants
    JSR space_pants

  .infiniteammo
    LDA !ram_infinite_ammo : CMP !ram_infiniteammo_check : BMI .reset_ammo_check
    BEQ .handleinputs
    JSR infinite_ammo
    BRA .handleinputs

  .reset_ammo_check
    LDA #$0000 : STA !ram_infiniteammo_check
    LDA !ram_ammo_missiles : STA $7E09C6
    LDA !ram_ammo_supers : STA $7E09CA
    LDA !ram_ammo_powerbombs : STA $7E09CE

  .handleinputs
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
    CMP #$0012
    BNE +
    LDA #$0000
+   STA !sram_display_mode
    JMP .update_status

  .dec_statusdisplay
    LDA !sram_display_mode
    DEC A
    CMP #$FFFF
    BNE +
    LDA #$0011
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
    LDA !ram_magic_pants_state : BEQ +
    LDA !ram_magic_pants_pal1 : STA $7EC194
    LDA !ram_magic_pants_pal2 : STA $7EC196
    LDA !ram_magic_pants_pal3 : STA $7EC19E
    LDA #$0000 : STA !ram_magic_pants_state
+   RTS

  .check
    LDA $0A1F : AND #$00FF : CMP #$0001 : BEQ .flash
    RTS

  .flash
    LDA !ram_magic_pants_state : BNE +
    LDA $7EC194 : STA !ram_magic_pants_pal1
    LDA $7EC196 : STA !ram_magic_pants_pal2
    LDA $7EC19E : STA !ram_magic_pants_pal3
+   LDA #$FFFF
    STA $7EC194 : STA $7EC196 : STA $7EC19E
    STA !ram_magic_pants_state
    RTS
}

space_pants:
{
+   LDA $0A1C : CMP #$001B : BEQ .checkFalling
    CMP #$001C : BEQ .checkFalling
    CMP #$0081 : BEQ .checkFalling
    CMP #$0082 : BEQ .checkFalling
  .reset
    ; restore palettes if needed
    LDA !ram_magic_pants_state : BEQ .RTS
    LDA !ram_magic_pants_pal1 : STA $7EC194
    LDA !ram_magic_pants_pal2 : STA $7EC196
    LDA !ram_magic_pants_pal3 : STA $7EC198
    LDA #$0000 : STA !ram_magic_pants_state
  .RTS
    RTS

  .checkFalling
    LDA $0B36 : CMP #$0002 : BNE .reset    ; check if falling

  .checkLiquid
    LDA $0AD2 : BNE .SJliquid             ; check if air

    LDA $0B2D : CMP $909E97 : BPL +       ; check against min SJ vspeed for air
    BRA .reset
+   CMP $909E99 : BPL .reset              ; check against max SJ vspeed for air
    BRA .flash

  .SJliquid
    LDA $0B2D : CMP $909E9B : BPL +       ; check against min SJ vspeed for liquids
    BRA .reset
+   CMP $909E9D : BPL .reset              ; check against max SJ vspeed for liquids

  .flash
    LDA !ram_magic_pants_state : BNE .done
    ; preserve palettes first
    LDA $7EC194 : STA !ram_magic_pants_pal1
    LDA $7EC196 : STA !ram_magic_pants_pal2
    LDA $7EC198 : STA !ram_magic_pants_pal3
    ; then flash
    LDA #$FFFF
    STA $7EC194 : STA $7EC196 : STA $7EC198
    STA !ram_magic_pants_state

  .done
    RTS
}

space_pants_helper:
{
    LDA !ram_magic_pants_state : BEQ +
    STA $7EC194 : STA $7EC196 : STA $7EC198 : STA $7EC19A : STA $7EC19C : STA $7EC19E
+   LDA $0ACE : INC ; overwritten code
    RTL
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

CustomizePalettes:
    LDA !sram_custompalette_hudoutline : STA $7EC01A
    LDA !sram_custompalette_hudfill : STA $7EC01C
    RTL

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
    dw #$0C70, #$0C71, #$0C72, #$0C73, #$0C74, #$0C75, #$0C76, #$0C77
    dw #$0C78, #$0C79, #$0C7A, #$0C7B, #$0C7C, #$0C7D, #$0C7E, #$0C7F

ControllerTable1:
    dw #$0020, #$0800, #$0010, #$4000, #$0040, #$2000
ControllerTable2:
    dw #$0200, #$0400, #$0100, #$8000, #$0080, #$1000
ControllerGfx1:
    dw #$0C68, #$0C61, #$0C69, #$0C67, #$0C66, #$0C6A
ControllerGfx2:
    dw #$0C60, #$0C63, #$0C62, #$0C7B, #$0C7A, #$0C6B

HexToNumberGFX1:
    dw #$0C09, #$0C09, #$0C09, #$0C09, #$0C09, #$0C09, #$0C09, #$0C09, #$0C09, #$0C09
    dw #$0C00, #$0C00, #$0C00, #$0C00, #$0C00, #$0C00, #$0C00, #$0C00, #$0C00, #$0C00
    dw #$0C01, #$0C01, #$0C01, #$0C01, #$0C01, #$0C01, #$0C01, #$0C01, #$0C01, #$0C01
    dw #$0C02, #$0C02, #$0C02, #$0C02, #$0C02, #$0C02, #$0C02, #$0C02, #$0C02, #$0C02
    dw #$0C03, #$0C03, #$0C03, #$0C03, #$0C03, #$0C03, #$0C03, #$0C03, #$0C03, #$0C03
    dw #$0C04, #$0C04, #$0C04, #$0C04, #$0C04, #$0C04, #$0C04, #$0C04, #$0C04, #$0C04

HexToNumberGFX2:
    dw #$0C09, #$0C00, #$0C01, #$0C02, #$0C03, #$0C04, #$0C05, #$0C06, #$0C07, #$0C08
    dw #$0C09, #$0C00, #$0C01, #$0C02, #$0C03, #$0C04, #$0C05, #$0C06, #$0C07, #$0C08
    dw #$0C09, #$0C00, #$0C01, #$0C02, #$0C03, #$0C04, #$0C05, #$0C06, #$0C07, #$0C08
    dw #$0C09, #$0C00, #$0C01, #$0C02, #$0C03, #$0C04, #$0C05, #$0C06, #$0C07, #$0C08
    dw #$0C09, #$0C00, #$0C01, #$0C02, #$0C03, #$0C04, #$0C05, #$0C06, #$0C07, #$0C08
    dw #$0C09, #$0C00, #$0C01, #$0C02, #$0C03, #$0C04, #$0C05, #$0C06, #$0C07, #$0C08

print pc, " infohud bank80 end"
warnpc $80F000

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
