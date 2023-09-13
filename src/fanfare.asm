
org !ORG_FANFARE_BANK84
print pc, " fanfare restore start"
Fanfare_Restore:
  .prepareloop
    ; start of logic that was overwritten
    PHX
    LDX #$000E

  .clearloop
    STZ $0619,X : STZ $0629,X
    DEX #2 : BPL .clearloop
    ; jump back to the original logic
    BRL Fanfare_Resume

print pc, " fanfare restore end"

; $84:8BDD: Instruction - clear music queue and queue music track [[Y]] ;;;
org $848BDD
Fanfare_Instruction:
    PHA
    LDA !sram_fanfare_toggle : BNE .playfanfare
    PLA
    ; increment over fanfare byte and continue without fanfare
    INY
    RTS

  .playfanfare
    PLA
    BRL Fanfare_Restore

warnpc $848BEB       ; we are only overwriting original logic up to this point

; $84:8BEB: Resume original logic
org $848BEB
Fanfare_Resume:


; $85:8493 20 36 81    JSR $8136  [$85:8136]
org $858493
    JSR hook_message_box_wait
    BRA $0B


; $82:E126: Logic to queue room music after fanfare
org $82E126
    JSL hook_resume_room_music
    BRA $08


org !ORG_FANFARE_BANK85
print pc, " fanfare start"
hook_message_box_wait:
    LDA !sram_fanfare_toggle : BNE .fanfareloop
    ; shorten message box length
    LDX #$0020

  .nofanfareloop
    ; skipping fanfare, so no need to mess with sound
    JSR hook_msg_wait_for_lag_frame
    DEX : BNE .nofanfareloop

    LDA !sram_fanfare_timer_adjust : BEQ .done
    %a16()
    LDA !ram_realtime_room : CLC : ADC #$0148 : STA !ram_realtime_room

    ; adding 5:28 to seg timer
    STZ $12
    LDA !ram_seg_rt_frames : CLC : ADC #$001C : STA !ram_seg_rt_frames
    CMP #$003C : BMI .add_seconds
    SEC : SBC #$003C : STA !ram_seg_rt_frames : INC $12

  .add_seconds
    LDA !ram_seg_rt_seconds : CLC : ADC #$0005 : ADC $12 : STA !ram_seg_rt_seconds
    STZ $12
    CMP #$003C : BMI .add_minutes
    SEC : SBC #$003C : STA !ram_seg_rt_seconds : INC $12

  .add_minutes
    LDA $12 : BEQ .done
    CLC : ADC !ram_seg_rt_minutes : STA !ram_seg_rt_minutes

  .done
    %a8()
    RTS

  .fanfareloop       ; original logic
    JSR hook_msg_wait_for_lag_frame
    PHX
    JSL $808F0C ; Handle music queue
    JSL $8289EF ; Handle sounds
    PLX : DEX : BNE .fanfareloop
    RTS


hook_msg_wait_for_lag_frame:
; this routine is unused in Redesign/Axeil
{
    PHP
if !FEATURE_SD2SNES
    %a8()
  .wait_joypad
    LDA $4212 : BIT #$01 : BNE .wait_joypad

    %a16()
    LDA $4218 : BEQ .done
    CMP !sram_ctrl_load_state : BNE .done
    LDA !SRAM_SAVED_STATE : CMP #$5AFE : BNE .done
    PHB : PHK : PLB
    JML load_state

  .done
endif
    ; Jump to vanilla routine to wait for lag frame
    JMP $8137
}

hook_resume_room_music:
{
    LDA !sram_fanfare_toggle : BNE .resume

    ; This method is also used when starting game at Ceres
    LDA !AREA_ID : CMP #$0006 : BEQ .resume
    RTL

  .resume
    ; original logic to queue room music after fanfare
    LDA #$0000 : JSL $808FF7
    LDA $07F5 : JSL $808FC1
    RTL
}

warnpc $85FFC0
print pc, " fanfare end"
