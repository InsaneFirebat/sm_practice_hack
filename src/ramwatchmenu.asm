; ---------------
; RAM Watch Menus
; ---------------

ih_prepare_ram_watch_menu:
    LDA !ram_watch_left : XBA : AND #$00FF : STA !ram_cm_watch_left_hi
    LDA !ram_watch_left : AND #$00FF : STA !ram_cm_watch_left_lo
    LDA !ram_watch_right : XBA : AND #$00FF : STA !ram_cm_watch_right_hi
    LDA !ram_watch_right : AND #$00FF : STA !ram_cm_watch_right_lo
    LDA !ram_watch_edit_left : XBA : AND #$00FF : STA !ram_cm_watch_edit_left_hi
    LDA !ram_watch_edit_left : AND #$00FF : STA !ram_cm_watch_edit_left_lo
    LDA !ram_watch_edit_right : XBA : AND #$00FF : STA !ram_cm_watch_edit_right_hi
    LDA !ram_watch_edit_right : AND #$00FF : STA !ram_cm_watch_edit_right_lo
    LDA !ram_watch_left_index : XBA : AND #$00FF : STA !ram_cm_watch_left_index_hi
    LDA !ram_watch_left_index : AND #$00FF : STA !ram_cm_watch_left_index_lo
    LDA !ram_watch_right_index : XBA : AND #$00FF : STA !ram_cm_watch_right_index_hi
    LDA !ram_watch_right_index : AND #$00FF : STA !ram_cm_watch_right_index_lo
    LDA #$0000 : STA !ram_cm_watch_enemy_property : STA !ram_cm_watch_enemy_index
    STA !ram_cm_watch_enemy_side

    ; See if we can better initialize enemy properties and indices
    LDA !ram_watch_left : CMP #$0F78 : BCC .checkright : CMP #$1778 : BCS .checkright
    BRA .found_enemy_ram

  .checkright
    LDA !ram_watch_right : CMP #$0F78 : BCC .submenu : CMP #$1778 : BCS .submenu

  .found_enemy_ram
    SEC : SBC #$0F78 : STA !ram_cm_watch_enemy_index
    AND #$003E : LSR : STA !ram_cm_watch_enemy_property
    LDA !ram_cm_watch_enemy_index : AND #$07C0
    ASL : ASL : XBA : STA !ram_cm_watch_enemy_index

  .submenu
    JMP action_submenu

RAMWatchMenu:
    dw ramwatch_enable
    dw ramwatch_bank
    dw ramwatch_write_mode
    dw ramwatch_goto_common
    dw #$FFFF
    dw ramwatch_left_hi
    dw ramwatch_left_lo
    dw ramwatch_left_index_hi
    dw ramwatch_left_index_lo
    dw ramwatch_left_edit_hi
    dw ramwatch_left_edit_lo
    dw ramwatch_execute_left
    dw ramwatch_lock_left
    dw #$FFFF
    dw ramwatch_right_hi
    dw ramwatch_right_lo
    dw ramwatch_right_index_hi
    dw ramwatch_right_index_lo
    dw ramwatch_right_edit_hi
    dw ramwatch_right_edit_lo
    dw ramwatch_execute_right
    dw ramwatch_lock_right
    dw #$0000
    %cm_header("READ AND WRITE TO MEMORY")

ramwatch_goto_common:
    %cm_submenu("Select Enemy Addresses", #RAMWatchCommonEnemyMenu)

RAMWatchCommonEnemyMenu:
    dw ramwatch_common_enemy_side
    dw ramwatch_common_enemy_apply
    dw #$FFFF
    dw ramwatch_common_enemy_property
    dw ramwatch_common_enemy_index
    dw #$0000
    %cm_header("SELECT FROM ENEMY RAM")

ramwatch_common_enemy_side:
    dw !ACTION_CHOICE
    dl #!ram_cm_watch_enemy_side
    dw #$0000
    db #$28, "RAM Watch Slot", #$FF
    db #$28, "  ADDRESS 1", #$FF
    db #$28, "  ADDRESS 2", #$FF
    db #$FF

ramwatch_common_enemy_apply:
    %cm_jsr("Apply to RAM Watch", .routine, #$0000)
  .routine
    LDA !ram_cm_watch_enemy_index
    XBA : LSR : LSR : TAX ; index * 40h = X

    LDA !ram_cm_watch_enemy_side : BEQ .left

    TXA : STA !ram_watch_right_index
    LDA !ram_cm_watch_enemy_property : ASL
    CLC : ADC #$0F78 : STA !ram_watch_right
    BRA .done

  .left
    TXA : STA !ram_watch_left_index
    LDA !ram_cm_watch_enemy_property : ASL
    CLC : ADC #$0F78 : STA !ram_watch_left

  .done
    LDA #$0000 : STA !ram_watch_bank
    LDY #RAMWatchMenu
    LDA !ram_cm_stack_index : DEC #2
    STA !ram_cm_stack_index
    JSR cm_go_back
    JSR cm_calculate_max
    JSR ih_prepare_ram_watch_menu
    LDA #!SOUND_MENU_JSR : JSL !SFX_LIB1
    RTS

ramwatch_common_enemy_property:
    dw !ACTION_CHOICE
    dl #!ram_cm_watch_enemy_property
    dw #$0000
    db #$28, "Set to Enemy  ", #$FF
    db #$28, "         ID", #$FF
    db #$28, " X POSITION", #$FF
    db #$28, "   X SUBPOS", #$FF
    db #$28, " Y POSITION", #$FF
    db #$28, "   Y SUBPOS", #$FF
    db #$28, "   X RADIUS", #$FF
    db #$28, "   Y RADIUS", #$FF
    db #$28, " PROPERTIES", #$FF
    db #$28, "EXTRA PROPS", #$FF
    db #$28, " AI HANDLER", #$FF
    db #$28, "     HEALTH", #$FF
    db #$28, "  SPRITEMAP", #$FF
    db #$28, "    COUNTER", #$FF
    db #$28, " INIT PARAM", #$FF
    db #$28, "      TIMER", #$FF
    db #$28, "PALETTE IDX", #$FF
    db #$28, "   VRAM IDX", #$FF
    db #$28, "      LAYER", #$FF
    db #$28, "FLASH TIMER", #$FF
    db #$28, "FROZE TIMER", #$FF
    db #$28, "   I FRAMES", #$FF
    db #$28, "SHAKE TIMER", #$FF
    db #$28, "FRAME COUNT", #$FF
    db #$28, "       BANK", #$FF
    db #$28, "   AI VAR 0", #$FF
    db #$28, "   AI VAR 1", #$FF
    db #$28, "   AI VAR 2", #$FF
    db #$28, "   AI VAR 3", #$FF
    db #$28, "   AI VAR 4", #$FF
    db #$28, "   AI VAR 5", #$FF
    db #$28, "    PARAM 1", #$FF
    db #$28, "    PARAM 2", #$FF
    db #$FF

ramwatch_common_enemy_index:
    %cm_numfield_hex("Set to Enemy Index", !ram_cm_watch_enemy_index, 0, 31, 1, 8, #$0000)

ramwatch_enable:
    %cm_jsr("Turn On RAM Watch", .routine, !IH_MODE_RAMWATCH_INDEX)
  .routine
    TYA : STA !sram_display_mode
    LDA #!SOUND_MENU_JSR : JSL !SFX_LIB1
    RTS

ramwatch_bank:
    dw !ACTION_CHOICE
    dl #!ram_watch_bank
    dw #$0000
    db #$28, "Select Bank", #$FF
    db #$28, "        $7E", #$FF
    db #$28, "        $7F", #$FF
    db #$28, "       SRAM", #$FF
    db #$FF

ramwatch_write_mode:
    dw !ACTION_CHOICE
    dl #!ram_watch_write_mode
    dw #$0000
    db #$28, "Write Mode", #$FF
    db #$28, "16BIT HI+LO", #$FF
    db #$28, "    8BIT LO", #$FF
    db #$FF

ramwatch_left_hi:
    %cm_numfield_hex("Address 1 High", !ram_cm_watch_left_hi, 0, 255, 1, 8, #.routine)
  .routine
    XBA : ORA !ram_cm_watch_left_lo
    STA !ram_watch_left
    RTS

ramwatch_left_lo:
    %cm_numfield_hex("Address 1 Low", !ram_cm_watch_left_lo, 0, 255, 1, 8, #.routine)
  .routine
    XBA : ORA !ram_cm_watch_left_hi
    XBA : STA !ram_watch_left
    RTS

ramwatch_left_index_hi:
    %cm_numfield_hex("Offset 1 High", !ram_cm_watch_left_index_hi, 0, 255, 1, 8, #.routine)
  .routine
    XBA : ORA !ram_cm_watch_left_index_lo
    STA !ram_watch_left_index
    RTS

ramwatch_left_index_lo:
    %cm_numfield_hex("Offset 1 Low", !ram_cm_watch_left_index_lo, 0, 255, 1, 8, #.routine)
  .routine
    XBA : ORA !ram_cm_watch_left_index_hi
    XBA : STA !ram_watch_left_index
    RTS

ramwatch_left_edit_hi:
    %cm_numfield_hex("Value 1 High", !ram_cm_watch_edit_left_hi, 0, 255, 1, 8, #.routine)
  .routine
    XBA : ORA !ram_cm_watch_edit_left_lo
    STA !ram_watch_edit_left
    RTS

ramwatch_left_edit_lo:
    %cm_numfield_hex("Value 1 Low", !ram_cm_watch_edit_left_lo, 0, 255, 1, 8, #.routine)
  .routine
    XBA : ORA !ram_cm_watch_edit_left_hi
    XBA : STA !ram_watch_edit_left
    RTS

ramwatch_right_hi:
    %cm_numfield_hex("Address 2 High", !ram_cm_watch_right_hi, 0, 255, 1, 8, #.routine)
  .routine
    XBA : ORA !ram_cm_watch_right_lo
    STA !ram_watch_right
    RTS

ramwatch_right_lo:
    %cm_numfield_hex("Address 2 Low", !ram_cm_watch_right_lo, 0, 255, 1, 8, #.routine)
  .routine
    XBA : ORA !ram_cm_watch_right_hi
    XBA : STA !ram_watch_right
    RTS

ramwatch_right_index_hi:
    %cm_numfield_hex("Offset 2 High", !ram_cm_watch_right_index_hi, 0, 255, 1, 8, #.routine)
  .routine
    XBA : ORA !ram_cm_watch_right_index_lo
    STA !ram_watch_right_index
    RTS

ramwatch_right_index_lo:
    %cm_numfield_hex("Offset 2 Low", !ram_cm_watch_right_index_lo, 0, 255, 1, 8, #.routine)
  .routine
    XBA : ORA !ram_cm_watch_right_index_hi
    XBA : STA !ram_watch_right_index
    RTS

ramwatch_right_edit_hi:
    %cm_numfield_hex("Value 2 High", !ram_cm_watch_edit_right_hi, 0, 255, 1, 8, #.routine)
  .routine
    XBA : ORA !ram_cm_watch_edit_right_lo
    STA !ram_watch_edit_right
    RTS

ramwatch_right_edit_lo:
    %cm_numfield_hex("Value 2 Low", !ram_cm_watch_edit_right_lo, 0, 255, 1, 8, #.routine)
  .routine
    XBA : ORA !ram_cm_watch_edit_right_hi
    XBA : STA !ram_watch_edit_right
    RTS

ramwatch_execute_left:
    %cm_jsr("Write to Address 1", #action_ramwatch_edit_left, #$0000)

ramwatch_execute_right:
    %cm_jsr("Write to Address 2", #action_ramwatch_edit_right, #$0000)

ramwatch_lock_left:
    %cm_toggle("Lock Value 1", !ram_watch_edit_lock_left, #$0001, #action_HUD_ramwatch)

ramwatch_lock_right:
    %cm_toggle("Lock Value 2", !ram_watch_edit_lock_right, #$0001, #action_HUD_ramwatch)

action_ramwatch_edit_left:
{
    LDA !ram_watch_left : CLC : ADC !ram_watch_left_index : TAX
    LDA !ram_watch_write_mode : BEQ +
    %a8()
+   LDA !ram_watch_bank : BEQ .bank7E
    DEC : BEQ .bank7F : BRA .bankSRAM
  .bank7E
    LDA !ram_watch_edit_left : STA $7E0000,X : BRA +
  .bank7F
    LDA !ram_watch_edit_left : STA $7F0000,X : BRA +
  .bankSRAM
    LDA !ram_watch_edit_left : STA $F00000,X
+   %a16()
    LDA !IH_MODE_RAMWATCH_INDEX : STA !sram_display_mode
    LDA #!SOUND_MENU_JSR : JSL !SFX_LIB1
    RTS
}

action_ramwatch_edit_right:
{
    LDA !ram_watch_right : CLC : ADC !ram_watch_right_index : TAX
    LDA !ram_watch_write_mode : BEQ +
    %a8()
+   LDA !ram_watch_bank : BEQ .bank7E
    DEC : BEQ .bank7F : BRA .bankSRAM
  .bank7E
    LDA !ram_watch_edit_right : STA $7E0000,X : BRA +
  .bank7F
    LDA !ram_watch_edit_right : STA $7F0000,X : BRA +
  .bankSRAM
    LDA !ram_watch_edit_right : STA $F00000,X
+   %a16()
    LDA !IH_MODE_RAMWATCH_INDEX : STA !sram_display_mode
    LDA #!SOUND_MENU_JSR : JSL !SFX_LIB1
    RTS
}

action_HUD_ramwatch:
{
    LDA !IH_MODE_RAMWATCH_INDEX : STA !sram_display_mode
    RTS
}

