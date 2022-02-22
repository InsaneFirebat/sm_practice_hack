
;org $84EFD9
org $84FF80
print pc, " fanfare restore start"
  .prepareloop
    PHX              ; start of logic that was overwritten
    LDX #$000E

  .clearloop
    STZ $0619,x
    STZ $0629,x
    DEX
    DEX
    BPL .clearloop
    BRL .continue    ; jump back to the original logic

print pc, " fanfare restore end"

; $84:8BDD: Instruction - clear music queue and queue music track [[Y]] ;;;
org $848BDD
    PHA
    LDA !sram_fanfare_toggle : BNE .playfanfare
    PLA
    INY              ; increment over fanfare byte and continue without fanfare
    RTS

  .playfanfare
    PLA
    BRL .prepareloop

warnpc $848BEB       ; we are only overwriting original logic up to this point

; $84:8BEB: Resume original logic
org $848BEB
  .continue


; $85:8493 20 36 81    JSR $8136  [$85:8136]
org $858493
    JSR hook_message_box_wait
    BRA $0B


; $82:E126: Logic to queue room music after fanfare
org $82E126
    JSL hook_resume_room_music
    BRA $08


org $85FF00
print pc, " fanfare start"
hook_message_box_wait:
    LDA !sram_fanfare_toggle : BNE .fanfareloop
    LDX #$0020       ; shorten message box length

  .nofanfareloop     ; skipping fanfare, so no need to mess with sound
    JSR $8136 ;hook_message_box_wait_for_lag_frame
    DEX
    BNE .nofanfareloop
    RTS

  .fanfareloop       ; original logic
    JSR $8136 ;hook_message_box_wait_for_lag_frame
    PHX
    JSL $808F0C
    JSL $8289EF
    PLX
    DEX
    BNE .fanfareloop
    RTS

hook_message_box_wait_for_lag_frame:
; this routine is unused in Redesign/Axeil
{
    PHP
if !FEATURE_SD2SNES
    %a8()
  .wait_for_auto_joypad_read
    LDA $4212 : BIT #$01 : BNE .wait_for_auto_joypad_read

    %a16()
    LDA $4218 : BEQ .wait_for_lag_frame
    CMP !sram_ctrl_load_state : BNE .wait_for_lag_frame
    PHB : PHK : PLB
    JML load_state

  .wait_for_lag_frame
endif
    ; Jump to vanilla routine
    JMP $8137
}

hook_resume_room_music:
    LDA !sram_fanfare_toggle : BNE .resume

    ; This method is also used when starting game at Ceres
    LDA !AREA_ID : CMP #$0006 : BEQ .resume
    RTL

  .resume
    LDA #$0000       ; original logic to queue room music after fanfare
    JSL $808FF7
    LDA $07F5
    JSL $808FC1
    RTL

print pc, " fanfare end"
