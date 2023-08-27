;=======================================================
;Patches to support the minimap
;=======================================================

org $809AF3
    JSL mm_initialize_minimap

org $809B4E      ; moved to overwrite Junkoid's HUD hijack
    JMP $9BFB

org $82AEAF      ; routine to remove auto reserve icon on HUD from equip screen
    JSR mm_refresh_reserves

org $82AED9      ; routine to draw auto reserve icon on HUD from equip screen
    JSR mm_refresh_reserves

org $90A91B
    LDA !ram_minimap : BNE .update_minimap
    RTL
  .update_minimap
    JMP mm_update_minimap

org $90A97E
    JMP mm_inc_tile_count

org $90A7EE      ; only clear minimap if it is visible
    LDA !ram_minimap : BEQ .skip_minimap
    JMP mm_clear_boss_room_tiles

org $90A80A      ; normally runs after minimap grid has been drawn
    .skip_minimap

org $8282E5      ; write and clear tiles to VRAM
    JSR mm_write_and_clear_hud_tiles
    BRA .write_next_tiles

org $828305
    .write_next_tiles

org $828EB8      ; write and clear tiles to VRAM
    JSR mm_write_and_clear_hud_tiles
    PLP
    RTL

org $82E488      ; write tiles to VRAM
    JMP mm_write_hud_tiles_during_transition

org $80D018      ; move magic bolt icon
    LDA $D1A3 : STA $7EC61A
    LDA $D1A5 : STA $7EC61E
    LDA $D1A7 : STA $7EC620
    LDA $D1A9 : STA $7EC65A
    LDA $D1AB : STA $7EC65E
    LDA $D1AD : STA $7EC660
warnpc $80D042

org $80D051      ; move magic bolt icon
    LDA $99A3 : STA $7EC61A
    LDA $99A5 : STA $7EC61E
    LDA $99A7 : STA $7EC620
    LDA $99A9 : STA $7EC65A
    LDA $99AB : STA $7EC65E
    LDA $99AD : STA $7EC660
warnpc $80D07B

org $80D0A3      ; move baseball icon
    LDX #$001C

org $80D0AB      ; move baseball icon
    LDX #$001C

org $80D123      ; move sparksuit icon
    LDX #$0022

org $80D12B      ; move sparksuit icon
    LDX #$0022

org $809D6E      ; move icon highlight offsets
    dw $0014     ; magic bolts
    dw $001C     ; baseballs
    dw $0022     ; sparksuits
    dw $0028     ; Grapple beam (dummy write)
    dw $002E     ; frog

org $809C10      ; move magic bolt count
    LDX #$0096

org $809B09      ; move magic bolt count
    LDX #$0096

org $809C26      ; move baseball count
    LDX #$009C

org $809B14      ; move baseball count
    LDX #$009C

org $809C4F      ; move sparksuit count
    LDX #$00A2

org $809B25      ; move sparksuit count
    LDX #$00A2


org $9AB200      ; graphics for HUD
hudgfx_bin:
incbin ../resources/Junkoid_hudgfx.bin


; Place minimap graphics in bank FD
org !ORG_MINIMAP_BANKFD
print pc, " minimap bankFD start"
mapgfx_bin:
incbin ../resources/Junkoid_mapgfx.bin

; Next block needs to be all zeros to clear a tilemap
fillbyte $00
fill 4096
print pc, " minimap bankFD end"


; The default HUD minimap should be cleared
org $80988B
    dw #$2C0F, #$2C0F, #$2C0F, #$2C0F, #$2C0F, #$2C0F, #$2C0F, #$2C0F, #$2C0F, #$2C0F, #$2C0F, #$2C0F, #$2C0F, #$2C0F, #$2C0F, #$2C0F
    dw #$2C0F, #$2C0F, #$2C0F, #$2C0F, #$2C0F, #$2C0F, #$2C0F, #$2C0F, #$2C0F, #$2C0F, #$2C0F, #$2C0F, #$2C0F, #$2C0F, #$2C0F, #$2C0F
    dw #$2C0F, #$2C0F, #$2C0F, #$2C0F, #$2C0F, #$2C0F, #$2C0F, #$2C0F, #$2C0F, #$2C0F, #$2C0F, #$2C0F, #$2C0F, #$2C0F, #$2C0F, #$2C0F
    dw #$2C0F, #$2C0F, #$2C0F, #$2C0F, #$2C0F, #$2C0F, #$2C0F, #$2C0F, #$2C0F, #$2C0F, #$2C0F, #$2C0F, #$2C0F, #$2C0F, #$2C0F, #$2C0F
    dw #$2C0F, #$2C0F, #$2C0F, #$2C0F, #$2C0F, #$2C0F, #$2C0F, #$2C0F, #$2C0F, #$2C0F, #$2C0F, #$2C0F, #$2C0F, #$2C0F, #$2C0F, #$2C0F
    dw #$2C0F, #$2C0F, #$2C0F, #$2C0F, #$2C0F, #$2C0F, #$2C0F, #$2C0F, #$2C0F, #$2C0F, #$2C0F, #$2C0F, #$2C0F, #$2C0F, #$2C0F, #$2C0F
    dw #$2C0F, #$2C0F, #$2C0F, #$2C0F, #$2C0F, #$2C0F, #$2C0F, #$2C0F, #$2C0F, #$2C0F, #$2C0F, #$2C0F, #$2C0F, #$2C0F, #$2C0F, #$2C0F
    dw #$2C0F, #$2C0F, #$2C0F, #$2C0F, #$2C0F, #$2C0F, #$2C0F, #$2C0F, #$2C0F, #$2C0F, #$2C0F, #$2C0F, #$2C0F, #$2C0F, #$2C0F, #$2C0F

; The default energy 0 text should be cleared
org $80994D
mm_default_HUD_energy:
    dw #$2C0F, #$2C0F, #$2C0F, #$2C0F, #$2C0F, #$2C0F


; Placed in bank 82 so that the jumps work
org !ORG_MINIMAP_BANK82
print pc, " minimap bank82 start"

mm_write_and_clear_hud_tiles:
{
    %i16()
    LDA !ram_minimap : BNE .minimap_vram

    ; Load in normal vram
    LDA #$80 : STA $2115 ; word-access, incr by 1
    LDX #$4000 : STX $2116 ; VRAM address (8000 in vram)
    LDX.w #hudgfx_bin : STX $4302 ; Source offset
    LDA.b #hudgfx_bin>>16 : STA $4304 ; Source bank
    LDX #$2000 : STX $4305 ; Size (0x10 = 1 tile)
    LDA #$01 : STA $4300 ; word, normal increment (DMA MODE)
    LDA #$18 : STA $4301 ; destination (VRAM write)
    LDA #$01 : STA $420B ; initiate DMA (channel 1)
    %i8()
    RTS

  .minimap_vram
    LDA #$80 : STA $2115 ; word-access, incr by 1
    LDX #$4000 : STX $2116 ; VRAM address (8000 in vram)
    LDX.w #mapgfx_bin : STX $4302 ; Source offset
    LDA.b #mapgfx_bin>>16 : STA $4304 ; Source bank
    LDX #$2000 : STX $4305 ; Size (0x10 = 1 tile)
    LDA #$01 : STA $4300 ; word, normal increment (DMA MODE)
    LDA #$18 : STA $4301 ; destination (VRAM write)
    LDA #$01 : STA $420B ; initiate DMA (channel 1)
    %i8()
    RTS
}

mm_write_hud_tiles_during_transition:
{
    LDA !ram_minimap : BNE .mm

    ; Load in normal vram
    JSR $E039
    dl hudgfx_bin
    dw $4000
    dw $1000
    JMP $E492  ; resume logic

  .mm
    JSR $E039
    dl mapgfx_bin
    dw $4000
    dw $1000
    JMP $E492  ; resume logic
}

mm_refresh_reserves:
{
    LDA #$FFFF : STA !ram_reserves_last
    RTS
}

print pc, " minimap bank82 end"
warnpc !ORG_PRESETS_BANK82


; Placed in bank 90 so that the jumps work
org !ORG_MINIMAP_BANK90
print pc, " minimap bank90 start"

mm_initialize_minimap:
{
    ; If we just left Ceres, increment segment timer
    LDA !GAMEMODE : AND #$00FF : CMP #$0006 : BNE .init_minimap
    LDA #$0000 : STA $12 : STA $14 : STA !ram_room_has_set_rng
    STA !ram_realtime_room : STA !ram_last_realtime_room
    STA !ram_gametime_room : STA !ram_last_gametime_room
    STA !ram_last_room_lag : STA !ram_last_door_lag_frames : STA !ram_transition_counter

    ; adding 1:13 to seg timer to account for missed frames between Ceres and Zebes
    LDA !ram_seg_rt_frames : CLC : ADC #$000D : STA !ram_seg_rt_frames
    CMP #$003C : BMI .add_seconds
    SEC : SBC #$003C : STA !ram_seg_rt_frames : INC $12

  .add_seconds
    LDA !ram_seg_rt_seconds : CLC : ADC #$0001 : ADC $12 : STA !ram_seg_rt_seconds
    CMP #$003C : BMI .add_minutes
    SEC : SBC #$003C : STA !ram_seg_rt_seconds : INC $14

  .add_minutes
    LDA $14 : BEQ .init_minimap : CLC : ADC !ram_seg_rt_minutes : STA !ram_seg_rt_minutes

  .init_minimap
    LDA !ram_minimap : BEQ .skip_minimap
    JMP $A8EF  ; resume original logic

  .skip_minimap
    RTL
}

mm_update_minimap:
{
    PHP
    %ai16()
    LDA $05F7 : BNE .skip_minimap
    JMP $A925  ; minimap is enabled

  .skip_minimap
    PLP
    RTL
}

mm_inc_tile_count:
{
    ; Check if tile is already set
    LDA $07F7,X
    ORA $AC04,Y
    CMP $07F7,X : BEQ .done

    ; Set tile and increment counter
    STA $07F7,X
    REP #$20
    LDA !ram_map_counter : INC : STA !ram_map_counter
    SEP #$20

  .done
    JMP $A987  ; resume original logic
}

mm_clear_boss_room_tiles:
{
    LDA #$2C1F
    LDX #$0000
  .loop
    STA !HUD_TILEMAP+$3C,X
    STA !HUD_TILEMAP+$7C,X
    STA !HUD_TILEMAP+$BC,X
    INX : INX : CPX #$000A : BMI .loop
    JMP $A80A
}

print pc, " minimap bank90 end"

