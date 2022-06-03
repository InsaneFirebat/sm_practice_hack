local CAT = "cchamber" -- cchamber

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
    ["cchamber"] = { -- {{{
        { ["name"] = "Crateria", ["steps"] = {} },
        { ["name"] = "Brinstar", ["steps"] = {} },
        { ["name"] = "Maridia", ["steps"] = {} },
        { ["name"] = "Norfair", ["steps"] = {} },
        { ["name"] = "Tourian", ["steps"] = {} },
    }, -- }}}
}

local STEPS = {
    ["cchamber"] = {
		-- Crateria
		[2154] = { ["segment_no"] = 1, ["name"] = "Puzzle 1" },
		[3286] = { ["segment_no"] = 1, ["name"] = "Puzzle 2" },
		[7129] = { ["segment_no"] = 1, ["name"] = "Puzzle 3" },
		[12859] = { ["segment_no"] = 1, ["name"] = "Puzzle 4" },
		[16734] = { ["segment_no"] = 1, ["name"] = "Puzzle 5" },
		[17613] = { ["segment_no"] = 1, ["name"] = "Puzzle 5 Gate" },
		[19416] = { ["segment_no"] = 1, ["name"] = "Puzzle 5 Super" },
		[28696] = { ["segment_no"] = 1, ["name"] = "Puzzle 6" },


		-- Brinstar
		[30631] = { ["segment_no"] = 2, ["name"] = "Puzzle 7" },
		[33899] = { ["segment_no"] = 2, ["name"] = "Puzzle 8" },
		[35440] = { ["segment_no"] = 2, ["name"] = "Puzzle 9" },
		[36615] = { ["segment_no"] = 2, ["name"] = "Puzzle A" },

		-- Maridia
		[37944] = { ["segment_no"] = 3, ["name"] = "Puzzle B" },
		[40753] = { ["segment_no"] = 3, ["name"] = "Puzzle C" },
		[43821] = { ["segment_no"] = 3, ["name"] = "Puzzle D" },
		[45219] = { ["segment_no"] = 3, ["name"] = "Puzzle E" },
		[46829] = { ["segment_no"] = 3, ["name"] = "Puzzle F" },
		[48791] = { ["segment_no"] = 3, ["name"] = "Puzzle G" },

		-- Norfair
		[53717] = { ["segment_no"] = 4, ["name"] = "Entry" },
		[54929] = { ["segment_no"] = 4, ["name"] = "Gravity" },
		[55694] = { ["segment_no"] = 4, ["name"] = "Puzzle H" },
		[58234] = { ["segment_no"] = 4, ["name"] = "Springball" },
		[58882] = { ["segment_no"] = 4, ["name"] = "Puzzle I" },
		[62798] = { ["segment_no"] = 4, ["name"] = "MiniKraid" },

		-- Tourian
		[63638] = { ["segment_no"] = 5, ["name"] = "Puzzle J" },
		[65548] = { ["segment_no"] = 5, ["name"] = "Puzzle K" },
		[66256] = { ["segment_no"] = 5, ["name"] = "Puzzle L" },
		[67177] = { ["segment_no"] = 5, ["name"] = "Puzzle M" },
		[68706] = { ["segment_no"] = 5, ["name"] = "Invisible Maze" },
		[70407] = { ["segment_no"] = 5, ["name"] = "Ridley" },
		[72544] = { ["segment_no"] = 5, ["name"] = "Puzzle N" },
		[73570] = { ["segment_no"] = 5, ["name"] = "Puzzle O" },
		[75866] = { ["segment_no"] = 5, ["name"] = "Climb Spark" },
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
