/*
 * attributeLoad of the "upz_forcedPylons" Eden attribute.
 *
 * Waits until the engine has created its pylon combos (only once the collapsed "Pylons"
 * category is expanded), then adds every pylon magazine to them and selects the forced
 * magazines saved in this attribute.
 * (Scheduled: CBA_fnc_execNextFrame doesn't fire in Eden's attributes window.)
 *
 * Arguments:
 * 0: Attribute control <CONTROL>
 * 1: Saved value: str of [magazine or "" per pylon], or "" <STRING>
 */

params ["_ctrl", "_value"];

private _forced = if (_value == "") then { [] } else { parseSimpleArray _value };

[ctrlParent _ctrl, _forced] spawn {
    params ["_display", "_forced"];

    private _combos = [];
    waitUntil {
        uiSleep 0.1;
        _combos = [_display] call upz_fnc_edenPylonCombos;
        isNull _display || {_combos isNotEqualTo [] && {lbSize (_combos select 0) > 0}}
    };

    {
        [_x, _forced param [_forEachIndex, ""]] call upz_fnc_extendCombo;
    } forEach _combos;
};
