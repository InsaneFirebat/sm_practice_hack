
org $85FD00
print pc, " menu bank85 start"

wait_for_lag_frame_long:
    JSR $8136
    RTL

initialize_ppu_long:
    PHP : %a16()
    LDA $7E33EA : STA !ram_cgram_cache+$2E
    PLP
    JSR $8143
    RTL

restore_ppu_long:
    JSR $861A
    PHP : %a16()
    LDA !ram_cgram_cache+$2E : STA $7E33EA
    PLP
    RTL

play_music_long:
    JSR $8574
    RTL

maybe_trigger_pause_long:
    JSR $80FA
    RTL

print pc, " menu bank85 end"
warnpc $85FE00


org $89B000
print pc, " menu start"

cm_start:
{
    PHP : PHB
    PHX : PHY
    PHK : PLB

    ; Ensure sound is enabled when menu is open
    LDA !DISABLE_SOUNDS : PHA
    STZ !DISABLE_SOUNDS
    LDA !PB_EXPLOSION_STATUS : PHA
    STZ !PB_EXPLOSION_STATUS
    JSL $82BE17 ; Cancel sound effects

    JSR cm_init
    JSL cm_draw
    JSL play_music_long ; Play 2 lag frames of music and sound effects

    JSR cm_loop

    ; Restore sounds variables
    PLA : STA !PB_EXPLOSION_STATUS
    PLA : STA !DISABLE_SOUNDS
    ; Makes the game check Samus' health again, to see if we need annoying sound
    STZ !SAMUS_HEALTH_WARNING

    JSR cm_exit

    PLY : PLX
    PLB : PLP
    RTL
}

cm_init:
{
    ; Setup registers
    %a8()
    STZ $420C
    LDA #$80 : STA $802100 ; enable forced blanking
    LDA #$A1 : STA $4200 ; enable NMI, v-IRQ, and auto-joy read
    LDA #$09 : STA $2105 ; BG Mode 1, enable BG3 priority
    LDA #$0F : STA $0F2100 ; disable forced blanking
    %a16()

    JSL initialize_ppu_long
    JSL cm_transfer_custom_tileset
    JSL cm_transfer_custom_cgram

    ; Set up menu state
    LDA #$0000
    STA !ram_cm_stack_index : STA !ram_cm_cursor_stack
    STA !ram_cm_ctrl_mode : STA !ram_cm_ctrl_timer
    STA !ram_cm_leave : STA !ram_load_preset
    STA !IH_CONTROLLER_PRI_NEW : STA !IH_CONTROLLER_PRI

    LDA !FRAME_COUNTER : STA !ram_cm_input_counter
    LDA.w #MainMenu : STA !ram_cm_menu_stack
    LDA.w #MainMenu>>16 : STA !ram_cm_menu_bank

    JSL cm_calculate_max
    JSL cm_set_etanks_and_reserve
    RTS
}

cm_exit:
{
    JSL wait_for_lag_frame_long
    JSR cm_transfer_original_tileset
    JSL overwrite_HUD_numbers
    JSR cm_transfer_original_cgram

    ; Update HUD (in case we added missiles etc.)
    LDA !ram_gametime_room : STA $C1
    LDA !ram_last_gametime_room : STA $C3
    JSL $809A79
    LDA $C1 : STA !ram_gametime_room
    LDA $C3 : STA !ram_last_gametime_room
    LDA !ram_seed_X : STA !sram_seed_X
    LDA !ram_seed_Y : STA !sram_seed_Y
    JSL $809B44 ; Handle HUD tilemap
    JSL GameLoopExtras ; check if game_loop_extras needs to be disabled

    ; I think the above subroutines erases some of infohud, so we make sure we redraw it.
    JSL ih_update_hud_code

    JSL restore_ppu_long ; Restore PPU
    JSL $82BE2F ; Queue Samus movement sound effects
    JSL play_music_long ; Play 2 lag frames of music and sound effects
    JSL maybe_trigger_pause_long ; Maybe trigger pause screen or return save confirmation selection
    RTS
}

cm_set_etanks_and_reserve:
{
    LDA !SAMUS_HP_MAX : JSR cm_divide_100 : STA !ram_cm_etanks
    LDA !SAMUS_RESERVE_MAX : JSR cm_divide_100 : STA !ram_cm_reserve
    RTL
}


; ----------
; Drawing
; ----------

cm_transfer_custom_tileset:
{
    PHP : %ai16()

    ; Choose font
    LDA !sram_cm_font : BNE .font2
    LDA.w #cm_hud_table : STA $C1
    LDA.w #cm_hud_table>>16 : STA $C3
    BRA .room_check

  .font2
    LDA.w #cm_hud_table2 : STA $C1
    LDA.w #cm_hud_table2>>16 : STA $C3

  .room_check
    LDA !ROOM_ID : CMP #$A59F : BEQ .kraid_vram

    ; Load custom vram to normal location
    %a8()
    LDA #$80 : STA $802100 ; enable forced blanking
    LDA #$04 : STA $210C ; BG3 starts at $4000 (8000 in vram)
    LDA #$80 : STA $2115 ; word-access, incr by 1
    LDX #$4000 : STX $2116 ; VRAM address (8000 in vram)
    LDX $C1 : STX $4302 ; Source offset
    LDA $C3 : STA $4304 ; Source bank
    LDX #$1000 : STX $4305 ; Size (0x10 = 1 tile)
    LDA #$01 : STA $4300 ; word, normal increment (DMA MODE)
    LDA #$18 : STA $4301 ; destination (VRAM write)
    LDA #$01 : STA $420B ; initiate DMA (channel 1)
    LDA #$80 : STA $802100 ; enable forced blanking
    PLP
    RTL

  .kraid_vram
    ; Load custom vram to kraid location
    %a8()
    LDA #$80 : STA $802100 ; enable forced blanking
    LDA #$02 : STA $210C ; BG3 starts at $2000 (4000 in vram)
    LDA #$80 : STA $2115 ; word-access, incr by 1
    LDX #$2000 : STX $2116 ; VRAM address (4000 in vram)
    LDX $C1 : STX $4302 ; Source offset
    LDA $C3 : STA $4304 ; Source bank
    LDX #$0900 : STX $4305 ; Size (0x10 = 1 tile)
    LDA #$01 : STA $4300 ; word, normal increment (DMA MODE)
    LDA #$18 : STA $4301 ; destination (VRAM write)
    LDA #$01 : STA $420B ; initiate DMA (channel 1)
    LDA #$0F : STA $0F2100 ; disable forced blanking
    PLP
    RTL
}

cm_transfer_original_tileset:
{
    PHP : %a16()
    LDA !ROOM_ID : CMP #$A59F : BEQ .kraid_vram

    %a8()
    LDA !ram_minimap : CMP #$00 : BNE .minimap_vram

    ; Load in normal vram to normal location
    LDA #$80 : STA $802100 ; enable forced blanking
    LDA #$04 : STA $210C ; BG3 starts at $4000 (8000 in vram)
    LDA #$80 : STA $2115 ; word-access, incr by 1
    LDX #$4000 : STX $2116 ; VRAM address (8000 in vram)
    LDX.w #hudgfx_bin : STX $4302 ; Source offset
    LDA.b #hudgfx_bin>>16 : STA $4304 ; Source bank
    LDX #$1000 : STX $4305 ; Size (0x10 = 1 tile)
    LDA #$01 : STA $4300 ; word, normal increment (DMA MODE)
    LDA #$18 : STA $4301 ; destination (VRAM write)
    LDA #$01 : STA $420B ; initiate DMA (channel 1)
    LDA #$0F : STA $0F2100 ; disable forced blanking
    PLP
    RTS

  .kraid_vram
    ; Load in normal vram to kraid location
    %a8()
    LDA #$80 : STA $802100 ; enable forced blanking
    LDA #$02 : STA $210C ; BG3 starts at $2000 (4000 in vram)
    LDA #$80 : STA $2115 ; word-access, incr by 1
    LDX #$2000 : STX $2116 ; VRAM address (4000 in vram)
    LDX.w #hudgfx_bin : STX $4302 ; Source offset
    LDA.b #hudgfx_bin>>16 : STA $4304 ; Source bank
    LDX #$1000 : STX $4305 ; Size (0x10 = 1 tile)
    LDA #$01 : STA $4300 ; word, normal increment (DMA MODE)
    LDA #$18 : STA $4301 ; destination (VRAM write)
    LDA #$01 : STA $420B ; initiate DMA (channel 1)
    LDA #$0F : STA $0F2100 ; disable forced blanking
    PLP
    RTS

  .minimap_vram
    ; Load in minimap vram to normal location
    LDA #$80 : STA $802100 ; enable forced blanking
    LDA #$04 : STA $210C ; BG3 starts at $4000 (8000 in vram)
    LDA #$80 : STA $2115 ; word-access, incr by 1
    LDX #$4000 : STX $2116 ; VRAM address (8000 in vram)
    LDX.w #mapgfx_bin : STX $4302 ; Source offset
    LDA.b #mapgfx_bin>>16 : STA $4304 ; Source bank
    LDX #$1000 : STX $4305 ; Size (0x10 = 1 tile)
    LDA #$01 : STA $4300 ; word, normal increment (DMA MODE)
    LDA #$18 : STA $4301 ; destination (VRAM write)
    LDA #$01 : STA $420B ; initiate DMA (channel 1)
    LDA #$0F : STA $0F2100 ; disable forced blanking
    PLP
    RTS
}

cm_transfer_custom_cgram:
{
; $0A = Border & OFF   $7277
; $12 = Header         $48F3
; $1A = Num            $0000, $7FFF
; $32 = ON / Sel Num   $4376
; $34 = Selected item  $761F
; $3A = Sel Num        $0000, $761F
    %a16()
    ; backup gameplay palettes
    LDA $7EC00A : STA !ram_cgram_cache
    LDA $7EC00E : STA !ram_cgram_cache+2
    LDA $7EC012 : STA !ram_cgram_cache+4
    LDA $7EC014 : STA !ram_cgram_cache+6
    LDA $7EC016 : STA !ram_cgram_cache+8
    LDA $7EC01A : STA !ram_cgram_cache+10
    LDA $7EC01C : STA !ram_cgram_cache+12
    LDA $7EC032 : STA !ram_cgram_cache+14
    LDA $7EC034 : STA !ram_cgram_cache+16
    LDA $7EC036 : STA !ram_cgram_cache+18
    LDA $7EC03A : STA !ram_cgram_cache+20
    LDA $7EC03C : STA !ram_cgram_cache+22

    JSL PrepMenuPalette

    ; apply menu palettes
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
    %ai16()
    RTL
}

cm_transfer_original_cgram:
{
    PHP : %a16()
    ; restore gameplay palettes
    LDA !ram_cgram_cache : STA $7EC00A
    LDA !ram_cgram_cache+2 : STA $7EC00E
    LDA !ram_cgram_cache+4 : STA $7EC012
    LDA !ram_cgram_cache+6 : STA $7EC014
    LDA !ram_cgram_cache+8 : STA $7EC016
    LDA !ram_cgram_cache+10 : STA $7EC01A
    LDA !ram_cgram_cache+12 : STA $7EC01C
    LDA !ram_cgram_cache+14 : STA $7EC032
    LDA !ram_cgram_cache+16 : STA $7EC034
    LDA !ram_cgram_cache+18 : STA $7EC036
    LDA !ram_cgram_cache+20 : STA $7EC03A
    LDA !ram_cgram_cache+22 : STA $7EC03C

    JSL transfer_cgram_long
    PLP
    RTS
}

cm_refresh_cgram_long:
{
    JSR cm_transfer_original_cgram
    JSL cm_transfer_custom_cgram
    RTL
}

cm_draw:
{
    PHP
    %ai16()
    JSR cm_tilemap_bg
    JSR cm_tilemap_menu
    JSR cm_tilemap_transfer
    PLP
    RTL
}

cm_tilemap_bg:
{
    ; top left corner  = $042
    ; top right corner = $07C
    ; bot left corner  = $682
    ; bot right corner = $6BC
	; Empty out !ram_tilemap_buffer
    LDX #$07FE
    LDA #$000E
  .clearBG3
    STA !ram_tilemap_buffer,X
    DEX #2 : BPL .clearBG3

    ; Vertical edges
    LDX #$0000
    LDY #$0019 ; 25 rows
  .loopVertical
    LDA #$647A : STA !ram_tilemap_buffer+$082,X
    LDA #$247A : STA !ram_tilemap_buffer+$0BC,X
    TXA : CLC : ADC #$0040 : TAX
    DEY : BPL .loopVertical

    ; Horizontal edges
    LDX #$0000
    LDY #$001B ; 28 columns
  .loopHorizontal
    LDA #$A47B : STA !ram_tilemap_buffer+$044,X
    LDA #$247B : STA !ram_tilemap_buffer+$704,X
    INX #2
    DEY : BPL .loopHorizontal

    ; Interior
    ; background is optional
    LDA !sram_menu_background : BNE .fill_interior

    ; fill if paused
    LDA !GAMEMODE : CMP #$000C : BMI .check_ceres : BEQ .fill_interior
    CMP #$0012 : BMI .fill_interior

    ; fill if game over
    CMP #$001A : BEQ .fill_interior

    ; fill if Ceres
  .check_ceres
    LDA !AREA_ID : CMP #$0006 : BMI .done

  .fill_interior
    LDX #$0000
    LDY #$001B
    LDA !MENU_BLANK

  .interior_loop
;    STA !ram_tilemap_buffer+$004,X
    STA !ram_tilemap_buffer+$084,X
    STA !ram_tilemap_buffer+$0C4,X
    STA !ram_tilemap_buffer+$104,X
    STA !ram_tilemap_buffer+$144,X
    STA !ram_tilemap_buffer+$184,X
    STA !ram_tilemap_buffer+$1C4,X
    STA !ram_tilemap_buffer+$204,X
    STA !ram_tilemap_buffer+$244,X
    STA !ram_tilemap_buffer+$284,X
    STA !ram_tilemap_buffer+$2C4,X
    STA !ram_tilemap_buffer+$304,X
    STA !ram_tilemap_buffer+$344,X
    STA !ram_tilemap_buffer+$384,X
    STA !ram_tilemap_buffer+$3C4,X
    STA !ram_tilemap_buffer+$404,X
    STA !ram_tilemap_buffer+$444,X
    STA !ram_tilemap_buffer+$484,X
    STA !ram_tilemap_buffer+$4C4,X
    STA !ram_tilemap_buffer+$504,X
    STA !ram_tilemap_buffer+$544,X
    STA !ram_tilemap_buffer+$584,X
    STA !ram_tilemap_buffer+$5C4,X
    STA !ram_tilemap_buffer+$604,X
    STA !ram_tilemap_buffer+$644,X
    STA !ram_tilemap_buffer+$684,X
    STA !ram_tilemap_buffer+$6C4,X

    INX #2
    DEY : BPL .interior_loop

  .done
    RTS
}

cm_tilemap_menu:
{
; $00[0x4] = menu indices
; $04[0x4] = current menu item index
; $0E[0x2] = palette ORA for tilemap entry (for indicating selected menu)
    LDX !ram_cm_stack_index
    LDA !ram_cm_menu_stack,X : STA $00
    LDA !ram_cm_menu_bank : STA $02 : STA $06

    LDY #$0000 ; Y = menu item index
  .loop
    ; highlight if selected row
    TYA : CMP !ram_cm_cursor_stack,X : BEQ .selected
    LDA #$0000
    BRA .continue

  .selected
    LDA #$0010

  .continue
    ; later ORA'd with tile attributes
    STA $0E

    ; check for special entries (header/blank lines)
    LDA [$00],Y : BEQ .header
    CMP #$FFFF : BEQ .blank
    STA $04

    PHY : PHX

    ; X = action index (action type)
    LDA [$04] : TAX

    ; $04 points to data after the action type index
    INC $04 : INC $04

    ; draw menu item
    JSR (cm_draw_action_table,X)

    PLX : PLY

  .blank
    ; skip drawing blank lines
    INY #2
    BRA .loop

  .header
    STZ $0E
    ; menu pointer + index + 2 = header
    TYA : CLC : ADC $00 : INC #2 : STA $04
    ; draw menu header
    LDX #$00C6
    JSR cm_draw_text

    ; menu pointer + header pointer + 1 = footer
    TYA : CLC : ADC $04 : INC : STA $04
    LDA [$04] : CMP #$F007 : BNE .done

    ; INC past #$F007
    INC $04 : INC $04 : STZ $0E
    ; Optional footer
    LDX #$0686
    JSR cm_draw_text
    RTS

  .done
    ; no footer, back up two bytes
    DEC $04 : DEC $04
    RTS
}

cm_tilemap_transfer:
{
    JSL wait_for_lag_frame_long ; Wait for lag frame

    %a16()
    LDA #$5800 : STA $2116 ; VRAM addr
    LDA #$1801 : STA $4310 ; VRAM write
    LDA.w #!ram_tilemap_buffer : STA $4312 ; src addr
    LDA.w #!ram_tilemap_buffer>>16 : STA $4314 ; src bank
    LDA #$0800 : STA $4315 ; size
    STZ $4317 : STZ $4319 ; clear HDMA registers
    %a8()
    LDA #$80 : STA $2115 ; INC mode
    LDA #$02 : STA $420B ; enable DMA, channel 1
    JSL $808F0C ; handle music queue
    JSL $8289EF ; handle sfx
    %a16()
    RTS
}

cm_tilemap_transfer_long:
{
    JSR cm_tilemap_transfer
    RTL
}

cm_tilemap_bg_interior:
{
    JSR cm_tilemap_bg_fill_interior
    RTL
}

cm_draw_action_table:
{
    dw draw_toggle
    dw draw_toggle_bit
    dw draw_toggle_inverted
    dw draw_toggle_bit_inverted
    dw draw_numfield
    dw draw_numfield_hex
    dw draw_numfield_word
    dw draw_numfield_color
    dw draw_numfield_hex_word
    dw draw_numfield_sound
    dw draw_choice
    dw draw_ctrl_shortcut
    dw draw_controller_input
    dw draw_jsl
    dw draw_submenu

draw_toggle:
; $04[0x4] = current menu item index
; $08[0x4] = memory address to manipulate
; $0C[0x2] = toggle value
; $0E[0x2] = palette ORA for tilemap entry (for indicating selected menu)
{
    ; grab the memory address (long)
    LDA [$04] : INC $04 : INC $04 : STA $08
    LDA [$04] : INC $04 : STA $0A

    ; grab the toggle value
    LDA [$04] : AND #$00FF : INC $04 : STA $0C

    ; increment past JSL
    INC $04 : INC $04

    ; Draw the text
    %item_index_to_vram_index()
    PHX : JSR cm_draw_text : PLX

    ; Set position for ON/OFF
    TXA : CLC : ADC #$002E : TAX

    %a8()
    ; set palette
    LDA $0E
    STA !ram_tilemap_buffer+1,X
    STA !ram_tilemap_buffer+3,X
    STA !ram_tilemap_buffer+5,X

    ; grab the value at that memory address
    LDA [$08] : CMP $0C : BEQ .checked

    ; Off
    %a16()
    LDA #$244B : STA !ram_tilemap_buffer+0,X
    LDA #$244D : STA !ram_tilemap_buffer+2,X
    LDA #$244D : STA !ram_tilemap_buffer+4,X
    RTS

  .checked
    ; On
    %a16()
    LDA #$384B : STA !ram_tilemap_buffer+2,X
    LDA #$384C : STA !ram_tilemap_buffer+4,X
    RTS
}

draw_toggle_bit:
; $04[0x4] = current menu item index
; $08[0x4] = memory address to manipulate
; $0C[0x2] = bitmask
; $0E[0x2] = palette ORA for tilemap entry (for indicating selected menu)
{
    ; grab the memory address (long)
    LDA [$04] : INC $04 : INC $04 : STA $08
    LDA [$04] : INC $04 : STA $0A

    ; grab bitmask
    LDA [$04] : INC $04 : INC $04 : STA $0C

    ; increment past JSL
    INC $04 : INC $04

    ; Draw the text
    %item_index_to_vram_index()
    PHX : JSR cm_draw_text : PLX

    ; Set position for ON/OFF
    TXA : CLC : ADC #$002E : TAX

    ; grab the value at that memory address
    LDA [$08] : AND $0C : BNE .checked

    ; Off
    LDA #$244B : STA !ram_tilemap_buffer+0,X
    LDA #$244D : STA !ram_tilemap_buffer+2,X
    LDA #$244D : STA !ram_tilemap_buffer+4,X
    RTS

  .checked
    ; On
    %a16()
    LDA #$384B : STA !ram_tilemap_buffer+2,X
    LDA #$384C : STA !ram_tilemap_buffer+4,X
    RTS
}

draw_toggle_inverted:
; $04[0x4] = current menu item index
; $08[0x4] = memory address to manipulate
; $0C[0x2] = bitmask
; $0E[0x2] = palette ORA for tilemap entry (for indicating selected menu)
{
    ; grab the memory address (long)
    LDA [$04] : INC $04 : INC $04 : STA $08
    LDA [$04] : INC $04 : STA $0A

    ; grab the toggle value
    LDA [$04] : AND #$00FF : INC $04 : STA $0C

    ; increment past JSL
    INC $04 : INC $04

    ; Draw the text
    %item_index_to_vram_index()
    PHX : JSR cm_draw_text : PLX

    ; Set position for ON/OFF
    TXA : CLC : ADC #$002E : TAX

    %a8()
    ; set palette
    LDA $0E
    STA !ram_tilemap_buffer+1,X
    STA !ram_tilemap_buffer+3,X
    STA !ram_tilemap_buffer+5,X

    ; grab the value at that memory address
    LDA [$08] : CMP $0C : BNE .checked

    ; Off
    %a16()
    LDA #$244B : STA !ram_tilemap_buffer+0,X
    LDA #$244D : STA !ram_tilemap_buffer+2,X
    LDA #$244D : STA !ram_tilemap_buffer+4,X
    RTS

  .checked
    ; On
    %a16()
    LDA #$384B : STA !ram_tilemap_buffer+2,X
    LDA #$384C : STA !ram_tilemap_buffer+4,X
    RTS
}

draw_toggle_bit_inverted:
; $04[0x4] = current menu item index
; $08[0x4] = memory address to manipulate
; $0C[0x2] = bitmask
; $0E[0x2] = palette ORA for tilemap entry (for indicating selected menu)
{
    ; grab the memory address (long)
    LDA [$04] : INC $04 : INC $04 : STA $08
    LDA [$04] : INC $04 : STA $0A

    ; grab bitmask
    LDA [$04] : INC $04 : INC $04 : STA $0C

    ; increment past JSL
    INC $04 : INC $04

    ; Draw the text
    %item_index_to_vram_index()
    PHX : JSR cm_draw_text : PLX

    ; Set position for ON/OFF
    TXA : CLC : ADC #$002C : TAX

    ; grab the value at that memory address
    LDA [$08] : AND $0C : BEQ .checked

    ; Off
    LDA #$244B : STA !ram_tilemap_buffer+2,X
    LDA #$244D : STA !ram_tilemap_buffer+4,X
    LDA #$244D : STA !ram_tilemap_buffer+6,X
    RTS

  .checked
    ; On
    %a16()
    LDA #$384B : STA !ram_tilemap_buffer+4,X
    LDA #$384C : STA !ram_tilemap_buffer+6,X
    RTS
}

draw_numfield:
; $04[0x4] = current menu item index
; $08[0x4] = memory address to manipulate
; $0E[0x2] = palette ORA for tilemap entry (for indicating selected menu)
{
    ; grab the memory address (long)
    LDA [$04] : INC $04 : INC $04 : STA $08
    LDA [$04] : INC $04 : STA $0A

    ; skip bounds and increment values
    INC $04 : INC $04 : INC $04; : INC $04

    ; increment past JSL
    INC $04 : INC $04

    ; Draw the text
    %item_index_to_vram_index()
    PHX : JSR cm_draw_text : PLX

    ; set position for the number
    TXA : CLC : ADC #$002E : TAX

    ; convert value to decimal
    LDA [$08] : AND #$00FF : JSR cm_hex2dec

    ; Clear out the area
    LDA !MENU_BLANK : STA !ram_tilemap_buffer+0,X
                      STA !ram_tilemap_buffer+2,X
                      STA !ram_tilemap_buffer+4,X

    ; Set palette
    %a8()
    LDA #$24 : ORA $0E : STA $0F
    LDA #$70 : STA $0E ; number tiles are 70-79

    ; Draw numbers
    %a16()
    ; ones
    LDA !ram_hex2dec_third_digit : CLC : ADC $0E : STA !ram_tilemap_buffer+4,X
    ; tens
    LDA !ram_hex2dec_second_digit : ORA !ram_hex2dec_first_digit : BEQ .done
    LDA !ram_hex2dec_second_digit : CLC : ADC $0E : STA !ram_tilemap_buffer+2,X
    ; hundreds
    LDA !ram_hex2dec_first_digit : BEQ .done
    CLC : ADC $0E : STA !ram_tilemap_buffer,X

  .done
    RTS
}

draw_numfield_hex:
draw_numfield_sound:
; $04[0x4] = current menu item index
; $08[0x4] = memory address to manipulate
; $0E[0x2] = palette ORA for tilemap entry (for indicating selected menu)
; $C1[0x2] = value to draw
{
    ; grab the memory address (long)
    LDA [$04] : INC $04 : INC $04 : STA $08
    LDA [$04] : INC $04 : STA $0A

    ; skip bounds and increment values
    INC $04 : INC $04 : INC $04; : INC $04

    ; increment past JSL
    INC $04 : INC $04

    ; Draw the text
    %item_index_to_vram_index()
    PHX : JSR cm_draw_text : PLX

    ; set position for the number
    TXA : CLC : ADC #$0030 : TAX

    ; load the value
    LDA [$08] : AND #$00FF : STA $C1

    ; Clear out the area
    LDA !MENU_BLANK : STA !ram_tilemap_buffer+0,X
                      STA !ram_tilemap_buffer+2,X

    ; Draw numbers
    ; (00X0)
    LDA $C1 : AND #$00F0 : LSR #3 : TAY
    LDA.w HexMenuGFXTable,Y : STA !ram_tilemap_buffer,X
    ; (000X)
    LDA $C1 : AND #$000F : ASL : TAY
    LDA.w HexMenuGFXTable,Y : STA !ram_tilemap_buffer+2,X

    ; overwrite palette bytes
    %a8()
    LDA #$24 : ORA $0E
    STA !ram_tilemap_buffer+1,X : STA !ram_tilemap_buffer+3,X
    %a16()

    RTS
}

draw_numfield_word:
; $04[0x4] = current menu item index
; $08[0x4] = memory address to manipulate
; $0E[0x2] = palette ORA for tilemap entry (for indicating selected menu)
{
    ; grab the memory address (long)
    LDA [$04] : INC $04 : INC $04 : STA $08
    LDA [$04] : INC $04 : STA $0A

    ; skip bounds and increment values
    INC $04 : INC $04 : INC $04; : INC $04
    INC $04 : INC $04 : INC $04; : INC $04

    ; increment past JSL
    INC $04 : INC $04

    ; Draw the text
    %item_index_to_vram_index()
    PHX : JSR cm_draw_text : PLX

    ; set position for the number
    TXA : CLC : ADC #$002C : TAX

    ; convert value to decimal
    LDA [$08] : JSR cm_hex2dec

    ; Clear out the area (black tile)
    LDA !MENU_BLANK : STA !ram_tilemap_buffer+0,X
                      STA !ram_tilemap_buffer+2,X
                      STA !ram_tilemap_buffer+4,X
                      STA !ram_tilemap_buffer+6,X

    ; Set palette
    %a8()
    LDA #$24 : ORA $0E : STA $0F
    LDA #$70 : STA $0E ; number tiles are 70-79

    ; Draw numbers
    %a16()
    ; ones
    LDA !ram_hex2dec_third_digit : CLC : ADC $0E : STA !ram_tilemap_buffer+6,X
    ; tens
    LDA !ram_hex2dec_second_digit : ORA !ram_hex2dec_first_digit
    ORA !ram_hex2dec_rest : BEQ .done
    LDA !ram_hex2dec_second_digit : CLC : ADC $0E : STA !ram_tilemap_buffer+4,X
    ; hundreds
    LDA !ram_hex2dec_first_digit : ORA !ram_hex2dec_rest : BEQ .done
    LDA !ram_hex2dec_first_digit : CLC : ADC $0E : STA !ram_tilemap_buffer+2,X
    ; thousands
    LDA !ram_hex2dec_rest : BEQ .done
    CLC : ADC $0E : STA !ram_tilemap_buffer,X

  .done
    RTS
}

draw_numfield_hex_word:
; $04[0x4] = current menu item index
; $08[0x4] = memory address to manipulate
; $0E[0x2] = palette ORA for tilemap entry (for indicating selected menu)
; $C1[0x2] = value to draw
{
    ; grab the memory address (long)
    LDA [$04] : INC $04 : INC $04 : STA $08
    LDA [$04] : INC $04 : STA $0A

    ; Draw the text
    %item_index_to_vram_index()
    PHX : JSR cm_draw_text : PLX

    ; set position for the number
    TXA : CLC : ADC #$002C : TAX

    ; load the value
    LDA [$08] : STA $C1

    ; Clear out the area
    LDA !MENU_BLANK : STA !ram_tilemap_buffer+0,X
                      STA !ram_tilemap_buffer+2,X
                      STA !ram_tilemap_buffer+4,X
                      STA !ram_tilemap_buffer+6,X

    ; Draw numbers
    ; (X000)
    LDA $C1 : AND #$F000 : XBA : LSR #3 : TAY
    LDA.w HexMenuGFXTable,Y : STA !ram_tilemap_buffer,X
    ; (0X00)
    LDA $C1 : AND #$0F00 : XBA : ASL : TAY
    LDA.w HexMenuGFXTable,Y : STA !ram_tilemap_buffer+2,X
    ; (00X0)
    LDA $C1 : AND #$00F0 : LSR #3 : TAY
    LDA.w HexMenuGFXTable,Y : STA !ram_tilemap_buffer+4,X
    ; (000X)
    LDA $C1 : AND #$000F : ASL : TAY
    LDA.w HexMenuGFXTable,Y : STA !ram_tilemap_buffer+6,X

    ; overwrite palette bytes
    %a8()
    LDA #$24 : ORA $0E
    STA !ram_tilemap_buffer+1,X : STA !ram_tilemap_buffer+3,X
    STA !ram_tilemap_buffer+5,X : STA !ram_tilemap_buffer+7,X
    %a16()

  .done
    RTS
}

draw_numfield_color:
; Color values are increments of 8
; $04[0x4] = current menu item index
; $08[0x4] = memory address to manipulate
; $0E[0x2] = palette ORA for tilemap entry (for indicating selected menu)
; $C1[0x2] = value to draw
{
    ; grab the memory address (long)
    LDA [$04] : INC $04 : INC $04 : STA $08
    LDA [$04] : INC $04 : STA $0A

    ; increment past JSL
    INC $04 : INC $04

    ; Draw the text
    %item_index_to_vram_index()
    PHX : JSR cm_draw_text : PLX

    ; set position for the number
    TXA : CLC : ADC #$0030 : TAX

    ; load the value
    LDA [$08] : AND #$00FF : STA $C1

    ; Clear out the area
    LDA !MENU_BLANK : STA !ram_tilemap_buffer+0,X
                      STA !ram_tilemap_buffer+2,X

    ; Draw numbers
    ; (00X0)
    LDA $C1 : AND #$001E : TAY
    LDA.w HexMenuGFXTable,Y : STA !ram_tilemap_buffer,X
    ; (000X)
    LDA $C1 : AND #$0001 : ASL #4 : STA $C3
    LDA $C1 : AND #$001C : LSR : CLC : ADC $C3 : TAY
    LDA.w HexMenuGFXTable,Y : STA !ram_tilemap_buffer+2,X

    ; overwrite palette bytes
    %a8()
    LDA #$24 : ORA $0E
    STA !ram_tilemap_buffer+1,X : STA !ram_tilemap_buffer+3,X
    %a16()

  .done
    RTS
}

draw_choice:
; $04[0x4] = current menu item index
; $08[0x4] = memory address to manipulate
{
    ; $04[0x3] = address
    ; $08[0x3] = JSL target

    ; grab the memory address (long)
    LDA [$04] : INC $04 : INC $04 : STA $08
    LDA [$04] : INC $04 : STA $0A

    ; grab JSL target
    LDA [$04] : INC $04 : INC $04 : STA $0C

    ; Draw the text first
    %item_index_to_vram_index()
    PHX : JSR cm_draw_text : PLX

    ; set position for choice
    TXA : CLC : ADC #$001E : TAX

    ; grab the value at that memory address
    LDA [$08] : TAY

    ; find the correct text that should be drawn (the selected choice)
    ; skipping the first text that we already drew
    INY #2 ; uh, ..

  .loop_choices
    DEY : BEQ .found

  .loop_text
    LDA [$04] : %a16() : INC $04 : %a8()
    CMP #$FF : BEQ .loop_choices
    BRA .loop_text

  .found
    %a16()
    JSR cm_draw_text
    RTS
}

draw_ctrl_shortcut:
; $04[0x4] = current menu item index
; $08[0x4] = memory address to manipulate
{
    ; grab the memory address (long)
    LDA [$04] : INC $04 : INC $04 : STA $08
    LDA [$04] : INC $04 : STA $0A

    ; draw the text
    %item_index_to_vram_index()
    PHX
    JSR cm_draw_text

    ; set position of inputs
    PLA : CLC : ADC #$0022 : TAX

    ; draw the inputs
    LDA [$08]
    JSR menu_ctrl_input_display

    RTS
}

draw_controller_input:
; $04[0x4] = current menu item index
; $08[0x4] = memory address to manipulate
{
    ; grab the memory address (long)
    LDA [$04] : INC $04 : INC $04 : STA $08
    STA !ram_cm_ctrl_assign
    LDA [$04] : INC $04 : STA $0A

    ; skip JSL target + argument
    INC $04 : INC $04 : INC $04 : INC $04

    ; Draw the text
    %item_index_to_vram_index()
    PHX : JSR cm_draw_text : PLX

    ; set position for the input
    TXA : CLC : ADC #$0020 : TAX

    ; check if anything to draw
    LDA ($08) : AND #$E0F0 : BEQ .unbound

    ; determine which input to draw, using Y to refresh A
    TAY : AND !CTRL_A : BEQ + : LDY #$0000 : BRA .draw
+   TYA : AND !CTRL_B : BEQ + : LDY #$0002 : BRA .draw
+   TYA : AND !CTRL_X : BEQ + : LDY #$0004 : BRA .draw
+   TYA : AND !CTRL_Y : BEQ + : LDY #$0006 : BRA .draw
+   TYA : AND !CTRL_L : BEQ + : LDY #$0008 : BRA .draw
+   TYA : AND !CTRL_R : BEQ + : LDY #$000A : BRA .draw
+   TYA : AND !CTRL_SELECT : BEQ .unbound : LDY #$000C

  .draw
    LDA.w CtrlMenuGFXTable,Y : STA !ram_tilemap_buffer,X
    RTS

  .unbound
    LDA !MENU_BLANK : STA !ram_tilemap_buffer,X
    RTS

CtrlMenuGFXTable:
    ;    A      B      X      Y      L      R    Select
    ;  $0080  $8000  $0040  $4000  $0020  $0010  $2000
    dw $288F, $2887, $288E, $2886, $288D, $288C, $2885
}

draw_jsl:
draw_submenu:
; $04[0x4] = current menu item index
{
    ; skip JSL address
    INC $04 : INC $04

    ; skip argument
    INC $04 : INC $04

    ; draw text normally
    %item_index_to_vram_index()
    JSR cm_draw_text
    RTS
}

cm_draw_text:
; X = pointer to tilemap area (STA !ram_tilemap_buffer,X)
; $04[0x3] = pointer to address
; $0E[0x2] = palette ORA for tilemap entry (for indicating selected menu)
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
    INY : JMP .loop

  .end
    %a16()
    RTS


; --------------
; Input Display
; --------------

menu_ctrl_input_display:
; X = pointer to tilemap area (STA !ram_tilemap_buffer,X)
; A = Controller word
; $0E[0x2] = palette ORA for tilemap entry (for indicating selected menu)
{
    JSR menu_ctrl_clear_input_display

    XBA
    LDY #$0000
  .loop
    PHA
    BIT #$0001 : BEQ .no_draw

    TYA : CLC : ADC #$0080
    XBA : ORA $0E : XBA
    STA !ram_tilemap_buffer,X : INX #2

  .no_draw
    PLA
    INY : LSR : BNE .loop

  .done
    RTS
}


menu_ctrl_clear_input_display:
{
    ; X = pointer to tilemap area
    PHA
    LDA !MENU_BLANK
    STA !ram_tilemap_buffer+0,X
    STA !ram_tilemap_buffer+2,X
    STA !ram_tilemap_buffer+4,X
    STA !ram_tilemap_buffer+6,X
    STA !ram_tilemap_buffer+8,X
    STA !ram_tilemap_buffer+10,X
    STA !ram_tilemap_buffer+12,X
    STA !ram_tilemap_buffer+14,X
    STA !ram_tilemap_buffer+16,X
    PLA
    RTS
}


; ---------
; Logic
; ---------

cm_loop:
{
    %ai16()
    JSL wait_for_lag_frame_long  ; Wait for lag frame
    JSL $808F0C ; Music queue
    JSL $8289EF ; Sound fx queue
    JSL MenuRNG ; Let the RNG flow

    LDA !ram_cm_leave : BEQ .checkCtrlMode
    RTS ; Exit menu loop

  .checkCtrlMode
    LDA !ram_cm_ctrl_mode : BEQ .checkInputs
    JSR cm_ctrl_mode
    BRA cm_loop

  .checkInputs
    JSR cm_get_inputs : STA !ram_cm_controller : BEQ cm_loop

    BIT #$0080 : BEQ + : JMP .pressedA ; more wiggle room with branch limits...
+   BIT #$8000 : BEQ + : JMP .pressedB
;    BIT #$0040 : BNE .pressedX
+   BIT #$4000 : BNE .pressedY
    BIT #$2000 : BNE .pressedSelect
    BIT #$1000 : BNE .pressedStart
    BIT #$0800 : BNE .pressedUp
    BIT #$0400 : BNE .pressedDown
    BIT #$0100 : BNE .pressedRight
    BIT #$0200 : BNE .pressedLeft
    BIT #$0020 : BNE .pressedL
    BIT #$0010 : BNE .pressedR
    JMP cm_loop

  .pressedB
    JSL cm_previous_menu
    BRA .redraw

  .pressedDown
    LDA #$0002
    JSR cm_move
    BRA .redraw

  .pressedUp
    LDA #$FFFE
    JSR cm_move
    BRA .redraw

  .pressedL
    ; jump to top menu item
    LDX !ram_cm_stack_index
    LDA #$0000 : STA !ram_cm_cursor_stack,X
    %sfxmove()
    BRA .redraw

  .pressedR
    ; jump to bottom menu item
    LDX !ram_cm_stack_index
    LDA !ram_cm_cursor_max : DEC #2 : STA !ram_cm_cursor_stack,X
    %sfxmove()
    BRA .redraw

  .pressedA
;  .pressedX
  .pressedY
  .pressedLeft
  .pressedRight
    JSR cm_execute
    BRA .redraw

  .pressedStart
  .pressedSelect
    LDA #$0001 : STA !ram_cm_leave
    JMP cm_loop

  .redraw
    JSL cm_draw
    JMP cm_loop
}

cm_ctrl_mode:
{
    JSL $809459 ; Read controller input
    LDA !IH_CONTROLLER_PRI

    ; set palette
    %a8() : LDA #$28 : STA $0E : %a16()

    LDA !IH_CONTROLLER_PRI : BEQ .clear_and_draw
    CMP !ram_cm_ctrl_last_input : BNE .clear_and_draw

    ; Holding an input for more than one second
    LDA !ram_cm_ctrl_timer : INC : STA !ram_cm_ctrl_timer : CMP.w #0060 : BNE .next_frame

    LDA !IH_CONTROLLER_PRI : STA [$C5]
    JSL GameModeExtras
    %sfxstatue()
    BRA .exit

  .clear_and_draw
    STA !ram_cm_ctrl_last_input
    LDA #$0000 : STA !ram_cm_ctrl_timer

    ; Put text cursor in X
    LDX !ram_cm_stack_index
    LDA !ram_cm_cursor_stack,X : ASL #5 : CLC : ADC #$0168 : TAX

    ; Input display
    LDA !IH_CONTROLLER_PRI
    JSR menu_ctrl_input_display
    JSR cm_tilemap_transfer

  .next_frame
    RTS

  .exit
    LDA #$0000
    STA !ram_cm_ctrl_last_input
    STA !ram_cm_ctrl_mode
    STA !ram_cm_ctrl_timer
    JSL cm_draw
    RTS
}

cm_previous_menu:
{
    JSL cm_go_back
    JSL cm_calculate_max
    RTL
}

cm_go_back:
{
    ; make sure next time we go to a submenu, we start on the first line.
    LDX !ram_cm_stack_index
    LDA #$0000 : STA !ram_cm_cursor_stack,X

    ; make sure we dont set a negative number
    LDA !ram_cm_stack_index : DEC #2 : BPL .done

    ; leave menu
    LDA #$0001 : STA !ram_cm_leave

    LDA #$0000
  .done
    STA !ram_cm_stack_index
    LDA !ram_cm_stack_index : BNE .end
    ; Reset submenu bank when back at main menu
    LDA.w #MainMenu>>16 : STA !ram_cm_menu_bank

  .end
    %sfxgoback()
    RTL
}

cm_calculate_max:
{
    LDX !ram_cm_stack_index
    LDA !ram_cm_menu_stack,X : STA $00
    LDA !ram_cm_menu_bank : STA $02

    LDX #$0000
  .loop
    LDA [$00] : BEQ .done
    INC $00 : INC $00
    INX #2 ; count menu items in X
    BRA .loop

  .done
    ; store total menu items +2
    TXA : STA !ram_cm_cursor_max
    RTL
}

cm_get_inputs:
{
    ; Make sure we don't read joysticks twice in the same frame
    LDA !FRAME_COUNTER : CMP !ram_cm_input_counter : PHP : STA !ram_cm_input_counter : PLP : BNE +

    JSL $809459 ; Read controller input

+   LDA !IH_CONTROLLER_PRI_NEW : BEQ .check_holding

    ; Initial delay of $0E frames
    LDA #$000E : STA !ram_cm_input_timer

    ; Return the new input
    LDA !IH_CONTROLLER_PRI_NEW
    RTS

  .check_holding
    ; Check if we're holding the dpad
    LDA !IH_CONTROLLER_PRI : AND #$0F00 : BEQ .noinput

    ; Decrement delay timer and check if it's zero
    LDA !ram_cm_input_timer : DEC : STA !ram_cm_input_timer : BNE .noinput

    ; Set new delay to two frames and return the input we're holding
    LDA !sram_cm_scroll_delay : STA !ram_cm_input_timer
    LDA !IH_CONTROLLER_PRI : AND #$4F00 : ORA !IH_INPUT_HELD
    RTS

  .noinput
    LDA #$0000
    RTS
}

cm_move:
; $00[0x4] = menu indices
; $12[0x2] = INC/DEC value
{
    STA $12
    LDX !ram_cm_stack_index
    CLC : ADC !ram_cm_cursor_stack,X : BPL .positive
    LDA !ram_cm_cursor_max : DEC #2 : BRA .inBounds

  .positive
    CMP !ram_cm_cursor_max : BNE .inBounds
    LDA #$0000

  .inBounds
    STA !ram_cm_cursor_stack,X : TAY

    ; check for blank menu line ($FFFF)
    LDA [$00],Y : CMP #$FFFF : BNE .end

    ; repeat move to skip blank line
    LDA $12 : BRA cm_move

  .end
    %sfxmove()
    RTS
}


; --------
; Execute
; --------

cm_execute:
; $00[0x4] = menu indices
{
    LDX !ram_cm_stack_index
    LDA !ram_cm_menu_stack,X : STA $00
    LDA !ram_cm_menu_bank : STA $02
    LDA !ram_cm_cursor_stack,X : TAY
    LDA [$00],Y : STA $00

    ; Increment past the action index
    LDA [$00] : INC $00 : INC $00 : TAX

    ; Safety net incase blank line selected
    CPX #$FFFF : BEQ +

    ; Execute action
    JSR (cm_execute_action_table,X)
+   RTS
}

cm_execute_action_table:
    dw execute_toggle
    dw execute_toggle_bit
    dw execute_toggle ; inverted
    dw execute_toggle_bit ; inverted
    dw execute_numfield
    dw execute_numfield_hex
    dw execute_numfield_word
    dw execute_numfield_hex_word
    dw execute_numfield_color
    dw execute_numfield_sound
    dw execute_choice
    dw execute_ctrl_shortcut
    dw execute_controller_input
    dw execute_jsl
    dw execute_submenu

execute_toggle:
; $00[0x4] = menu indices
; $04[0x4] = memory address to manipulate
; $08[0x2] = toggle value
; $0A[0x4] = JSL target
{
    ; Grab address (long)
    LDA [$00] : INC $00 : INC $00 : STA $04
    LDA [$00] : INC $00 : STA $06

    ; Grab toggle value
    LDA [$00] : INC $00 : AND #$00FF : STA $08

    ; Grab JSL target
    LDA [$00] : INC $00 : INC $00 : STA $0A

    %a8()
    LDA [$04] : CMP $08 : BEQ .toggleOff
    ; toggle on
    LDA $08 : STA [$04]
    BRA .jsl

  .toggleOff
    LDA #$00 : STA [$04]

  .jsl
    %a16()
    ; skip if JSL target is zero
    LDA $0A : BEQ .end

    ; Set return address for indirect JSL
    LDA !ram_cm_menu_bank : STA $0C
    PHK : PEA .end-1

    ; addr in A
    LDA [$04] : LDX #$0000
    JML [$000A]

  .end
    %ai16()
    %sfxtoggle()
    RTS
}

execute_toggle_bit:
; $00[0x4] = menu indices
; $04[0x4] = memory address to manipulate
; $08[0x2] = toggle value
; $0A[0x4] = JSL target
{
    ; Load the address
    LDA [$00] : INC $00 : INC $00 : STA $04
    LDA [$00] : INC $00 : STA $06

    ; Load which bit(s) to toggle
    LDA [$00] : INC $00 : INC $00 : STA $08

    ; Load JSL target
    LDA [$00] : INC $00 : INC $00 : STA $0A

    ; Toggle the bit
    LDA [$04] : EOR $08 : STA [$04]

    ; skip if JSL target is zero
    LDA $0A : BEQ .end

    ; Set return address for indirect JSL
    LDA !ram_cm_menu_bank : STA $0C
    PHK : PEA .end-1

    ; addr in A
    LDA [$04] : LDX #$0000
    JML [$000A]

 .end
    %ai16()
    %sfxtoggle()
    RTS
}

execute_numfield:
execute_numfield_hex:
; $00[0x4] = menu indices
; $04[0x4] = memory address to manipulate
; $08[0x2] = min
; $0A[0x2] = max
; $0C[0x2] = increment
; $20[0x4] = JSL target
{
    ; grab the memory address (long)
    LDA [$00] : INC $00 : INC $00 : STA $04
    LDA [$00] : INC $00 : STA $06

    ; grab minimum ($08) and maximum ($0A) values
    LDA [$00] : INC $00 : AND #$00FF : STA $08
    LDA [$00] : INC $00 : AND #$00FF : INC : STA $0A ; INC for convenience

    ; grab normal increment
    LDA [$00] : INC $00 : AND #$00FF : STA $0C

    ; check if fast scroll button is held
    LDA !IH_CONTROLLER_PRI : AND !sram_cm_scroll_button : BEQ .load_jsl_target
    ; 4x scroll speed if held
    LDA $0C : ASL #2 : STA $0C

; "hold dpad to fast-scroll" is disabled here
;    ; check for held inputs
;    LDA !ram_cm_controller : BIT !IH_INPUT_HELD : BNE .input_held
;    ; grab normal increment and skip past both
;    LDA [$00] : INC $00 : INC $00; : AND #$00FF : STA $0C
;    BRA .load_jsl_target

;  .input_held
;    ; grab faster increment and skip past both
;    INC $00 : LDA [$00] : INC $00 : AND #$00FF : STA $0C

  .load_jsl_target
    LDA [$00] : INC $00 : INC $00 : STA $20

    ; determine dpad direction
    LDA !ram_cm_controller : BIT #$0200 : BNE .pressed_left
    ; pressed right, inc
    LDA [$04] : CLC : ADC $0C
    CMP $0A : BCS .set_to_min
    %a8() : STA [$04] : BRA .jsl

  .pressed_left ; dec
    LDA [$04] : SEC : SBC $0C : BMI .set_to_max
    CMP $0A : BCS .set_to_max
    %a8() : STA [$04] : BRA .jsl

  .set_to_min
    LDA $08 : %a8() : STA [$04] : BRA .jsl

  .set_to_max
    LDA $0A : DEC : %a8() : STA [$04]

  .jsl
    %a16()
    ; skip if JSL target is zero
    LDA $20 : BEQ .end

    ; Set return address for indirect JSL
    LDA !ram_cm_menu_bank : STA $22
    PHK : PEA .end-1

    ; addr in A
    LDA [$04] : LDX #$0000
    JML [$0020]

  .end
    %ai16()
    %sfxnumber()
    RTS
}

execute_numfield_word:
; $00[0x4] = menu indices
; $04[0x4] = memory address to manipulate
; $08[0x2] = min
; $0A[0x2] = max
; $0C[0x2] = increment
; $20[0x4] = JSL target
{
    ; grab the memory address (long)
    LDA [$00] : INC $00 : INC $00 : STA $04
    LDA [$00] : INC $00 : STA $06

    ; grab minimum ($08) and maximum ($0A) values
    LDA [$00] : INC $00 : INC $00 : STA $08
    LDA [$00] : INC $00 : INC $00 : INC : STA $0A ; INC for convenience

    ; grab normal increment
    LDA [$00] : INC $00 : INC $00 : STA $0C

    ; check if fast scroll button is held
    LDA !IH_CONTROLLER_PRI : AND !sram_cm_scroll_button : BEQ +
    ; 4x scroll speed if held
    LDA $0C : ASL #2 : STA $0C

; "hold dpad to fast-scroll" is disabled here
;    ; check for held inputs
;    LDA !ram_cm_controller : BIT !IH_INPUT_HELD : BNE .input_held
;    ; grab normal increment and skip past both
;    LDA [$00] : INC $00 : INC $00; : AND #$00FF : STA $0C
;    BRA .load_jsl_target

;  .input_held
;    ; grab faster increment and skip past both
;    INC $00 : LDA [$00] : INC $00 : AND #$00FF : STA $0C

  .load_jsl_target
+   LDA [$00] : INC $00 : INC $00 : STA $20

    ; determine dpad direction
    LDA !ram_cm_controller : BIT #$0200 : BNE .pressed_left
    ; pressed right, inc
    LDA [$04] : CLC : ADC $0C
    CMP $0A : BCS .set_to_min
    STA [$04] : BRA .jsl

  .pressed_left ; dec
    LDA [$04] : SEC : SBC $0C
    CMP $08 : BMI .set_to_max
    CMP $0A : BCS .set_to_max
    STA [$04] : BRA .jsl

  .set_to_min
    LDA $08 : STA [$04] : CLC : BRA .jsl

  .set_to_max
    LDA $0A : DEC : STA [$04]

  .jsl
    ; skip if JSL target is zero
    LDA $20 : BEQ .end

    ; Set return address for indirect JSL
    LDA !ram_cm_menu_bank : STA $22
    PHK : PEA .end-1

    ; addr in A
    LDA [$04] : LDX #$0000
    JML [$0020]

  .end
    %ai16()
    %sfxnumber()
    RTS
}

execute_numfield_hex_word:
{
    ; do nothing
    RTS
}

execute_numfield_color:
; $00[0x4] = menu indices
; $04[0x4] = memory address to manipulate
; $08[0x2] = min
; $0A[0x2] = max
; $0C[0x2] = increment
; $20[0x4] = JSL target
{
    ; grab the memory address (long)
    LDA [$00] : INC $00 : INC $00 : STA $04
    LDA [$00] : INC $00 : STA $06

    ; grab normal increment
    LDA [$00] : INC $00 : INC $00 : STA $20

    ; determine dpad direction
    LDA !ram_cm_controller : BIT #$0200 : BNE .pressed_left
    ; pressed right, inc
    LDA [$04] : INC : CMP #$0020 : BCS .set_to_min
    STA [$04] : LDA !ram_cm_controller : BIT !IH_INPUT_LEFT : BEQ .jsl

    LDA [$04] : INC : CMP #$0020 : BCS .set_to_min
    STA [$04] : BRA .jsl

  .pressed_left ; dec
    LDA [$04] : DEC : BMI .set_to_max
    STA [$04] : LDA !ram_cm_controller : BIT !IH_INPUT_LEFT : BEQ .jsl

    LDA [$04] : DEC : BMI .set_to_max
    STA [$04] : BRA .jsl

  .set_to_min
    LDA #$0000 : STA [$04] : CLC : BRA .jsl

  .set_to_max
    LDA #$001F : STA [$04] : CLC

  .jsl
    ; skip if JSL target is zero
    LDA $20 : BEQ .end

    ; Set return address for indirect JSL
    LDA !ram_cm_menu_bank : STA $22
    PHK : PEA .end-1

    ; addr in A
    LDA [$04] : LDX #$0000
    JML [$0020]

  .end
    %ai16()
    %sfxnumber()
    RTS
}

execute_numfield_sound:
; $04[0x3] = memory address to manipulate
; $08[0x1] = min
; $0A[0x1] = max
; $0C[0x1] = increment
; $20[0x2] = JSL target
{
    ; grab the memory address (long)
    LDA [$00] : INC $00 : INC $00 : STA $04
    LDA [$00] : INC $00 : STA $06

    ; grab minimum ($08) and maximum ($0A) values
    LDA [$00] : INC $00 : AND #$00FF : STA $08
    LDA [$00] : INC $00 : AND #$00FF : INC : STA $0A ; INC for convenience

    ; grab normal increment
    LDA [$00] : INC $00 : AND #$00FF : STA $0C

    ; check if fast scroll button is held
    LDA !IH_CONTROLLER_PRI : AND !sram_cm_scroll_button : BEQ .load_jsl_target
    ; 4x scroll speed if held
    LDA $0C : ASL #2 : STA $0C

  .load_jsl_target
    LDA [$00] : INC $00 : INC $00 : STA $20

    ; check for Y pressed
    LDA !ram_cm_controller : BIT #$4000 : BNE .jsl

    ; determine dpad direction
    LDA !ram_cm_controller : BIT #$0200 : BNE .pressed_left
    ; pressed right, inc
    LDA [$04] : CLC : ADC $0C
    CMP $0A : BCS .set_to_min
    %a8() : STA [$04] : BRA .jsl

  .pressed_left ; dec
    LDA [$04] : SEC : SBC $0C
    CMP $08 : BMI .set_to_max
    CMP $0A : BCS .set_to_max
    %a8() : STA [$04] : BRA .jsl

  .set_to_min
    LDA $08 : STA [$04] : BRA .end

  .set_to_max
    LDA $0A : DEC : STA [$04] : BRA .end

  .jsl
    %ai16()
    ; skip if JSL target is zero
    LDA $20 : BEQ .end

    ; Set return address for indirect JSL
    LDA !ram_cm_menu_bank : STA $22
    PHK : PEA .end-1

    ; addr in A
    LDA [$04] : LDX #$0000
    JML [$0020]

  .end
    %ai16()
    RTS
}

execute_choice:
; $00[0x4] = menu indices
; $04[0x4] = memory address to manipulate
; $08[0x4] = JSL target
{
    ; grab the memory address (long)
    LDA [$00] : INC $00 : INC $00 : STA $04
    LDA [$00] : INC $00 : STA $06

    LDA [$00] : INC $00 : INC $00 : STA $08

    ; we either increment or decrement
    LDA !ram_cm_controller : BIT #$0200 : BNE .pressed_left
    ; pressed right
    LDA [$04] : INC : BRA .bounds_check

  .pressed_left
    LDA [$04] : DEC

  .bounds_check
    TAX         ; X = new value
    LDY #$0000  ; Y will be set to max
    %a8()

  .loop_choices
    LDA [$00] : %a16() : INC $00 : %a8() : CMP #$FF : BEQ .loop_done

  .loop_text
    LDA [$00] : %a16() : INC $00 : %a8()
    CMP #$FF : BNE .loop_text
    INY : BRA .loop_choices

  .loop_done
    ; Y = maximum + 2
    ; for convenience so we can use BCS. We do one more DEC in `.set_to_max`
    ; below, so we get the actual max.
    DEY

    %a16()
    ; X = new value (might be out of bounds)
    TXA : BMI .set_to_max
    STY $0A
    CMP $0A : BCS .set_to_zero

    BRA .store

  .set_to_zero
    LDA #$0000 : BRA .store

  .set_to_max
    TYA : DEC

  .store
    STA [$04]

    ; skip if JSL target is zero
    LDA $08 : BEQ .end

    ; Set return address for indirect JSL
    LDA !ram_cm_menu_bank : STA $0A
    PHK : PEA .end-1

    ; addr in A
    LDA [$04] : LDX #$0000
    JML [$0008]

  .end
    %ai16()
    %sfxtoggle()
    RTS
}

execute_ctrl_shortcut:
; $00[0x4] = menu indices
; $08[0x4] = JSL target
; $C5[0x4] = memory to manipulate
{
    ; < and > should do nothing here
    ; also ignore the input held flag
    LDA !ram_cm_controller : BIT #$0301 : BNE .end

    ; grab memory address (long)
    LDA [$00] : INC $00 : INC $00 : STA $C5
    LDA [$00] : INC $00 : STA $C7

    ; press X to delete a shortcut
    LDA !ram_cm_controller : BIT #$0040 : BNE .reset_shortcut

    ; enable ctrl mode to edit shortcuts
    LDA #$0001 : STA !ram_cm_ctrl_mode
    LDA #$0000 : STA !ram_cm_ctrl_timer
    RTS

  .reset_shortcut
    LDA.w #!sram_ctrl_menu : CMP $C5 : BEQ .end
    %sfxconfirm()

    LDA #$0000 : STA [$C5]

  .end
    RTS
}

execute_controller_input:
; $00[0x4] = menu indices
; $04[0x4] = JSL target
{
    ; <, > and X should do nothing here
    ; also ignore input held flag
    LDA !ram_cm_controller : BIT #$0341 : BNE .end

    ; store long address as short address for now
    LDA [$00] : INC $00 : INC $00 : INC $00
    STA !ram_cm_ctrl_assign

    ; $04 = JSL target
    LDA [$00] : INC $00 : INC $00 : STA $04

    ; Use bank of action_submenu
    ; instead of new menu's bank
    LDA.l #action_submenu>>16 : STA $06

    ; Set return address for indirect JSL
    PHK : PEA .end-1

    ; Y = Argument
    LDA [$00] : TAY

    LDX #$0000
    JML [$0004]

  .end
    %ai16()
    RTS
}

execute_jsl:
; $00[0x4] = menu indices
; $04[0x4] = JSL target
{
    ; <, > and X should do nothing here
    ; also ignore input held flag
    LDA !ram_cm_controller : BIT #$0341 : BNE .end

    ; $04 = JSL target
    LDA [$00] : INC $00 : INC $00 : STA $04

    ; Set return address for indirect JSL
    LDA !ram_cm_menu_bank : STA $06
    PHK : PEA .end-1

    ; Y = Argument
    LDA [$00] : TAY

    LDX #$0000
    JML [$0004]

  .end
    %ai16()
    RTS
}

execute_submenu:
; $00[0x4] = menu indices
; $04[0x4] = JSL target
{
    ; <, > and X should do nothing here
    ; also ignore input held flag
    LDA !ram_cm_controller : BIT #$0341 : BNE .end

    ; $04 = JSL target
    LDA [$00] : INC $00 : INC $00 : STA $04

    ; Set bank of action_submenu
    ; instead of the new menu's bank
    LDA.w #action_submenu>>16 : STA $06

    ; Set return address for indirect JSL
    PHK : PEA .end-1

    ; Y = Argument
    LDA [$00] : TAY

    LDX #$0000
    JML [$0004]

  .end
    %ai16()
    RTS
}

cm_hex2dec:
{
    ; store 16-bit dividend
    STA $4204

    %a8()
    ; divide by 100
    LDA #$64 : STA $4206

    %a16()
    PEA $0000 : PLA ; wait for math

    ; store result and use remainder as new dividend
    LDA $4214 : STA !ram_hex2dec_rest
    LDA $4216 : STA $4204

    %a8()
    ; divide by 10
    LDA #$0A : STA $4206

    %a16()
    PEA $0000 : PLA ; wait for math

    ; store result and remainder, divide the rest
    LDA $4214 : STA !ram_hex2dec_second_digit
    LDA $4216 : STA !ram_hex2dec_third_digit
    LDA !ram_hex2dec_rest : STA $4204

    %a8()
    ; divide by 10
    LDA #$0A : STA $4206

    %a16()
    PEA $0000 : PLA ; wait for math

    ; store result and remainder
    LDA $4214 : STA !ram_hex2dec_rest
    LDA $4216 : STA !ram_hex2dec_first_digit

    RTS
}

cm_divide_100:
{
    STA $4204
    %a8()
    ; divide by 100
    LDA #$64 : STA $4206
    %a16()
    PEA $0000 : PLA ; wait for math
    ; 16-bit result
    LDA $4214
    RTS
}


; -------------
; Crash handler
; -------------

incsrc crash.asm


; ----------
; Resources
; ----------

cm_hud_table:
    ; 1000h bytes
    incbin ../resources/cm_gfx.bin

HexMenuGFXTable:
    dw $2C70, $2C71, $2C72, $2C73, $2C74, $2C75, $2C76, $2C77, $2C78, $2C79, $2C50, $2C51, $2C52, $2C53, $2C54, $2C55

DecMenuGFXTable:
    dw $2C20, $2C21, $2C22, $2C23, $2C24, $2C25, $2C26, $2C27, $2C28, $2C29

MenuResources:
; for BRBmenu.asm

print pc, " menu end"


org $FF8000
cm_hud_table2:
    ; 1000h bytes
    incbin ../resources/cm_gfx2.bin


; -----------
; Main menu
; -----------

org $B88000
print pc, " mainmenu start"
incsrc mainmenu.asm
print pc, " mainmenu end"
