; --------------
; Custom Presets
; --------------

print pc, " custom presets start"
custom_preset_save:
{
    LDA !sram_custom_preset_slot
    ASL : XBA : TAX ; multiply by 200h (slot offset)
    LDA #$5AFE : STA $F03000,X : INX #2 ; mark this slot as "SAFE" to load
    LDA #$01B0 : STA $F03000,X : INX #2 ; record slot size for future compatibility
    LDA $078B : STA $F03000,X : INX #2 ;  Elevator Index
    LDA $078D : STA $F03000,X : INX #2 ;  DDB
    LDA $078F : STA $F03000,X : INX #2 ;  DoorOut Index
    LDA $079B : STA $F03000,X : INX #2 ;  MDB
    LDA $079F : STA $F03000,X : INX #2 ;  Region
    LDA $07C3 : STA $F03000,X : INX #2 ;  GFX Pointers
    LDA $07C5 : STA $F03000,X : INX #2 ;  GFX Pointers
    LDA $07C7 : STA $F03000,X : INX #2 ;  GFX Pointers
    LDA $07F3 : STA $F03000,X : INX #2 ;  Music Bank
    LDA $07F5 : STA $F03000,X : INX #2 ;  Music Track
    LDA $090F : STA $F03000,X : INX #2 ;  Screen subpixel X position
    LDA $0911 : STA $F03000,X : INX #2 ;  Screen X position in pixels
    LDA $0913 : STA $F03000,X : INX #2 ;  Screen subpixel Y position
    LDA $0915 : STA $F03000,X : INX #2 ;  Screen Y position in pixels
    LDA $093F : STA $F03000,X : INX #2 ;  Ceres escape flag
    LDA $09A2 : STA $F03000,X : INX #2 ;  Equipped Items
    LDA $09A4 : STA $F03000,X : INX #2 ;  Collected Items
    LDA $09A6 : STA $F03000,X : INX #2 ;  Beams
    LDA $09A8 : STA $F03000,X : INX #2 ;  Beams
    LDA $09C0 : STA $F03000,X : INX #2 ;  Manual/Auto reserve tank
    LDA $09C2 : STA $F03000,X : INX #2 ;  Health
    LDA $09C4 : STA $F03000,X : INX #2 ;  Max health
    LDA $09C6 : STA $F03000,X : INX #2 ;  Missiles
    LDA $09C8 : STA $F03000,X : INX #2 ;  Max missiles
    LDA $09CA : STA $F03000,X : INX #2 ;  Supers
    LDA $09CC : STA $F03000,X : INX #2 ;  Max supers
    LDA $09CE : STA $F03000,X : INX #2 ;  Pbs
    LDA $09D0 : STA $F03000,X : INX #2 ;  Max pbs
    LDA $09D2 : STA $F03000,X : INX #2 ;  Currently selected item
    LDA $09D4 : STA $F03000,X : INX #2 ;  Max reserves
    LDA $09D6 : STA $F03000,X : INX #2 ;  Reserves
    LDA $0A1C : STA $F03000,X : INX #2 ;  Samus position/state
    LDA $0A1E : STA $F03000,X : INX #2 ;  More position/state
    LDA $0A68 : STA $F03000,X : INX #2 ;  Flash suit
    LDA $0A76 : STA $F03000,X : INX #2 ;  Hyper beam
    LDA $0AF6 : STA $F03000,X : INX #2 ;  Samus X
    LDA $0AFA : STA $F03000,X : INX #2 ;  Samus Y
    LDA $0B3F : STA $F03000,X : INX #2 ;  Blue suit
    LDA $7ED7C0 : STA $F03000,X : INX #2 ;  SRAM copy
    LDA $7ED7C2 : STA $F03000,X : INX #2 ;  SRAM copy
    LDA $7ED7C4 : STA $F03000,X : INX #2 ;  SRAM copy
    LDA $7ED7C6 : STA $F03000,X : INX #2 ;  SRAM copy
    LDA $7ED7C8 : STA $F03000,X : INX #2 ;  SRAM copy
    LDA $7ED7CA : STA $F03000,X : INX #2 ;  SRAM copy
    LDA $7ED7CC : STA $F03000,X : INX #2 ;  SRAM copy
    LDA $7ED7CE : STA $F03000,X : INX #2 ;  SRAM copy
    LDA $7ED7D0 : STA $F03000,X : INX #2 ;  SRAM copy
    LDA $7ED7D2 : STA $F03000,X : INX #2 ;  SRAM copy
    LDA $7ED7D4 : STA $F03000,X : INX #2 ;  SRAM copy
    LDA $7ED7D6 : STA $F03000,X : INX #2 ;  SRAM copy
    LDA $7ED7D8 : STA $F03000,X : INX #2 ;  SRAM copy
    LDA $7ED7DA : STA $F03000,X : INX #2 ;  SRAM copy
    LDA $7ED7DC : STA $F03000,X : INX #2 ;  SRAM copy
    LDA $7ED7DE : STA $F03000,X : INX #2 ;  SRAM copy
    LDA $7ED7E0 : STA $F03000,X : INX #2 ;  SRAM copy
    LDA $7ED7E2 : STA $F03000,X : INX #2 ;  SRAM copy
    LDA $7ED7E4 : STA $F03000,X : INX #2 ;  SRAM copy
    LDA $7ED7E6 : STA $F03000,X : INX #2 ;  SRAM copy
    LDA $7ED7E8 : STA $F03000,X : INX #2 ;  SRAM copy
    LDA $7ED7EA : STA $F03000,X : INX #2 ;  SRAM copy
    LDA $7ED7EC : STA $F03000,X : INX #2 ;  SRAM copy
    LDA $7ED7EE : STA $F03000,X : INX #2 ;  SRAM copy
    LDA $7ED7F0 : STA $F03000,X : INX #2 ;  SRAM copy
    LDA $7ED7F2 : STA $F03000,X : INX #2 ;  SRAM copy
    LDA $7ED7F4 : STA $F03000,X : INX #2 ;  SRAM copy
    LDA $7ED7F6 : STA $F03000,X : INX #2 ;  SRAM copy
    LDA $7ED7F8 : STA $F03000,X : INX #2 ;  SRAM copy
    LDA $7ED7FA : STA $F03000,X : INX #2 ;  SRAM copy
    LDA $7ED7FC : STA $F03000,X : INX #2 ;  SRAM copy
    LDA $7ED7FE : STA $F03000,X : INX #2 ;  SRAM copy
    LDA $7ED800 : STA $F03000,X : INX #2 ;  SRAM copy
    LDA $7ED802 : STA $F03000,X : INX #2 ;  SRAM copy
    LDA $7ED804 : STA $F03000,X : INX #2 ;  SRAM copy
    LDA $7ED806 : STA $F03000,X : INX #2 ;  SRAM copy
    LDA $7ED808 : STA $F03000,X : INX #2 ;  SRAM copy
    LDA $7ED80A : STA $F03000,X : INX #2 ;  SRAM copy
    LDA $7ED80C : STA $F03000,X : INX #2 ;  SRAM copy
    LDA $7ED80E : STA $F03000,X : INX #2 ;  SRAM copy
    LDA $7ED810 : STA $F03000,X : INX #2 ;  SRAM copy
    LDA $7ED812 : STA $F03000,X : INX #2 ;  SRAM copy
    LDA $7ED814 : STA $F03000,X : INX #2 ;  SRAM copy
    LDA $7ED816 : STA $F03000,X : INX #2 ;  SRAM copy
    LDA $7ED818 : STA $F03000,X : INX #2 ;  SRAM copy
    LDA $7ED81A : STA $F03000,X : INX #2 ;  SRAM copy
    LDA $7ED81C : STA $F03000,X : INX #2 ;  SRAM copy
    LDA $7ED81E : STA $F03000,X : INX #2 ;  SRAM copy
    LDA $7ED820 : STA $F03000,X : INX #2 ;  Events, Items, Doors
    LDA $7ED822 : STA $F03000,X : INX #2 ;  Events, Items, Doors
    LDA $7ED824 : STA $F03000,X : INX #2 ;  Events, Items, Doors
    LDA $7ED826 : STA $F03000,X : INX #2 ;  Events, Items, Doors
    LDA $7ED828 : STA $F03000,X : INX #2 ;  Events, Items, Doors
    LDA $7ED82A : STA $F03000,X : INX #2 ;  Events, Items, Doors
    LDA $7ED82C : STA $F03000,X : INX #2 ;  Events, Items, Doors
    LDA $7ED82E : STA $F03000,X : INX #2 ;  Events, Items, Doors
    LDA $7ED830 : STA $F03000,X : INX #2 ;  Events, Items, Doors
    LDA $7ED832 : STA $F03000,X : INX #2 ;  Events, Items, Doors
    LDA $7ED834 : STA $F03000,X : INX #2 ;  Events, Items, Doors
    LDA $7ED836 : STA $F03000,X : INX #2 ;  Events, Items, Doors
    LDA $7ED838 : STA $F03000,X : INX #2 ;  Events, Items, Doors
    LDA $7ED83A : STA $F03000,X : INX #2 ;  Events, Items, Doors
    LDA $7ED83C : STA $F03000,X : INX #2 ;  Events, Items, Doors
    LDA $7ED83E : STA $F03000,X : INX #2 ;  Events, Items, Doors
    LDA $7ED840 : STA $F03000,X : INX #2 ;  Events, Items, Doors
    LDA $7ED842 : STA $F03000,X : INX #2 ;  Events, Items, Doors
    LDA $7ED844 : STA $F03000,X : INX #2 ;  Events, Items, Doors
    LDA $7ED846 : STA $F03000,X : INX #2 ;  Events, Items, Doors
    LDA $7ED848 : STA $F03000,X : INX #2 ;  Events, Items, Doors
    LDA $7ED84A : STA $F03000,X : INX #2 ;  Events, Items, Doors
    LDA $7ED84C : STA $F03000,X : INX #2 ;  Events, Items, Doors
    LDA $7ED84E : STA $F03000,X : INX #2 ;  Events, Items, Doors
    LDA $7ED850 : STA $F03000,X : INX #2 ;  Events, Items, Doors
    LDA $7ED852 : STA $F03000,X : INX #2 ;  Events, Items, Doors
    LDA $7ED854 : STA $F03000,X : INX #2 ;  Events, Items, Doors
    LDA $7ED856 : STA $F03000,X : INX #2 ;  Events, Items, Doors
    LDA $7ED858 : STA $F03000,X : INX #2 ;  Events, Items, Doors
    LDA $7ED85A : STA $F03000,X : INX #2 ;  Events, Items, Doors
    LDA $7ED85C : STA $F03000,X : INX #2 ;  Events, Items, Doors
    LDA $7ED85E : STA $F03000,X : INX #2 ;  Events, Items, Doors
    LDA $7ED860 : STA $F03000,X : INX #2 ;  Events, Items, Doors
    LDA $7ED862 : STA $F03000,X : INX #2 ;  Events, Items, Doors
    LDA $7ED864 : STA $F03000,X : INX #2 ;  Events, Items, Doors
    LDA $7ED866 : STA $F03000,X : INX #2 ;  Events, Items, Doors
    LDA $7ED868 : STA $F03000,X : INX #2 ;  Events, Items, Doors
    LDA $7ED86A : STA $F03000,X : INX #2 ;  Events, Items, Doors
    LDA $7ED86C : STA $F03000,X : INX #2 ;  Events, Items, Doors
    LDA $7ED86E : STA $F03000,X : INX #2 ;  Events, Items, Doors
    LDA $7ED870 : STA $F03000,X : INX #2 ;  Events, Items, Doors
    LDA $7ED872 : STA $F03000,X : INX #2 ;  Events, Items, Doors
    LDA $7ED874 : STA $F03000,X : INX #2 ;  Events, Items, Doors
    LDA $7ED876 : STA $F03000,X : INX #2 ;  Events, Items, Doors
    LDA $7ED878 : STA $F03000,X : INX #2 ;  Events, Items, Doors
    LDA $7ED87A : STA $F03000,X : INX #2 ;  Events, Items, Doors
    LDA $7ED87C : STA $F03000,X : INX #2 ;  Events, Items, Doors
    LDA $7ED87E : STA $F03000,X : INX #2 ;  Events, Items, Doors
    LDA $7ED880 : STA $F03000,X : INX #2 ;  Events, Items, Doors
    LDA $7ED882 : STA $F03000,X : INX #2 ;  Events, Items, Doors
    LDA $7ED884 : STA $F03000,X : INX #2 ;  Events, Items, Doors
    LDA $7ED886 : STA $F03000,X : INX #2 ;  Events, Items, Doors
    LDA $7ED888 : STA $F03000,X : INX #2 ;  Events, Items, Doors
    LDA $7ED88A : STA $F03000,X : INX #2 ;  Events, Items, Doors
    LDA $7ED88C : STA $F03000,X : INX #2 ;  Events, Items, Doors
    LDA $7ED88E : STA $F03000,X : INX #2 ;  Events, Items, Doors
    LDA $7ED890 : STA $F03000,X : INX #2 ;  Events, Items, Doors
    LDA $7ED892 : STA $F03000,X : INX #2 ;  Events, Items, Doors
    LDA $7ED894 : STA $F03000,X : INX #2 ;  Events, Items, Doors
    LDA $7ED896 : STA $F03000,X : INX #2 ;  Events, Items, Doors
    LDA $7ED898 : STA $F03000,X : INX #2 ;  Events, Items, Doors
    LDA $7ED89A : STA $F03000,X : INX #2 ;  Events, Items, Doors
    LDA $7ED89C : STA $F03000,X : INX #2 ;  Events, Items, Doors
    LDA $7ED89E : STA $F03000,X : INX #2 ;  Events, Items, Doors
    LDA $7ED8A0 : STA $F03000,X : INX #2 ;  Events, Items, Doors
    LDA $7ED8A2 : STA $F03000,X : INX #2 ;  Events, Items, Doors
    LDA $7ED8A4 : STA $F03000,X : INX #2 ;  Events, Items, Doors
    LDA $7ED8A6 : STA $F03000,X : INX #2 ;  Events, Items, Doors
    LDA $7ED8A8 : STA $F03000,X : INX #2 ;  Events, Items, Doors
    LDA $7ED8AA : STA $F03000,X : INX #2 ;  Events, Items, Doors
    LDA $7ED8AC : STA $F03000,X : INX #2 ;  Events, Items, Doors
    LDA $7ED8AE : STA $F03000,X : INX #2 ;  Events, Items, Doors
    LDA $7ED8B0 : STA $F03000,X : INX #2 ;  Events, Items, Doors
    LDA $7ED8B2 : STA $F03000,X : INX #2 ;  Events, Items, Doors
    LDA $7ED8B4 : STA $F03000,X : INX #2 ;  Events, Items, Doors
    LDA $7ED8B6 : STA $F03000,X : INX #2 ;  Events, Items, Doors
    LDA $7ED8B8 : STA $F03000,X : INX #2 ;  Events, Items, Doors
    LDA $7ED8BA : STA $F03000,X : INX #2 ;  Events, Items, Doors
    LDA $7ED8BC : STA $F03000,X : INX #2 ;  Events, Items, Doors
    LDA $7ED8BE : STA $F03000,X : INX #2 ;  Events, Items, Doors
    LDA $7ED8C0 : STA $F03000,X : INX #2 ;  Events, Items, Doors
    LDA $7ED8C2 : STA $F03000,X : INX #2 ;  Events, Items, Doors
    LDA $7ED8C4 : STA $F03000,X : INX #2 ;  Events, Items, Doors
    LDA $7ED8C6 : STA $F03000,X : INX #2 ;  Events, Items, Doors
    LDA $7ED8C8 : STA $F03000,X : INX #2 ;  Events, Items, Doors
    LDA $7ED8CA : STA $F03000,X : INX #2 ;  Events, Items, Doors
    LDA $7ED8CC : STA $F03000,X : INX #2 ;  Events, Items, Doors
    LDA $7ED8CE : STA $F03000,X : INX #2 ;  Events, Items, Doors
    LDA $7ED8D0 : STA $F03000,X : INX #2 ;  Events, Items, Doors
    LDA $7ED8D2 : STA $F03000,X : INX #2 ;  Events, Items, Doors
    LDA $7ED8D4 : STA $F03000,X : INX #2 ;  Events, Items, Doors
    LDA $7ED8D6 : STA $F03000,X : INX #2 ;  Events, Items, Doors
    LDA $7ED8D8 : STA $F03000,X : INX #2 ;  Events, Items, Doors
    LDA $7ED8DA : STA $F03000,X : INX #2 ;  Events, Items, Doors
    LDA $7ED8DC : STA $F03000,X : INX #2 ;  Events, Items, Doors
    LDA $7ED8DE : STA $F03000,X : INX #2 ;  Events, Items, Doors
    LDA $7ED8E0 : STA $F03000,X : INX #2 ;  Events, Items, Doors
    LDA $7ED8E2 : STA $F03000,X : INX #2 ;  Events, Items, Doors
    LDA $7ED8E4 : STA $F03000,X : INX #2 ;  Events, Items, Doors
    LDA $7ED8E6 : STA $F03000,X : INX #2 ;  Events, Items, Doors
    LDA $7ED8E8 : STA $F03000,X : INX #2 ;  Events, Items, Doors
    LDA $7ED8EA : STA $F03000,X : INX #2 ;  Events, Items, Doors
    LDA $7ED8EC : STA $F03000,X : INX #2 ;  Events, Items, Doors
    LDA $7ED8EE : STA $F03000,X : INX #2 ;  Events, Items, Doors
    LDA $7ED8F0 : STA $F03000,X : INX #2 ;  Events, Items, Doors
    LDA $7ED8F2 : STA $F03000,X : INX #2 ;  Events, Items, Doors
    LDA $7ED8F4 : STA $F03000,X : INX #2 ;  Events, Items, Doors
    LDA $7ED8F6 : STA $F03000,X : INX #2 ;  Events, Items, Doors
    LDA $7ED8F8 : STA $F03000,X : INX #2 ;  Events, Items, Doors
    LDA $7ED8FA : STA $F03000,X : INX #2 ;  Events, Items, Doors
    LDA $7ED8FC : STA $F03000,X : INX #2 ;  Events, Items, Doors
    LDA $7ED8FE : STA $F03000,X : INX #2 ;  Events, Items, Doors
    LDA $7ED900 : STA $F03000,X : INX #2 ;  Events, Items, Doors
    LDA $7ED902 : STA $F03000,X : INX #2 ;  Events, Items, Doors
    LDA $7ED904 : STA $F03000,X : INX #2 ;  Events, Items, Doors
    LDA $7ED906 : STA $F03000,X : INX #2 ;  Events, Items, Doors
    LDA $7ED908 : STA $F03000,X : INX #2 ;  Events, Items, Doors
    LDA $7ED90A : STA $F03000,X : INX #2 ;  Events, Items, Doors
    LDA $7ED90C : STA $F03000,X : INX #2 ;  Events, Items, Doors
    LDA $7ED90E : STA $F03000,X : INX #2 ;  Events, Items, Doors
    LDA $7ED910 : STA $F03000,X : INX #2 ;  Events, Items, Doors
    LDA $7ED912 : STA $F03000,X : INX #2 ;  Events, Items, Doors
    LDA $7ED914 : STA $F03000,X : INX #2 ;  Events, Items, Doors
    LDA $7ED916 : STA $F03000,X : INX #2 ;  Events, Items, Doors
    LDA $7ED918 : STA $F03000,X : INX #2 ;  Events, Items, Doors
    LDA $7ED91A : STA $F03000,X : INX #2 ;  Events, Items, Doors
    LDA $7ED91C : STA $F03000,X : INX #2 ;  Events, Items, Doors
    LDA $7ED91E : STA $F03000,X : INX #2 ;  Events, Items, Doors
    RTL
}

custom_preset_load:
{
    LDA !sram_custom_preset_slot
    ASL : XBA : TAX ; multiply by 200h
    INX #2 ; skip past "5AFE" word
    INX #2 ; skip past size for now
    LDA $F03000,X : STA $078B : INX #2 ;  Elevator Index
    LDA $F03000,X : STA $078D : INX #2 ;  DDB
    LDA $F03000,X : STA $078F : INX #2 ;  DoorOut Index
    LDA $F03000,X : STA $079B : INX #2 ;  MDB
    LDA $F03000,X : STA $079F : INX #2 ;  Region
    LDA $F03000,X : STA $07C3 : INX #2 ;  GFX Pointers
    LDA $F03000,X : STA $07C5 : INX #2 ;  GFX Pointers
    LDA $F03000,X : STA $07C7 : INX #2 ;  GFX Pointers
    LDA $F03000,X : STA $07F3 : INX #2 ;  Music Bank
    LDA $F03000,X : STA $07F5 : INX #2 ;  Music Track
    LDA $F03000,X : STA $090F : INX #2 ;  Screen subpixel X position
    LDA $F03000,X : STA $0911 : INX #2 ;  Screen X position in pixels
    LDA $F03000,X : STA $0913 : INX #2 ;  Screen subpixel Y position
    LDA $F03000,X : STA $0915 : INX #2 ;  Screen Y position in pixels
    LDA $F03000,X : STA $093F : INX #2 ;  Ceres escape flag
    LDA $F03000,X : STA $09A2 : INX #2 ;  Equipped Items
    LDA $F03000,X : STA $09A4 : INX #2 ;  Collected Items
    LDA $F03000,X : STA $09A6 : INX #2 ;  Beams
    LDA $F03000,X : STA $09A8 : INX #2 ;  Beams
    LDA $F03000,X : STA $09C0 : INX #2 ;  Manual/Auto reserve tank
    LDA $F03000,X : STA $09C2 : INX #2 ;  Health
    LDA $F03000,X : STA $09C4 : INX #2 ;  Max health
    LDA $F03000,X : STA $09C6 : INX #2 ;  Missiles
    LDA $F03000,X : STA $09C8 : INX #2 ;  Max missiles
    LDA $F03000,X : STA $09CA : INX #2 ;  Supers
    LDA $F03000,X : STA $09CC : INX #2 ;  Max supers
    LDA $F03000,X : STA $09CE : INX #2 ;  Pbs
    LDA $F03000,X : STA $09D0 : INX #2 ;  Max pbs
    LDA $F03000,X : STA $09D2 : INX #2 ;  Currently selected item
    LDA $F03000,X : STA $09D4 : INX #2 ;  Max reserves
    LDA $F03000,X : STA $09D6 : INX #2 ;  Reserves
    LDA $F03000,X : STA $0A1C : INX #2 ;  Samus position/state
    LDA $F03000,X : STA $0A1E : INX #2 ;  More position/state
    LDA $F03000,X : STA $0A68 : INX #2 ;  Flash suit
    LDA $F03000,X : STA $0A76 : INX #2 ;  Hyper beam
    LDA $F03000,X : STA $0AF6 : INX #2 ;  Samus X
    LDA $F03000,X : STA $0AFA : INX #2 ;  Samus Y
    LDA $F03000,X : STA $0B3F : INX #2 ;  Blue suit
    LDA $F03000,X : STA $7ED7C0 : INX #2 ;  SRAM copy
    LDA $F03000,X : STA $7ED7C2 : INX #2 ;  SRAM copy
    LDA $F03000,X : STA $7ED7C4 : INX #2 ;  SRAM copy
    LDA $F03000,X : STA $7ED7C6 : INX #2 ;  SRAM copy
    LDA $F03000,X : STA $7ED7C8 : INX #2 ;  SRAM copy
    LDA $F03000,X : STA $7ED7CA : INX #2 ;  SRAM copy
    LDA $F03000,X : STA $7ED7CC : INX #2 ;  SRAM copy
    LDA $F03000,X : STA $7ED7CE : INX #2 ;  SRAM copy
    LDA $F03000,X : STA $7ED7D0 : INX #2 ;  SRAM copy
    LDA $F03000,X : STA $7ED7D2 : INX #2 ;  SRAM copy
    LDA $F03000,X : STA $7ED7D4 : INX #2 ;  SRAM copy
    LDA $F03000,X : STA $7ED7D6 : INX #2 ;  SRAM copy
    LDA $F03000,X : STA $7ED7D8 : INX #2 ;  SRAM copy
    LDA $F03000,X : STA $7ED7DA : INX #2 ;  SRAM copy
    LDA $F03000,X : STA $7ED7DC : INX #2 ;  SRAM copy
    LDA $F03000,X : STA $7ED7DE : INX #2 ;  SRAM copy
    LDA $F03000,X : STA $7ED7E0 : INX #2 ;  SRAM copy
    LDA $F03000,X : STA $7ED7E2 : INX #2 ;  SRAM copy
    LDA $F03000,X : STA $7ED7E4 : INX #2 ;  SRAM copy
    LDA $F03000,X : STA $7ED7E6 : INX #2 ;  SRAM copy
    LDA $F03000,X : STA $7ED7E8 : INX #2 ;  SRAM copy
    LDA $F03000,X : STA $7ED7EA : INX #2 ;  SRAM copy
    LDA $F03000,X : STA $7ED7EC : INX #2 ;  SRAM copy
    LDA $F03000,X : STA $7ED7EE : INX #2 ;  SRAM copy
    LDA $F03000,X : STA $7ED7F0 : INX #2 ;  SRAM copy
    LDA $F03000,X : STA $7ED7F2 : INX #2 ;  SRAM copy
    LDA $F03000,X : STA $7ED7F4 : INX #2 ;  SRAM copy
    LDA $F03000,X : STA $7ED7F6 : INX #2 ;  SRAM copy
    LDA $F03000,X : STA $7ED7F8 : INX #2 ;  SRAM copy
    LDA $F03000,X : STA $7ED7FA : INX #2 ;  SRAM copy
    LDA $F03000,X : STA $7ED7FC : INX #2 ;  SRAM copy
    LDA $F03000,X : STA $7ED7FE : INX #2 ;  SRAM copy
    LDA $F03000,X : STA $7ED800 : INX #2 ;  SRAM copy
    LDA $F03000,X : STA $7ED802 : INX #2 ;  SRAM copy
    LDA $F03000,X : STA $7ED804 : INX #2 ;  SRAM copy
    LDA $F03000,X : STA $7ED806 : INX #2 ;  SRAM copy
    LDA $F03000,X : STA $7ED808 : INX #2 ;  SRAM copy
    LDA $F03000,X : STA $7ED80A : INX #2 ;  SRAM copy
    LDA $F03000,X : STA $7ED80C : INX #2 ;  SRAM copy
    LDA $F03000,X : STA $7ED80E : INX #2 ;  SRAM copy
    LDA $F03000,X : STA $7ED810 : INX #2 ;  SRAM copy
    LDA $F03000,X : STA $7ED812 : INX #2 ;  SRAM copy
    LDA $F03000,X : STA $7ED814 : INX #2 ;  SRAM copy
    LDA $F03000,X : STA $7ED816 : INX #2 ;  SRAM copy
    LDA $F03000,X : STA $7ED818 : INX #2 ;  SRAM copy
    LDA $F03000,X : STA $7ED81A : INX #2 ;  SRAM copy
    LDA $F03000,X : STA $7ED81C : INX #2 ;  SRAM copy
    LDA $F03000,X : STA $7ED81E : INX #2 ;  SRAM copy
    LDA $F03000,X : STA $7ED820 : INX #2 ;  Events, Items, Doors
    LDA $F03000,X : STA $7ED822 : INX #2 ;  Events, Items, Doors
    LDA $F03000,X : STA $7ED824 : INX #2 ;  Events, Items, Doors
    LDA $F03000,X : STA $7ED826 : INX #2 ;  Events, Items, Doors
    LDA $F03000,X : STA $7ED828 : INX #2 ;  Events, Items, Doors
    LDA $F03000,X : STA $7ED82A : INX #2 ;  Events, Items, Doors
    LDA $F03000,X : STA $7ED82C : INX #2 ;  Events, Items, Doors
    LDA $F03000,X : STA $7ED82E : INX #2 ;  Events, Items, Doors
    LDA $F03000,X : STA $7ED830 : INX #2 ;  Events, Items, Doors
    LDA $F03000,X : STA $7ED832 : INX #2 ;  Events, Items, Doors
    LDA $F03000,X : STA $7ED834 : INX #2 ;  Events, Items, Doors
    LDA $F03000,X : STA $7ED836 : INX #2 ;  Events, Items, Doors
    LDA $F03000,X : STA $7ED838 : INX #2 ;  Events, Items, Doors
    LDA $F03000,X : STA $7ED83A : INX #2 ;  Events, Items, Doors
    LDA $F03000,X : STA $7ED83C : INX #2 ;  Events, Items, Doors
    LDA $F03000,X : STA $7ED83E : INX #2 ;  Events, Items, Doors
    LDA $F03000,X : STA $7ED840 : INX #2 ;  Events, Items, Doors
    LDA $F03000,X : STA $7ED842 : INX #2 ;  Events, Items, Doors
    LDA $F03000,X : STA $7ED844 : INX #2 ;  Events, Items, Doors
    LDA $F03000,X : STA $7ED846 : INX #2 ;  Events, Items, Doors
    LDA $F03000,X : STA $7ED848 : INX #2 ;  Events, Items, Doors
    LDA $F03000,X : STA $7ED84A : INX #2 ;  Events, Items, Doors
    LDA $F03000,X : STA $7ED84C : INX #2 ;  Events, Items, Doors
    LDA $F03000,X : STA $7ED84E : INX #2 ;  Events, Items, Doors
    LDA $F03000,X : STA $7ED850 : INX #2 ;  Events, Items, Doors
    LDA $F03000,X : STA $7ED852 : INX #2 ;  Events, Items, Doors
    LDA $F03000,X : STA $7ED854 : INX #2 ;  Events, Items, Doors
    LDA $F03000,X : STA $7ED856 : INX #2 ;  Events, Items, Doors
    LDA $F03000,X : STA $7ED858 : INX #2 ;  Events, Items, Doors
    LDA $F03000,X : STA $7ED85A : INX #2 ;  Events, Items, Doors
    LDA $F03000,X : STA $7ED85C : INX #2 ;  Events, Items, Doors
    LDA $F03000,X : STA $7ED85E : INX #2 ;  Events, Items, Doors
    LDA $F03000,X : STA $7ED860 : INX #2 ;  Events, Items, Doors
    LDA $F03000,X : STA $7ED862 : INX #2 ;  Events, Items, Doors
    LDA $F03000,X : STA $7ED864 : INX #2 ;  Events, Items, Doors
    LDA $F03000,X : STA $7ED866 : INX #2 ;  Events, Items, Doors
    LDA $F03000,X : STA $7ED868 : INX #2 ;  Events, Items, Doors
    LDA $F03000,X : STA $7ED86A : INX #2 ;  Events, Items, Doors
    LDA $F03000,X : STA $7ED86C : INX #2 ;  Events, Items, Doors
    LDA $F03000,X : STA $7ED86E : INX #2 ;  Events, Items, Doors
    LDA $F03000,X : STA $7ED870 : INX #2 ;  Events, Items, Doors
    LDA $F03000,X : STA $7ED872 : INX #2 ;  Events, Items, Doors
    LDA $F03000,X : STA $7ED874 : INX #2 ;  Events, Items, Doors
    LDA $F03000,X : STA $7ED876 : INX #2 ;  Events, Items, Doors
    LDA $F03000,X : STA $7ED878 : INX #2 ;  Events, Items, Doors
    LDA $F03000,X : STA $7ED87A : INX #2 ;  Events, Items, Doors
    LDA $F03000,X : STA $7ED87C : INX #2 ;  Events, Items, Doors
    LDA $F03000,X : STA $7ED87E : INX #2 ;  Events, Items, Doors
    LDA $F03000,X : STA $7ED880 : INX #2 ;  Events, Items, Doors
    LDA $F03000,X : STA $7ED882 : INX #2 ;  Events, Items, Doors
    LDA $F03000,X : STA $7ED884 : INX #2 ;  Events, Items, Doors
    LDA $F03000,X : STA $7ED886 : INX #2 ;  Events, Items, Doors
    LDA $F03000,X : STA $7ED888 : INX #2 ;  Events, Items, Doors
    LDA $F03000,X : STA $7ED88A : INX #2 ;  Events, Items, Doors
    LDA $F03000,X : STA $7ED88C : INX #2 ;  Events, Items, Doors
    LDA $F03000,X : STA $7ED88E : INX #2 ;  Events, Items, Doors
    LDA $F03000,X : STA $7ED890 : INX #2 ;  Events, Items, Doors
    LDA $F03000,X : STA $7ED892 : INX #2 ;  Events, Items, Doors
    LDA $F03000,X : STA $7ED894 : INX #2 ;  Events, Items, Doors
    LDA $F03000,X : STA $7ED896 : INX #2 ;  Events, Items, Doors
    LDA $F03000,X : STA $7ED898 : INX #2 ;  Events, Items, Doors
    LDA $F03000,X : STA $7ED89A : INX #2 ;  Events, Items, Doors
    LDA $F03000,X : STA $7ED89C : INX #2 ;  Events, Items, Doors
    LDA $F03000,X : STA $7ED89E : INX #2 ;  Events, Items, Doors
    LDA $F03000,X : STA $7ED8A0 : INX #2 ;  Events, Items, Doors
    LDA $F03000,X : STA $7ED8A2 : INX #2 ;  Events, Items, Doors
    LDA $F03000,X : STA $7ED8A4 : INX #2 ;  Events, Items, Doors
    LDA $F03000,X : STA $7ED8A6 : INX #2 ;  Events, Items, Doors
    LDA $F03000,X : STA $7ED8A8 : INX #2 ;  Events, Items, Doors
    LDA $F03000,X : STA $7ED8AA : INX #2 ;  Events, Items, Doors
    LDA $F03000,X : STA $7ED8AC : INX #2 ;  Events, Items, Doors
    LDA $F03000,X : STA $7ED8AE : INX #2 ;  Events, Items, Doors
    LDA $F03000,X : STA $7ED8B0 : INX #2 ;  Events, Items, Doors
    LDA $F03000,X : STA $7ED8B2 : INX #2 ;  Events, Items, Doors
    LDA $F03000,X : STA $7ED8B4 : INX #2 ;  Events, Items, Doors
    LDA $F03000,X : STA $7ED8B6 : INX #2 ;  Events, Items, Doors
    LDA $F03000,X : STA $7ED8B8 : INX #2 ;  Events, Items, Doors
    LDA $F03000,X : STA $7ED8BA : INX #2 ;  Events, Items, Doors
    LDA $F03000,X : STA $7ED8BC : INX #2 ;  Events, Items, Doors
    LDA $F03000,X : STA $7ED8BE : INX #2 ;  Events, Items, Doors
    LDA $F03000,X : STA $7ED8C0 : INX #2 ;  Events, Items, Doors
    LDA $F03000,X : STA $7ED8C2 : INX #2 ;  Events, Items, Doors
    LDA $F03000,X : STA $7ED8C4 : INX #2 ;  Events, Items, Doors
    LDA $F03000,X : STA $7ED8C6 : INX #2 ;  Events, Items, Doors
    LDA $F03000,X : STA $7ED8C8 : INX #2 ;  Events, Items, Doors
    LDA $F03000,X : STA $7ED8CA : INX #2 ;  Events, Items, Doors
    LDA $F03000,X : STA $7ED8CC : INX #2 ;  Events, Items, Doors
    LDA $F03000,X : STA $7ED8CE : INX #2 ;  Events, Items, Doors
    LDA $F03000,X : STA $7ED8D0 : INX #2 ;  Events, Items, Doors
    LDA $F03000,X : STA $7ED8D2 : INX #2 ;  Events, Items, Doors
    LDA $F03000,X : STA $7ED8D4 : INX #2 ;  Events, Items, Doors
    LDA $F03000,X : STA $7ED8D6 : INX #2 ;  Events, Items, Doors
    LDA $F03000,X : STA $7ED8D8 : INX #2 ;  Events, Items, Doors
    LDA $F03000,X : STA $7ED8DA : INX #2 ;  Events, Items, Doors
    LDA $F03000,X : STA $7ED8DC : INX #2 ;  Events, Items, Doors
    LDA $F03000,X : STA $7ED8DE : INX #2 ;  Events, Items, Doors
    LDA $F03000,X : STA $7ED8E0 : INX #2 ;  Events, Items, Doors
    LDA $F03000,X : STA $7ED8E2 : INX #2 ;  Events, Items, Doors
    LDA $F03000,X : STA $7ED8E4 : INX #2 ;  Events, Items, Doors
    LDA $F03000,X : STA $7ED8E6 : INX #2 ;  Events, Items, Doors
    LDA $F03000,X : STA $7ED8E8 : INX #2 ;  Events, Items, Doors
    LDA $F03000,X : STA $7ED8EA : INX #2 ;  Events, Items, Doors
    LDA $F03000,X : STA $7ED8EC : INX #2 ;  Events, Items, Doors
    LDA $F03000,X : STA $7ED8EE : INX #2 ;  Events, Items, Doors
    LDA $F03000,X : STA $7ED8F0 : INX #2 ;  Events, Items, Doors
    LDA $F03000,X : STA $7ED8F2 : INX #2 ;  Events, Items, Doors
    LDA $F03000,X : STA $7ED8F4 : INX #2 ;  Events, Items, Doors
    LDA $F03000,X : STA $7ED8F6 : INX #2 ;  Events, Items, Doors
    LDA $F03000,X : STA $7ED8F8 : INX #2 ;  Events, Items, Doors
    LDA $F03000,X : STA $7ED8FA : INX #2 ;  Events, Items, Doors
    LDA $F03000,X : STA $7ED8FC : INX #2 ;  Events, Items, Doors
    LDA $F03000,X : STA $7ED8FE : INX #2 ;  Events, Items, Doors
    LDA $F03000,X : STA $7ED900 : INX #2 ;  Events, Items, Doors
    LDA $F03000,X : STA $7ED902 : INX #2 ;  Events, Items, Doors
    LDA $F03000,X : STA $7ED904 : INX #2 ;  Events, Items, Doors
    LDA $F03000,X : STA $7ED906 : INX #2 ;  Events, Items, Doors
    LDA $F03000,X : STA $7ED908 : INX #2 ;  Events, Items, Doors
    LDA $F03000,X : STA $7ED90A : INX #2 ;  Events, Items, Doors
    LDA $F03000,X : STA $7ED90C : INX #2 ;  Events, Items, Doors
    LDA $F03000,X : STA $7ED90E : INX #2 ;  Events, Items, Doors
    LDA $F03000,X : STA $7ED910 : INX #2 ;  Events, Items, Doors
    LDA $F03000,X : STA $7ED912 : INX #2 ;  Events, Items, Doors
    LDA $F03000,X : STA $7ED914 : INX #2 ;  Events, Items, Doors
    LDA $F03000,X : STA $7ED916 : INX #2 ;  Events, Items, Doors
    LDA $F03000,X : STA $7ED918 : INX #2 ;  Events, Items, Doors
    LDA $F03000,X : STA $7ED91A : INX #2 ;  Events, Items, Doors
    LDA $F03000,X : STA $7ED91C : INX #2 ;  Events, Items, Doors
    LDA $F03000,X : STA $7ED91E : INX #2 ;  Events, Items, Doors
    LDA #$0000 : STA !ram_custom_preset
    RTL
}

print pc, " custom presets end"
warnpc $85F000
