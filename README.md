# Universal Pylons in ZEUS

An Arma 3 mod that lets a Zeus put **any pylon weapon on any pylon of any aircraft**, right in the normal Zeus pylon menu.

It extends the pylon editor of [Zeus Enhanced (ZEN)](https://steamcommunity.com/sharedfiles/filedetails/?id=1779063631). No extra module, no extra dialog: double-click an aircraft as usual and every weapon is there.

## Features

- **Every pylon weapon in the game** is listed for every pylon, including weapons from other mods.
- **Native weapons stay on top**; all other weapons are listed below them in **orange**, with their class name in the tooltip.
- **Forced loadouts**: on **OK** the loadout is forced onto the aircraft, so non-native weapons stick.
- Works with presets, mirroring and the pilot/gunner turret buttons of ZEN's editor.
- **Multiplayer-ready**: the loadout is applied on whichever machine owns the aircraft.

## Download

Get the latest build from the **[Releases page](https://github.com/CodeTappert/UniversalPylonsInZEUS/releases)**.

Unzip it; it contains the mod folder `@upz`. In the Arma 3 Launcher, go to **Mods → ⋯ More → Add watched folder** (or **Add local mod**) and pick `@upz`.

For servers that verify signatures, copy the `.bikey` from `@upz/keys` into the server's `keys` folder.

## Requirements

- [CBA_A3](https://steamcommunity.com/sharedfiles/filedetails/?id=450814997)
- [Zeus Enhanced](https://steamcommunity.com/sharedfiles/filedetails/?id=1779063631)

In multiplayer, load the mod on the **server and all clients**.

## Usage

1. Open Zeus and double-click an aircraft with pylons (or right-click → Pylons).
2. Pick any weapon for each pylon. Orange entries are non-native weapons.
3. Click **OK**.

## Known limitations

- Weapons on pylons they were not designed for may look misplaced on the model. That's the engine.
- When a forced weapon is later replaced, the old weapon may stay in the weapon list with no ammo. Harmless.
- Only the Zeus pylon menu is extended, not the Eden Editor.

## Build from source

The mod is built with [HEMTT](https://hemtt.dev):

```bash
winget install BrettMayson.HEMTT
hemtt build      # unsigned dev build into .hemttout/build
hemtt release    # signed build into .hemttout/release + zip in releases/
```

Load `.hemttout/build` in the launcher as a local mod, together with CBA and ZEN.

### How it works

| File | Purpose |
| --- | --- |
| [`addons/main/config.cpp`](addons/main/config.cpp) | Registers the functions and hooks the `onLoad` of ZEN's pylon dialog (`zen_pylons_display`). |
| [`fn_addAllMagazines.sqf`](addons/main/functions/fn_addAllMagazines.sqf) | Runs one frame after the dialog opens and appends all pylon magazines to each pylon combo box. |
| [`fn_forceLoadout.sqf`](addons/main/functions/fn_forceLoadout.sqf) | Listens to ZEN's `zen_pylons_setLoadout` event and re-applies the loadout with `setPylonLoadout` forced. |

### CI

[CI](.github/workflows/ci.yml) builds a signed release on every push and pull request (download it from the run's artifacts). A push to `main` publishes a GitHub release `v<version>` if that version isn't released yet.

### Releasing

The version lives in [`.hemtt/project.toml`](.hemtt/project.toml) and is shared by GitHub and the Workshop.

1. On `develop`: bump the version in `.hemtt/project.toml` and add an entry to [`CHANGELOG.md`](CHANGELOG.md).
2. Merge `develop` into `main` → CI publishes the GitHub release.
3. With Steam running, on `main`: `hemtt publish`. It uploads the build, the Workshop description ([`.github/workshop/description.md`](.github/workshop/description.md)) and the changelog entry to the Workshop item in [`meta.cpp`](meta.cpp).

The Workshop preview image is [`.github/workshop/preview.jpg`](.github/workshop/preview.jpg); it can only be changed with Arma 3 Publisher (Arma 3 Tools).

## Contributing

Contributions of all kinds are welcome: bug reports, feature ideas and code.

- **Issues**: open an [issue](https://github.com/CodeTappert/UniversalPylonsInZEUS/issues) for bugs or ideas. Your `.rpt` log (`%LOCALAPPDATA%\Arma 3`) and the aircraft/weapon mods involved make it much easier to help.
- **Pull requests**: please target the **`develop`** branch (not `main`, that's the release branch).
- **Setup**: install HEMTT, then `hemtt build`. CI must be green.
- **Not sure?** Open a draft PR or an issue and ask, happy to help.

## License

MIT, see [LICENSE](LICENSE).

## AI usage

This project was written with the help of AI coding assistants. All changes are reviewed and tested by the maintainer.
