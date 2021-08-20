# Redesign: Axeil Edition Practice Hack

This page hosts the source material for the Super Metroid Practice Hack adapted to work with the Redesign: Axeil Edition romhack. This project is still in development, and many features are missing or incomplete.

## Getting Started:

1. Download asar from https://github.com/RPGHacker/asar and place it in the \tools\ folder.
2. Download and install Python 3 from https://python.org. Windows users will need to set the PATH environmental variable to point to their Python installation folder.
3. Run build.bat to create IPS patch files.
4. Locate the patch files in \build\.

## Which rom should I use?

The build script will create two IPS patch files for the practice hack. The patch that features "Savestates" in the filename will have the built-in savestate feature enabled. This is only intended for use with the SD2SNES/FXPAK cartridge and will likely cause crashes if used with Everdrives and most emulators (including Virtual Console). The Super NT is compatible, although it may require a firmware update. Mister clone consoles are not (yet) compatible. You will need an IPS patcher utility, such as Lunar IPS or Floating IPS, to apply the patch to your vanilla SM rom.

## Known Issues:

- Stuck crouching bug after applying 100% equipment
- Equipment options are missing
- Event flags are missing
- Category presets are empty (vanilla PRKD presets as placeholder)
- Presets do not yet support all event/item/door addresses
- Teleports untouched
- "25" HUD graphic overwrote hyphen for message boxes
- "28" is also overwriting something in message boxes (guardian disarmed)
- Pause menu map doesn't scroll and double-toggles hints
- Room strats are mostly unusable due to room ID checks
- No RNG options while rng.asm is commented out
- Moonwalk needs to be removed from Game options (JP text too?)