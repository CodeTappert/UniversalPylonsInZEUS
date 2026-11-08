# Universal Pylons (Zeus & Eden)

Put **any pylon weapon on any pylon of any aircraft**, right in the normal pylon menus of **Zeus** and the **Eden Editor**.

In Zeus it extends the pylon editor of [Zeus Enhanced (ZEN)](https://steamcommunity.com/sharedfiles/filedetails/?id=1779063631); in Eden it extends the aircraft's Pylons attributes. No extra module, no extra dialog: open the pylon menu as usual and every weapon is there.

## Features

- **Every pylon weapon in the game** is listed for every pylon, including weapons from other mods.
- **Native weapons stay on top**; all other weapons are listed below them in **orange**.
- **Forced loadouts**: on OK the loadout is forced onto the aircraft, so non-native weapons stick.
- **Zeus**: works with presets, mirroring and the pilot/gunner turret buttons of ZEN's editor.
- **Eden**: forced weapons are saved with the mission and applied in the editor and at mission start.
- Multiplayer-ready: the loadout is applied on whichever machine owns the aircraft.

## Usage

**Zeus:** double-click an aircraft with pylons (or right-click → Pylons), pick any weapon for each pylon, click OK.

**Eden Editor:** double-click an aircraft with pylons, expand the **Pylons** category, pick any weapon for each pylon, click OK. The weapons are saved with the mission.

Orange entries are non-native weapons.

## Requirements

- [CBA_A3](https://steamcommunity.com/sharedfiles/filedetails/?id=450814997)
- [Zeus Enhanced](https://steamcommunity.com/sharedfiles/filedetails/?id=1779063631)

In multiplayer, load the mod on the **server and all clients**. The mod is signed; the key is in the mod's keys folder.

## Known limitations

- Weapons on pylons they were not designed for may look misplaced on the model. That's the engine.
- When a forced weapon is later replaced, the old weapon may stay in the weapon list with no ammo. Harmless.
- Missions that use Eden forced weapons need the mod loaded; without it, those pylons fall back to the vanilla loadout.

## Source & issues

Open source (MIT) on [GitHub](https://github.com/CodeTappert/UniversalPylonsInZEUS). Bug reports and ideas welcome there.

This project was written with the help of AI coding assistants. All changes are reviewed and tested by the maintainer.
