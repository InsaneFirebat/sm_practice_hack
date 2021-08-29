; Patch out copy protection
org $008000
    db $FF

; Set SRAM size
if !FEATURE_SD2SNES
    org $00FFD8
        db $08 ; 256kb
else
    org $00FFD8
        db $05 ; 64kb
endif

; Skip intro
; $82:EEDF A9 95 A3    LDA #$A395
org $82EEDF
    LDA #$C100

; Skips the waiting time after teleporting
org $90E877
    BRA $1F


; Adds frames when unpausing (nmi is turned off during vram transfers)
; $80:A16B 22 4B 83 80 JSL $80834B[$80:834B]
org $80A16B
    JSL hook_unpause


; $82:8BB3 22 69 91 A0 JSL $A09169[$A0:9169]  ; Handles Samus getting hurt?
org $828BB3
    JSL gamemode_end


; Replace unnecessary logic checking controller input to toggle debug CPU brightness
; with logic to collect the v-counter data
org $828AB1
    %a8() : LDA $4201 : ORA #$80 : STA $4201 : %ai16()
    LDA $2137 : LDA $213D : STA !ram_vcounter_data

    ; For efficiency, re-implement the debug brightness logic here
    LDA $0DF4 : BEQ .skip_debug_brightness
    %a8() : LDA $51 : AND #$F0 : ORA #$05 : STA $2100 : %a16()
    BRA .skip_debug_brightness

warnpc $828ADD
org $828ADD       ; Resume original logic
    .skip_debug_brightness


org $CF8BBF       ; Set map scroll beep to high priority
    dw $2A97


; $80:8F24 9C F6 07    STZ $07F6  [$7E:07F6]  ;/
; $80:8F27 8D 40 21    STA $2140  [$7E:2140]  ; APU IO 0 = [music track]
org $808F24
    JSL hook_set_music_track
    NOP #2

; swap Enemy HP to MB HP when entering MB's room
;org $83AAD2 ; Where is MB's room? Probably not here
;    dw #MotherBrainHP

;org $8FEA00 ; free space for door asm
;org $8FF9F9 ; This org is safe but all of this is commented out because I don't even know where MB's room is -IFB
;MotherBrainHP:
;{

;    LDA !sram_display_mode : BNE .done    ; if 0 (enemy HP)
;    LDA #$0001 : STA !sram_display_mode   ; set 1 (MB HP)

;  .done
;    RTS
;}

org $87D000
print pc, " misc start"
hook_set_music_track:
{
    STZ $07F6

    PHA
    LDA !sram_music_toggle : BEQ .noMusic
    PLA : STA $2140
    RTL

  .noMusic
    PLA
    RTL
}


hook_unpause:
{
    ; RT room
    LDA !ram_realtime_room : CLC : ADC.w #41 : STA !ram_realtime_room

    ; RT seg
    LDA !ram_seg_rt_frames : CLC : ADC.w #41 : STA !ram_seg_rt_frames
    CMP.w #60 : BCC .done
    SEC : SBC.w #60 : STA !ram_seg_rt_frames

    LDA !ram_seg_rt_seconds : INC : STA !ram_seg_rt_seconds
    CMP.w #60 : BCC .done
    LDA #$0000 : STA !ram_seg_rt_seconds

    LDA !ram_seg_rt_minutes : INC : STA !ram_seg_rt_minutes

  .done
    ; Replace overwritten logic to enable NMI
    JSL $80834B
    RTL
}


gamemode_end:
{
   ; overwritten logic
    JSL $A09169

    ; If minimap is disabled or shown, we ignore artificial lag
    LDA $05F7 : BNE .endlag
    LDA !ram_minimap : BNE .endlag

    ; Artificial lag, multiplied by 16 to get loop count
    ; Each loop takes 5 clock cycles (assuming branch taken)
    ; For reference, 41 loops ~= 1 scanline
    LDA !sram_artificial_lag : BEQ .endlag
    ASL #4 : TAX
  .lagloop
    DEX : BNE .lagloop
  .endlag
    RTL
}

stop_all_sounds:
{
    ; If $05F5 is non-zero, the game won't clear the sounds
    LDA $05F5 : PHA
    LDA #$0000 : STA $05F5
    JSL $82BE17
    PLA : STA $05F5

    ; Makes the game check Samus' health again, to see if we need annoying sound
    LDA #$0000 : STA $0A6A
    RTL
}

print pc, " misc end"

print pc, " misc bankA0 end"


; -----------
; Axeil Hacks
; -----------

; Next 4 org's spread out the bomb graphics on the HUD
org $80E2C9
    STA $7EC6AE : STA $7EC6B4 : STA $7EC6BA

org $90F876
    BEQ .jump_AC1C

org $90F889
    LDX #$000C ; was 8

org $90F88F
-   DEY : BNE + : SBC #$03FF
+   STA $7EC6AE,X
    DEX #6 ; was 4
    BPL -
    PLX
    PLY
  .jump_AC1C
    JMP $AC1C
warnpc $90F8A7
