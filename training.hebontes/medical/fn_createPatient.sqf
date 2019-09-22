#include "script_component.hpp"

params ["_marker"];

private _patient = (createGroup west) createUnit ["C_Soldier_VR_F", getMarkerPos [_marker, true], [], 0, "NONE"];
_patient hideObjectGlobal true;
_patient setVariable [QGVAR(owner), player, true];

private _selections = [
	[0.2, "left_l"],
	[0.2, "left_r"],
	[0.5, "body"],
	[0.1, "head"],
	[0.2, "hand_r"],
	[0.3, "hand_l"]
];
for "_i" from 1 to (random [7,13,30]) do {
	private _selection = selectRandom _selections;
	[_patient, _selection#0, _selection#1, selectRandom ["grenade", "stab", "bullet", "falling"]] call ace_medical_fnc_addDamageToUnit;
};
[_patient] call ace_medical_fnc_handleDamage_advancedSetDamage;
