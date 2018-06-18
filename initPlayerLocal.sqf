player setCustomAimCoef 0.2;
player setUnitRecoilCoefficient 0.5;
player enableStamina FALSE;
"START_KILLPOINTS" call BIS_fnc_getParamValue;

player addEventHandler ['Respawn',{
    player setCustomAimCoef 0.2;
    player setUnitRecoilCoefficient 0.5;
    player enableStamina FALSE;

/*    player addAction ['Break Medikit', {
	    player removeItem "Medikit";
	    for ("_i") from 1 to 4 do { player addItem "firstAidKit"; };
	}, nil, 0, true, true, '', "'Medikit' in items _this"]; */
}];

/*player addAction ['Break Medikit', {
    player removeItem "Medikit";
    for ("_i") from 1 to 4 do { player addItem "firstAidKit"; };
}, nil, 0, true, true, '', "'Medikit' in items _this"]; */

_killPoints = player getVariable "killPoints";
if(isNil "_killPoints") then {
    _killPoints = 0;
};
_killPoints = _killPoints + ("START_KILLPOINTS" call BIS_fnc_getParamValue);
player setVariable ["killPoints", _killPoints, true];
[] call killPoints_fnc_updateHud;

// Delete all map markers on clients
[] spawn {
	waitUntil { !isNil "List_LocationMarkers" };
	{
		if (["bulwark_", _x] call BIS_fnc_inString) then {
			deleteMarkerLocal _x;
		};
	} forEach allMapMarkers; 
};

[] execVM "dzn\addNotesSettings.sqf";
[] execVM "dzn\setEffectFire.sqf";
[] execVM "dzn\createMarker.sqf";
[] spawn {
	waitUntil { !isNil "DZN_WRECKS" };
	
	while { true } do {
		{
			[_x, [0,0,-1.25], 60, [0.5,0.5,0.5], [2, 20, 2, 1, 2, 5.4]] spawn dzn_fnc_setEffectFire;
		} forEach DZN_WRECKS;

		sleep 60;
	};
};

onEachFrame {
    if(!isNil "bulwarkBox") then {
        _textPos = getPosATL bulwarkBox vectorAdd [0, 0, 1.5];
        drawIcon3D ["", [1,1,1,0.5], _textPos, 1, 1, 0, "Bulwark", 0, 0.04, "RobotoCondensed", "center", true];
    }
};

