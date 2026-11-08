class CfgPatches {
    class upz_main {
        name = "Universal Pylons in ZEUS";
        author = "[RTLS] DerTapp";
        units[] = {};
        weapons[] = {};
        requiredVersion = 2.0;
        requiredAddons[] = {"zen_pylons", "A3_3DEN"};
    };
};

class CfgFunctions {
    class upz {
        class main {
            file = "\z\upz\addons\main\functions";
            class extendCombo {};
            // Zeus (ZEN)
            class forceLoadout { postInit = 1; };
            class addAllMagazines {};
            // Eden
            class edenPylonCombos {};
            class edenLoad {};
            class edenSave {};
            class edenApply {};
        };
    };
};

// ZEN's Zeus pylon editor dialog.
// Keep ZEN's own onLoad, then add every pylon magazine once ZEN has filled the combo boxes (next frame).
class zen_pylons_display {
    onLoad = "uiNamespace setVariable ['zen_pylons_display', _this select 0]; [upz_fnc_addAllMagazines, _this] call CBA_fnc_execNextFrame";
};

// Eden: the vanilla "Pylons" attribute is engine-driven and only saves compatible magazines.
// This invisible attribute sits next to it: it extends the engine's combo boxes, saves the
// non-native picks itself and forces them onto the aircraft.
class Cfg3DEN {
    class Attributes {
        class Default;
        class upz_forcedPylons: Default {
            h = 0;
            attributeLoad = "[_this, _value] call upz_fnc_edenLoad";
            attributeSave = "_this call upz_fnc_edenSave";
        };
    };
    class Object {
        class AttributeCategories {
            class PylonsCategory {
                class Attributes {
                    class upz_forcedPylons {
                        property = "upz_forcedPylons";
                        control = "upz_forcedPylons";
                        displayName = "";
                        tooltip = "";
                        typeName = "STRING";
                        defaultValue = "''";
                        expression = "if (_value != '') then {[_this, parseSimpleArray _value] call upz_fnc_edenApply}";
                    };
                };
            };
        };
    };
};
