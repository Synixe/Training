// Gates
private _gates = [];
{
	private _info = getModelInfo _x;
	if (_info#0 isEqualTo "bargate_f.p3d") then {
		_gates pushBack _x;
	};
} forEach nearestTerrainObjects [[10000,10000,0], [], 50000];
{
	missionNamespace setVariable [format ["bargate_%1", _foreachIndex], _x, true];
	_trg = createTrigger ["EmptyDetector", getPos _x];
	_trg setVariable ["BarGateObj", _x];
	_trg setTriggerArea [5, 30, getDir _x, true];
	_trg setTriggerActivation ["ANYPLAYER", "PRESENT", true];
	_trg setTriggerStatements 
	[
		"this", 
		"thisTrigger getVariable ""BarGateObj"" animateSource [""Door_1_sound_source"", 1]", 
		"thisTrigger getVariable ""BarGateObj"" animateSource [""Door_1_sound_source"", 0]"
	];
} forEach _gates;
