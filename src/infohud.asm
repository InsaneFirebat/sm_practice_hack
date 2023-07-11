; =======================================================
; InfoHUD timers and stuff
; =======================================================

org $809490
    JMP $9497    ; skip resetting player 2 inputs

org $8094DF
    PLP          ; patch out resetting of controller 2 buttons and enable debug mode
    RTL

org $828B4B      ; optional debug functions
    JML ih_debug_patch

org $80AE29      ; fix for scroll offset misalignment
    JSR ih_fix_scroll_offsets

org $82894F      ; hijack, main game loop: runs EVERY frame (used for room transition timer)
    JSL ih_game_loop_code

org $8095FC      ; hijack, end of NMI routine to update realtime frames
    JML ih_nmi_end

if !FEATURE_VANILLAHUD
; skip the rest of the hijacks if Vanilla HUD build
else
org $809609      ; inc counter if NMI lag branch
    INC !REALTIME_LAG_COUNTER

org $82EE92      ; runs on START GAME
    JSL startgame_seg_timer

org $828B34      ; reset room timers for first room of Ceres
    JML ceres_start_timers
    NOP #2
ceres_start_timers_return:

org $90E6AA      ; hijack, runs on gamestate = 08 (main gameplay), handles most updating HUD information
    JSL ih_gamemode_frame
    NOP #2

org $9493FB      ; hijack, runs when Samus hits a door BTS
    JSL ih_before_room_transition

org $9493B8      ; hijack, runs when Samus hits a door BTS
    JSL ih_before_room_transition

org $82E764      ; hijack, runs when Samus is coming out of a room transition
    JSL ih_after_room_transition
    RTS

org $809B4C      ; hijack, HUD routine (game timer by Quote58)
    JSL ih_hud_code
    NOP

org $8290F6      ; hijack, HUD routine while paused
    JSL ih_hud_code_paused

org $80A16B      ; hijack, adjust room times and update HUD when unpausing
    JSL ih_unpause

org $84889F      ; hijack, runs every time an item is picked up
    JSL ih_get_item_code

if !FEATURE_PAL
org $91DA3D
else             ; hijack, runs after a shinespark has been charged
org $91DAD8
endif
    JSL ih_shinespark_code

if !FEATURE_PAL
org $90F1E1
else             ; hijack, runs when an elevator is activated
org $90F1E4
endif
    JSL ih_elevator_activation

if !FEATURE_PAL
org $A9F053
else             ; hijack, runs when the screen locks to start the hopper/baby cutscene
org $A9F006
endif
    JSL ih_babyskip_segment

if !FEATURE_PAL
org $A98884
else             ; update timers after MB1 fight
org $A98874
endif
    JSL ih_mb1_segment

if !FEATURE_PAL
org $A9B657
else             ; update timers when MB2's health is depleted
org $A9B60A
endif
    JML ih_mb2_segment_1

if !FEATURE_PAL
org $A9BE70
else             ; update timers when baby spawns (off-screen) in MB2 fight
org $A9BE23
endif
    JSL ih_mb2_segment_2

if !FEATURE_PAL
org $A0B937
else             ; update timers when Ridley drops spawn
org $A0B9D4
endif
    JML ih_drops_segment

if !FEATURE_PAL
org $A0BA17
else             ; update timers when Crocomire drops spawn
org $A0BA07
endif
    JML ih_drops_segment

if !FEATURE_PAL
org $A0BA4A
else             ; update timers when Phantoon drops spawn
org $A0BA3A
endif
    JML ih_drops_segment

if !FEATURE_PAL
org $A0BA7D
else             ; update timers when Botwoon drops spawn
org $A0BA6D
endif
    JML ih_drops_segment

if !FEATURE_PAL
org $A0BAB0
else             ; update timers when Kraid drops spawn
org $A0BAA0
endif
    JML ih_drops_segment

if !FEATURE_PAL
org $A0BAE3
else             ; update timers when Bomb Torizo drops spawn
org $A0BAD3
endif
    JML ih_drops_segment

if !FEATURE_PAL
org $A0BB16
else             ; update timers when Golden Torizo drops spawn
org $A0BB06
endif
    JML ih_drops_segment

if !FEATURE_PAL
org $A0BB49
else             ; update timers when Spore Spawn drops spawn
org $A0BB39
endif
    JML ih_drops_segment

if !FEATURE_PAL
org $A0BB7C
else             ; update timers when Draygon drops spawn
org $A0BB6C
endif
    JML ih_drops_segment

if !FEATURE_PAL
org $AAE592
else             ; update timers when statue grabs Samus
org $AAE582
endif
    JSL ih_chozo_segment

org $89AD0A      ; update timers when Samus escapes Ceres
    JSL ih_ceres_elevator_segment

if !FEATURE_PAL
org $A2AA38
else             ; update timers when Samus enters ship
org $A2AA20
endif
    JSL ih_ship_elevator_segment

org $90D340      ; update timers when shinespark bonk sound plays
    JSL ih_shinespark_segment
endif


; Main bank stuff
org $F08000
print pc, " infohud start"

; List this first since it affects bank $84 where we are trying to minimize change
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
    JSL $80818E ; Change bit index to byte index and bitmask
    RTL
}

ih_debug_patch:
{
    LDA !DEBUG_MODE_FLAG : BNE .enabled
    JML $828B54 ; return past debug handler

  .enabled
    JSL $B49809 ; Debug handler
    JML $828B4F ; return
}

ih_nmi_end:
{
    %ai16()

if !FEATURE_VANILLAHUD
else
    ; Room timer
    LDA !ram_realtime_room : INC : STA !ram_realtime_room

    ; Segment real timer
    LDA !ram_seg_rt_frames : INC : STA !ram_seg_rt_frames : CMP.w #60 : BNE +
    LDA #$0000 : STA !ram_seg_rt_frames
    LDA !ram_seg_rt_seconds : INC : STA !ram_seg_rt_seconds : CMP.w #60 : BNE +
    LDA #$0000 : STA !ram_seg_rt_seconds
    LDA !ram_seg_rt_minutes : INC : STA !ram_seg_rt_minutes
endif

    ; Slowdown / Pause / Frame Advance on P2 Dpad
+   LDA !ram_slowdown_mode : BNE +

  .exit
    PLY : PLX : PLA
    PLD : PLB
    RTI

+   CMP #$FFFF : BEQ .pause
    LDA !ram_slowdown_frames : BNE .delay

    ; reset slowdown timer and restore previous inputs
    LDA !ram_slowdown_mode : STA !ram_slowdown_frames
    LDA !ram_slowdown_controller_1 : STA !IH_CONTROLLER_PRI_PREV
    LDA !ram_slowdown_controller_2 : STA !IH_CONTROLLER_SEC_PREV

    JSL $809459 ; Read controller input
    BRA .exit

  .delay
    CMP !ram_slowdown_mode : BNE .decTimer

    ; we just ran a new frame, store previous inputs
    LDA !IH_CONTROLLER_PRI : EOR !IH_CONTROLLER_PRI_NEW : STA !ram_slowdown_controller_1
    LDA !IH_CONTROLLER_SEC : EOR !IH_CONTROLLER_SEC_NEW : STA !ram_slowdown_controller_2

    LDA !ram_slowdown_frames

  .decTimer
    DEC : STA !ram_slowdown_frames

    ; request a lag frame
    %a8() : LDA #$01 : STA !NMI_REQUEST_FLAG : %a16()
    BRA .exit

  .pause
    ; check if we're opening or closing the menu
    LDA !IH_CONTROLLER_PRI : CMP !sram_ctrl_menu : BEQ .frameAdvance
    LDA !ram_slowdown_frames : BMI .frameAdvance

    BNE .checkFrameAdvance
    ; remain paused, store inputs
    INC : STA !ram_slowdown_frames

  .storeInputs
    LDA !IH_CONTROLLER_PRI : EOR !IH_CONTROLLER_PRI_NEW : STA !ram_slowdown_controller_1
    LDA !IH_CONTROLLER_SEC : EOR !IH_CONTROLLER_SEC_NEW : STA !ram_slowdown_controller_2

  .checkFrameAdvance
    LDA !IH_CONTROLLER_SEC_NEW : CMP !IH_PAUSE : BEQ .frameAdvance
    CMP !IH_RESET : BNE .checkFreezeOnLoad
    ; resume normal play
    LDA #$0000 : STA !ram_slowdown_mode : STA !ram_slowdown_frames
    BRA .done

  .checkFreezeOnLoad
    ; option to pause on loadstate
    LDA !ram_freeze_on_load : BEQ .frozen
    LDA !IH_CONTROLLER_PRI_NEW : BEQ .frozen
    ; unfreeze
    LDA #$0000 : STA !ram_slowdown_mode : STA !ram_slowdown_frames
    LDA !SRAM_SEG_TIMER_F : STA !ram_seg_rt_frames
    LDA !SRAM_SEG_TIMER_S : STA !ram_seg_rt_seconds
    LDA !SRAM_SEG_TIMER_M : STA !ram_seg_rt_minutes
    BRA .done

  .frozen
    %a8() : LDA #$01 : STA !NMI_REQUEST_FLAG : %a16()
    BRA .done

  .frameAdvance
    ; run a new frame
    LDA #$0000 : STA !ram_slowdown_frames
    LDA !ram_slowdown_controller_1 : STA !IH_CONTROLLER_PRI_PREV
    LDA !ram_slowdown_controller_2 : STA !IH_CONTROLLER_SEC_PREV
    JSL $809459 ; Read controller input

  .done
    PLY : PLX : PLA
    PLD : PLB
    RTI
}

ih_gamemode_frame:
{
    PHA
    LDA !ram_gametime_room : INC : STA !ram_gametime_room
    PLA

    ; overwritten code
    STZ $0A30 : STZ $0A32
    RTL
}

ih_after_room_transition:
{
    PHX : PHY

    ; update last door times
    LDA !ram_transition_counter : STA !ram_last_door_lag_frames
    LDA !ram_realtime_room : STA !ram_last_realtime_door

    ; clear transition variables
    LDA #$0000 : STA !ram_transition_flag : STA !ram_lag_counter
    STA !REALTIME_LAG_COUNTER ; for lagcounter HUD mode

    ; Check if MBHP needs to be disabled
    LDA !sram_display_mode : CMP !IH_MODE_ROOMSTRAT_INDEX : BNE .check_reset_segment_timer
    LDA !sram_room_strat : CMP !IH_STRAT_MBHP_INDEX : BNE .check_reset_segment_timer
    LDA !ROOM_ID : CMP #$DD58 : BEQ .check_reset_segment_timer
    LDA #$0000 : STA !sram_display_mode

  .check_reset_segment_timer
    LDA !ram_reset_segment_later : BEQ .update_hud
    LDA #$0000 : STA !ram_reset_segment_later
    STA !ram_seg_rt_frames : STA !ram_seg_rt_seconds : STA !ram_seg_rt_minutes
    STA !ram_lag_counter
    LDA #$FFFF : STA !ram_lag_counter_HUD

  .update_hud
    JSL ih_update_hud_code

    ; Reset gametime/transition timer
    LDA #$0000 : STA !ram_transition_counter

    ; Reset realtime timer
    LDA #$0000 : STA !ram_realtime_room

    PLY : PLX

    ; original hijacked code
    LDA #$0008 : STA !GAMEMODE
    RTL
}

ih_before_room_transition:
{
    PHA : PHX : PHY

    ; Save and reset timers
    LDA !ram_transition_flag : CMP #$0001 : BEQ .done
    LDA #$0001 : STA !ram_transition_flag : STA !ram_lag_counter_HUD
    LDA #$0000 : STA !ram_room_has_set_rng

    ; Lag
    LDA !ram_realtime_room : SEC : SBC !ram_transition_counter : STA !ram_last_room_lag
    LDA #$0000 : STA !ram_transition_counter

    ; Gametime
    LDA !ram_gametime_room : STA !ram_last_gametime_room
    LDA #$0000 : STA !ram_gametime_room

    ; Realtime
    LDA !ram_realtime_room : STA !ram_last_realtime_room
    LDA #$0000 : STA !ram_realtime_room : STA !ram_last_realtime_door

    ; Save temp variables
    LDA $12 : PHA
    LDA $14 : PHA

    ; Update HUD
    JSL ih_update_hud_code_before_transition

    ; Restore temp variables
    PLA : STA $14
    PLA : STA $12

    ; Overwrite Enemy HP only
    LDA !sram_display_mode : BNE .done
    LDA !sram_door_display_mode : BEQ .done

    ASL : TAX
    JSR (.status_door_display_table,X)

    ; Suppress Enemy HP display
    LDA !ENEMY_HP : STA !ram_enemy_hp

  .done
    ; Run standard code and return
    PLY : PLX : PLA
    STA !GAMEMODE
    CLC
    RTL

  .status_door_display_table
    dw #$0000 ; off/dummy
    dw status_door_hspeed
    dw status_door_vspeed
    dw status_chargetimer
    dw status_shinetimer
    dw status_dashcounter
    dw status_door_xpos
    dw status_door_ypos
}

ceres_start_timers:
{
    LDA #$0000
    STA !ram_realtime_room : STA !ram_last_realtime_room
    STA !ram_gametime_room : STA !ram_last_gametime_room
    STA !ram_last_room_lag : STA !ram_last_door_lag_frames : STA !ram_transition_counter

    ; overwritten code
    STZ !SCREEN_FADE_DELAY : STZ !SCREEN_FADE_COUNTER
if !FEATURE_VANILLAHUD
else   
    JML ceres_start_timers_return
endif
}

ih_unpause:
; Adds frames when unpausing (nmi is turned off during vram transfers)
{
    ; RT room
    LDA !ram_realtime_room : CLC : ADC.w #41 : STA !ram_realtime_room

    ; RT seg
    LDA !ram_seg_rt_frames : CLC : ADC.w #41 : STA !ram_seg_rt_frames
    CMP.w #60 : BCC .updateHUD
    SEC : SBC.w #60 : STA !ram_seg_rt_frames

    LDA !ram_seg_rt_seconds : INC : STA !ram_seg_rt_seconds
    CMP.w #60 : BCC .updateHUD
    LDA #$0000 : STA !ram_seg_rt_seconds

    LDA !ram_seg_rt_minutes : INC : STA !ram_seg_rt_minutes

  .updateHUD
    JSL ih_update_hud_early

    ; Replace overwritten logic to enable NMI
    JML $80834B
}

ih_elevator_activation:
{
    PHA
    ; Only update if we're in a room and activate an elevator.
    ; Otherwise this will also run when you enter a room already riding one.
    LDA !GAMEMODE : CMP #$0008 : BNE .done

    JSL ih_update_hud_early

  .done
    PLA
    STZ $0A56
    SEC
    RTL
}

ih_babyskip_segment:
{
    ; runs when the screen locks to start the hopper/baby cutscene
    STA $7ECD22 ; overwritten code
    JSL ih_update_hud_early
    RTL
}

ih_mb1_segment:
{
    ; runs during MB1 cutscene when you regain control of Samus, just before music change
if !FEATURE_PAL
    JSL $90F081 ; overwritten code
else
    JSL $90F084 ; overwritten code
endif

    JSL ih_reset_damagecounter
    JML ih_update_hud_early
}

ih_mb2_segment_1:
{
    ; runs when MB2 realizes she has zero HP
    JSL ih_update_hud_early
    ; overwritten code
if !FEATURE_PAL
    LDA #$B938 : STA $0FA8
    JML $A9B938
else
    LDA #$B8EB : STA $0FA8
    JML $A9B8EB
endif
}

ih_mb2_segment_2:
{
    ; runs during baby spawn routine for MB2
    STA $7E7854 ; overwritten code

    JSL ih_reset_damagecounter
    JML ih_update_hud_early
}

ih_reset_damagecounter:
{
    PHA
    LDA #$0000 : STA !ram_countdamage : STA !sram_countdamage
    PLA
    RTL
}

ih_shinespark_segment:
{
    ; runs when shinespark bonk sound plays
    JSL $80914D ; overwritten code

    PHB
    LDA !ram_activated_shine_duration
    LDX #$007C : PHX : PLB : PLB
    JSR Draw2
    LDA #$0000 : STA !ram_activated_shine_duration
    PLB

    JML ih_update_hud_early
}

ih_drops_segment:
{
    ; runs when boss drops spawn
    JSL ih_update_hud_early
    ; overwritten code
    PLP : PLY : PLX
    RTL
}

ih_chozo_segment:
{
    JSL $8090CB ; overwritten code
    JML ih_update_hud_early
}

ih_ceres_elevator_segment:
{
    JSL ih_update_hud_early
if !FEATURE_PAL
    JML $90F081 ; overwritten code
else
    JML $90F084 ; overwritten code
endif
}

ih_ship_elevator_segment:
{
    JSL ih_update_hud_early
if !FEATURE_PAL
    JML $91E35B ; overwritten code
else
    JML $91E3F6 ; overwritten code
endif
}

ih_update_hud_code_before_transition:
{
    PHX : PHY : PHP : PHB
    ; Bank 80
    PEA $8080 : PLB : PLB

    LDA !sram_display_mode : CMP #!IH_MODE_ARMPUMP_INDEX : BNE .update_hud_code

    ; Report armpump room totals
    LDA !ram_momentum_sum : CLC : ADC !ram_momentum_count : LDX #$0088 : JSR Draw4
    LDA !ram_fail_sum : CLC : ADC !ram_fail_count : LDX #$0092 : JSR Draw4
    LDA #$0000 : STA !ram_momentum_count : STA !ram_fail_count
    STA !ram_momentum_sum : STA !ram_fail_sum : STA !ram_roomstrat_counter

  .update_hud_code
    BRA ih_update_hud_code_start

ih_update_hud_code:
{
    PHX : PHY : PHP : PHB
    ; Bank 80
    PEA $8080 : PLB : PLB

  .start
    LDA !ram_minimap : BNE .minimap_hud
    BRL .start_update

  .minimap_vanilla_infohud
    BRL .end

  .minimap_hud
    ; Map visible, so draw map counter over item%
    LDA !sram_top_display_mode : CMP !TOP_HUD_VANILLA_INDEX : BEQ .minimap_vanilla_infohud
    LDA !ram_map_counter : LDX #$0014 : JSR Draw3
    LDA !sram_display_mode : CMP !IH_MODE_SHINETUNE_INDEX : BNE .minimap_roomtimer
    BRL .pick_minimap_transition_time

  .minimap_roomtimer
    STZ $4205
    LDA !sram_frame_counter_mode : BNE .minimap_ingame_roomtimer
    LDA !IH_DECIMAL : STA !HUD_TILEMAP+$B4
    LDA !ram_last_realtime_room
    BRA .minimap_calculate_roomtimer

  .minimap_ingame_roomtimer
    LDA !IH_HYPHEN : STA !HUD_TILEMAP+$B4
    LDA !ram_last_gametime_room

  .minimap_calculate_roomtimer
    ; Divide time by 60 or 50 and draw seconds and frames
    STA $4204
    %a8()
if !FEATURE_PAL
    LDA #$32
else
    LDA #$3C
endif
    STA $4206
    %a16()
    PEA $0000 : PLA ; wait for CPU math
    LDA $4216 : STA $C1
    LDA $4214 : LDX #$00B0 : JSR Draw2
    LDA $C1 : ASL : TAX
    LDA HexToNumberGFX1,X : STA !HUD_TILEMAP+$B6
    LDA HexToNumberGFX2,X : STA !HUD_TILEMAP+$B8

  .pick_minimap_transition_time
    LDA !sram_lag_counter_mode : BNE .minimap_transition_time_full
    LDA !ram_last_door_lag_frames
    BRA .draw_minimap_transition_time
  .minimap_transition_time_full
    LDA !ram_last_realtime_door
  .draw_minimap_transition_time
    LDX #$0054 : JSR Draw3
    BRL .end

  .start_update
    LDA #$FFFF : STA !ram_last_hp : STA !ram_enemy_hp

    ; Determine starting point of time display
    LDX #$003C
    LDA !sram_top_display_mode : CMP !TOP_HUD_VANILLA_INDEX : BNE .pick_roomtimer
    LDX #$003A

  .pick_roomtimer
    STZ $4205
    LDA !sram_frame_counter_mode : BNE .ingame_roomtimer
    LDA !IH_DECIMAL : STA !HUD_TILEMAP+$42
    LDA !ram_last_realtime_room
    BRA .calculate_roomtimer

  .ingame_roomtimer
    LDA !IH_HYPHEN : STA !HUD_TILEMAP+$42
    LDA !ram_last_gametime_room

  .calculate_roomtimer
    ; Divide time by 60 or 50 and draw seconds and frames
    STA $4204
    %a8()
if !FEATURE_PAL
    LDA #$32
else
    LDA #$3C
endif
    STA $4206
    %a16()
    PEA $0000 : PLA ; wait for CPU math
    LDA $4216 : STA $C1
    LDA $4214 : JSR Draw3 : TXY
    LDA $C1 : ASL : TAX
    LDA HexToNumberGFX1,X : PHX : TYX : STA !HUD_TILEMAP+2,X
    PLX : LDA HexToNumberGFX2,X : TYX : STA !HUD_TILEMAP+4,X

    ; 3 tiles between input display and missile icon
    ; skip item% if display mode = vspeed
    LDA !sram_display_mode : CMP !IH_MODE_VSPEED_INDEX : BEQ .skipToLag
    LDA !sram_top_display_mode : BNE .skipToLag

    ; Draw Item percent
    ; Max HP and Reserves
    LDA !SAMUS_HP_MAX : CLC : ADC !SAMUS_RESERVE_MAX
    JSR CalcEtank : STA $C1

    ; Max Missiles, Supers & Power Bombs
    LDA !SAMUS_MISSILES_MAX : CLC : ADC !SAMUS_SUPERS_MAX : CLC : ADC !SAMUS_PBS_MAX
    JSR CalcItem : CLC : ADC $C1 : STA $C1

    ; Collected items
    JSR CalcLargeItem : CLC : ADC $C1 : STA $C1

    ; Collected beams and charge
    JSR CalcBeams : CLC : ADC $C1

    ; Percent counter -> decimal form and drawn on HUD
    LDX #$0012 : JSR Draw3
    LDA !IH_PERCENT : STA !HUD_TILEMAP+$18

  .skipToLag
    LDA !sram_top_display_mode : CMP !TOP_HUD_VANILLA_INDEX : BEQ .vanilla_infohud_draw_lag_and_reserves
    LDA !ram_last_room_lag : LDX #$0082 : JSR Draw3

    ; Skip door lag and segment timer when shinetune enabled
    LDA !sram_display_mode : CMP !IH_MODE_SHINETUNE_INDEX : BEQ .end

    ; Door lag / transition time
    LDA !sram_lag_counter_mode : BNE .transition_time_full
    LDA !ram_last_door_lag_frames
    BRA .infohud_transition_time
  .transition_time_full
    LDA !ram_last_realtime_door
  .infohud_transition_time
    LDX #$00C2 : JSR Draw3
    BRA .pick_segment_timer

  .end
    PLB : PLP : PLY : PLX
    RTL

  .vanilla_infohud_draw_lag_and_reserves
    LDA !SAMUS_RESERVE_MODE : CMP #$0001 : BNE .vanilla_infohud_draw_lag

    ; Draw reserve icon
    LDY #$998B : LDA !SAMUS_RESERVE_ENERGY : BNE .vanilla_draw_reserve_icon
    LDY #$9997

  .vanilla_draw_reserve_icon
    LDA $0000,Y : STA !HUD_TILEMAP+$18 : LDA $0002,Y : STA !HUD_TILEMAP+$1A
    LDA $0004,Y : STA !HUD_TILEMAP+$58 : LDA $0006,Y : STA !HUD_TILEMAP+$5A

  .vanilla_infohud_draw_lag
    LDA !ram_last_room_lag : LDX #$007E : JSR Draw4

    ; Skip door lag and segment timer when shinetune enabled
    LDA !sram_display_mode : CMP !IH_MODE_SHINETUNE_INDEX : BEQ .end

    ; Door lag / transition time
    LDA !sram_lag_counter_mode : BNE .vanilla_infohud_transition_time_full
    LDA !ram_last_door_lag_frames
    BRA .draw_vanilla_infohud_transition_time

  .vanilla_infohud_transition_time_full
    LDA !ram_last_realtime_door

  .draw_vanilla_infohud_transition_time
    LDX #$00C2 : JSR Draw2

  .pick_segment_timer
    LDA !sram_frame_counter_mode : BNE .ingame_segment_timer
    LDA.w #!ram_seg_rt_frames : STA $00
    LDA !WRAM_BANK : STA $02
    BRA .draw_segment_timer

  .ingame_segment_timer
    LDA #$09DA : STA $00
    LDA #$007E : STA $02
    BRA .draw_segment_timer

  .draw_segment_timer
    ; Frames
    LDA [$00] : INC $00 : INC $00 : ASL : TAX
    LDA HexToNumberGFX1,X : STA !HUD_TILEMAP+$BC
    LDA HexToNumberGFX2,X : STA !HUD_TILEMAP+$BE

    ; Seconds
    LDA [$00] : INC $00 : INC $00 : ASL : TAX
    LDA HexToNumberGFX1,X : STA !HUD_TILEMAP+$B6
    LDA HexToNumberGFX2,X : STA !HUD_TILEMAP+$B8

    ; Minutes
    LDA [$00] : LDX #$00AE : JSR Draw3

    ; Draw decimal/hyphen seperators
    LDA !sram_frame_counter_mode : BNE .ingame_separators
    LDA !IH_DECIMAL : STA !HUD_TILEMAP+$B4 : STA !HUD_TILEMAP+$BA
    BRA .blank_end

  .ingame_separators
    LDA !IH_HYPHEN : STA !HUD_TILEMAP+$B4 : STA !HUD_TILEMAP+$BA

  .blank_end
    LDA !IH_BLANK : STA !HUD_TILEMAP+$C0
    BRL .end
}

ih_update_hud_early:
{
    PHA : PHX : PHY

    ; calculate lag frames
    LDA !ram_realtime_room : SEC : SBC !ram_transition_counter : STA !ram_last_room_lag

    LDA !ram_gametime_room : STA !ram_last_gametime_room
    LDA !ram_realtime_room : STA !ram_last_realtime_room

    ; update HUD
    LDA $12 : PHA
    LDA $14 : PHA

    JSL ih_update_timers

    PLA : STA $14
    PLA : STA $12

    PLY : PLX : PLA
    RTL
}

ih_update_timers:
{
    ; Bank 80
    PHB : PEA $8080 : PLB : PLB

    LDA !ram_minimap : BNE .minimap_hud
    BRL .start_update

  .minimap_vanilla_infohud
    BRL .end

  .minimap_hud
    ; Map visible, so draw map counter over item%
    LDA !sram_top_display_mode : CMP !TOP_HUD_VANILLA_INDEX : BEQ .minimap_vanilla_infohud
    LDA !ram_map_counter : LDX #$0014 : JSR Draw3
    LDA !sram_display_mode : CMP !IH_MODE_SHINETUNE_INDEX : BNE .minimap_roomtimer
    BRL .pick_minimap_transition_time

  .minimap_roomtimer
    STZ $4205
    LDA !sram_frame_counter_mode : BNE .minimap_ingame_roomtimer
    LDA !IH_DECIMAL : STA !HUD_TILEMAP+$B4
    LDA !ram_last_realtime_room
    BRA .minimap_calculate_roomtimer

  .minimap_ingame_roomtimer
    LDA !IH_HYPHEN : STA !HUD_TILEMAP+$B4
    LDA !ram_last_gametime_room

  .minimap_calculate_roomtimer
    ; Divide time by 60 or 50 and draw seconds and frames
    STA $4204
    %a8()
if !FEATURE_PAL
    LDA #$32
else
    LDA #$3C
endif
    STA $4206
    %a16()
    PEA $0000 : PLA ; wait for CPU math
    LDA $4216 : STA $C1
    LDA $4214 : LDX #$00B0 : JSR Draw2
    LDA $C1 : ASL : TAX
    LDA.w HexToNumberGFX1,X : STA !HUD_TILEMAP+$B6
    LDA.w HexToNumberGFX2,X : STA !HUD_TILEMAP+$B8

  .pick_minimap_transition_time
    LDA !sram_lag_counter_mode : BNE .minimap_transition_time_full
    LDA !ram_last_door_lag_frames
    BRA .draw_minimap_transition_time
  .minimap_transition_time_full
    LDA !ram_last_realtime_door
  .draw_minimap_transition_time
    LDX #$0054 : JSR Draw3
    BRL .end

  .start_update
    ; force redraw of Samus HP
    LDA #$FFFF : STA !ram_last_hp : STA !ram_enemy_hp

    ; Determine starting point of time display
    LDX #$003C
    LDA !sram_top_display_mode : CMP !TOP_HUD_VANILLA_INDEX : BNE .pick_roomtimer
    LDX #$003A

  .pick_roomtimer
    STZ $4205
    LDA !sram_frame_counter_mode : BNE .ingame_roomtimer
    LDA !IH_DECIMAL : STA !HUD_TILEMAP+$42
    LDA !ram_last_realtime_room
    BRA .calculate_roomtimer

  .ingame_roomtimer
    LDA !IH_HYPHEN : STA !HUD_TILEMAP+$42
    LDA !ram_last_gametime_room

  .calculate_roomtimer
    ; Divide time by 60 or 50 and draw seconds and frames
    STA $4204
    %a8()
if !FEATURE_PAL
    LDA #$32
else
    LDA #$3C
endif
    STA $4206
    %a16()
    PEA $0000 : PLA ; wait for CPU math
    LDA $4216 : STA $C1
    LDA $4214 : JSR Draw3
    LDA $C1 : ASL : TAY
    LDA.w HexToNumberGFX1,Y : STA !HUD_TILEMAP+2,X
    LDA.w HexToNumberGFX2,Y : STA !HUD_TILEMAP+4,X

    ; Lag counter
    LDA !sram_top_display_mode : CMP !TOP_HUD_VANILLA_INDEX : BEQ .vanilla_infohud_draw_lag_and_reserves
    LDA !ram_last_room_lag : LDX #$0082 : JSR Draw3

    ; Skip door lag and segment timer when shinetune enabled
    LDA !sram_display_mode : CMP !IH_MODE_SHINETUNE_INDEX : BEQ .end

    ; Door lag / transition time
    LDA !sram_lag_counter_mode : BNE .transition_time_full
    LDA !ram_last_door_lag_frames
    BRA .infohud_transition_time
  .transition_time_full
    LDA !ram_last_realtime_door
  .infohud_transition_time
    LDX #$00C2 : JSR Draw3
    BRA .pick_segment_timer

  .end
    PLB
    RTL

  .vanilla_infohud_draw_lag_and_reserves
    LDA !SAMUS_RESERVE_MODE : CMP #$0001 : BNE .vanilla_infohud_draw_lag

    ; Draw reserve icon
    LDY #$998B : LDA !SAMUS_RESERVE_ENERGY : BNE .vanilla_draw_reserve_icon
    LDY #$9997

  .vanilla_draw_reserve_icon
    LDA $0000,Y : STA !HUD_TILEMAP+$18 : LDA $0002,Y : STA !HUD_TILEMAP+$1A
    LDA $0004,Y : STA !HUD_TILEMAP+$58 : LDA $0006,Y : STA !HUD_TILEMAP+$5A

  .vanilla_infohud_draw_lag
    LDA !ram_last_room_lag : LDX #$007E : JSR Draw4

    ; Skip door lag and segment timer when shinetune enabled
    LDA !sram_display_mode : CMP !IH_MODE_SHINETUNE_INDEX : BEQ .end

    ; Door lag / transition time
    LDA !sram_lag_counter_mode : BNE .vanilla_infohud_transition_time_full
    LDA !ram_last_door_lag_frames
    BRA .draw_vanilla_infohud_transition_time

  .vanilla_infohud_transition_time_full
    LDA !ram_last_realtime_door

  .draw_vanilla_infohud_transition_time
    LDX #$00C2 : JSR Draw2

  .pick_segment_timer
    LDA !sram_frame_counter_mode : BNE .ingame_segment_timer
    LDA !IH_DECIMAL : STA !HUD_TILEMAP+$B4 : STA !HUD_TILEMAP+$BA
    LDA.w #!ram_seg_rt_frames : STA $00
    LDA !WRAM_BANK : STA $02
    BRA .draw_segment_timer

  .ingame_segment_timer
    LDA !IH_HYPHEN : STA !HUD_TILEMAP+$B4 : STA !HUD_TILEMAP+$BA
    LDA #$09DA : STA $00
    LDA #$007E : STA $02
    BRA .draw_segment_timer

  .draw_segment_timer
    ; Frames
    LDA [$00] : INC $00 : INC $00 : ASL : TAX
    LDA.w HexToNumberGFX1,X : STA !HUD_TILEMAP+$BC
    LDA.w HexToNumberGFX2,X : STA !HUD_TILEMAP+$BE

    ; Seconds
    LDA [$00] : INC $00 : INC $00 : ASL : TAX
    LDA.w HexToNumberGFX1,X : STA !HUD_TILEMAP+$B6
    LDA.w HexToNumberGFX2,X : STA !HUD_TILEMAP+$B8

    ; Minutes
    LDA [$00] : LDX #$00AE : JSR Draw3

    LDA !IH_BLANK : STA !HUD_TILEMAP+$C0
    BRL .end
}

ih_hud_vanilla_health:
{
    LDA !SAMUS_HP : STA !SAMUS_LAST_HP : STA $4204
    %a8()
    LDA #$64 : STA $4206
    %a16()
    PEA $0000 : PLA ; wait for CPU math
    LDA $4214 : STA $14
    LDA $4216 : STA $12
    LDA !SAMUS_HP_MAX : STA $4204
    %a8()
    LDA #$64 : STA $4206
    %a16()
    PEA $0000 : PLA ; wait for CPU math
    LDY #$0000 : LDA $4214
    INC : STA $16

  .vanilla_loop_tanks
    DEC $16 : BEQ .vanilla_draw_empty_tanks
    LDX #$3430
    LDA $14 : BEQ .vanilla_draw_tank_health
    DEC $14 : LDX #$2831

  .vanilla_draw_tank_health
    TXA : LDX $9CCE,Y : STA !HUD_TILEMAP+$08,X
    INY #2 : CPY #$001C : BMI .vanilla_loop_tanks
    BRA .vanilla_subtank_health

  .vanilla_draw_empty_tanks
    LDA !IH_BLANK

  .vanilla_loop_empty_tanks
    LDX $9CCE,Y : STA !HUD_TILEMAP+$08,X
    INY #2 : CPY #$001C : BMI .vanilla_loop_empty_tanks

  .vanilla_subtank_health
    LDA $12 : LDX #$0094 : JSR Draw2
    LDA $16 : BNE .vanilla_subtank_whitespace
    ; Draw the leading zero
    LDA.w NumberGFXTable : STA !HUD_TILEMAP+$94

  .vanilla_subtank_whitespace
    LDA !IH_BLANK : STA !HUD_TILEMAP+$92 : STA !HUD_TILEMAP+$98 : STA !HUD_TILEMAP+$9A
    STA !HUD_TILEMAP+$08 : STA !HUD_TILEMAP+$48 : STA !HUD_TILEMAP+$88
    LDA !SAMUS_RESERVE_MODE : CMP #$0001 : BNE .vanilla_no_reserves

    ; Draw reserve icon
    LDY #$998B : LDA !SAMUS_RESERVE_ENERGY : BNE .vanilla_draw_reserve_icon
    LDY #$9997

  .vanilla_draw_reserve_icon
    LDA $0000,Y : STA !HUD_TILEMAP+$18 : LDA $0002,Y : STA !HUD_TILEMAP+$1A
    LDA $0004,Y : STA !HUD_TILEMAP+$58 : LDA $0006,Y : STA !HUD_TILEMAP+$5A
    RTS

  .vanilla_no_reserves
    LDA !IH_BLANK : STA !HUD_TILEMAP+$18 : STA !HUD_TILEMAP+$1A : STA !HUD_TILEMAP+$58 : STA !HUD_TILEMAP+$5A
    RTS
}

ih_hud_code:
{
    %ai16()

    ; fix data bank register
    PHB
    PEA $8080 : PLB : PLB

    LDA !sram_top_display_mode : CMP !TOP_HUD_VANILLA_INDEX : BEQ .vanilla_infohud

; -- input display --
    ; -- check if we want to update --
    LDA !IH_CONTROLLER_PRI : CMP !ram_ih_controller : BNE .controller_update
    BRL .status_display

  .controller_update
    ; -- read input
    TAY : LDX #$0000

-   TYA : AND ControllerTable1,X : BEQ .ctrl_1_blank
    LDA ControllerGfx1,X : BRA +
  .ctrl_1_blank
    LDA !IH_BLANK
+   STA !HUD_TILEMAP+$08,X
    INX #2 : CPX #$000C : BNE -

    LDX #$0000
-   TYA : AND ControllerTable2,X : BEQ .ctrl_2_blank
    LDA ControllerGfx2,X : BRA +
  .ctrl_2_blank
    LDA !IH_BLANK
+   STA !HUD_TILEMAP+$48,X
    INX #2 : CPX #$000C : BNE -

    TYA : STA !ram_ih_controller
    BRA .status_display

  .vanilla_infohud
    ; Shift infohud status left by one
    LDA !HUD_TILEMAP+$8A : STA !HUD_TILEMAP+$88
    LDA !HUD_TILEMAP+$8C : STA !HUD_TILEMAP+$8A
    LDA !HUD_TILEMAP+$8E : STA !HUD_TILEMAP+$8C
    LDA !HUD_TILEMAP+$90 : STA !HUD_TILEMAP+$8E

  .status_display
    LDA !sram_display_mode : ASL : TAX
    JSR (.status_display_table,X)

; Samus' HP
    LDA !SAMUS_HP : CMP !ram_last_hp : BEQ .reserves : STA !ram_last_hp
    LDA !sram_top_display_mode : CMP !TOP_HUD_VANILLA_INDEX : BEQ .vanilla_draw_health
    LDA !SAMUS_HP : LDX #$0092 : JSR Draw4
    LDA !IH_BLANK : STA !HUD_TILEMAP+$90 : STA !HUD_TILEMAP+$9A
    BRA .reserves

  .vanilla_check_health
    LDA !SAMUS_HP : CMP !SAMUS_LAST_HP : BEQ .vanilla_health_end

  .vanilla_draw_health
    JSR ih_hud_vanilla_health

  .vanilla_health_end
    ; Shift infohud status right by one
    LDA !HUD_TILEMAP+$8E : STA !HUD_TILEMAP+$90
    LDA !HUD_TILEMAP+$8C : STA !HUD_TILEMAP+$8E
    LDA !HUD_TILEMAP+$8A : STA !HUD_TILEMAP+$8C
    LDA !HUD_TILEMAP+$88 : STA !HUD_TILEMAP+$8A
    LDA !IH_BLANK : STA !HUD_TILEMAP+$88
    BRL .end

; Reserve energy counter
  .reserves
    LDA !sram_top_display_mode : BEQ .statusIcons
    CMP !TOP_HUD_VANILLA_INDEX : BEQ .vanilla_check_health

    LDA !SAMUS_RESERVE_MAX : BEQ .noReserves
    LDA !SAMUS_RESERVE_ENERGY : CMP !ram_reserves_last : BEQ .checkAuto
    STA !ram_reserves_last : LDX #$0014 : JSR Draw3

  .checkAuto
    LDA !SAMUS_RESERVE_MODE : CMP #$0001 : BEQ .autoOn

    LDA !IH_BLANK : STA !HUD_TILEMAP+$1A
    BRA .statusIcons

  .autoOn
    LDA !SAMUS_RESERVE_ENERGY : BEQ .autoEmpty
    LDA !IH_RESERVE_AUTO : STA !HUD_TILEMAP+$1A
    BRA .statusIcons

  .autoEmpty
    LDA !IH_RESERVE_EMPTY : STA !HUD_TILEMAP+$1A
    BRA .statusIcons

  .noReserves
    LDA !IH_BLANK
    STA !HUD_TILEMAP+$14 : STA !HUD_TILEMAP+$16
    STA !HUD_TILEMAP+$18 : STA !HUD_TILEMAP+$1A

; Status Icons
  .statusIcons
    LDA !sram_status_icons : BNE +
    JMP .end

    ; check for Super HUD
+   LDA !sram_display_mode : CMP !IH_MODE_ROOMSTRAT_INDEX : BNE +
    LDA !sram_room_strat : BNE +
    JMP .end
    
    ; elevator
+   LDA $0E16 : BEQ .clearElevator
    LDA !IH_ELEVATOR : STA !HUD_TILEMAP+$56
    BRA +

  .clearElevator
    LDA !IH_BLANK : STA !HUD_TILEMAP+$56

    ; shinespark
+   LDA !SAMUS_SHINE_TIMER : BEQ .clearSpark
    LDA !IH_SHINESPARK : STA !HUD_TILEMAP+$58
    BRA +

  .clearSpark
    LDA !IH_BLANK : STA !HUD_TILEMAP+$58

    ; health bomb
+   LDA !SAMUS_HEALTH_DROP_FLAG : BEQ .clearHealthBomb
    LDA !SAMUS_HP : CMP #$0032 : BMI .pink
    LDA !IH_LETTER_E : STA !HUD_TILEMAP+$54
    BRA +

  .pink
    LDA !IH_HEALTHBOMB : STA !HUD_TILEMAP+$54
    BRA +

  .clearHealthBomb
    LDA !IH_BLANK : STA !HUD_TILEMAP+$54

    ; reserve tank
+   LDA !SAMUS_RESERVE_MODE : CMP #$0001 : BNE .clearReserve
    LDA !SAMUS_RESERVE_ENERGY : BEQ .empty

    LDA !SAMUS_RESERVE_MAX : BEQ .clearReserve
    LDA !IH_RESERVE_AUTO : STA !HUD_TILEMAP+$1A
    BRA +

  .empty
    LDA !SAMUS_RESERVE_MAX : BEQ .clearReserve
    LDA !IH_RESERVE_EMPTY : STA !HUD_TILEMAP+$1A
    BRA +

  .clearReserve
    LDA !IH_BLANK : STA !HUD_TILEMAP+$1A

  .end
+   PLB
    ; overwritten code
    %ai16()
    LDA !SAMUS_RESERVE_MODE
    RTL
}

incsrc infohudmodes.asm

;---SUBROUTINES---
Draw2:
{
    STA $4204
    %a8()
    ; divide by 10
    LDA #$0A : STA $4206
    %a16()
    PEA $0000 : PLA ; wait for CPU math
    LDA $4214 : STA $16 ; tens

    ; Ones digit
    LDA $4216 : ASL : TAY
    LDA.w NumberGFXTable,Y : STA !HUD_TILEMAP+2,X

    ; Tens digit
    LDA $16 : BEQ .blanktens : ASL : TAY
    LDA.w NumberGFXTable,Y : STA !HUD_TILEMAP,X

  .done
    INX #4
    RTS

  .blanktens
    LDA !IH_BLANK : STA !HUD_TILEMAP,X
    BRA .done
}

Draw3:
{
    STA $4204
    %a8()

    ; divide by 10
    LDA #$0A : STA $4206
    %a16()
    PEA $0000 : PLA ; wait for CPU math
    LDA $4214 : STA $16 ; tens

    ; Ones digit
    LDA $4216 : ASL : TAY
    LDA.w NumberGFXTable,Y : STA !HUD_TILEMAP+4,X

    LDA $16 : BEQ .blanktens
    STA $4204
    %a8()

    ; divide by 10
    LDA #$0A : STA $4206
    %a16()
    PEA $0000 : PLA ; wait for CPU math
    LDA $4214 : STA $14 ; hundreds

    ; Tens digit
    LDA $4216 : ASL : TAY
    LDA.w NumberGFXTable,Y : STA !HUD_TILEMAP+2,X

    ; Hundreds digit
    LDA $14 : BEQ .blankhundreds : ASL : TAY
    LDA.w NumberGFXTable,Y : STA !HUD_TILEMAP,X

  .done
    INX #6
    RTS

  .blanktens
    LDA !IH_BLANK : STA !HUD_TILEMAP,X : STA !HUD_TILEMAP+2,X
    BRA .done

  .blankhundreds
    LDA !IH_BLANK : STA !HUD_TILEMAP,X
    BRA .done
}

Draw4:
{
    STA $4204
    %a8()

    ; divide by 10
    LDA #$0A : STA $4206
    %a16()
    PEA $0000 : PLA ; wait for CPU math
    LDA $4214 : STA $16 ; tens

    ; Ones digit
    LDA $4216 : ASL : TAY
    LDA.w NumberGFXTable,Y : STA !HUD_TILEMAP+6,X

    LDA $16 : BEQ .blanktens
    STA $4204
    %a8()

    ; divide by 10
    LDA #$0A : STA $4206
    %a16()
    PEA $0000 : PLA ; wait for CPU math
    LDA $4214 : STA $14 ; hundreds

    ; Tens digit
    LDA $4216 : ASL : TAY
    LDA.w NumberGFXTable,Y : STA !HUD_TILEMAP+4,X

    LDA $14 : BEQ .blankhundreds
    STA $4204
    %a8()

    ; divide by 10
    LDA #$0A : STA $4206
    %a16()
    PEA $0000 : PLA ; wait for CPU math
    LDA $4214 : STA $12 ; thousands

    ; Hundreds digit
    LDA $4216 : ASL : TAY
    LDA.w NumberGFXTable,Y : STA !HUD_TILEMAP+2,X

    ; Thousands digit
    LDA $12 : BEQ .blankthousands : ASL : TAY
    LDA.w NumberGFXTable,Y : STA !HUD_TILEMAP,X

  .done
    INX #8
    RTS

  .blanktens
    LDA !IH_BLANK
    STA !HUD_TILEMAP,X : STA !HUD_TILEMAP+2,X : STA !HUD_TILEMAP+4,X
    BRA .done

  .blankhundreds
    LDA !IH_BLANK : STA !HUD_TILEMAP,X : STA !HUD_TILEMAP+2,X
    BRA .done

  .blankthousands
    LDA !IH_BLANK : STA !HUD_TILEMAP,X
    BRA .done
}

DrawHealthPaused:
{
    LDA !sram_top_display_mode : BEQ .draw_health
    CMP !TOP_HUD_VANILLA_INDEX : BEQ .vanilla_draw_health

    LDA !SAMUS_RESERVE_MAX : BEQ .noReserves
    LDA !SAMUS_RESERVE_ENERGY : STA !ram_reserves_last
    LDX #$0014 : JSR Draw3
    LDA !SAMUS_RESERVE_MODE : CMP #$0001 : BEQ .autoOn
    LDA !IH_BLANK : STA !HUD_TILEMAP+$1A
    BRA .draw_health

  .autoOn
    LDA !SAMUS_RESERVE_ENERGY : BEQ .autoEmpty
    LDA !IH_RESERVE_AUTO : STA !HUD_TILEMAP+$1A
    BRA .draw_health

  .autoEmpty
    LDA !IH_RESERVE_EMPTY : STA !HUD_TILEMAP+$1A
    BRA .draw_health

  .noReserves
    LDA !IH_BLANK
    STA !HUD_TILEMAP+$14 : STA !HUD_TILEMAP+$16
    STA !HUD_TILEMAP+$18 : STA !HUD_TILEMAP+$1A
    LDA !SAMUS_RESERVE_ENERGY : STA !ram_reserves_last

  .draw_health
    LDA !SAMUS_HP : LDX #$0092 : JSR Draw4
    LDA !IH_BLANK : STA !HUD_TILEMAP+$90 : STA !HUD_TILEMAP+$9A
    RTL

  .vanilla_draw_health
    JSR ih_hud_vanilla_health
    RTL
}

Draw4Hex:
{
    STA $12 : AND #$F000              ; get first digit (X000)
    XBA : LSR #3                      ; move it to last digit (000X) and shift left one
    TAY : LDA.w HexGFXTable,Y         ; load tilemap address with 2x digit as index
    STA !HUD_TILEMAP,X                ; draw digit to HUD

    LDA $12 : AND #$0F00              ; (0X00)
    XBA : ASL
    TAY : LDA.w HexGFXTable,Y
    STA !HUD_TILEMAP+2,X

    LDA $12 : AND #$00F0              ; (00X0)
    LSR #3 : TAY : LDA.w HexGFXTable,Y
    STA !HUD_TILEMAP+4,X

    LDA $12 : AND #$000F              ; (000X)
    ASL : TAY : LDA.w HexGFXTable,Y
    STA !HUD_TILEMAP+6,X
    RTS
}

Draw4Hundredths:
{
    STA $4204
    %a8()

    ; divide by 10
    LDA #$0A : STA $4206
    %a16()
    PEA $0000 : PLA ; wait for CPU math

    ; Ones digit ignored, go straight to tens digit
    LDA $4214 : BEQ .zerotens
    STA $4204
    %a8()

    ; divide by 10
    LDA #$0A : STA $4206   ; divide by 10
    %a16()
    PEA $0000 : PLA ; wait for CPU math
    LDA $4214 : STA $14 ; hundreds

    ; Tens digit
    LDA $4216 : ASL : TAY
    LDA.w NumberGFXTable,Y : STA !HUD_TILEMAP+6,X

    LDA $14 : BEQ .zerohundreds
    STA $4204
    %a8()

    ; divide by 10
    LDA #$0A : STA $4206   ; divide by 10
    %a16()
    PEA $0000 : PLA ; wait for CPU math
    LDA $4214 : STA $12 ; thousands

    ; Hundreds digit
    LDA $4216 : ASL : TAY
    LDA.w NumberGFXTable,Y : STA !HUD_TILEMAP+4,X

    ; Thousands digit
    LDA $12 : ASL : TAY
    LDA.w NumberGFXTable,Y : STA !HUD_TILEMAP,X

  .done
    LDA !IH_DECIMAL : STA !HUD_TILEMAP+2,X
    INX #8
    RTS

  .zerotens
    LDA #$0C09
    STA !HUD_TILEMAP,X : STA !HUD_TILEMAP+4,X : STA !HUD_TILEMAP+6,X
    BRA .done

  .zerohundreds
    LDA #$0C09 : STA !HUD_TILEMAP,X : STA !HUD_TILEMAP+4,X
    BRA .done
}

CalcEtank:
{
    STA $4204
    %a8()

    ; divide by 100
    LDA #$64 : STA $4206
    %a16()
    PEA $0000 : PLA ; wait for CPU math
    LDA $4214
    RTS
}

CalcItem:
{
    STZ $4214 : STA $4204
    %a8()

    ; divide by 5
    LDA #$05 : STA $4206
    %a16()
    PEA $0000 : PLA ; wait for CPU math
    LDA $4214
    RTS
}

CalcLargeItem:
{
    ; GT Code adds an unused item (10h)
    LDA !SAMUS_ITEMS_COLLECTED : AND #$F32F

    LDX #$0000
  .loop
    BIT #$0001 : BEQ .noItem
    INX ; count items in X

  .noItem
    LSR : BNE .loop
    TXA
    RTS
}

CalcBeams:
{
    PHP : %a8()
    LDA !SAMUS_BEAMS_COLLECTED : LDX #$0000
  .loop
    BIT #$01 : BEQ .noItem
    INX ; count beams in X

  .noItem
    LSR : BNE .loop

    ; check for Charge
    LDA !SAMUS_BEAMS_COLLECTED+1 : CMP #$10 : BNE .done
    INX

  .done
    TXA

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

    ; inc transition timer
    LDA !ram_transition_counter : INC : STA !ram_transition_counter

    ; check for optional features
    LDA !ram_game_loop_extras : BEQ .handleinputs

    ; Optional features
    LDA !ram_metronome : BEQ +
    JSR metronome

+   LDA !ram_magic_pants_enabled : XBA : ORA !ram_space_pants_enabled
if !FEATURE_EXTRAS
    BEQ .infiniteammo
else
+   BEQ .handleinputs
endif
    BIT #$00FF : BEQ .magicpants    ; if spacepants are disabled, handle magicpants
    BIT #$FF00 : BEQ .spacepants    ; if magicpants are disabled, handle spacepants

    ; both are enabled, check Samus movement type to decide
    LDA $0A1F : AND #$00FF : CMP #$0001 : BEQ .magicpants    ; check if running
if !FEATURE_EXTRAS
    BRA .infiniteammo
else
    BRA .handleinputs
endif

  .magicpants
    JSR magic_pants
if !FEATURE_EXTRAS
    BRA .infiniteammo
else
    BRA .handleinputs
endif

  .spacepants
    JSR space_pants

  .infiniteammo
    LDA !ram_infinite_ammo : CMP !ram_infiniteammo_check : BMI .reset_ammo_check
    BEQ .handleinputs
    JSR infinite_ammo
    BRA .handleinputs

  .reset_ammo_check
    LDA #$0000 : STA !ram_infiniteammo_check
    LDA !ram_ammo_missiles : STA !SAMUS_MISSILES
    LDA !ram_ammo_supers : STA !SAMUS_SUPERS
    LDA !ram_ammo_powerbombs : STA !SAMUS_PBS

    ; standard features
  .handleinputs
    LDA !IH_CONTROLLER_SEC_NEW : BEQ .done
    CMP !IH_PAUSE : BEQ .toggle_pause
    CMP !IH_SLOWDOWN : BEQ .toggle_slowdown
    CMP !IH_SPEEDUP : BEQ .toggle_speedup
    CMP !IH_RESET : BEQ .reset_slowdown
if !FEATURE_VANILLAHUD
else
    CMP !IH_STATUS_R : BEQ .inc_statusdisplay
    CMP !IH_STATUS_L : BEQ .dec_statusdisplay
endif

  .done
    PLA
    JSL $808111
    RTL

  .toggle_pause
    LDA #$FFFF : STA !ram_slowdown_mode
    LDA #$0000 : STA !ram_slowdown_frames
    BRA .done

  .toggle_slowdown
    LDA !ram_slowdown_mode : INC : STA !ram_slowdown_mode
    BRA .done

  .toggle_speedup
    LDA !ram_slowdown_mode : BEQ .done
    DEC : STA !ram_slowdown_mode
    BRA .done

  .reset_slowdown
    LDA #$0000
    STA !ram_slowdown_mode : STA !ram_slowdown_frames
    BRA .done

  .inc_statusdisplay
    LDA !sram_display_mode : INC
    CMP #$0016 : BNE +
    LDA #$0000
+   STA !sram_display_mode
    BRA .update_status

  .dec_statusdisplay
    LDA !sram_display_mode : DEC
    CMP #$FFFF : BNE +
    LDA #$0015
+   STA !sram_display_mode
    BRA .update_status


  .update_status
    LDA #$0000
    STA !ram_momentum_sum : STA !ram_momentum_count
    STA !ram_HUD_check
    STA !ram_roomstrat_counter : STA !ram_roomstrat_state
    STA !ram_armed_shine_duration
    STA !ram_fail_count : STA !ram_fail_sum
    INC
    STA !ram_enemy_hp : STA !ram_mb_hp
    STA !ram_dash_counter : STA !ram_shine_counter
    STA !ram_xpos : STA !ram_ypos : STA !ram_subpixel_pos
    STA !ram_horizontal_speed : STA !ram_vertical_speed
    LDA !ram_seed_X : LSR
    STA !ram_HUD_top : STA !ram_HUD_middle : STA !ram_HUD_bottom
    STA !ram_HUD_top_counter : STA !ram_HUD_middle_counter
    JMP .done
}

metronome:
{
    LDA !ram_metronome_counter : INC
    CMP !sram_metronome_tickrate : BEQ .tick
    CMP #$0002 : BEQ .eraseHUD
    STA !ram_metronome_counter
    RTS

  .eraseHUD
    STA !ram_metronome_counter
if !FEATURE_VANILLAHUD
else
    LDA !IH_BLANK : STA !HUD_TILEMAP+$62
endif
    RTS

  .tick
if !FEATURE_VANILLAHUD
else
    LDA !IH_LETTER_X : STA !HUD_TILEMAP+$62
endif
    LDA #$0000 : STA !ram_metronome_counter
    LDA !sram_metronome_sfx : ASL : TAX
    LDA.l MetronomeSFX,X : JSL !SFX_LIB1
    RTS
}

MetronomeSFX:
    ; missile, click, beep, shot, spazer
    dw #$0003, #$0039, #$0036, #$000B, #$000F

magic_pants:
{
    LDA !SAMUS_ANIMATION_FRAME : CMP #$0009 : BEQ .check
    LDA !ram_magic_pants_state : BEQ +
    LDA #$0000 : STA !ram_magic_pants_state

    LDA !ram_magic_pants_enabled : AND #$0001 : BEQ +
    LDA !ram_magic_pants_pal1 : STA $7EC194
    LDA !ram_magic_pants_pal2 : STA $7EC196
    LDA !ram_magic_pants_pal3 : STA $7EC19E
+   RTS

  .check
    LDA $0A1F : AND #$00FF : CMP #$0001 : BEQ .flash
    RTS

  .flash
    LDA !ram_magic_pants_state : BNE +

    ; if loudpants are enabled, click
    LDA !ram_magic_pants_enabled : AND #$0002 : BEQ +
    LDA !sram_metronome_sfx : ASL : TAX
    LDA.l MetronomeSFX,X : JSL !SFX_LIB1

    ; if flashpants are enabled, flash
+   LDA !ram_magic_pants_enabled : AND #$0001 : BEQ .done
    LDA !ram_magic_pants_state : BNE +

    LDA $7EC194 : STA !ram_magic_pants_pal1
    LDA $7EC196 : STA !ram_magic_pants_pal2
    LDA $7EC19E : STA !ram_magic_pants_pal3
+   LDA #$FFFF
    STA $7EC194 : STA $7EC196 : STA $7EC19E

  .done
    LDA #$FFFF : STA !ram_magic_pants_state
    RTS
}

space_pants:
{
    LDA !SAMUS_POSE : CMP #$001B : BEQ .checkFalling
    CMP #$001C : BEQ .checkFalling
    CMP #$0081 : BEQ .checkFalling
    CMP #$0082 : BEQ .checkFalling
  .reset
    ; restore palettes if needed
    LDA !ram_magic_pants_state : BEQ .done
    LDA #$0000 : STA !ram_magic_pants_state

    LDA !ram_space_pants_enabled : AND #$0001 : BEQ .done
    LDA !ram_magic_pants_pal1 : STA $7EC194
    LDA !ram_magic_pants_pal2 : STA $7EC196
    LDA !ram_magic_pants_pal3 : STA $7EC198
  .done
    RTS

  .checkFalling
    LDA !SAMUS_Y_DIRECTION : CMP #$0002 : BNE .reset

  .checkLiquid
    LDA !LIQUID_PHYSICS_TYPE : BNE .SJliquid

    ; check against min SJ vspeed for air
    LDA !SAMUS_Y_SPEEDCOMBINED : CMP $909E97 : BMI .reset

    ; check against max SJ vspeed for air
    CMP $909E99 : BPL .reset
    BRA .flash

  .SJliquid
    ; check against min SJ vspeed for liquids
    LDA !SAMUS_Y_SPEEDCOMBINED : CMP $909E9B : BMI .reset

    ; check against max SJ vspeed for liquids
    CMP $909E9D : BPL .reset

  .flash
    ; Screw Attack seems to write new palette data every frame, which overwrites the flash
    LDA !ram_magic_pants_state : BNE .finish

    ; if loudpants are enabled, click
    LDA !ram_space_pants_enabled : AND #$0002 : BEQ +
    LDA !sram_metronome_sfx : ASL : TAX
    LDA.l MetronomeSFX,X : JSL !SFX_LIB1

    ; if flashpants are enabled, flash
+   LDA !ram_space_pants_enabled : AND #$0001 : BEQ .finish
    ; preserve palettes first
    LDA $7EC194 : STA !ram_magic_pants_pal1
    LDA $7EC196 : STA !ram_magic_pants_pal2
    LDA $7EC198 : STA !ram_magic_pants_pal3
    ; then flash
    LDA #$FFFF
    STA $7EC194 : STA $7EC196 : STA $7EC198

  .finish
    LDA #$FFFF : STA !ram_magic_pants_state
    RTS
}

infinite_ammo:
{
    LDA !ram_infiniteammo_check : BNE + ; 0 if first time it's been run
    INC : STA !ram_infiniteammo_check
    ; preserve ammo counts
    LDA !SAMUS_MISSILES : STA !ram_ammo_missiles
    LDA !SAMUS_SUPERS : STA !ram_ammo_supers
    LDA !SAMUS_PBS : STA !ram_ammo_powerbombs

    ; lock ammo to specific values
+   LDA #$03E7 : STA !SAMUS_MISSILES  ; 999 missiles
    LDA #$0063 : STA !SAMUS_SUPERS  ; 99 supers
    LDA #$0063 : STA !SAMUS_PBS  ; 99 pbs
    RTS
}

ih_shinespark_code:
{
    DEC
    STA !SAMUS_SHINE_TIMER : STA !ram_armed_shine_duration
    RTL
}

NumberGFXChoice:
incbin ../resources/num_gfx_choice.bin

overwrite_HUD_numbers:
{
; runs after cm_transfer_original_tileset
    ; vanilla first
    PHP : %ai16()
    PHB : PEA $0000 : PLB : PLB
    LDA !sram_number_gfx_choice : BNE .custom_HUD_numbers
    PLB : PLP
    RTL

  .custom_HUD_numbers
    ; multiply by 100h and add to addr
    XBA : CLC : ADC.w #NumberGFXChoice : TAY
    %a8()

    ; DMA tiles 1-9, 0
    LDA #$80 : STA $2115 ; word access, inc by 1
    LDX #$4000 : STX $2116 ; VRAM addr ($4000 x 2 = $8000)
    STY $4302 ; src addr
    LDA.b #NumberGFXChoice>>16 : STA $4304 ; src bank
    LDX #$00A0 : STX $4305 ; size
    LDA #$01 : STA $4300 ; word, normal increment (DMA MODE)
    LDA #$18 : STA $4301 ; destination (VRAM write)
    LDA #$01 : STA $420B ; initiate DMA (channel 1)

    ; fix src addr in Y
    %a16()
    TYA : CLC : ADC #$00A0 : TAY
    %a8()

    ; DMA tiles A-B
    LDX #$43B0 : STX $2116 ; VRAM addr ($43B0 x 2 = $8760)
    STY $4302 ; src addr
    LDA.b #NumberGFXChoice>>16 : STA $4304 ; src bank
    LDX #$0020 : STX $4305 ; size
    LDA #$01 : STA $4300 ; word, normal increment (DMA MODE)
    LDA #$18 : STA $4301 ; destination (VRAM write)
    LDA #$01 : STA $420B ; initiate DMA (channel 1)

    ; fix src addr in Y again
    %a16()
    TYA : CLC : ADC #$0020 : TAY
    %a8()

    ; DMA tiles C-F
    LDX #$42C0 : STX $2116 ; VRAM addr ($42C0 x 2 = $8580)
    STY $4302 ; src addr
    LDA.b #NumberGFXChoice>>16 : STA $4304 ; src bank
    LDX #$0040 : STX $4305 ; size
    LDA #$01 : STA $4300 ; word, normal increment (DMA MODE)
    LDA #$18 : STA $4301 ; destination (VRAM write)
    LDA #$01 : STA $420B ; initiate DMA (channel 1)

    PLB : PLP
    RTL
}

print pc, " infohud end"
warnpc $F0E000 ; spritefeat.asm


; Stuff that needs to be placed in bank 80
org $80FD00
print pc, " infohud bank80 start"

ih_fix_scroll_offsets:
{
    LDA !ram_fix_scroll_offsets : BEQ .done
    %a8()
    LDA $0911 : STA $B1 : STA $B5
    LDA $0915 : STA $B3 : STA $B7
    %a16()

  .done
    ; overwritten code
    LDA $B1 : SEC
    RTS
}

ih_hud_code_paused:
{
    ; overwritten code
    PHP : PHB : PHK : PLB
    %a8() : STZ $02 : %ai16()

    ; Update Samus' HP and reserves
    LDA !SAMUS_HP : CMP !ram_last_hp : BEQ .check_reserves
    STA !ram_last_hp
    BRA .draw_health

  .check_reserves
    LDA !SAMUS_RESERVE_ENERGY : CMP !ram_reserves_last : BEQ .end

  .draw_health
    PHY : PHX
    LDX #$0092 : JSL DrawHealthPaused
    PLX : PLY

  .end
    LDA !SAMUS_RESERVE_MODE ; overwritten code
    JMP $9B51
}

NumberGFXTable:
    dw #$0C09, #$0C00, #$0C01, #$0C02, #$0C03, #$0C04, #$0C05, #$0C06, #$0C07, #$0C08
    dw #$0C70, #$0C71, #$0C72, #$0C73, #$0C74, #$0C75, #$0C78, #$0C79, #$0C7A, #$0C7B
    dw #$0C7C, #$0C7D, #$0C7E, #$0C7F, #$0CD2, #$0CD4, #$0CD5, #$0CD6, #$0CD7, #$0CD8
    dw #$0CD9, #$0CDA, #$0CDB, #$0C5C, #$0C5D, #$0CB8, #$0C8D, #$0C12, #$0C13, #$0C14
    dw #$0C15, #$0C16, #$0C17, #$0C18, #$0C19, #$0C1A, #$0C1B, #$0C20, #$0C21, #$0C22
    dw #$0C23, #$0C24, #$0C25, #$0C26, #$0C27, #$0C28, #$0C29, #$0C2A, #$0C2B, #$0C2C
    dw #$0C2D, #$0C2E, #$0C2F, #$0C5E, #$0C5F, #$0CCA

HexGFXTable:
    dw #$0C09, #$0C00, #$0C01, #$0C02, #$0C03, #$0C04, #$0C05, #$0C06, #$0C07, #$0C08
    dw #$0C64, #$0C65, #$0C58, #$0C59, #$0C5A, #$0C5B

ControllerTable1:
    dw #$0020, #$0800, #$0010, #$4000, #$0040, #$2000
ControllerTable2:
    dw #$0200, #$0400, #$0100, #$8000, #$0080, #$1000
ControllerGfx1:
    dw #$0C68, #$0C61, #$0C69, #$0C67, #$0C66, #$0C6A
ControllerGfx2:
    dw #$0C60, #$0C63, #$0C62, #$0C65, #$0C64, #$0C6B

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

ControllerLayoutTable:
    ;  shot     jump     dash     cancel        select        up       down
    dw !CTRL_X, !CTRL_A, !CTRL_B, !CTRL_Y,      !CTRL_SELECT, !CTRL_R, !CTRL_L ; Default (D1)
    dw !CTRL_X, !CTRL_A, !CTRL_B, !CTRL_SELECT, !CTRL_Y,      !CTRL_R, !CTRL_L ; Select+Cancel Swap (D2)
    dw !CTRL_Y, !CTRL_A, !CTRL_B, !CTRL_SELECT, !CTRL_X,      !CTRL_R, !CTRL_L ; D2 + Shot+Select Swap (D3)
    dw !CTRL_Y, !CTRL_B, !CTRL_A, !CTRL_SELECT, !CTRL_X,      !CTRL_R, !CTRL_L ; MMX Style (D4)
    dw !CTRL_X, !CTRL_B, !CTRL_Y, !CTRL_SELECT, !CTRL_A,      !CTRL_R, !CTRL_L ; SMW Style (D5)

print pc, " infohud bank80 end"
warnpc $80FFB0 ; header


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
