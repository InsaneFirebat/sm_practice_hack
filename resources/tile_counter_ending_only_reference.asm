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

org $9AB800		 ;graphics for menu cursor and input display
incbin resources\menugfx.bin

org $DFE000
print "InfoHud Main Bank Starting at: ", pc

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

print "InfoHud Bank 80 Ending at: ", pc


