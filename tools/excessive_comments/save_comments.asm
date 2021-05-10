; SD2SNES Savestate code
; by acmlm, total, Myria
;; excessive comments with double semicolons by InsaneFirebat
;

org $80D000
; These can be modified to do game-specific things before and after saving and loading
; Both A and X/Y are 16-bit here

; SM specific features to restore the correct music when loading a state below
pre_load_state:
    lda !MUSIC_BANK                               ;; load music bank
    sta !SRAM_MUSIC_BANK                          ;; store music bank in SRAM
    lda !MUSIC_TRACK                              ;; load music track
    sta !SRAM_MUSIC_TRACK                         ;; store music track in SRAM

    ; Rerandomize
    lda !sram_save_has_set_rng : bne +            ;; branch if no RNG set
    lda !sram_rerandomize : and #$00ff : beq +    ;; load rerandomize setting, isolate low byte, branch if zero
    lda $05e5 : sta $770080                       ;; load RNG value and store in SRAM
    lda $05b6 : sta $770082                       ;; load frame counter and store in SRAM
    +
    rts                                           ;; return to load_state

post_load_state:
    JSL stop_all_sounds                           ;; jump to stop_all_sounds in misc.asm

    lda !SRAM_MUSIC_BANK                          ;; load music bank from SRAM
    cmp !MUSIC_BANK                               ;; compare to current music bank
    bne music_load_bank                           ;; branch to music_load_bank if not equal

    lda !SRAM_MUSIC_TRACK                         ;; load music track from SRAM
    cmp !MUSIC_TRACK                              ;; compare to current music track
    bne music_load_track                          ;; branch to music_laod_track if not equal
    jmp music_done                                ;; jump to music done if music was already set correctly

music_load_bank:
    lda #$FF00                                    ;; load #$FF00 into A
    clc                                           ;; clear carry bit
    adc !MUSIC_BANK                               ;; add music bank to #$FF00
    JSL !MUSIC_ROUTINE                            ;; goto music_routine pointer    ;;; $808FC1: Queue music data or music track, 8 frame delay, cannot set last queue entry ;;;

music_load_track:
    lda !MUSIC_TRACK                              ;; load music track into A
    jsl !MUSIC_ROUTINE                            ;; goto music routine pointer

music_done:
    ; Rerandomize
    lda !sram_save_has_set_rng : bne +            ;; branch if no RNG set
    lda !sram_rerandomize : and #$00ff : beq +    ;; load rerandomize setting, isolate low byte, branch if zero
    lda $770080                                   ;; load stashed RNG value from SRAM
    sta $05e5                                     ;; restore RNG value
    lda $770082                                   ;; load stashed frame counter from SRAM
    sta $05b6                                     ;; restore frame counter
    +
    rts                                           ;; return to load_dma_regs_done
; end of post_load_state


; These restored registers are game-specific and needs to be updated for different games
register_restore_return:
    ;; end of both save/load routines ??
    %a8()                                         ;; set 8-bit mode for A
    lda $84                                       ;; load $0084 to A, SM stores register $4200 here (NMI and auto-joypad read)
    sta $4200                                     ;; restore register
    lda #$0F                                      ;; load #$0F into A
    sta $13                                       ;; store to $13 (temp?)
    sta $2100                                     ;; store to $2100, low bits here control brightness
    rtl                                           ;; is this the end? are we free now? we haven't hit any subroutines in the save_state path

save_state:
    pea $0000                                     ;; "Push Effective Absolute Address" to the stack
    plb                                           ;; pull bank from stack two times
    plb

    ; Store DMA registers to SRAM
    %a8()                                         ;; set 8-bit mode for A
    ldy #$0000                                    ;; zero Y
    tyx                                           ;; zero X too

save_dma_regs:
    ;; start of inner loop that saves registers $4300 through 437B
    lda $4300, x                                  ;; load $4300 + X offset into A
    sta !SRAM_DMA_BANK, x                         ;; store it in SRAM
    inx                                           ;; increment X
    iny                                           ;; increment Y
    cpy #$000B                                    ;; compare Y to #$000B
    bne save_dma_regs                             ;; loop until Y is #$000B
    ;; end of inner loop, skip addresses ending in C through F
    cpx #$007B                                    ;; compare X to #$007B
    beq save_dma_regs_done                        ;; exit loop after storing up to $437B
    inx #5                                        ;; increment X five times
    ldy #$0000                                    ;; zero Y
    bra save_dma_regs                             ;; start over with inner loop

save_dma_regs_done:
    %ai16()                                       ;; set 16-bit A and X
    ldx #save_write_table                         ;; load from table into X ??

run_vm:
    pea !SS_BANK                                  ;; "Push Effective Absolute Address" to the stack
    plb                                           ;; pull bank from stack two times
    plb
    jmp vm                                        ;; jump with no return address

save_write_table:
    ; Turn PPU off
    dw $1000|$2100, $80
    dw $1000|$4200, $00
    ; Single address, B bus -> A bus.  B address = reflector to WRAM ($2180).
    dw $0000|$4310, $8080                         ; direction = B->A, byte reg, B addr = $2180
    ; Copy WRAM 7E0000-7E7FFF to SRAM 710000-717FFF.
    dw $0000|$4312, $0000                         ; A addr = $xx0000
    dw $0000|$4314, $0071                         ; A addr = $71xxxx, size = $xx00
    dw $0000|$4316, $0080                         ; size = $80xx ($8000), unused bank reg = $00.
    dw $0000|$2181, $0000                         ; WRAM addr = $xx0000
    dw $1000|$2183, $00                           ; WRAM addr = $7Exxxx  (bank is relative to $7E)
    dw $1000|$420B, $02                           ; Trigger DMA on channel 1
    ; Copy WRAM 7E8000-7EFFFF to SRAM 720000-727FFF.
    dw $0000|$4312, $0000                         ; A addr = $xx0000
    dw $0000|$4314, $0072                         ; A addr = $72xxxx, size = $xx00
    dw $0000|$4316, $0080                         ; size = $80xx ($8000), unused bank reg = $00.
    dw $0000|$2181, $8000                         ; WRAM addr = $xx8000
    dw $1000|$2183, $00                           ; WRAM addr = $7Exxxx  (bank is relative to $7E)
    dw $1000|$420B, $02                           ; Trigger DMA on channel 1
    ; Copy WRAM 7F0000-7F7FFF to SRAM 730000-737FFF.
    dw $0000|$4312, $0000                         ; A addr = $xx0000
    dw $0000|$4314, $0073                         ; A addr = $73xxxx, size = $xx00
    dw $0000|$4316, $0080                         ; size = $80xx ($8000), unused bank reg = $00.
    dw $0000|$2181, $0000                         ; WRAM addr = $xx0000
    dw $1000|$2183, $01                           ; WRAM addr = $7Fxxxx  (bank is relative to $7E)
    dw $1000|$420B, $02                           ; Trigger DMA on channel 1
    ; Copy WRAM 7F8000-7FFFFF to SRAM 740000-747FFF.
    dw $0000|$4312, $0000                         ; A addr = $xx0000
    dw $0000|$4314, $0074                         ; A addr = $74xxxx, size = $xx00
    dw $0000|$4316, $0080                         ; size = $80xx ($8000), unused bank reg = $00.
    dw $0000|$2181, $8000                         ; WRAM addr = $xx8000
    dw $1000|$2183, $01                           ; WRAM addr = $7Fxxxx  (bank is relative to $7E)
    dw $1000|$420B, $02                           ; Trigger DMA on channel 1
    ; Address pair, B bus -> A bus.  B address = VRAM read ($2139).
    dw $0000|$4310, $3981                         ; direction = B->A, word reg, B addr = $2139
    dw $1000|$2115, $0000                         ; VRAM address increment mode.
    ; Copy VRAM 0000-7FFF to SRAM 750000-757FFF.
    dw $0000|$2116, $0000                         ; VRAM address >> 1.
    dw $9000|$2139, $0000                         ; VRAM dummy read.
    dw $0000|$4312, $0000                         ; A addr = $xx0000
    dw $0000|$4314, $0075                         ; A addr = $75xxxx, size = $xx00
    dw $0000|$4316, $0080                         ; size = $80xx ($0000), unused bank reg = $00.
    dw $1000|$420B, $02                           ; Trigger DMA on channel 1
    ; Copy VRAM 8000-7FFF to SRAM 760000-767FFF.
    dw $0000|$2116, $4000                         ; VRAM address >> 1.
    dw $9000|$2139, $0000                         ; VRAM dummy read.
    dw $0000|$4312, $0000                         ; A addr = $xx0000
    dw $0000|$4314, $0076                         ; A addr = $76xxxx, size = $xx00
    dw $0000|$4316, $0080                         ; size = $80xx ($0000), unused bank reg = $00.
    dw $1000|$420B, $02                           ; Trigger DMA on channel 1
    ; Copy CGRAM 000-1FF to SRAM 772000-7721FF.
    dw $1000|$2121, $00                           ; CGRAM address
    dw $0000|$4310, $3B80                         ; direction = B->A, byte reg, B addr = $213B
    dw $0000|$4312, $2000                         ; A addr = $xx2000
    dw $0000|$4314, $0077                         ; A addr = $77xxxx, size = $xx00
    dw $0000|$4316, $0002                         ; size = $02xx ($0200), unused bank reg = $00.
    dw $1000|$420B, $02                           ; Trigger DMA on channel 1
    ; Done
    dw $0000, save_return

;; vm jumps here when done
save_return:
    pea $0000                                     ;; "Push Effective Absolute Address" to the stack
    plb                                           ;; pull bank from stack two times
    plb

    %ai16()                                       ;; set 16-bit mode for A and X
    LDA !ram_room_has_set_rng : STA !sram_save_has_set_rng    ;; copy room RNG flag to SRAM

    tsc                                           ;; transfer stack pointer to A
    sta !SRAM_SAVED_SP                            ;; store stack pointer in SRAM
    jmp register_restore_return                   ;; jump to register_restore_return


load_state:
    jsr pre_load_state                            ;; jump to pre_load_state for game-specific routines (music and rerandomize for SM)
    pea $0000                                     ;; "Push Effective Absolute Address" to the stack
    plb                                           ;; pull bank from stack two times
    plb

    %a8()                                         ;; set 8-bit mode for A
    ldx #load_write_table                         ;; load from table into X
    jmp run_vm                                    ;; jump to run_vm

load_write_table:
    ; Disable HDMA
    dw $1000|$420C, $00
    ; Turn PPU off
    dw $1000|$2100, $80
    dw $1000|$4200, $00
    ; Single address, A bus -> B bus.  B address = reflector to WRAM ($2180).
    dw $0000|$4310, $8000                         ; direction = A->B, B addr = $2180
    ; Copy SRAM 710000-717FFF to WRAM 7E0000-7E7FFF.
    dw $0000|$4312, $0000                         ; A addr = $xx0000
    dw $0000|$4314, $0071                         ; A addr = $71xxxx, size = $xx00
    dw $0000|$4316, $0080                         ; size = $80xx ($8000), unused bank reg = $00.
    dw $0000|$2181, $0000                         ; WRAM addr = $xx0000
    dw $1000|$2183, $00                           ; WRAM addr = $7Exxxx  (bank is relative to $7E)
    dw $1000|$420B, $02                           ; Trigger DMA on channel 1
    ; Copy SRAM 720000-727FFF to WRAM 7E8000-7EFFFF.
    dw $0000|$4312, $0000                         ; A addr = $xx0000
    dw $0000|$4314, $0072                         ; A addr = $72xxxx, size = $xx00
    dw $0000|$4316, $0080                         ; size = $80xx ($8000), unused bank reg = $00.
    dw $0000|$2181, $8000                         ; WRAM addr = $xx8000
    dw $1000|$2183, $00                           ; WRAM addr = $7Exxxx  (bank is relative to $7E)
    dw $1000|$420B, $02                           ; Trigger DMA on channel 1
    ; Copy SRAM 730000-737FFF to WRAM 7F0000-7F7FFF.
    dw $0000|$4312, $0000                         ; A addr = $xx0000
    dw $0000|$4314, $0073                         ; A addr = $73xxxx, size = $xx00
    dw $0000|$4316, $0080                         ; size = $80xx ($8000), unused bank reg = $00.
    dw $0000|$2181, $0000                         ; WRAM addr = $xx0000
    dw $1000|$2183, $01                           ; WRAM addr = $7Fxxxx  (bank is relative to $7E)
    dw $1000|$420B, $02                           ; Trigger DMA on channel 1
    ; Copy SRAM 740000-747FFF to WRAM 7F8000-7FFFFF.
    dw $0000|$4312, $0000                         ; A addr = $xx0000
    dw $0000|$4314, $0074                         ; A addr = $74xxxx, size = $xx00
    dw $0000|$4316, $0080                         ; size = $80xx ($8000), unused bank reg = $00.
    dw $0000|$2181, $8000                         ; WRAM addr = $xx8000
    dw $1000|$2183, $01                           ; WRAM addr = $7Fxxxx  (bank is relative to $7E)
    dw $1000|$420B, $02                           ; Trigger DMA on channel 1
    ; Address pair, A bus -> B bus.  B address = VRAM write ($2118).
    dw $0000|$4310, $1801                         ; direction = A->B, B addr = $2118
    dw $1000|$2115, $0000                         ; VRAM address increment mode.
    ; Copy SRAM 750000-757FFF to VRAM 0000-7FFF.
    dw $0000|$2116, $0000                         ; VRAM address >> 1.
    dw $0000|$4312, $0000                         ; A addr = $xx0000
    dw $0000|$4314, $0075                         ; A addr = $75xxxx, size = $xx00
    dw $0000|$4316, $0080                         ; size = $80xx ($0000), unused bank reg = $00.
    dw $1000|$420B, $02                           ; Trigger DMA on channel 1
    ; Copy SRAM 760000-767FFF to VRAM 8000-7FFF.
    dw $0000|$2116, $4000                         ; VRAM address >> 1.
    dw $0000|$4312, $0000                         ; A addr = $xx0000
    dw $0000|$4314, $0076                         ; A addr = $76xxxx, size = $xx00
    dw $0000|$4316, $0080                         ; size = $80xx ($0000), unused bank reg = $00.
    dw $1000|$420B, $02                           ; Trigger DMA on channel 1
    ; Copy SRAM 772000-7721FF to CGRAM 000-1FF.
    dw $1000|$2121, $00                           ; CGRAM address
    dw $0000|$4310, $2200                         ; direction = A->B, byte reg, B addr = $2122
    dw $0000|$4312, $2000                         ; A addr = $xx2000
    dw $0000|$4314, $0077                         ; A addr = $77xxxx, size = $xx00
    dw $0000|$4316, $0002                         ; size = $02xx ($0200), unused bank reg = $00.
    dw $1000|$420B, $02                           ; Trigger DMA on channel 1
    ; Done
    dw $0000, load_return

;; vm jumps here when done
load_return:
    %ai16()                                       ;; set 16-bit mode for A and X
    lda !SRAM_SAVED_SP                            ;; load stack pointer from SRAM
    tcs                                           ;; transfer stack pointer to A   ?? why would we load to A right before transferring the stack pointer to A?

    pea $0000                                     ;; "Push Effective Absolute Address" to the stack
    plb                                           ;; pull bank from stack two times
    plb

    ; rewrite inputs so that holding load won't keep loading, as well as rewriting saving input to loading input
    lda !SS_INPUT_CUR                             ;; load current inputs to A
    eor !sram_ctrl_save_state                     ;; exclusive OR A with savestate shortcut inputs
    ora !sram_ctrl_load_state                     ;; OR A with loadstate shortcut inputs
    sta !SS_INPUT_CUR                             ;; store A in current inputs
    sta !SS_INPUT_NEW                             ;; store A in new inputs
    sta !SS_INPUT_PREV                            ;; store A in previous inputs

    %a8()                                         ;; set 8-bit mode for A
    ldx #$0000                                    ;; zero X
    txy                                           ;; zero Y too

load_dma_regs:
    lda !SRAM_DMA_BANK, x                         ;; load DMA register from SRAM using X offset
    sta $4300, x                                  ;; store DMA register to RAM using X offset
    inx                                           ;; increment X
    iny                                           ;; increment Y
    cpy #$000B                                    ;; check if Y is #$000B
    bne load_dma_regs                             ;; branch until Y = #$000B
    ;; end of inner loop, skip addresses ending in C through F
    cpx #$007B                                    ;; check if X is #$007B
    beq load_dma_regs_done                        ;; exit loop after copying up to $437B
    inx #5                                        ;; increment X five times
    ldy #$0000                                    ;; zero Y
    jmp load_dma_regs                             ;; start over with inner loop

load_dma_regs_done:
    ; Restore registers and return.
    %ai16()                                       ;; set 16-bit mode for A and X
    jsr post_load_state                           ;; jump to post_load_state with return
    jmp register_restore_return                   ;; jump to register_restore_return

;; this seems to handle the massive DMA transfers to and from SRAM, using a separate table for save and load with last entry used as exit-jump address
vm:
    ; Data format: xx xx yy yy
    ; xxxx = little-endian address to write to .vm's bank
    ; yyyy = little-endian value to write
    ; If xxxx has high bit set, read and discard instead of write.
    ; If xxxx has bit 12 set ($1000), byte instead of word.
    ; If yyyy has $DD in the low half, it means that this operation is a byte
    ; write instead of a word write.  If xxxx is $0000, end the VM.
    rep #$30
    ; Read address to write to
    lda.w $0000, x
    beq vm_done
    tay
    inx
    inx
    ; Check for byte mode
    bit.w #$1000
    beq vm_word_mode
    and.w #$EFFF
    tay
    sep #$20
vm_word_mode:
    ; Read value
    lda.w $0000, x
    inx
    inx
vm_write:
    ; Check for read mode (high bit of address)
    cpy.w #$8000
    bcs vm_read
    sta $0000, y
    bra vm
vm_read:
    ; "Subtract" $8000 from y by taking advantage of bank wrapping.
    lda $8000, y
    bra vm

vm_done:
    ; A, X and Y are 16-bit at exit.
    ; Return to caller.  The word in the table after the terminator is the
    ; code address to return to.
    jmp ($0002,x)
