/*
 * Adds every pylon magazine in the game to each pylon combo box of ZEN's pylon editor.
 *
 * ZEN's compatible magazines stay on top. The extra ones are appended below in orange.
 * If a pylon currently holds a forced (incompatible) magazine, it gets selected, since
 * ZEN could only select it among the compatible ones.
 *
 * Arguments:
 * 0: ZEN pylon editor display <DISPLAY>
 */

params ["_display"];

if (isNull _display) exitWith {};

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

private _aircraft = _display getVariable ["zen_pylons_aircraft", objNull];
private _currentMagazines = getPylonMagazines _aircraft;

{
    private _ctrlCombo = _x select 0;
    private _currentMagazine = _currentMagazines param [_forEachIndex, ""];

    private _listedMagazines = [];
    for "_i" from 0 to (lbSize _ctrlCombo - 1) do {
        _listedMagazines pushBack (_ctrlCombo lbData _i);
    };

    {
        _x params ["_name", "_description", "_magazine"];

        if !(_magazine in _listedMagazines) then {
            private _index = _ctrlCombo lbAdd _name;
            _ctrlCombo lbSetData [_index, _magazine];
            _ctrlCombo lbSetTooltip [_index, format ["%1\n[not native: %2]", _description, _magazine]];
            _ctrlCombo lbSetColor [_index, [1, 0.6, 0.2, 1]];

            if (_magazine == _currentMagazine) then {
                _ctrlCombo lbSetCurSel _index;
            };
        };
    } forEach upz_allPylonMagazines;
} forEach (_display getVariable ["zen_pylons_controls", []]);
