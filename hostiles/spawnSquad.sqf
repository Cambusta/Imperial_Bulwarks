/**
*  spawnSquad
*
*  Creates a squad of units in a random location
*
*  Domain: Server
**/


_unitClasses = _this select 0;
_attackWave  = _this select 1;
_unitCount   = _this select 2;

if (_attackWave < 40) then { //determine AI skill based on Wave
	hosSkill = (_attackWave / 40);
} else {
	hosSkill = 1;
};

sleep 0.5;

_location = [bulwarkCity, BULWARK_RADIUS, BULWARK_RADIUS + 150,1,0] call BIS_fnc_findSafePos;
for ("_i") from 1 to _unitCount do {
	_attGroupBand = createGroup [EAST, true];
	_unitClass = selectRandom _unitClasses;
	_unit = objNull;
	_unit = _attGroupBand createUnit [_unitClass, _location, [], 0.5, "FORM"];
	sleep 0.3;
	waitUntil {!isNull _unit};

	[_unit] join _attGroupBand;
	_unit doMove (getPos (selectRandom playableUnits));
	_unit setUnitAbility hosSkill; //todo https://community.bistudio.com/wiki/CfgAISkill
	_unit setSkill ["aimingAccuracy", 0.05];
	_unit setSkill ["aimingSpeed", 0.05];
	_unit setSkill ["aimingShake", 0.05];
	_unit setSkill ["spotTime", 0.05];
	_unit addEventHandler ["Hit", killPoints_fnc_hit];
	_unit addEventHandler ["Killed", killPoints_fnc_killed];
	removeAllAssignedItems _unit;

	if(_attackWave <= PISTOL_HOSTILES) then {
		removeAllWeapons _unit;
		
		private _id = floor random 2;
		private _gun =   ["hgun_Pistol_heavy_02_F","rhsusf_weap_m1911a1","CUP_hgun_TaurusTracker455"] select _id;
		private _mag =   ["6Rnd_45ACP_Cylinder","rhsusf_mag_7x45acp_MHP","CUP_6Rnd_45ACP_M"] select _id;
		
		_unit addMagazine _mag;
		_unit addMagazine _mag;
		_unit addMagazine _mag;
		_unit addWeapon _gun;
		
		if ((floor random 4) == 1) then {
			_unit additem "FirstAidKit";
		};
	};

	mainZeus addCuratorEditableObjects [[_unit], true];

	_unitArray = waveUnits select 0;
	_unitArray append [_unit];
};
