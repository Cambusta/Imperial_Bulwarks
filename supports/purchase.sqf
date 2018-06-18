/**
*  supports/purchase
*
*  Actor for the "Purchase support" dialog button
*
*  Domain: Client
**/

_index = lbCurSel 1501;
shopVehic = objNull;

_shopItem = BULWARK_SUPPORTITEMS select _index;
_shopPrice = (_shopItem) select 0;
_shopName  = (_shopItem) select 1;
_shopClass = (_shopItem) select 2;

AUS = _shopItem;
// [1000,"Auspex Recon","auspex"]


// Script was passed an invalid number
if(_shopClass == "") exitWith {};


if(player getVariable "killPoints" >= _shopPrice) then {
	[player, _shopPrice] remoteExec ["killPoints_fnc_spend", 2];
	if (_shopItem select 2 == "auspex") exitWith {
		closeDialog 2;
		[] spawn {
			DZN_AUSPEX_MARKERS = [];
			
			{
				DZN_AUSPEX_MARKERS pushBack ( [
					format ["Auspex_%1", _forEachIndex]
					, getPos _x
					, "hd_dot"
					, if (side _x == side player) then { "colorBLUFOR" } else { "colorOPFOR" }
					, ""
					, false
				] call dzn_fnc_createMarkerIcon );		
			} forEach (allUnits);
		
			"Auspex Recognition done. Check your maps!" remoteExec ["hint", 0];
			sleep 30;
			
			{ deleteMarker _x; } forEach DZN_AUSPEX_MARKERS;
		};
	};

	[player, _shopClass] call BIS_fnc_addCommMenuItem;
} else {
    [format ["<t size='0.6' color='#ff3300'>Not enough points for %1!</t>", _shopName], -0, -0.02, 0.2] call BIS_fnc_dynamicText;
    objPurchase = false;
};
