pushpc
org $8EE600

cm_brb_loop:
{
    ; Initial setup
    %ai16()
    LDA $04 : PHA
    LDA $06 : PHA
    PHX : PHY

    LDA !ram_cm_brb_palette : PHA ; preserve menu palette
    CMP #$FFFF : BEQ + ; check if palette swapping disabled
    LDA #$0000 : STA !ram_cm_brb_palette
+   LDA #$0000 : STA !ram_cm_brb_screen
    STA !ram_cm_brb_frames : STA !ram_cm_brb_timer

    JSR cm_transfer_brb_tileset
    JSL wait_for_lag_frame_long ; Wait for lag frame
    JSL $808F0C ; Music queue
    JSL $8289EF ; Sound fx queue

  .loop
    ; [do entertaining stuff here]
    JSR cm_draw_brb

    ; [do loop stuff down here]

  .exit
    LDA !ram_cm_brb : BNE .check_input
    ; Exit brb loop
    LDA #$0000 : STA !ram_cm_leave
    PLA : STA !ram_cm_brb_palette ; restore menu palette
    LDA #$0046 : JSL !SFX_LIB2 ; lavaquake sfx
    JSL wait_for_lag_frame_long ; Wait for lag frame
    PLY : PLX
    PLA : STA $06
    PLA : STA $04
    RTL

  .check_input
    ; Make sure we don't read joysticks twice in the same frame
    LDA !FRAME_COUNTER : CMP !ram_cm_input_counter : PHP
    STA !ram_cm_input_counter
    PLP : BNE +
    JSL $809459 ; Read controller input

+   LDA !IH_CONTROLLER_PRI_NEW : BEQ .loop

    LDA #$0000 : STA !ram_cm_brb
    BRA .exit
}

cm_draw_brb:
{
    JSL cm_tilemap_bg_interior
    JSR cm_tilemap_brb
    JSL cm_tilemap_transfer_long
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
    CMP #$0008 : BMI +
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
    PHK : PHK : PLA : STA $06

    LDA.l #BRB_common_1 : STA $04
    LDX #$01C6
    JSR cm_draw_brb_text

    LDA.l #BRB_common_2 : STA $04
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
    LDA.l BRBTilemapAddress,X : STA $04
    LDX #$04C6
    JSR cm_draw_brb_text

    ; second cycled line
    LDA !ram_cm_brb_screen : ASL : TAX
    LDA.l BRBTilemapAddress2,X : STA $04
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
    LDA !ram_custompalette_menuborder : STA $7EC00A
    LDA !ram_custompalette_menuheaderoutline : STA $7EC012
    LDA !ram_custompalette_menutext : STA $7EC014
    LDA !ram_custompalette_menubackground : STA $7EC016 : STA $7EC00E
    LDA !ram_custompalette_menunumoutline : STA $7EC01A
    LDA !ram_custompalette_menunumfill : STA $7EC01C
    LDA !ram_custompalette_menutoggleon : STA $7EC032
    LDA !ram_custompalette_menuseltext : STA $7EC034
    LDA !ram_custompalette_menuseltextbg : STA $7EC036
    LDA !ram_custompalette_menunumseloutline : STA $7EC03A
    LDA !ram_custompalette_menunumsel : STA $7EC03C
    JSL transfer_cgram_long
    RTS
}

cm_draw_brb_text:
{
    ; X = pointer to tilemap area (STA !ram_tilemap_buffer,X)
    ; $04[0x3] = address
  %a8()
    LDY #$0000
    ; terminator
    LDA [$04],Y : INY : CMP #$FF : BEQ .end
    ; ORA with palette info
    ORA $0E : STA $0E

  .loop
    LDA [$04],Y : CMP #$FF : BEQ .end           ; terminator
    STA !ram_tilemap_buffer,X : INX             ; tile
    LDA $0E : STA !ram_tilemap_buffer,X : INX   ; palette
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
    LDA #$04 : STA $210C
    LDA #$80 : STA $2115 ; word-access, incr by 1
    LDX #$4000 : STX $2116 ; VRAM address (8000 in vram)
    LDX #cm_brb_table : STX $4302 ; Source offset
    LDA #cm_brb_table>>16 : STA $4304 ; Source bank
    LDX #$1000 : STX $4305 ; Size (0x10 = 1 tile)
    LDA #$01 : STA $4300 ; word, normal increment (DMA MODE)
    LDA #$18 : STA $4301 ; destination (VRAM write)
    LDA #$01 : STA $420B ; initiate DMA (channel 1)
    PLP
    RTS
}


; -------------
; BRB Text Data
; -------------

BRB_common_1:
    table ../resources/customfont.tbl
    db #$28, "      InsaneFirebat", #$FF
    table ../resources/normal.tbl

BRB_common_2:
    db #$28, "    Will Be Right Back", #$FF

BRBTilemapAddress:
    dw #BRB_screen_1
    dw #BRB_screen_2
    dw #BRB_screen_3
    dw #BRB_screen_4
    dw #BRB_screen_5
    dw #BRB_screen_6
    dw #BRB_screen_7
    dw #BRB_screen_8

BRB_screen_1:
    db #$28, "GT Classic Discord Server", #$FF

BRB_screen_2:
    db #$28, "GT Classic Tournament Info", #$FF

BRB_screen_3:
    db #$28, "Find the practice hack at", #$FF

BRB_screen_4:
    db #$28, "   SM Speedrunning Wiki", #$FF

BRB_screen_5:
    db #$28, "    My YouTube channel", #$FF

BRB_screen_6:
    db #$28, "     Find me on Steam", #$FF

BRB_screen_7:
    db #$28, " Crazy chain damage clips", #$FF

BRB_screen_8:
    db #$28, " My SRL race stats for SM", #$FF

BRBTilemapAddress2:
    dw #BRB_screen2_1
    dw #BRB_screen2_2
    dw #BRB_screen2_3
    dw #BRB_screen2_4
    dw #BRB_screen2_5
    dw #BRB_screen2_6
    dw #BRB_screen2_7
    dw #BRB_screen2_8

BRB_screen2_1:
    db #$28, "  GTCdiscord.spazer.link", #$FF

BRB_screen2_2:
    db #$28, "  GTCtourney.spazer.link", #$FF

BRB_screen2_3:
    db #$28, "  smpractice.speedga.me", #$FF

BRB_screen2_4:
    db #$28, "   wiki.supermetroid.run", #$FF

BRB_screen2_5:
    db #$28, " YouTube.InsaneFirebat.net", #$FF

BRB_screen2_6:
    db #$28, "  Steam.InsaneFirebat.net", #$FF

BRB_screen2_7:
    db #$28, "    chain.spazer.link", #$FF

BRB_screen2_8:
    db #$28, "   SRL.InsaneFirebat.net", #$FF


; --------
; BRB Data
; --------

org MenuResources

cm_brb_table:
    ; 1000h bytes transferred
    incbin ../resources/cm_brb_gfx.bin

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
-   LDX $05B8 : CPX $05B8 : BEQ -

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
-   LDX $05B8 : CPX $05B8 : BEQ -
    LDA !FRAME_COUNTER : CMP !ram_cm_input_counter : PHP
    STA !ram_cm_input_counter
    PLP : BNE +
    JSL $809459 ; Read controller input

+   LDA !IH_CONTROLLER_PRI_NEW : BEQ .loop
    CMP #$8000 : BEQ .exit       ; B
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

  .exit
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
