#include "script_component.hpp"

// VR Effects

medical_filmGrain = ppEffectCreate ["filmGrain", 2012];
medical_filmGrain ppEffectAdjust [0.1, 1, 1, 0, 1];
medical_filmGrain ppEffectCommit 0;

["loadout", {
	if (goggles player == "G_Goggles_VR") then {	
		medical_filmGrain ppEffectEnable true;
		("BIS_layerEstShot" call BIS_fnc_rscLayer) cutRsc ["RscEstablishingShot", "PLAIN"];
	} else {
		medical_filmGrain ppEffectEnable false;
		("BIS_layerEstShot" call BIS_fnc_rscLayer) cutText ["", "PLAIN"];
	};
}] call CBA_fnc_addPlayerEventHandler;

medical_update_vr = {
	params ["_hide"];
	{
		if (_x isKindOf "C_Soldier_VR_F") then {
			if !(_hide) then {
				private _owner = _x getVariable [QGVAR(owner), objNull];
				if (goggles _owner == "G_Goggles_VR") then {
					_x hideObject false;
				} else {
					_x hideObject true;
				};
			} else {
				_x hideObject true;
			}
		};
	} forEach (allMissionObjects "Man");
};

[{
	[goggles player != "G_Goggles_VR"] call medical_update_vr;
}, 0.2] call CBA_fnc_addPerFrameHandler;

// VR nametags
addMissionEventHandler ["Draw3D", {{
	if (_x isKindOf "C_Soldier_VR_F" && {!(isObjectHidden _x)} && {_x distance player < 10}) then {
		private _pos = [visiblePosition _x select 0, visiblePosition _x select 1,(visiblePosition _x select 2)+1];
		drawIcon3D ["", [1, 1, 1, 1], _pos, 0.2, 0.2, 45, format ["Owner: %1", name (_x getVariable [QGVAR(owner), objNull])], 1, 0.03, "PuristaMedium"];
	};
} foreach allunits;}];

// Remove VR entities
private _action = ["RemoveEntity", "Remove Entity", "", {deleteVehicle _target}, {true}] call ace_interact_menu_fnc_createAction;
["C_Soldier_VR_F", 0, ["ACE_MainActions"], _action, true] call ace_interact_menu_fnc_addActionToClass;

call FUNC(createPatientAction);
