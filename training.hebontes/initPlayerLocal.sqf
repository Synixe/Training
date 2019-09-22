#include "script_component.hpp"

// Teleport 
addMissionEventHandler ["MapSingleClick", {
	params ["_units", "_pos", "_alt", "_shift"];
	if (_alt) then {
		player setPos _pos;
	};
}];

// Init Sub Systems
call EFUNC(medical,init);
