# Super Metroid Practice Hack

This page hosts the source material for the Super Metroid Practice Hack. It is intended for users that wish to contribute to the project, customize their own Practice Hacks, adapt it for SM romhacks, or just to see how it works. Visit https://smpractice.speedga.me for details on patching your SM rom with the latest version of InfoHUD.

## Building IPS Patches:

1. Download and install Python 3+ from https://python.org. Windows users will need to set the PATH environmental variable to point to their Python installation folder.
2. Run build.bat to create IPS patch files.
3. Locate the patch files in the \build\ folder.

## Patching Your ROM:

1. Rename your unheadered SM rom to `sm_orig.sfc` and place it in the \build\ folder.
2. (Optional) Edit build_fast.bat to enable "DFEATURES" such as SD2SNES savestates
3. Run build_fast.bat to generate a patched practice rom in \build\ named `FastBuildTest.sfc`.

## Which rom should I use?

The build script will create two IPS patch files for the practice hack. The patch that features "Savestates" in the filename will have the built-in savestate feature enabled. This is only intended for use with the SD2SNES cartridge and will likely cause crashes if used with Everdrives and most emulators (including Virtual Console). The Super NT is compatible, although it may require a firmware update. You will need an IPS patcher utility, such as Lunar IPS or Floating IPS, to apply the patch to your vanilla SM rom.
