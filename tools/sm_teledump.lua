local CAT = "SZM101" -- prkd, redesign, SZM101

local last_state = {} -- holds all state that has been changed up untill last save

local preset_output = ""
local last_step = nil

local MEMTRACK = { -- {{{
    { 0x07C3, 0x6, 'GFX Pointers' },
    { 0x07F3, 0x2, 'Music Bank' },
    { 0x07F5, 0x2, 'Music Track' },
    { 0x078B, 0x2, 'Elevator Index' },
    { 0x078D, 0x2, 'DDB' },
    { 0x078F, 0x2, 'DoorOut Index' },
    { 0x079B, 0x2, 'MDB' },
    { 0x079F, 0x2, 'Region' },

    --[[
    { 0x08F7, 0x2, 'How many blocks X the screen is scrolled?' },
    { 0x08F9, 0x2, 'How many blocks Y the screen is scrolled? (up = positive)' },
    { 0x08FB, 0x2, 'How many blocks X Layer 2 is scrolled?' },
    { 0x08FD, 0x2, 'How many blocks Y Layer 2 is scrolled? (up = positive)' },
    { 0x08FF, 0x2, 'How many blocks X the screen was scrolled previously (Checked to know when to update blocks)' },
    { 0x0901, 0x2, 'How many blocks Y the screen was scrolled previously (Checked to know when to update blocks) (up = positive)' },
    { 0x0903, 0x2, 'How many blocks X Layer 2 was scrolled previously (Checked to know when to update blocks)' },
    { 0x0905, 0x2, 'How many blocks Y Layer 2 was scrolled previously (Checked to know when to update blocks) (up = positive)' },
    { 0x0907, 0x2, 'How many blocks X BG1 is scrolled?' },
    { 0x0909, 0x2, 'How many blocks Y BG1 is scrolled? (up = positive)' },
    { 0x090B, 0x2, 'How many blocks X BG2 is scrolled?' },
    { 0x090D, 0x2, 'How many blocks Y BG2 is scrolled? (up = positive)' },
    ]]
    { 0x090F, 0x2, 'Screen subpixel X position.' },
    { 0x0911, 0x2, 'Screen X position in pixels' },
    { 0x0913, 0x2, 'Screen subpixel Y position' },
    { 0x0915, 0x2, 'Screen Y position in pixels' },
    { 0x0917, 0x2, 'Layer 2 X scroll in room in pixels?' },
    { 0x0919, 0x2, 'Layer 2 Y scroll in room in pixels? (up = positive)' },
    --[[
    { 0x091B, 0x2, 'BG2 scroll percent to screen scroll (0 = 100, 1 = ?) (1 byte for X, 1 byte for Y)' },
    { 0x091D, 0x2, 'BG1 X scroll offset due to room transitions (Translates between screen scroll and BG1 scroll)' },
    { 0x091F, 0x2, 'BG1 Y scroll offset due to room transitions (Translates between screen scroll and BG1 scroll)' },
    --]]
    { 0x0921, 0x2, 'BG2 X scroll offset due to room transitions (Translates between Layer 2 scroll and BG2 scroll)' },
    { 0x0923, 0x2, 'BG2 Y scroll offset due to room transitions (Translates between Layer 2 scroll and BG2 scroll)' },
    --[[
    { 0x0925, 0x2, 'How many times the screen has scrolled? Stops at 40.' },
    { 0x0927, 0x2, 'X offset of room entrance for room transition (multiple of 100, screens)' },
    { 0x0929, 0x2, 'Y offset of room entrance for room transition (multiple of 100, screens. Adjusted by 20 when moving up)' },
    { 0x092B, 0x2, 'Movement speed for room transitions (subpixels per frame of room transition movement)' },
    { 0x092D, 0x2, 'Movement speed for room transitions (pixels per frame of room transition movement)' },
    --]]
    { 0x093F, 0x2, 'Ceres escape flag' },

    { 0x09A2, 0x2, 'Equipped Items' },
    { 0x09A4, 0x2, 'Collected Items' },
    { 0x09A6, 0x2, 'Beams' },
    { 0x09A8, 0x2, 'Beams' },
    { 0x09C0, 0x2, 'Manual/Auto reserve tank' },
    { 0x09C2, 0x2, 'Health' },
    { 0x09C4, 0x2, 'Max health' },
    { 0x09C6, 0x2, 'Missiles' },
    { 0x09C8, 0x2, 'Max missiles' },
    { 0x09CA, 0x2, 'Supers' },
    { 0x09CC, 0x2, 'Max supers' },
    { 0x09CE, 0x2, 'Pbs' },
    { 0x09D0, 0x2, 'Max pbs' },
    -- { 0x09D2, 0x2, 'Current selected weapon' },
    { 0x09D4, 0x2, 'Max reserves' },
    { 0x09D6, 0x2, 'Reserves' },
    -- { 0x0A04, 0x2, 'Auto-cancel item' },
    { 0x0A1C, 0x2, 'Samus position/state' },
    { 0x0A1E, 0x2, 'More position/state' },
    { 0x0A68, 0x2, 'Flash suit' },
    { 0x0A76, 0x2, 'Hyper beam' },
    { 0x0AF6, 0x2, 'Samus X' },
    { 0x0AFA, 0x2, 'Samus Y' },
    { 0x0B3F, 0x2, 'Blue suit' },
    { 0xD7C0, 0x60, 'SRAM copy' }, -- Prob not doing much?
    { 0xD820, 0x100, 'Events, Items, Doors' },
    -- { 0xD840, 0x40, 'Items' },
    -- { 0xD8B0, 0x40, 'Doors' },
    -- { 0xD914, 0x2, 'Game mode?' },

} -- }}}

local SEGMENTS = {
    ["prkd"] = { -- {{{
        { ["name"] = "Bombs", ["steps"] = {} },
        { ["name"] = "Power Bombs", ["steps"] = {} },
        { ["name"] = "Gravity Suit", ["steps"] = {} },
        { ["name"] = "Cathedral", ["steps"] = {} },
        { ["name"] = "Ridley", ["steps"] = {} },
        { ["name"] = "Kraid", ["steps"] = {} },
        { ["name"] = "Draygon", ["steps"] = {} },
        { ["name"] = "Golden 4", ["steps"] = {} },
        { ["name"] = "Tourian", ["steps"] = {} },
    }, -- }}}
	["redesign"] = {
        { ["name"] = "Crateria", ["steps"] = {} },
        { ["name"] = "Bombs", ["steps"] = {} },
        { ["name"] = "Varia", ["steps"] = {} },
        { ["name"] = "Speed Booster", ["steps"] = {} },
        { ["name"] = "Hi Jump Boots", ["steps"] = {} },
        { ["name"] = "Grapple", ["steps"] = {} },
        { ["name"] = "Lower Norfair", ["steps"] = {} },
        { ["name"] = "Lost Caverns", ["steps"] = {} },
        { ["name"] = "Botwoon", ["steps"] = {} },
        { ["name"] = "Cleanup", ["steps"] = {} },
        { ["name"] = "Draygon", ["steps"] = {} },
        { ["name"] = "Tourian", ["steps"] = {} },
        { ["name"] = "Final Escape", ["steps"] = {} },
    },
	["SZM101"] = {
		{ ["name"] = "Bombs", ["steps"] = {} },
		{ ["name"] = "Varia", ["steps"] = {} },
		{ ["name"] = "Power Bombs", ["steps"] = {} },
		{ ["name"] = "Upper Norfair", ["steps"] = {} },
		{ ["name"] = "Lower Norfair", ["steps"] = {} },
		{ ["name"] = "Cleanup 1", ["steps"] = {} },
		{ ["name"] = "Chozodia", ["steps"] = {} },
		{ ["name"] = "Tourian", ["steps"] = {} },
		{ ["name"] = "Cleanup 2", ["steps"] = {} },
		{ ["name"] = "Pirate Ship Ridley", ["steps"] = {} },
		{ ["name"] = "Pirate Ship Draygon", ["steps"] = {} },
	},
}

local STEPS = {
    ["prkd"] = { -- {{{
        -- Bombs
        [1501] = { ["segment_no"] = 1, ["name"] = "Elevator" },
        [5280] = { ["segment_no"] = 1, ["name"] = "Ceres Last 3 rooms" },
        [9200] = { ["segment_no"] = 1, ["name"] = "Ship" },
        [9497] = { ["segment_no"] = 1, ["name"] = "Parlor down" },
        [12466] = { ["segment_no"] = 1, ["name"] = "Morph" },
        [16062] = { ["segment_no"] = 1, ["name"] = "Pit Room" },
        [16694] = { ["segment_no"] = 1, ["name"] = "Climb" },
        [18258] = { ["segment_no"] = 1, ["name"] = "Parlor up" },
        [19958] = { ["segment_no"] = 1, ["name"] = "Bomb Torizo" },
        -- PBs
        [22527] = { ["segment_no"] = 2, ["name"] = "Alcatraz" },
        [23146] = { ["segment_no"] = 2, ["name"] = "Terminator" },
        [24193] = { ["segment_no"] = 2, ["name"] = "Pirates Shaft" },
        [25775] = { ["segment_no"] = 2, ["name"] = "Elevator" },
        [26857] = { ["segment_no"] = 2, ["name"] = "Early Supers" },
        [28585] = { ["segment_no"] = 2, ["name"] = "Dachora Room" },
        [29701] = { ["segment_no"] = 2, ["name"] = "Big Pink" },
        [32107] = { ["segment_no"] = 2, ["name"] = "Green Hill Zone" },
        [33851] = { ["segment_no"] = 2, ["name"] = "Red Tower" },
        [34784] = { ["segment_no"] = 2, ["name"] = "Hellway" },
        [35265] = { ["segment_no"] = 2, ["name"] = "Caterpillar Room down" },
        -- Grav
        [36883] = { ["segment_no"] = 3, ["name"] = "Caterpillar Room up" },
        [39111] = { ["segment_no"] = 3, ["name"] = "Kihunter Room" },
        [40245] = { ["segment_no"] = 3, ["name"] = "Moat" },
        [42330] = { ["segment_no"] = 3, ["name"] = "Wrecked Ship Enter" },
        [43520] = { ["segment_no"] = 3, ["name"] = "Phantoon" },
        [48225] = { ["segment_no"] = 3, ["name"] = "Wrecked Ship Climb" },
        [50996] = { ["segment_no"] = 3, ["name"] = "Attic" },
        [53119] = { ["segment_no"] = 3, ["name"] = "Bowling Alley farm" },
        [57285] = { ["segment_no"] = 3, ["name"] = "Grav" },
        -- Cathedral
        [58777] = { ["segment_no"] = 4, ["name"] = "Kihunter Room" },
        [59709] = { ["segment_no"] = 4, ["name"] = "Caterpillar Room" },
        [61221] = { ["segment_no"] = 4, ["name"] = "Red Tower" },
        [62460] = { ["segment_no"] = 4, ["name"] = "Bat Room" },
        [64934] = { ["segment_no"] = 4, ["name"] = "Glass Tunnel" },
        [66100] = { ["segment_no"] = 4, ["name"] = "Business Center" },
        [67214] = { ["segment_no"] = 4, ["name"] = "Hi Jump" },
        [69710] = { ["segment_no"] = 4, ["name"] = "Business Center climb" },
        [71169] = { ["segment_no"] = 4, ["name"] = "Ice Beam Snake Room" },
        [73100] = { ["segment_no"] = 4, ["name"] = "Ice Escape" },
        [74208] = { ["segment_no"] = 4, ["name"] = "Cathedral Entrance" },
        -- Ridley
        [74908] = { ["segment_no"] = 5, ["name"] = "Cathedral" },
        [76178] = { ["segment_no"] = 5, ["name"] = "Bubble Mountain" },
        [77945] = { ["segment_no"] = 5, ["name"] = "Bat Cave" },
        [80260] = { ["segment_no"] = 5, ["name"] = "Bat Cave revisited" },
        [82762] = { ["segment_no"] = 5, ["name"] = "Single Chamber" },
        [83343] = { ["segment_no"] = 5, ["name"] = "Double Chamber" },
        [85242] = { ["segment_no"] = 5, ["name"] = "Double Chamber revisited" },
        [86792] = { ["segment_no"] = 5, ["name"] = "Volcano Room" },
        [88082] = { ["segment_no"] = 5, ["name"] = "Lavaspark" },
        [89060] = { ["segment_no"] = 5, ["name"] = "LN Elevator" },
        [90538] = { ["segment_no"] = 5, ["name"] = "Fast Pillars" },
        [91679] = { ["segment_no"] = 5, ["name"] = "WRITG" },
        [92739] = { ["segment_no"] = 5, ["name"] = "Amphitheatre" },
        [94150] = { ["segment_no"] = 5, ["name"] = "Kihunter shaft" },
        [94961] = { ["segment_no"] = 5, ["name"] = "Wasteland" },
        [96756] = { ["segment_no"] = 5, ["name"] = "Metal Pirates" },
        [98280] = { ["segment_no"] = 5, ["name"] = "Ridley Farming Room" },
        [100442] = { ["segment_no"] = 5, ["name"] = "Ridley" },
        -- Kraid
        [105917] = { ["segment_no"] = 6, ["name"] = "Ridley Farming Room" },
        [107542] = { ["segment_no"] = 6, ["name"] = "Wasteland" },
        [108699] = { ["segment_no"] = 6, ["name"] = "Kihunter shaft" },
        [110020] = { ["segment_no"] = 6, ["name"] = "Fireflea Room" },
        [111280] = { ["segment_no"] = 6, ["name"] = "Three Muskateers Room" },
        [112226] = { ["segment_no"] = 6, ["name"] = "Single Chamber" },
        [113678] = { ["segment_no"] = 6, ["name"] = "Bubble Mountain" },
        [114745] = { ["segment_no"] = 6, ["name"] = "Frog Speedway" },
        [116822] = { ["segment_no"] = 6, ["name"] = "Warehouse Entrance" },
        [117063] = { ["segment_no"] = 6, ["name"] = "Zeela Room" },
        [118110] = { ["segment_no"] = 6, ["name"] = "Baby Kraid" },
        [118925] = { ["segment_no"] = 6, ["name"] = "Kraid" },
        -- Draygon
        [122558] = { ["segment_no"] = 7, ["name"] = "Baby Kraid" },
        [123896] = { ["segment_no"] = 7, ["name"] = "Warehouse Entrance" },
        [124625] = { ["segment_no"] = 7, ["name"] = "Glass Tunnel" },
        [125698] = { ["segment_no"] = 7, ["name"] = "Fish Tank" },
        [126840] = { ["segment_no"] = 7, ["name"] = "Crab Shaft" },
        [128032] = { ["segment_no"] = 7, ["name"] = "Botwoon Hallway" },
        [128624] = { ["segment_no"] = 7, ["name"] = "Botwoon" },
        [130882] = { ["segment_no"] = 7, ["name"] = "Halfie Climb" },
        [133633] = { ["segment_no"] = 7, ["name"] = "Draygon" },
        -- Golden Four
        [137206] = { ["segment_no"] = 8, ["name"] = "Precious Room" },
        [138261] = { ["segment_no"] = 8, ["name"] = "Halfie Climb" },
        [139318] = { ["segment_no"] = 8, ["name"] = "Botwoon Hallway" },
        [140401] = { ["segment_no"] = 8, ["name"] = "Crab Shaft" },
        [140934] = { ["segment_no"] = 8, ["name"] = "Mt Everest" },
        [142279] = { ["segment_no"] = 8, ["name"] = "Caterpillar Room" },
        [144090] = { ["segment_no"] = 8, ["name"] = "Kihunter Room" },
        [145017] = { ["segment_no"] = 8, ["name"] = "Parlor" },
        [145530] = { ["segment_no"] = 8, ["name"] = "Terminator" },
        [146715] = { ["segment_no"] = 8, ["name"] = "Golden Four" },
        -- Tourian
        [150256] = { ["segment_no"] = 9, ["name"] = "Enter Tourian" },
        [151618] = { ["segment_no"] = 9, ["name"] = "M1" },
        [152430] = { ["segment_no"] = 9, ["name"] = "M2" },
        [152908] = { ["segment_no"] = 9, ["name"] = "M3" },
        [153822] = { ["segment_no"] = 9, ["name"] = "M4" },
        [155354] = { ["segment_no"] = 9, ["name"] = "Baby Skip" },
        [158334] = { ["segment_no"] = 9, ["name"] = "Tourian Eye Door" },
        [174836] = { ["segment_no"] = 9, ["name"] = "Escape Room 3" },
        [177286] = { ["segment_no"] = 9, ["name"] = "Escape Parlor" },
    }, -- }}}
	["redesign"] = {
		-- Crateria
		[9658] = { ["segment_no"] = 1, ["name"] = "Ceres Elevator" },
		[13665] = { ["segment_no"] = 1, ["name"] = "Magnet Stairs Escape" },
		[18075] = { ["segment_no"] = 1, ["name"] = "Landing Site" },
		[20334] = { ["segment_no"] = 1, ["name"] = "Ledge Room" },
		[23568] = { ["segment_no"] = 1, ["name"] = "Leaving Morph" },
		[26529] = { ["segment_no"] = 1, ["name"] = "Pirate Ledge Room" },
		[27704] = { ["segment_no"] = 1, ["name"] = "Scree Pit" },
		[29986] = { ["segment_no"] = 1, ["name"] = "Preship Climb" },
		[31963] = { ["segment_no"] = 1, ["name"] = "Scree Fall" },
		[32595] = { ["segment_no"] = 1, ["name"] = "Pirate Drop" },
		-- Bombs
		[35088] = { ["segment_no"] = 2, ["name"] = "Brin Elevator Left" },
		[37067] = { ["segment_no"] = 2, ["name"] = "Pipe Bugs Down" },
		[38073] = { ["segment_no"] = 2, ["name"] = "Big Pink Down" },
		[40227] = { ["segment_no"] = 2, ["name"] = "SporeSpawn" },
		[44648] = { ["segment_no"] = 2, ["name"] = "WallJump Boots" },
		[46609] = { ["segment_no"] = 2, ["name"] = "Big Pink Up" },
		[49308] = { ["segment_no"] = 2, ["name"] = "Pipe Bugs Up" },
		[50828] = { ["segment_no"] = 2, ["name"] = "Brin Elevator Right" },
		[53005] = { ["segment_no"] = 2, ["name"] = "Kago Climb" },
		[56602] = { ["segment_no"] = 2, ["name"] = "Green Pirate Climb" },
		[59124] = { ["segment_no"] = 2, ["name"] = "Landing Site" },
		[62540] = { ["segment_no"] = 2, ["name"] = "Final Boss" },
		[66000] = { ["segment_no"] = 2, ["name"] = "Ripper Fall" },
		[67250] = { ["segment_no"] = 2, ["name"] = "Walljump Climb" },
		[70452] = { ["segment_no"] = 2, ["name"] = "Reflectors" },
		[72070] = { ["segment_no"] = 2, ["name"] = "Bomb Torizo" },
		-- Varia
		[74525] = { ["segment_no"] = 3, ["name"] = "Reflectors" },
		[76748] = { ["segment_no"] = 3, ["name"] = "Kago Boost" },
		[77774] = { ["segment_no"] = 3, ["name"] = "WallJump Check Down" },
		[79399] = { ["segment_no"] = 3, ["name"] = "Sky Guardian Room" },
		[81535] = { ["segment_no"] = 3, ["name"] = "Final Boss Room" },
		[84566] = { ["segment_no"] = 3, ["name"] = "Ship" },
		[87126] = { ["segment_no"] = 3, ["name"] = "Pirate Drop" },
		[89304] = { ["segment_no"] = 3, ["name"] = "Brin Elevator Right" },
		[90876] = { ["segment_no"] = 3, ["name"] = "Hopper Hellway" },
		[93226] = { ["segment_no"] = 3, ["name"] = "Early Supers" },
		[95207] = { ["segment_no"] = 3, ["name"] = "PB Blockade" },
		[96827] = { ["segment_no"] = 3, ["name"] = "Spikey Vileplumes" },
		[100111] = { ["segment_no"] = 3, ["name"] = "Spike Guardian Room" },
		[107466] = { ["segment_no"] = 3, ["name"] = "Soggy Missiles" },
		[113336] = { ["segment_no"] = 3, ["name"] = "Varia Bomb Jump" },
		-- Speed Booster
		[116439] = { ["segment_no"] = 4, ["name"] = "Varia" },
		[120177] = { ["segment_no"] = 4, ["name"] = "UN Elevator Left" },
		[125600] = { ["segment_no"] = 4, ["name"] = "Wave Bomb Jump" },
		[137818] = { ["segment_no"] = 4, ["name"] = "Exiting Wave" },
		[140003] = { ["segment_no"] = 4, ["name"] = "Big Fall" },
		[141038] = { ["segment_no"] = 4, ["name"] = "Squeept Squeept" },
		[143081] = { ["segment_no"] = 4, ["name"] = "Morph Maze" },
		[145090] = { ["segment_no"] = 4, ["name"] = "PB Maze" },
		[156834] = { ["segment_no"] = 4, ["name"] = "Reverse Morph Maze" },
		[161278] = { ["segment_no"] = 4, ["name"] = "Five Spawner Farm" },
		[163053] = { ["segment_no"] = 4, ["name"] = "Morph Bomb Blockade" },
		[164816] = { ["segment_no"] = 4, ["name"] = "Lava Bomb Jump" },
		[166911] = { ["segment_no"] = 4, ["name"] = "Speed Entry" },
		-- Hi Jump Boots
		[169768] = { ["segment_no"] = 5, ["name"] = "Speed Escape" },
		[171683] = { ["segment_no"] = 5, ["name"] = "Lake Spark" },
		[174537] = { ["segment_no"] = 5, ["name"] = "Squeept Spark" },
		[176434] = { ["segment_no"] = 5, ["name"] = "Big Up Spark" },
		[180628] = { ["segment_no"] = 5, ["name"] = "Chain Spark out of UN" },
		[182277] = { ["segment_no"] = 5, ["name"] = "Reserve Elevator" },
		[183983] = { ["segment_no"] = 5, ["name"] = "Red Gate Glitch" },
		[188950] = { ["segment_no"] = 5, ["name"] = "Spikesuit" },
		[193334] = { ["segment_no"] = 5, ["name"] = "Water Bounceball" },
		[197642] = { ["segment_no"] = 5, ["name"] = "SporeSpawn Exit" },
		[199828] = { ["segment_no"] = 5, ["name"] = "Charge Hoppers" },
		[201569] = { ["segment_no"] = 5, ["name"] = "Charge Exit" },
		[202938] = { ["segment_no"] = 5, ["name"] = "Missing Etank Room" },
		[205787] = { ["segment_no"] = 5, ["name"] = "Cacatac Alley" },
		[206530] = { ["segment_no"] = 5, ["name"] = "Hi Jump Boots" },
		-- Grapple
		[207961] = { ["segment_no"] = 6, ["name"] = "HJB Exit" },
		[210000] = { ["segment_no"] = 6, ["name"] = "PB Gate" },
		[213228] = { ["segment_no"] = 6, ["name"] = "Hopper Hallway Farm" },
		[217358] = { ["segment_no"] = 6, ["name"] = "Towards Dachora" },
		[220123] = { ["segment_no"] = 6, ["name"] = "Leaving Dachora" },
		[222547] = { ["segment_no"] = 6, ["name"] = "Pink Wall" },
		[226611] = { ["segment_no"] = 6, ["name"] = "Norfair Elevator" },
		[229779] = { ["segment_no"] = 6, ["name"] = "Ice Hellway Farm" },
		[232042] = { ["segment_no"] = 6, ["name"] = "Ice Hellway Shutters" },
		[233400] = { ["segment_no"] = 6, ["name"] = "Ice Tripper" },
		[236739] = { ["segment_no"] = 6, ["name"] = "Leaving Ice" },
		[239487] = { ["segment_no"] = 6, ["name"] = "PB Blockade Farm" },
		[241331] = { ["segment_no"] = 6, ["name"] = "Missile Skip" },
		[244188] = { ["segment_no"] = 6, ["name"] = "Prescrew" },
		[247040] = { ["segment_no"] = 6, ["name"] = "Screw" },
		[248595] = { ["segment_no"] = 6, ["name"] = "Refill Room" },
		[250837] = { ["segment_no"] = 6, ["name"] = "Spark Blockade" },
		[255647] = { ["segment_no"] = 6, ["name"] = "Guardian Runback" },
		[258566] = { ["segment_no"] = 6, ["name"] = "Dessgeega Kill Room" },
		[261588] = { ["segment_no"] = 6, ["name"] = "Pipe Tunnels" },
		[262724] = { ["segment_no"] = 6, ["name"] = "Tripper Ride" },
		-- Lower Norfair
		[264656] = { ["segment_no"] = 7, ["name"] = "Springball Skip" },
		[273109] = { ["segment_no"] = 7, ["name"] = "Acid Death Spikes" },
		[274860] = { ["segment_no"] = 7, ["name"] = "Bull Room" },
		[276343] = { ["segment_no"] = 7, ["name"] = "Ripper IBJ" },
		[282700] = { ["segment_no"] = 7, ["name"] = "Preridley Farm" },
		[286260] = { ["segment_no"] = 7, ["name"] = "Ridley" },
		[296455] = { ["segment_no"] = 7, ["name"] = "Ridley Etank" },
		[298183] = { ["segment_no"] = 7, ["name"] = "Exiting Ridley" },
		[299921] = { ["segment_no"] = 7, ["name"] = "Gold Torizo" },
		[307421] = { ["segment_no"] = 7, ["name"] = "Below Bull Room" },
		[310257] = { ["segment_no"] = 7, ["name"] = "Viola Climb" },
		[311771] = { ["segment_no"] = 7, ["name"] = "Acid Death Pit" },
		[314592] = { ["segment_no"] = 7, ["name"] = "Ripper Dessgeegas" },
		[318523] = { ["segment_no"] = 7, ["name"] = "After Super Blockade" },
		[320656] = { ["segment_no"] = 7, ["name"] = "Lava Guardian" },
		[324734] = { ["segment_no"] = 7, ["name"] = "LN Final Enemies" },
		[326447] = { ["segment_no"] = 7, ["name"] = "Rumble Maze" },
		-- Lost Caverns
		[329510] = { ["segment_no"] = 8, ["name"] = "Norfair Elevator Left" },
		[331481] = { ["segment_no"] = 8, ["name"] = "Water Hoppers" },
		[336784] = { ["segment_no"] = 8, ["name"] = "Big Pink" },
		[339947] = { ["segment_no"] = 8, ["name"] = "Brin Elevator Right" },
		[342672] = { ["segment_no"] = 8, ["name"] = "Kago Climb" },
		[344762] = { ["segment_no"] = 8, ["name"] = "Spazer Room" },
		[346987] = { ["segment_no"] = 8, ["name"] = "Spazer Spark" },
		[350042] = { ["segment_no"] = 8, ["name"] = "Guardian Chain Spark" },
		[355246] = { ["segment_no"] = 8, ["name"] = "Landing Site" },
		[358443] = { ["segment_no"] = 8, ["name"] = "Etank Room" },
		[361129] = { ["segment_no"] = 8, ["name"] = "Sky Guardian" },
		[367651] = { ["segment_no"] = 8, ["name"] = "Gate Clip" },
		[370417] = { ["segment_no"] = 8, ["name"] = "Crab Fall" },
		[372074] = { ["segment_no"] = 8, ["name"] = "Boulder Bowling" },
		[375981] = { ["segment_no"] = 8, ["name"] = "Phantoon Save Room" },
		[377205] = { ["segment_no"] = 8, ["name"] = "Lost Maze" },
		[379021] = { ["segment_no"] = 8, ["name"] = "Phantoon" },
		-- Botwoon
		[383996] = { ["segment_no"] = 9, ["name"] = "Chain Spark To Gravity" },
		[385396] = { ["segment_no"] = 9, ["name"] = "Sinking Chain Spark" },
		[388649] = { ["segment_no"] = 9, ["name"] = "Gravity" },
		[392664] = { ["segment_no"] = 9, ["name"] = "Spikesuit" },
		[394127] = { ["segment_no"] = 9, ["name"] = "Fish Tunnel Left" },
		[398290] = { ["segment_no"] = 9, ["name"] = "Spiksuit IBJ" },
		[404000] = { ["segment_no"] = 9, ["name"] = "Leaving Kago Guardian" },
		[405887] = { ["segment_no"] = 9, ["name"] = "Terrible Terrible Fall Supers" },
		[407797] = { ["segment_no"] = 9, ["name"] = "Boulder Bowling" },
		[415690] = { ["segment_no"] = 9, ["name"] = "Red Gate Chain Spark" },
		[418699] = { ["segment_no"] = 9, ["name"] = "Spikester Descent" },
		[420599] = { ["segment_no"] = 9, ["name"] = "Crabby GGG" },
		[423124] = { ["segment_no"] = 9, ["name"] = "Twin Red Gates" },
		[424512] = { ["segment_no"] = 9, ["name"] = "Purple Platforms" },
		[425691] = { ["segment_no"] = 9, ["name"] = "Shutter Maze Top" },
		[431577] = { ["segment_no"] = 9, ["name"] = "Quicksand Run" },
		[433645] = { ["segment_no"] = 9, ["name"] = "Botwoon" },
		[435650] = { ["segment_no"] = 9, ["name"] = "Botwoon Fall" },
		-- Cleanup
		[438051] = { ["segment_no"] = 10, ["name"] = "Save Room Fall" },
		[439986] = { ["segment_no"] = 10, ["name"] = "Snail Highway" },
		[442226] = { ["segment_no"] = 10, ["name"] = "Green Brin PB Blockade" },
		[444347] = { ["segment_no"] = 10, ["name"] = "Red Tower Guardian" },
		[448312] = { ["segment_no"] = 10, ["name"] = "Spike Guardian" },
		[452207] = { ["segment_no"] = 10, ["name"] = "Water Room 2" },
		[455587] = { ["segment_no"] = 10, ["name"] = "Norfair Elevator Left" },
		[458491] = { ["segment_no"] = 10, ["name"] = "Lag Farm" },
		[461347] = { ["segment_no"] = 10, ["name"] = "Lava Blockades" },
		[463622] = { ["segment_no"] = 10, ["name"] = "Lava Guardian" },
		[467461] = { ["segment_no"] = 10, ["name"] = "Big Up Spark" },
		[468574] = { ["segment_no"] = 10, ["name"] = "Lag Climb" },
		[470572] = { ["segment_no"] = 10, ["name"] = "Tube Clip" },
		[472111] = { ["segment_no"] = 10, ["name"] = "Big Pink" },
		[475146] = { ["segment_no"] = 10, ["name"] = "Overhead Blockade" },
		[477476] = { ["segment_no"] = 10, ["name"] = "PB Backroom" },
		[481865] = { ["segment_no"] = 10, ["name"] = "Hopper Kill Room" },
		[485293] = { ["segment_no"] = 10, ["name"] = "Dachora Reverse Spark" },
		[487411] = { ["segment_no"] = 10, ["name"] = "Hopper Hellway" },
		[491140] = { ["segment_no"] = 10, ["name"] = "Broken Tube" },
		-- Draygon
		[493067] = { ["segment_no"] = 11, ["name"] = "SpeedySupers" },
		[495963] = { ["segment_no"] = 11, ["name"] = "Mochtroids" },
		[498313] = { ["segment_no"] = 11, ["name"] = "Bomb Block Tunnel" },
		[500527] = { ["segment_no"] = 11, ["name"] = "Beam Combo GGG" },
		[502965] = { ["segment_no"] = 11, ["name"] = "Falling Sand Climb" },
		[505806] = { ["segment_no"] = 11, ["name"] = "Draygon" },
		[511560] = { ["segment_no"] = 11, ["name"] = "Sandfall Fall" },
		[512414] = { ["segment_no"] = 11, ["name"] = "SpaceFishJump" },
		[516113] = { ["segment_no"] = 11, ["name"] = "Towards Shutter Switch" },
		[519163] = { ["segment_no"] = 11, ["name"] = "Towards Shutter Room" },
		[521003] = { ["segment_no"] = 11, ["name"] = "Pipes Guardian" },
		[526042] = { ["segment_no"] = 11, ["name"] = "Mochtroid Spark" },
		[529794] = { ["segment_no"] = 11, ["name"] = "Big Speed Jump" },
		[531615] = { ["segment_no"] = 11, ["name"] = "Snail Hallway" },
		[533572] = { ["segment_no"] = 11, ["name"] = "Ridley Tube Climb" },
		[537536] = { ["segment_no"] = 11, ["name"] = "Reserve Upspark" },
		[541745] = { ["segment_no"] = 11, ["name"] = "Shutter Maze Bottom" },
		[546439] = { ["segment_no"] = 11, ["name"] = "Guard Crabs" },
		[550284] = { ["segment_no"] = 11, ["name"] = "Beach Crabs" },
		-- Tourian
		[551975] = { ["segment_no"] = 12, ["name"] = "GateKeeper" },
		[555618] = { ["segment_no"] = 12, ["name"] = "M1 Purple Door Metroids" },
		[557651] = { ["segment_no"] = 12, ["name"] = "M2 Kill 6" },
		[560019] = { ["segment_no"] = 12, ["name"] = "M3 Kill 2" },
		[560717] = { ["segment_no"] = 12, ["name"] = "M4 Kill 5" },
		[561982] = { ["segment_no"] = 12, ["name"] = "M5 Kill 6" },
		[564556] = { ["segment_no"] = 12, ["name"] = "M6 Shutter Skip" },
		[566172] = { ["segment_no"] = 12, ["name"] = "M7 Kill 5" },
		[569006] = { ["segment_no"] = 12, ["name"] = "M8 Kill 7" },
		[571220] = { ["segment_no"] = 12, ["name"] = "M9 Kill 9" },
		[574362] = { ["segment_no"] = 12, ["name"] = "M10 Kill 3" },
		[579234] = { ["segment_no"] = 12, ["name"] = "Baby Skip" },
		[581698] = { ["segment_no"] = 12, ["name"] = "Big Hoppers" },
		[583464] = { ["segment_no"] = 12, ["name"] = "Zeb Skip" },
		-- Final Escape
		[608930] = { ["segment_no"] = 13, ["name"] = "Escape Room 2" },
		[611824] = { ["segment_no"] = 13, ["name"] = "Missile Pack Room" },
		[614085] = { ["segment_no"] = 13, ["name"] = "Shutter Skip" },
		[618256] = { ["segment_no"] = 13, ["name"] = "Maze Shutter Pirate" },
		[620659] = { ["segment_no"] = 13, ["name"] = "Jump Morph Room" },
		[625586] = { ["segment_no"] = 13, ["name"] = "Morph Tunnels" },
		[633881] = { ["segment_no"] = 13, ["name"] = "Metroid Dodge 1" },
		[634782] = { ["segment_no"] = 13, ["name"] = "Metroid Dodge 2" },
		[635773] = { ["segment_no"] = 13, ["name"] = "Kago Shutter Mockball" },
		[639065] = { ["segment_no"] = 13, ["name"] = "Tiny Footholds Climb" },
		[643106] = { ["segment_no"] = 13, ["name"] = "Trip On Slopes" },
		[645128] = { ["segment_no"] = 13, ["name"] = "Underwater Platforming 1" },
		[647867] = { ["segment_no"] = 13, ["name"] = "Underwater Platforming 2" },
		[650394] = { ["segment_no"] = 13, ["name"] = "Mushroom Run" },
		[654408] = { ["segment_no"] = 13, ["name"] = "Pirates And Steam" },
		[658403] = { ["segment_no"] = 13, ["name"] = "Lava And Steam" },
		[661558] = { ["segment_no"] = 13, ["name"] = "Rising Tides" },
		[662676] = { ["segment_no"] = 13, ["name"] = "Final Boss" },
		[664642] = { ["segment_no"] = 13, ["name"] = "Ship" },
	},
	["SZM101"] = {
		-- Bombs
		[1988] = { ["segment_no"] = 1, ["name"] = "Landing Site" },
		[3697] = { ["segment_no"] = 1, ["name"] = "Shaft Top" },
		[5519] = { ["segment_no"] = 1, ["name"] = "Ceiling Etank" },
		[7875] = { ["segment_no"] = 1, ["name"] = "Robo Clip" },
		[8794] = { ["segment_no"] = 1, ["name"] = "White Wall Kago Room" },
		[9973] = { ["segment_no"] = 1, ["name"] = "White Wall 2" },
		[10927] = { ["segment_no"] = 1, ["name"] = "White Wall Missiles" },
		[12610] = { ["segment_no"] = 1, ["name"] = "Missile Gate Room" },
		[14553] = { ["segment_no"] = 1, ["name"] = "Kihunter Climb" },
		[15494] = { ["segment_no"] = 1, ["name"] = "Harder Robo Clip" },
		[19771] = { ["segment_no"] = 1, ["name"] = "Crumble Run" },
		[22330] = { ["segment_no"] = 1, ["name"] = "Pirate Jump" },
		[23874] = { ["segment_no"] = 1, ["name"] = "Bomb Torizo" },
		-- Varia
		[26856] = { ["segment_no"] = 2, ["name"] = "BT Exit" },
		[28368] = { ["segment_no"] = 2, ["name"] = "Crumble Run Return" },
		[30567] = { ["segment_no"] = 2, ["name"] = "Ripper Bomb Jump" },
		[31449] = { ["segment_no"] = 2, ["name"] = "Pancake Fall" },
		[32596] = { ["segment_no"] = 2, ["name"] = "Pre Grapple" },
		[34480] = { ["segment_no"] = 2, ["name"] = "Post Grapple" },
		[35716] = { ["segment_no"] = 2, ["name"] = "Super Room Entry" },
		[38525] = { ["segment_no"] = 2, ["name"] = "Super Ceiling Bomb Jump" },
		[42618] = { ["segment_no"] = 2, ["name"] = "Reserve KiHunters" },
		[45749] = { ["segment_no"] = 2, ["name"] = "Shaft Top" },
		[48122] = { ["segment_no"] = 2, ["name"] = "Robot Clip Again" },
		[50183] = { ["segment_no"] = 2, ["name"] = "Acid Dive" },
		[51932] = { ["segment_no"] = 2, ["name"] = "Secret Ceiling" },
		-- Power Bombs
		[55592] = { ["segment_no"] = 3, ["name"] = "Varia Exit" },
		[58570] = { ["segment_no"] = 3, ["name"] = "Etank Short Mock" },
		[60906] = { ["segment_no"] = 3, ["name"] = "Chozo Etank" },
		[62628] = { ["segment_no"] = 3, ["name"] = "UN Elevator" },
		[63759] = { ["segment_no"] = 3, ["name"] = "Shot Block Wall" },
		[65133] = { ["segment_no"] = 3, ["name"] = "Lava Dive Farm" },
		[68313] = { ["segment_no"] = 3, ["name"] = "Lava Dive Etank" },
		[71942] = { ["segment_no"] = 3, ["name"] = "Big Hopper Empty Shaft" },
		[73840] = { ["segment_no"] = 3, ["name"] = "Speed Room" },
		[77611] = { ["segment_no"] = 3, ["name"] = "Big Hopper Ramps" },
		[81139] = { ["segment_no"] = 3, ["name"] = "Maglodite Lava Dive" },
		[87550] = { ["segment_no"] = 3, ["name"] = "Springball Room " },
		[88684] = { ["segment_no"] = 3, ["name"] = "Spikesuit" },
		[91164] = { ["segment_no"] = 3, ["name"] = "Morph Gauntlet" },
		-- Upper Norfair
		[95141] = { ["segment_no"] = 4, ["name"] = "Leaving Power Bomb Room" },
		[96840] = { ["segment_no"] = 4, ["name"] = "Pre Ice" },
		[97990] = { ["segment_no"] = 4, ["name"] = "Leaving Ice" },
		[99658] = { ["segment_no"] = 4, ["name"] = "Baby Croc Supers" },
		[101964] = { ["segment_no"] = 4, ["name"] = "Pre Hi Jump" },
		[103577] = { ["segment_no"] = 4, ["name"] = "Leaving Hi Jump" },
		[106113] = { ["segment_no"] = 4, ["name"] = "Springball" },
		[111097] = { ["segment_no"] = 4, ["name"] = "Big Dessgeegas" },
		[112046] = { ["segment_no"] = 4, ["name"] = "Wave Block Pit" },
		[113350] = { ["segment_no"] = 4, ["name"] = "Exiting Wave" },
		[114346] = { ["segment_no"] = 4, ["name"] = "Missiles Below Wave" },
		[117223] = { ["segment_no"] = 4, ["name"] = "Wave Wave Gate" },
		[119351] = { ["segment_no"] = 4, ["name"] = "Super Blockade" },
		[122209] = { ["segment_no"] = 4, ["name"] = "Acid Party" },
		[126159] = { ["segment_no"] = 4, ["name"] = "Save Room Secret" },
		[129548] = { ["segment_no"] = 4, ["name"] = "Reserve Tank Spark" },
		-- Lower Norfair
		[131553] = { ["segment_no"] = 5, ["name"] = "Elevator Entry" },
		[133144] = { ["segment_no"] = 5, ["name"] = "Save Room Short Charge" },
		[137953] = { ["segment_no"] = 5, ["name"] = "Reverse Long Spark" },
		[141034] = { ["segment_no"] = 5, ["name"] = "Tight Short Charge" },
		[146485] = { ["segment_no"] = 5, ["name"] = "Crumble Bridge Supers" },
		[149380] = { ["segment_no"] = 5, ["name"] = "FireFleas" },
		[150671] = { ["segment_no"] = 5, ["name"] = "Spikey Mistep" },
		[154303] = { ["segment_no"] = 5, ["name"] = "Fallen Hero Super" },
		[157333] = { ["segment_no"] = 5, ["name"] = "Morph Maze Pipes" },
		[160336] = { ["segment_no"] = 5, ["name"] = "Build Your Speedway" },
		[165014] = { ["segment_no"] = 5, ["name"] = "Monster Elevator" },
		[166225] = { ["segment_no"] = 5, ["name"] = "Goldbat Spark" },
		[170253] = { ["segment_no"] = 5, ["name"] = "Awful Chain Spark" },
		[172088] = { ["segment_no"] = 5, ["name"] = "Chain Spark Puzzle" },
		[176849] = { ["segment_no"] = 5, ["name"] = "Leaving Spark Puzzle" },
		[178904] = { ["segment_no"] = 5, ["name"] = "Screw Attack" },
		[183367] = { ["segment_no"] = 5, ["name"] = "Chain Spark Out Of LN" },
		-- Cleanup 1
		[186337] = { ["segment_no"] = 6, ["name"] = "Caterpiller Short Charge" },
		[189682] = { ["segment_no"] = 6, ["name"] = "Solid Cacatacs" },
		[191111] = { ["segment_no"] = 6, ["name"] = "Spikesuit Hallway" },
		[192754] = { ["segment_no"] = 6, ["name"] = "Chasm Supers" },
		[195623] = { ["segment_no"] = 6, ["name"] = "Speed Keep Descent" },
		[197830] = { ["segment_no"] = 6, ["name"] = "Hole In The Wall Missiles" },
		[200227] = { ["segment_no"] = 6, ["name"] = "Eticoon Entry" },
		[202671] = { ["segment_no"] = 6, ["name"] = "Super Door Over Crumples" },
		[204729] = { ["segment_no"] = 6, ["name"] = "Crumble Pillers" },
		[206459] = { ["segment_no"] = 6, ["name"] = "Post Sporespawn Room" },
		[209112] = { ["segment_no"] = 6, ["name"] = "Spazer" },
		[211763] = { ["segment_no"] = 6, ["name"] = "Spazer Exit" },
		[216679] = { ["segment_no"] = 6, ["name"] = "Space Jump " },
		[218952] = { ["segment_no"] = 6, ["name"] = "Bomb Hole Missiles" },
		[227215] = { ["segment_no"] = 6, ["name"] = "Mini Kraid Big Lag" },
		[230777] = { ["segment_no"] = 6, ["name"] = "Pink Room Exit Spark" },
		-- Chozodia
		[233141] = { ["segment_no"] = 7, ["name"] = "Elevator Top" },
		[238093] = { ["segment_no"] = 7, ["name"] = "Robot Clip With Speed" },
		[240640] = { ["segment_no"] = 7, ["name"] = "Charge Entry" },
		[244513] = { ["segment_no"] = 7, ["name"] = "Charge Entry Exit" },
		[247178] = { ["segment_no"] = 7, ["name"] = "Shoot The Floor" },
		[250382] = { ["segment_no"] = 7, ["name"] = "Map Room" },
		[255243] = { ["segment_no"] = 7, ["name"] = "White Room Etank" },
		[257954] = { ["segment_no"] = 7, ["name"] = "Ship Entry Chain Spark" },
		[261777] = { ["segment_no"] = 7, ["name"] = "Waterway Speedkeep" },
		[267382] = { ["segment_no"] = 7, ["name"] = "Chozodia Speedkeep" },
		[268867] = { ["segment_no"] = 7, ["name"] = "Bang" },
		[273002] = { ["segment_no"] = 7, ["name"] = "Botwoon" },
		[281073] = { ["segment_no"] = 7, ["name"] = "Gravity" },
		[284161] = { ["segment_no"] = 7, ["name"] = "PB Speedball" },
		[286940] = { ["segment_no"] = 7, ["name"] = "Tricky Chain Spark" },
		[291727] = { ["segment_no"] = 7, ["name"] = "Gold Torizo" },
		[296507] = { ["segment_no"] = 7, ["name"] = "Reflector Puzzle" },
		[299868] = { ["segment_no"] = 7, ["name"] = "Lost Maze Down" },
		[302818] = { ["segment_no"] = 7, ["name"] = "Big Space Boost" },
		-- Tourian
		[305310] = { ["segment_no"] = 8, ["name"] = "Kihunter Elevator" },
		[307373] = { ["segment_no"] = 8, ["name"] = "Pancake Missiles" },
		[313617] = { ["segment_no"] = 8, ["name"] = "Landing Site Spark" },
		[327401] = { ["segment_no"] = 8, ["name"] = "Morph Room" },
		[330859] = { ["segment_no"] = 8, ["name"] = "Ninja Pirate Fall" },
		[332225] = { ["segment_no"] = 8, ["name"] = "Xray" },
		[338435] = { ["segment_no"] = 8, ["name"] = "Xray Standup Clip" },
		[342286] = { ["segment_no"] = 8, ["name"] = "Blind Speedkeep" },
		[349121] = { ["segment_no"] = 8, ["name"] = "Metroids" },
		[353551] = { ["segment_no"] = 8, ["name"] = "Mother Brain" },
		[358051] = { ["segment_no"] = 8, ["name"] = "Elevator Breakdown" },
		[361276] = { ["segment_no"] = 8, ["name"] = "Back Of Gauntlet Missiles" },
		[364129] = { ["segment_no"] = 8, ["name"] = "Parlor" },
		[367099] = { ["segment_no"] = 8, ["name"] = "Parlor Fall" },
		[368995] = { ["segment_no"] = 8, ["name"] = "Phantoon" },
		[375595] = { ["segment_no"] = 8, ["name"] = "Ninja Pirates" },
		[377038] = { ["segment_no"] = 8, ["name"] = "Vault Missile" },
		[389449] = { ["segment_no"] = 8, ["name"] = "Ninja Pirate Room" },
		[391807] = { ["segment_no"] = 8, ["name"] = "Under MB Speedkeep" },
		[394224] = { ["segment_no"] = 8, ["name"] = "Metroids Foreward" },
		[397214] = { ["segment_no"] = 8, ["name"] = "Metroids Backward" },
		[399794] = { ["segment_no"] = 8, ["name"] = "Tourian Escape" },
		-- Cleanup 2
		[402344] = { ["segment_no"] = 9, ["name"] = "Brinstar Secret Item" },
		[405402] = { ["segment_no"] = 9, ["name"] = "Mini Kraid Long Room" },
		[407735] = { ["segment_no"] = 9, ["name"] = "Mini Kraid Boss Fight" },
		[409503] = { ["segment_no"] = 9, ["name"] = "Kraid" },
		[415473] = { ["segment_no"] = 9, ["name"] = "Pink Hopper Spark" },
		[417105] = { ["segment_no"] = 9, ["name"] = "Reserve Room" },
		[420761] = { ["segment_no"] = 9, ["name"] = "Below Reserve Room" },
		[422348] = { ["segment_no"] = 9, ["name"] = "SporeSpawn Ice Bridge" },
		[425688] = { ["segment_no"] = 9, ["name"] = "SporeSpawn Exit" },
		[429258] = { ["segment_no"] = 9, ["name"] = "Kraid Mouth Missile" },
		[430978] = { ["segment_no"] = 9, ["name"] = "Etank Chain Spark" },
		[432750] = { ["segment_no"] = 9, ["name"] = "Slick Space Boost" },
		[434746] = { ["segment_no"] = 9, ["name"] = "Rock Pipes" },
		[438016] = { ["segment_no"] = 9, ["name"] = "Maze Skip" },
		[441917] = { ["segment_no"] = 9, ["name"] = "Croc's Hideaway" },
		[444044] = { ["segment_no"] = 9, ["name"] = "Crocomire" },
		[449500] = { ["segment_no"] = 9, ["name"] = "Broken Grapple Blocks" },
		[451525] = { ["segment_no"] = 9, ["name"] = "Lava Dive PBs" },
		[455167] = { ["segment_no"] = 9, ["name"] = "Super Gate Shot" },
		[459069] = { ["segment_no"] = 9, ["name"] = "Breakable Chozo" },
		-- Pirate Ship Ridley
		[462229] = { ["segment_no"] = 10, ["name"] = "Shortest Charge" },
		[465452] = { ["segment_no"] = 10, ["name"] = "Inside Outside Spark" },
		[469386] = { ["segment_no"] = 10, ["name"] = "Plasma SBA" },
		[473602] = { ["segment_no"] = 10, ["name"] = "Super Speed Space Jump" },
		[479008] = { ["segment_no"] = 10, ["name"] = "Kihunter Zoo" },
		[483891] = { ["segment_no"] = 10, ["name"] = "Under The Ship" },
		[486551] = { ["segment_no"] = 10, ["name"] = "Tease PBs" },
		[488327] = { ["segment_no"] = 10, ["name"] = "Flappy Birds" },
		[491965] = { ["segment_no"] = 10, ["name"] = "Flappy Exit" },
		[497892] = { ["segment_no"] = 10, ["name"] = "Tube Break" },
		[500731] = { ["segment_no"] = 10, ["name"] = "Kihopper Ramp Down" },
		[506346] = { ["segment_no"] = 10, ["name"] = "Worker Robot Roadblock" },
		[509407] = { ["segment_no"] = 10, ["name"] = "Under the Ship 2" },
		[515364] = { ["segment_no"] = 10, ["name"] = "The Lazer Part" },
		[518086] = { ["segment_no"] = 10, ["name"] = "Lazer Save Room" },
		[519278] = { ["segment_no"] = 10, ["name"] = "SpaceBoost Etank" },
		[522575] = { ["segment_no"] = 10, ["name"] = "Two Gate" },
		[528316] = { ["segment_no"] = 10, ["name"] = "Ridley" },
		-- Pirate Ship Draygon
		[531137] = { ["segment_no"] = 11, ["name"] = "Leaving Ridley" },
		[533818] = { ["segment_no"] = 11, ["name"] = "Gunship Room" },
		[543169] = { ["segment_no"] = 11, ["name"] = "Underground Path" },
		[545067] = { ["segment_no"] = 11, ["name"] = "Green Lazers" },
		[545887] = { ["segment_no"] = 11, ["name"] = "Jetpack Pirates" },
		[547346] = { ["segment_no"] = 11, ["name"] = "One Try Lazer Skip" },
		[551037] = { ["segment_no"] = 11, ["name"] = "Draygon" },
		[559854] = { ["segment_no"] = 11, ["name"] = "Boss Missile" },
		[561765] = { ["segment_no"] = 11, ["name"] = "Four Key Shutters" },
		[563404] = { ["segment_no"] = 11, ["name"] = "Ninja Pirates" },
		[566820] = { ["segment_no"] = 11, ["name"] = "In The Way Blocks" },
		[569136] = { ["segment_no"] = 11, ["name"] = "Animal Room" },
		[569702] = { ["segment_no"] = 11, ["name"] = "Crash Room" },
		[571464] = { ["segment_no"] = 11, ["name"] = "Dachora Room" },
		[573073] = { ["segment_no"] = 11, ["name"] = "White Pirates" },
	},

}


--
-- Utility
--

-- orderedPairs {{{

function deepcopy(orig)
    local orig_type = type(orig)
    local copy
    if orig_type == 'table' then
        copy = {}
        for orig_key, orig_value in next, orig, nil do
            copy[deepcopy(orig_key)] = deepcopy(orig_value)
        end
        setmetatable(copy, deepcopy(getmetatable(orig)))
    else -- number, string, boolean, etc
        copy = orig
    end
    return copy
end


function __genOrderedIndex( t )
    local orderedIndex = {}
    for key in pairs(t) do
        table.insert( orderedIndex, key )
    end
    table.sort( orderedIndex )
    return orderedIndex
end

function orderedNext(t, state)
    -- Equivalent of the next function, but returns the keys in the alphabetic
    -- order. We use a temporary ordered key table that is stored in the
    -- table being iterated.

    local key = nil
    --print("orderedNext: state = "..tostring(state) )
    if state == nil then
        -- the first time, generate the index
        t.__orderedIndex = __genOrderedIndex( t )
        key = t.__orderedIndex[1]
    else
        -- fetch the next value
        for i = 1,table.getn(t.__orderedIndex) do
            if t.__orderedIndex[i] == state then
                key = t.__orderedIndex[i+1]
            end
        end
    end

    if key then
        return key, t[key]
    end

    -- no more value to return, cleanup
    t.__orderedIndex = nil
    return
end

function orderedPairs(t)
    -- Equivalent of the pairs() function on tables. Allows to iterate
    -- in order
    return orderedNext, t, nil
end
-- }}}

local SLUGS = {}
local function slugify(s)
    local slug = string.gsub(string.gsub(s, "[^ A-Za-z0-9]", ""), "[ ]+", "_"):lower()
    if not SLUGS[slug] then
        SLUGS[slug] = 1
        return slug
    end

    local ret = slug
    local i = 2
    while SLUGS[ret] do
        ret = slug .. '_' .. tostring(i)
        i = i + 1
    end
    SLUGS[ret] = 1
    return ret
end

local function ucfirst(s)
    return s:sub(1,1):upper() .. s:sub(2):lower()
end

local function draw_lines(x, y, L)
    for i, line in ipairs(L) do
        gui.text(x, y + ((i - 1) * 8), line)
    end
end

local function tohex(n, size)
    size = size or 0
    return string.format("$%0" .. tostring(size) .. "X", n)
end

local function call_for_each_bank(address, fn, ...)
    assert(address < 0x7F0000 or address > 0x7FFFFF)
    for i = 0x80, 0xDF do
        fn(bit.lshift(i, 16) + bit.band(address, 0xFFFF), unpack(arg))
    end
    fn(0x7E0000 + address, unpack(arg))
end

-- local debug_file = io.open("debug.txt", "w")

local function debug(...)
    -- print(unpack(arg))
    -- debug_file:write(table.concat(arg, " ") .. "\n")
    -- debug_file:flush()
end


--
-- State
--

local function annotate_address(addr, val)
    if addr < 0x7F0000 or addr > 0x7FFFFF then
        addr = bit.band(addr, 0xFFFF)
    end

    for _, mem in pairs(MEMTRACK) do
        if mem[1] <= addr and (addr < mem[1] + mem[2]) then
            return mem[3]
        end
    end

    return "(" .. tohex(addr, 4) .. ") ??"
end

local function get_current_state()
    local state = {}
    for _, mem in pairs(MEMTRACK) do
        local addr = mem[1]
        local size = mem[2]

        if mem[1] < 0x10000 then
            addr = 0x7E0000 + addr
        end

        if size > 1 then
            assert(bit.band(size, 1) == 0)
            for i_addr = addr, addr + size - 1, 2 do
                state[i_addr] = {2, memory.readwordunsigned(i_addr)}
            end
        else
            if size == 1 then
                state[addr] = {1, memory.readbyte(addr)}
            else
                state[addr] = {2, memory.readwordunsigned(addr)}
            end
        end
    end
    return state
end

local function save_preset(step)
    local current_state = get_current_state()

    print("saving step " .. step['full_slug'])
    preset_output = preset_output .. "\npreset_" .. CAT .. '_' .. step['full_slug'] .. ":\n"

    if last_step then
        preset_output = preset_output .. "    dw #preset_" .. CAT .. '_' .. last_step['full_slug'] .. " ; " .. last_step['full_name'] .. "\n"
    else
        preset_output = preset_output .. "    dw #$0000\n"
    end

    last_step = step

    for addr, size_and_val in orderedPairs(current_state) do
        local size = size_and_val[1]
        local val = size_and_val[2]

        if last_state[addr] ~= val then
            last_state[addr] = val

            preset_output = preset_output ..  "    dl " ..  tohex(addr, 6) .. " : "
            preset_output = preset_output ..  "db " ..  tohex(size, 2) .. " : "
            preset_output = preset_output .. (size == 1 and "db " or "dw ") ..  tohex(val, size == 1 and 2 or 4)
            preset_output = preset_output .. " ; " .. annotate_address(addr, val) .. "\n"
        end
    end

    preset_output = preset_output .. "    dw #$FFFF\n"
    preset_output = preset_output .. ".after\n"
end

local function save_preset_file()
    local file = io.open('presets_data.asm', 'w')
    file:write(preset_output)
    file:close()

    local file = io.open('presets_menu.asm', 'w')

    file:write('PresetsMenu' .. ucfirst(CAT) .. ':\n')
    for _, segment in pairs(SEGMENTS[CAT]) do
        file:write('    dw #presets_goto_' .. CAT .. '_' .. segment['slug'] .. '\n')
    end
    file:write('    dw #$0000\n')
    file:write('    %cm_header("PRESETS FOR ' .. CAT:upper() .. '")\n')
    file:write('\n')

    for _, segment in pairs(SEGMENTS[CAT]) do
        file:write('presets_goto_' .. CAT .. '_' .. segment['slug'] .. ':\n')
        file:write('    %cm_submenu("' .. segment['name'] .. '", #presets_submenu_' .. CAT .. '_' .. segment['slug'] .. ')\n')
        file:write('\n')
    end

    for _, segment in pairs(SEGMENTS[CAT]) do
        file:write('presets_submenu_' .. CAT .. '_' .. segment['slug'] .. ':\n')
        for _, step in pairs(segment['steps']) do
            file:write('    dw #presets_' .. CAT .. '_' .. step['full_slug'] .. '\n')
        end
        file:write('    dw #$0000\n')
        file:write('    %cm_header("' .. segment['name']:upper() .. '")\n')
        file:write('\n')
    end

    for _, segment in pairs(SEGMENTS[CAT]) do
        file:write('; ' .. segment['name'] .. '\n')
        for _, step in pairs(segment['steps']) do
            file:write('presets_' .. CAT .. '_' .. step['full_slug'] .. ':\n')
            file:write('    %cm_preset("' .. step['name'] .. '", #preset_' .. CAT .. '_' .. step['full_slug'] .. ')\n\n')
        end
        file:write("\n")
    end
    file:close()
end

--
-- Main
--

local function tick()
    local frame = emu.framecount()

    local step = STEPS[CAT][frame]
    if step then
        save_preset(step)
        save_preset_file()
    end
end

local function main()
    for _, segment in pairs(SEGMENTS[CAT]) do
        segment['slug'] = slugify(segment['name'])
    end

    for _, step in orderedPairs(STEPS[CAT]) do
        segment = SEGMENTS[CAT][step['segment_no']]
        step['segment'] = segment
        step['slug'] = slugify(step['name'])
        step['full_slug'] = segment['slug'] .. "_" .. step['slug']
        step['full_name'] = segment['name'] .. ": " .. step['name']
        table.insert(segment['steps'], step)
    end

    while true do
        tick()
        snes9x.frameadvance()
    end
end

main()