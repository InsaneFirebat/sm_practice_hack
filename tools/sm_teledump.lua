local CAT = "zfackpdr" -- prkd, zfackpdr

local last_state = {} -- holds all state that has been changed up until last save

local preset_output = ""
local last_step = nil

local MEMTRACK = { -- {{{
    -- { 0x078B, 0x2, 'Elevator Index' },
    { 0x078D, 0x2, 'DDB' },
    -- { 0x078F, 0x2, 'DoorOut Index' },
    { 0x079B, 0x2, 'MDB' },
    -- { 0x079F, 0x2, 'Region' },
    -- { 0x07C3, 0x6, 'GFX Pointers' },
    { 0x07F3, 0x2, 'Music Bank' },
    { 0x07F5, 0x2, 'Music Track' },
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
    { 0x090F, 0x2, 'Screen subpixel X position' },
    { 0x0911, 0x2, 'Screen X position in pixels' },
    { 0x0913, 0x2, 'Screen subpixel Y position' },
    { 0x0915, 0x2, 'Screen Y position in pixels' },
    { 0x0917, 0x2, 'Layer 2 X position' },
    { 0x0919, 0x2, 'Layer 2 Y position' },
    --[[
    { 0x091B, 0x2, 'BG2 scroll percent to screen scroll (0 = 100, 1 = ?) (1 byte for X, 1 byte for Y)' },
    { 0x091D, 0x2, 'BG1 X scroll offset due to room transitions (Translates between screen scroll and BG1 scroll)' },
    { 0x091F, 0x2, 'BG1 Y scroll offset due to room transitions (Translates between screen scroll and BG1 scroll)' },
    { 0x0921, 0x2, 'BG2 X offset' },
    { 0x0923, 0x2, 'BG2 Y offset' },
    { 0x0925, 0x2, 'How many times the screen has scrolled? Stops at 40.' },
    { 0x0927, 0x2, 'X offset of room entrance for room transition (multiple of 100, screens)' },
    { 0x0929, 0x2, 'Y offset of room entrance for room transition (multiple of 100, screens. Adjusted by 20 when moving up)' },
    { 0x092B, 0x2, 'Movement speed for room transitions (subpixels per frame of room transition movement)' },
    { 0x092D, 0x2, 'Movement speed for room transitions (pixels per frame of room transition movement)' },
    --]]
    { 0x093F, 0x2, 'Ceres escape flag' },
    { 0x09A2, 0x2, 'Equipped Items' },
    { 0x09A4, 0x2, 'Collected Items' },
    { 0x09A6, 0x4, 'Beams' },
    { 0x09C0, 0x2, 'Manual/Auto reserve tank' },
    { 0x09C2, 0x2, 'Health' },
    { 0x09C4, 0x2, 'Max health' },
    { 0x09C6, 0x2, 'Missiles' },
    { 0x09C8, 0x2, 'Max missiles' },
    { 0x09CA, 0x2, 'Supers' },
    { 0x09CC, 0x2, 'Max supers' },
    { 0x09CE, 0x2, 'Pbs' },
    { 0x09D0, 0x2, 'Max pbs' },
    { 0x09D2, 0x2, 'Currently selected item' },
    { 0x09D4, 0x2, 'Max reserves' },
    { 0x09D6, 0x2, 'Reserves' },
    -- { 0x0A04, 0x2, 'Auto-cancel item' },
    { 0x0A1C, 0x2, 'Samus position/state' },
    { 0x0A1E, 0x2, 'More position/state' },
    { 0x0A68, 0x2, 'Flash suit' },
    { 0x0A76, 0x2, 'Hyper beam' },
    { 0x0AF6, 0x2, 'Samus X' },
    { 0x0AF8, 0x2, 'Samus subpixel X' },
    { 0x0AFA, 0x2, 'Samus Y' },
    { 0x0AFC, 0x2, 'Samus subpixel Y' },
    { 0x0B3F, 0x2, 'Blue suit' },
    -- { 0xD7C0, 0x60, 'SRAM copy' },
    -- { 0xD820, 0x100, 'Events, Items, Doors' },
    { 0xD820, 0x04, 'Events' },
    { 0xD828, 0x08, 'Bosses' },
    { 0xD870, 0x14, 'Items' },
    { 0xD8B0, 0x16, 'Doors' },
    { 0xD908, 0x06, 'Map Stations' },
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
    ["zfackpdr"] = {
    	{ ["name"] = "Bombs", ["steps"] = {} },
    	{ ["name"] = "Varia and Supers", ["steps"] = {} },
    	{ ["name"] = "Wave and Ice", ["steps"] = {} },
    	{ ["name"] = "Power Bombs", ["steps"] = {} },
    	{ ["name"] = "Chozo Orbs", ["steps"] = {} },
    	{ ["name"] = "Speed Booster", ["steps"] = {} },
    	{ ["name"] = "Kraid and Grapple", ["steps"] = {} },
    	{ ["name"] = "Wrecked Ship Entry", ["steps"] = {} },
    	{ ["name"] = "Gravity", ["steps"] = {} },
    	{ ["name"] = "Space Jump", ["steps"] = {} },
    	{ ["name"] = "Maridia Escape", ["steps"] = {} },
    	{ ["name"] = "Lower Norfair", ["steps"] = {} },
    	{ ["name"] = "LN Escape", ["steps"] = {} },
    	{ ["name"] = "Tourian", ["steps"] = {} },
    	{ ["name"] = "Mother Brain", ["steps"] = {} },
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
    ["zfackpdr"] =  {
	-- Bombs
		[2595] = { ["segment_no"] = 1, ["name"] = "Ship" },
		[5504] = { ["segment_no"] = 1, ["name"] = "Sleepy Tunnel" },
		[7055] = { ["segment_no"] = 1, ["name"] = "Kihunter Babies" },
		[9202] = { ["segment_no"] = 1, ["name"] = "Climb Down" },
		[11473] = { ["segment_no"] = 1, ["name"] = "Elevator to Morph" },
		[12977] = { ["segment_no"] = 1, ["name"] = "Empty Chozo Down" },
		[14294] = { ["segment_no"] = 1, ["name"] = "Morph" },
		[16025] = { ["segment_no"] = 1, ["name"] = "Morph Escape" },
		[18021] = { ["segment_no"] = 1, ["name"] = "Elevator Bottom" },
		[20801] = { ["segment_no"] = 1, ["name"] = "Pirate Mushrooms" },
		[23951] = { ["segment_no"] = 1, ["name"] = "Kihunter Revival" },
		[29627] = { ["segment_no"] = 1, ["name"] = "Purple Stairs" },
		[32484] = { ["segment_no"] = 1, ["name"] = "Ship Revisit" },
		[34276] = { ["segment_no"] = 1, ["name"] = "Rip n Dive" },
		[36028] = { ["segment_no"] = 1, ["name"] = "Old MB Tricks" },
		[37790] = { ["segment_no"] = 1, ["name"] = "Bomb Torizo" },
	-- Varia and Supers
		[41102] = { ["segment_no"] = 2, ["name"] = "BT Escape" },
		[43140] = { ["segment_no"] = 2, ["name"] = "Kihunter Revisit" },
		[45257] = { ["segment_no"] = 2, ["name"] = "Purple Stairs Revisit" },
		[48560] = { ["segment_no"] = 2, ["name"] = "Ship Revisit Revisit" },
		[49864] = { ["segment_no"] = 2, ["name"] = "Rip n Dive Revisit" },
		[51797] = { ["segment_no"] = 2, ["name"] = "Gate Scam One" },
		[54319] = { ["segment_no"] = 2, ["name"] = "Cannonball" },
		[56796] = { ["segment_no"] = 2, ["name"] = "Red Brin Elevator" },
		[59495] = { ["segment_no"] = 2, ["name"] = "Varia" },
		[61656] = { ["segment_no"] = 2, ["name"] = "Gate Scam Two" },
		[63729] = { ["segment_no"] = 2, ["name"] = "Lava Pit Death Room" },
		[65775] = { ["segment_no"] = 2, ["name"] = "Bug Pipe Secret" },
		[68737] = { ["segment_no"] = 2, ["name"] = "Bubble Mountain" },
		[69591] = { ["segment_no"] = 2, ["name"] = "Early Supers" },
	-- Wave and Ice
		[73029] = { ["segment_no"] = 3, ["name"] = "Bubbly Troubly " },
		[77423] = { ["segment_no"] = 3, ["name"] = "Hopper Statue Room" },
		[78344] = { ["segment_no"] = 3, ["name"] = "Gate Scam Three" },
		[81274] = { ["segment_no"] = 3, ["name"] = "Bubble Lava Room" },
		[85640] = { ["segment_no"] = 3, ["name"] = "Freeze Booger Room" },
		[88724] = { ["segment_no"] = 3, ["name"] = "Wave Bugs Down" },
		[93226] = { ["segment_no"] = 3, ["name"] = "Wave Escape" },
		[95446] = { ["segment_no"] = 3, ["name"] = "Bubble Lava Room Revisit" },
		[97906] = { ["segment_no"] = 3, ["name"] = "Spiky Nova Room" },
		[100336] = { ["segment_no"] = 3, ["name"] = "Rising Lava Platforms" },
		[103075] = { ["segment_no"] = 3, ["name"] = "Ice Pirate Tower" },
		[105644] = { ["segment_no"] = 3, ["name"] = "Ice Escape" },
	-- Power Bombs
		[109633] = { ["segment_no"] = 4, ["name"] = "Boot Bug Bonanza" },
		[114759] = { ["segment_no"] = 4, ["name"] = "Norfair Lobby" },
		[117910] = { ["segment_no"] = 4, ["name"] = "Map Tower Up" },
		[120396] = { ["segment_no"] = 4, ["name"] = "Cac Attack Revisit" },
		[122239] = { ["segment_no"] = 4, ["name"] = "Ceiling Missiles" },
		[125588] = { ["segment_no"] = 4, ["name"] = "Gate Scam Four" },
		[127138] = { ["segment_no"] = 4, ["name"] = "Face Climb" },
		[128755] = { ["segment_no"] = 4, ["name"] = "Hidden Hoppers" },
		[131305] = { ["segment_no"] = 4, ["name"] = "Spiky Platform Tower" },
		[133185] = { ["segment_no"] = 4, ["name"] = "Waveless Softlock" },
		[140227] = { ["segment_no"] = 4, ["name"] = "Croc" },
		[156276] = { ["segment_no"] = 4, ["name"] = "Power Bombs" },
	-- Chozo Orbs
		[158530] = { ["segment_no"] = 5, ["name"] = "Lava Death Revisit" },
		[161598] = { ["segment_no"] = 5, ["name"] = "Red Tower" },
		[163373] = { ["segment_no"] = 5, ["name"] = "Jungle Boost" },
		[165175] = { ["segment_no"] = 5, ["name"] = "Green Tunnel Tower" },
		[166587] = { ["segment_no"] = 5, ["name"] = "Charge Beam" },
		[170070] = { ["segment_no"] = 5, ["name"] = "Pink Elevator" },
		[171987] = { ["segment_no"] = 5, ["name"] = "Noob Bridge" },
		[174861] = { ["segment_no"] = 5, ["name"] = "Save Station" },
		[177741] = { ["segment_no"] = 5, ["name"] = "Pain Lake" },
		[183506] = { ["segment_no"] = 5, ["name"] = "Chozo Orbs" },
	-- Speed Booster
		[186725] = { ["segment_no"] = 6, ["name"] = "Tunnel Lake" },
		[189013] = { ["segment_no"] = 6, ["name"] = "Mini Kraid Hall" },
		[194114] = { ["segment_no"] = 6, ["name"] = "Hopper Madness" },
		[197465] = { ["segment_no"] = 6, ["name"] = "Enter Maridia" },
		[201519] = { ["segment_no"] = 6, ["name"] = "Sand Tower Down" },
		[203829] = { ["segment_no"] = 6, ["name"] = "Sand Hall" },
		[206630] = { ["segment_no"] = 6, ["name"] = "Platform Climb" },
		[210187] = { ["segment_no"] = 6, ["name"] = "Speed Escape" },
		[216032] = { ["segment_no"] = 6, ["name"] = "Sand Tower Up" },
		[218999] = { ["segment_no"] = 6, ["name"] = "Shaktool" },
	-- Kraid and Grapple
		[226894] = { ["segment_no"] = 7, ["name"] = "Kraid's Lair" },
		[230598] = { ["segment_no"] = 7, ["name"] = "Hopper Madness Two" },
		[233075] = { ["segment_no"] = 7, ["name"] = "Spazer" },
		[237998] = { ["segment_no"] = 7, ["name"] = "Spike Tunnel" },
		[245165] = { ["segment_no"] = 7, ["name"] = "Kraid Entrance " },
		[246797] = { ["segment_no"] = 7, ["name"] = "Kraid" },
		[252840] = { ["segment_no"] = 7, ["name"] = "Kraid Escape" },
		[258547] = { ["segment_no"] = 7, ["name"] = "Spazer Revisit" },
		[261551] = { ["segment_no"] = 7, ["name"] = "More Hopper Pain" },
		[265519] = { ["segment_no"] = 7, ["name"] = "Grapple Bugs" },
		[269070] = { ["segment_no"] = 7, ["name"] = "Grapple Lake" },
	-- Wrecked Ship Entry
		[270661] = { ["segment_no"] = 8, ["name"] = "Kihunter Climb" },
		[275379] = { ["segment_no"] = 8, ["name"] = "Red Tower Climb" },
		[279068] = { ["segment_no"] = 8, ["name"] = "Red Brin Escape" },
		[281706] = { ["segment_no"] = 8, ["name"] = "Crateria Grapple Climb" },
		[283558] = { ["segment_no"] = 8, ["name"] = "Ship Entrance Lake" },
		[292937] = { ["segment_no"] = 8, ["name"] = "Enter Ship" },
		[301159] = { ["segment_no"] = 8, ["name"] = "Spiky Tower Climb" },
		[304625] = { ["segment_no"] = 8, ["name"] = "Platforms n Bots" },
		[308001] = { ["segment_no"] = 8, ["name"] = "Antenna Climb" },
		[312255] = { ["segment_no"] = 8, ["name"] = "Phantoon" },
	-- Gravity
		[319360] = { ["segment_no"] = 9, ["name"] = "Phantoon Escape" },
		[321112] = { ["segment_no"] = 9, ["name"] = "Empty Hand" },
		[322944] = { ["segment_no"] = 9, ["name"] = "Lake Shortcut Supers" },
		[325421] = { ["segment_no"] = 9, ["name"] = "Grapple Lake" },
		[329935] = { ["segment_no"] = 9, ["name"] = "Robot Boxing" },
		[335805] = { ["segment_no"] = 9, ["name"] = "Gravity" },
		[337696] = { ["segment_no"] = 9, ["name"] = "Red Brin Revisit" },
		[340745] = { ["segment_no"] = 9, ["name"] = "Cac Hallway" },
		[344354] = { ["segment_no"] = 9, ["name"] = "Red Tower Down Again" },
		[346215] = { ["segment_no"] = 9, ["name"] = "Kihunter Club" },
		[349007] = { ["segment_no"] = 9, ["name"] = "Kraid Tower Revisit" },
		[350560] = { ["segment_no"] = 9, ["name"] = "Hopper Madness Three" },
	-- Space Jump
		[351713] = { ["segment_no"] = 10, ["name"] = "Maridia Reentry" },
		[353694] = { ["segment_no"] = 10, ["name"] = "Crumble Spark Setup" },
		[357702] = { ["segment_no"] = 10, ["name"] = "Hidden Fish Tunnel" },
		[358660] = { ["segment_no"] = 10, ["name"] = "Crumble Gap Scam" },
		[361355] = { ["segment_no"] = 10, ["name"] = "Toilet Up" },
		[363776] = { ["segment_no"] = 10, ["name"] = "Fortress" },
		[368849] = { ["segment_no"] = 10, ["name"] = "Toilet Down" },
		[371430] = { ["segment_no"] = 10, ["name"] = "Mocktroid Sand Hall" },
		[376414] = { ["segment_no"] = 10, ["name"] = "Botwoon" },
		[384073] = { ["segment_no"] = 10, ["name"] = "Tube Maze" },
		[388360] = { ["segment_no"] = 10, ["name"] = "Gate Scam Five" },
		[392229] = { ["segment_no"] = 10, ["name"] = "Draygon" },
	-- Maridia Escape
		[411063] = { ["segment_no"] = 11, ["name"] = "Draygon Escape" },
		[415257] = { ["segment_no"] = 11, ["name"] = "Spikey Chozo" },
		[417084] = { ["segment_no"] = 11, ["name"] = "Grassy Tower" },
		[419266] = { ["segment_no"] = 11, ["name"] = "Plasma" },
		[426495] = { ["segment_no"] = 11, ["name"] = "Toilet Down" },
		[428710] = { ["segment_no"] = 11, ["name"] = "Hot Air Baloons" },
		[431229] = { ["segment_no"] = 11, ["name"] = "Crab Hall" },
		[434069] = { ["segment_no"] = 11, ["name"] = "Shaktool Revisit" },
		[436000] = { ["segment_no"] = 11, ["name"] = "Brinstar Reentry" },
		[438844] = { ["segment_no"] = 11, ["name"] = "Grapple Lake" },
		[442752] = { ["segment_no"] = 11, ["name"] = "Red Tower Passthrough" },
		[444213] = { ["segment_no"] = 11, ["name"] = "Enter Norfair" },
		[447881] = { ["segment_no"] = 11, ["name"] = "Lava Dive" },
	-- Lower Norfair
		[451371] = { ["segment_no"] = 12, ["name"] = "LN Main Hall" },
		[456707] = { ["segment_no"] = 12, ["name"] = "Bubble Hopper Madness" },
		[462565] = { ["segment_no"] = 12, ["name"] = "Rising Kihunters" },
		[466529] = { ["segment_no"] = 12, ["name"] = "Ball Maze" },
		[474092] = { ["segment_no"] = 12, ["name"] = "Dragon Ruins" },
		[480100] = { ["segment_no"] = 12, ["name"] = "Monkey Bars" },
		[484392] = { ["segment_no"] = 12, ["name"] = "Crumble Lobby" },
		[487573] = { ["segment_no"] = 12, ["name"] = "Metal Ninja Pirates" },
		[489848] = { ["segment_no"] = 12, ["name"] = "Ridley Entrance" },
		[492392] = { ["segment_no"] = 12, ["name"] = "Ridley" },
	-- LN Escape
		[499309] = { ["segment_no"] = 13, ["name"] = "Ridley Escape" },
		[503964] = { ["segment_no"] = 13, ["name"] = "Crumble Lobby Revisit" },
		[507732] = { ["segment_no"] = 13, ["name"] = "LN Main Hall Revisit" },
		[512430] = { ["segment_no"] = 13, ["name"] = "Lava Dive Revisit" },
		[515105] = { ["segment_no"] = 13, ["name"] = "Norfair Lobby Revisit" },
		[518363] = { ["segment_no"] = 13, ["name"] = "Red Tower Revisit" },
		[520084] = { ["segment_no"] = 13, ["name"] = "Red Brin Elevator" },
		[521687] = { ["segment_no"] = 13, ["name"] = "Canonball Revisit" },
		[525066] = { ["segment_no"] = 13, ["name"] = "Old MB Revisit" },
		[526518] = { ["segment_no"] = 13, ["name"] = "G4" },
	-- Tourian
		[532079] = { ["segment_no"] = 14, ["name"] = "Enter Tourian" },
		[536333] = { ["segment_no"] = 14, ["name"] = "Acid Spark" },
		[538334] = { ["segment_no"] = 14, ["name"] = "Pirate Debocle " },
		[540833] = { ["segment_no"] = 14, ["name"] = "False Lava" },
		[542136] = { ["segment_no"] = 14, ["name"] = "Generator" },
		[547608] = { ["segment_no"] = 14, ["name"] = "Enter Night" },
		[551143] = { ["segment_no"] = 14, ["name"] = "First Metroid" },
		[552485] = { ["segment_no"] = 14, ["name"] = "Metroid Platforms" },
		[560451] = { ["segment_no"] = 14, ["name"] = "Metroid Platforms Loop" },
		[567283] = { ["segment_no"] = 14, ["name"] = "Metroid Hall and Tower" },
		[571420] = { ["segment_no"] = 14, ["name"] = "Metroid Toilet" },
	-- Mother Brain
		[576760] = { ["segment_no"] = 15, ["name"] = "Baby Skip" },
		[582456] = { ["segment_no"] = 15, ["name"] = "Sandy Elevator" },
		[584059] = { ["segment_no"] = 15, ["name"] = "Ball Maze" },
		[588346] = { ["segment_no"] = 15, ["name"] = "Mother Brain" },
		[590975] = { ["segment_no"] = 15, ["name"] = "Mother Brain 2" },
		[599555] = { ["segment_no"] = 15, ["name"] = "Mother Brain 3" },
		[602248] = { ["segment_no"] = 15, ["name"] = "Escape" },
		[604960] = { ["segment_no"] = 15, ["name"] = "Ball Maze Revisit" },
		[607629] = { ["segment_no"] = 15, ["name"] = "Tourian Elevator Spark" },
		[611000] = { ["segment_no"] = 15, ["name"] = "Pirate Frenzy" },
		[613520] = { ["segment_no"] = 15, ["name"] = "Purple Stairs Revisit" },
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

            preset_output = preset_output ..  "    dw " ..  tohex(addr - 0x7E0000, 4)
            -- preset_output = preset_output ..  "    dl " ..  tohex(addr, 6) .. " : "
            -- preset_output = preset_output ..  "db " ..  tohex(size, 2) .. " : "
            -- preset_output = preset_output .. (size == 1 and "db " or "dw ")
            preset_output = preset_output .. (size == 1 and ", $??" or ", $")
            preset_output = preset_output .. tohex(val, size == 1 and 2 or 4)
            preset_output = preset_output .. "  ; " .. annotate_address(addr, val) .. "\n"
        end
    end

    preset_output = preset_output .. "    dw #$FFFF\n"
    -- preset_output = preset_output .. ".after\n"
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
