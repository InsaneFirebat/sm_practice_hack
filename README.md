# Ancient Chozo Practice Hack



## How to build IPS files:

1. Download and install Python 3 from https://python.org. Windows users will need to set the PATH environmental variable to point to their Python installation folder.
2. Run `build.bat` to create IPS patch files.
3. Locate the patch files in \build\.

## How to build a pre-patched rom:

1. Place your unheadered Ancient Chozo rom in \build\ and rename it to `Ancient_Chozo.sfc` (your original file will not be modified)
2. Run `build_chozo.bat` to build a newly patched AC practice rom. 
3. Locate the rom in \build\.

## Which rom should I use?

The build script will create two IPS patch files for the practice hack. The patch that features "Savestates" in the filename will have the built-in savestate feature enabled. This is only intended for use with the SD2SNES/FKPAK cartridges and will likely cause crashes if used with Everdrives and most emulators (including Virtual Console). The Super NT is compatible, although it requires the "jailbreak" firmware update. You will need an IPS patcher utility, such as Lunar IPS or Floating IPS, to apply IPS patches to your AC rom.