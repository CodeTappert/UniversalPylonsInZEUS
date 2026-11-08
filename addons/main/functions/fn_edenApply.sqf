/*
 * Expression of the "upz_forcedPylons" Eden attribute: forces the saved magazines onto the
 * aircraft, in the editor and at mission start.
 *
 * Scheduled, so it runs after the engine applied the vanilla pylon attribute, and only
 * where the aircraft is local (the server at mission start).
 *
 * Arguments:
 * 0: Aircraft <OBJECT>
 * 1: [magazine or "" per pylon]; "" = leave the pylon as the engine set it <ARRAY>
 */

params ["_aircraft", "_forced"];

[_aircraft, _forced] spawn {
    params ["_aircraft", "_forced"];

    uiSleep 0.1;
    if (isNull _aircraft || {!local _aircraft}) exitWith {};

    {
        _x params ["_index", "", "_turretPath"];

        private _magazine = _forced param [_forEachIndex, ""];
        if (_magazine != "") then {
            _aircraft setPylonLoadout [_index, _magazine, true, _turretPath];
        };
    } forEach getAllPylonsInfo _aircraft;
};
