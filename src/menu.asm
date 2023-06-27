
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
    PHP
    PHB : PHK : PLB

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

    ; Preserve timers while menu is active
    LDA !ram_realtime_room : STA !ram_cm_preserved_timers
    LDA !ram_seg_rt_frames : STA !ram_cm_preserved_timers+2
    LDA !ram_seg_rt_seconds : STA !ram_cm_preserved_timers+4
    LDA !ram_seg_rt_minutes : STA !ram_cm_preserved_timers+6

    ; Preserve and disable slowdown mode
    LDA #$0000 : STA !ram_cm_slowdown_mode : STA !ram_slowdown_frames
    LDA !ram_slowdown_mode : BMI .paused
    STA !ram_cm_slowdown_frames
    LDA !ram_slowdown_mode : BEQ .done_slowdown
    LDA #$0002 : STA !ram_cm_slowdown_mode
    BRA .done_slowdown
  .paused
    LDA #$0001 : STA !ram_cm_slowdown_mode
  .done_slowdown
    LDA #$0000 : STA !ram_slowdown_mode

    JSL initialize_ppu_long
    JSL cm_transfer_custom_tileset
    JSL cm_transfer_custom_cgram

    ; Set up menu state
    LDA #$0000
    STA !ram_cm_stack_index : STA !ram_cm_cursor_stack
    STA !ram_cm_horizontal_cursor
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
    JSL cm_transfer_original_tileset
if !FEATURE_VANILLAHUD
else
    JSL overwrite_HUD_numbers
endif
    JSL cm_transfer_original_cgram

    ; Update HUD (in case we added missiles etc.)
    LDA !ram_gametime_room : STA $C1
    LDA !ram_last_gametime_room : STA $C3
    JSL $809A79 ; Initialise HUD
    LDA $C1 : STA !ram_gametime_room
    LDA $C3 : STA !ram_last_gametime_room
    LDA !ram_seed_X : STA !sram_seed_X
    LDA !ram_seed_Y : STA !sram_seed_Y
    JSL $809B44 ; Handle HUD tilemap
    JSL GameLoopExtras ; check if game_loop_extras needs to be disabled

if !FEATURE_VANILLAHUD
else
    ; I think the above subroutines erases some of infohud, so we make sure we redraw it.
    JSL ih_update_hud_code
endif

    JSL restore_ppu_long ; Restore PPU

    ; skip sound effects if not gameplay ($7-13 allowed)
    %ai16()
    LDA !GAMEMODE : CMP #$0006 : BMI .skipSFX
    CMP #$0014 : BPL .skipSFX
    JSL $82BE2F ; Queue Samus movement sound effects

  .skipSFX
    JSL play_music_long ; Play 2 lag frames of music and sound effects
    JSL maybe_trigger_pause_long ; Maybe trigger pause screen or return save confirmation selection

    ; Restore timers and subtract for skipping a frame of gameplay
    LDA !ram_cm_preserved_timers : STA !ram_realtime_room
    LDA !ram_cm_preserved_timers+2 : STA !ram_seg_rt_frames
    LDA !ram_cm_preserved_timers+4 : STA !ram_seg_rt_seconds
    LDA !ram_cm_preserved_timers+6 : STA !ram_seg_rt_minutes

    ; Restore slowdown mode
    LDA !ram_cm_slowdown_mode : BEQ .done_slowdown
    DEC : BEQ .paused
    LDA !ram_cm_slowdown_frames : BRA .done_slowdown
  .paused
    JSL EnsureSamusIsDrawn_long
    LDA #$FFFF
  .done_slowdown
    STA !ram_slowdown_mode
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
    LDA #$0F : STA $0F2100 ; enable forced blanking
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
    PHP : %ai16()
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
    RTL

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
    RTL

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
    RTL
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
    LDA $7EC00E : STA !ram_cgram_cache+$02
    LDA $7EC012 : STA !ram_cgram_cache+$04
    LDA $7EC014 : STA !ram_cgram_cache+$06
    LDA $7EC016 : STA !ram_cgram_cache+$08
    LDA $7EC01A : STA !ram_cgram_cache+$0A
    LDA $7EC01C : STA !ram_cgram_cache+$0C
    LDA $7EC01E : STA !ram_cgram_cache+$0E
    LDA $7EC032 : STA !ram_cgram_cache+$10
    LDA $7EC034 : STA !ram_cgram_cache+$12
    LDA $7EC036 : STA !ram_cgram_cache+$14
    LDA $7EC03A : STA !ram_cgram_cache+$16
    LDA $7EC03C : STA !ram_cgram_cache+$18
    LDA $7EC03E : STA !ram_cgram_cache+$1A

    JSL PrepMenuPalette

    ; apply menu palettes
    LDA #$0000 : STA $7EC000
    LDA !ram_palette_border : STA $7EC00A
    LDA !ram_palette_headeroutline : STA $7EC012
    LDA !ram_palette_text : STA $7EC014
    LDA !ram_palette_background : STA $7EC016 : STA $7EC00E : STA $7EC01E
    LDA !ram_palette_numoutline : STA $7EC01A
    LDA !ram_palette_numfill : STA $7EC01C
    LDA !ram_palette_toggleon : STA $7EC032
    LDA !ram_palette_seltext : STA $7EC034
    LDA !ram_palette_seltextbg : STA $7EC036 : STA $7EC03E
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
    LDA !ram_cgram_cache+$02 : STA $7EC00E
    LDA !ram_cgram_cache+$04 : STA $7EC012
    LDA !ram_cgram_cache+$06 : STA $7EC014
    LDA !ram_cgram_cache+$08 : STA $7EC016
    LDA !ram_cgram_cache+$0A : STA $7EC01A
    LDA !ram_cgram_cache+$0C : STA $7EC01C
    LDA !ram_cgram_cache+$0E : STA $7EC01E
    LDA !ram_cgram_cache+$10 : STA $7EC032
    LDA !ram_cgram_cache+$12 : STA $7EC034
    LDA !ram_cgram_cache+$14 : STA $7EC036
    LDA !ram_cgram_cache+$16 : STA $7EC03A
    LDA !ram_cgram_cache+$18 : STA $7EC03C
    LDA !ram_cgram_cache+$1A : STA $7EC03E

    JSL transfer_cgram_long
    PLP
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
    LDA !MENU_CLEAR
  .loopClearBG3
    STA !ram_tilemap_buffer,X
    DEX #2 : BPL .loopClearBG3

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

    ; fill if paused, $C-11
    LDA !GAMEMODE : CMP #$000C : BMI .check_ceres : BEQ .fill_interior
    CMP #$0012 : BMI .fill_interior

    ; fill if game over
    CMP #$001A : BEQ .fill_interior

  .check_ceres
    ; fill if Ceres
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
    LDX !ram_cm_stack_index
    LDA !ram_cm_menu_stack,X : STA !DP_MenuIndices
    LDA !ram_cm_menu_bank : STA !DP_MenuIndices+2 : STA !DP_CurrentMenu+2

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
    STA !DP_Palette

    ; check for special entries (header/blank lines)
    LDA [!DP_MenuIndices],Y : BEQ .header
    CMP #$FFFF : BEQ .blank
    STA !DP_CurrentMenu

    PHY : PHX

    ; X = action index (action type)
    LDA [!DP_CurrentMenu] : TAX

    ; !DP_CurrentMenu points to data after the action type index
    INC !DP_CurrentMenu : INC !DP_CurrentMenu

    ; draw menu item
    JSR (cm_draw_action_table,X)

    PLX : PLY

  .blank
    ; skip drawing blank lines
    INY #2
    BRA .loop

  .header
    STZ !DP_Palette
    ; check if attribute byte of string is set
    LDA !sram_custom_header : AND #$00FF : CMP #$0028 : BNE .normal_header
    ; only draw custom header on MainMenu
    LDA !DP_MenuIndices : CMP.w #MainMenu : BNE .normal_header
    ; set pointer to text in SRAM
    LDA.w #!sram_custom_header : STA !DP_CurrentMenu
    LDA.w #!sram_custom_header>>16 : STA !DP_CurrentMenu+2
    BRA .draw_header

  .normal_header
    ; menu pointer + index + 2 = header
    TYA : CLC : ADC !DP_MenuIndices : INC #2 : STA !DP_CurrentMenu

  .draw_header
    LDX #$00C6
    JSR cm_draw_text
    ; fix bank (for custom header)
    LDA !DP_MenuIndices+2 : STA !DP_CurrentMenu+2

    ; menu pointer + header pointer + 1 = footer
    TYA : CLC : ADC !DP_CurrentMenu : INC : STA !DP_CurrentMenu
    LDA [!DP_CurrentMenu] : CMP #$F007 : BNE .done

    ; INC past #$F007
    INC !DP_CurrentMenu : INC !DP_CurrentMenu : STZ !DP_Palette
    ; Optional footer
    LDX #$0686
    JSR cm_draw_text
    RTS

  .done
    ; no footer, back up two bytes
    DEC !DP_CurrentMenu : DEC !DP_CurrentMenu
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
    dw draw_numfield_hex_word
    dw draw_numfield_color
    dw draw_numfield_sound
    dw draw_choice
    dw draw_ctrl_shortcut
    dw draw_controller_input
    dw draw_jsl
    dw draw_submenu
    dw draw_custom_preset
    dw draw_ram_watch

draw_toggle:
{
    ; grab the memory address (long)
    LDA [!DP_CurrentMenu] : INC !DP_CurrentMenu : INC !DP_CurrentMenu : STA !DP_Address
    LDA [!DP_CurrentMenu] : INC !DP_CurrentMenu : STA !DP_Address+2

    ; grab the toggle value
    LDA [!DP_CurrentMenu] : AND #$00FF : INC !DP_CurrentMenu : STA !DP_ToggleValue

    ; increment past JSL
    INC !DP_CurrentMenu : INC !DP_CurrentMenu

    ; Draw the text
    %item_index_to_vram_index()
    PHX : JSR cm_draw_text : PLX

    ; Set position for ON/OFF
    TXA : CLC : ADC #$002E : TAX

    ; grab the value at that memory address
    LDA [!DP_Address] : CMP !DP_ToggleValue : BEQ .checked

    ; Off
    LDA #$244B : STA !ram_tilemap_buffer+0,X
    LDA #$244D : STA !ram_tilemap_buffer+2,X
    LDA #$244D : STA !ram_tilemap_buffer+4,X
    RTS

  .checked
    ; On
    LDA #$384B : STA !ram_tilemap_buffer+2,X
    LDA #$384C : STA !ram_tilemap_buffer+4,X
    RTS
}

draw_toggle_bit:
{
    ; grab the memory address (long)
    LDA [!DP_CurrentMenu] : INC !DP_CurrentMenu : INC !DP_CurrentMenu : STA !DP_Address
    LDA [!DP_CurrentMenu] : INC !DP_CurrentMenu : STA !DP_Address+2

    ; grab bitmask
    LDA [!DP_CurrentMenu] : INC !DP_CurrentMenu : INC !DP_CurrentMenu : STA !DP_ToggleValue

    ; increment past JSL
    INC !DP_CurrentMenu : INC !DP_CurrentMenu

    ; Draw the text
    %item_index_to_vram_index()
    PHX : JSR cm_draw_text : PLX

    ; Set position for ON/OFF
    TXA : CLC : ADC #$002E : TAX

    ; grab the value at that memory address
    LDA [!DP_Address] : AND !DP_ToggleValue : BNE .checked

    ; Off
    LDA #$244B : STA !ram_tilemap_buffer+0,X
    LDA #$244D : STA !ram_tilemap_buffer+2,X
    LDA #$244D : STA !ram_tilemap_buffer+4,X
    RTS

  .checked
    ; On
    LDA #$384B : STA !ram_tilemap_buffer+2,X
    LDA #$384C : STA !ram_tilemap_buffer+4,X
    RTS
}

draw_toggle_inverted:
{
    ; grab the memory address (long)
    LDA [!DP_CurrentMenu] : INC !DP_CurrentMenu : INC !DP_CurrentMenu : STA !DP_Address
    LDA [!DP_CurrentMenu] : INC !DP_CurrentMenu : STA !DP_Address+2

    ; grab the toggle value
    LDA [!DP_CurrentMenu] : AND #$00FF : INC !DP_CurrentMenu : STA !DP_ToggleValue

    ; increment past JSL
    INC !DP_CurrentMenu : INC !DP_CurrentMenu

    ; Draw the text
    %item_index_to_vram_index()
    PHX : JSR cm_draw_text : PLX

    ; Set position for ON/OFF
    TXA : CLC : ADC #$002E : TAX

    ; grab the value at that memory address
    LDA [!DP_Address] : CMP !DP_ToggleValue : BNE .checked

    ; Off
    LDA #$244B : STA !ram_tilemap_buffer+0,X
    LDA #$244D : STA !ram_tilemap_buffer+2,X
    LDA #$244D : STA !ram_tilemap_buffer+4,X
    RTS

  .checked
    ; On
    LDA #$384B : STA !ram_tilemap_buffer+2,X
    LDA #$384C : STA !ram_tilemap_buffer+4,X
    RTS
}

draw_toggle_bit_inverted:
{
    ; grab the memory address (long)
    LDA [!DP_CurrentMenu] : INC !DP_CurrentMenu : INC !DP_CurrentMenu : STA !DP_Address
    LDA [!DP_CurrentMenu] : INC !DP_CurrentMenu : STA !DP_Address+2

    ; grab bitmask
    LDA [!DP_CurrentMenu] : INC !DP_CurrentMenu : INC !DP_CurrentMenu : STA !DP_ToggleValue

    ; increment past JSL
    INC !DP_CurrentMenu : INC !DP_CurrentMenu

    ; Draw the text
    %item_index_to_vram_index()
    PHX : JSR cm_draw_text : PLX

    ; Set position for ON/OFF
    TXA : CLC : ADC #$002C : TAX

    ; grab the value at that memory address
    LDA [!DP_Address] : AND !DP_ToggleValue : BEQ .checked

    ; Off
    LDA #$244B : STA !ram_tilemap_buffer+2,X
    LDA #$244D : STA !ram_tilemap_buffer+4,X
    LDA #$244D : STA !ram_tilemap_buffer+6,X
    RTS

  .checked
    ; On
    LDA #$384B : STA !ram_tilemap_buffer+4,X
    LDA #$384C : STA !ram_tilemap_buffer+6,X
    RTS
}

draw_numfield:
{
    ; grab the memory address (long)
    LDA [!DP_CurrentMenu] : INC !DP_CurrentMenu : INC !DP_CurrentMenu : STA !DP_Address
    LDA [!DP_CurrentMenu] : INC !DP_CurrentMenu : STA !DP_Address+2

    ; skip bounds and increment values
    INC !DP_CurrentMenu : INC !DP_CurrentMenu : INC !DP_CurrentMenu; : INC !DP_CurrentMenu

    ; increment past JSL
    INC !DP_CurrentMenu : INC !DP_CurrentMenu

    ; Draw the text
    %item_index_to_vram_index()
    PHX : JSR cm_draw_text : PLX

    ; set position for the number
    TXA : CLC : ADC #$002E : TAX

    ; convert value to decimal
    LDA [!DP_Address] : AND #$00FF : JSR cm_hex2dec

    ; Clear out the area
    LDA !MENU_BLANK : STA !ram_tilemap_buffer+0,X
                      STA !ram_tilemap_buffer+2,X
                      STA !ram_tilemap_buffer+4,X

    ; Set palette
    %a8()
    LDA #$24 : ORA !DP_Palette : STA !DP_Palette+1
    LDA #$70 : STA !DP_Palette ; number tiles are 70-79

    ; Draw numbers
    %a16()
    ; ones
    LDA !DP_ThirdDigit : CLC : ADC !DP_Palette : STA !ram_tilemap_buffer+4,X
    ; tens
    LDA !DP_SecondDigit : ORA !DP_FirstDigit : BEQ .done
    LDA !DP_SecondDigit : CLC : ADC !DP_Palette : STA !ram_tilemap_buffer+2,X
    ; hundreds
    LDA !DP_FirstDigit : BEQ .done
    CLC : ADC !DP_Palette : STA !ram_tilemap_buffer,X

  .done
    RTS
}

draw_numfield_hex:
draw_numfield_sound:
{
    ; grab the memory address (long)
    LDA [!DP_CurrentMenu] : INC !DP_CurrentMenu : INC !DP_CurrentMenu : STA !DP_Address
    LDA [!DP_CurrentMenu] : INC !DP_CurrentMenu : STA !DP_Address+2

    ; skip bounds and increment values
    INC !DP_CurrentMenu : INC !DP_CurrentMenu : INC !DP_CurrentMenu; : INC !DP_CurrentMenu

    ; increment past JSL
    INC !DP_CurrentMenu : INC !DP_CurrentMenu

    ; Draw the text
    %item_index_to_vram_index()
    PHX : JSR cm_draw_text : PLX

    ; set position for the number
    TXA : CLC : ADC #$0030 : TAX

    ; load the value
    LDA [!DP_Address] : AND #$00FF : STA !DP_DrawValue

    ; Clear out the area
    LDA !MENU_BLANK : STA !ram_tilemap_buffer+0,X
                      STA !ram_tilemap_buffer+2,X

    ; Draw numbers
    ; (00X0)
    LDA !DP_DrawValue : AND #$00F0 : LSR #3 : TAY
    LDA.w HexMenuGFXTable,Y : STA !ram_tilemap_buffer,X
    ; (000X)
    LDA !DP_DrawValue : AND #$000F : ASL : TAY
    LDA.w HexMenuGFXTable,Y : STA !ram_tilemap_buffer+2,X

    ; overwrite palette bytes
    %a8()
    LDA #$24 : ORA !DP_Palette
    STA !ram_tilemap_buffer+1,X : STA !ram_tilemap_buffer+3,X
    %a16()

    RTS
}

draw_numfield_word:
{
    ; grab the memory address (long)
    LDA [!DP_CurrentMenu] : INC !DP_CurrentMenu : INC !DP_CurrentMenu : STA !DP_Address
    LDA [!DP_CurrentMenu] : INC !DP_CurrentMenu : STA !DP_Address+2

    ; skip min/max values
    INC !DP_CurrentMenu : INC !DP_CurrentMenu : INC !DP_CurrentMenu : INC !DP_CurrentMenu

    ; increment past JSL
    INC !DP_CurrentMenu : INC !DP_CurrentMenu

    ; Draw the text
    %item_index_to_vram_index()
    PHX : JSR cm_draw_text : PLX

    ; set position for the number
    TXA : CLC : ADC #$002C : TAX

    ; convert value to decimal
    LDA [!DP_Address] : JSR cm_hex2dec

    ; Clear out the area
    LDA !MENU_BLANK : STA !ram_tilemap_buffer+0,X
                      STA !ram_tilemap_buffer+2,X
                      STA !ram_tilemap_buffer+4,X
                      STA !ram_tilemap_buffer+6,X

    ; Set palette
    %a8()
    LDA #$24 : ORA !DP_Palette : STA !DP_Palette+1
    LDA #$70 : STA !DP_Palette ; number tiles are 70-79

    ; Draw numbers
    %a16()
    ; ones
    LDA !DP_ThirdDigit : CLC : ADC !DP_Palette : STA !ram_tilemap_buffer+6,X
    ; tens
    LDA !DP_SecondDigit : ORA !DP_FirstDigit
    ORA !DP_Temp : BEQ .done
    LDA !DP_SecondDigit : CLC : ADC !DP_Palette : STA !ram_tilemap_buffer+4,X
    ; hundreds
    LDA !DP_FirstDigit : ORA !DP_Temp : BEQ .done
    LDA !DP_FirstDigit : CLC : ADC !DP_Palette : STA !ram_tilemap_buffer+2,X
    ; thousands
    LDA !DP_Temp : BEQ .done
    CLC : ADC !DP_Palette : STA !ram_tilemap_buffer,X

  .done
    RTS
}

draw_numfield_hex_word:
{
    ; grab the memory address (long)
    LDA [!DP_CurrentMenu] : INC !DP_CurrentMenu : INC !DP_CurrentMenu : STA !DP_Address
    LDA [!DP_CurrentMenu] : INC !DP_CurrentMenu : STA !DP_Address+2

    ; skip bitmask and JSL address
    INC !DP_CurrentMenu : INC !DP_CurrentMenu : INC !DP_CurrentMenu : INC !DP_CurrentMenu

    ; Draw the text
    %item_index_to_vram_index()
    PHX : JSR cm_draw_text : PLX

    ; set position for the number
    TXA : CLC : ADC #$002C : TAX

    ; load the value
    LDA [!DP_Address] : STA !DP_DrawValue

    ; Clear out the area
    LDA !MENU_BLANK : STA !ram_tilemap_buffer+0,X
                      STA !ram_tilemap_buffer+2,X
                      STA !ram_tilemap_buffer+4,X
                      STA !ram_tilemap_buffer+6,X

    ; Draw numbers
    ; (X000)
    LDA !DP_DrawValue : AND #$F000 : XBA : LSR #3 : TAY
    LDA.w HexMenuGFXTable,Y : STA !ram_tilemap_buffer,X
    ; (0X00)
    LDA !DP_DrawValue : AND #$0F00 : XBA : ASL : TAY
    LDA.w HexMenuGFXTable,Y : STA !ram_tilemap_buffer+2,X
    ; (00X0)
    LDA !DP_DrawValue : AND #$00F0 : LSR #3 : TAY
    LDA.w HexMenuGFXTable,Y : STA !ram_tilemap_buffer+4,X
    ; (000X)
    LDA !DP_DrawValue : AND #$000F : ASL : TAY
    LDA.w HexMenuGFXTable,Y : STA !ram_tilemap_buffer+6,X

    ; overwrite palette bytes
    %a8()
    LDA #$2C : ORA !DP_Palette
    STA !ram_tilemap_buffer+1,X : STA !ram_tilemap_buffer+3,X
    STA !ram_tilemap_buffer+5,X : STA !ram_tilemap_buffer+7,X
    %a16()

    RTS
}

draw_numfield_color:
; Color values are increments of 8
{
    ; grab the memory address (long)
    LDA [!DP_CurrentMenu] : INC !DP_CurrentMenu : INC !DP_CurrentMenu : STA !DP_Address
    LDA [!DP_CurrentMenu] : INC !DP_CurrentMenu : STA !DP_Address+2

    ; increment past JSL
    INC !DP_CurrentMenu : INC !DP_CurrentMenu

    ; Draw the text
    %item_index_to_vram_index()
    PHX : JSR cm_draw_text : PLX

    ; set position for the number
    TXA : CLC : ADC #$0030 : TAX

    ; load the value
    LDA [!DP_Address] : AND #$00FF : STA !DP_DrawValue

    ; Clear out the area
    LDA !MENU_BLANK : STA !ram_tilemap_buffer+0,X
                      STA !ram_tilemap_buffer+2,X

    ; Draw numbers
    ; (00X0)
    LDA !DP_DrawValue : AND #$001E : TAY
    LDA.w HexMenuGFXTable,Y : STA !ram_tilemap_buffer,X
    ; (000X)
    LDA !DP_DrawValue : AND #$0001 : ASL #4 : STA !DP_Temp
    LDA !DP_DrawValue : AND #$001C : LSR : CLC : ADC !DP_Temp : TAY
    LDA.w HexMenuGFXTable,Y : STA !ram_tilemap_buffer+2,X

    ; overwrite palette bytes
    %a8()
    LDA #$24 : ORA !DP_Palette
    STA !ram_tilemap_buffer+1,X : STA !ram_tilemap_buffer+3,X
    %a16()

  .done
    RTS
}

draw_choice:
{
    ; grab the memory address (long)
    LDA [!DP_CurrentMenu] : INC !DP_CurrentMenu : INC !DP_CurrentMenu : STA !DP_Address
    LDA [!DP_CurrentMenu] : INC !DP_CurrentMenu : STA !DP_Address+2

    ; skip the JSL target
    INC !DP_CurrentMenu : INC !DP_CurrentMenu

    ; Draw the text first
    %item_index_to_vram_index()
    PHX : JSR cm_draw_text : PLX

    ; set position for choice
    TXA : CLC : ADC #$001E : TAX

    ; grab the value at that memory address
    LDA [!DP_Address] : TAY

    ; find the correct text that should be drawn (the selected choice)
    ; skipping the first text that we already drew
    INY #2

  .loop_choices
    DEY : BEQ .found

  .loop_text
    LDA [!DP_CurrentMenu] : %a16() : INC !DP_CurrentMenu : %a8()
    CMP #$FF : BEQ .loop_choices
    BRA .loop_text

  .found
    %a16()
    JSR cm_draw_text
    RTS
}

draw_ctrl_shortcut:
{
    ; grab the memory address (long)
    LDA [!DP_CurrentMenu] : INC !DP_CurrentMenu : INC !DP_CurrentMenu : STA !DP_Address
    LDA [!DP_CurrentMenu] : INC !DP_CurrentMenu : STA !DP_Address+2

    ; draw the text
    %item_index_to_vram_index()
    PHX
    JSR cm_draw_text

    ; set position of inputs
    PLA : CLC : ADC #$0022 : TAX

    ; draw the inputs
    LDA [!DP_Address]
    JSR menu_ctrl_input_display

    RTS
}

draw_controller_input:
{
    ; grab the memory address (long)
    LDA [!DP_CurrentMenu] : INC !DP_CurrentMenu : INC !DP_CurrentMenu : STA !DP_Address
    STA !ram_cm_ctrl_assign
    LDA [!DP_CurrentMenu] : INC !DP_CurrentMenu : STA !DP_Address+2

    ; skip JSL target + argument
    INC !DP_CurrentMenu : INC !DP_CurrentMenu : INC !DP_CurrentMenu : INC !DP_CurrentMenu

    ; Draw the text
    %item_index_to_vram_index()
    PHX : JSR cm_draw_text : PLX

    ; set position for the input
    TXA : CLC : ADC #$0020 : TAX

    ; check if anything to draw
    LDA (!DP_Address) : AND #$E0F0 : BEQ .unbound

    ; determine which input to draw, using Y to refresh A
    TAY : AND !CTRL_A : BEQ + : LDY #$0000 : BRA .draw
+   TYA : AND !CTRL_B : BEQ + : LDY #$0002 : BRA .draw
+   TYA : AND !CTRL_X : BEQ + : LDY #$0004 : BRA .draw
+   TYA : AND !CTRL_Y : BEQ + : LDY #$0006 : BRA .draw
+   TYA : AND !CTRL_L : BEQ + : LDY #$0008 : BRA .draw
+   TYA : AND !CTRL_R : BEQ + : LDY #$000A : BRA .draw
+   TYA : AND !CTRL_SELECT : BEQ .unbound : LDY #$000C

  .draw
    LDA.w .CtrlMenuGFXTable,Y : STA !ram_tilemap_buffer,X
    RTS

  .unbound
    LDA !MENU_BLANK : STA !ram_tilemap_buffer,X
    RTS

  .CtrlMenuGFXTable
    ;    A      B      X      Y      L      R    Select
    ;  $0080  $8000  $0040  $4000  $0020  $0010  $2000
    dw $288F, $2887, $288E, $2886, $288D, $288C, $2885
}

draw_jsl:
draw_submenu:
{
    ; skip JSL address
    INC !DP_CurrentMenu : INC !DP_CurrentMenu

    ; skip argument
    INC !DP_CurrentMenu : INC !DP_CurrentMenu

    ; draw text normally
    %item_index_to_vram_index()
    JSR cm_draw_text
    RTS
}

draw_custom_preset:
{
    %a8()
    ; store slot index in !DP_ToggleValue
    LDA [!DP_CurrentMenu] : STA !DP_ToggleValue
    %a16()
    INC !DP_CurrentMenu

    ; preserve !DP_Palette
    LDA !DP_Palette : STA !DP_CtrlInput

    ; draw slot number text
    %item_index_to_vram_index()
    STA !DP_JSLTarget ; save starting index for later
    JSR cm_draw_text

    ; get preset slot offset
    LDA !DP_ToggleValue : %presetslotsize()
    ; store preset slot index in !DP_Address
    STX !DP_Address

    ; check if slot has valid data
    LDA $703000,X : CMP #$5AFE : BEQ .validPreset
    ; slot is EMPTY, fix bank and exit
    LDA !DP_MenuIndices+2 : STA !DP_CurrentMenu+2
    RTS

  .validPreset
    ; determine what to draw
    LDA !ram_cm_custom_preset_labels : BNE .drawSamusData

    ; check if custom preset name exists
    LDA !DP_ToggleValue : ASL : TAX
    LDA !sram_custom_preset_safewords,X : CMP #$5AFE : BNE .drawRoomName

    ; preset slot * $18 = name offset
    TXA : ASL #2 : STA !DP_Temp
    ASL : ADC !DP_Temp
    CLC : ADC.w #!sram_custom_preset_names : STA !DP_CurrentMenu
    LDA.w #!sram_custom_preset_names>>16 : STA !DP_CurrentMenu+2
    ; set tilemap position and draw area text
    LDA !DP_JSLTarget : CLC : ADC #$0006 : TAX
    JSR cm_draw_text

    ; fix bank
    LDA !DP_MenuIndices+2 : STA !DP_CurrentMenu+2
    RTS
    

  .drawRoomName
    ; draw ROOM NAME using ID as pointer
    LDX !DP_Address : LDA !PRESET_SLOTS_ROOM,X : STA !DP_CurrentMenu
    LDA.w #RoomNameTextTable>>16 : STA !DP_CurrentMenu+2
    ; set tilemap position and draw area text
    LDA !DP_JSLTarget : CLC : ADC #$0006 : TAX
    JSR cm_draw_text
    ; fix bank
    LDA !DP_MenuIndices+2 : STA !DP_CurrentMenu+2
    RTS

  .drawSamusData
    ; draw Samus CURRENT ENERGY
    LDX !DP_Address : LDA !PRESET_SLOTS_ENERGY,X : STA !DP_DrawValue
    JSR cm_hex2dec
    ; set palette
    LDA !DP_CtrlInput : STA !DP_Palette
    %a8()
    LDA #$2C : ORA !DP_Palette : STA !DP_Palette+1
    LDA #$70 : STA !DP_Palette ; number tiles are 70-79
    %a16()
    ; set tilemap position
    LDA !DP_JSLTarget : CLC : ADC #$0006 : TAX
    ; ones
    LDA !DP_ThirdDigit : CLC : ADC !DP_Palette : STA !ram_tilemap_buffer+6,X
    ; tens
    LDA !DP_SecondDigit : ORA !DP_FirstDigit
    ORA !DP_Temp : BEQ .drawSamusMaxEnergy
    LDA !DP_SecondDigit : CLC : ADC !DP_Palette : STA !ram_tilemap_buffer+4,X
    ; hundreds
    LDA !DP_FirstDigit : ORA !DP_Temp : BEQ .drawSamusMaxEnergy
    LDA !DP_FirstDigit : CLC : ADC !DP_Palette : STA !ram_tilemap_buffer+2,X
    ; thousands
    LDA !DP_Temp : BEQ .drawSamusMaxEnergy
    CLC : ADC !DP_Palette : STA !ram_tilemap_buffer,X

  .drawSamusMaxEnergy
    ; set tilemap position and draw hyphen
    LDA !DP_JSLTarget : CLC : ADC #$000E : TAX
    LDA !MENU_SLASH : STA !ram_tilemap_buffer,X

    ; get Samus max energy
    LDX !DP_Address : LDA !PRESET_SLOTS_MAXENERGY,X : STA !DP_DrawValue
    JSR cm_hex2dec
    ; set tilemap position
    LDA !DP_JSLTarget : CLC : ADC #$0010 : TAX
    ; ones
    LDA !DP_ThirdDigit : CLC : ADC !DP_Palette : STA !ram_tilemap_buffer+6,X
    ; tens
    LDA !DP_SecondDigit : ORA !DP_FirstDigit
    ORA !DP_Temp : BEQ .drawSamusReserves
    LDA !DP_SecondDigit : CLC : ADC !DP_Palette : STA !ram_tilemap_buffer+4,X
    ; hundreds
    LDA !DP_FirstDigit : ORA !DP_Temp : BEQ .drawSamusReserves
    LDA !DP_FirstDigit : CLC : ADC !DP_Palette : STA !ram_tilemap_buffer+2,X
    ; thousands
    LDA !DP_Temp : BEQ .drawSamusReserves
    CLC : ADC !DP_Palette : STA !ram_tilemap_buffer,X

  .drawSamusReserves
    LDX !DP_Address : LDA !PRESET_SLOTS_RESERVES,X : STA !DP_DrawValue
    JSR cm_hex2dec
    ; set tilemap position
    LDA !DP_JSLTarget : CLC : ADC #$001A : TAX
    ; ones
    LDA !DP_ThirdDigit : CLC : ADC !DP_Palette : STA !ram_tilemap_buffer+4,X
    ; tens
    LDA !DP_SecondDigit : ORA !DP_FirstDigit
    ORA !DP_Temp : BEQ .drawSamusMissiles
    LDA !DP_SecondDigit : CLC : ADC !DP_Palette : STA !ram_tilemap_buffer+2,X
    ; hundreds
    LDA !DP_FirstDigit : ORA !DP_Temp : BEQ .drawSamusMissiles
    LDA !DP_FirstDigit : CLC : ADC !DP_Palette : STA !ram_tilemap_buffer,X

  .drawSamusMissiles
    LDX !DP_Address : LDA !PRESET_SLOTS_MISSILES,X : STA !DP_DrawValue
    JSR cm_hex2dec
    ; set tilemap position
    LDA !DP_JSLTarget : CLC : ADC #$0022 : TAX
    ; ones
    LDA !DP_ThirdDigit : CLC : ADC !DP_Palette : STA !ram_tilemap_buffer+4,X
    ; tens
    LDA !DP_SecondDigit : ORA !DP_FirstDigit
    ORA !DP_Temp : BEQ .drawSamusSupers
    LDA !DP_SecondDigit : CLC : ADC !DP_Palette : STA !ram_tilemap_buffer+2,X
    ; hundreds
    LDA !DP_FirstDigit : ORA !DP_Temp : BEQ .drawSamusSupers
    LDA !DP_FirstDigit : CLC : ADC !DP_Palette : STA !ram_tilemap_buffer,X

  .drawSamusSupers
    LDX !DP_Address : LDA !PRESET_SLOTS_SUPERS,X : STA !DP_DrawValue
    JSR cm_hex2dec
    ; set tilemap position
    LDA !DP_JSLTarget : CLC : ADC #$002A : TAX
    ; ones
    LDA !DP_ThirdDigit : CLC : ADC !DP_Palette : STA !ram_tilemap_buffer+2,X
    ; tens
    LDA !DP_SecondDigit : ORA !DP_FirstDigit
    ORA !DP_Temp : BEQ .drawSamusPowerBombs
    LDA !DP_SecondDigit : CLC : ADC !DP_Palette : STA !ram_tilemap_buffer,X

  .drawSamusPowerBombs
    LDX !DP_Address : LDA !PRESET_SLOTS_PBS,X : STA !DP_DrawValue
    JSR cm_hex2dec
    ; set tilemap position
    LDA !DP_JSLTarget : CLC : ADC #$0030 : TAX
    ; ones
    LDA !DP_ThirdDigit : CLC : ADC !DP_Palette : STA !ram_tilemap_buffer+2,X
    ; tens
    LDA !DP_SecondDigit : ORA !DP_FirstDigit
    ORA !DP_Temp : BEQ .done
    LDA !DP_SecondDigit : CLC : ADC !DP_Palette : STA !ram_tilemap_buffer,X

  .done
    RTS

pushpc
incsrc roomnames.asm
pullpc
}

draw_ram_watch:
{
    PHB : PHK : PLB

    ; Draw the text
    %item_index_to_vram_index()
    JSR cm_draw_text

    ; Draw $ signs in the appropriate places
    LDX #$2C4E
    LDA !ram_watch_write_mode : BNE .both_8bit
    TXA : STA !ram_tilemap_buffer+$5D0 : STA !ram_tilemap_buffer+$5E6
    BRA +
  .both_8bit
    TXA : STA !ram_tilemap_buffer+$5D4 : STA !ram_tilemap_buffer+$5EA

    ; Draw hexidecimal numbers
+   LDX #$05D2 ; position for left hex
    LDA !ram_watch_left : CLC : ADC !ram_watch_left_index : STA !DP_Address
    LDA !ram_watch_bank : STA !DP_Address+2
    LDA [!DP_Address] : STA !DP_DrawValue

    ; check if 8-bit mode
    LDA !ram_watch_write_mode : BEQ +
    LDA !DP_DrawValue : AND #$00FF : STA !DP_DrawValue
    BRA .left_8bit

    ; (X000)
+   LDA !DP_DrawValue : AND #$F000 : XBA : LSR #3 : TAY
    LDA.w HexMenuGFXTable,Y : STA !ram_tilemap_buffer,X
    ; (0X00)
    LDA !DP_DrawValue : AND #$0F00 : XBA : ASL : TAY
    LDA.w HexMenuGFXTable,Y : STA !ram_tilemap_buffer+2,X
  .left_8bit
    ; (00X0)
    LDA !DP_DrawValue : AND #$00F0 : LSR #3 : TAY
    LDA.w HexMenuGFXTable,Y : STA !ram_tilemap_buffer+4,X
    ; (000X)
    LDA !DP_DrawValue : AND #$000F : ASL : TAY
    LDA.w HexMenuGFXTable,Y : STA !ram_tilemap_buffer+6,X

    ; Draw left decimal number
    LDX #$0610 ; position for left decimal
    JSR cm_hex2dec_draw5

    LDX #$05E8 ; position for right hex
    LDA !ram_watch_right : CLC : ADC !ram_watch_right_index : STA !DP_Address
    LDA [!DP_Address] : STA !DP_DrawValue

    ; check if 8-bit mode
    LDA !ram_watch_write_mode : BEQ +
    LDA !DP_DrawValue : AND #$00FF : STA !DP_DrawValue
    BRA .right_8bit

    ; (X000)
+   LDA !DP_DrawValue : AND #$F000 : XBA : LSR #3 : TAY
    LDA.w HexMenuGFXTable,Y : STA !ram_tilemap_buffer,X
    ; (0X00)
    LDA !DP_DrawValue : AND #$0F00 : XBA : ASL : TAY
    LDA.w HexMenuGFXTable,Y : STA !ram_tilemap_buffer+2,X
  .right_8bit
    ; (00X0)
    LDA !DP_DrawValue : AND #$00F0 : LSR #3 : TAY
    LDA.w HexMenuGFXTable,Y : STA !ram_tilemap_buffer+4,X
    ; (000X)
    LDA !DP_DrawValue : AND #$000F : ASL : TAY
    LDA.w HexMenuGFXTable,Y : STA !ram_tilemap_buffer+6,X

    ; Draw right decimal number
    LDX #$0626 ; position for right decimal
    JSR cm_hex2dec_draw5

    ; adjust max cursor position to prevent selecting display item
    LDA !DP_MenuIndices : PHA
    JSL cm_calculate_max
    PLA : STA !DP_MenuIndices
    LDA !ram_cm_cursor_max : SEC : SBC #$0004 : STA !ram_cm_cursor_max

    PLB
    RTS
}

cm_hex2dec_draw5:
; Converts a hex number into a five digit decimal number
; expects value to be drawn in !DP_DrawValue
; expects tilemap pointer in X
{
    PHB
    LDA !DP_DrawValue : STA $4204
    %a8()
    LDA #$0A : STA $4206   ; divide by 10
    %a16()
    PEA $0000 : PLA ; REP + PEA + 16bit PLA + 16bit LDA = 18 cycles wasted
    LDA $4214 : STA !DP_Temp

    ; Set palette
    LDA #$2C70 : STA !DP_Palette ; number tiles are 70-79

    ; Ones digit
    LDA $4216 : ORA !DP_Palette : STA !ram_tilemap_buffer+8,X

    LDA !DP_Temp : BEQ .blanktens
    STA $4204
    %a8()
    LDA #$0A : STA $4206   ; divide by 10
    %a16()
    PEA $0000 : PLA ; waiting for math registers
    LDA $4214 : STA !DP_ThirdDigit

    ; Tens digit
    LDA $4216 : ORA !DP_Palette : STA !ram_tilemap_buffer+6,X

    LDA !DP_ThirdDigit : BEQ .blankhundreds
    STA $4204
    %a8()
    LDA #$0A : STA $4206   ; divide by 10
    %a16()
    PEA $0000 : PLA ; waiting for math registers
    LDA $4214 : STA !DP_SecondDigit

    ; Hundreds digit
    LDA $4216 : ORA !DP_Palette : STA !ram_tilemap_buffer+4,X

    LDA !DP_SecondDigit : BEQ .blankthousands
    STA $4204
    %a8()
    LDA #$0A : STA $4206   ; divide by 10
    %a16()
    PEA $0000 : PLA ; waiting for math registers
    LDA $4214 : STA !DP_FirstDigit

    ; Thousands digit
    LDA $4216 : ORA !DP_Palette : STA !ram_tilemap_buffer+2,X

    ; Ten thousands digit
    LDA !DP_FirstDigit : BEQ .blanktenthousands
    ORA !DP_Palette : STA !ram_tilemap_buffer,X

  .done
    PLB
    INX #10
    RTS

  .blanktens
    LDA !MENU_BLANK
    STA !ram_tilemap_buffer,X : STA !ram_tilemap_buffer+2,X
    STA !ram_tilemap_buffer+4,X : STA !ram_tilemap_buffer+6,X
    BRA .done

  .blankhundreds
    LDA !MENU_BLANK
    STA !ram_tilemap_buffer,X : STA !ram_tilemap_buffer+2,X : STA !ram_tilemap_buffer+4,X
    BRA .done

  .blankthousands
    LDA !MENU_BLANK
    STA !ram_tilemap_buffer,X : STA !ram_tilemap_buffer+2,X
    BRA .done

  .blanktenthousands
    LDA !MENU_BLANK : STA !ram_tilemap_buffer,X
    BRA .done
}

cm_draw_text:
; X = pointer to tilemap area (STA !ram_tilemap_buffer,X)
{
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


; --------------
; Input Display
; --------------

menu_ctrl_input_display:
; X = pointer to tilemap area (STA !ram_tilemap_buffer,X)
; A = Controller word
{
    JSR menu_ctrl_clear_input_display

    XBA
    LDY #$0000
  .loop
    PHA
    BIT #$0001 : BEQ .no_draw

    TYA : CLC : ADC #$0080
    XBA : ORA !DP_Palette : XBA
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
    LDA !ram_cm_ctrl_mode : BMI .singleDigitEditing : BEQ .checkInputs
    JSR cm_ctrl_mode
    BRA cm_loop

  .singleDigitEditing
    JSR cm_edit_digits
    BRA cm_loop

  .checkInputs
    JSR cm_get_inputs : STA !ram_cm_controller : BEQ cm_loop

    BIT !CTRL_A : BEQ + : JMP .pressedA ; more wiggle room with branch limits...
+   BIT !CTRL_B : BEQ + : JMP .pressedB
+   BIT !CTRL_Y : BNE .pressedY
    BIT !CTRL_X : BNE .pressedX
    BIT !CTRL_SELECT : BNE .pressedSelect
    BIT !IH_INPUT_START : BNE .pressedStart
    BIT !IH_INPUT_UP : BNE .pressedUp
    BIT !IH_INPUT_DOWN : BNE .pressedDown
    BIT !IH_INPUT_RIGHT : BNE .pressedRight
    BIT !IH_INPUT_LEFT : BNE .pressedLeft
    BIT !CTRL_L : BNE .pressedL
    BIT !CTRL_R : BNE .pressedR
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
  .pressedX
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
; This routine cuts off input handling in cm_loop to keep focus on the selected controller shortcut
; Held inputs are displayed until held for 120 frames
{
    JSL $809459 ; Read controller input
    LDA !IH_CONTROLLER_PRI

    ; set palette
    %a8() : LDA #$28 : STA !DP_Palette : %a16()

    LDA !IH_CONTROLLER_PRI : BEQ .clear_and_draw
    CMP !ram_cm_ctrl_last_input : BNE .clear_and_draw

    ; Holding an input for more than one second
    LDA !ram_cm_ctrl_timer : INC : STA !ram_cm_ctrl_timer
    CMP.w #0060 : BNE .next_frame

    ; Store controller input to SRAM
    LDA !IH_CONTROLLER_PRI : STA [!DP_CtrlInput]
    JSL GameModeExtras
    JSL validate_sram_for_savestates
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

cm_edit_digits:
{
    ; hex or decimal
    LDA !ram_cm_ctrl_mode : CMP #$8001 : BEQ .decimal_mode

    ; check for A, B, and D-pad
    JSR cm_get_inputs : STA !ram_cm_controller
    AND #$8F80 : BEQ .redraw
    BIT !IH_INPUT_LEFTRIGHT : BNE .selecting
    BIT !IH_INPUT_UPDOWN : BNE .editing
    BIT #$8080 : BEQ .redraw

    ; exit if A or B pressed
    ; skip if JSL target is zero
    LDA !DP_JSLTarget : BEQ .end
    ; Set return address for indirect JSL
    LDA !ram_cm_menu_bank : STA !DP_JSLTarget+2
    PHK : PEA .end-1
    ; addr in A
    LDA [!DP_DigitAddress] : LDX #$0000
    JML.w [!DP_JSLTarget]

  .end
    %ai16()
    LDA #$0000 : STA !ram_cm_ctrl_mode
    %sfxconfirm()
    JSL cm_draw
    RTS

  .decimal_mode
    JMP cm_edit_decimal_digits

  .selecting
    %sfxmove()
    ; determine which direction was pressed
    LDA !ram_cm_controller : BIT !IH_INPUT_LEFT : BNE .left
    ; inc/dec horizontal cursor index
    LDA !ram_cm_horizontal_cursor : DEC : AND #$0003 : STA !ram_cm_horizontal_cursor
    BRA .redraw
  .left
    LDA !ram_cm_horizontal_cursor : INC : AND #$0003 : STA !ram_cm_horizontal_cursor
  .redraw
    ; redraw numbers so selected digit is highlighted
    LDX !ram_cm_stack_index : LDA !ram_cm_cursor_stack,X : TAY
    %item_index_to_vram_index()
    TXA : CLC : ADC #$002C : TAX
    LDA [!DP_DigitAddress]
    JMP cm_draw4_editing ; and return from there

  .editing
    ; use horizontal cursor index to ADC/SBC
    LDA !ram_cm_horizontal_cursor : ASL : TAX
    ; determine which direction was pressed
    LDA !IH_CONTROLLER_PRI : BIT !IH_INPUT_UP : BNE +
    TXA : CLC : ADC #$0008 : TAX

    ; subroutine to inc/dec digit
+   LDA [!DP_DigitAddress] : JSR (cm_SingleDigitEdit,X)
    ; returns full value with selected digit cleared
    ; combine with modified digit and cap with bitmask in !DP_DigitMaximum
    ORA !DP_DigitValue : AND !DP_DigitMaximum : STA [!DP_DigitAddress]
    %sfxnumber()

    ; redraw numbers
    LDX !ram_cm_stack_index : LDA !ram_cm_cursor_stack,X : TAY
    %item_index_to_vram_index()
    TXA : CLC : ADC #$002C : TAX
    LDA [!DP_DigitAddress]

    ; fallthrough to cm_draw4_editing and return from there
}

cm_draw4_editing:
{
    ; (X000)
    STA !DP_DrawValue : AND #$F000 : XBA : LSR #3 : TAY
    LDA.w HexMenuGFXTable,Y : STA !ram_tilemap_buffer,X
    ; (0X00)
    LDA !DP_DrawValue : AND #$0F00 : XBA : ASL : TAY
    LDA.w HexMenuGFXTable,Y : STA !ram_tilemap_buffer+2,X
    ; (00X0)
    LDA !DP_DrawValue : AND #$00F0 : LSR #3 : TAY
    LDA.w HexMenuGFXTable,Y : STA !ram_tilemap_buffer+4,X
    ; (000X)
    LDA !DP_DrawValue : AND #$000F : ASL : TAY
    LDA.w HexMenuGFXTable,Y : STA !ram_tilemap_buffer+6,X

    ; set palette bytes to unselected
    %a8()
    LDA #$2C
    STA !ram_tilemap_buffer+1,X : STA !ram_tilemap_buffer+3,X
    STA !ram_tilemap_buffer+5,X : STA !ram_tilemap_buffer+7,X

    ; highlight selected digit only
    LDA !ram_cm_horizontal_cursor : BEQ .ones
    DEC : BEQ .tens
    DEC : BEQ .hundreds
    ; thousands $X000
    LDA #$3C : STA !ram_tilemap_buffer+1,X
    BRA .done
  .hundreds ; $0X00
    LDA #$3C : STA !ram_tilemap_buffer+3,X
    BRA .done
  .tens ; $00X0
    LDA #$3C : STA !ram_tilemap_buffer+5,X
    BRA .done
  .ones ; $000X
    LDA #$3C : STA !ram_tilemap_buffer+7,X

  .done
    %a16()
    JSR cm_tilemap_transfer
    RTS
}

cm_SingleDigitEdit:
    dw #cm_SDE_add_ones
    dw #cm_SDE_add_tens
    dw #cm_SDE_add_hundreds
    dw #cm_SDE_add_thousands
    dw #cm_SDE_sub_ones
    dw #cm_SDE_sub_tens
    dw #cm_SDE_sub_hundreds
    dw #cm_SDE_sub_thousands

    %SDE_add(ones, #$0001, #$000F, #$FFF0)
    %SDE_add(tens, #$0010, #$00F0, #$FF0F)
    %SDE_add(hundreds, #$0100, #$0F00, #$F0FF)
    %SDE_add(thousands, #$1000, #$F000, #$0FFF)
    %SDE_sub(ones, #$0001, #$000F, #$FFF0)
    %SDE_sub(tens, #$0010, #$00F0, #$FF0F)
    %SDE_sub(hundreds, #$0100, #$0F00, #$F0FF)
    %SDE_sub(thousands, #$1000, #$F000, #$0FFF)

cm_edit_decimal_digits:
{
    ; check for A, B, and D-pad
    JSR cm_get_inputs : STA !ram_cm_controller
    AND #$8F80 : BEQ .redraw
    BIT !IH_INPUT_LEFTRIGHT : BNE .selecting
    BIT !IH_INPUT_UPDOWN : BNE .editing
    BIT #$8080 : BEQ .redraw

    ; exit if A or B pressed
    BRL .exit

  .selecting
    %sfxmove()
    ; determine which direction was pressed
    LDA !ram_cm_controller : BIT !IH_INPUT_LEFT : BNE .left
    ; inc/dec horizontal cursor index
    LDA !ram_cm_horizontal_cursor : DEC : AND #$0003 : STA !ram_cm_horizontal_cursor
    CMP #$0003 : BNE .redraw
    ; is editing thousands digit allowed?
    LDA !DP_DigitMaximum : CMP #1000 : BPL .redraw
    ; limit cursor to 3 positions (0-2)
    LDA #$0002 : STA !ram_cm_horizontal_cursor
    BRL .draw
  .left
    LDA !ram_cm_horizontal_cursor : INC : AND #$0003 : STA !ram_cm_horizontal_cursor
    CMP #$0003 : BNE .redraw
    ; is editing thousands digit allowed?
    LDA !DP_DigitMaximum : CMP #1000 : BPL .redraw
    ; limit cursor to 3 positions (0-2)
    LDA #$0000 : STA !ram_cm_horizontal_cursor

  .redraw
    BRL .draw

  .editing
    ; convert value to decimal
    LDA !DP_DigitValue : JSR cm_hex2dec

    ; determine which digit to edit
    LDA !ram_cm_horizontal_cursor : BEQ .ones
    DEC : BEQ .tens
    DEC : BEQ .hundreds

    %SDE_dec(thousands, !DP_Temp)
    BRA .dec2hex
  .hundreds
    %SDE_dec(hundreds, !DP_FirstDigit)
    BRA .dec2hex
  .tens
    %SDE_dec(tens, !DP_SecondDigit)
    BRA .dec2hex
  .ones
    %SDE_dec(ones, !DP_ThirdDigit)

  .dec2hex
    %sfxnumber()
    JSR cm_reverse_hex2dec

  .draw
    ; convert value to decimal
    LDA !DP_DigitValue : JSR cm_hex2dec

    ; get tilemap address
    LDX !ram_cm_stack_index : LDA !ram_cm_cursor_stack,X : TAY
    %item_index_to_vram_index()
    TXA : CLC : ADC #$002C : TAX

    ; is editing thousands digit allowed?
    LDA #$2C70
    LDY !DP_DigitMaximum : CPY #1000 : BMI +

    ; start with zero tiles
    STA !ram_tilemap_buffer+0,X
+   STA !ram_tilemap_buffer+2,X
    STA !ram_tilemap_buffer+4,X
    STA !ram_tilemap_buffer+6,X

    ; set palette and default zero tile
    ; number tiles are 70-79
    STA !DP_Palette

    ; Draw numbers
    ; ones
    LDA !DP_ThirdDigit : CLC : ADC !DP_Palette : STA !ram_tilemap_buffer+6,X
    ; tens
    LDA !DP_SecondDigit : ORA !DP_FirstDigit
    ORA !DP_Temp : BEQ .highlighting
    LDA !DP_SecondDigit : CLC : ADC !DP_Palette : STA !ram_tilemap_buffer+4,X
    ; hundreds
    LDA !DP_FirstDigit : ORA !DP_Temp : BEQ .highlighting
    LDA !DP_FirstDigit : CLC : ADC !DP_Palette : STA !ram_tilemap_buffer+2,X
    ; thousands
    LDA !DP_Temp : BEQ .highlighting
    CLC : ADC !DP_Palette : STA !ram_tilemap_buffer,X

  .highlighting
    ; highlight the selected tile
    %a8()
    LDA !ram_cm_horizontal_cursor : BEQ .highlight_ones
    DEC : BEQ .highlight_tens
    DEC : BEQ .highlight_hundreds
    ; thousands $X000
    LDA #$3C : STA !ram_tilemap_buffer+1,X
    BRA .done
  .highlight_hundreds ; $0X00
    LDA #$3C : STA !ram_tilemap_buffer+3,X
    BRA .done
  .highlight_tens ; $00X0
    LDA #$3C : STA !ram_tilemap_buffer+5,X
    BRA .done
  .highlight_ones ; $000X
    LDA #$3C : STA !ram_tilemap_buffer+7,X

  .done
    %a16()
    JSR cm_tilemap_transfer
    RTS

  .exit
    ; check if value is inbounds
    LDA !DP_DigitValue : CMP !DP_DigitMaximum : BMI .check_minimum
    LDA !DP_DigitMaximum : DEC : BRA + ; was max+1 for convenience
  .check_minimum
    CMP !DP_DigitMinimum : BPL +
    LDA !DP_DigitMinimum
+   STA [!DP_DigitAddress]

    ; skip if JSL target is zero
    LDA !DP_JSLTarget : BEQ .end
    ; Set return address for indirect JSL
    LDA !ram_cm_menu_bank : STA !DP_JSLTarget+2
    PHK : PEA .end-1
    ; addr in A
    LDA [!DP_DigitAddress]
    JML.w [!DP_JSLTarget]

  .end
    %ai16()
    %sfxconfirm()
    LDA #$0000 : STA !ram_cm_ctrl_mode
    JSL cm_draw
    RTS
}

kb_ctrl_mode:
{
    ; init variables
    LDA #$0000
    STA !DP_KB_Row : STA !ram_cm_horizontal_cursor
    STA !DP_DigitValue : STA !DP_KB_Shift
    LDA #$0001
    STA !DP_KB_Index : STA !ram_cm_ctrl_mode

    LDA !DP_KB_Control : CMP #$5AFE : BEQ .countChars
    ; write attribute and terminator bytes
    LDA #$FF28 : STA !ram_cm_keyboard_buffer

  .countChars
    %ai8()
    LDX #$00
-   LDA !ram_cm_keyboard_buffer,X : CMP #$FF : BEQ .counted
    INX : BRA -

  .counted
    %ai16()
    STX !DP_KB_Index
    STZ !DP_KB_Control

  .draw
    JSR cm_tilemap_bg
    JSR kb_redraw_tilemap

    ; fall through into main loop
}

kb_main_loop:
{
    LDA !ram_cm_ctrl_mode : BNE +
    ; exit loop, check if user input should be saved
    ; return carry clear if user input discarded
    LDA !DP_KB_Control : CLC : BNE .cancel

    ; transfer buffer to SRAM pointer
    LDX #$0016 : TXY
-   LDA !ram_cm_keyboard_buffer,X : STA [!DP_Address],Y
    DEX #2
    DEY #2 : BPL -
    %sfxconfirm()
    SEC ; return carry set if input saved
  .cancel
    RTL

+   JSL wait_for_lag_frame_long
    JSL $808F0C ; Music queue
    JSL $8289EF ; Sound fx queue
    JSR kb_handle_inputs

    ; redraw if inputs pressed
    LDA !ram_cm_controller : BEQ kb_main_loop
    ; check if new char should be written
    LDA !DP_KB_Control : BMI .cancel : BEQ .redraw
    JSR kb_new_char
    STZ !DP_KB_Control
  .redraw
    JSR cm_tilemap_bg
    JSR kb_redraw_tilemap
    BRA kb_main_loop
}

kb_new_char:
{
    ; get cursor position and write char+term to buffer
    LDA !DP_KB_Index : TAX
    CMP #$0017 : BPL .fail
    LDA !DP_DigitValue : ORA #$FF00 : STA !ram_cm_keyboard_buffer,X
    ; attr + $16 chars + term
    LDA !DP_KB_Index : INC : CMP #$0017 : BMI .done
  .fail
    ; buffer already full
    LDA #$0036 : JSL !SFX_LIB1 ; beep
    LDA #$0017
  .done
    STA !DP_KB_Index
    RTS
}

kb_handle_inputs:
; input handling
{
    JSR cm_get_inputs : STA !ram_cm_controller
    BIT !IH_INPUT_UPDOWN : BNE .input_vertical
    BIT !IH_INPUT_LEFTRIGHT : BNE .input_horizontal
    BIT !IH_INPUT_START : BNE .input_confirm
    BIT !CTRL_SELECT : BNE .input_cancel
    BIT !CTRL_B : BNE .input_backspace
    BIT !CTRL_Y : BNE .input_shift
    BIT !CTRL_A : BNE .bridge_A
    LDA !IH_CONTROLLER_PRI : BIT !CTRL_X : BNE .input_X
    RTS

  .bridge_A
    BRL .input_A

  .input_X
    ; check if X held for 60 frames
    LDA $A3 : DEC : CMP #$FFC4 : BCS .return
    BRL .clear

  .input_backspace
    BRL .delete

  .input_shift
    BRL .shift

  .input_cancel
    DEC !DP_KB_Control

  .input_confirm
    LDA #$0000 : STA !ram_cm_ctrl_mode

  .return
    RTS

  .input_vertical
    ; check if up or down
    LDA !ram_cm_controller : BIT !IH_INPUT_DOWN : BNE .input_down
    ; input up
    LDA !DP_KB_Row : DEC : BPL +
    LDA #$0005 : BRA +
  .input_down
    LDA !DP_KB_Row : INC : CMP #$0006 : BMI +
    LDA #$0000
+   STA !DP_KB_Row
    STZ !DP_KB_Control

    ; disallow $A cursor position unless row 1
    LDA !DP_KB_Row : CMP #$0001 : BEQ +
    LDA !ram_cm_horizontal_cursor : CMP #$000A : BNE +
    DEC : STA !ram_cm_horizontal_cursor
+   %sfxmove()
    RTS

  .input_horizontal
    LDA !DP_KB_Row : CMP #$0001 : BEQ .row1_horizontal
    ; check if left or right
    LDA !ram_cm_controller : BIT !IH_INPUT_RIGHT : BNE .input_right
    ; input left
    LDA !ram_cm_horizontal_cursor : DEC : BPL +
    LDA #$0009 : BRA +
  .input_right
    LDA !ram_cm_horizontal_cursor : INC : CMP #$000A : BMI +
    LDA #$0000
    BRA +

  .row1_horizontal
    ; check if left or right
    LDA !ram_cm_controller : BIT !IH_INPUT_RIGHT : BNE .input_row1_right
    ; input left
    LDA !ram_cm_horizontal_cursor : DEC : BPL +
    LDA #$000A : BRA +
  .input_row1_right
    LDA !ram_cm_horizontal_cursor : INC : CMP #$000B : BMI +
    LDA #$0000

+   STA !ram_cm_horizontal_cursor
    STZ !DP_KB_Control
    %sfxmove()
    RTS

  .input_A
    ; pressed A
    LDA !DP_KB_Row : ASL : TAY
    LDA !DP_KB_Shift : BNE .lowercase
    LDA.w KeyboardUpperRowTable,Y : BRA +
  .lowercase
    LDA.w KeyboardLowerRowTable,Y
+   STA !DP_JSLTarget

    ; load selected character
    LDA !ram_cm_horizontal_cursor : TAY
    ; need checks here for special chars
    LDA (!DP_JSLTarget),Y : AND #$00FF : CMP #$00FF : BEQ .special
    STA !DP_DigitValue
    LDA #$0037 : JSL !SFX_LIB1 ; click
    INC !DP_KB_Control
    RTS

  .special
    LDA !DP_KB_Row : BEQ .delete

  .shift
    LDA !DP_KB_Shift : INC : AND #$0001 : STA !DP_KB_Shift
    STZ !DP_KB_Control
    LDA #$002F : JSL !SFX_LIB1 ; underwater space jump
    RTS

  .delete
    ; load index and check if chars to delete
    LDX !DP_KB_Index : DEX : BEQ +
    ; overwrite previous char with terminator
    LDA #$FFFF : STA !ram_cm_keyboard_buffer,X
    STX !DP_KB_Index
    STZ !DP_KB_Control
    %sfxfail()
+   RTS

  .clear
    ; reset index and clear buffer, set controller for redraw
    LDA #$0001 : STA !DP_KB_Index : STA !ram_cm_controller
    LDA #$FF28 : STA !ram_cm_keyboard_buffer
    ; clear previous input to prevent SFX spam
    STZ !IH_CONTROLLER_PRI_PREV
    %sfxquake()
    RTS
}

kb_redraw_tilemap:
; redraw base tilemap
{
    ; set bank for keyboard text and clear palette
    LDA.w #KeyboardTilemap>>16 : STA !DP_CurrentMenu+2
    STZ !DP_Palette

    ; header
    LDA.w #KeyboardTilemap_header : STA !DP_CurrentMenu
    LDX #$00C6 : JSR cm_draw_text
    ; blanks
    LDA.w #KeyboardTilemap_blanks : STA !DP_CurrentMenu
    LDX #$01C6 : JSR cm_draw_text
    ; row 1 symbols
    LDA.w #KeyboardTilemap_row1 : STA !DP_CurrentMenu
    LDX #$0286 : JSR cm_draw_text
    ; row 2 numbers
    LDA.w #KeyboardTilemap_row2 : STA !DP_CurrentMenu
    LDX #$0306 : JSR cm_draw_text

    ; check if upper or lowercase
    LDA !DP_KB_Shift : BNE .lowercase
    ; row 3 uppercase letters
    LDA.w #KeyboardTilemap_row3upper : STA !DP_CurrentMenu
    LDX #$0386 : JSR cm_draw_text
    ; row 4 uppercase letters
    LDA.w #KeyboardTilemap_row4upper : STA !DP_CurrentMenu
    LDX #$0406 : JSR cm_draw_text
    ; row 5 uppercase letters
    LDA.w #KeyboardTilemap_row5upper : STA !DP_CurrentMenu
    LDX #$0486 : JSR cm_draw_text
    BRA +
  .lowercase
    ; row 3 lowercase letters
    LDA.w #KeyboardTilemap_row3lower : STA !DP_CurrentMenu
    LDX #$0386 : JSR cm_draw_text
    ; row 4 lowercase letters
    LDA.w #KeyboardTilemap_row4lower : STA !DP_CurrentMenu
    LDX #$0406 : JSR cm_draw_text
    ; row 5 lowercase letters
    LDA.w #KeyboardTilemap_row5lower : STA !DP_CurrentMenu
    LDX #$0486 : JSR cm_draw_text

    ; row 6 spacebar
+   LDA.w #KeyboardTilemap_row6 : STA !DP_CurrentMenu
    LDX #$0506 : JSR cm_draw_text
    ; footers
    LDA.w #KeyboardTilemap_footer1 : STA !DP_CurrentMenu
    LDX #$0586 : JSR cm_draw_text
    LDA.w #KeyboardTilemap_footer2 : STA !DP_CurrentMenu
    LDX #$05C6 : JSR cm_draw_text
    LDA.w #KeyboardTilemap_footer3 : STA !DP_CurrentMenu
    LDX #$0606 : JSR cm_draw_text
    LDA.w #KeyboardTilemap_footer4 : STA !DP_CurrentMenu
    LDX #$0646 : JSR cm_draw_text
    LDA.w #KeyboardTilemap_footer5 : STA !DP_CurrentMenu
    LDX #$0686 : JSR cm_draw_text

    ; user generated text
    LDA.w #!ram_cm_keyboard_buffer : STA !DP_CurrentMenu
    LDA.w #!ram_cm_keyboard_buffer>>16 : STA !DP_CurrentMenu+2
    LDX #$01CA : JSR cm_draw_text

    ; highlight selected tile
    ; use row to find starting positions
    LDA !DP_KB_Row : BEQ .row1
    DEC : BEQ .row2
    DEC : BEQ .row3
    DEC : BEQ .row4
    DEC : BEQ .row5

    ; spacebar row
    LDX #$0514
-   LDA !ram_tilemap_buffer,X : ORA #$1000 : STA !ram_tilemap_buffer,X
    INX #2 : CPX #$0528 : BMI -
    BRL .done

    ; row starting position in X
    .row1
    LDX #$028C : BRA +
    .row2
    LDX #$030A : BRA +
    .row3
    LDX #$038C : BRA +
    .row4
    LDX #$040E : BRA +
    .row5
    LDX #$048C

    ; cursor position * 4 + row start position
+   LDA !ram_cm_horizontal_cursor : ASL #2 : STA !DP_Temp
    TXA : CLC : ADC !DP_Temp : TAX

    ; highlight selected tile
    LDA !ram_tilemap_buffer,X : ORA #$1000 : STA !ram_tilemap_buffer,X

    ; check if special button
    LDY !DP_KB_Row : BEQ .checkDEL
    CPY #$0004 : BEQ .checkSHIFT
    BRA .done

  .checkDEL
    LDA !ram_cm_horizontal_cursor : CMP #$0009 : BNE .done
    INX #2
    LDA !ram_tilemap_buffer,X : ORA #$1000 : STA !ram_tilemap_buffer,X
    BRA .done

  .checkSHIFT
    LDA !ram_cm_horizontal_cursor : BNE .done
    DEX #2
    LDA !ram_tilemap_buffer,X : ORA #$1000 : STA !ram_tilemap_buffer,X

  .done
    JSR cm_tilemap_transfer
    RTS
}

KeyboardUpperRowTable:
    dw Row0Symbols
    dw Row1Numbers
    dw Row2Uppercase
    dw Row3Uppercase
    dw Row4Uppercase
    dw Row5Spacebar

KeyboardLowerRowTable:
    dw Row0Symbols
    dw Row1Numbers
    dw Row2Lowercase
    dw Row3Lowercase
    dw Row4Lowercase
    dw Row5Spacebar

Row0Symbols:
    db "!#$%()+?:", $FF
Row1Numbers:
    db "1234567890-"
Row2Uppercase:
    db "QWERTYUIOP"
Row2Lowercase:
    db "qwertyuiop"
Row3Uppercase:
    db "ASDFGHJKL'"
Row3Lowercase:
    db "asdfghjkl'"
Row4Uppercase:
    db $FF, "ZXCVBNM,."
Row4Lowercase:
    db $FF, "zxcvbnm,."
Row5Spacebar:
    db "          "

KeyboardTilemap:
table ../resources/header.tbl
  .header
    db $28, "   CHOOSE A CUSTOM NAME   ", $FF
  .footer1
    db $28, "  PRESS START TO CONFIRM  ", $FF
  .footer2
    db $28, "  PRESS B FOR BACKSPACE   ", $FF
  .footer3
    db $28, "  PRESS Y TO TOGGLE CAPS  ", $FF
  .footer4
    db $28, "HOLD X TO CLEAR SELECTION ", $FF
  .footer5
    db $28, "  PRESS SELECT TO CANCEL  ", $FF
table ../resources/normal.tbl
  .blanks
    db $28, "  ______________________  ", $FF
  .row1
    db $28, "   ! # $ % ( ) + ? : ", !KB_DEL1, !KB_DEL2, "   ", $FF
  .row2
    db $28, "  1 2 3 4 5 6 7 8 9 0 -   ", $FF
  .row3upper
    db $28, "   Q W E R T Y U I O P    ", $FF
  .row4upper
    db $28, "    A S D F G H J K L '   ", $FF
  .row5upper
    db $28, "  ", !KB_SHIFT1, !KB_SHIFT2, " Z X C V B N M , .    ", $FF
  .row6
    db $28, "       (SPACEBAR)         ", $FF
  .row3lower
    db $28, "   q w e r t y u i o p    ", $FF
  .row4lower
    db $28, "    a s d f g h j k l '   ", $FF
  .row5lower
    db $28, "  ", !KB_SHIFT1, !KB_SHIFT2, " z x c v b n m , .    ", $FF

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
    LDA !ram_cm_menu_stack,X : STA !DP_MenuIndices
    LDA !ram_cm_menu_bank : STA !DP_MenuIndices+2

    LDX #$0000
  .loop
    LDA [!DP_MenuIndices] : BEQ .done
    INC !DP_MenuIndices : INC !DP_MenuIndices
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
{
    STA !DP_Temp
    LDX !ram_cm_stack_index
    LDA !DP_Temp : CLC : ADC !ram_cm_cursor_stack,X : BPL .positive
    LDA !ram_cm_cursor_max : DEC #2 : BRA .inBounds

  .positive
    CMP !ram_cm_cursor_max : BNE .inBounds
    LDA #$0000

  .inBounds
    STA !ram_cm_cursor_stack,X : TAY

    ; check for blank menu line ($FFFF)
    LDA [!DP_MenuIndices],Y : CMP #$FFFF : BNE .end

    ; repeat move to skip blank line
    LDA !DP_Temp : BRA cm_move

  .end
    %sfxmove()
    RTS
}


; --------
; Execute
; --------

cm_execute:
{
    LDX !ram_cm_stack_index
    LDA !ram_cm_menu_stack,X : STA !DP_CurrentMenu
    LDA !ram_cm_menu_bank : STA !DP_CurrentMenu+2
    LDA !ram_cm_cursor_stack,X : TAY
    LDA [!DP_CurrentMenu],Y : STA !DP_CurrentMenu

    ; Safety net incase blank line selected
    CMP #$FFFF : BEQ +

    ; Increment past the action index
    LDA [!DP_CurrentMenu] : INC !DP_CurrentMenu : INC !DP_CurrentMenu : TAX

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
    dw execute_custom_preset
    dw execute_ram_watch

execute_toggle:
{
    ; Grab address (long)
    LDA [!DP_CurrentMenu] : INC !DP_CurrentMenu : INC !DP_CurrentMenu : STA !DP_Address
    LDA [!DP_CurrentMenu] : INC !DP_CurrentMenu : STA !DP_Address+2

    ; Grab toggle value
    LDA [!DP_CurrentMenu] : INC !DP_CurrentMenu : AND #$00FF : STA !DP_ToggleValue

    ; Grab JSL target
    LDA [!DP_CurrentMenu] : INC !DP_CurrentMenu : INC !DP_CurrentMenu : STA !DP_JSLTarget

    %a8()
    LDA [!DP_Address] : CMP !DP_ToggleValue : BEQ .toggleOff
    ; toggle on
    LDA !DP_ToggleValue : STA [!DP_Address]
    BRA .jsl

  .toggleOff
    LDA #$00 : STA [!DP_Address]

  .jsl
    %a16()
    ; skip if JSL target is zero
    LDA !DP_JSLTarget : BEQ .end

    ; Set return address for indirect JSL
    LDA !ram_cm_menu_bank : STA !DP_JSLTarget+2
    PHK : PEA .end-1

    ; addr in A
    LDA [!DP_Address] : LDX #$0000
    JML.w [!DP_JSLTarget]

  .end
    %ai16()
    %sfxtoggle()
    RTS
}

execute_toggle_bit:
{
    ; Load the address
    LDA [!DP_CurrentMenu] : INC !DP_CurrentMenu : INC !DP_CurrentMenu : STA !DP_Address
    LDA [!DP_CurrentMenu] : INC !DP_CurrentMenu : STA !DP_Address+2

    ; Load which bit(s) to toggle
    LDA [!DP_CurrentMenu] : INC !DP_CurrentMenu : INC !DP_CurrentMenu : STA !DP_ToggleValue

    ; Load JSL target
    LDA [!DP_CurrentMenu] : INC !DP_CurrentMenu : INC !DP_CurrentMenu : STA !DP_JSLTarget

    ; Toggle the bit
    LDA [!DP_Address] : EOR !DP_ToggleValue : STA [!DP_Address]

    ; skip if JSL target is zero
    LDA !DP_JSLTarget : BEQ .end

    ; Set return address for indirect JSL
    LDA !ram_cm_menu_bank : STA !DP_JSLTarget+2
    PHK : PEA .end-1

    ; addr in A
    LDA [!DP_Address] : LDX #$0000
    JML.w [!DP_JSLTarget]

 .end
    %ai16()
    %sfxtoggle()
    RTS
}

execute_numfield_sound:
execute_numfield_hex:
execute_numfield:
{
    ; preserve action index to check for sfx later
    PHX

    ; grab the memory address (long)
    LDA [!DP_CurrentMenu] : INC !DP_CurrentMenu : INC !DP_CurrentMenu : STA !DP_Address
    LDA [!DP_CurrentMenu] : INC !DP_CurrentMenu : STA !DP_Address+2

    ; grab minimum (!DP_Minimum) and maximum (!DP_Maximum) values
    LDA [!DP_CurrentMenu] : INC !DP_CurrentMenu : AND #$00FF : STA !DP_Minimum
    LDA [!DP_CurrentMenu] : INC !DP_CurrentMenu : AND #$00FF : INC : STA !DP_Maximum ; INC for convenience

    ; grab normal increment
    LDA [!DP_CurrentMenu] : INC !DP_CurrentMenu : AND #$00FF : STA !DP_Increment

    ; check for only Y pressed to skip inc/dec for sfx menu
    LDA !ram_cm_controller : CMP !CTRL_Y : BEQ .skip_inc

    ; check if fast scroll button is held
    LDA !IH_CONTROLLER_PRI : AND !sram_cm_scroll_button : BEQ .determine_direction
    ; 4x scroll speed if held
    LDA !DP_Increment : ASL #2 : STA !DP_Increment

; "hold dpad to fast-scroll" is disabled here
;    ; check for held inputs
;    LDA !ram_cm_controller : BIT !IH_INPUT_HELD : BNE .input_held
;    ; grab normal increment and skip past both
;    LDA [$00] : INC $00 : INC $00; : AND #$00FF : STA $0C
;    BRA .determine_direction

;  .input_held
;    ; grab faster increment and skip past both
;    INC $00 : LDA [$00] : INC $00 : AND #$00FF : STA $0C

  .determine_direction
    LDA !ram_cm_controller : BIT #$0200 : BNE .pressed_left
    ; pressed right, inc
    LDA [!DP_Address] : CLC : ADC !DP_Increment
    CMP !DP_Maximum : BCS .set_to_min
    %a8() : STA [!DP_Address] : BRA .jsl

  .skip_inc
; unneeded while heldincrement is omitted
;    ; skipping inc/dec and just playing sfx
;    INC !DP_CurrentMenu : INC !DP_CurrentMenu
    BRA .jsl

  .pressed_left ; dec
    LDA [!DP_Address] : SEC : SBC !DP_Increment : BMI .set_to_max
    CMP !DP_Minimum : BCC .set_to_max
    %a8() : STA [!DP_Address] : BRA .jsl

  .set_to_min
    LDA !DP_Minimum : %a8() : STA [!DP_Address] : BRA .jsl

  .set_to_max
    LDA !DP_Maximum : DEC : %a8() : STA [!DP_Address]

  .jsl
    %a16()
    ; grab JSL pointer
    LDA [!DP_CurrentMenu] : INC !DP_CurrentMenu : INC !DP_CurrentMenu : STA !DP_JSLTarget

    ; skip if JSL target is zero
    LDA !DP_JSLTarget : BEQ .end

    ; Set return address for indirect JSL
    LDA !ram_cm_menu_bank : STA !DP_JSLTarget+2
    PHK : PEA .end-1

    ; addr in A
    LDA [!DP_Address] : LDX #$0000
    JML.w [!DP_JSLTarget]

  .end
    %ai16()
    ; pull action index and skip if sfx menu item
    PLX : CPX !ACTION_NUMFIELD_SOUND : BEQ +
    %sfxnumber()
+   RTS
}

execute_numfield_word:
{
    ; grab the memory address (long)
    LDA [!DP_CurrentMenu] : INC !DP_CurrentMenu : INC !DP_CurrentMenu : STA !DP_DigitAddress
    LDA [!DP_CurrentMenu] : INC !DP_CurrentMenu : STA !DP_DigitAddress+2

    ; grab minimum (!DP_DigitMinimum) and maximum (!DP_DigitMaximum) values
    LDA [!DP_CurrentMenu] : INC !DP_CurrentMenu : INC !DP_CurrentMenu : STA !DP_DigitMinimum
    LDA [!DP_CurrentMenu] : INC !DP_CurrentMenu : INC !DP_CurrentMenu : INC : STA !DP_DigitMaximum ; INC for convenience

    ; check if maximum requires 3 digits or 4
    CMP #1000 : BPL +
    LDA !ram_cm_horizontal_cursor : CMP #$0003 : BNE +
    LDA #$0002 : STA !ram_cm_horizontal_cursor

    ; grab JSL address
+   LDA [!DP_CurrentMenu] : STA !DP_JSLTarget

    LDA [!DP_DigitAddress] : STA !DP_DigitValue
    LDA #$8001 : STA !ram_cm_ctrl_mode
    %sfxnumber()

    RTS
}

execute_numfield_hex_word:
{
    ; disallow editing if "Screenshot To Share Colors" menu
    LDA !ram_cm_stack_index : TAX
    LDA !ram_cm_menu_stack,X : CMP #CustomPalettesDisplayMenu : BEQ .done

    ; grab the memory address (long)
    LDA [!DP_CurrentMenu] : INC !DP_CurrentMenu : INC !DP_CurrentMenu : STA !DP_DigitAddress
    LDA [!DP_CurrentMenu] : INC !DP_CurrentMenu : STA !DP_DigitAddress+2

    ; grab maximum bitmask
    LDA [!DP_CurrentMenu] : INC !DP_CurrentMenu : INC !DP_CurrentMenu : STA !DP_DigitMaximum

    ; grab JSL address
    LDA [!DP_CurrentMenu] : STA !DP_JSLTarget

    ; enable single digit numfield editing
    LDA #$FFFF : STA !ram_cm_ctrl_mode
    %sfxnumber()

  .done
    RTS
}

execute_numfield_color:
{
    ; grab the memory address (long)
    LDA [!DP_CurrentMenu] : INC !DP_CurrentMenu : INC !DP_CurrentMenu : STA !DP_Address
    LDA [!DP_CurrentMenu] : INC !DP_CurrentMenu : STA !DP_Address+2

    ; grab JSL target
    LDA [!DP_CurrentMenu] : INC !DP_CurrentMenu : INC !DP_CurrentMenu : STA !DP_JSLTarget

    ; determine dpad direction
    LDA !ram_cm_controller : BIT #$0200 : BNE .pressed_left
    ; pressed right, inc
    LDA [!DP_Address] : INC : CMP #$0020 : BCS .set_to_min
    STA [!DP_Address] : BRA .jsl

  .pressed_left ; dec
    LDA [!DP_Address] : DEC : BMI .set_to_max
    STA [!DP_Address] : BRA .jsl

  .set_to_min
    LDA #$0000 : STA [!DP_Address] : CLC : BRA .jsl

  .set_to_max
    LDA #$001F : STA [!DP_Address] : CLC

  .jsl
    ; skip if JSL target is zero
    LDA !DP_JSLTarget : BEQ .end

    ; Set return address for indirect JSL
    LDA !ram_cm_menu_bank : STA !DP_JSLTarget+2
    PHK : PEA .end-1

    ; addr in A
    LDA [!DP_Address] : LDX #$0000
    JML.w [!DP_JSLTarget]

  .end
    %ai16()
    %sfxnumber()
    RTS
}

execute_choice:
{
    ; grab the memory address (long)
    LDA [!DP_CurrentMenu] : INC !DP_CurrentMenu : INC !DP_CurrentMenu : STA !DP_Address
    LDA [!DP_CurrentMenu] : INC !DP_CurrentMenu : STA !DP_Address+2

    LDA [!DP_CurrentMenu] : INC !DP_CurrentMenu : INC !DP_CurrentMenu : STA !DP_JSLTarget

    ; we either increment or decrement
    LDA !ram_cm_controller : BIT #$0200 : BNE .pressed_left
    ; pressed right
    LDA [!DP_Address] : INC : BRA .bounds_check

  .pressed_left
    LDA [!DP_Address] : DEC

  .bounds_check
    TAX         ; X = new value
    LDY #$0000  ; Y will be set to max
    %a8()

  .loop_choices
    LDA [!DP_CurrentMenu] : %a16() : INC !DP_CurrentMenu : %a8() : CMP #$FF : BEQ .loop_done

  .loop_text
    LDA [!DP_CurrentMenu] : %a16() : INC !DP_CurrentMenu : %a8()
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
    TYA : STA !DP_Maximum
    TXA : CMP !DP_Maximum : BCS .set_to_zero

    BRA .store

  .set_to_zero
    LDA #$0000 : BRA .store

  .set_to_max
    TYA : DEC

  .store
    STA [!DP_Address]

    ; skip if JSL target is zero
    LDA !DP_JSLTarget : BEQ .end

    ; Set return address for indirect JSL
    LDA !ram_cm_menu_bank : STA !DP_JSLTarget+2
    PHK : PEA .end-1

    ; addr in A
    LDA [!DP_Address] : LDX #$0000
    JML.w [!DP_JSLTarget]

  .end
    %ai16()
    %sfxtoggle()
    RTS
}

execute_ctrl_shortcut:
{
    ; < and > should do nothing here
    ; also ignore the input held flag
    LDA !ram_cm_controller : BIT #$0301 : BNE .end

    ; grab memory address (long)
    LDA [!DP_CurrentMenu] : INC !DP_CurrentMenu : INC !DP_CurrentMenu : STA !DP_CtrlInput
    LDA [!DP_CurrentMenu] : INC !DP_CurrentMenu : STA !DP_CtrlInput+2

    ; press X to delete a shortcut
    LDA !ram_cm_controller : BIT !CTRL_X : BNE .reset_shortcut

    ; enable ctrl mode to edit shortcuts
    LDA #$0001 : STA !ram_cm_ctrl_mode
    LDA #$0000 : STA !ram_cm_ctrl_timer
    RTS

  .reset_shortcut
    LDA.w #!sram_ctrl_menu : CMP !DP_CtrlInput : BEQ .end
    %sfxconfirm()

    LDA #$0000 : STA [!DP_CtrlInput]

  .end
    RTS
}

execute_controller_input:
{
    ; <, > and X should do nothing here
    ; also ignore input held flag
    LDA !ram_cm_controller : BIT #$0341 : BNE .end

    ; store long address as short address for now
    LDA [!DP_CurrentMenu] : INC !DP_CurrentMenu : INC !DP_CurrentMenu : INC !DP_CurrentMenu
    STA !ram_cm_ctrl_assign

    ; !DP_JSLTarget = JSL target
    LDA [!DP_CurrentMenu] : INC !DP_CurrentMenu : INC !DP_CurrentMenu : STA !DP_JSLTarget

    ; Use bank of action_submenu
    ; instead of new menu's bank
    LDA.l #action_submenu>>16 : STA !DP_JSLTarget+2

    ; Set return address for indirect JSL
    PHK : PEA .end-1

    ; Y = Argument
    LDA [!DP_CurrentMenu] : TAY

    LDX #$0000
    JML.w [!DP_JSLTarget]

  .end
    %ai16()
    RTS
}

execute_jsl:
{
    ; <, > and X should do nothing here
    ; also ignore input held flag
    LDA !ram_cm_controller : BIT #$0341 : BNE .end

    ; !DP_JSLTarget = JSL target
    LDA [!DP_CurrentMenu] : INC !DP_CurrentMenu : INC !DP_CurrentMenu : STA !DP_JSLTarget

    ; Set return address for indirect JSL
    LDA !ram_cm_menu_bank : STA !DP_JSLTarget+2
    PHK : PEA .end-1

    ; Y = Argument
    LDA [!DP_CurrentMenu] : TAY

    LDX #$0000
    JML.w [!DP_JSLTarget]

  .end
    %ai16()
    RTS
}

execute_submenu:
{
    ; <, > and X should do nothing here
    ; also ignore input held flag
    LDA !ram_cm_controller : BIT #$0341 : BNE .end

    ; !DP_JSLTarget = JSL target
    LDA [!DP_CurrentMenu] : INC !DP_CurrentMenu : INC !DP_CurrentMenu : STA !DP_JSLTarget

    ; Set bank of action_submenu
    ; instead of the new menu's bank
    LDA.w #action_submenu>>16 : STA !DP_JSLTarget+2

    ; Set return address for indirect JSL
    PHK : PEA .end-1

    ; Y = Argument
    LDA [!DP_CurrentMenu] : TAY

    LDX #$0000
    JML.w [!DP_JSLTarget]

  .end
    %ai16()
    RTS
}

execute_custom_preset:
{
    ; check if X or Y newly pressed
    LDA !IH_CONTROLLER_PRI_NEW : BIT !CTRL_Y : BNE .toggleDisplay
    LDA !IH_CONTROLLER_PRI_NEW : BIT !CTRL_X : BEQ .checkLeftRight

    ; enter keyboard editing mode
    ; get slot number * 2 in !DP_CtrlInput
    LDA [!DP_CurrentMenu] : AND #$00FF : ASL : STA !DP_CtrlInput
    ; slot number * $18 = name index
    ASL #2 : STA !DP_Temp : ASL : ADC !DP_Temp : TAX
    CLC : ADC.w #!sram_custom_preset_names : STA !DP_Address
    LDA.w #!sram_custom_preset_names>>16 : STA !DP_Address+2

    ; check if custom preset name exists
    LDX !DP_CtrlInput : LDA !sram_custom_preset_safewords,X : CMP #$5AFE : BNE .keyboardMode
    ; store SAFE word to indicate a name already exists
    STA !DP_KB_Control
    ; load existing name
    LDX #$0016 : TXY
-   LDA [!DP_Address],Y : STA !ram_cm_keyboard_buffer,X
    DEX #2
    DEY #2 : BPL -

  .keyboardMode
    ; launch keyboard mode
    JSL kb_ctrl_mode : BCC .redrawScreen
    ; mark preset slot as having a custom name
    LDX !DP_CtrlInput : LDA #$5AFE : STA !sram_custom_preset_safewords,X
    BRA .redrawScreen

  .toggleDisplay
    ; swap between room name and Samus data
    LDA !ram_cm_custom_preset_labels : BEQ .turnOn
    LDA #$0000 : STA !ram_cm_custom_preset_labels
    BRA .redrawScreen
  .turnOn
    LDA #$0001 : STA !ram_cm_custom_preset_labels

  .redrawScreen
    JSL cm_draw
    %sfxmove()
    RTS

  .checkLeftRight
    ; don't activate submenu on left/right
    LDA !IH_CONTROLLER_PRI_NEW : BIT !IH_INPUT_LEFTRIGHT : BNE .done

    ; set preset slot and return to the previous menu
    %a8()
    LDA [!DP_CurrentMenu] : STA !sram_custom_preset_slot
    %a16()
    %sfxconfirm()
    JSL cm_go_back

  .done
    RTS
}

execute_ram_watch:
{
    ; do nothing
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
    LDA $4214 : STA !DP_Temp
    LDA $4216 : STA $4204

    %a8()
    ; divide by 10
    LDA #$0A : STA $4206

    %a16()
    PEA $0000 : PLA ; wait for math

    ; store result and remainder, divide the rest
    LDA $4214 : STA !DP_SecondDigit ; tens
    LDA $4216 : STA !DP_ThirdDigit ; ones
    LDA !DP_Temp : STA $4204

    %a8()
    ; divide by 10
    LDA #$0A : STA $4206

    %a16()
    PEA $0000 : PLA ; wait for math

    ; store result and remainder
    LDA $4214 : STA !DP_Temp ; thousands
    LDA $4216 : STA !DP_FirstDigit ; hundreds

    RTS
}

cm_reverse_hex2dec:
{
; Reconstructs a 16bit decimal number from individual digit values
    LDA !DP_Temp
    %ai8()
    STA $211B : XBA : STA $211B ; Thousands
    LDY #$0A : STY $211C ; multiply by 10
    %a16()
    LDA $2134 : CLC : ADC !DP_FirstDigit ; add Hundreds
    %a8()
    STA $211B : XBA : STA $211B
    STY $211C ; multiply by 10
    %a16()
    LDA $2134 : CLC : ADC !DP_SecondDigit ; add Tens
    %a8()
    STA $211B : XBA : STA $211B 
    STY $211C ; multiply by 10
    %ai16()
    LDA $2134 : CLC : ADC !DP_ThirdDigit : STA !DP_DigitValue ; add Ones
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
