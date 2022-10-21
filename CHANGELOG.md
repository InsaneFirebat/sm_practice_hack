
## Changelog since v2.2.7

* [2.5.0.14] Attempt to prevent crashes from savestates on unsupported platforms
* [2.5.0.14] Fixed broken drops at Golden Torizo
* [2.5.0.13] Made the segment timer reset after a preset door optional
* [2.5.0.12] Reload HUD graphics after loading state in case minimap setting changed
* [2.5.0.11] Optimizations for Ridley AI room strat by Yuriks
* [2.5.0.10] Added Dayne menu color profile
* [2.5.0.9]  Continue drawing Zebes escape timer after reaching the ship
* [2.5.0.8]  Update timers before baby skip when the screen locks in place
* [2.5.0.7]  Fixed presets that load into a stuck shinespark
* [2.5.0.7]  Adjusted health/ammo for Green Brin Elev preset in Hundo (late)
* [2.5.0.7]  Moved Savestate settings to a separate menu
* [2.5.0.6]  Fixed missing Ocean missiles in GT Max% presets
* [2.5.0.5]  Added option to automatically savestate in the middle of the door transition
* [2.5.0.4]  Fix Hoizontal Speed Door HUD mode
* [2.5.0.3]  Added optional sound effect to reward for successful InfoHUD modes
* [2.5.0.2]  Added Layrus menu color profile
* [2.5.0.1]  Fixed teleporting to a save station from an elevator ride
* [2.5.0]    Redraw Samus when applying pause on menu exit
* [2.4.2.35] Added generic BRB menu for streamers
* [2.4.2.34] Allow non-SRAM backed settings to persist after loadstate
* [2.4.2.34] Allow Loud Pants to be used independently by NobodyNada
* [2.4.2.33] Fixed graphics/crashes when loading a tinystate from one boss fight to another
* [2.4.2.32] Fixed controller shortcuts after loading a savestate by idlechild
* [2.4.2.32] Fixed Spazer+Plasma protection running twice
* [2.4.2.31] Three way toggles for equipment and beams
* [2.4.2.30] Fixed missing InfoHUD menu
* [2.4.2.29] Added options to control slowdown mode from the menu
* [2.4.2.29] Added an option to build the practice hack with a 100% vanilla HUD
* [2.4.2.28] Added Arm Pump Trained to InfoHUD Modes by idlechild
* [2.4.2.27] Fixed black screen after changing menu font
* [2.4.2.26] Fixed fast load logic with TinyStates
* [2.4.2.25] Fixed game time being reset after Ceres
* [2.4.2.24] Fixed extra etank in KPDR 22% presets
* [2.4.2.23] Proper fix for corrupted TinyState backgrounds by NobodyNada
* [2.4.2.22] Added option to run an extra HUD mode upon touching doors
* [2.4.2.22] Fixed broken Current Energy menu
* [2.4.2.22] Workaround for rooms with corrupted backgrounds using TinyStates
* [2.4.2.21] Ridley AI room strat falls back on enemy HP or grab attempts
* [2.4.2.20] Added a room strat to display current Ridley's AI routine
* [2.4.2.19] Automatically display the remaining spark timer when shinespark crashes
* [2.4.2.19] Optimized timers when updated outside of door transitions
* [2.4.2.18] Fixed practice hack memory not being preserved with TinyStates
* [2.4.2.17] Options to reload the last preset or load a random preset from the menu
* [2.4.2.16] Fixed graphics for TinyStates saved in the pause menu
* [2.4.2.16] Improve menu color changes on console
* [2.4.2.16] Fixed some crashes from saving/loading invalid savestates
* [2.4.2.15] Fixed Kraid graphics when using experimental TinyStates by NobodyNada
* [2.4.2.14] Added SNES BGR format as an addition method of editing colors
* [2.4.2.13] Fixed items left equipped after being toggle off in the menu
* [2.4.2.13] Fixed graphics/palettes after changing beams in the menu
* [2.4.2.13] Added an option for faster Nintendo logo at boot by NobodyNada
* [2.4.2.13] Added a toggle for liquid physics in the current room by NobodyNada
* [2.4.2.12] Added a menu option to change reserve modes
* [2.4.2.11] Fixed compatibility with cout's timer tracking tool
* [2.4.2.10] Added option to clear map tiles on preset load
* [2.4.2.10] Updated MM2 menu palette profile
* [2.4.2.9]  Added a room strat for Pit Room right door in True Completion
* [2.4.2.8]  Added Ridley's tail to special boss hitbox viewer
* [2.4.2.8]  Fixed crash when using extended spritemap hitbox viewer with Ceres steam
* [2.4.2.8]  Added simple Zeb Skip trainer to room strats
* [2.4.2.7]  Fixed BG3 reloading and BG2 mirroring by total
* [2.4.2.6]  Speed up tiny state loadtimes by total
* [2.4.2.5]  Experimental "tiny states" build for higher platform compatibility by total
* [2.4.2.4]  Addded option to draw Mother Brain's custom hitboxes
* [2.4.2.4]  Upgrade extended spritemap hitbox viewer to handle more enemies (Ridley, MB)
* [2.4.2.3]  Fixed loading presets into West Ocean room
* [2.4.2.2]  Press L+R+Sl+X at in-game Special Settings menu to reset practice menu shortcut
* [2.4.2.2]  Added option to change the HUD number font (graphics from ALttP practice hack)
* [2.4.2.2]  Added option to change the menu font
* [2.4.2.1]  Fixed acid not lowering far enough in MB2 presets if fast MB is off
* [2.4.2]    Added experimental option to freeze the game on loadstate by idlechild
* [2.4.2]    Fixed decrementing past minimum in menu numfield
* [2.4.1.11] Added an option for easier capture cropping
* [2.4.1.10] Prevent accidental pauses when opening the menu by NobodyNada
* [2.4.1.10] Fixed a rare decompression error with preset loading by P.JBoy and idlechild
* [2.4.1.9]  Don't reset segment timer on room exit with MB presets by idlechild
* [2.4.1.8]  Added Power Bomb damage to Pacifist Mode and Damage Counter
* [2.4.1.8]  Renamed Disable Samus Damage to Pacifist Mode
* [2.4.1.8]  Fixed stack underflow/overflow crash handling and added more palettes
* [2.4.1.7]  Fixed more situations where crash handler didn't draw correctly
* [2.4.1.6]  Additional work on crash handler
* [2.4.1.5]  Fixed crash handler not being visible if crash occurred in a door transition
* [2.4.1.4]  More work on the crash handler we hope you never have to see
* [2.4.1.3]  Added a break handler to properly identify those types of crashes
* [2.4.1.2]  Added a crash handler to display a stackdump in the event of a crash
* [2.4.1.1]  More backend work to free up a lot of menu space
* [2.4.1]    Added option to load preset in order with the Random Preset shortcut by idlechild
* [2.4.0.20] Scroll fixes for Bowling and Pre-Pillars rooms in presets
* [2.4.0.20] More work on vanilla HUD display by idlechild
* [2.4.0.20] Added more early and late game presets to all categories by idlechild
* [2.4.0.19] Backend work to free up more menu space
* [2.4.0.18] Fixed rare crash when opening the pause menu
* [2.4.0.18] Removed bomb blocks blocking Terminator presets by idlechild
* [2.4.0.18] Fixed custom presets in Ceres by idlechild
* [2.4.0.17] Added improved Phantoon RNG menu and added inverted patterns by idlechild
* [2.4.0.16] Added number of frames shot was released to the Charge Timer HUD mode
* [2.4.0.16] More work on Mother Brain presets by idlechild
* [2.4.0.15] Added per-round controls to new Phantoon RNG by NobodyNada
* [2.4.0.14] Added option to skip Kraids suspenseful intro cutscene
* [2.4.0.14] Force menu background on game over screen
* [2.4.0.14] Added option to load presets with enemies
* [2.4.0.14] First pass at allowing vanilla E-tanks to be displayed on the HUD by idlechild
* [2.4.0.14] Added average momentum to Shinetune for stutter feedback by idlechild
* [2.4.0.13] Added "PRESET OFF" option to skip music load with presets but not normal loads by idlechild
* [2.4.0.12] Unlock enemies-killed doors when loading presets
* [2.4.0.11] Always allow sound effects to play while menu is open by idlechild
* [2.4.0.11] Fixed presets that crash on load when certain directions are held
* [2.4.0.10] Fixed PB blocks in the way of Mission Impossible presets
* [2.4.0.10] Fixed and re-enabled scrolling sky backgrounds when loading presets by idlechild
* [2.4.0.9]  Fixed doors that should be open in certain presets
* [2.4.0.8]  Improvements to scrolling sky background when loading presets by idlechild
* [2.4.0.8]  Fixed missing scroll when loading custom presets by idlechild
* [2.4.0.8]  Fixed presets that spawn on an invisible scroll tile
* [2.4.0.7]  Configured more doors in more categories (still more to come)
* [2.4.0.7]  Fixed doors that shouldn't be open in certain presets (more to come)
* [2.4.0.6]  Added Ceres Escape preset to 100% Late Croc presets by idlechild
* [2.4.0.6]  Added Ship landing sequence to presets by idlechild
* [2.4.0.6]  Fixed remaining minor background issues with presets
* [2.4.0.6]  Presets no longer open blue doors that are hidden by camera scrolling by idlechild
* [2.4.0.5]  Fixed several minor bugs when loading presets
* [2.4.0.4]  Presets can open ALL blue doors now by idlechild
* [2.4.0.4]  Fixed dead PRKD preset
* [2.4.0.4]  Fixed long door transitions after collecting an item
* [2.4.0.3]  Added subpixel position to custom presets
* [2.4.0.3]  Option to automatically open "always-blue" doors when loading presets by idlechild
* [2.4.0.2]  Added JRP menu color profile
* [2.4.0.2]  Added pre-decompressed tile data for faster preset loads by idlechild
* [2.4.0.1]  Added a submenu for Phantoon RNG with more precise controls by NobodyNada
* [2.4.0.1]  Added an option to skip Phantoon's intro cutscene by NobodyNada
* [2.4.0.1]  Added a Lag Counter InfoHUD mode to count lag frames in the HUD during gameplay
* [2.4.0]    Added an option to the door transition counter to include the full door time by idlechild
* [2.4.0]    Added pre-decompressed palette data for faster preset loads with option to disable by idlechild
* [2.3.4.12] Added an option to disable damage dealt by Samus (except Power Bombs and grapple)
* [2.3.4.12] Added option to skip the G4 cutscene by idlechild
* [2.3.4.12] More anti-softlock randomizer patches by idlechild
* [2.3.4.12] Yet another music change to stop me from crashing the sound engine by idlechild
* [2.3.4.11] Fix setting Botwoon RNG back to RANDOM
* [2.3.4.11] First round of anti-softlock randomizer patches by idlechild
* [2.3.4.11] New RNG routine for non-gameplay randomness by total
* [2.3.4.10] More music updates to speed up presets and loadstates by idlechild
* [2.3.4.9]  Fixed background and scrolling issues with 100% Late Croc presets
* [2.3.4.8]  Fixed bad room scrolls with custom presets
* [2.3.4.7]  Added many new options for KPDR Early Ice presets by UNHchabo
* [2.3.4.7]  Clear health bomb flag when loading presets
* [2.3.4.7]  Load presets from pre-decompressed room data by idlechild
* [2.3.4.6]  Temp fix for sound glitch when loading from a save file
* [2.3.4.5]  Potentially fixed menu color issues with flash carts
* [2.3.4.5]  Added menus to select commonly used RAM Watch addresses (more to come)
* [2.3.4.4]  Moved some temporary preset data to avoid changing out of bounds tiles
* [2.3.4.3]  Fixed a bug that prevented setting controller shortcuts that included Y
* [2.3.4.2]  Removed some music loading delay to speedup preset loading times by idlechild
* [2.3.4.1]  Added Cutscene options to Game Settings menu by idlechild
* [2.3.4]    Just a version number
* [2.3.3.10] Add current ammo selectors to equipment menu
* [2.3.3.9]  Fixed background color after opening the practice menu while paused
* [2.3.3.9]  Support for custom presets at MB1 and Ceres Escape by idlechild
* [2.3.3.9]  Fixes for loading music after presets and load states by idlechild
* [2.3.3.9]  New options added to the health alarm toggle by idlechild
* [2.3.3.9]  Option to fix bad graphics from misaligned doors from PJBoy and idlechild
* [2.3.3.8]  New menu in Game Options to configure controls
* [2.3.3.7]  Smarter health bomb status icon
* [2.3.3.6]  Changed reserve icons and finalized reserve display
* [2.3.3.5]  Add an option to display reserve energy instead of item%
* [2.3.3.5]  More rooms added to Area Rando setting by idlechild (still WIP)
* [2.3.3.4]  Added a status icon for reserves: icon when set to auto, green when energy is stored
* [2.3.3.4]  Moved Health Alarm toggle to Game Settings and fixed some of its vanilla bugs
* [2.3.3.4]  Added a lag counter to the CPU Usage mode that updates during gameplay
* [2.3.3.4]  Fixed most of the screen wrapping with extended spritemap hitboxes
* [2.3.3.4]  Return of Palette Randomizer with better RNG throughout the menu
* [2.3.3.3]  Allow 8-bit writes with RAM Watch
* [2.3.3.3]  Added Room Layout menu with options to match randomizer patches by idlechild
* [2.3.3.2]  Added option to draw proper hitboxes for Phantoon and Draygon
* [2.3.3.1]  Update presets with new background data
* [2.3.3]    Fixes for background glitches with presets involving scrolling sky by idlechild
* [2.3.2.6]  Added controller shortcut to update the HUD timers during gameplay
* [2.3.2.6]  Added Phantoon flame patterns to RNG Controls by idlechild
* [2.3.2.6]  Added 3-Jump Baby Skip trainer to room strats by idlechild
* [2.3.2.5]  Prevent potential crash from drawing too many hitboxes
* [2.3.2.4]  Fix bad graphics when loading "Springball Maze" presets
* [2.3.2.3]  Improve factory reset with option to preserve custom presets
* [2.3.2.2]  Added options to draw hitboxes on Samus and/or enemy projectiles
* [2.3.2.2]  Added debug option to disable enemy projectiles
* [2.3.2.1]  Added options to reset controller shortcuts and custom sounds to default, or factory reset
* [2.3.2]    Added Snail Clip room strat by idlechild
* [2.3.2]    Check Load State shortcut during item fanfares by idlechild
* [2.3.2]    Preloaded enemy addresses in RAM Watch by idlechild
* [2.3.1.3]  Support menu footers and skip blank menu lines
* [2.3.1.2]  Allow customizing the scroll delay and fast-scroll button
* [2.3.1.2]  Support indexing/offsets with RAM Watch addresses
* [2.3.1.2]  Support fast scrolling on number fields when holding Y
* [2.3.1.1]  Support bank $7F and SRAM in RAM Watch mode
* [2.3.1]    Added options to change suit properties based on randomizer settings
* [2.3.1]    Added option to draw hitboxes on enemies
* [2.3.0.10] Added version number to title screen by idlechild
* [2.3.0.10] Added support for Dachora Room to Elevator CF room strat by idlechild
* [2.3.0.9]  Fixed Ceres mode 7 rooms when loading from presets by idlechild
* [2.3.0.8]  Added sound effects for more menu options
* [2.3.0.8]  Added menu options to set glitched beam combos
* [2.3.0.7]  Changed elevator flags to a simple fix option
* [2.3.0.6]  Replaced E-tank counter with elevator and spikesuit status icons by idlechild
* [2.3.0.5]  Allow loading savestates during door scrolling by idlechild
* [2.3.0.5]  Added flags in Misc for standing and riding elevators by idlechild
* [2.3.0.5]  Changed Baby Slowdown to Slowdown Mode (2 for Baby) by idlechild
* [2.3.0.4]  Option to force Samus into standing pose
* [2.3.0.3]  Door Skip room strat by idlechild
* [2.3.0.2]  Improved Soundtest and Customize Sounds menus
* [2.3.0.2]  Added menu option to kill enemies
* [2.3.0.1]  Further improvements to color selection menus
* [2.3.0]    New menu for "Sprite Features"
* [2.2.8.7]  Reworked color customization menu to be more intuitive
* [2.2.8.6]  Fix item% calculation after using GT Code
* [2.2.8.5]  Removed enemies from presets and increase slots
* [2.2.8.4]  100% Max Completion category presets by mm2nescartridge
* [2.2.8.3]  Fixed more scolling issues with presets in Basement and Aqueduct
* [2.2.8.3]  Added "Business Center Pre-Elev" to PRKD presets
* [2.2.8.2]  Combined normal and No-X PRKD presets
* [2.2.8.2]  Optimizations for controller shortcut checks
* [2.2.8.1]  Allow submenu navigation sound to be customized
* [2.2.8]    Fixed credits
* [2.2.8]    Support SpriteSomething Hitbox skin
* [2.2.7.3]  Hide Grapple and Xray icons when loading GT Code presets
* [2.2.7.2]  Added GT Max% presets for the WR route
* [2.2.7.1]  Equipment options to set current health/reserves
* [2.2.7.1]  Fixed custom presets corrupting existing saves in the next slot
* [2.2.7]    Damage counter tracks shinesparks
