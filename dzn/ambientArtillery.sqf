dzn_fnc_StartVirtualFiremission = {
	/*
	 * [@PositionSetting, @ShellClass, @Salvos, @RoundsPerSalvo, @TimeoutPerSalvo, @TimeoutPerRound, @StartCondition, @StopCondition] spawn dzn_fnc_StartVirtualFiremission
	 * Plans and provide artillery firemission in given area by spawning shells (no artillery units needed).
	 * 
	 * INPUT:
	 * 0: ARRAY - Pos3d and 2 radiuses to select (e.g. [ [1000,1000,0], 300, 500 ]
	 * 1: STRING - Classname of the shells. E.g. "Sh_82mm_AMOS" ,"Smoke_82mm_AMOS_White","Flare_82mm_AMOS_White"
	 * 2: NUMBER - Number of salvos to shoot. If negative (e.g. -5) - firemission will be looped until @StopCondition met.
	 * 3: NUMBER - (optional) Number of shots in each salvo. Total number of the rounds that will be spawned is Number of salovs * Number of shots in salvo (e.g. for 5 salvos 3 shots each - total is 15 rounds). Default: 3.
	 * 4: NUMBER - (optional) Timeout after each salvo. Default: 40.
	 * 5: NUMBER - (optional) Timeout after each shot in salvo. It will be slightly randomized (+- 2 seconds). Default: 0.
	 * 6: CODE - (optional) Condition to start the firemission. Firemission will be delayed until condition return TRUE. Default: { true }.
	 * 7: CODE - (optional) Condition to cancel the firemission in progress. Default: { false }.
	 * OUTPUT: NONE
	 * 
	 * EXAMPLES:
	 *      [[_pos, 300, 500], "Sh_82mm_AMOS", 5] spawn dzn_fnc_StartVirtualFiremission;
	 *      [[_pos, 300, 500], "Sh_82mm_AMOS", -1, 6, 30, 0, { true }, { alive player }] spawn dzn_fnc_StartVirtualFiremission;
	 *      [[_pos, 300, 500], "Smoke_82mm_AMOS_White", 3] spawn dzn_fnc_StartVirtualFiremission;
	 */

	params [ 
		"_posSettings" 
		, "_shellType" 
		, "_salvos" 
		, ["_roundsPerSalvo", 3] 
		, ["_timeoutPerSalvo", 40] 
		, ["_timeoutPerRound", 0] 
		, ["_startCondition", { true }] 
		, ["_stopCondition", { false }] 
	];


	private _tgts = [];
	private _totalRounds = abs(_salvos) * _roundsPerSalvo;

	for "_i" from 1 to _totalRounds do {
		_tgts pushBack ( [_posSettings select 0, _posSettings select 1, _posSettings select 2,1,0] call BIS_fnc_findSafePos );	
	};

	waitUntil _startCondition;

	for "_i" from 0 to (_totalRounds - 1) step _roundsPerSalvo do {
		if (call _stopCondition) exitWith {};
		
		for "_j" from 0 to (_roundsPerSalvo - 1) do {
			[_tgts select (_i + _j), _shellType, 25, true] call dzn_fnc_spawnShell;
			
			sleep (_timeoutPerRound + random(3));
		};
		
		sleep _timeoutPerSalvo
	};

	if (_salvos < 0) exitWith { _this spawn dzn_fnc_StartVirtualFiremission; };
};

dzn_fnc_spawnShell = {
	/*
	 * @ShellObj = [@Pos2d/3d, (opt)@ShellType, (opt)@Dispersion, (opt)@IsMortar, (opt)@Height, (opt)@Velocity] call dzn_fnc_spawnShell
	 * Spawn artillery shell of given type over the position in given heigth with given vertical speed.
	 * 
	 * INPUT:
	 * 0: POS2D/3D - Position to spawn
	 * 1: STRING - (optional) Classname of the artillery round. E.g. "Sh_82mm_AMOS" (default) ,"Smoke_82mm_AMOS_White","Flare_82mm_AMOS_White"
	 * 2: NUMBER - (optional) Randomized radius. Default: 10
	 * 3: BOOLEAN - (optional) Is a mortar-caliber shell or howitzer (affects illumination round size). Default: true
	 * 4: NUMBER - (optional) Spawn altitude in meters. Default: 500
	 * 5: NUMBER - (optional) Shell initial vertical velocity. Does not affect illumination rounds. Default: -100
	 * OUTPUT: 
	 * 
	 * EXAMPLES:
	 *      _shell = [ getMarkerPos "Arty1" ] call dzn_fnc_spawnShell;
	 *      _shell = [ [1200,2200,0], "Smoke_82mm_AMOS_White", 300] call dzn_fnc_spawnShell;
	 */

	params ["_pos",["_type","Sh_82mm_AMOS"], ["_disp", 10], ["_isMortar", true], ["_h", 500],["_v", -100]];

	_pos = _pos getPos [_disp, random 360];
	_pos set [2, _h];

	private _shell = _type createVehicle _pos;
	_shell setVectorDirandUp [[0,0,-1],[0.1,0.1,1]];

	if (_type isKindOf "FlareCore") then {
		_shell setPosATL [_pos select 0, _pos select 1, 280];
		[
			_shell
			, if (_isMortar) then {
				[400,25,10]
			} else {
				[600,25,10]
			}
			, _isMortar
		] call dzn_fnc_setShellFlareEffectGlobal;

		_shell setVelocity [0,0,0.1];
		_shell spawn {
			while { (getPosATL _this select 2) > 1 } do {
				_this setVelocity [0,0,-4];
			};
		};
	} else {
		_shell setVelocity [0,0,_v];
	};

	_shell
};