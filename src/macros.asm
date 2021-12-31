macro ppu_off()
    LDA #$80 : STA $2100 : STA $13
    STZ $420C : LDA $9B : PHA : STZ $9B
    STZ $4200
endmacro

macro ppu_on()
    LDA #$A1 : STA $4200
    LDA #$0F : STA $13 : STA $2100
    PLA : STA $9B : STA $420C
endmacro

macro a8() ; A = 8-bit
    sep #$20
endmacro

macro a16() ; A = 16-bit
    rep #$20
endmacro

macro i8() ; X/Y = 8-bit
    sep #$10
endmacro

macro i16() ; X/Y = 16-bit
    rep #$10
endmacro

macro ai8() ; A + X/Y = 8-bit
    sep #$30
endmacro

macro ai16() ; A + X/Y = 16-bit
    rep #$30
endmacro

macro wdm()
    dw $4242
endmacro

macro sfxclick() ; play click sound lib1
    LDA #$0037 : JSL !SFX_LIB1
endmacro

macro sfxtype() ; play typing sound lib2
    LDA #$0045 : JSL !SFX_LIB2
endmacro

macro sfxpause() ; play pause menu sound lib1
    LDA #$0038 : JSL !SFX_LIB1
endmacro

macro sfxstatue() ; play statue break sound lib2
    LDA #$0019 : JSL !SFX_LIB2
endmacro

macro sfxbubble() ; play bubble sound lib2
    LDA #$0011 : JSL !SFX_LIB2
endmacro

macro sfxquake() ; play earthquake sound lib3
    LDA #$001E : JSL !SFX_LIB3
endmacro

macro sfxenergy() ; play energy drop sound lib2
    LDA #$0002 : JSL !SFX_LIB2
endmacro

macro sfxgrapple() ; play grapple sound lib1
    LDA #$0005 : JSL !SFX_LIB1
endmacro

macro sfxdoor() ; play door close sound lib3
    LDA #$0008 : JSL !SFX_LIB3
endmacro

macro sfxship() ; play ship close sound lib3
    LDA #$0015 : JSL !SFX_LIB3
endmacro

macro sfxmissile() ; play missile sound lib2
    LDA #$0003 : JSL !SFX_LIB2
endmacro

macro sfxdisengage() ; play refill disengage sound lib2
    LDA #$0038 : JSL !SFX_LIB2
endmacro

macro sfxbeep() ; play minimap movement beep sound lib1
    LDA #$0036 : JSL !SFX_LIB1
endmacro

macro sfxetecoon() ; play etecoon cry (required instrument) sound lib2
    LDA #$0033 : JSL !SFX_LIB2
endmacro

macro sfxdamage() ; play damage boost sound lib1
    LDA #$0035 : JSL !SFX_LIB1
endmacro

macro sfxshot() ; play credits shot sound lib1
    LDA #$0022 : JSL !SFX_LIB1
endmacro

macro sfxsave() ; play save station sound lib1
    LDA #$002E : JSL !SFX_LIB1
endmacro

macro sfxmove() ; Move Cursor
    LDA !sram_customsfx_move : JSL !SFX_LIB1
endmacro

macro sfxconfirm() ; Confirm Selection
    LDA !sram_customsfx_confirm : JSL !SFX_LIB1
endmacro

macro sfxtoggle() ; Toggle
    LDA !sram_customsfx_toggle : JSL !SFX_LIB1
endmacro

macro sfxnumber() ; Number Selection
    LDA !sram_customsfx_number : JSL !SFX_LIB1
endmacro

macro sfxgoback() ; Go Back
    LDA !sram_customsfx_goback : JSL !SFX_LIB1
endmacro
