
org $82EEE0
;    dw cutscenes_load_intro


org $8BB240
;    JSR cutscenes_load_ceres_arrival

if !FEATURE_PAL
org $8B92B5
else
org $8B930C
endif
    JSL cutscenes_nintendo_splash
    NOP : NOP


org !ORG_CUTSCENES
print pc, " cutscenes start"

cutscenes_nintendo_splash:
{
    LDX #$0078
    LDA !sram_cutscenes
    AND !CUTSCENE_SKIP_SPLASH
    BEQ .done
    LDX #$0001
  .done
    STX $0DE2
    RTL
}

cutscenes_load_intro:
{
    LDA !sram_cutscenes : BIT !CUTSCENE_SKIP_INTRO : BEQ .keep_intro
    LDA !sram_cutscenes : BIT !CUTSCENE_SKIP_CERES_ARRIVAL : BEQ .keep_ceres_arrival

    ; Skip intro and ceres arrival
    LDA #$C100
    STA $1F51
    JMP ($1F51)

  .keep_intro
    LDA #$A395
    STA $1F51
    JMP ($1F51)

  .keep_ceres_arrival
    JSR $BC08
    LDA #$B72F
    STA $1F51
    JMP ($1F51)
}

cutscenes_load_ceres_arrival:
{
    LDA !sram_cutscenes : BIT !CUTSCENE_SKIP_CERES_ARRIVAL : BEQ .keep_ceres_arrival

    ; Skip ceres arrival
    JSR $BC75
    LDA #$C100
    RTS

  .keep_ceres_arrival
    LDA #$B72F
    RTS
}

print pc, " cutscenes end"
warnpc $8BFA00 ; misc.asm


org $A987FC
cutscenes_mb_fake_death_check:
{
    BEQ .check_fast_mb
    CMP #$0001 : BNE $15
  .fast_mb
    JMP cutscenes_mb_fake_death_fast_init
  .check_fast_mb
    LDA !sram_cutscenes : BIT !CUTSCENE_FAST_MB : BNE .fast_mb
    JMP cutscenes_mb_fake_death_normal_init
}
warnpc $A98814

org $A9881E
    dw cutscenes_mb_fake_death_pause

org $A98842
    dw cutscenes_mb_fake_death_lock

org $A98879
    dw cutscenes_mb_fake_death_unlock

org $A98977
    dw cutscenes_mb_clear_bottom_left_tube

org $A989A9
    dw cutscenes_mb_clear_ceiling_column_9

org $A989DB
    dw cutscenes_mb_clear_ceiling_column_6

org $A98A03
    dw cutscenes_mb_clear_bottom_right_tube

org $A98A2B
    dw cutscenes_mb_clear_bottom_middle_left_tube

org $A98A5D
    dw cutscenes_mb_clear_ceiling_column_7

org $A98A8F
    dw cutscenes_mb_clear_ceiling_column_8

org $A98D68
    ; Do not initialize health here, wait until later
    dw cutscenes_mb_fake_death_setup_mb_fight_or_escape
    BRA $04

org $A98D80
    dw cutscenes_mb_fake_death_pause_phase_2

org $A98DBE
    dw cutscenes_mb_fake_death_load_tiles_phase_2

org $A98E47
    dw cutscenes_mb_fake_death_raise_mb

org $A98ECC
    JMP cutscenes_mb_choose_phase_2_or_3

org $A98EE9
    dw cutscenes_mb_shaking_head

org $A98F02
    dw cutscenes_mb_bring_head_back_up

org $A9AF07
    dw cutscenes_mb_death_move_to_back_of_room

org $A9AF48
    dw cutscenes_mb_death_first_stumble

org $A9B007
    dw cutscenes_mb_death_final_explosions

org $A9B127
    JMP cutscenes_mb_death_brain_falling

org $A9B167
    dw cutscenes_mb_death_load_corpse

org $A9B1AC
    dw cutscenes_mb_death_corpse_tips_over

org $A9B1EB
    ; Make dead MB invisible and intangible, in case we jump here from a preset
    ORA #$0500


org !ORG_CUTSCENES_MB
print pc, " cutscenes MB start"

cutscenes_mb_fake_death_fast_init:
{
    ; Set health to non-zero value indicating we want fast logic
    ; If loading a preset, certain flags may already be set
    ; which allow MB to take damage, so setting value high,
    ; but also set below 18000 to avoid confusion with vanilla logic
    LDA #$464F : STA $0FCC

    ; If MB already defeated, reset health to full to simulate baby metroid refill
    LDA $7ED82D : BIT #$0002 : BEQ .end_refill
    LDA $7E09C4 : STA $7E09C2

  .end_refill
    ; Overwritten logic without the song
    STA $7E783A : STA $7E7800
    JSL $90A7E2

    JMP $8814
}

cutscenes_mb_fake_death_normal_init:
{
    ; Overwritten logic with the song
    LDA #$0001 : STA $7E783A : STA $7E7800
    JSL $90A7E2
    LDA #$0006
    JSL $808FC1

    JMP $8814
}

cutscenes_mb_fake_death_pause:
{
    LDA $0FCC : BEQ .continue
    LDA #$0001 : STA $0FB2

  .continue
    LDA #$8829
    STA $0FA8
    JMP ($0FA8)
}

cutscenes_mb_fake_death_lock:
{
    LDA $0FCC : BEQ .continue
    LDA #$0001 : STA $0FB2

  .continue
    LDA #cutscenes_mb_fake_death_music
    STA $0FA8
    ; Fall through to next method
}

cutscenes_mb_fake_death_music:
{
    DEC $0FB2 : BPL .return

    LDA #$0000 : JSL !MUSIC_ROUTINE
    LDA $7ED82D : BIT #$0002 : BEQ .phase2
    LDA $7ED821 : BIT #$0040 : BEQ .phase3
    LDA #$FF24
    BRA .load_music
  .phase2
    LDA #$FF21
    BRA .load_music
  .phase3
    LDA #$FF48
  .load_music
    JSL !MUSIC_ROUTINE

    LDA #$886C
    STA $0FA8

    LDA #$000C : STA $0FB2
    LDA $0FCC : BEQ .continue
    LDA #$0002 : STA $0FB2
  .continue
    JMP ($0FA8)

  .return
    RTS
}

cutscenes_mb_fake_death_unlock:
{
    LDA $0FCC : BEQ .continue
    LDA #$0001 : STA $0FB2

  .continue
    LDA #$8884
    STA $0FA8
    JMP ($0FA8)
}

cutscenes_mb_clear_bottom_left_tube:
{
    LDA $0FCC : BEQ .continue
    LDA #$0010 : STA $0FF2

  .continue
    LDA #$8983
    STA $0FF0
    JMP ($0FF0)
}

cutscenes_mb_clear_ceiling_column_9:
{
    LDA $0FCC : BEQ .continue
    LDA #$0010 : STA $0FF2

  .continue
    LDA #$89B5
    STA $0FF0
    JMP ($0FF0)
}

cutscenes_mb_clear_ceiling_column_6:
{
    LDA $0FCC : BEQ .continue
    LDA #$0010 : STA $0FF2

  .continue
    LDA #$89E7
    STA $0FF0
    JMP ($0FF0)
}

cutscenes_mb_clear_bottom_right_tube:
{
    LDA $0FCC : BEQ .continue
    LDA #$0010 : STA $0FF2

  .continue
    LDA #$8A0F
    STA $0FF0
    JMP ($0FF0)
}

cutscenes_mb_clear_bottom_middle_left_tube:
{
    LDA $0FCC : BEQ .continue
    LDA #$0010 : STA $0FF2

  .continue
    LDA #$8A37
    STA $0FF0
    JMP ($0FF0)
}

cutscenes_mb_clear_ceiling_column_7:
{
    LDA $0FCC : BEQ .continue
    LDA #$0010 : STA $0FF2

  .continue
    LDA #$8A69
    STA $0FF0
    JMP ($0FF0)
}

cutscenes_mb_clear_ceiling_column_8:
{
    LDA $0FCC : BEQ .continue
    LDA #$0010 : STA $0FF2

  .continue
    LDA #$8A9B
    STA $0FF0
    JMP ($0FF0)
}

cutscenes_mb_fake_death_setup_mb_fight_or_escape:
{
    LDA $7ED821 : BIT #$0040 : BEQ .mb

    ; Disable MB hitboxes
    LDA #$0000 : STA $7E7808
    ; Jump to escape sequence
    JMP $B1E8

  .mb
    LDA $0FCC : BEQ .init_health
    LDA #$0000 : STA $0FB2 : STA $0FCC
    BRA .continue

  .init_health
    LDA #$4650 : STA $0FCC

  .continue
    LDA #$8D79
    STA $0FA8
    JMP ($0FA8)
}

cutscenes_mb_fake_death_pause_phase_2:
{
    LDA $0FCC : BNE .continue
    LDA #$0000 : STA $0FB2

  .continue
    LDA #$8D8B
    STA $0FA8
    JMP ($0FA8)
}

cutscenes_mb_fake_death_load_tiles_phase_2:
{
    LDA $0FCC : BNE .continue
    LDA #$0000 : STA $0FB2

  .continue
    LDA #$8DC3
    STA $0FA8
    JMP ($0FA8)
}

cutscenes_mb_fake_death_raise_mb:
{
    LDA $0FCC : BNE .continue
    LDA !FRAME_COUNTER : AND #$0001 : BNE .done
    JMP $8E55

  .continue
    LDA #$8E4D
    STA $0FA8
    JMP ($0FA8)

  .done
    RTS
}

cutscenes_mb_choose_phase_2_or_3:
{
    LDA $7ED82D : BIT #$0002 : BEQ .phase2

    ; Phase 3
    LDA #$0004 : STA $7E7800

    ; 36000 health
    LDA #$8CA0 : STA $0FCC

    ; Enable health-based palette
    TDC : STA $7E7860 : STA $7E7868
    INC : STA $7E7862
    INC : STA $7E783E

    ; Allow Samus to stand up and enable hyper beam
    LDA #$0017 : JSL $90F084
    LDA #$0003 : JSL $91E4AD
    JMP $C1F5

  .phase2
    LDA #$0002 : STA $7E7800

    ; 18000 health
    LDA #$4650 : STA $0FCC
    JMP $8ED1
}

cutscenes_mb_shaking_head:
{
    LDA !sram_cutscenes : BIT !CUTSCENE_FAST_MB : BEQ .continue
    LDA #$000A : STA $0FB2

  .continue
    LDA #$8EF5
    STA $0FA8
    JMP ($0FA8)
}

cutscenes_mb_bring_head_back_up:
{
    LDA !sram_cutscenes : BIT !CUTSCENE_FAST_MB : BEQ .continue
    LDA #$0060 : STA $0FB2

  .continue
    LDA #$8F14
    STA $0FA8
    JMP ($0FA8)
}

cutscenes_mb_death_move_to_back_of_room:
{
    LDA !sram_cutscenes : BIT !CUTSCENE_FAST_MB : BEQ .continue
    LDA #$000A : STA $0FB2

  .continue
    LDA #$AF12
    STA $0FA8
    JMP ($0FA8)
}

cutscenes_mb_death_first_stumble:
{
    LDA !sram_cutscenes : BIT !CUTSCENE_FAST_MB : BEQ .continue
    LDA #$000A : STA $0FB2

  .continue
    LDA #$AF54
    STA $0FA8
    JMP ($0FA8)
}

cutscenes_mb_death_final_explosions:
{
    LDA !sram_cutscenes : BIT !CUTSCENE_FAST_MB : BEQ .continue
    LDA #$0000 : STA $0FB2

  .continue
    LDA #$B013
    STA $0FA8
    JMP ($0FA8)
}

cutscenes_mb_death_brain_falling:
{
    LDA !sram_cutscenes : BIT !CUTSCENE_FAST_MB : BEQ .continue
    LDA #cutscenes_mb_death_brain_falling_fast
    STA $0FA8
    JMP ($0FA8)

  .continue
    LDA #$B12D
    STA $0FA8
    JMP ($0FA8)
}

cutscenes_mb_death_brain_falling_fast:
{
    ; Vanilla logic except add $40 instead of $20
    LDA $0FB2 : CLC : ADC #$0040 : STA $0FB2
    XBA : AND #$00FF : CLC : ADC $0FBE
    CMP #$00C4 : BCC .still_falling

    JMP $B144

  .still_falling
    STA $0FBE
    RTS
}

cutscenes_mb_death_load_corpse:
{
    LDA !sram_cutscenes : BIT !CUTSCENE_FAST_MB : BEQ .continue
    LDA #$0000 : STA $0FB2

  .continue
    LDA #$B173
    STA $0FA8
    JMP ($0FA8)
}

cutscenes_mb_death_corpse_tips_over:
{
    LDA !sram_cutscenes : BIT !CUTSCENE_FAST_MB : BEQ .continue
    LDA #$0030 : STA $0FB2

  .continue
    LDA #$B1B8
    STA $0FA8
    JMP ($0FA8)
}

print pc, " cutscenes MB end"

