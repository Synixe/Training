#include "script_component.hpp"

// Creates a patient spawner

// Requires
//
// medical_spawner - The object that will be used to spawn the patients
// medical_spawn - The location the patients will spawn

_action = ["CreatePatient", "Create Patient", "", {
	["medical_spawn"] call FUNC(createPatient);
}, {goggles player == "G_Goggles_VR"}] call ace_interact_menu_fnc_createAction; 
[medical_spawner, 0, ["ACE_MainActions"], _action, true] call ace_interact_menu_fnc_addActionToObject;
