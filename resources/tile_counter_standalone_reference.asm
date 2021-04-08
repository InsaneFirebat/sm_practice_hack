lorom

; Add tile counter for the Map Completion category

org $90A97E
print "Creating Tile Counter rom at: ", pc
	JMP $F63A
 
org $90F63A
	LDA $07F7,X
	ORA $AC04,Y
	CMP $07F7,X
	BEQ +
	STA $07F7,X
	REP #$20
	LDA $7ED86E
	INC A
	STA $7ED86E
	SEP #$20

+	JMP $A987

org $A2AC9A		 ;hijack, right after we check the Escape flag
	JSL ih_escape_draw : NOP : NOP



org $808455      ;hijack, runs as game is starting, JSR to RAM initialization to avoid bad values
	JML ih_init_code

org $90E6AA      ;hijack, runs on gamestate = 08 (main gameplay), handles most updating HUD information
	JSL ih_room_timer_code : NOP : NOP

org $9493FB      ;hijack, runs when Samus hits a door BTS
	JSL ih_door_trans_code
	
org $9493B8      ;hijack, runs when Samus hits a door BTS
	JSL ih_door_trans_code
	
org $82E764      ;hijack, runs when Samus is coming out of a room transition
	JSL ih_door_exit_code : RTS

;org $90A7F7      ;skip drawing minimap grid when entering boss rooms
;	BRA FinishDrawMinimap
	
;org $90A80A      ;normally runs after minimap grid has been drawn
;	FinishDrawMinimap:
;	LDA $179C

org $82894F      ;hijack, main game loop: runs EVERY frame (used for room transition timer)
	JSL ih_game_loop_code

org $9AB800		 ;graphics for menu cursor and input display
incbin resources\menugfx.bin

org $DFE000
print "InfoHud Main Bank Starting at: ", pc
ih_init_code:
	REP #$30
	PHA
	LDA #$0000
	STA $7FFB20  ;RAM initialization
	STA $7FFB16
	STA $7FFB14
	STA $7FFB10
	STA $7FFB12
	STA $7FFB02
	STA $7FFB0C
	STA $7FFB0E
	STA $7FFB2C
	STA $7FFB00
	STA $7FFB30
	STA $7FFB38	; dash counter
	STA $7FFB3A	; iframe counter
	STA $7FFB3C	; vertical speed
	STA $7FFB3E	; mother brain HP
	STA $7FFB40	; enemy HP
	STA $7FFB42
	STA $7FFB44
	STA $7FFB46
	STA $7FFB48
	STA $7FFB4A
	STA $7FFB4C
	STA $7FFB4E
	STA $7EFFFC ; slowdown mode
	STA $7FFB52 ; slowdown frames
	STA $7FFB60 ; display mode
	STA $7FFB62 ; test thing
	STA $7FFB64	; magic pants
	STA $7FFB66	; magic pants
	STA $7FFB70	; magic pants
	STA $7FFB72	; magic pants
	STA $7FFB74	; magic pants
	STA $7FFB80	; rerandomize
	STA $7FFB82	; phantoon rng
	STA $7FFB84	; phantoon rng
	STA $7FFB86	; phantoon rng
	STA $7FFB88	; phantoon rng
	STA $7FFB8A	; botwoon rng
	
	PLA
	JSL $8B9146
	JML $808459

;--- BEFORE ROOM TRANSITION ---
ih_door_trans_code: 
	PHA
	PHX
	PHY

	
	; save and reset timers
	LDA $7FFB16 : CMP #$0001 : BEQ FlagTrans 
	LDA #$0001 : STA $7FFB16

	; calculate lag frames
	LDA $7FFB44
	SEC
	SBC $7FFB0E
	STA $7FFB48
	
	LDA #$0000 : STA $7FFB0E
	
	LDA $7FFB00 : STA $7FFB02
	LDA #$0000 : STA $7FFB00
	
	LDA $7FFB44 : STA $7FFB46
	LDA #$0000 : STA $7FFB44

	
	; save temp variables
	LDA $12 : PHA
	LDA $14 : PHA
	
	; Update HUD
	;JSL ih_update_hud_code

	; restore temp variables
	PLA : STA $14
	PLA : STA $12
	
	FlagTrans:
	LDA #$0000 : STA $7FFB2C
	
	
	; Run standard code and return
	PLY
	PLX
	PLA
	STA $0998
	CLC
	RTL

;---RUNS DURING NORMAL GAMEPLAY---
ih_room_timer_code:
	PHA
	LDA $7FFB00
	CMP #$EA5F
	BEQ +
	INC
	STA $7FFB00  ;increment room timer

+	PLA
	STZ $0A30 ; overwritten code
	STZ $0A32 ; overwritten code
	RTL

ih_game_loop_code:
	PHA
	
	LDA $7FFB0E
	INC
	STA $7FFB0E

	PLA
	JSL $808111
	RTL

;---RUNS AFTER ROOM TRANSITION---	
ih_door_exit_code:
	PHX
	PHY

	LDA $7FFB0E : STA $7FFB10
	LDA #$0000 : STA $7FFB16 
	LDA #$0000 : STA $7FFB30
	
	; Update HUD
	JSL ih_update_hud_code
	
	; Reset gametime/transition timer
	LDA #$0000
	STA $7FFB0E
	
	; Reset realtime timer
	LDA #$0000
	STA $7FFB44
	
	PLY
	PLX
	
	; original hijacked code
	LDA #$0008
	STA $0998
	RTL

;--- HUD ROUTINES RAN BEFORE AND AFTER TRANSITION ---	
ih_update_hud_code:
	PHX
	PHY
	PHP
	
	; fix data bank register
	PHB
	PEA $8080
	PLB
	PLB

	JSL ih_tile_counter_code ; update tile counter
	PLB
	
	PLP
	PLY
	PLX
	
	RTL


ih_tile_counter_code:
	PHB
	
	PEA $8080
	PLB
	PLB
	
	LDA $7ED86E
	JSR Hex2Dec : LDX $12 : LDA NumberGFXTable,X : STA $7EC6B0 : LDX #$00B2 : JSR Draw3
	LDX #$00B0 : JSR CheckLeadZero : LDA $7EC6B6 : CMP #$0057 : BNE + : LDA #$0C09 : STA $7EC6B6
	
+	PLB
	RTL

ih_escape_draw:
	JSL ih_tile_counter_code

	LDA #$0000 ;overwritten code
	LDY #$A379 ;overwritten code
	RTL

;---SUBROUTINES---
	Hex2Dec:
	STA $4204 : SEP #$20
	LDA #$64 : STA $4206 ; divide by 100d
	PHA : PLA : PHA : PLA : REP #$20
	LDA $4214 : STA $12
	LDA $4216 : STA $4204 : SEP #$20
	LDA #$0A : STA $4206
	PHA : PLA : PHA : PLA : REP #$20
	LDA $4214 : ASL A : STA $16
	LDA $4216 : ASL A : STA $18
	LDA $12 : STA $4204 : SEP #$20
	LDA #$0A : STA $4206
	PHA : PLA : PHA : PLA : REP #$20
	LDA $4214 : ASL A : STA $12
	LDA $4216 : ASL A : STA $14
	RTS
	
	Draw3:
	LDY $14 : JSR Draw : LDY $16 : JSR Draw : LDY $18 : JSR Draw : RTS
	
	Draw:
	LDA NumberGFXTable,Y : STA $7EC600,X : INX : INX : RTS
	
	CheckLeadZero:
	LDA $7EC600,X : CMP #$0C09 : BNE ZeroFinish : LDA #$0057 : STA $7EC600,X : INX : INX : BRA CheckLeadZero
		ZeroFinish:
		CMP #$0CCB : BNE AreTeaEss : DEX : DEX : LDA #$0C09 : STA $7EC600,X
		
		AreTeaEss:
		RTS

print "InfoHud Main Bank Ending at: ", pc

; Stuff that needs to be placed in bank 80
org $80E000
print "InfoHud Bank 80 Starting at: ", pc
NumberGFXTable:
	DW #$0C09,#$0C00,#$0C01,#$0C02,#$0C03,#$0C04,#$0C05,#$0C06,#$0C07,#$0C08,#$0C45,#$0C3C,#$0C3D,#$0C3E,#$0C3F,#$0C40,#$0C41,#$0C42,#$0C43,#$0C44

;	l      u      r      d      a      b      x      y      l      r      s      S 
;DW $0200, $0800, $0100, $0400, $0080, $8000, $0040, $4000, $0020, $0010, $2000, $1000
ControllerTable1:
	DW $0020, $0800, $0010, $4000, $0040, $2000
ControllerTable2:
	DW $0200, $0400, $0100, $8000, $0080, $1000
ControllerGfx1:
	DW $0C68, $0C61, $0C69, $0C67, $0C66, $0C6A
ControllerGfx2:
	DW $0C60, $0C63, $0C62, $0C65, $0C64, $0C6B

print "InfoHud Bank 80 Ending at: ", pc


