# Universal Pylons in ZEUS

An Arma 3 mod that lets a Zeus put **any pylon weapon on any pylon of any aircraft**, right in the normal Zeus pylon menu.

It extends the pylon editor from [Zeus Enhanced (ZEN)](https://steamcommunity.com/sharedfiles/filedetails/?id=1779063631):

- Every pylon weapon in the game is listed for every pylon, including weapons from other mods.
  Weapons the pylon supports natively stay at the top; all others are listed below them in **orange**.
- On **OK**, the loadout is forced onto the aircraft, so non-native weapons stick.

## Requirements

- [CBA_A3](https://steamcommunity.com/sharedfiles/filedetails/?id=450814997)
- [Zeus Enhanced](https://steamcommunity.com/sharedfiles/filedetails/?id=1779063631)

In multiplayer, the mod must be loaded on the **server and all clients**: the loadout is applied on whichever machine owns the aircraft.

## Usage

1. Open Zeus and double-click an aircraft with pylons (or right-click → Pylons).
2. Pick any weapon for each pylon. Orange entries are non-native weapons.
3. Click **OK**.

## Known limitations

- Weapons on pylons they were not designed for may look misplaced on the model. That's the engine.
- When a forced weapon is later replaced, the old weapon may stay in the weapon list with no ammo. Harmless.
- Only the Zeus pylon menu is extended, not the Eden Editor.

## How it works

| File | Purpose |
| --- | --- |
| [`addons/main/config.cpp`](addons/main/config.cpp) | Registers the functions and hooks the `onLoad` of ZEN's pylon dialog (`zen_pylons_display`). |
| [`fn_addAllMagazines.sqf`](addons/main/functions/fn_addAllMagazines.sqf) | Runs one frame after the dialog opens and appends all pylon magazines to each pylon combo box. |
| [`fn_forceLoadout.sqf`](addons/main/functions/fn_forceLoadout.sqf) | Listens to ZEN's `zen_pylons_setLoadout` event and re-applies the loadout with `setPylonLoadout` forced. |

## Building

The mod is built with [HEMTT](https://hemtt.dev).

```bash
winget install BrettMayson.HEMTT
hemtt build
```

The mod lands in `.hemttout/build`. Load that folder in the Arma 3 Launcher as a local mod (Mods → ⋯ More → Add watched folder / local mod), together with CBA and ZEN.

`hemtt release` builds a signed release into `.hemttout/release` and a zip into `releases/`.

### CI

Every push and pull request is built by GitHub Actions ([`.github/workflows/build.yml`](.github/workflows/build.yml)). The signed mod is attached to the run as the `universal-pylons-in-zeus` artifact.
