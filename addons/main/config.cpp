class CfgPatches {
    class upz_main {
        name = "Universal Pylons in ZEUS";
        author = "[RTLS] DerTapp";
        units[] = {};
        weapons[] = {};
        requiredVersion = 2.0;
        requiredAddons[] = {"zen_pylons"};
    };
};

class CfgFunctions {
    class upz {
        class main {
            file = "\z\upz\addons\main\functions";
            class forceLoadout { postInit = 1; };
            class addAllMagazines {};
        };
    };
};

// ZEN's Zeus pylon editor dialog.
// Keep ZEN's own onLoad, then add every pylon magazine once ZEN has filled the combo boxes (next frame).
class zen_pylons_display {
    onLoad = "uiNamespace setVariable ['zen_pylons_display', _this select 0]; [upz_fnc_addAllMagazines, _this] call CBA_fnc_execNextFrame";
};
