/*
 * Appends every pylon magazine in the game to a pylon combo box (used by Zeus and Eden).
 *
 * Entries already in the box (the natively compatible ones) stay on top. The extra ones are
 * appended below in orange, with the magazine class as lbData. The number of native entries
 * is stored on the control as "upz_nativeCount": every index from there on is an added one.
 *
 * Arguments:
 * 0: Combo box <CONTROL>
 * 1: Magazine to select if it isn't selected yet, "" for none <STRING> (default: "")
 */

params ["_ctrlCombo", ["_selectMagazine", ""]];

// All public magazines that can be mounted on a pylon, sorted by name. Built once per session.
if (isNil "upz_allPylonMagazines") then {
    private _configs = "getText (_x >> 'pylonWeapon') != '' && {getNumber (_x >> 'scope') > 0}" configClasses (configFile >> "CfgMagazines");

    upz_allPylonMagazines = _configs apply {
        private _name = getText (_x >> "displayName");
        if (_name == "") then { _name = configName _x };
        [_name, getText (_x >> "descriptionShort"), configName _x]
    };
    upz_allPylonMagazines sort true;
};

// Native entries, by data and by text (Eden's engine-filled boxes may not set lbData)
private _nativeCount = lbSize _ctrlCombo;
private _listed = [];
for "_i" from 0 to (_nativeCount - 1) do {
    _listed pushBack (_ctrlCombo lbData _i);
    _listed pushBack (_ctrlCombo lbText _i);
};
_ctrlCombo setVariable ["upz_nativeCount", _nativeCount];

{
    _x params ["_name", "_description", "_magazine"];

    if !(_magazine in _listed || {_name in _listed}) then {
        private _index = _ctrlCombo lbAdd _name;
        _ctrlCombo lbSetData [_index, _magazine];
        _ctrlCombo lbSetTooltip [_index, format ["%1\n[not native: %2]", _description, _magazine]];
        _ctrlCombo lbSetColor [_index, [1, 0.6, 0.2, 1]];
    };
} forEach upz_allPylonMagazines;

if (_selectMagazine != "" && {_ctrlCombo lbData lbCurSel _ctrlCombo != _selectMagazine}) then {
    for "_i" from 0 to (lbSize _ctrlCombo - 1) do {
        if (_ctrlCombo lbData _i == _selectMagazine) exitWith { _ctrlCombo lbSetCurSel _i };
    };
};
