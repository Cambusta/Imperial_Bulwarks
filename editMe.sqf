/**
*  editMe
*
*  Defines all global config for the mission
*
*  Domain: Client, Server
**/

/* Attacker Waves */


// List_Bandits, List_ParaBandits, List_OPFOR, List_INDEP, List_NATO, List_Viper
HOSTILE_LEVEL_1 = [
	"OP_Ren_01_black",	"OP_Ren_01_black",	"OP_Ren_01_black",	"OP_Ren_01_black",	"OP_Ren_01_Plasma_black",	"OP_Ren_01_brown",	"OP_Ren_01_brown",	"OP_Ren_01_brown",
	"OP_Ren_01_brown",	"OP_Ren_01_Plasma_brown",	"OP_Ren_01_black",	"OP_Ren_01_black",	"OP_Ren_01_black",	"OP_Ren_01_black",	"OP_Ren_01_black",	"OP_Ren_01_black",
	"OP_Ren_02_black",	"OP_Ren_02_black",	"OP_Ren_02_black",	"OP_Ren_01_Plasma_black",	"OP_Ren_01_grey",	"OP_Ren_01_grey",	"OP_Ren_01_grey",	"OP_Ren_01_grey",
	"OP_Ren_01_Plasma_grey",	"OP_Ren_01_brown",	"OP_Ren_01_brown",	"OP_Ren_01_brown",	"OP_Ren_01_brown",	"OP_Ren_01_brown",	"OP_Ren_01_brown",	"OP_Ren_02_brown",
	"OP_Ren_02_brown",	"OP_Ren_02_brown",	"OP_Ren_01_Plasma_brown",	"OP_Ren_01_green",	"OP_Ren_01_green",	"OP_Ren_01_green",	"OP_Ren_01_green",	"OP_Ren_01_green",
	"OP_Ren_01_green",	"OP_Ren_02_green",	"OP_Ren_02_green",	"OP_Ren_02_green",	"OP_Ren_01_Plasma_green",	"OP_Ren_01_black",	"OP_Ren_01_AT_black",	"OP_Ren_01_AT_black",
	"OP_Ren_01_AT_black",	"OP_Ren_01_black",	"OP_Ren_01_black",	"OP_Ren_01_brown",	"OP_Ren_01_AT_brown",	"OP_Ren_01_AT_brown",	"OP_Ren_01_AT_brown",	"OP_Ren_01_brown",
	"OP_Ren_01_brown",	"OP_Ren_01_green",	"OP_Ren_01_AT_green",	"OP_Ren_01_AT_green",	"OP_Ren_01_AT_green",	"OP_Ren_01_green",	"OP_Ren_01_green",	"OP_Ren_01_grey",
	"OP_Ren_01_AT_grey",	"OP_Ren_01_AT_grey",	"OP_Ren_01_AT_grey",	"OP_Ren_01_grey",	"OP_Ren_01_grey"
];
HOSTILE_LEVEL_2 = HOSTILE_LEVEL_1;    // Wave 5 >
HOSTILE_LEVEL_3 = HOSTILE_LEVEL_1;    // Wave 10 >

HOSTILE_MULTIPLIER = ("HOSTILE_MULTIPLIER" call BIS_fnc_getParamValue);  // How many hostiles per wave (waveCount x HOSTILE_MULTIPLIER)
HOSTILE_TEAM_MULTIPLIER = ("HOSTILE_TEAM_MULTIPLIER" call BIS_fnc_getParamValue) / 100;   // How many extra units are added per player
PISTOL_HOSTILES = ("PISTOL_HOSTILES" call BIS_fnc_getParamValue);  //What wave enemies stop only using pistols

// List_LocationMarkers, List_AllCities
BULWARK_LOCATIONS = List_LocationMarkers;
BULWARK_RADIUS = ("BULWARK_RADIUS" call BIS_fnc_getParamValue);
BULWARK_MINSIZE = ("BULWARK_MINSIZE" call BIS_fnc_getParamValue);   // Spawn room must be bigger than x square metres
BULWARK_LANDRATIO = ("BULWARK_LANDRATIO" call BIS_fnc_getParamValue);
LOOT_HOUSE_DENSITY = ("LOOT_HOUSE_DENSITY" call BIS_fnc_getParamValue);  

PLAYER_STARTWEAPON = if ("PLAYER_STARTWEAPON" call BIS_fnc_getParamValue == 1) then {true} else {false};
PLAYER_STARTMAP    = if ("PLAYER_STARTMAP" call BIS_fnc_getParamValue == 1) then {true} else {false};
PLAYER_STARTNVG    = if ("PLAYER_STARTNVG" call BIS_fnc_getParamValue == 1) then {true} else {false};

/* Loot Spawn */
LOOT_WEAPON_POOL    = [
	"AgripinaaAutoIG2","AgripinaaAutoIG2GL","AgripinaaAutoIG1","AgripinaaAutoIG1GL"
	,"Lucius22c","Lucius98LasgunBlackG","Lucius98LasgunGreenS","Lucius98LasgunBlackS"
	,"Lucius98LasgunGreenG","AgripinaaAutoSoB","AgripinaaAutoSoBgl","Type14HeavyGreen"
	,"Type14HeavyBlack","DK_PlasmaGun"
	,"srifle_GM6_F","rhs_weap_kar98k","rhs_weap_m21a","rhs_weap_m76","CUP_glaunch_M79"
	,"rhs_weap_m84","CUP_arifle_Sa58P_des"
	
	,"hgun_Pistol_heavy_02_F","LuciusLaspistolBlack","LuciusLaspistolGreen","rhsusf_weap_m1911a1","CUP_hgun_TaurusTracker455","rhs_weap_rsp30_red"
	
];    // Classnames of Loot items as an array

LOOT_APPAREL_POOL   = [
	"DKoK_Eng_Armor_1489th","DKoK_Eng_Armor_1491st","DKoK_Eng_Armor_82nd","DKoK_Eng_Armor_1490th"
	,"DKoK_Gren_Armor_1491st","DKoK_Gren_Armor_82nd","DKoK_Gren_Armor_1489th","DKoK_Gren_Armor_1490th"
	
	,"DKoK_GM_Helm_1490th","DKoK_GM_Helm_1491st","DKoK_GM_Helm_1489th","DKoK_GM_Helm_82nd"
	
	,"DKOKGrenMask","DKOKGrenMask1489th","DKOKGrenMask1490th","DKOKGrenMask1491st","DKOKGrenMask82nd","DKOKOffMask","DKOKTroopMask"
	
	, "G_Aviator","rhs_balaclava","G_Balaclava_blk","G_Balaclava_oli","rhs_balaclava1_olive"
	,"G_Bandanna_beast","G_Bandanna_blk","G_Bandanna_tan","G_Lowprofile","CUP_FR_NeckScarf2"
	,"rhsusf_shemagh2_od","rhsusf_shemagh_tan","rhsusf_shemagh2_tan","rhsusf_shemagh2_gogg_grn"
	,"rhsusf_shemagh_gogg_tan","rhsusf_shemagh2_gogg_tan","rhsusf_oakley_goggles_ylw","G_Balaclava_TI_blk_F"

	,"CUP_H_NAPA_Fedora","H_HeadBandage_clean_F","H_HeadBandage_stained_F","H_HeadBandage_bloody_F"
	,"CUP_H_SLA_OfficerCap","H_Hat_Safari_olive_F","H_Hat_Safari_sand_F","H_ShemagOpen_tan"
	,"H_Shemag_olive","CUP_H_C_Ushanka_02","CUP_H_C_Ushanka_04"
];
LOOT_ITEM_POOL      = List_Optics + List_Items;
LOOT_EXPLOSIVE_POOL = List_Mines;
LOOT_STORAGE_POOL   = [
	"DKoK_AT_BackPack","DKoK_BackPack","DKoK_Eng_BackPack","DKoK_PlasmaBackPack"
	,"rhssaf_alice_smb","B_Bergen_hex_F","B_LegStrapBag_coyote_F","B_LegStrapBag_olive_F"
	,"rhs_medic_bag","B_Messenger_Black_F","B_Messenger_Coyote_F","B_Messenger_Gray_F"
	,"RHS_DShkM_Gun_Bag","RHS_DShkM_TripodLow_Bag","RHS_DShkM_TripodHigh_Bag"
];


/* Random Loot */
// dzn: Need to change to wrecks???
LOOT_HOUSE_DISTRIBUTION = ("LOOT_HOUSE_DISTRIBUTION" call BIS_fnc_getParamValue);  // Every *th house will spwan loot.
LOOT_ROOM_DISTRIBUTION = ("LOOT_ROOM_DISTRIBUTION" call BIS_fnc_getParamValue);   // Every *th position, within that house will spawn loot.
LOOT_DISTRIBUTION_OFFSET = 0; // Offset the position by this number.
LOOT_SUPPLYDROP = ("LOOT_SUPPLYDROP" call BIS_fnc_getParamValue) / 100;        // Radius of supply drop
PARATROOP_COUNT = ("PARATROOP_COUNT" call BIS_fnc_getParamValue);
PARATROOP_CLASS = List_NATO;

/* Points */
SCORE_KILL = ("SCORE_KILL" call BIS_fnc_getParamValue);                 // Every kill
SCORE_HIT = ("SCORE_HIT" call BIS_fnc_getParamValue);                   // Every Bullet hit that doesn't result in a kill
SCORE_DAMAGE_BASE = ("SCORE_DAMAGE_BASE" call BIS_fnc_getParamValue);   // Extra points awarded for damage. 100% = SCORE_DAMAGE_BASE. 50% = SCORE_DAMAGE_BASE/2
SCORE_RANDOMBOX = 950;  // Cost to spin the box

BULWARK_SUPPORTITEMS = [
    [800,  	"Recon UAV",		"reconUAV"],
    [1000, 	"Auspex Recon",	"auspex"],
    /* [1950, "Paratroopers",  "paraDrop"], */
    [5430, 	"Missle CAS",		"airStrike"]
    /* [5930, "Rage Stimpack", "ragePack"],
    [6666, "ARMAKART TM",   "armaKart"]
    */
];

BULWARK_BUILDITEMS = [
    [50,	"Junk Barricade",		"Land_Barricade_01_4m_F"],
    [50,	"Ladder",			"TIOW_Ladder"],
    [100,	"Short Sandbag Wall",	"Land_SandbagBarricade_01_half_F"],
    [150,	"Sandbag Barricade",		"Land_SandbagBarricade_01_hole_F"],
    [175,	"AEGIS Shield",		"TIOW_ADL_Single"],
    [250,	"Tall Concrete Wall",	"Land_Mil_WallBig_4m_F"],
    [350,	"AEGIS Shield wall",		"TIOW_ADL_Double"],
    [450,	"AEGIS Wall",			"TIOW_Fence_Short"],
    [500,	"H Barrier",			"Land_HBarrier_3_F"],
    [800,	"Storage box small",		"Box_NATO_Support_F"],
    [1000,	"Double H Barrier",		"Land_HBarrierWall4_F"],
    [1200,	"Storage box large",		"Box_NATO_AmmoVeh_F"],
    
    [2500,	"Machine Gun",		"B_HMG_01_F"],
    [2500,	"Machine Gun (raised)",	"B_HMG_01_high_F"],
    [2500,	"DSHK (Mini-tripod)",	"rhsgref_ins_DSHKM_Mini_TriPod"],
    [2500,	"DSHK (raised)",		"rhsgref_ins_DSHKM"],
    
    [4000,	"SPG-9M",			"rhsgref_ins_SPG9M"],
    
    [5000,	"Guard Tower",		"Land_Cargo_Patrol_V3_F"],
    [7500,	"Imperial Guard Bastion",		"TIOW_Bastion_green"]
];



/* Time of Day*/
DAY_TIME_FROM = ("DAY_TIME_FROM" call BIS_fnc_getParamValue);
DAY_TIME_TO = ("DAY_TIME_TO" call BIS_fnc_getParamValue);

// Check for sneaky inverted configuration. FROM should always be before TO.
if (DAY_TIME_FROM > DAY_TIME_TO) then {
    DAY_TIME_FROM = DAY_TIME_TO - 2;
};

/* Starter MediKits */
BULWARK_MEDIKITS = ("BULWARK_MEDIKIT" call BIS_fnc_getParamValue);
