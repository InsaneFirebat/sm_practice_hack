pushpc
org $8EE600

cm_brb_loop:
{
    ; Initial setup
    %ai16()
    LDA !DP_CurrentMenu : PHA
    LDA !DP_CurrentMenu+2 : PHA
    PHX : PHY

    LDA !ram_cm_brb_palette : PHA ; preserve menu palette
    CMP #$FFFF : BEQ + ; check if palette swapping disabled
    LDA #$0000 : STA !ram_cm_brb_palette
+   LDA #$0000 : STA !ram_cm_brb_screen
    STA !ram_cm_brb_frames : STA !ram_cm_brb_timer
    STA !ram_cm_scroll_H : STA !ram_cm_scroll_V
    STA !ram_cm_scroll_X
    LDA #$0008 : STA !ram_cm_scroll_Y

    JSR cm_transfer_brb_tileset
    JSL cm_wait_for_lag_frame
    JSL $808F0C ; Music queue
    JSL $8289EF ; Sound fx queue

  .loop
    ; [do entertaining stuff here]
    JSR cm_draw_brb

    ; [do loop stuff down here]

  .exit
    LDA !ram_cm_leave : BEQ .check_input
    ; Exit brb loop
    LDA #$0000 : STA !ram_cm_leave
    PLA : STA !ram_cm_brb_palette ; restore menu palette
    LDA #$0046 : JSL !SFX_LIB2 ; lavaquake sfx
    JSL cm_wait_for_lag_frame

    LDA $B9
    %a8()
    STA $2111 : XBA : STA $2111
    %a16()
    LDA $BB
    %a8()
    STA $2112 : XBA : STA $2112
    %a16()

    PLY : PLX
    PLA : STA !DP_CurrentMenu+2
    PLA : STA !DP_CurrentMenu
    RTL

  .check_input
    ; Make sure we don't read joysticks twice in the same frame
    LDA !FRAME_COUNTER : CMP !ram_cm_input_counter : PHP
    STA !ram_cm_input_counter
    PLP : BNE +
    JSL $809459 ; Read controller input

+   LDA !IH_CONTROLLER_PRI_NEW : BEQ .loop

    ; A = cycle now, B = exit
    CMP #$8000 : BEQ .done
    CMP #$0080 : BEQ .forceIncScreen
    JMP .loop

  .forceIncScreen
    LDA #$0000 : STA !ram_cm_brb_timer
    LDA !ram_cm_brb_screen : INC : STA !ram_cm_brb_screen
    CMP #$000F : BMI .loop ; total screens
    LDA #$0000
    STA !ram_cm_brb_screen : STA !ram_cm_brb_timer
    JMP .loop

  .done
    LDA #$0001 : STA !ram_cm_leave
    JMP .exit
}

cm_draw_brb:
{
    JSL cm_tilemap_bg_interior
    JSR cm_tilemap_brb
    JSL cm_tilemap_transfer_long
    JSL cm_scroll_BG3
    RTS
}

cm_tilemap_brb:
{
    ; Handle timer for cycling text and palette
    ; Timer is only incremented once every other frame
    LDA !ram_cm_brb_timer : CMP !ram_cm_brb_cycle_time : BMI .draw_brb_stuff
    LDA #$0000 : STA !ram_cm_brb_timer
    JSL MenuRNG ; Get new RNG values

    ; Cycle screen text
    LDA !ram_cm_brb_screen : INC : STA !ram_cm_brb_screen
    CMP #$000F : BMI + ; total screens
    LDA #$0000 : STA !ram_cm_brb_screen

    ; Cycle menu palette
+   LDA !ram_cm_brb_palette : CMP #$FFFF : BEQ .draw_brb_stuff
    INC : STA !ram_cm_brb_palette
    CMP #$0011 : BMI +
    LDA #$0000 : STA !ram_cm_brb_palette
+   ASL : TAX
    JSL PrepMenuPalette
    JSR cm_transfer_brb_cgram

  .draw_brb_stuff
    ; Drawing whatever manually
    LDA !ram_cm_brb_timer : INC : STA !ram_cm_brb_timer
    LDA !ram_seed_X : AND #$07FE : TAX
    LDA !BRB_METROID : STA !ram_tilemap_buffer,X

    LDA !ram_seed_X : XBA : AND #$07FE : TAX
    LDA !BRB_METROID : STA !ram_tilemap_buffer,X

    LDA !ram_seed_Y : AND #$07FE : TAX
    LDA !BRB_METROID : STA !ram_tilemap_buffer,X

    LDA !ram_seed_Y : XBA : AND #$07FE : TAX
    LDA !BRB_METROID : STA !ram_tilemap_buffer,X

  .draw_text
    ; Same bank for all of the BRB text
    PHK : PHK : PLA : STA !DP_CurrentMenu+2

    LDA.w #BRB_common_1 : STA !DP_CurrentMenu
    LDX #$01C6
    JSR cm_draw_brb_text

    LDA.w #BRB_common_2 : STA !DP_CurrentMenu
    LDX #$0286
    JSR cm_draw_brb_text

    ; Handle timer
    LDA !ram_cm_brb_timer_mode : BEQ .draw_cycling_text
    CMP #$0001 : BEQ .countup
    JSR BRB_handle_countdown_timer
    BRA .draw_timer

  .countup
    JSR BRB_handle_countup_timer

  .draw_timer
    ; Seconds
    LDA !ram_cm_brb_secs : ASL : TAX
    LDA.l TimerNumberGFX1,X : STA !ram_tilemap_buffer+$360
    LDA.l TimerNumberGFX2,X : STA !ram_tilemap_buffer+$362

    ; Minutes
    LDA !ram_cm_brb_mins : ASL : TAX
    LDA.l TimerNumberGFX1,X : STA !ram_tilemap_buffer+$35A
    LDA.l TimerNumberGFX2,X : STA !ram_tilemap_buffer+$35C

    ; Draw colon seperator
    LDX #$035E
    LDA #$2849 : STA !ram_tilemap_buffer+0,X

    ; Draw +/- after countdown expires
    LDA !ram_cm_brb_timer_mode : BEQ .draw_cycling_text
    DEC : BEQ +
    LDA #$286C : STA !ram_tilemap_buffer+$358
    BRA .draw_cycling_text
+   LDA #$288B : STA !ram_tilemap_buffer+$358

  .draw_cycling_text
    ; Draw cycling text
    ; first cycled line
    LDA !ram_cm_brb_screen : ASL : TAX
    LDA.l BRBTilemapAddress,X : STA !DP_CurrentMenu
    LDX #$04C6
    JSR cm_draw_brb_text

    ; second cycled line
    LDA !ram_cm_brb_screen : ASL : TAX
    LDA.l BRBTilemapAddress2,X : STA !DP_CurrentMenu
    LDX #$0586
    JSR cm_draw_brb_text

    RTS
}

BRB_handle_countup_timer:
{
    LDA !ram_cm_brb_frames : INC : STA !ram_cm_brb_frames : CMP #$003C : BNE +
    LDA #$0000 : STA !ram_cm_brb_frames
    LDA !ram_cm_brb_secs : INC : STA !ram_cm_brb_secs : CMP #$003C : BNE +
    LDA #$0000 : STA !ram_cm_brb_secs
    LDA !ram_cm_brb_mins : INC : STA !ram_cm_brb_mins
+   RTS
}

BRB_handle_countdown_timer:
{
    LDA !ram_cm_brb_frames : DEC : STA !ram_cm_brb_frames : BPL +
    LDA #$003B : STA !ram_cm_brb_frames
    LDA !ram_cm_brb_secs : DEC : STA !ram_cm_brb_secs : BPL +
    LDA #$003B : STA !ram_cm_brb_secs
    LDA !ram_cm_brb_mins : DEC : STA !ram_cm_brb_mins : BPL +
    LDA #$0001 : STA !ram_cm_brb_timer_mode
    STA !ram_cm_brb_frames
    LDA #$0000 : STA !ram_cm_brb_secs : STA !ram_cm_brb_mins
+   RTS
}

cm_transfer_brb_cgram:
{
    LDA #$0000 : STA $7EC000
    LDA !ram_palette_border : STA $7EC00A
    LDA !ram_palette_headeroutline : STA $7EC012
    LDA !ram_palette_text : STA $7EC014
    LDA !ram_palette_background : STA $7EC016 : STA $7EC00E
    LDA !ram_palette_numoutline : STA $7EC01A
    LDA !ram_palette_numfill : STA $7EC01C
    LDA !ram_palette_toggleon : STA $7EC032
    LDA !ram_palette_seltext : STA $7EC034
    LDA !ram_palette_seltextbg : STA $7EC036
    LDA !ram_palette_numseloutline : STA $7EC03A
    LDA !ram_palette_numsel : STA $7EC03C
    JSL transfer_cgram_long
    RTS
}

cm_draw_brb_text:
{
    ; X = pointer to tilemap area (STA !ram_tilemap_buffer,X)
    ; !DP_CurrentMenu[0x3] = address
  %a8()
    LDY #$0000
    ; terminator
    LDA [!DP_CurrentMenu],Y : INY : CMP #$FF : BEQ .end
    ; ORA with palette info
    ORA !DP_Palette : STA !DP_Palette

  .loop
    LDA [!DP_CurrentMenu],Y : CMP #$FF : BEQ .end       ; terminator
    STA !ram_tilemap_buffer,X : INX                     ; tile
    LDA !DP_Palette : STA !ram_tilemap_buffer,X : INX   ; palette
    INY : BRA .loop

  .end
    %a16()
    RTS
}

cm_transfer_brb_tileset:
{
    PHP

    ; Load custom vram to normal location
    %a8()
    LDA #$80 : STA $802100 ; enable forced blanking
    LDA #!DP_CurrentMenu : STA $210C
    LDA #$80 : STA $2115 ; word-access, incr by 1
    LDX #$4000 : STX $2116 ; VRAM address (8000 in vram)
    LDX.w #cm_brb_table : STX $4302 ; Source offset
    LDA.b #cm_brb_table>>16 : STA $4304 ; Source bank
    LDX #$1000 : STX $4305 ; Size (0x10 = 1 tile)
    LDA #$01 : STA $4300 ; word, normal increment (DMA MODE)
    LDA #$18 : STA $4301 ; destination (VRAM write)
    LDA #$01 : STA $420B ; initiate DMA (channel 1)
    LDA #$0F : STA $0F2100 ; disable forced blanking
    PLP
    RTS
}

cm_scroll_BG3:
{
    LDA !ram_cm_scroll : BNE +

  .skip
    RTL

+   LDA !ram_cm_scroll_timer : INC : STA !ram_cm_scroll_timer
    CMP #$0007 : BNE .verticalScrolling
    LDA #$0000 : STA !ram_cm_scroll_timer

  .verticalScrolling
    PHP : %a16()
    ; vertical scrolling at 3 5
    LDA !ram_cm_scroll_timer : CMP #$0003 : BEQ +
    CMP #$0005 : BNE .horizontalScrolling

+   LDA !ram_cm_scroll_V : BNE .moveUp
    LDA !ram_cm_scroll_Y : INC : STA !ram_cm_scroll_Y
    CMP #$0011 : BNE .horizontalScrolling

  .reverseV
    LDA !ram_cm_scroll_V : BEQ .incV
    LDA #$0000 : STA !ram_cm_scroll_V
    BRA .horizontalScrolling

  .incV
    INC : STA !ram_cm_scroll_V
    BRA .horizontalScrolling

  .moveUp
    LDA !ram_cm_scroll_Y : DEC : STA !ram_cm_scroll_Y
    BPL .horizontalScrolling
    LDA #$0001 : STA !ram_cm_scroll_Y
    BRA .reverseV

  .horizontalScrolling
    ; horizontal scrolling at 1 3 5
    LDA !ram_cm_scroll_timer : AND #$0001 : BEQ .applyScrolls
    LDA !ram_cm_scroll_H : BNE .moveLeft
    LDA !ram_cm_scroll_X : INC : STA !ram_cm_scroll_X
    CMP #$000F : BEQ .reverseH
    CMP #$0400 : BNE .applyScrolls
    LDA #$0000 : STA !ram_cm_scroll_X
    BRA .applyScrolls

  .moveLeft
    LDA !ram_cm_scroll_X : DEC : STA !ram_cm_scroll_X
    BMI .dec3FF
    CMP #$03F1 : BNE .applyScrolls

  .reverseH
    LDA !ram_cm_scroll_H : BEQ .incH
    LDA #$0000 : STA !ram_cm_scroll_H
    BRA .applyScrolls

  .incH
    INC : STA !ram_cm_scroll_H
    BRA .applyScrolls
    
  .dec3FF
    LDA #$03FF : STA !ram_cm_scroll_X

  .applyScrolls
    ; force blank and apply scrolls
    %i8()
    LDX #$80 : STX $2100

    LDA !ram_cm_scroll_X
    %a8()
    STA $2111 : XBA : STA $2111
    %a16()

    LDA !ram_cm_scroll_Y : DEC
    %a8()
    STA $2112 : XBA : STA $2112

    LDA #$0F : STA $2100

    PLP
    RTL
}


; -------------
; BRB Text Data
; -------------

BRB_common_1:
table ../resources/tables/customfont.tbl
    db #$28, "      InsaneFirebat", #$FF
table ../resources/tables/normal.tbl

BRB_common_2:
    db #$28, "    Will Be Right Back", #$FF

BRBTilemapAddress:
    dw #BRB_screen_01
    dw #BRB_screen_02
    dw #BRB_screen_03
    dw #BRB_screen_04
    dw #BRB_screen_05
    dw #BRB_screen_06
    dw #BRB_screen_07
    dw #BRB_screen_08
    dw #BRB_screen_09
    dw #BRB_screen_0A
    dw #BRB_screen_0B
    dw #BRB_screen_0C
    dw #BRB_screen_0D
    dw #BRB_screen_0E
    dw #BRB_screen_0F

BRB_screen_01:
    db #$28, "GT Classic Discord Server", #$FF

BRB_screen_02:
    db #$28, "Find the practice hack at", #$FF

BRB_screen_03:
    db #$28, "  Control Schemes for SM", #$FF

BRB_screen_04:
    db #$28, "   SM Speedrunning Wiki", #$FF

BRB_screen_05:
    db #$28, "    My YouTube channel", #$FF

BRB_screen_06:
    db #$28, "     Find me on Steam", #$FF

BRB_screen_07:
    db #$28, " Crazy chain damage clips", #$FF

BRB_screen_08:
    db #$28, "Ask me how to get a custom", #$FF

BRB_screen_09:
    db #$28, "  Speedrun any SM hacks?", #$FF

BRB_screen_0A:
    db #$28, "If you have any questions,", #$FF

BRB_screen_0B:
    db #$28, " My SRL race stats for SM", #$FF

BRB_screen_0C:
    db #$28, "  Disney's Aladdin (SNES)", #$FF

BRB_screen_0D:
    db #$28, "   The Lion King (SNES)", #$FF

BRB_screen_0E:
    db #$28, "Great Circus Mystery (WIP)", #$FF

BRB_screen_0F:
    db #$28, "Super Castlevania IV (WIP)", #$FF

BRBTilemapAddress2:
    dw #BRB_screen2_01
    dw #BRB_screen2_02
    dw #BRB_screen2_03
    dw #BRB_screen2_04
    dw #BRB_screen2_05
    dw #BRB_screen2_06
    dw #BRB_screen2_07
    dw #BRB_screen2_08
    dw #BRB_screen2_09
    dw #BRB_screen2_0A
    dw #BRB_screen2_0B
    dw #BRB_screen2_0C
    dw #BRB_screen2_0D
    dw #BRB_screen2_0E
    dw #BRB_screen2_0F

BRB_screen2_01:
    db #$28, "  GTCdiscord.spazer.link", #$FF

BRB_screen2_02:
    db #$28, "  smpractice.speedga.me", #$FF

BRB_screen2_03:
    db #$28, "   controls.spazer.link", #$FF

BRB_screen2_04:
    db #$28, "   wiki.supermetroid.run", #$FF

BRB_screen2_05:
    db #$28, " YouTube.InsaneFirebat.net", #$FF

BRB_screen2_06:
    db #$28, "  Steam.InsaneFirebat.net", #$FF

BRB_screen2_07:
    db #$28, "    chain.spazer.link", #$FF

BRB_screen2_08:
    db #$28, "build of the practice hack", #$FF

BRB_screen2_09:
    db #$28, " I like to hack those too!", #$FF

BRB_screen2_0A:
    db #$28, " please feel free to ask!", #$FF

BRB_screen2_0B:
    db #$28, "   SRL.InsaneFirebat.net", #$FF

BRB_screen2_0C:
    db #$28, "  ALpractice.spazer.link", #$FF

BRB_screen2_0D:
    db #$28, "  LKpractice.spazer.link", #$FF

BRB_screen2_0E:
    db #$28, " GCMpractice.spazer.link", #$FF

BRB_screen2_0F:
    db #$28, " CV4practice.spazer.link", #$FF


; --------
; BRB Data
; --------

pushpc
org $B0F000
cm_brb_table:
; 1000h bytes transferred
incbin ../resources/gfx/cm_brb_gfx.bin
pullpc

org MenuResources

TimerNumberGFX1:
    dw #$2870, #$2870, #$2870, #$2870, #$2870, #$2870, #$2870, #$2870, #$2870, #$2870
    dw #$2871, #$2871, #$2871, #$2871, #$2871, #$2871, #$2871, #$2871, #$2871, #$2871
    dw #$2872, #$2872, #$2872, #$2872, #$2872, #$2872, #$2872, #$2872, #$2872, #$2872
    dw #$2873, #$2873, #$2873, #$2873, #$2873, #$2873, #$2873, #$2873, #$2873, #$2873
    dw #$2874, #$2874, #$2874, #$2874, #$2874, #$2874, #$2874, #$2874, #$2874, #$2874
    dw #$2875, #$2875, #$2875, #$2875, #$2875, #$2875, #$2875, #$2875, #$2875, #$2875

TimerNumberGFX2:
    dw #$2870, #$2871, #$2872, #$2873, #$2874, #$2875, #$2876, #$2877, #$2878, #$2879
    dw #$2870, #$2871, #$2872, #$2873, #$2874, #$2875, #$2876, #$2877, #$2878, #$2879
    dw #$2870, #$2871, #$2872, #$2873, #$2874, #$2875, #$2876, #$2877, #$2878, #$2879
    dw #$2870, #$2871, #$2872, #$2873, #$2874, #$2875, #$2876, #$2877, #$2878, #$2879
    dw #$2870, #$2871, #$2872, #$2873, #$2874, #$2875, #$2876, #$2877, #$2878, #$2879
    dw #$2870, #$2871, #$2872, #$2873, #$2874, #$2875, #$2876, #$2877, #$2878, #$2879


; ----------------
; Capture Cropping
; ----------------

cm_crop_mode:
{
    PHP : %a16() : %i8()

    ; turn on forced blank
    LDX #$80 : STX $2100
    
    ; fix BG3 scroll offset
    LDX #$FF : STX $2112
    LDX #$03 : STX $2112

    LDA #$0000 : STA !ram_crash_palette
    
    ; pattern or solid color?
    LDA !ram_crop_tile : BEQ .boxes
    LDA #$2891 : STA $C1
    BRA .draw

  .boxes
    LDA #$2890 : STA $C1
    
  .draw
    ; wait for lag frame
-   LDX !NMI_COUNTER : CPX !NMI_COUNTER : BEQ -

    ; draw around the border or fill the screen?
    LDA !ram_crop_mode : BNE .fill
    JSR cm_crop_border
    BRA .drawing_done

  .fill
    JSR cm_crop_fill

  .drawing_done
    ; turn off forced blank
    LDX #$0F : STX $2100

  .loop
    ; Make sure we don't read joysticks twice in the same frame
    ; wait for lag frame
-   LDX !NMI_COUNTER : CPX !NMI_COUNTER : BEQ -
    LDA !FRAME_COUNTER : CMP !ram_cm_input_counter : PHP
    STA !ram_cm_input_counter
    PLP : BNE +
    JSL $809459 ; Read controller input

+   LDA !IH_CONTROLLER_PRI_NEW : BEQ .loop
    CMP #$8000 : BEQ .end        ; B
    CMP #$0020 : BEQ .decPalette ; L
    CMP #$0010 : BEQ .incPalette ; R
    BRA .loop

  .decPalette
    LDA !ram_crash_palette : BNE +
    LDA #$0008
+   DEC : STA !ram_crash_palette
    JSL crash_cgram_transfer
    BRA .loop

  .incPalette
    LDA !ram_crash_palette : CMP #$0007 : BMI +
    LDA #$FFFF
+   INC : STA !ram_crash_palette
    JSL crash_cgram_transfer
    BRA .loop

  .end
    ; restore BG3 scroll offset
    LDA $BB
    %ai8()
    LDX #$80 : STX $2100
    STA $2112 : XBA : STA $2112
    LDX #$0F : STX $2100

    PLP
    RTL
}

cm_crop_border:
{
    ; top
    LDX #$80 : STX $2115
    LDA #$5800 : STA $2116
    LDA $C1 : LDX #$00
-   STA $2118
    INX : CPX #$20 : BNE -

    ; bottom
    LDX #$80 : STX $2115
    LDA #$5B60 : STA $2116
    LDA $C1 : LDX #$00
-   STA $2118
    INX : CPX #$40 : BNE -

    ; left
    LDX #$81 : STX $2115
    LDA #$5820 : STA $2116
    LDA $C1 : LDX #$00
-   STA $2118
    INX : CPX #$1D : BNE -

    ; right
    LDX #$81 : STX $2115
    LDA #$583F : STA $2116
    LDA $C1 : LDX #$00
-   STA $2118
    INX : CPX #$1D : BNE -

    RTS
}

cm_crop_fill:
{
    LDX #$80 : STX $2115
    LDA #$5800 : STA $2116
    PHP : %i16()
    LDA $C1 : LDX #$0400

-   STA $2118
    DEX : BPL -

    PLP
    RTS
}

print pc, " brb menu end"
pullpc
