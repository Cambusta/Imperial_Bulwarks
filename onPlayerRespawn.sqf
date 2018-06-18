dzn_zero_pos = getPos player;
waitUntil {!isNil "bulwarkBox"};
["Terminate"] call BIS_fnc_EGSpectator;

_player = _this select 0;
removeHeadgear _player:
removeGoggles _player;
removeVest _player;
removeBackpack _player;
removeUniform _player;
removeAllWeapons _player:
removeAllAssignedItems _player;
_player setPosASL ([bulwarkBox] call bulwark_fnc_findPlaceAround);

_player addUniform (selectRandom [
	"DKoK_Gren_Uniform_82nd"
	,"DKoK_Gren_Uniform_1491st"
	,"DKoK_Gren_Uniform_1490th"
	,"Indep_DKoK_Gren_Uniform_1489th"
	,"OP_DKoK_Gren_Uniform_1491st"
]);

_player addGoggles (selectRandom [
	"DKOKGrenMask"
	,"DKOKGrenMask1489th"
	,"DKOKGrenMask1490th"
	,"DKOKGrenMask1491st"
	,"DKOKGrenMask82nd"
	,"DKOKOffMask"
	,"DKOKTroopMask"
	,""
	,""
	,""
]);

_player addHeadgear (selectRandom [
	""
	,""
	,""
	,""
	,"DKoK_GM_Helm_1490th"
	,"DKoK_GM_Helm_1491st"
	,"DKoK_GM_Helm_1489th"
	,"DKoK_GM_Helm_82nd"
	,"H_HeadBandage_clean_F"
	,"H_HeadBandage_stained_F"
	,"H_HeadBandage_bloody_F"
]);

if (!isNil "ace_hearing_fnc_putInEarplugs") then {
	_player call ace_hearing_fnc_putInEarplugs;
};

if (PLAYER_STARTWEAPON) then {
	private _id = floor random 4;
	private _gun =   ["hgun_Pistol_heavy_02_F","LuciusLaspistolBlack","LuciusLaspistolGreen","rhsusf_weap_m1911a1","CUP_hgun_TaurusTracker455"] select _id;
	private _mag =   ["6Rnd_45ACP_Cylinder","LuciusLaspistol_mag","LuciusLaspistol_mag","rhsusf_mag_7x45acp_MHP","CUP_6Rnd_45ACP_M"] select _id;
	
	_player addMagazine _mag;
	_player addMagazine _mag;
	_player addMagazine _mag;
	_player addMagazine _mag;
	_player addMagazine _mag;
	_player addWeapon _gun;
};

if (PLAYER_STARTMAP) then {
    _player addItem "ItemMap";
    _player assignItem "ItemMap";
};

if (PLAYER_STARTNVG) then {
    _player addItem "Integrated_NVG_F";
    _player assignItem "Integrated_NVG_F";
};


[] spawn {
	sleep 5;
	if ( player distance dzn_zero_pos < 200 ) then {
		player setPosASL ([bulwarkBox] call bulwark_fnc_findPlaceAround);
	};
};	
	