/*
 * Returns the pylon combo boxes of Eden's vanilla pylon attribute, in pylon order.
 *
 * The engine creates them (class "LoadOutTemplateBox", idc 20500 + pylon index) inside the
 * "PylonControlsGroup" (idc 2666), but only once the "Pylons" category is expanded.
 *
 * Arguments:
 * 0: Display of the attributes window <DISPLAY>
 *
 * Return Value:
 * Pylon combo boxes, empty if not created yet <ARRAY of CONTROLs>
 */

params ["_display"];

private _combos = (allControls _display) select { ctrlClassName _x == "LoadOutTemplateBox" };
[_combos, [], { ctrlIDC _x }] call BIS_fnc_sortBy
