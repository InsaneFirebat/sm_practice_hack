; hooks
!SPRITE_PRIO_FLAG = $

; $90:861C 22 AE 89 81 JSL $8189AE[$81:89AE]  ; Add Samus spritemap to OAM
org $90861c
    jsl oam_add_samus_sprite_with_prio

; $90:8643 22 AE 89 81 JSL $8189AE[$81:89AE]  ; Add Samus spritemap to OAM
org $908643
    jsl oam_add_samus_sprite_with_prio


; This is a copy of the code that adds samus spritemap to the OAM buffer
; with a modification that it can adjust the sprite propery flags
; It's a copy so that it only affects Samus, and only adds a single instruction
; keeping the change in timing down as much as possible.

org $81ef20
print pc, " spriteprio start"
oam_add_samus_sprite_with_prio:
    PHB
    PEA $9200 : PLB : PLB
    STY $12 : STX $14        ; (Y/X position of spritemap centre)

    ASL : TAX                ; Y = [$92:808D + [A] * 2] (address of spritemap)
    LDY $808D,X
    LDA $0000,Y : BEQ .end   ; If [[Y]] = 0: return
    STA $18                  ; $18 = [[Y]] (size)
    INY #2                   ; Y += 2
    LDX $0590                ; X = OAM data index
    CLC

  .loop
    LDA $0000,Y : ADC $14 : STA $0370,X   ; OAM data entry X position = [[Y]] + [$14] (X position)
    AND #$0100 : BEQ .l3                  ; If [OAM data entry X position] & 100h:
    LDA $0000,Y : BPL .l2                 ; If [[Y]] & 8000h (size bit) != 0:
    LDA $81859F,X : STA $16
    LDA ($16) : ORA $8185A1,X : STA ($16) ; Set OAM entry high X position bit and size bit
    JMP .l4

  .l2
    LDA $81859F,X : STA $16               ; Else (size bit = 0):
    LDA ($16) : ORA $81839F,X : STA ($16) ; Set OAM entry high X position bit
    JMP .l4

  .l3
    ; Else (X position & 100h == 0)
    LDA $0000,Y : BPL $0E                 ; If [[Y]] & 8000h (size bit) != 0:
    LDA $81859F,X : STA $16
    LDA ($16) : ORA $8183A1,X : STA ($16) ; Set OAM entry size bit

  .l4
    LDA $0002,Y
    CLC : ADC $12 : STA $0371,X           ; OAM entry Y position = [[Y] + 2] + [$12] (Y position)

    ;} OAM entry tile number and attributes = [[Y] + 3]
    LDA $0003,Y : ORA !sram_sprite_prio_flag : STA $0372,X

    TYA : CLC : ADC #$0005 : TAY          ; Next sprite map entry
    TXA : ADC #$0004 : AND #$01FF : TAX   ; Next OAM index

    DEC $18 : BNE .loop      ; If not processed all sprite map entries: next!
    STX $0590                ; OAM index = [X]

  .end
    PLB
    RTL

print pc, " spriteprio end"
warnpc $81f000
