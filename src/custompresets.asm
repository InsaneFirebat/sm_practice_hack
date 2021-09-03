; --------------
; Custom Presets
; --------------

print pc, " custom presets start"

PresetSlot: ; 400h bytes needed per slot (3DEh)
    dw $0000, $0400, $0800, $0C00, $1000, $1400, $1800, $1C00
    dw $2000, $2400, $2800, $2C00, $3000, $3400, $3800, $3C00
    dw $4000, $4400, $4800, $4C00

custom_preset_save:
{
    LDA !sram_custom_preset_slot : ASL : TAX
    LDA.l PresetSlot,X : TAX : LDY #$0000
    LDA #$5AFE : STA $703000,X : INX #2 ; mark this slot as "SAFE" to load
    LDA $078B : STA $703000,X : INX #2 ;  Elevator Index
    LDA $078D : STA $703000,X : INX #2 ;  DDB
    LDA $078F : STA $703000,X : INX #2 ;  DoorOut Index
    LDA $079B : STA $703000,X : INX #2 ;  MDB
    LDA $079F : STA $703000,X : INX #2 ;  Region
    LDA $07C3 : STA $703000,X : INX #2 ;  GFX Pointers
    LDA $07C5 : STA $703000,X : INX #2 ;  GFX Pointers
    LDA $07C7 : STA $703000,X : INX #2 ;  GFX Pointers
    LDA $07F3 : STA $703000,X : INX #2 ;  Music Bank
    LDA $07F5 : STA $703000,X : INX #2 ;  Music Track
    LDA $090F : STA $703000,X : INX #2 ;  Screen subpixel X position
    LDA $0911 : STA $703000,X : INX #2 ;  Screen X position in pixels
    LDA $0913 : STA $703000,X : INX #2 ;  Screen subpixel Y position
    LDA $0915 : STA $703000,X : INX #2 ;  Screen Y position in pixels
    LDA $093F : STA $703000,X : INX #2 ;  Ceres escape flag
    LDA $09A2 : STA $703000,X : INX #2 ;  Equipped Items
    LDA $09A4 : STA $703000,X : INX #2 ;  Collected Items
    LDA $09A6 : STA $703000,X : INX #2 ;  Beams
    LDA $09A8 : STA $703000,X : INX #2 ;  Beams
    LDA $09C0 : STA $703000,X : INX #2 ;  Manual/Auto reserve tank
    LDA $09C2 : STA $703000,X : INX #2 ;  Health
    LDA $09C4 : STA $703000,X : INX #2 ;  Max helath
    LDA $09C6 : STA $703000,X : INX #2 ;  Missiles
    LDA $09C8 : STA $703000,X : INX #2 ;  Max missiles
    LDA $09CA : STA $703000,X : INX #2 ;  Supers
    LDA $09CC : STA $703000,X : INX #2 ;  Max supers
    LDA $09CE : STA $703000,X : INX #2 ;  Pbs
    LDA $09D0 : STA $703000,X : INX #2 ;  Max pbs
    LDA $09D2 : STA $703000,X : INX #2 ;  Currently selected item
    LDA $09D4 : STA $703000,X : INX #2 ;  Max reserves
    LDA $09D6 : STA $703000,X : INX #2 ;  Reserves
    LDA $0A1C : STA $703000,X : INX #2 ;  Samus position/state
    LDA $0A1E : STA $703000,X : INX #2 ;  More position/state
    LDA $0A68 : STA $703000,X : INX #2 ;  Flash suit
    LDA $0A76 : STA $703000,X : INX #2 ;  Hyper beam
    LDA $0AF6 : STA $703000,X : INX #2 ;  Samus X
    LDA $0AFA : STA $703000,X : INX #2 ;  Samus Y
    LDA $0B3F : STA $703000,X : INX #2 ;  Blue suit
    LDA $7ED7C0 : STA $703000,X : INX #2 ;  SRAM copy
    LDA $7ED7C2 : STA $703000,X : INX #2 ;  SRAM copy
    LDA $7ED7C4 : STA $703000,X : INX #2 ;  SRAM copy
    LDA $7ED7C6 : STA $703000,X : INX #2 ;  SRAM copy
    LDA $7ED7C8 : STA $703000,X : INX #2 ;  SRAM copy
    LDA $7ED7CA : STA $703000,X : INX #2 ;  SRAM copy
    LDA $7ED7CC : STA $703000,X : INX #2 ;  SRAM copy
    LDA $7ED7CE : STA $703000,X : INX #2 ;  SRAM copy
    LDA $7ED7D0 : STA $703000,X : INX #2 ;  SRAM copy
    LDA $7ED7D2 : STA $703000,X : INX #2 ;  SRAM copy
    LDA $7ED7D4 : STA $703000,X : INX #2 ;  SRAM copy
    LDA $7ED7D6 : STA $703000,X : INX #2 ;  SRAM copy
    LDA $7ED7D8 : STA $703000,X : INX #2 ;  SRAM copy
    LDA $7ED7DA : STA $703000,X : INX #2 ;  SRAM copy
    LDA $7ED7DC : STA $703000,X : INX #2 ;  SRAM copy
    LDA $7ED7DE : STA $703000,X : INX #2 ;  SRAM copy
    LDA $7ED7E0 : STA $703000,X : INX #2 ;  SRAM copy
    LDA $7ED7E2 : STA $703000,X : INX #2 ;  SRAM copy
    LDA $7ED7E4 : STA $703000,X : INX #2 ;  SRAM copy
    LDA $7ED7E6 : STA $703000,X : INX #2 ;  SRAM copy
    LDA $7ED7E8 : STA $703000,X : INX #2 ;  SRAM copy
    LDA $7ED7EA : STA $703000,X : INX #2 ;  SRAM copy
    LDA $7ED7EC : STA $703000,X : INX #2 ;  SRAM copy
    LDA $7ED7EE : STA $703000,X : INX #2 ;  SRAM copy
    LDA $7ED7F0 : STA $703000,X : INX #2 ;  SRAM copy
    LDA $7ED7F2 : STA $703000,X : INX #2 ;  SRAM copy
    LDA $7ED7F4 : STA $703000,X : INX #2 ;  SRAM copy
    LDA $7ED7F6 : STA $703000,X : INX #2 ;  SRAM copy
    LDA $7ED7F8 : STA $703000,X : INX #2 ;  SRAM copy
    LDA $7ED7FA : STA $703000,X : INX #2 ;  SRAM copy
    LDA $7ED7FC : STA $703000,X : INX #2 ;  SRAM copy
    LDA $7ED7FE : STA $703000,X : INX #2 ;  SRAM copy
    LDA $7ED800 : STA $703000,X : INX #2 ;  SRAM copy
    LDA $7ED802 : STA $703000,X : INX #2 ;  SRAM copy
    LDA $7ED804 : STA $703000,X : INX #2 ;  SRAM copy
    LDA $7ED806 : STA $703000,X : INX #2 ;  SRAM copy
    LDA $7ED808 : STA $703000,X : INX #2 ;  SRAM copy
    LDA $7ED80A : STA $703000,X : INX #2 ;  SRAM copy
    LDA $7ED80C : STA $703000,X : INX #2 ;  SRAM copy
    LDA $7ED80E : STA $703000,X : INX #2 ;  SRAM copy
    LDA $7ED810 : STA $703000,X : INX #2 ;  SRAM copy
    LDA $7ED812 : STA $703000,X : INX #2 ;  SRAM copy
    LDA $7ED814 : STA $703000,X : INX #2 ;  SRAM copy
    LDA $7ED816 : STA $703000,X : INX #2 ;  SRAM copy
    LDA $7ED818 : STA $703000,X : INX #2 ;  SRAM copy
    LDA $7ED81A : STA $703000,X : INX #2 ;  SRAM copy
    LDA $7ED81C : STA $703000,X : INX #2 ;  SRAM copy
    LDA $7ED81E : STA $703000,X : INX #2 ;  SRAM copy
    LDA $7ED820 : STA $703000,X : INX #2 ;  Events, Items, Doors
    LDA $7ED822 : STA $703000,X : INX #2 ;  Events, Items, Doors
    LDA $7ED824 : STA $703000,X : INX #2 ;  Events, Items, Doors
    LDA $7ED826 : STA $703000,X : INX #2 ;  Events, Items, Doors
    LDA $7ED828 : STA $703000,X : INX #2 ;  Events, Items, Doors
    LDA $7ED82A : STA $703000,X : INX #2 ;  Events, Items, Doors
    LDA $7ED82C : STA $703000,X : INX #2 ;  Events, Items, Doors
    LDA $7ED82E : STA $703000,X : INX #2 ;  Events, Items, Doors
    LDA $7ED830 : STA $703000,X : INX #2 ;  Events, Items, Doors
    LDA $7ED832 : STA $703000,X : INX #2 ;  Events, Items, Doors
    LDA $7ED834 : STA $703000,X : INX #2 ;  Events, Items, Doors
    LDA $7ED836 : STA $703000,X : INX #2 ;  Events, Items, Doors
    LDA $7ED838 : STA $703000,X : INX #2 ;  Events, Items, Doors
    LDA $7ED83A : STA $703000,X : INX #2 ;  Events, Items, Doors
    LDA $7ED83C : STA $703000,X : INX #2 ;  Events, Items, Doors
    LDA $7ED83E : STA $703000,X : INX #2 ;  Events, Items, Doors
    LDA $7ED840 : STA $703000,X : INX #2 ;  Events, Items, Doors
    LDA $7ED842 : STA $703000,X : INX #2 ;  Events, Items, Doors
    LDA $7ED844 : STA $703000,X : INX #2 ;  Events, Items, Doors
    LDA $7ED846 : STA $703000,X : INX #2 ;  Events, Items, Doors
    LDA $7ED848 : STA $703000,X : INX #2 ;  Events, Items, Doors
    LDA $7ED84A : STA $703000,X : INX #2 ;  Events, Items, Doors
    LDA $7ED84C : STA $703000,X : INX #2 ;  Events, Items, Doors
    LDA $7ED84E : STA $703000,X : INX #2 ;  Events, Items, Doors
    LDA $7ED850 : STA $703000,X : INX #2 ;  Events, Items, Doors
    LDA $7ED852 : STA $703000,X : INX #2 ;  Events, Items, Doors
    LDA $7ED854 : STA $703000,X : INX #2 ;  Events, Items, Doors
    LDA $7ED856 : STA $703000,X : INX #2 ;  Events, Items, Doors
    LDA $7ED858 : STA $703000,X : INX #2 ;  Events, Items, Doors
    LDA $7ED85A : STA $703000,X : INX #2 ;  Events, Items, Doors
    LDA $7ED85C : STA $703000,X : INX #2 ;  Events, Items, Doors
    LDA $7ED85E : STA $703000,X : INX #2 ;  Events, Items, Doors
    LDA $7ED860 : STA $703000,X : INX #2 ;  Events, Items, Doors
    LDA $7ED862 : STA $703000,X : INX #2 ;  Events, Items, Doors
    LDA $7ED864 : STA $703000,X : INX #2 ;  Events, Items, Doors
    LDA $7ED866 : STA $703000,X : INX #2 ;  Events, Items, Doors
    LDA $7ED868 : STA $703000,X : INX #2 ;  Events, Items, Doors
    LDA $7ED86A : STA $703000,X : INX #2 ;  Events, Items, Doors
    LDA $7ED86C : STA $703000,X : INX #2 ;  Events, Items, Doors
    LDA $7ED86E : STA $703000,X : INX #2 ;  Events, Items, Doors
    LDA $7ED870 : STA $703000,X : INX #2 ;  Events, Items, Doors
    LDA $7ED872 : STA $703000,X : INX #2 ;  Events, Items, Doors
    LDA $7ED874 : STA $703000,X : INX #2 ;  Events, Items, Doors
    LDA $7ED876 : STA $703000,X : INX #2 ;  Events, Items, Doors
    LDA $7ED878 : STA $703000,X : INX #2 ;  Events, Items, Doors
    LDA $7ED87A : STA $703000,X : INX #2 ;  Events, Items, Doors
    LDA $7ED87C : STA $703000,X : INX #2 ;  Events, Items, Doors
    LDA $7ED87E : STA $703000,X : INX #2 ;  Events, Items, Doors
    LDA $7ED880 : STA $703000,X : INX #2 ;  Events, Items, Doors
    LDA $7ED882 : STA $703000,X : INX #2 ;  Events, Items, Doors
    LDA $7ED884 : STA $703000,X : INX #2 ;  Events, Items, Doors
    LDA $7ED886 : STA $703000,X : INX #2 ;  Events, Items, Doors
    LDA $7ED888 : STA $703000,X : INX #2 ;  Events, Items, Doors
    LDA $7ED88A : STA $703000,X : INX #2 ;  Events, Items, Doors
    LDA $7ED88C : STA $703000,X : INX #2 ;  Events, Items, Doors
    LDA $7ED88E : STA $703000,X : INX #2 ;  Events, Items, Doors
    LDA $7ED890 : STA $703000,X : INX #2 ;  Events, Items, Doors
    LDA $7ED892 : STA $703000,X : INX #2 ;  Events, Items, Doors
    LDA $7ED894 : STA $703000,X : INX #2 ;  Events, Items, Doors
    LDA $7ED896 : STA $703000,X : INX #2 ;  Events, Items, Doors
    LDA $7ED898 : STA $703000,X : INX #2 ;  Events, Items, Doors
    LDA $7ED89A : STA $703000,X : INX #2 ;  Events, Items, Doors
    LDA $7ED89C : STA $703000,X : INX #2 ;  Events, Items, Doors
    LDA $7ED89E : STA $703000,X : INX #2 ;  Events, Items, Doors
    LDA $7ED8A0 : STA $703000,X : INX #2 ;  Events, Items, Doors
    LDA $7ED8A2 : STA $703000,X : INX #2 ;  Events, Items, Doors
    LDA $7ED8A4 : STA $703000,X : INX #2 ;  Events, Items, Doors
    LDA $7ED8A6 : STA $703000,X : INX #2 ;  Events, Items, Doors
    LDA $7ED8A8 : STA $703000,X : INX #2 ;  Events, Items, Doors
    LDA $7ED8AA : STA $703000,X : INX #2 ;  Events, Items, Doors
    LDA $7ED8AC : STA $703000,X : INX #2 ;  Events, Items, Doors
    LDA $7ED8AE : STA $703000,X : INX #2 ;  Events, Items, Doors
    LDA $7ED8B0 : STA $703000,X : INX #2 ;  Events, Items, Doors
    LDA $7ED8B2 : STA $703000,X : INX #2 ;  Events, Items, Doors
    LDA $7ED8B4 : STA $703000,X : INX #2 ;  Events, Items, Doors
    LDA $7ED8B6 : STA $703000,X : INX #2 ;  Events, Items, Doors
    LDA $7ED8B8 : STA $703000,X : INX #2 ;  Events, Items, Doors
    LDA $7ED8BA : STA $703000,X : INX #2 ;  Events, Items, Doors
    LDA $7ED8BC : STA $703000,X : INX #2 ;  Events, Items, Doors
    LDA $7ED8BE : STA $703000,X : INX #2 ;  Events, Items, Doors
    LDA $7ED8C0 : STA $703000,X : INX #2 ;  Events, Items, Doors
    LDA $7ED8C2 : STA $703000,X : INX #2 ;  Events, Items, Doors
    LDA $7ED8C4 : STA $703000,X : INX #2 ;  Events, Items, Doors
    LDA $7ED8C6 : STA $703000,X : INX #2 ;  Events, Items, Doors
    LDA $7ED8C8 : STA $703000,X : INX #2 ;  Events, Items, Doors
    LDA $7ED8CA : STA $703000,X : INX #2 ;  Events, Items, Doors
    LDA $7ED8CC : STA $703000,X : INX #2 ;  Events, Items, Doors
    LDA $7ED8CE : STA $703000,X : INX #2 ;  Events, Items, Doors
    LDA $7ED8D0 : STA $703000,X : INX #2 ;  Events, Items, Doors
    LDA $7ED8D2 : STA $703000,X : INX #2 ;  Events, Items, Doors
    LDA $7ED8D4 : STA $703000,X : INX #2 ;  Events, Items, Doors
    LDA $7ED8D6 : STA $703000,X : INX #2 ;  Events, Items, Doors
    LDA $7ED8D8 : STA $703000,X : INX #2 ;  Events, Items, Doors
    LDA $7ED8DA : STA $703000,X : INX #2 ;  Events, Items, Doors
    LDA $7ED8DC : STA $703000,X : INX #2 ;  Events, Items, Doors
    LDA $7ED8DE : STA $703000,X : INX #2 ;  Events, Items, Doors
    LDA $7ED8E0 : STA $703000,X : INX #2 ;  Events, Items, Doors
    LDA $7ED8E2 : STA $703000,X : INX #2 ;  Events, Items, Doors
    LDA $7ED8E4 : STA $703000,X : INX #2 ;  Events, Items, Doors
    LDA $7ED8E6 : STA $703000,X : INX #2 ;  Events, Items, Doors
    LDA $7ED8E8 : STA $703000,X : INX #2 ;  Events, Items, Doors
    LDA $7ED8EA : STA $703000,X : INX #2 ;  Events, Items, Doors
    LDA $7ED8EC : STA $703000,X : INX #2 ;  Events, Items, Doors
    LDA $7ED8EE : STA $703000,X : INX #2 ;  Events, Items, Doors
    LDA $7ED8F0 : STA $703000,X : INX #2 ;  Events, Items, Doors
    LDA $7ED8F2 : STA $703000,X : INX #2 ;  Events, Items, Doors
    LDA $7ED8F4 : STA $703000,X : INX #2 ;  Events, Items, Doors
    LDA $7ED8F6 : STA $703000,X : INX #2 ;  Events, Items, Doors
    LDA $7ED8F8 : STA $703000,X : INX #2 ;  Events, Items, Doors
    LDA $7ED8FA : STA $703000,X : INX #2 ;  Events, Items, Doors
    LDA $7ED8FC : STA $703000,X : INX #2 ;  Events, Items, Doors
    LDA $7ED8FE : STA $703000,X : INX #2 ;  Events, Items, Doors
    LDA $7ED900 : STA $703000,X : INX #2 ;  Events, Items, Doors
    LDA $7ED902 : STA $703000,X : INX #2 ;  Events, Items, Doors
    LDA $7ED904 : STA $703000,X : INX #2 ;  Events, Items, Doors
    LDA $7ED906 : STA $703000,X : INX #2 ;  Events, Items, Doors
    LDA $7ED908 : STA $703000,X : INX #2 ;  Events, Items, Doors
    LDA $7ED90A : STA $703000,X : INX #2 ;  Events, Items, Doors
    LDA $7ED90C : STA $703000,X : INX #2 ;  Events, Items, Doors
    LDA $7ED90E : STA $703000,X : INX #2 ;  Events, Items, Doors
    LDA $7ED910 : STA $703000,X : INX #2 ;  Events, Items, Doors
    LDA $7ED912 : STA $703000,X : INX #2 ;  Events, Items, Doors
    LDA $7ED914 : STA $703000,X : INX #2 ;  Events, Items, Doors
    LDA $7ED916 : STA $703000,X : INX #2 ;  Events, Items, Doors
    LDA $7ED918 : STA $703000,X : INX #2 ;  Events, Items, Doors
    LDA $7ED91A : STA $703000,X : INX #2 ;  Events, Items, Doors
    LDA $7ED91C : STA $703000,X : INX #2 ;  Events, Items, Doors
    LDA $7ED91E : STA $703000,X : INX #2 ;  Events, Items, Doors

  .loopEnemies
;    LDA $0F78,Y : STA $703000,X : INX #2 ;  Enemy ID
    LDA $0F7A,Y : STA $703000,X : INX #2 ;  Enemy X position
    LDA $0F7C,Y : STA $703000,X : INX #2 ;  Enemy X subposition
    LDA $0F7E,Y : STA $703000,X : INX #2 ;  Enemy Y position
    LDA $0F80,Y : STA $703000,X : INX #2 ;  Enemy Y subposition
;    LDA $0F82,Y : STA $703000,X : INX #2 ;  Enemy X radius
;    LDA $0F84,Y : STA $703000,X : INX #2 ;  Enemy Y radius
;    LDA $0F86,Y : STA $703000,X : INX #2 ;  Enemy Properties
;    LDA $0F88,Y : STA $703000,X : INX #2 ;  Enemy Extra Properties
    LDA $0F8A,Y : STA $703000,X : INX #2 ;  Enemy AI handler
    LDA $0F8C,Y : STA $703000,X : INX #2 ;  Enemy Health
    LDA $0F8E,Y : STA $703000,X : INX #2 ;  Enemy Spritemap pointer
    LDA $0F90,Y : STA $703000,X : INX #2 ;  Enemy Timer
    LDA $0F92,Y : STA $703000,X : INX #2 ;  Enemy Initialisation parameter / instruction list pointer
    LDA $0F94,Y : STA $703000,X : INX #2 ;  Enemy Instruction timer
;    LDA $0F96,Y : STA $703000,X : INX #2 ;  Enemy Palette index
;    LDA $0F98,Y : STA $703000,X : INX #2 ;  Enemy VRAM tiles index
;    LDA $0F9A,Y : STA $703000,X : INX #2 ;  Enemy Layer
    LDA $0F9C,Y : STA $703000,X : INX #2 ;  Flash timer
    LDA $0F9E,Y : STA $703000,X : INX #2 ;  Enemy Frozen timer
    LDA $0FA0,Y : STA $703000,X : INX #2 ;  Enemy Invincibility timer
;    LDA $0FA2,Y : STA $703000,X : INX #2 ;  Enemy Shake timer
    LDA $0FA4,Y : STA $703000,X : INX #2 ;  Enemy Frame counter
;    LDA $0FA6,Y : STA $703000,X : INX #2 ;  Enemy Bank
    LDA $0FA8,Y : STA $703000,X : INX #2 ;  Enemy AI variable, frequently function pointer
    LDA $0FAA,Y : STA $703000,X : INX #2 ;  Enemy AI variable
    LDA $0FAC,Y : STA $703000,X : INX #2 ;  Enemy AI variable
    LDA $0FAE,Y : STA $703000,X : INX #2 ;  Enemy AI variable
    LDA $0FB0,Y : STA $703000,X : INX #2 ;  Enemy AI variable
;    LDA $0FB2,Y : STA $703000,X : INX #2 ;  Enemy AI variable
;    LDA $0FB4,Y : STA $703000,X : INX #2 ;  Enemy Parameter 1
;    LDA $0FB6,Y : STA $703000,X : INX #2 ;  Enemy Parameter 2
    CPY #$0380 : BPL .done ; exit after enemy 13, zero indexed
    TYA : CLC : ADC #$0040 : TAY
    JMP .loopEnemies

  .done
    RTL
}

custom_preset_load:
{
    LDA !sram_custom_preset_slot : ASL : TAX
    LDA.l PresetSlot,X : TAX : LDY #$0000
    INX #2 ; skip past "5AFE" word
+   LDA $703000,X : STA $078B : INX #2 ;  Elevator Index
    LDA $703000,X : STA $078D : INX #2 ;  DDB
    LDA $703000,X : STA $078F : INX #2 ;  DoorOut Index
    LDA $703000,X : STA $079B : INX #2 ;  MDB
    LDA $703000,X : STA $079F : INX #2 ;  Region
    LDA $703000,X : STA $07C3 : INX #2 ;  GFX Pointers
    LDA $703000,X : STA $07C5 : INX #2 ;  GFX Pointers
    LDA $703000,X : STA $07C7 : INX #2 ;  GFX Pointers
    LDA $703000,X : STA $07F3 : INX #2 ;  Music Bank
    LDA $703000,X : STA $07F5 : INX #2 ;  Music Track
    LDA $703000,X : STA $090F : INX #2 ;  Screen subpixel X position
    LDA $703000,X : STA $0911 : INX #2 ;  Screen X position in pixels
    LDA $703000,X : STA $0913 : INX #2 ;  Screen subpixel Y position
    LDA $703000,X : STA $0915 : INX #2 ;  Screen Y position in pixels
    LDA $703000,X : STA $093F : INX #2 ;  Ceres escape flag
    LDA $703000,X : STA $09A2 : INX #2 ;  Equipped Items
    LDA $703000,X : STA $09A4 : INX #2 ;  Collected Items
    LDA $703000,X : STA $09A6 : INX #2 ;  Beams
    LDA $703000,X : STA $09A8 : INX #2 ;  Beams
    LDA $703000,X : STA $09C0 : INX #2 ;  Manual/Auto reserve tank
    LDA $703000,X : STA $09C2 : INX #2 ;  Health
    LDA $703000,X : STA $09C4 : INX #2 ;  Max helath
    LDA $703000,X : STA $09C6 : INX #2 ;  Missiles
    LDA $703000,X : STA $09C8 : INX #2 ;  Max missiles
    LDA $703000,X : STA $09CA : INX #2 ;  Supers
    LDA $703000,X : STA $09CC : INX #2 ;  Max supers
    LDA $703000,X : STA $09CE : INX #2 ;  Pbs
    LDA $703000,X : STA $09D0 : INX #2 ;  Max pbs
    LDA $703000,X : STA $09D2 : INX #2 ;  Currently selected item
    LDA $703000,X : STA $09D4 : INX #2 ;  Max reserves
    LDA $703000,X : STA $09D6 : INX #2 ;  Reserves
    LDA $703000,X : STA $0A1C : INX #2 ;  Samus position/state
    LDA $703000,X : STA $0A1E : INX #2 ;  More position/state
    LDA $703000,X : STA $0A68 : INX #2 ;  Flash suit
    LDA $703000,X : STA $0A76 : INX #2 ;  Hyper beam
    LDA $703000,X : STA $0AF6 : INX #2 ;  Samus X
    LDA $703000,X : STA $0AFA : INX #2 ;  Samus Y
    LDA $703000,X : STA $0B3F : INX #2 ;  Blue suit
    LDA $703000,X : STA $7ED7C0 : INX #2 ;  SRAM copy
    LDA $703000,X : STA $7ED7C2 : INX #2 ;  SRAM copy
    LDA $703000,X : STA $7ED7C4 : INX #2 ;  SRAM copy
    LDA $703000,X : STA $7ED7C6 : INX #2 ;  SRAM copy
    LDA $703000,X : STA $7ED7C8 : INX #2 ;  SRAM copy
    LDA $703000,X : STA $7ED7CA : INX #2 ;  SRAM copy
    LDA $703000,X : STA $7ED7CC : INX #2 ;  SRAM copy
    LDA $703000,X : STA $7ED7CE : INX #2 ;  SRAM copy
    LDA $703000,X : STA $7ED7D0 : INX #2 ;  SRAM copy
    LDA $703000,X : STA $7ED7D2 : INX #2 ;  SRAM copy
    LDA $703000,X : STA $7ED7D4 : INX #2 ;  SRAM copy
    LDA $703000,X : STA $7ED7D6 : INX #2 ;  SRAM copy
    LDA $703000,X : STA $7ED7D8 : INX #2 ;  SRAM copy
    LDA $703000,X : STA $7ED7DA : INX #2 ;  SRAM copy
    LDA $703000,X : STA $7ED7DC : INX #2 ;  SRAM copy
    LDA $703000,X : STA $7ED7DE : INX #2 ;  SRAM copy
    LDA $703000,X : STA $7ED7E0 : INX #2 ;  SRAM copy
    LDA $703000,X : STA $7ED7E2 : INX #2 ;  SRAM copy
    LDA $703000,X : STA $7ED7E4 : INX #2 ;  SRAM copy
    LDA $703000,X : STA $7ED7E6 : INX #2 ;  SRAM copy
    LDA $703000,X : STA $7ED7E8 : INX #2 ;  SRAM copy
    LDA $703000,X : STA $7ED7EA : INX #2 ;  SRAM copy
    LDA $703000,X : STA $7ED7EC : INX #2 ;  SRAM copy
    LDA $703000,X : STA $7ED7EE : INX #2 ;  SRAM copy
    LDA $703000,X : STA $7ED7F0 : INX #2 ;  SRAM copy
    LDA $703000,X : STA $7ED7F2 : INX #2 ;  SRAM copy
    LDA $703000,X : STA $7ED7F4 : INX #2 ;  SRAM copy
    LDA $703000,X : STA $7ED7F6 : INX #2 ;  SRAM copy
    LDA $703000,X : STA $7ED7F8 : INX #2 ;  SRAM copy
    LDA $703000,X : STA $7ED7FA : INX #2 ;  SRAM copy
    LDA $703000,X : STA $7ED7FC : INX #2 ;  SRAM copy
    LDA $703000,X : STA $7ED7FE : INX #2 ;  SRAM copy
    LDA $703000,X : STA $7ED800 : INX #2 ;  SRAM copy
    LDA $703000,X : STA $7ED802 : INX #2 ;  SRAM copy
    LDA $703000,X : STA $7ED804 : INX #2 ;  SRAM copy
    LDA $703000,X : STA $7ED806 : INX #2 ;  SRAM copy
    LDA $703000,X : STA $7ED808 : INX #2 ;  SRAM copy
    LDA $703000,X : STA $7ED80A : INX #2 ;  SRAM copy
    LDA $703000,X : STA $7ED80C : INX #2 ;  SRAM copy
    LDA $703000,X : STA $7ED80E : INX #2 ;  SRAM copy
    LDA $703000,X : STA $7ED810 : INX #2 ;  SRAM copy
    LDA $703000,X : STA $7ED812 : INX #2 ;  SRAM copy
    LDA $703000,X : STA $7ED814 : INX #2 ;  SRAM copy
    LDA $703000,X : STA $7ED816 : INX #2 ;  SRAM copy
    LDA $703000,X : STA $7ED818 : INX #2 ;  SRAM copy
    LDA $703000,X : STA $7ED81A : INX #2 ;  SRAM copy
    LDA $703000,X : STA $7ED81C : INX #2 ;  SRAM copy
    LDA $703000,X : STA $7ED81E : INX #2 ;  SRAM copy
    LDA $703000,X : STA $7ED820 : INX #2 ;  Events, Items, Doors
    LDA $703000,X : STA $7ED822 : INX #2 ;  Events, Items, Doors
    LDA $703000,X : STA $7ED824 : INX #2 ;  Events, Items, Doors
    LDA $703000,X : STA $7ED826 : INX #2 ;  Events, Items, Doors
    LDA $703000,X : STA $7ED828 : INX #2 ;  Events, Items, Doors
    LDA $703000,X : STA $7ED82A : INX #2 ;  Events, Items, Doors
    LDA $703000,X : STA $7ED82C : INX #2 ;  Events, Items, Doors
    LDA $703000,X : STA $7ED82E : INX #2 ;  Events, Items, Doors
    LDA $703000,X : STA $7ED830 : INX #2 ;  Events, Items, Doors
    LDA $703000,X : STA $7ED832 : INX #2 ;  Events, Items, Doors
    LDA $703000,X : STA $7ED834 : INX #2 ;  Events, Items, Doors
    LDA $703000,X : STA $7ED836 : INX #2 ;  Events, Items, Doors
    LDA $703000,X : STA $7ED838 : INX #2 ;  Events, Items, Doors
    LDA $703000,X : STA $7ED83A : INX #2 ;  Events, Items, Doors
    LDA $703000,X : STA $7ED83C : INX #2 ;  Events, Items, Doors
    LDA $703000,X : STA $7ED83E : INX #2 ;  Events, Items, Doors
    LDA $703000,X : STA $7ED840 : INX #2 ;  Events, Items, Doors
    LDA $703000,X : STA $7ED842 : INX #2 ;  Events, Items, Doors
    LDA $703000,X : STA $7ED844 : INX #2 ;  Events, Items, Doors
    LDA $703000,X : STA $7ED846 : INX #2 ;  Events, Items, Doors
    LDA $703000,X : STA $7ED848 : INX #2 ;  Events, Items, Doors
    LDA $703000,X : STA $7ED84A : INX #2 ;  Events, Items, Doors
    LDA $703000,X : STA $7ED84C : INX #2 ;  Events, Items, Doors
    LDA $703000,X : STA $7ED84E : INX #2 ;  Events, Items, Doors
    LDA $703000,X : STA $7ED850 : INX #2 ;  Events, Items, Doors
    LDA $703000,X : STA $7ED852 : INX #2 ;  Events, Items, Doors
    LDA $703000,X : STA $7ED854 : INX #2 ;  Events, Items, Doors
    LDA $703000,X : STA $7ED856 : INX #2 ;  Events, Items, Doors
    LDA $703000,X : STA $7ED858 : INX #2 ;  Events, Items, Doors
    LDA $703000,X : STA $7ED85A : INX #2 ;  Events, Items, Doors
    LDA $703000,X : STA $7ED85C : INX #2 ;  Events, Items, Doors
    LDA $703000,X : STA $7ED85E : INX #2 ;  Events, Items, Doors
    LDA $703000,X : STA $7ED860 : INX #2 ;  Events, Items, Doors
    LDA $703000,X : STA $7ED862 : INX #2 ;  Events, Items, Doors
    LDA $703000,X : STA $7ED864 : INX #2 ;  Events, Items, Doors
    LDA $703000,X : STA $7ED866 : INX #2 ;  Events, Items, Doors
    LDA $703000,X : STA $7ED868 : INX #2 ;  Events, Items, Doors
    LDA $703000,X : STA $7ED86A : INX #2 ;  Events, Items, Doors
    LDA $703000,X : STA $7ED86C : INX #2 ;  Events, Items, Doors
    LDA $703000,X : STA $7ED86E : INX #2 ;  Events, Items, Doors
    LDA $703000,X : STA $7ED870 : INX #2 ;  Events, Items, Doors
    LDA $703000,X : STA $7ED872 : INX #2 ;  Events, Items, Doors
    LDA $703000,X : STA $7ED874 : INX #2 ;  Events, Items, Doors
    LDA $703000,X : STA $7ED876 : INX #2 ;  Events, Items, Doors
    LDA $703000,X : STA $7ED878 : INX #2 ;  Events, Items, Doors
    LDA $703000,X : STA $7ED87A : INX #2 ;  Events, Items, Doors
    LDA $703000,X : STA $7ED87C : INX #2 ;  Events, Items, Doors
    LDA $703000,X : STA $7ED87E : INX #2 ;  Events, Items, Doors
    LDA $703000,X : STA $7ED880 : INX #2 ;  Events, Items, Doors
    LDA $703000,X : STA $7ED882 : INX #2 ;  Events, Items, Doors
    LDA $703000,X : STA $7ED884 : INX #2 ;  Events, Items, Doors
    LDA $703000,X : STA $7ED886 : INX #2 ;  Events, Items, Doors
    LDA $703000,X : STA $7ED888 : INX #2 ;  Events, Items, Doors
    LDA $703000,X : STA $7ED88A : INX #2 ;  Events, Items, Doors
    LDA $703000,X : STA $7ED88C : INX #2 ;  Events, Items, Doors
    LDA $703000,X : STA $7ED88E : INX #2 ;  Events, Items, Doors
    LDA $703000,X : STA $7ED890 : INX #2 ;  Events, Items, Doors
    LDA $703000,X : STA $7ED892 : INX #2 ;  Events, Items, Doors
    LDA $703000,X : STA $7ED894 : INX #2 ;  Events, Items, Doors
    LDA $703000,X : STA $7ED896 : INX #2 ;  Events, Items, Doors
    LDA $703000,X : STA $7ED898 : INX #2 ;  Events, Items, Doors
    LDA $703000,X : STA $7ED89A : INX #2 ;  Events, Items, Doors
    LDA $703000,X : STA $7ED89C : INX #2 ;  Events, Items, Doors
    LDA $703000,X : STA $7ED89E : INX #2 ;  Events, Items, Doors
    LDA $703000,X : STA $7ED8A0 : INX #2 ;  Events, Items, Doors
    LDA $703000,X : STA $7ED8A2 : INX #2 ;  Events, Items, Doors
    LDA $703000,X : STA $7ED8A4 : INX #2 ;  Events, Items, Doors
    LDA $703000,X : STA $7ED8A6 : INX #2 ;  Events, Items, Doors
    LDA $703000,X : STA $7ED8A8 : INX #2 ;  Events, Items, Doors
    LDA $703000,X : STA $7ED8AA : INX #2 ;  Events, Items, Doors
    LDA $703000,X : STA $7ED8AC : INX #2 ;  Events, Items, Doors
    LDA $703000,X : STA $7ED8AE : INX #2 ;  Events, Items, Doors
    LDA $703000,X : STA $7ED8B0 : INX #2 ;  Events, Items, Doors
    LDA $703000,X : STA $7ED8B2 : INX #2 ;  Events, Items, Doors
    LDA $703000,X : STA $7ED8B4 : INX #2 ;  Events, Items, Doors
    LDA $703000,X : STA $7ED8B6 : INX #2 ;  Events, Items, Doors
    LDA $703000,X : STA $7ED8B8 : INX #2 ;  Events, Items, Doors
    LDA $703000,X : STA $7ED8BA : INX #2 ;  Events, Items, Doors
    LDA $703000,X : STA $7ED8BC : INX #2 ;  Events, Items, Doors
    LDA $703000,X : STA $7ED8BE : INX #2 ;  Events, Items, Doors
    LDA $703000,X : STA $7ED8C0 : INX #2 ;  Events, Items, Doors
    LDA $703000,X : STA $7ED8C2 : INX #2 ;  Events, Items, Doors
    LDA $703000,X : STA $7ED8C4 : INX #2 ;  Events, Items, Doors
    LDA $703000,X : STA $7ED8C6 : INX #2 ;  Events, Items, Doors
    LDA $703000,X : STA $7ED8C8 : INX #2 ;  Events, Items, Doors
    LDA $703000,X : STA $7ED8CA : INX #2 ;  Events, Items, Doors
    LDA $703000,X : STA $7ED8CC : INX #2 ;  Events, Items, Doors
    LDA $703000,X : STA $7ED8CE : INX #2 ;  Events, Items, Doors
    LDA $703000,X : STA $7ED8D0 : INX #2 ;  Events, Items, Doors
    LDA $703000,X : STA $7ED8D2 : INX #2 ;  Events, Items, Doors
    LDA $703000,X : STA $7ED8D4 : INX #2 ;  Events, Items, Doors
    LDA $703000,X : STA $7ED8D6 : INX #2 ;  Events, Items, Doors
    LDA $703000,X : STA $7ED8D8 : INX #2 ;  Events, Items, Doors
    LDA $703000,X : STA $7ED8DA : INX #2 ;  Events, Items, Doors
    LDA $703000,X : STA $7ED8DC : INX #2 ;  Events, Items, Doors
    LDA $703000,X : STA $7ED8DE : INX #2 ;  Events, Items, Doors
    LDA $703000,X : STA $7ED8E0 : INX #2 ;  Events, Items, Doors
    LDA $703000,X : STA $7ED8E2 : INX #2 ;  Events, Items, Doors
    LDA $703000,X : STA $7ED8E4 : INX #2 ;  Events, Items, Doors
    LDA $703000,X : STA $7ED8E6 : INX #2 ;  Events, Items, Doors
    LDA $703000,X : STA $7ED8E8 : INX #2 ;  Events, Items, Doors
    LDA $703000,X : STA $7ED8EA : INX #2 ;  Events, Items, Doors
    LDA $703000,X : STA $7ED8EC : INX #2 ;  Events, Items, Doors
    LDA $703000,X : STA $7ED8EE : INX #2 ;  Events, Items, Doors
    LDA $703000,X : STA $7ED8F0 : INX #2 ;  Events, Items, Doors
    LDA $703000,X : STA $7ED8F2 : INX #2 ;  Events, Items, Doors
    LDA $703000,X : STA $7ED8F4 : INX #2 ;  Events, Items, Doors
    LDA $703000,X : STA $7ED8F6 : INX #2 ;  Events, Items, Doors
    LDA $703000,X : STA $7ED8F8 : INX #2 ;  Events, Items, Doors
    LDA $703000,X : STA $7ED8FA : INX #2 ;  Events, Items, Doors
    LDA $703000,X : STA $7ED8FC : INX #2 ;  Events, Items, Doors
    LDA $703000,X : STA $7ED8FE : INX #2 ;  Events, Items, Doors
    LDA $703000,X : STA $7ED900 : INX #2 ;  Events, Items, Doors
    LDA $703000,X : STA $7ED902 : INX #2 ;  Events, Items, Doors
    LDA $703000,X : STA $7ED904 : INX #2 ;  Events, Items, Doors
    LDA $703000,X : STA $7ED906 : INX #2 ;  Events, Items, Doors
    LDA $703000,X : STA $7ED908 : INX #2 ;  Events, Items, Doors
    LDA $703000,X : STA $7ED90A : INX #2 ;  Events, Items, Doors
    LDA $703000,X : STA $7ED90C : INX #2 ;  Events, Items, Doors
    LDA $703000,X : STA $7ED90E : INX #2 ;  Events, Items, Doors
    LDA $703000,X : STA $7ED910 : INX #2 ;  Events, Items, Doors
    LDA $703000,X : STA $7ED912 : INX #2 ;  Events, Items, Doors
    LDA $703000,X : STA $7ED914 : INX #2 ;  Events, Items, Doors
    LDA $703000,X : STA $7ED916 : INX #2 ;  Events, Items, Doors
    LDA $703000,X : STA $7ED918 : INX #2 ;  Events, Items, Doors
    LDA $703000,X : STA $7ED91A : INX #2 ;  Events, Items, Doors
    LDA $703000,X : STA $7ED91C : INX #2 ;  Events, Items, Doors
    LDA $703000,X : STA $7ED91E : INX #2 ;  Events, Items, Doors
    RTL
}

custom_preset_enemy_data:
{   ; runs near the end of preset routine
    LDA !sram_custom_preset_slot : ASL : TAX
    LDA.l PresetSlot,X : TAX : LDY #$0000

  .loopEnemies
;    LDA $7031AE,X : STA $0F78,Y : INX #2 ;  Enemy ID
    LDA $7031AE,X : STA $0F7A,Y : INX #2 ;  Enemy X position
    LDA $7031AE,X : STA $0F7C,Y : INX #2 ;  Enemy X subposition
    LDA $7031AE,X : STA $0F7E,Y : INX #2 ;  Enemy Y position
    LDA $7031AE,X : STA $0F80,Y : INX #2 ;  Enemy Y subposition
;    LDA $7031AE,X : STA $0F82,Y : INX #2 ;  Enemy X radius
;    LDA $7031AE,X : STA $0F84,Y : INX #2 ;  Enemy Y radius
;    LDA $7031AE,X : STA $0F86,Y : INX #2 ;  Enemy Properties
;    LDA $7031AE,X : STA $0F88,Y : INX #2 ;  Enemy Extra Properties
    LDA $7031AE,X : STA $0F8A,Y : INX #2 ;  Enemy AI handler
    LDA $7031AE,X : STA $0F8C,Y : INX #2 ;  Enemy Health
    LDA $7031AE,X : STA $0F8E,Y : INX #2 ;  Enemy Spritemap pointer
    LDA $7031AE,X : STA $0F90,Y : INX #2 ;  Enemy Timer
    LDA $7031AE,X : STA $0F92,Y : INX #2 ;  Enemy Initialisation parameter / instruction list pointer
    LDA $7031AE,X : STA $0F94,Y : INX #2 ;  Enemy Instruction timer
;    LDA $7031AE,X : STA $0F96,Y : INX #2 ;  Enemy Palette index
;    LDA $7031AE,X : STA $0F98,Y : INX #2 ;  Enemy VRAM tiles index
;    LDA $7031AE,X : STA $0F9A,Y : INX #2 ;  Enemy Layer
    LDA $7031AE,X : STA $0F9C,Y : INX #2 ;  Enemy Flash timer
    LDA $7031AE,X : STA $0F9E,Y : INX #2 ;  Enemy Frozen timer
    LDA $7031AE,X : STA $0FA0,Y : INX #2 ;  Enemy Invincibility timer
;    LDA $7031AE,X : STA $0FA2,Y : INX #2 ;  Enemy Shake timer
    LDA $7031AE,X : STA $0FA4,Y : INX #2 ;  Enemy Frame counter
;    LDA $7031AE,X : STA $0FA6,Y : INX #2 ;  Enemy Bank
    LDA $7031AE,X : STA $0FA8,Y : INX #2 ;  Enemy AI variable, frequently function pointer
    LDA $7031AE,X : STA $0FAA,Y : INX #2 ;  Enemy AI variable
    LDA $7031AE,X : STA $0FAC,Y : INX #2 ;  Enemy AI variable
    LDA $7031AE,X : STA $0FAE,Y : INX #2 ;  Enemy AI variable
    LDA $7031AE,X : STA $0FB0,Y : INX #2 ;  Enemy AI variable
;    LDA $7031AE,X : STA $0FB2,Y : INX #2 ;  Enemy AI variable
;    LDA $7031AE,X : STA $0FB4,Y : INX #2 ;  Enemy Parameter 1
;    LDA $7031AE,X : STA $0FB6,Y : INX #2 ;  Enemy Parameter 2
    CPY #$0380 : BPL .done ; exit after enemy 13, zero indexed
    TYA : CLC : ADC #$0040 : TAY
    JMP .loopEnemies

  .done
    RTL
}

print pc, " custom presets end"
