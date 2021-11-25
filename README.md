# Super Metroid Practice Hack

This page hosts the source material for the Super Metroid Practice Hack, adapted to work with this romhack. You should know that the person adapting this work has not played this romhack outside of basic testing. Some features may not be updated from their vanilla counterparts. If you have suggestions, requests, or bugs to report, please contact InsaneFirebat on Discord or open an issue here on GitHub.

## Getting Started:

1. Download and install Python 3 from https://python.org. Windows users will need to set the PATH environmental variable to point to their Python installation folder.
2. Run build.bat to create IPS patch files.
3. Locate the patch files in \build\.

## Which rom should I use?

The build script will create two IPS patch files for the practice hack. The patch that features "sd2snes" in the filename will have the built-in savestate feature enabled. This is only intended for use with the SD2SNES cartridge and will likely cause crashes if used with Everdrives and most emulators (including Virtual Console). The Super NT is compatible, although it may require a firmware update. You will need an IPS patcher utility, such as Lunar IPS or Floating IPS, to apply the patch to your vanilla SM rom.