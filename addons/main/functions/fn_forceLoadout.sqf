/*
 * Re-applies ZEN pylon loadouts with forced = true, so incompatible magazines are accepted.
 *
 * ZEN raises "zen_pylons_setLoadout" on the machine where the aircraft is local and applies
 * the loadout with forced = false. This handler is registered after ZEN's, so it runs right
 * after it on the same machine. Runs on every machine (postInit), including the server.
 *
 * Known limitation: when a previously forced weapon is replaced, the old weapon can stay
 * in the weapon list with no ammo (ZEN only removes native pylon weapons). Harmless.
 */

["zen_pylons_setLoadout", {
    params ["_aircraft", "_pylonLoadout"];

    {
        _x params ["_magazine", "_turretPath"];
        _aircraft setPylonLoadout [_forEachIndex + 1, _magazine, true, _turretPath];
    } forEach _pylonLoadout;
}] call CBA_fnc_addEventHandler;
