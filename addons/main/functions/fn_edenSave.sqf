/*
 * attributeSave of the "upz_forcedPylons" Eden attribute.
 *
 * Saves only the picks the engine can't save itself: the magazines we appended.
 * Native picks are saved as "" and left to the vanilla pylon attribute.
 *
 * Arguments:
 * 0: Attribute control <CONTROL>
 *
 * Return Value:
 * str of [magazine or "" per pylon], or "" if nothing is forced <STRING>
 */

params ["_ctrl"];

private _forced = ([ctrlParent _ctrl] call upz_fnc_edenPylonCombos) apply {
    private _index = lbCurSel _x;
    [_x lbData _index, ""] select (_index < (_x getVariable ["upz_nativeCount", 1e9]))
};

["", str _forced] select (_forced findIf {_x != ""} >= 0)
