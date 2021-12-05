; --------------
; Custom Presets
; --------------

print pc, " custom presets start"
custom_preset_save:
{
    LDA !sram_custom_preset_slot
    ASL : XBA : TAX ; multiply by 200h (slot offset)
    LDA #$5AFE : STA !PRESET_SLOTS,X : INX #2 ; mark this slot as "SAFE" to load
    LDA #$01B0 : STA !PRESET_SLOTS,X : INX #2 ; record slot size for future compatibility
    LDA $078B : STA !PRESET_SLOTS,X : INX #2 ;  Elevator Index
    LDA $078D : STA !PRESET_SLOTS,X : INX #2 ;  DDB
    LDA $078F : STA !PRESET_SLOTS,X : INX #2 ;  DoorOut Index
    LDA $079B : STA !PRESET_SLOTS,X : INX #2 ;  MDB
    LDA $079F : STA !PRESET_SLOTS,X : INX #2 ;  Region
    LDA $07C3 : STA !PRESET_SLOTS,X : INX #2 ;  GFX Pointers
    LDA $07C5 : STA !PRESET_SLOTS,X : INX #2 ;  GFX Pointers
    LDA $07C7 : STA !PRESET_SLOTS,X : INX #2 ;  GFX Pointers
    LDA $07F3 : STA !PRESET_SLOTS,X : INX #2 ;  Music Bank
    LDA $07F5 : STA !PRESET_SLOTS,X : INX #2 ;  Music Track
    LDA $090F : STA !PRESET_SLOTS,X : INX #2 ;  Screen subpixel X position
    LDA $0911 : STA !PRESET_SLOTS,X : INX #2 ;  Screen X position in pixels
    LDA $0913 : STA !PRESET_SLOTS,X : INX #2 ;  Screen subpixel Y position
    LDA $0915 : STA !PRESET_SLOTS,X : INX #2 ;  Screen Y position in pixels
    LDA $093F : STA !PRESET_SLOTS,X : INX #2 ;  Ceres escape flag
    LDA $09A2 : STA !PRESET_SLOTS,X : INX #2 ;  Equipped Items
    LDA $09A4 : STA !PRESET_SLOTS,X : INX #2 ;  Collected Items
    LDA $09A6 : STA !PRESET_SLOTS,X : INX #2 ;  Beams
    LDA $09A8 : STA !PRESET_SLOTS,X : INX #2 ;  Beams
    LDA $09C0 : STA !PRESET_SLOTS,X : INX #2 ;  Manual/Auto reserve tank
    LDA $09C2 : STA !PRESET_SLOTS,X : INX #2 ;  Health
    LDA $09C4 : STA !PRESET_SLOTS,X : INX #2 ;  Max health
    LDA $09C6 : STA !PRESET_SLOTS,X : INX #2 ;  Missiles
    LDA $09C8 : STA !PRESET_SLOTS,X : INX #2 ;  Max missiles
    LDA $09CA : STA !PRESET_SLOTS,X : INX #2 ;  Supers
    LDA $09CC : STA !PRESET_SLOTS,X : INX #2 ;  Max supers
    LDA $09CE : STA !PRESET_SLOTS,X : INX #2 ;  Pbs
    LDA $09D0 : STA !PRESET_SLOTS,X : INX #2 ;  Max pbs
    LDA $09D2 : STA !PRESET_SLOTS,X : INX #2 ;  Currently selected item
    LDA $09D4 : STA !PRESET_SLOTS,X : INX #2 ;  Max reserves
    LDA $09D6 : STA !PRESET_SLOTS,X : INX #2 ;  Reserves
    LDA $0A1C : STA !PRESET_SLOTS,X : INX #2 ;  Samus position/state
    LDA $0A1E : STA !PRESET_SLOTS,X : INX #2 ;  More position/state
    LDA $0A68 : STA !PRESET_SLOTS,X : INX #2 ;  Flash suit
    LDA $0A76 : STA !PRESET_SLOTS,X : INX #2 ;  Hyper beam
    LDA $0AF6 : STA !PRESET_SLOTS,X : INX #2 ;  Samus X
    LDA $0AFA : STA !PRESET_SLOTS,X : INX #2 ;  Samus Y
    LDA $0B3F : STA !PRESET_SLOTS,X : INX #2 ;  Blue suit
    LDA $7ED7C0 : STA !PRESET_SLOTS,X : INX #2 ;  SRAM copy
    LDA $7ED7C2 : STA !PRESET_SLOTS,X : INX #2 ;  SRAM copy
    LDA $7ED7C4 : STA !PRESET_SLOTS,X : INX #2 ;  SRAM copy
    LDA $7ED7C6 : STA !PRESET_SLOTS,X : INX #2 ;  SRAM copy
    LDA $7ED7C8 : STA !PRESET_SLOTS,X : INX #2 ;  SRAM copy
    LDA $7ED7CA : STA !PRESET_SLOTS,X : INX #2 ;  SRAM copy
    LDA $7ED7CC : STA !PRESET_SLOTS,X : INX #2 ;  SRAM copy
    LDA $7ED7CE : STA !PRESET_SLOTS,X : INX #2 ;  SRAM copy
    LDA $7ED7D0 : STA !PRESET_SLOTS,X : INX #2 ;  SRAM copy
    LDA $7ED7D2 : STA !PRESET_SLOTS,X : INX #2 ;  SRAM copy
    LDA $7ED7D4 : STA !PRESET_SLOTS,X : INX #2 ;  SRAM copy
    LDA $7ED7D6 : STA !PRESET_SLOTS,X : INX #2 ;  SRAM copy
    LDA $7ED7D8 : STA !PRESET_SLOTS,X : INX #2 ;  SRAM copy
    LDA $7ED7DA : STA !PRESET_SLOTS,X : INX #2 ;  SRAM copy
    LDA $7ED7DC : STA !PRESET_SLOTS,X : INX #2 ;  SRAM copy
    LDA $7ED7DE : STA !PRESET_SLOTS,X : INX #2 ;  SRAM copy
    LDA $7ED7E0 : STA !PRESET_SLOTS,X : INX #2 ;  SRAM copy
    LDA $7ED7E2 : STA !PRESET_SLOTS,X : INX #2 ;  SRAM copy
    LDA $7ED7E4 : STA !PRESET_SLOTS,X : INX #2 ;  SRAM copy
    LDA $7ED7E6 : STA !PRESET_SLOTS,X : INX #2 ;  SRAM copy
    LDA $7ED7E8 : STA !PRESET_SLOTS,X : INX #2 ;  SRAM copy
    LDA $7ED7EA : STA !PRESET_SLOTS,X : INX #2 ;  SRAM copy
    LDA $7ED7EC : STA !PRESET_SLOTS,X : INX #2 ;  SRAM copy
    LDA $7ED7EE : STA !PRESET_SLOTS,X : INX #2 ;  SRAM copy
    LDA $7ED7F0 : STA !PRESET_SLOTS,X : INX #2 ;  SRAM copy
    LDA $7ED7F2 : STA !PRESET_SLOTS,X : INX #2 ;  SRAM copy
    LDA $7ED7F4 : STA !PRESET_SLOTS,X : INX #2 ;  SRAM copy
    LDA $7ED7F6 : STA !PRESET_SLOTS,X : INX #2 ;  SRAM copy
    LDA $7ED7F8 : STA !PRESET_SLOTS,X : INX #2 ;  SRAM copy
    LDA $7ED7FA : STA !PRESET_SLOTS,X : INX #2 ;  SRAM copy
    LDA $7ED7FC : STA !PRESET_SLOTS,X : INX #2 ;  SRAM copy
    LDA $7ED7FE : STA !PRESET_SLOTS,X : INX #2 ;  SRAM copy
    LDA $7ED800 : STA !PRESET_SLOTS,X : INX #2 ;  SRAM copy
    LDA $7ED802 : STA !PRESET_SLOTS,X : INX #2 ;  SRAM copy
    LDA $7ED804 : STA !PRESET_SLOTS,X : INX #2 ;  SRAM copy
    LDA $7ED806 : STA !PRESET_SLOTS,X : INX #2 ;  SRAM copy
    LDA $7ED808 : STA !PRESET_SLOTS,X : INX #2 ;  SRAM copy
    LDA $7ED80A : STA !PRESET_SLOTS,X : INX #2 ;  SRAM copy
    LDA $7ED80C : STA !PRESET_SLOTS,X : INX #2 ;  SRAM copy
    LDA $7ED80E : STA !PRESET_SLOTS,X : INX #2 ;  SRAM copy
    LDA $7ED810 : STA !PRESET_SLOTS,X : INX #2 ;  SRAM copy
    LDA $7ED812 : STA !PRESET_SLOTS,X : INX #2 ;  SRAM copy
    LDA $7ED814 : STA !PRESET_SLOTS,X : INX #2 ;  SRAM copy
    LDA $7ED816 : STA !PRESET_SLOTS,X : INX #2 ;  SRAM copy
    LDA $7ED818 : STA !PRESET_SLOTS,X : INX #2 ;  SRAM copy
    LDA $7ED81A : STA !PRESET_SLOTS,X : INX #2 ;  SRAM copy
    LDA $7ED81C : STA !PRESET_SLOTS,X : INX #2 ;  SRAM copy
    LDA $7ED81E : STA !PRESET_SLOTS,X : INX #2 ;  SRAM copy
    LDA $7ED820 : STA !PRESET_SLOTS,X : INX #2 ;  Events, Items, Doors
    LDA $7ED822 : STA !PRESET_SLOTS,X : INX #2 ;  Events, Items, Doors
    LDA $7ED824 : STA !PRESET_SLOTS,X : INX #2 ;  Events, Items, Doors
    LDA $7ED826 : STA !PRESET_SLOTS,X : INX #2 ;  Events, Items, Doors
    LDA $7ED828 : STA !PRESET_SLOTS,X : INX #2 ;  Events, Items, Doors
    LDA $7ED82A : STA !PRESET_SLOTS,X : INX #2 ;  Events, Items, Doors
    LDA $7ED82C : STA !PRESET_SLOTS,X : INX #2 ;  Events, Items, Doors
    LDA $7ED82E : STA !PRESET_SLOTS,X : INX #2 ;  Events, Items, Doors
    LDA $7ED830 : STA !PRESET_SLOTS,X : INX #2 ;  Events, Items, Doors
    LDA $7ED832 : STA !PRESET_SLOTS,X : INX #2 ;  Events, Items, Doors
    LDA $7ED834 : STA !PRESET_SLOTS,X : INX #2 ;  Events, Items, Doors
    LDA $7ED836 : STA !PRESET_SLOTS,X : INX #2 ;  Events, Items, Doors
    LDA $7ED838 : STA !PRESET_SLOTS,X : INX #2 ;  Events, Items, Doors
    LDA $7ED83A : STA !PRESET_SLOTS,X : INX #2 ;  Events, Items, Doors
    LDA $7ED83C : STA !PRESET_SLOTS,X : INX #2 ;  Events, Items, Doors
    LDA $7ED83E : STA !PRESET_SLOTS,X : INX #2 ;  Events, Items, Doors
    LDA $7ED840 : STA !PRESET_SLOTS,X : INX #2 ;  Events, Items, Doors
    LDA $7ED842 : STA !PRESET_SLOTS,X : INX #2 ;  Events, Items, Doors
    LDA $7ED844 : STA !PRESET_SLOTS,X : INX #2 ;  Events, Items, Doors
    LDA $7ED846 : STA !PRESET_SLOTS,X : INX #2 ;  Events, Items, Doors
    LDA $7ED848 : STA !PRESET_SLOTS,X : INX #2 ;  Events, Items, Doors
    LDA $7ED84A : STA !PRESET_SLOTS,X : INX #2 ;  Events, Items, Doors
    LDA $7ED84C : STA !PRESET_SLOTS,X : INX #2 ;  Events, Items, Doors
    LDA $7ED84E : STA !PRESET_SLOTS,X : INX #2 ;  Events, Items, Doors
    LDA $7ED850 : STA !PRESET_SLOTS,X : INX #2 ;  Events, Items, Doors
    LDA $7ED852 : STA !PRESET_SLOTS,X : INX #2 ;  Events, Items, Doors
    LDA $7ED854 : STA !PRESET_SLOTS,X : INX #2 ;  Events, Items, Doors
    LDA $7ED856 : STA !PRESET_SLOTS,X : INX #2 ;  Events, Items, Doors
    LDA $7ED858 : STA !PRESET_SLOTS,X : INX #2 ;  Events, Items, Doors
    LDA $7ED85A : STA !PRESET_SLOTS,X : INX #2 ;  Events, Items, Doors
    LDA $7ED85C : STA !PRESET_SLOTS,X : INX #2 ;  Events, Items, Doors
    LDA $7ED85E : STA !PRESET_SLOTS,X : INX #2 ;  Events, Items, Doors
    LDA $7ED860 : STA !PRESET_SLOTS,X : INX #2 ;  Events, Items, Doors
    LDA $7ED862 : STA !PRESET_SLOTS,X : INX #2 ;  Events, Items, Doors
    LDA $7ED864 : STA !PRESET_SLOTS,X : INX #2 ;  Events, Items, Doors
    LDA $7ED866 : STA !PRESET_SLOTS,X : INX #2 ;  Events, Items, Doors
    LDA $7ED868 : STA !PRESET_SLOTS,X : INX #2 ;  Events, Items, Doors
    LDA $7ED86A : STA !PRESET_SLOTS,X : INX #2 ;  Events, Items, Doors
    LDA $7ED86C : STA !PRESET_SLOTS,X : INX #2 ;  Events, Items, Doors
    LDA $7ED86E : STA !PRESET_SLOTS,X : INX #2 ;  Events, Items, Doors
    LDA $7ED870 : STA !PRESET_SLOTS,X : INX #2 ;  Events, Items, Doors
    LDA $7ED872 : STA !PRESET_SLOTS,X : INX #2 ;  Events, Items, Doors
    LDA $7ED874 : STA !PRESET_SLOTS,X : INX #2 ;  Events, Items, Doors
    LDA $7ED876 : STA !PRESET_SLOTS,X : INX #2 ;  Events, Items, Doors
    LDA $7ED878 : STA !PRESET_SLOTS,X : INX #2 ;  Events, Items, Doors
    LDA $7ED87A : STA !PRESET_SLOTS,X : INX #2 ;  Events, Items, Doors
    LDA $7ED87C : STA !PRESET_SLOTS,X : INX #2 ;  Events, Items, Doors
    LDA $7ED87E : STA !PRESET_SLOTS,X : INX #2 ;  Events, Items, Doors
    LDA $7ED880 : STA !PRESET_SLOTS,X : INX #2 ;  Events, Items, Doors
    LDA $7ED882 : STA !PRESET_SLOTS,X : INX #2 ;  Events, Items, Doors
    LDA $7ED884 : STA !PRESET_SLOTS,X : INX #2 ;  Events, Items, Doors
    LDA $7ED886 : STA !PRESET_SLOTS,X : INX #2 ;  Events, Items, Doors
    LDA $7ED888 : STA !PRESET_SLOTS,X : INX #2 ;  Events, Items, Doors
    LDA $7ED88A : STA !PRESET_SLOTS,X : INX #2 ;  Events, Items, Doors
    LDA $7ED88C : STA !PRESET_SLOTS,X : INX #2 ;  Events, Items, Doors
    LDA $7ED88E : STA !PRESET_SLOTS,X : INX #2 ;  Events, Items, Doors
    LDA $7ED890 : STA !PRESET_SLOTS,X : INX #2 ;  Events, Items, Doors
    LDA $7ED892 : STA !PRESET_SLOTS,X : INX #2 ;  Events, Items, Doors
    LDA $7ED894 : STA !PRESET_SLOTS,X : INX #2 ;  Events, Items, Doors
    LDA $7ED896 : STA !PRESET_SLOTS,X : INX #2 ;  Events, Items, Doors
    LDA $7ED898 : STA !PRESET_SLOTS,X : INX #2 ;  Events, Items, Doors
    LDA $7ED89A : STA !PRESET_SLOTS,X : INX #2 ;  Events, Items, Doors
    LDA $7ED89C : STA !PRESET_SLOTS,X : INX #2 ;  Events, Items, Doors
    LDA $7ED89E : STA !PRESET_SLOTS,X : INX #2 ;  Events, Items, Doors
    LDA $7ED8A0 : STA !PRESET_SLOTS,X : INX #2 ;  Events, Items, Doors
    LDA $7ED8A2 : STA !PRESET_SLOTS,X : INX #2 ;  Events, Items, Doors
    LDA $7ED8A4 : STA !PRESET_SLOTS,X : INX #2 ;  Events, Items, Doors
    LDA $7ED8A6 : STA !PRESET_SLOTS,X : INX #2 ;  Events, Items, Doors
    LDA $7ED8A8 : STA !PRESET_SLOTS,X : INX #2 ;  Events, Items, Doors
    LDA $7ED8AA : STA !PRESET_SLOTS,X : INX #2 ;  Events, Items, Doors
    LDA $7ED8AC : STA !PRESET_SLOTS,X : INX #2 ;  Events, Items, Doors
    LDA $7ED8AE : STA !PRESET_SLOTS,X : INX #2 ;  Events, Items, Doors
    LDA $7ED8B0 : STA !PRESET_SLOTS,X : INX #2 ;  Events, Items, Doors
    LDA $7ED8B2 : STA !PRESET_SLOTS,X : INX #2 ;  Events, Items, Doors
    LDA $7ED8B4 : STA !PRESET_SLOTS,X : INX #2 ;  Events, Items, Doors
    LDA $7ED8B6 : STA !PRESET_SLOTS,X : INX #2 ;  Events, Items, Doors
    LDA $7ED8B8 : STA !PRESET_SLOTS,X : INX #2 ;  Events, Items, Doors
    LDA $7ED8BA : STA !PRESET_SLOTS,X : INX #2 ;  Events, Items, Doors
    LDA $7ED8BC : STA !PRESET_SLOTS,X : INX #2 ;  Events, Items, Doors
    LDA $7ED8BE : STA !PRESET_SLOTS,X : INX #2 ;  Events, Items, Doors
    LDA $7ED8C0 : STA !PRESET_SLOTS,X : INX #2 ;  Events, Items, Doors
    LDA $7ED8C2 : STA !PRESET_SLOTS,X : INX #2 ;  Events, Items, Doors
    LDA $7ED8C4 : STA !PRESET_SLOTS,X : INX #2 ;  Events, Items, Doors
    LDA $7ED8C6 : STA !PRESET_SLOTS,X : INX #2 ;  Events, Items, Doors
    LDA $7ED8C8 : STA !PRESET_SLOTS,X : INX #2 ;  Events, Items, Doors
    LDA $7ED8CA : STA !PRESET_SLOTS,X : INX #2 ;  Events, Items, Doors
    LDA $7ED8CC : STA !PRESET_SLOTS,X : INX #2 ;  Events, Items, Doors
    LDA $7ED8CE : STA !PRESET_SLOTS,X : INX #2 ;  Events, Items, Doors
    LDA $7ED8D0 : STA !PRESET_SLOTS,X : INX #2 ;  Events, Items, Doors
    LDA $7ED8D2 : STA !PRESET_SLOTS,X : INX #2 ;  Events, Items, Doors
    LDA $7ED8D4 : STA !PRESET_SLOTS,X : INX #2 ;  Events, Items, Doors
    LDA $7ED8D6 : STA !PRESET_SLOTS,X : INX #2 ;  Events, Items, Doors
    LDA $7ED8D8 : STA !PRESET_SLOTS,X : INX #2 ;  Events, Items, Doors
    LDA $7ED8DA : STA !PRESET_SLOTS,X : INX #2 ;  Events, Items, Doors
    LDA $7ED8DC : STA !PRESET_SLOTS,X : INX #2 ;  Events, Items, Doors
    LDA $7ED8DE : STA !PRESET_SLOTS,X : INX #2 ;  Events, Items, Doors
    LDA $7ED8E0 : STA !PRESET_SLOTS,X : INX #2 ;  Events, Items, Doors
    LDA $7ED8E2 : STA !PRESET_SLOTS,X : INX #2 ;  Events, Items, Doors
    LDA $7ED8E4 : STA !PRESET_SLOTS,X : INX #2 ;  Events, Items, Doors
    LDA $7ED8E6 : STA !PRESET_SLOTS,X : INX #2 ;  Events, Items, Doors
    LDA $7ED8E8 : STA !PRESET_SLOTS,X : INX #2 ;  Events, Items, Doors
    LDA $7ED8EA : STA !PRESET_SLOTS,X : INX #2 ;  Events, Items, Doors
    LDA $7ED8EC : STA !PRESET_SLOTS,X : INX #2 ;  Events, Items, Doors
    LDA $7ED8EE : STA !PRESET_SLOTS,X : INX #2 ;  Events, Items, Doors
    LDA $7ED8F0 : STA !PRESET_SLOTS,X : INX #2 ;  Events, Items, Doors
    LDA $7ED8F2 : STA !PRESET_SLOTS,X : INX #2 ;  Events, Items, Doors
    LDA $7ED8F4 : STA !PRESET_SLOTS,X : INX #2 ;  Events, Items, Doors
    LDA $7ED8F6 : STA !PRESET_SLOTS,X : INX #2 ;  Events, Items, Doors
    LDA $7ED8F8 : STA !PRESET_SLOTS,X : INX #2 ;  Events, Items, Doors
    LDA $7ED8FA : STA !PRESET_SLOTS,X : INX #2 ;  Events, Items, Doors
    LDA $7ED8FC : STA !PRESET_SLOTS,X : INX #2 ;  Events, Items, Doors
    LDA $7ED8FE : STA !PRESET_SLOTS,X : INX #2 ;  Events, Items, Doors
    LDA $7ED900 : STA !PRESET_SLOTS,X : INX #2 ;  Events, Items, Doors
    LDA $7ED902 : STA !PRESET_SLOTS,X : INX #2 ;  Events, Items, Doors
    LDA $7ED904 : STA !PRESET_SLOTS,X : INX #2 ;  Events, Items, Doors
    LDA $7ED906 : STA !PRESET_SLOTS,X : INX #2 ;  Events, Items, Doors
    LDA $7ED908 : STA !PRESET_SLOTS,X : INX #2 ;  Events, Items, Doors
    LDA $7ED90A : STA !PRESET_SLOTS,X : INX #2 ;  Events, Items, Doors
    LDA $7ED90C : STA !PRESET_SLOTS,X : INX #2 ;  Events, Items, Doors
    LDA $7ED90E : STA !PRESET_SLOTS,X : INX #2 ;  Events, Items, Doors
    LDA $7ED910 : STA !PRESET_SLOTS,X : INX #2 ;  Events, Items, Doors
    LDA $7ED912 : STA !PRESET_SLOTS,X : INX #2 ;  Events, Items, Doors
    LDA $7ED914 : STA !PRESET_SLOTS,X : INX #2 ;  Events, Items, Doors
    LDA $7ED916 : STA !PRESET_SLOTS,X : INX #2 ;  Events, Items, Doors
    LDA $7ED918 : STA !PRESET_SLOTS,X : INX #2 ;  Events, Items, Doors
    LDA $7ED91A : STA !PRESET_SLOTS,X : INX #2 ;  Events, Items, Doors
    LDA $7ED91C : STA !PRESET_SLOTS,X : INX #2 ;  Events, Items, Doors
    LDA $7ED91E : STA !PRESET_SLOTS,X : INX #2 ;  Events, Items, Doors
    RTL
}

custom_preset_load:
{
    LDA !sram_custom_preset_slot
    ASL : XBA : TAX ; multiply by 200h
    INX #2 ; skip past "5AFE" word
    INX #2 ; skip past size for now
    LDA !PRESET_SLOTS,X : STA $078B : INX #2 ;  Elevator Index
    LDA !PRESET_SLOTS,X : STA $078D : INX #2 ;  DDB
    LDA !PRESET_SLOTS,X : STA $078F : INX #2 ;  DoorOut Index
    LDA !PRESET_SLOTS,X : STA $079B : INX #2 ;  MDB
    LDA !PRESET_SLOTS,X : STA $079F : INX #2 ;  Region
    LDA !PRESET_SLOTS,X : STA $07C3 : INX #2 ;  GFX Pointers
    LDA !PRESET_SLOTS,X : STA $07C5 : INX #2 ;  GFX Pointers
    LDA !PRESET_SLOTS,X : STA $07C7 : INX #2 ;  GFX Pointers
    LDA !PRESET_SLOTS,X : STA $07F3 : INX #2 ;  Music Bank
    LDA !PRESET_SLOTS,X : STA $07F5 : INX #2 ;  Music Track
    LDA !PRESET_SLOTS,X : STA $090F : INX #2 ;  Screen subpixel X position
    LDA !PRESET_SLOTS,X : STA $0911 : INX #2 ;  Screen X position in pixels
    LDA !PRESET_SLOTS,X : STA $0913 : INX #2 ;  Screen subpixel Y position
    LDA !PRESET_SLOTS,X : STA $0915 : INX #2 ;  Screen Y position in pixels
    LDA !PRESET_SLOTS,X : STA $093F : INX #2 ;  Ceres escape flag
    LDA !PRESET_SLOTS,X : STA $09A2 : INX #2 ;  Equipped Items
    LDA !PRESET_SLOTS,X : STA $09A4 : INX #2 ;  Collected Items
    LDA !PRESET_SLOTS,X : STA $09A6 : INX #2 ;  Beams
    LDA !PRESET_SLOTS,X : STA $09A8 : INX #2 ;  Beams
    LDA !PRESET_SLOTS,X : STA $09C0 : INX #2 ;  Manual/Auto reserve tank
    LDA !PRESET_SLOTS,X : STA $09C2 : INX #2 ;  Health
    LDA !PRESET_SLOTS,X : STA $09C4 : INX #2 ;  Max health
    LDA !PRESET_SLOTS,X : STA $09C6 : INX #2 ;  Missiles
    LDA !PRESET_SLOTS,X : STA $09C8 : INX #2 ;  Max missiles
    LDA !PRESET_SLOTS,X : STA $09CA : INX #2 ;  Supers
    LDA !PRESET_SLOTS,X : STA $09CC : INX #2 ;  Max supers
    LDA !PRESET_SLOTS,X : STA $09CE : INX #2 ;  Pbs
    LDA !PRESET_SLOTS,X : STA $09D0 : INX #2 ;  Max pbs
    LDA !PRESET_SLOTS,X : STA $09D2 : INX #2 ;  Currently selected item
    LDA !PRESET_SLOTS,X : STA $09D4 : INX #2 ;  Max reserves
    LDA !PRESET_SLOTS,X : STA $09D6 : INX #2 ;  Reserves
    LDA !PRESET_SLOTS,X : STA $0A1C : INX #2 ;  Samus position/state
    LDA !PRESET_SLOTS,X : STA $0A1E : INX #2 ;  More position/state
    LDA !PRESET_SLOTS,X : STA $0A68 : INX #2 ;  Flash suit
    LDA !PRESET_SLOTS,X : STA $0A76 : INX #2 ;  Hyper beam
    LDA !PRESET_SLOTS,X : STA $0AF6 : INX #2 ;  Samus X
    LDA !PRESET_SLOTS,X : STA $0AFA : INX #2 ;  Samus Y
    LDA !PRESET_SLOTS,X : STA $0B3F : INX #2 ;  Blue suit
    LDA !PRESET_SLOTS,X : STA $7ED7C0 : INX #2 ;  SRAM copy
    LDA !PRESET_SLOTS,X : STA $7ED7C2 : INX #2 ;  SRAM copy
    LDA !PRESET_SLOTS,X : STA $7ED7C4 : INX #2 ;  SRAM copy
    LDA !PRESET_SLOTS,X : STA $7ED7C6 : INX #2 ;  SRAM copy
    LDA !PRESET_SLOTS,X : STA $7ED7C8 : INX #2 ;  SRAM copy
    LDA !PRESET_SLOTS,X : STA $7ED7CA : INX #2 ;  SRAM copy
    LDA !PRESET_SLOTS,X : STA $7ED7CC : INX #2 ;  SRAM copy
    LDA !PRESET_SLOTS,X : STA $7ED7CE : INX #2 ;  SRAM copy
    LDA !PRESET_SLOTS,X : STA $7ED7D0 : INX #2 ;  SRAM copy
    LDA !PRESET_SLOTS,X : STA $7ED7D2 : INX #2 ;  SRAM copy
    LDA !PRESET_SLOTS,X : STA $7ED7D4 : INX #2 ;  SRAM copy
    LDA !PRESET_SLOTS,X : STA $7ED7D6 : INX #2 ;  SRAM copy
    LDA !PRESET_SLOTS,X : STA $7ED7D8 : INX #2 ;  SRAM copy
    LDA !PRESET_SLOTS,X : STA $7ED7DA : INX #2 ;  SRAM copy
    LDA !PRESET_SLOTS,X : STA $7ED7DC : INX #2 ;  SRAM copy
    LDA !PRESET_SLOTS,X : STA $7ED7DE : INX #2 ;  SRAM copy
    LDA !PRESET_SLOTS,X : STA $7ED7E0 : INX #2 ;  SRAM copy
    LDA !PRESET_SLOTS,X : STA $7ED7E2 : INX #2 ;  SRAM copy
    LDA !PRESET_SLOTS,X : STA $7ED7E4 : INX #2 ;  SRAM copy
    LDA !PRESET_SLOTS,X : STA $7ED7E6 : INX #2 ;  SRAM copy
    LDA !PRESET_SLOTS,X : STA $7ED7E8 : INX #2 ;  SRAM copy
    LDA !PRESET_SLOTS,X : STA $7ED7EA : INX #2 ;  SRAM copy
    LDA !PRESET_SLOTS,X : STA $7ED7EC : INX #2 ;  SRAM copy
    LDA !PRESET_SLOTS,X : STA $7ED7EE : INX #2 ;  SRAM copy
    LDA !PRESET_SLOTS,X : STA $7ED7F0 : INX #2 ;  SRAM copy
    LDA !PRESET_SLOTS,X : STA $7ED7F2 : INX #2 ;  SRAM copy
    LDA !PRESET_SLOTS,X : STA $7ED7F4 : INX #2 ;  SRAM copy
    LDA !PRESET_SLOTS,X : STA $7ED7F6 : INX #2 ;  SRAM copy
    LDA !PRESET_SLOTS,X : STA $7ED7F8 : INX #2 ;  SRAM copy
    LDA !PRESET_SLOTS,X : STA $7ED7FA : INX #2 ;  SRAM copy
    LDA !PRESET_SLOTS,X : STA $7ED7FC : INX #2 ;  SRAM copy
    LDA !PRESET_SLOTS,X : STA $7ED7FE : INX #2 ;  SRAM copy
    LDA !PRESET_SLOTS,X : STA $7ED800 : INX #2 ;  SRAM copy
    LDA !PRESET_SLOTS,X : STA $7ED802 : INX #2 ;  SRAM copy
    LDA !PRESET_SLOTS,X : STA $7ED804 : INX #2 ;  SRAM copy
    LDA !PRESET_SLOTS,X : STA $7ED806 : INX #2 ;  SRAM copy
    LDA !PRESET_SLOTS,X : STA $7ED808 : INX #2 ;  SRAM copy
    LDA !PRESET_SLOTS,X : STA $7ED80A : INX #2 ;  SRAM copy
    LDA !PRESET_SLOTS,X : STA $7ED80C : INX #2 ;  SRAM copy
    LDA !PRESET_SLOTS,X : STA $7ED80E : INX #2 ;  SRAM copy
    LDA !PRESET_SLOTS,X : STA $7ED810 : INX #2 ;  SRAM copy
    LDA !PRESET_SLOTS,X : STA $7ED812 : INX #2 ;  SRAM copy
    LDA !PRESET_SLOTS,X : STA $7ED814 : INX #2 ;  SRAM copy
    LDA !PRESET_SLOTS,X : STA $7ED816 : INX #2 ;  SRAM copy
    LDA !PRESET_SLOTS,X : STA $7ED818 : INX #2 ;  SRAM copy
    LDA !PRESET_SLOTS,X : STA $7ED81A : INX #2 ;  SRAM copy
    LDA !PRESET_SLOTS,X : STA $7ED81C : INX #2 ;  SRAM copy
    LDA !PRESET_SLOTS,X : STA $7ED81E : INX #2 ;  SRAM copy
    LDA !PRESET_SLOTS,X : STA $7ED820 : INX #2 ;  Events, Items, Doors
    LDA !PRESET_SLOTS,X : STA $7ED822 : INX #2 ;  Events, Items, Doors
    LDA !PRESET_SLOTS,X : STA $7ED824 : INX #2 ;  Events, Items, Doors
    LDA !PRESET_SLOTS,X : STA $7ED826 : INX #2 ;  Events, Items, Doors
    LDA !PRESET_SLOTS,X : STA $7ED828 : INX #2 ;  Events, Items, Doors
    LDA !PRESET_SLOTS,X : STA $7ED82A : INX #2 ;  Events, Items, Doors
    LDA !PRESET_SLOTS,X : STA $7ED82C : INX #2 ;  Events, Items, Doors
    LDA !PRESET_SLOTS,X : STA $7ED82E : INX #2 ;  Events, Items, Doors
    LDA !PRESET_SLOTS,X : STA $7ED830 : INX #2 ;  Events, Items, Doors
    LDA !PRESET_SLOTS,X : STA $7ED832 : INX #2 ;  Events, Items, Doors
    LDA !PRESET_SLOTS,X : STA $7ED834 : INX #2 ;  Events, Items, Doors
    LDA !PRESET_SLOTS,X : STA $7ED836 : INX #2 ;  Events, Items, Doors
    LDA !PRESET_SLOTS,X : STA $7ED838 : INX #2 ;  Events, Items, Doors
    LDA !PRESET_SLOTS,X : STA $7ED83A : INX #2 ;  Events, Items, Doors
    LDA !PRESET_SLOTS,X : STA $7ED83C : INX #2 ;  Events, Items, Doors
    LDA !PRESET_SLOTS,X : STA $7ED83E : INX #2 ;  Events, Items, Doors
    LDA !PRESET_SLOTS,X : STA $7ED840 : INX #2 ;  Events, Items, Doors
    LDA !PRESET_SLOTS,X : STA $7ED842 : INX #2 ;  Events, Items, Doors
    LDA !PRESET_SLOTS,X : STA $7ED844 : INX #2 ;  Events, Items, Doors
    LDA !PRESET_SLOTS,X : STA $7ED846 : INX #2 ;  Events, Items, Doors
    LDA !PRESET_SLOTS,X : STA $7ED848 : INX #2 ;  Events, Items, Doors
    LDA !PRESET_SLOTS,X : STA $7ED84A : INX #2 ;  Events, Items, Doors
    LDA !PRESET_SLOTS,X : STA $7ED84C : INX #2 ;  Events, Items, Doors
    LDA !PRESET_SLOTS,X : STA $7ED84E : INX #2 ;  Events, Items, Doors
    LDA !PRESET_SLOTS,X : STA $7ED850 : INX #2 ;  Events, Items, Doors
    LDA !PRESET_SLOTS,X : STA $7ED852 : INX #2 ;  Events, Items, Doors
    LDA !PRESET_SLOTS,X : STA $7ED854 : INX #2 ;  Events, Items, Doors
    LDA !PRESET_SLOTS,X : STA $7ED856 : INX #2 ;  Events, Items, Doors
    LDA !PRESET_SLOTS,X : STA $7ED858 : INX #2 ;  Events, Items, Doors
    LDA !PRESET_SLOTS,X : STA $7ED85A : INX #2 ;  Events, Items, Doors
    LDA !PRESET_SLOTS,X : STA $7ED85C : INX #2 ;  Events, Items, Doors
    LDA !PRESET_SLOTS,X : STA $7ED85E : INX #2 ;  Events, Items, Doors
    LDA !PRESET_SLOTS,X : STA $7ED860 : INX #2 ;  Events, Items, Doors
    LDA !PRESET_SLOTS,X : STA $7ED862 : INX #2 ;  Events, Items, Doors
    LDA !PRESET_SLOTS,X : STA $7ED864 : INX #2 ;  Events, Items, Doors
    LDA !PRESET_SLOTS,X : STA $7ED866 : INX #2 ;  Events, Items, Doors
    LDA !PRESET_SLOTS,X : STA $7ED868 : INX #2 ;  Events, Items, Doors
    LDA !PRESET_SLOTS,X : STA $7ED86A : INX #2 ;  Events, Items, Doors
    LDA !PRESET_SLOTS,X : STA $7ED86C : INX #2 ;  Events, Items, Doors
    LDA !PRESET_SLOTS,X : STA $7ED86E : INX #2 ;  Events, Items, Doors
    LDA !PRESET_SLOTS,X : STA $7ED870 : INX #2 ;  Events, Items, Doors
    LDA !PRESET_SLOTS,X : STA $7ED872 : INX #2 ;  Events, Items, Doors
    LDA !PRESET_SLOTS,X : STA $7ED874 : INX #2 ;  Events, Items, Doors
    LDA !PRESET_SLOTS,X : STA $7ED876 : INX #2 ;  Events, Items, Doors
    LDA !PRESET_SLOTS,X : STA $7ED878 : INX #2 ;  Events, Items, Doors
    LDA !PRESET_SLOTS,X : STA $7ED87A : INX #2 ;  Events, Items, Doors
    LDA !PRESET_SLOTS,X : STA $7ED87C : INX #2 ;  Events, Items, Doors
    LDA !PRESET_SLOTS,X : STA $7ED87E : INX #2 ;  Events, Items, Doors
    LDA !PRESET_SLOTS,X : STA $7ED880 : INX #2 ;  Events, Items, Doors
    LDA !PRESET_SLOTS,X : STA $7ED882 : INX #2 ;  Events, Items, Doors
    LDA !PRESET_SLOTS,X : STA $7ED884 : INX #2 ;  Events, Items, Doors
    LDA !PRESET_SLOTS,X : STA $7ED886 : INX #2 ;  Events, Items, Doors
    LDA !PRESET_SLOTS,X : STA $7ED888 : INX #2 ;  Events, Items, Doors
    LDA !PRESET_SLOTS,X : STA $7ED88A : INX #2 ;  Events, Items, Doors
    LDA !PRESET_SLOTS,X : STA $7ED88C : INX #2 ;  Events, Items, Doors
    LDA !PRESET_SLOTS,X : STA $7ED88E : INX #2 ;  Events, Items, Doors
    LDA !PRESET_SLOTS,X : STA $7ED890 : INX #2 ;  Events, Items, Doors
    LDA !PRESET_SLOTS,X : STA $7ED892 : INX #2 ;  Events, Items, Doors
    LDA !PRESET_SLOTS,X : STA $7ED894 : INX #2 ;  Events, Items, Doors
    LDA !PRESET_SLOTS,X : STA $7ED896 : INX #2 ;  Events, Items, Doors
    LDA !PRESET_SLOTS,X : STA $7ED898 : INX #2 ;  Events, Items, Doors
    LDA !PRESET_SLOTS,X : STA $7ED89A : INX #2 ;  Events, Items, Doors
    LDA !PRESET_SLOTS,X : STA $7ED89C : INX #2 ;  Events, Items, Doors
    LDA !PRESET_SLOTS,X : STA $7ED89E : INX #2 ;  Events, Items, Doors
    LDA !PRESET_SLOTS,X : STA $7ED8A0 : INX #2 ;  Events, Items, Doors
    LDA !PRESET_SLOTS,X : STA $7ED8A2 : INX #2 ;  Events, Items, Doors
    LDA !PRESET_SLOTS,X : STA $7ED8A4 : INX #2 ;  Events, Items, Doors
    LDA !PRESET_SLOTS,X : STA $7ED8A6 : INX #2 ;  Events, Items, Doors
    LDA !PRESET_SLOTS,X : STA $7ED8A8 : INX #2 ;  Events, Items, Doors
    LDA !PRESET_SLOTS,X : STA $7ED8AA : INX #2 ;  Events, Items, Doors
    LDA !PRESET_SLOTS,X : STA $7ED8AC : INX #2 ;  Events, Items, Doors
    LDA !PRESET_SLOTS,X : STA $7ED8AE : INX #2 ;  Events, Items, Doors
    LDA !PRESET_SLOTS,X : STA $7ED8B0 : INX #2 ;  Events, Items, Doors
    LDA !PRESET_SLOTS,X : STA $7ED8B2 : INX #2 ;  Events, Items, Doors
    LDA !PRESET_SLOTS,X : STA $7ED8B4 : INX #2 ;  Events, Items, Doors
    LDA !PRESET_SLOTS,X : STA $7ED8B6 : INX #2 ;  Events, Items, Doors
    LDA !PRESET_SLOTS,X : STA $7ED8B8 : INX #2 ;  Events, Items, Doors
    LDA !PRESET_SLOTS,X : STA $7ED8BA : INX #2 ;  Events, Items, Doors
    LDA !PRESET_SLOTS,X : STA $7ED8BC : INX #2 ;  Events, Items, Doors
    LDA !PRESET_SLOTS,X : STA $7ED8BE : INX #2 ;  Events, Items, Doors
    LDA !PRESET_SLOTS,X : STA $7ED8C0 : INX #2 ;  Events, Items, Doors
    LDA !PRESET_SLOTS,X : STA $7ED8C2 : INX #2 ;  Events, Items, Doors
    LDA !PRESET_SLOTS,X : STA $7ED8C4 : INX #2 ;  Events, Items, Doors
    LDA !PRESET_SLOTS,X : STA $7ED8C6 : INX #2 ;  Events, Items, Doors
    LDA !PRESET_SLOTS,X : STA $7ED8C8 : INX #2 ;  Events, Items, Doors
    LDA !PRESET_SLOTS,X : STA $7ED8CA : INX #2 ;  Events, Items, Doors
    LDA !PRESET_SLOTS,X : STA $7ED8CC : INX #2 ;  Events, Items, Doors
    LDA !PRESET_SLOTS,X : STA $7ED8CE : INX #2 ;  Events, Items, Doors
    LDA !PRESET_SLOTS,X : STA $7ED8D0 : INX #2 ;  Events, Items, Doors
    LDA !PRESET_SLOTS,X : STA $7ED8D2 : INX #2 ;  Events, Items, Doors
    LDA !PRESET_SLOTS,X : STA $7ED8D4 : INX #2 ;  Events, Items, Doors
    LDA !PRESET_SLOTS,X : STA $7ED8D6 : INX #2 ;  Events, Items, Doors
    LDA !PRESET_SLOTS,X : STA $7ED8D8 : INX #2 ;  Events, Items, Doors
    LDA !PRESET_SLOTS,X : STA $7ED8DA : INX #2 ;  Events, Items, Doors
    LDA !PRESET_SLOTS,X : STA $7ED8DC : INX #2 ;  Events, Items, Doors
    LDA !PRESET_SLOTS,X : STA $7ED8DE : INX #2 ;  Events, Items, Doors
    LDA !PRESET_SLOTS,X : STA $7ED8E0 : INX #2 ;  Events, Items, Doors
    LDA !PRESET_SLOTS,X : STA $7ED8E2 : INX #2 ;  Events, Items, Doors
    LDA !PRESET_SLOTS,X : STA $7ED8E4 : INX #2 ;  Events, Items, Doors
    LDA !PRESET_SLOTS,X : STA $7ED8E6 : INX #2 ;  Events, Items, Doors
    LDA !PRESET_SLOTS,X : STA $7ED8E8 : INX #2 ;  Events, Items, Doors
    LDA !PRESET_SLOTS,X : STA $7ED8EA : INX #2 ;  Events, Items, Doors
    LDA !PRESET_SLOTS,X : STA $7ED8EC : INX #2 ;  Events, Items, Doors
    LDA !PRESET_SLOTS,X : STA $7ED8EE : INX #2 ;  Events, Items, Doors
    LDA !PRESET_SLOTS,X : STA $7ED8F0 : INX #2 ;  Events, Items, Doors
    LDA !PRESET_SLOTS,X : STA $7ED8F2 : INX #2 ;  Events, Items, Doors
    LDA !PRESET_SLOTS,X : STA $7ED8F4 : INX #2 ;  Events, Items, Doors
    LDA !PRESET_SLOTS,X : STA $7ED8F6 : INX #2 ;  Events, Items, Doors
    LDA !PRESET_SLOTS,X : STA $7ED8F8 : INX #2 ;  Events, Items, Doors
    LDA !PRESET_SLOTS,X : STA $7ED8FA : INX #2 ;  Events, Items, Doors
    LDA !PRESET_SLOTS,X : STA $7ED8FC : INX #2 ;  Events, Items, Doors
    LDA !PRESET_SLOTS,X : STA $7ED8FE : INX #2 ;  Events, Items, Doors
    LDA !PRESET_SLOTS,X : STA $7ED900 : INX #2 ;  Events, Items, Doors
    LDA !PRESET_SLOTS,X : STA $7ED902 : INX #2 ;  Events, Items, Doors
    LDA !PRESET_SLOTS,X : STA $7ED904 : INX #2 ;  Events, Items, Doors
    LDA !PRESET_SLOTS,X : STA $7ED906 : INX #2 ;  Events, Items, Doors
    LDA !PRESET_SLOTS,X : STA $7ED908 : INX #2 ;  Events, Items, Doors
    LDA !PRESET_SLOTS,X : STA $7ED90A : INX #2 ;  Events, Items, Doors
    LDA !PRESET_SLOTS,X : STA $7ED90C : INX #2 ;  Events, Items, Doors
    LDA !PRESET_SLOTS,X : STA $7ED90E : INX #2 ;  Events, Items, Doors
    LDA !PRESET_SLOTS,X : STA $7ED910 : INX #2 ;  Events, Items, Doors
    LDA !PRESET_SLOTS,X : STA $7ED912 : INX #2 ;  Events, Items, Doors
    LDA !PRESET_SLOTS,X : STA $7ED914 : INX #2 ;  Events, Items, Doors
    LDA !PRESET_SLOTS,X : STA $7ED916 : INX #2 ;  Events, Items, Doors
    LDA !PRESET_SLOTS,X : STA $7ED918 : INX #2 ;  Events, Items, Doors
    LDA !PRESET_SLOTS,X : STA $7ED91A : INX #2 ;  Events, Items, Doors
    LDA !PRESET_SLOTS,X : STA $7ED91C : INX #2 ;  Events, Items, Doors
    LDA !PRESET_SLOTS,X : STA $7ED91E : INX #2 ;  Events, Items, Doors
    LDA #$0000 : STA !ram_custom_preset
    RTL
}

print pc, " custom presets end"
