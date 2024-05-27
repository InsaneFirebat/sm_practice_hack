; ------------
; Firebat Menu
; ------------

pushpc
org $85D000
print pc, " mainmenuu IFBmenu start"

IFBMenu:
if !FEATURE_VANILLAHUD
else
    dw #ifb_customizehud
endif
    dw #$FFFF
    dw #ifb_brb
    dw #ifb_presetrando
if !FEATURE_EXTRAS
    dw #$FFFF
    dw #ifb_noclip
    dw #ifb_nosteam
endif
    dw #$FFFF
    dw #ifb_capture_cropping
    dw #$FFFF
    dw #ifb_demo_wait_timer
    dw #$FFFF
    dw #ifb_factory_reset
if !FEATURE_DEV
    dw #$FFFF
    dw #ifb_emu_test
endif
    dw #$0000
    %cm_header("CUSTOM ROMS ONLY")
    %cm_footer("MODIFIED BY INSANEFIREBAT")

ifb_customizehud:
    dw !ACTION_CHOICE
    dl #!sram_number_gfx_choice
    dw #.routine
    db #$28, "HUD Number Font", #$FF
    db #$28, "    DEFAULT", #$FF
    db #$28, "       LTTP", #$FF
    db #$28, "     KLONOA", #$FF
    db #$28, "      TI-83", #$FF
    db #$28, "  SHIN-CHAN", #$FF
    db #$28, "        SMT", #$FF
    db #$28, "        SMW", #$FF
    db #$28, "        DKC", #$FF
    db #$28, "       ZAMN", #$FF
    db #$28, "    EMERALD", #$FF
    db #$28, " EARTHBOUND", #$FF
    db #$28, "       FFVI", #$FF
    db #$28, "    LUFIA 2", #$FF
    db #$28, "  GOONIES 2", #$FF
    db #$28, "    PAC-MAN", #$FF
    db #$28, "       DOOM", #$FF
    db #$28, "  UNDERTALE", #$FF
    db #$28, "        ???", #$FF
    db #$28, "   SKYROADS", #$FF
    db #$28, "    YOSHI'S", #$FF
    db #$28, "     NOT-SM", #$FF
    db #$28, "   TAZMANIA", #$FF
    db #$28, " BLACK BASS", #$FF
    db #$FF
  .routine
    ; check if already on submenu
    LDA !DP_MenuIndices : CMP.w #NumberGFXMenu : BEQ .uploadGFX

    ; don't increment address if A/X/Y pressed
    LDA !IH_CONTROLLER_PRI_NEW : BIT #$40C0 : BEQ .submenu
    LDA !sram_number_gfx_choice : DEC : STA !sram_number_gfx_choice

  .submenu
    ; upload new GFX first
    JSL ifb_customizehud_uploadGFX
    ; jump to submenu
    LDY #NumberGFXMenu
    %submenu_jump()

  .uploadGFX
    ; wait for vertical blanking before uploading GFX
    PHB : PEA $0000 : PLB : PLB
    ; multiply by 100h and add to addr
    LDA !sram_number_gfx_choice : XBA
    CLC : ADC.w #NumberGFXChoice : TAY

    JSL cm_wait_for_lag_frame
    %a8()
    ; DMA number GFX to second to last row ($E0-EF)
    LDA #$80 : STA $2115 ; word access, inc by 1
    LDX #$4700 : STX $2116 ; VRAM addr ($4700 x 2 = $8E00)
    STY $4302 ; src addr
    LDA.b #NumberGFXChoice>>16 : STA $4304 ; src bank
    LDX #$0100 : STX $4305 ; size
    LDA #$01 : STA $4300 ; word, normal increment (DMA MODE)
    LDA #$18 : STA $4301 ; destination (VRAM write)
    LDA #$01 : STA $420B ; initiate DMA (channel 1)

    %ai16()
    PLB
    RTL

NumberGFXMenu:
    dw ifb_customizehud
    dw #$FFFF
    dw ifb_numbergfx_display
    dw #$0000
    %cm_header("PREVIEW NUMBER GFX")

ifb_numbergfx_display:
; manual cm_jsl for custom text
  .dm_actionIndex
    dw !ACTION_JSL
  .dm_jsl
    dw #.routine
  .dm_arg
    dw #$0000
  .dm_text
    db #$3C, "     "
    db #$E9, #$E0, #$E1, #$E2, #$E3, #$E4, #$E5, #$E6
    db #$E7, #$E8, #$EA, #$EB, #$EC, #$ED, #$EE, #$EF
    db #$FF
  .routine
    ; set cursor back to first position
    LDX !ram_cm_stack_index
    LDA #$0000 : STA !ram_cm_cursor_stack,X
    %sfxfail()
    RTL

ifb_brb:
    %cm_submenu(">BRB Screen", #BRBMenu)

ifb_presetrando:
    %cm_submenu(">Preset Randomizer", #PresetRandoMenu)

if !FEATURE_EXTRAS
ifb_noclip:
    %cm_toggle("Walk Through Walls", !ram_noclip, #$0001, #0)

ifb_nosteam:
    %cm_toggle("No Steam Collision", !ram_steamcollision, #$0001, #0)
endif

ifb_capture_cropping:
    %cm_submenu(">Capture Cropping Mode", #CaptureCroppingMenu)

ifb_demo_wait_timer:
    %cm_numfield_word("Demo Timer (frames)", !sram_demo_timer, 1, 9999, 1, 20, #0)

ifb_factory_reset:
    %cm_submenu(">Factory Reset", #FactoryResetConfirm)

if !FEATURE_DEV
ifb_emu_test:
    %cm_jsl("Detect Emulator Inaccuracy", .routine, #0)
  .routine
    ; 80 / 10 = 8
    LDA #$0050 : STA $4204
    %a8()
    LDA #$0A : STA $4206
    %a16()
    LDA $4214 : CMP #$0008 : BEQ .badEmu
    %sfxconfirm()
    RTL

  .badEmu
    ; didn't wait for math
    ; load some stuff for the crash handler
    LDA #$BADD
    LDX #$F00D
    LDY #$DEAD
    BRK #$9F
endif


; --------
; BRB Menu
; --------

BRBMenu:
    dw ifb_brb_screen
    dw #$FFFF
    dw ifb_brb_timer_mode
    dw ifb_brb_timer_min
    dw ifb_brb_timer_sec
    dw ifb_brb_timer_clear
    dw #$FFFF
    dw ifb_brb_cycle_timer
    dw ifb_brb_palette_cycle
    dw #$FFFF
    dw ifb_brb_scroll
    dw #$FFFF
;    dw #ifb_soundtest_goto_music ; moved to different bank
    dw #ifb_game_music_toggle
    dw #$0000
    %cm_header("BRB SCREEN MENU")

ifb_brb_screen:
    %cm_jsl("Launch BRB Screen", .routine, #0)
  .routine
    JSL cm_brb_loop
    JSL cm_wait_for_lag_frame
    JSL cm_transfer_custom_tileset
    JSL cm_refresh_cgram_long
    RTL

ifb_brb_timer_mode:
    dw !ACTION_CHOICE
    dl #!ram_cm_brb_timer_mode
    dw #$0000
    db #$28, "Timer Mode", #$FF
    db #$28, "        OFF", #$FF
    db #$28, "   COUNT UP", #$FF
    db #$28, " COUNT DOWN", #$FF
    db #$FF

ifb_brb_timer_min:
    %cm_numfield("Minutes on Timer", !ram_cm_brb_mins, 0, 99, 1, 5, #0)

ifb_brb_timer_sec:
    %cm_numfield("Seconds on Timer", !ram_cm_brb_secs, 0, 59, 1, 5, #0)

ifb_brb_timer_clear:
    %cm_jsl("Clear Timer", .routine, #0)
  .routine
    TYA : STA !ram_cm_brb_mins
    STA !ram_cm_brb_secs : STA !ram_cm_brb_frames
    RTL

ifb_brb_cycle_timer:
    %cm_numfield_word("Cycle Timer (seconds)", !ram_cm_brb_set_cycle, 1, 512, 1, 10, .routine)
  .routine
    LDA !ram_cm_brb_set_cycle : BNE +
    LDA #$0009 ; default to ~10s
+   ASL #6 : STA !ram_cm_brb_cycle_time
    RTL

ifb_brb_palette_cycle:
    %cm_toggle_bit_inverted("Cycle Palettes", !ram_cm_brb_palette, #$FFFF, #0)

ifb_brb_scroll:
    %cm_toggle("Screen Scrolling", !ram_cm_scroll, #$0001, #0)

ifb_game_music_toggle:
    dw !ACTION_CHOICE
    dl #!sram_music_toggle
    dw .routine
    db #$28, "Music", #$FF
    db #$28, "        OFF", #$FF
    db #$28, "         ON", #$FF
    db #$28, "   FAST OFF", #$FF
    db #$28, " PRESET OFF", #$FF
    db #$FF
  .routine
    ; Clear music queue
    STZ $0629 : STZ $062B : STZ $062D : STZ $062F
    STZ $0631 : STZ $0633 : STZ $0635 : STZ $0637
    STZ $0639 : STZ $063B : STZ $063D : STZ $063F
    CMP #$0001 : BEQ .resume_music
    STZ $2140
    RTL
  .resume_music
    LDA !MUSIC_DATA : CLC : ADC #$FF00 : STZ !MUSIC_DATA : JSL !MUSIC_ROUTINE
    LDA !MUSIC_TRACK : STZ !MUSIC_TRACK : JSL !MUSIC_ROUTINE
    RTL

print pc, " BRB start"
incsrc BRBmenu.asm
print pc, " BRB end"


; ------------
; Preset Rando
; ------------

PresetRandoMenu:
    dw #presetrando_enable
    dw #$FFFF
    dw #presetrando_morph
    dw #presetrando_charge
    dw #presetrando_beampref
    dw #$FFFF
    dw #presetrando_etanks
    dw #presetrando_reserves
    dw #presetrando_missiles
    dw #presetrando_supers
    dw #presetrando_pbs
    dw #$0000
    %cm_header("RANDOMIZE PRESET EQUIP")

presetrando_enable: 
    %cm_toggle("Equipment Rando", !sram_presetrando, #$0001, #0)

presetrando_morph:
    %cm_toggle("Force Morph Ball", !sram_presetrando_morph, #$0001, #0)

presetrando_charge:
    %cm_toggle("Force Charge Beam", !sram_presetrando_charge, #$0001, #0)

presetrando_beampref:
    dw !ACTION_CHOICE
    dl #!sram_presetrando_beampref
    dw #$0000
    db #$28, "Beam Preference", #$FF
    db #$28, "     RANDOM", #$FF
    db #$28, "     SPAZER", #$FF
    db #$28, "     PLASMA", #$FF
    db #$FF

presetrando_etanks: 
    %cm_numfield("Max Energy Tanks", !sram_presetrando_max_etanks, 0, 14, 1, 2, #0)

presetrando_reserves: 
    %cm_numfield("Max Reserve Tanks", !sram_presetrando_max_reserves, 0, 4, 1, 1, #0)

presetrando_missiles: 
    %cm_numfield("Max Missile Pickups", !sram_presetrando_max_missiles, 0, 50, 1, 5, #0)

presetrando_supers: 
    %cm_numfield("Max Super Pickups", !sram_presetrando_max_supers, 0, 50, 1, 5, #0)

presetrando_pbs: 
    %cm_numfield("Max Power Bomb Pickups", !sram_presetrando_max_pbs, 0, 50, 1, 5, #0)


; ----------------
; Capture Cropping
; ----------------

CaptureCroppingMenu:
    dw #ifb_launch_crop_mode
    dw #$FFFF
    dw #ifb_crop_mode
    dw #ifb_crop_tile
    dw #$0000
    %cm_header("CAPTURE CROPPING MODE")

ifb_launch_crop_mode:
    %cm_jsl("Capture Crop Mode", .routine, #0)
  .routine
    JSL cm_crop_mode
    JSL cm_refresh_cgram_long
    RTL

ifb_crop_mode:
    dw !ACTION_CHOICE
    dl #!ram_crop_mode
    dw #$0000
    db #$28, "Drawing Method", #$FF
    db #$28, "     BORDER", #$FF
    db #$28, "       FILL", #$FF
    db #$FF

ifb_crop_tile:
    dw !ACTION_CHOICE
    dl #!ram_crop_tile
    dw #$0000
    db #$28, "Cropping Tile", #$FF
    db #$28, "          ", #$90, #$FF
    db #$28, "          ", #$91, #$FF
    db #$FF


; -------------
; Factory Reset
; -------------

FactoryResetConfirm:
    dw #ifb_factory_reset_abort
    dw #$FFFF
    dw #ifb_factory_reset_keep_presets
    dw #ifb_factory_reset_delete_presets
    dw #$0000
    %cm_header("KEEP CUSTOM PRESETS?")
    %cm_footer("THIS WILL REBOOT THE GAME")

ifb_factory_reset_abort:
    %cm_jsl("ABORT", #.routine, #$0000)
  .routine
    %sfxgoback()
    JSL cm_previous_menu
    RTL

ifb_factory_reset_keep_presets:
    %cm_jsl("Yes, keep my presets", #action_factory_reset, #$0000)

ifb_factory_reset_delete_presets:
    %cm_jsl("No, mark them as empty", .routine, #$0000)
  .routine
    TYX : TXA ; LDA/X/Y #$0000
-   STA !PRESET_SLOTS,X ; overwrite "5AFE" words
    ; inc and multiply Y by $200/$100 for next slot index
    INY : TYA : %presetslotsize()
    CPY !TOTAL_PRESET_SLOTS : BNE -
    ; continue into action_factory_reset

action_factory_reset:
{
    ; Wipe standard practice hack memory
    LDA #$0000 : LDX !WRAM_SIZE-2
-   STA !WRAM_START,X
    DEX #2 : BPL -

    ; Wipe custom practice hack memory
    LDX #$01FE
-   STA !SRAM_START+$100,X
    DEX #2 : BPL -

    ; Mark practice hack SRAM as outdated
    LDA #$FFFF : STA !sram_initialized

    ; Reboot
    ; I'd like to silence audio before doing this, but there isn't enough time
    JML $80841C
}

print pc, " mainmenuu IFBmenu end"
warnpc $85F800 ; gamemode.asm
pullpc
