/*
 * Adds every pylon magazine in the game to each pylon combo box of ZEN's pylon editor.
 * If a pylon currently holds a forced (incompatible) magazine, it gets selected, since
 * ZEN could only select it among the compatible ones.
 *
 * Arguments:
 * 0: ZEN pylon editor display <DISPLAY>
 */

params ["_display"];

if (isNull _display) exitWith {};

private _aircraft = _display getVariable ["zen_pylons_aircraft", objNull];
private _currentMagazines = getPylonMagazines _aircraft;

{
    [_x select 0, _currentMagazines param [_forEachIndex, ""]] call upz_fnc_extendCombo;
} forEach (_display getVariable ["zen_pylons_controls", []]);
