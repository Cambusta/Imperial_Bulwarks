waitUntil { !isNull findDisplay 52 || getClientState == "BRIEFING SHOWN" || time > 0 };

// ********** Topics ****************
#define NOTES		private["_topics"]; _topics = []; player createDiarySubject ["tSF_NotesSettingsPage","< SETTINGS >"];
#define TOPIC(Y, NAME) 	if (Y) then { _topics pushBack ["tSF_NotesSettingsPage", [ NAME,
#define END			]]; };
#define ADD_TOPICS	for "_i" from (count _topics) to 0 step -1 do {player createDiaryRecord (_topics select _i);};

NOTES	


TOPIC(true, "< SETTINGS >")
"" + (if (true) then {
"<font color='#12C4FF' size='14'>Настройки видимости</font>
<br /><font color='#A0DB65'><execute expression='[1000, 750] spawn dzn_fnc_addViewDistance;'>+ View Distance</execute></font>
<br /><font color='#A0DB65'><execute expression='[1000, 750] spawn dzn_fnc_reduceViewDistance;'>- View Distance</execute></font>
<br />
<br /><font color='#A0DB65'><execute expression='[] call tSF_fnc_noteSettings_saveViewDistance;'>Save View distance settings</execute></font>
<br />" } else { "" }) + (if (true) then { "<br />
<font color='#12C4FF' size='14'>Настройки детальности ландшафта</font>
<br /><font color='#A0DB65'><execute expression='""Default"" spawn tSF_fnc_noteSettings_setTerrainGrid;'>Default</execute></font>
<br /><font color='#A0DB65'><execute expression='""Normal"" spawn tSF_fnc_noteSettings_setTerrainGrid;'>Normal</execute></font>
<br /><font color='#A0DB65'><execute expression='""High"" spawn tSF_fnc_noteSettings_setTerrainGrid;'>High</execute></font>
<br /><font color='#A0DB65'><execute expression='""Very High"" spawn tSF_fnc_noteSettings_setTerrainGrid;'>Very High</execute></font>
<br /><font color='#A0DB65'><execute expression='""No grass"" spawn tSF_fnc_noteSettings_setTerrainGrid;'>No grass</execute></font>
" } else { "" })
END

ADD_TOPICS
dzn_fnc_addViewDistance = {
	params [["_vdStep", 1000], ["_vodStep", 500]];

	if (viewDistance + _vdStep > 15000) then {
		setViewDistance 15000;
		setObjectViewDistance  [7500, getObjectViewDistance select 1];
	} else {
		setViewDistance (viewDistance + _vdStep);
		setObjectViewDistance [(getObjectViewDistance select 0) + _vodStep, getObjectViewDistance select 1];
	};

	hintSilent parseText format [
		"<t color='#86CC5E'>Setting view distance...</t>"
		, viewDistance
		, getObjectViewDistance select 0
	];

	sleep 0.5;
	hintSilent parseText format [
		"<t color='#86CC5E'>View distance:</t> %1 (%2) <t color='#86CC5E'>m</t>"
		, viewDistance
		, getObjectViewDistance select 0
	];
};

dzn_fnc_reduceViewDistance = {
	params [["_vdStep", 1000], ["_vodStep", 500]];
	if (viewDistance - _vdStep < 1000) then {
		setViewDistance 1000;
		setObjectViewDistance [900, getObjectViewDistance select 1];
	} else {
		setViewDistance (viewDistance - _vdStep);
		setObjectViewDistance [(getObjectViewDistance select 0) - _vodStep, getObjectViewDistance select 1];
	};

	hintSilent parseText format [
		"<t color='#86CC5E'>Setting view distance...</t>"
		, viewDistance
		, getObjectViewDistance select 0
	];

	sleep 0.5;
	hintSilent parseText format [
		"<t color='#86CC5E'>View distance:</t> %1 (%2) <t color='#86CC5E'>m</t>"
		, viewDistance
		, getObjectViewDistance select 0
	];
};

tSF_fnc_noteSettings_saveViewDistance = {
		profileNamespace setVariable ["tSF_ViewDistance", [viewDistance, getObjectViewDistance select 0]];
		
		hintSilent parseText format [
			"<t color='#86CC5E'>View distance saved to profile:</t> %1 (%2) <t color='#86CC5E'>m</t>"
			, viewDistance
			, getObjectViewDistance select 0
		];
};
	
tSF_fnc_noteSettings_setTerrainGrid = {
		hintSilent parseText format [
			"<t color='#86CC5E'>Terrain Grid set to </t>%1"
			, _this
		];
	
		setTerrainGrid (switch (_this) do {
			case "No grass": { 50 };
			case "Default": { 25 };
			case "Normal": { 12.5 };
			case "High": { 6.25 };
			case "Very High": { 3.125 };
		});
};

[] spawn {
		sleep 1;
		
		private _viewDistance = profileNamespace getVariable ["tSF_ViewDistance", [3000, 2600]];
		setViewDistance (_viewDistance select 0);
		setObjectViewDistance [_viewDistance select 1, 100];
};