
; ---------------------------
; Super Metroid Crash Handler
; ---------------------------

; SM points most of its CPU vectors to a "jump to self"
; This resource adds a crash handler to dump data to SRAM
; whenever one of these "crash vectors" is triggered

pushpc

; Hijack generic crash handler
org $808573
    JML CrashHandler

; Hijack native BRK vector
org $00FFE6
    dw BRKHandler

; Hijack emulation IRQ/BRK vector
org $00FFFE
    dw BRKHandler

org $80E000
print pc, " crash handler bank80 start"

; This routine (or a bridge to it) must live in bank $80
CrashHandler:
{
    PHP : PHB
    PHK : PLB
    %ai16()

    ; store CPU registers
    STA !ram_crash_a
    TXA : STA !ram_crash_x
    TYA : STA !ram_crash_y
    PLA : STA !ram_crash_dbp
    TSC : STA !ram_crash_sp

    ; prep for .loopStack
    INC : TAY : LDX #$0000

    ; store crash type, 0 = handler
    LDA #$0000 : STA !ram_crash_type

  .loopStack
    LDA $0000,Y : STA !ram_crash_stack,X
    INX #2 : CPX #$0030 : BPL .maxStack ; max 30h bytes
    INY #2 : CPY #$2000 : BMI .loopStack
    BRA .stackSize

  .maxStack
    ; we only saved 30h bytes, so inc until we
    ; know the total number of bytes on the stack
    INY : INX : CPY #$2000 : BMI .maxStack

  .stackSize
    ; check if we copied an extra byte
    CPY #$2000 : BEQ +
    DEX ; don't count it
+   TXA : STA !ram_crash_stack_size

    ; launch CrashViewer to display dump
    JSL CrashViewer

  .crash
    JML .crash
}

BRKHandler:
{
    JML .setBank
  .setBank
    PHP : PHB
    PHK : PLB
    %ai16()

    ; store CPU registers
    STA !ram_crash_a
    TXA : STA !ram_crash_x
    TYA : STA !ram_crash_y
    PLA : STA !ram_crash_dbp
    TSC : STA !ram_crash_sp

    ; prep for .loopStack
    INC : TAY : LDX #$0000

    ; store crash type, 1 = BRK
    LDA #$0001 : STA !ram_crash_type

    JMP CrashHandler_loopStack
}

print pc, " crash handler bank80 end"
warnpc $80F000 ; presets.asm

pullpc
print pc, " crash handler bank89 start"

CrashViewer:
{
    ; setup to draw crashdump on layer 3
    PHK : PLB
    %a8()
    STZ $420C
    LDA #$80 : STA $2100 ; Force blank on, zero brightness
    LDA #$A1 : STA $4200 ; NMI, V-blank IRQ, and auto-joypad read on
    LDA #$09 : STA $2105 ; BG3 priority on , BG Mode 1
    LDA #$02 : STA $2130 ; Add subscreen to color math
    LDA #$33 : STA $2131 ; Enable color math on backgrounds and OAM
    LDA #$0F : STA $2100 ; Force blank off, max brightness
    %a16()

    LDA #$0000 : STA !ram_crash_page : STA !ram_crash_palette : STA !ram_crash_cursor
    STZ !IH_CONTROLLER_PRI_NEW : STZ !IH_CONTROLLER_PRI
    LDA #$0A44 : STA !ram_crash_mem_viewer
    LDA #$007E : STA !ram_crash_mem_viewer_bank

    JSL initialize_ppu_long   ; Initialise PPU for message boxes

    JSL crash_cgram_transfer
    JSL cm_transfer_custom_tileset
    JSL wait_for_lag_frame_long ; Wait for lag frame

    ; fall through to CrashLoop
}

CrashLoop:
{
    %ai16()
    ; Clear the screen
    LDA #$000E : LDX #$07FE
-   STA !ram_tilemap_buffer,X : DEX #2 : BPL -

    ; Determine which page to draw
    LDA !ram_crash_page : ASL : TAX
    JSR (CrashPageTable,X)

    ; Transfer to VRAM
    %ai16()
    JSL wait_for_lag_frame_long ; Wait for lag frame
    JSL $809459 ; Read controller input
    JSL crash_tilemap_transfer

    ; check for new inputs
    LDA !IH_CONTROLLER_PRI_NEW : BEQ CrashLoop
    TAX ; new inputs in X, to be copied back to A later

    ; check for soft reset shortcut (Select+Start+L+R)
    LDA !IH_CONTROLLER_PRI : AND #$3030 : CMP #$3030 : BNE +
    AND !IH_CONTROLLER_PRI_NEW : BEQ +
    STZ $05F5   ; Enable sounds
    JML $808462 ; Soft Reset

if !FEATURE_SD2SNES
    ; check for load state shortcut
+   LDA !IH_CONTROLLER_PRI : CMP !sram_ctrl_load_state : BNE +
    AND !IH_CONTROLLER_PRI_NEW : BEQ +
    ; prepare to jump to load_state
    %a8()
    LDA #gamemode_start>>16 : PHA : PLB
    %a16()
    PEA.w gamemode_start_return-1
    JML gamemode_shortcuts_load_state
endif

+   TXA : AND #$0010 : BNE .incPalette ; R
    TXA : AND #$0020 : BNE .decPalette ; L
    TXA : AND #$1080 : BNE .next       ; A or Start
    TXA : AND #$A000 : BNE .previous   ; B or Select
    JMP CrashLoop

  .previous
    LDA !ram_crash_page : BNE +
    LDA #$0003
+   DEC : STA !ram_crash_page
    JMP CrashLoop

  .next
    LDA !ram_crash_page : CMP #$0002 : BMI +
    LDA #$FFFF
+   INC : STA !ram_crash_page
    JMP CrashLoop

  .decPalette
    LDA !ram_crash_palette : BNE +
    LDA #$0004
+   DEC : STA !ram_crash_palette
    BRA .updateCGRAM

  .incPalette
    LDA !ram_crash_palette : CMP #$0003 : BMI +
    LDA #$FFFF
+   INC : STA !ram_crash_palette

  .updateCGRAM
    JSL crash_cgram_transfer
    JMP CrashLoop
}

CrashPageTable:
    dw CrashDump
    dw CrashMemViewer
    dw CrashInfo

CrashDump:
{
    %ai16()

    ; -- Draw header --
    LDA.l #CrashTextHeader : STA !ram_crash_text
    LDA.l #CrashTextHeader>>16 : STA !ram_crash_text_bank
    LDX #$0086 : JSR crash_draw_text

    ; -- Draw footer message --
    LDA.l #CrashTextFooter1 : STA !ram_crash_text
    LDA.l #CrashTextFooter1>>16 : STA !ram_crash_text_bank
    LDX #$0646 : JSR crash_draw_text

    LDA.l #CrashTextFooter2 : STA !ram_crash_text
    LDA.l #CrashTextFooter2>>16 : STA !ram_crash_text_bank
    LDX #$0686 : JSR crash_draw_text

    ; -- Draw register labels --
    LDA #$2800 : STA !ram_tilemap_buffer+$14A  ; A
    LDA #$2817 : STA !ram_tilemap_buffer+$154  ; X
    LDA #$2818 : STA !ram_tilemap_buffer+$15E  ; Y
    LDA #$2803 : STA !ram_tilemap_buffer+$166  ; D
    LDA #$2801 : STA !ram_tilemap_buffer+$168  ; B
    LDA #$284F : STA !ram_tilemap_buffer+$16A  ; +
    LDA #$280F : STA !ram_tilemap_buffer+$16C  ; P
    LDA #$2812 : STA !ram_tilemap_buffer+$172  ; S
    LDA #$280F : STA !ram_tilemap_buffer+$174  ; P

    ; -- Draw stack label --
    LDA.l #CrashTextStack1 : STA !ram_crash_text
    LDA.l #CrashTextStack1>>16 : STA !ram_crash_text_bank
    LDX #$024E : JSR crash_draw_text

    ; -- Draw stack text --
    LDA.l #CrashTextStack2 : STA !ram_crash_text
    LDA.l #CrashTextStack2>>16 : STA !ram_crash_text_bank
    LDX #$028C : JSR crash_draw_text

    ; -- Draw register values --
    LDA !ram_crash_a : STA !ram_crash_draw_value : LDX #$0188
    JSR crash_draw4  ; A
    LDA !ram_crash_x : STA !ram_crash_draw_value : LDX #$0192
    JSR crash_draw4  ; X
    LDA !ram_crash_y : STA !ram_crash_draw_value : LDX #$019C
    JSR crash_draw4  ; Y
    LDA !ram_crash_dbp : XBA : STA !ram_crash_draw_value : LDX #$01A6
    JSR crash_draw4  ; DB+P
    LDA !ram_crash_sp : STA !ram_crash_draw_value : LDX #$01B0
    JSR crash_draw4  ; SP

    ; -- Draw starting position of stack dump
    LDA !ram_crash_draw_value : INC : STA !ram_crash_draw_value : LDX #$02A8
    JSR crash_draw4

    ; -- Draw stack bytes written --
    LDA !ram_crash_stack_size : STA !ram_crash_draw_value
    STA !ram_crash_stack_bytes_to_be_written
    LDX #$025E
    JSR crash_draw4

    ; -- Detect and Draw BRK --
    LDA !ram_crash_type : BEQ +
    %a8()
    LDA !ram_crash_stack : STA !ram_crash_draw_value
    LDX #$031C : JSR crash_draw2 ; P

    LDA !ram_crash_stack+$03 : STA !ram_crash_draw_value
    LDX #$0324 : JSR crash_draw2 ; bank

    %a16()
    LDA !ram_crash_stack+$01 : DEC #2 : STA !ram_crash_draw_value
    LDX #$0328 : JSR crash_draw4 ; addr

    LDA #$2C51 : STA !ram_tilemap_buffer+$310 ; B
    LDA #$2C61 : STA !ram_tilemap_buffer+$312 ; R
    LDA #$2C5A : STA !ram_tilemap_buffer+$314 ; K
    LDA #$2C4A : STA !ram_tilemap_buffer+$316 ; :
    LDA #$2C4E : STA !ram_tilemap_buffer+$322 ; $

    ; -- Draw Stack Values --
    ; start by setting up tilemap position
+   %ai16()
    LDX #$0388
    LDA #$0000 : STA !ram_crash_stack_line_loop_counter

    ; determine starting offset
    LDA !ram_crash_stack_bytes_to_be_written
-   PHA : AND #$0007 : BEQ +
    TXA : CLC : ADC #$0006 : TAX
    LDA !ram_crash_stack_line_loop_counter : INC : STA !ram_crash_stack_line_loop_counter
    PLA : INC : BRA -

+   PLA : %a8()
    LDA #$00 : STA !ram_crash_stack_bytes_written

  .drawStack
    ; draw a byte
    PHX : %i8()
    LDA !ram_crash_stack_bytes_written : TAX
    LDA !ram_crash_stack,X : STA !ram_crash_draw_value
    %i16() : PLX
    JSR crash_draw2

    ; inc tilemap position
    INX #6 : LDA !ram_crash_stack_line_loop_counter : INC
    STA !ram_crash_stack_line_loop_counter : AND #$08 : BEQ +

    ; start a new line
    LDA #$00 : STA !ram_crash_stack_line_loop_counter
    %a16()
    TXA : CLC : ADC #$0050 : TAX
    CPX #$05B4 : BPL .done
    %a8()

    ; inc bytes drawn
+   LDA !ram_crash_stack_bytes_written : INC : STA !ram_crash_stack_bytes_written
    CMP !ram_crash_stack_bytes_to_be_written : BNE .drawStack

  .done
    RTS
}

CrashMemViewer:
{
    ; -- Handle Dpad Inputs --
    %ai16()
    LDA !IH_CONTROLLER_PRI_NEW : TAX
    TXA : AND #$0800 : BNE .pressedUp
    TXA : AND #$0400 : BNE .pressedDown
    TXA : AND #$0200 : BNE .pressedLeft
    TXA : AND #$0100 : BNE .pressedRight
    JMP .handleSelectedLine

  .pressedUp
    LDA !ram_crash_cursor : BNE +
    LDA #$0003
+   DEC : STA !ram_crash_cursor
    JMP .handleSelectedLine

  .pressedDown
    LDA !ram_crash_cursor : CMP #$0002 : BMI +
    LDA #$FFFF
+   INC : STA !ram_crash_cursor
    JMP .handleSelectedLine

  .decLowFast
    LDA !ram_crash_mem_viewer : DEC #4 : STA !ram_crash_mem_viewer
    JMP .handleSelectedLine
  .pressedLeft
    LDA !ram_crash_cursor : BEQ .decBank
    DEC : BEQ .decHigh
    LDA !IH_CONTROLLER_PRI : AND #$4040 : BNE .decLowFast
    LDA !ram_crash_mem_viewer : DEC : STA !ram_crash_mem_viewer
    JMP .handleSelectedLine

  .incLowFast
    LDA !ram_crash_mem_viewer : INC #4 : STA !ram_crash_mem_viewer
    JMP .handleSelectedLine
  .pressedRight
    LDA !ram_crash_cursor : BEQ .incBank
    DEC : BEQ .incHigh
    LDA !IH_CONTROLLER_PRI : AND #$4040 : BNE .incLowFast
    LDA !ram_crash_mem_viewer : INC : STA !ram_crash_mem_viewer
    JMP .handleSelectedLine

  .decBank
    LDA !IH_CONTROLLER_PRI : AND #$4040 : BNE .decBankFast
    LDA !ram_crash_mem_viewer_bank : DEC : STA !ram_crash_mem_viewer_bank
    BRA .handleSelectedLine
  .decBankFast
    LDA !ram_crash_mem_viewer_bank : DEC #4 : STA !ram_crash_mem_viewer_bank
    BRA .handleSelectedLine

  .decHigh
    LDA !IH_CONTROLLER_PRI : AND #$4040 : BNE .decHighFast
    LDA !ram_crash_mem_viewer : XBA : DEC : XBA : STA !ram_crash_mem_viewer
    BRA .handleSelectedLine
  .decHighFast
    LDA !ram_crash_mem_viewer : XBA : DEC #4 : XBA : STA !ram_crash_mem_viewer
    BRA .handleSelectedLine

  .incBank
    LDA !IH_CONTROLLER_PRI : AND #$4040 : BNE .incBankFast
    LDA !ram_crash_mem_viewer_bank : INC : STA !ram_crash_mem_viewer_bank
    BRA .handleSelectedLine
  .incBankFast
    LDA !ram_crash_mem_viewer_bank : INC #4 : STA !ram_crash_mem_viewer_bank
    BRA .handleSelectedLine

  .incHigh
    LDA !IH_CONTROLLER_PRI : AND #$4040 : BNE .incHighFast
    LDA !ram_crash_mem_viewer : XBA : INC : XBA : STA !ram_crash_mem_viewer
    BRA .handleSelectedLine
  .incHighFast
    LDA !ram_crash_mem_viewer : XBA : INC #4 : XBA : STA !ram_crash_mem_viewer

    ; -- Draw Memory Viewer --
  .handleSelectedLine
    %a16()
    LDA !ram_crash_cursor : ASL : TAX
    LDA.l CDSelectedLineOffset,X : TAX
    LDA #$2C80 : STA !ram_tilemap_buffer,X
    LDA #$2C81 : STA !ram_tilemap_buffer+$32,X

    ; draw header text
    LDA.l #CrashTextHeader2 : STA !ram_crash_text
    LDA.l #CrashTextHeader2>>16 : STA !ram_crash_text_bank
    LDX #$008C : JSR crash_draw_text

    ; draw footer text
    LDA.l #CrashTextFooter1 : STA !ram_crash_text
    LDA.l #CrashTextFooter1>>16 : STA !ram_crash_text_bank
    LDX #$0646 : JSR crash_draw_text

    LDA.l #CrashTextFooter2 : STA !ram_crash_text
    LDA.l #CrashTextFooter2>>16 : STA !ram_crash_text_bank
    LDX #$0686 : JSR crash_draw_text

    ; draw address text
    LDA.l #CrashTextMemAddress : STA !ram_crash_text
    LDA.l #CrashTextMemAddress>>16 : STA !ram_crash_text_bank
    LDX #$014E : JSR crash_draw_text

    ; draw value text
    LDA.l #CrashTextMemValue : STA !ram_crash_text
    LDA.l #CrashTextMemValue>>16 : STA !ram_crash_text_bank
    LDX #$01D2 : JSR crash_draw_text

    ; draw select bank
    LDA.l #CrashTextMemSelectBank : STA !ram_crash_text
    LDA.l #CrashTextMemSelectBank>>16 : STA !ram_crash_text_bank
    LDX #$0288 : JSR crash_draw_text

    ; draw select high
    LDA.l #CrashTextMemSelectHigh : STA !ram_crash_text
    LDA.l #CrashTextMemSelectHigh>>16 : STA !ram_crash_text_bank
    LDX #$0308 : JSR crash_draw_text

    ; draw select low
    LDA.l #CrashTextMemSelectLow : STA !ram_crash_text
    LDA.l #CrashTextMemSelectLow>>16 : STA !ram_crash_text_bank
    LDX #$0388 : JSR crash_draw_text

    ; draw the address
    %a8()
    LDA !ram_crash_mem_viewer_bank : STA !ram_crash_draw_value
    LDX #$0164 : JSR crash_draw2
    LDX #$02B4 : JSR crash_draw2
    %a16()
    LDA !ram_crash_mem_viewer : STA !ram_crash_draw_value
    LDX #$0168 : JSR crash_draw4
    %a8()
    LDX #$03B4 : JSR crash_draw2
    %a16()
    LDA !ram_crash_mem_viewer : XBA : STA !ram_crash_draw_value
    %a8()
    LDX #$0334 : JSR crash_draw2

    ; draw the current value and nearby bytes
    LDA !ram_crash_mem_viewer : BMI .drawUpperHalf
    %a16()
    LDA $C1 : PHA : LDA $C3 : PHA
    LDA !ram_crash_mem_viewer_bank : STA $C3
    LDA !ram_crash_mem_viewer : STA $C1
    LDA [$C1] : STA !ram_crash_draw_value
    LDX #$01E8 : JSR crash_draw4

    LDX #$048A
    %a8()
    LDA #$00 : STA !ram_crash_stack_line_loop_counter : STA !ram_crash_stack_bytes_written
    LDA $C1 : AND #$F0 : STA $C1

  .drawLowerHalfNearby
    ; draw a byte
    LDA [$C1] : STA !ram_crash_draw_value
    JSR crash_draw2
    INC $C1

    ; inc tilemap position
    INX #6 : LDA !ram_crash_stack_line_loop_counter : INC
    STA !ram_crash_stack_line_loop_counter : AND #$08 : BEQ +

    ; start a new line
    LDA #$00 : STA !ram_crash_stack_line_loop_counter
    %a16()
    TXA : CLC : ADC #$0050 : TAX
    CPX #$05BA : BPL .doneLowerHalf
    %a8()

    ; inc bytes drawn
+   LDA !ram_crash_stack_bytes_written : INC : STA !ram_crash_stack_bytes_written
    CMP #$10 : BNE .drawLowerHalfNearby
    %a16()

  .doneLowerHalf
    PLA : STA $C3 : PLA : STA $C1
    RTS

  .drawUpperHalf
    %a16()
    LDA $41 : PHA : LDA $43 : PHA
    LDA !ram_crash_mem_viewer_bank : STA $43
    LDA !ram_crash_mem_viewer : STA $41
    LDA [$41] : STA !ram_crash_draw_value
    LDX #$01E8 : JSR crash_draw4

    LDX #$048A
    %a8()
    LDA #$00 : STA !ram_crash_stack_line_loop_counter : STA !ram_crash_stack_bytes_written
    LDA $41 : AND #$F0 : STA $41

  .drawUpperHalfNearby
    ; draw a byte
    LDA [$41] : STA !ram_crash_draw_value
    JSR crash_draw2
    INC $41

    ; inc tilemap position
    INX #6 : LDA !ram_crash_stack_line_loop_counter : INC
    STA !ram_crash_stack_line_loop_counter : AND #$08 : BEQ +

    ; start a new line
    LDA #$00 : STA !ram_crash_stack_line_loop_counter
    %a16()
    TXA : CLC : ADC #$0050 : TAX
    CPX #$05BA : BPL .doneUpperHalf
    %a8()

    ; inc bytes drawn
+   LDA !ram_crash_stack_bytes_written : INC : STA !ram_crash_stack_bytes_written
    CMP #$10 : BNE .drawUpperHalfNearby
    %a16()

  .doneUpperHalf
    PLA : STA $C3 : PLA : STA $C1
    RTS

CDSelectedLineOffset:
    dw $0286, $0306, $0386
}

CrashInfo:
{
    %ai16()

    ; draw header text
    LDA.l #CrashTextHeader3 : STA !ram_crash_text
    LDA.l #CrashTextHeader3>>16 : STA !ram_crash_text_bank
    LDX #$0086 : JSR crash_draw_text

    ; draw a bunch of text
    LDA.l #CrashTextInfo1 : STA !ram_crash_text
    LDA.l #CrashTextInfo1>>16 : STA !ram_crash_text_bank
    LDX #$0106 : JSR crash_draw_text

    LDA.l #CrashTextInfo2 : STA !ram_crash_text
    LDA.l #CrashTextInfo2>>16 : STA !ram_crash_text_bank
    LDX #$01C6 : JSR crash_draw_text

    LDA.l #CrashTextInfo3 : STA !ram_crash_text
    LDA.l #CrashTextInfo3>>16 : STA !ram_crash_text_bank
    LDX #$0206 : JSR crash_draw_text

    LDA.l #CrashTextInfo4 : STA !ram_crash_text
    LDA.l #CrashTextInfo4>>16 : STA !ram_crash_text_bank
    LDX #$024A : JSR crash_draw_text

    LDA.l #CrashTextInfo5 : STA !ram_crash_text
    LDA.l #CrashTextInfo5>>16 : STA !ram_crash_text_bank
    LDX #$02C6 : JSR crash_draw_text

    LDA.l #CrashTextInfo6 : STA !ram_crash_text
    LDA.l #CrashTextInfo6>>16 : STA !ram_crash_text_bank
    LDX #$030A : JSR crash_draw_text

    LDA.l #CrashTextInfo7 : STA !ram_crash_text
    LDA.l #CrashTextInfo7>>16 : STA !ram_crash_text_bank
    LDX #$034E : JSR crash_draw_text

    LDA.l #CrashTextInfo8 : STA !ram_crash_text
    LDA.l #CrashTextInfo8>>16 : STA !ram_crash_text_bank
    LDX #$040A : JSR crash_draw_text

    LDA.l #CrashTextInfo9 : STA !ram_crash_text
    LDA.l #CrashTextInfo9>>16 : STA !ram_crash_text_bank
    LDX #$048A : JSR crash_draw_text

if !FEATURE_SD2SNES
    LDA.l #CrashTextInfo10 : STA !ram_crash_text
    LDA.l #CrashTextInfo10>>16 : STA !ram_crash_text_bank
    LDX #$0546 : JSR crash_draw_text
endif

    LDA.l #CrashTextInfo11 : STA !ram_crash_text
    LDA.l #CrashTextInfo11>>16 : STA !ram_crash_text_bank
    LDX #$0586 : JSR crash_draw_text

    ; draw footer text
    LDA.l #CrashTextFooter1 : STA !ram_crash_text
    LDA.l #CrashTextFooter1>>16 : STA !ram_crash_text_bank
    LDX #$0646 : JSR crash_draw_text

    LDA.l #CrashTextFooter2 : STA !ram_crash_text
    LDA.l #CrashTextFooter2>>16 : STA !ram_crash_text_bank
    LDX #$0686 : JSR crash_draw_text

    RTS
}

crash_draw_text:
{
    ; X = pointer to tilemap area (STA !ram_tilemap_buffer,X)
    LDA $C5 : PHA : LDA $C7 : PHA
    LDA !ram_crash_text_bank : STA $C7
    LDA !ram_crash_text : STA $C5
    %a8()
    LDY #$0000

    ; terminator
    LDA [$C5],Y : INY : CMP #$FF : BEQ .end
    ; palette
    STA !ram_crash_text_palette

  .loop
    LDA [$C5],Y : CMP #$FF : BEQ .end                 ; terminator
    STA !ram_tilemap_buffer,X : INX             ; tile
    LDA !ram_crash_text_palette : STA !ram_tilemap_buffer,X : INX   ; palette
    INY : BRA .loop

  .end
    %a16()
    PLA : STA $C7 : PLA : STA $C5
    RTS
}

crash_draw4:
{
    PHP : %a16()
    ; (X000)
    LDA !ram_crash_draw_value : AND #$F000 : XBA : LSR #3 : TAY
    LDA.w HexMenuGFXTable,Y : STA !ram_tilemap_buffer,X
    ; (0X00)
    LDA !ram_crash_draw_value : AND #$0F00 : XBA : ASL : TAY
    LDA.w HexMenuGFXTable,Y : STA !ram_tilemap_buffer+2,X
    ; (00X0)
    LDA !ram_crash_draw_value : AND #$00F0 : LSR #3 : TAY
    LDA.w HexMenuGFXTable,Y : STA !ram_tilemap_buffer+4,X
    ; (000X)
    LDA !ram_crash_draw_value : AND #$000F : ASL : TAY
    LDA.w HexMenuGFXTable,Y : STA !ram_tilemap_buffer+6,X
    PLP
    RTS
}

crash_draw2:
{
    PHP : %a16()
    ; (00X0)
    LDA !ram_crash_draw_value : AND #$00F0 : LSR #3 : TAY
    LDA.w HexMenuGFXTable,Y : STA !ram_tilemap_buffer,X
    ; (000X)
    LDA !ram_crash_draw_value : AND #$000F : ASL : TAY
    LDA.w HexMenuGFXTable,Y : STA !ram_tilemap_buffer+2,X
    PLP
    RTS
}

crash_cgram_transfer:
{
    PHP : %a16()

    LDA !ram_crash_palette : BEQ .white ; 0 index
    DEC : BEQ .grey      ; 1
    DEC : BEQ .green     ; 2
    DEC : BEQ .blue      ; 3

  .white
    LDA #$44E5 : STA $7EC012 ; outline
    LDA #$7FFF : STA $7EC014 ; text
    BRA .transfer

  .grey
    LDA #$1CE7 : STA $7EC012 ; outline
    LDA #$3DEF : STA $7EC014 ; text/numbers
    BRA .transfer

  .green
    LDA #$000E : STA $7EC012 ; outline
    LDA #$0A20 : STA $7EC014 ; text
    BRA .transfer

  .blue
    LDA #$7FFF : STA $7EC012 ; outline
    LDA #$7A02 : STA $7EC014 ; text

  .transfer
    LDA $7EC012 : STA $7EC01A
    LDA $7EC014 : STA $7EC01C

    JSL transfer_cgram_long
    PLP
    PHK : PLB
    RTL
}

crash_tilemap_transfer:
{
    %a16()
    LDA #$5800 : STA $2116 ; VRAM address ($B000 in VRAM)
    LDA #$1801 : STA $4310 ; low = word, normal increment (DMA MODE), high = destination (VRAM write)
    LDA.w #!ram_tilemap_buffer : STA $4312 ; source offset
    LDA.w #!ram_tilemap_buffer>>16 : STA $4314 ; source bank
    LDA #$0800 : STA $4315 ; size
    STZ $4317 : STZ $4319
    %a8()
    LDA #$80 : STA $2115 ; word-access, inc by 1
    LDA #$02 : STA $420B ; initiate DMA on channel 2
    %a16()
    RTL
}

CrashTextHeader:
    table ../resources/header.tbl
    db #$28, "SM SHOT ITSELF IN THE FOOT", #$FF
    table ../resources/normal.tbl

CrashTextFooter1:
; Navigate pages with A or B
    db #$28, "Navigate pages with ", #$8F, " or ", #$87, #$FF

CrashTextFooter2:
; Cycle palettes with L or R
    db #$28, "Cycle palettes with ", #$8D, " or ", #$8C, #$FF

CrashTextStack1:
    db #$28, "STACK:       Bytes", #$FF

CrashTextStack2:
    db #$28, "(starting at $    )", #$FF

CrashTextHeader2:
    table ../resources/header.tbl
    db #$28, "CRASH MEMORY VIEWER", #$FF
    table ../resources/normal.tbl

CrashTextMemAddress:
    db #$28, "ADDRESS:  $", #$FF

CrashTextMemValue:
    db #$28, "VALUE:    $", #$FF

CrashTextMemSelectBank:
    db #$28, "Select Address Bank  $", #$FF

CrashTextMemSelectHigh:
    db #$28, "Select Address High  $", #$FF

CrashTextMemSelectLow:
    db #$28, "Select Address Low   $", #$FF

CrashTextHeader3:
    table ../resources/header.tbl
    db #$28, "BUT WHAT DOES IT ALL MEAN?", #$FF
    table ../resources/normal.tbl

CrashTextInfo1:
    db #$28, "Super Metroid has crashed!", #$FF

CrashTextInfo2:
    db #$28, "You can report this crash", #$FF

CrashTextInfo3:
    db #$28, "on GitHub, or in Discord's", #$FF

CrashTextInfo4:
    db #$28, "#practice-hack channel.", #$FF

CrashTextInfo5:
    db #$28, "Take a screenshot of the", #$FF

CrashTextInfo6:
    db #$28, "first page to help us", #$FF

CrashTextInfo7:
    db #$28, "diagnose the issue.", #$FF

CrashTextInfo8:
    db #$28, "smpractice.speedga.me", #$FF

CrashTextInfo9:
    db #$28, "wiki.supermetroid.run", #$FF

if !FEATURE_SD2SNES
CrashTextInfo10:
    db #$28, "FXPAK users can load state", #$FF
endif

CrashTextInfo11:
; Press LRSlSt to soft reset
    db #$28, "Press ", #$8D, #$8C, #$85, #$84, " to soft reset", #$FF

print pc, " crash handler bank89 end"

