_zoneMarkers = [];
{
	private _mrk = _x;
	
	if (["bulwark_", _x] call BIS_fnc_inString) then {
		_zoneMarkers pushBack (getMarkerPos _mrk);
		deleteMarker _x;
	};
} forEach allMapMarkers;
/*
{
    _currMarker = toArray _x;
    if(count _currMarker >= 4) then {
        _currMarker resize 8;
        _currMarker = toString _currMarker;
        if(_currMarker == "bulwark_") then{
            _zoneMarkers append [getMarkerPos _x];
            deleteMarker _x;
        };
    };
} foreach allMapMarkers;

*/
_allLocations = [];
{
    _allLocations append [locationPosition _x];
} forEach nearestLocations [[0,0,0], ["NameCity", "NameCityCapital", "Airport"], 40000];

List_LocationMarkers = _zoneMarkers;
List_AllCities = _allLocations;
