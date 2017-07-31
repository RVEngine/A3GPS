/**
	@Author : [Utopia] Amaury
	@Creation : 20/07/17
	@Modified : 20/07/17
	@Description : nothing to say
**/

_disp = _this select 0;
uiNamespace setVariable ['gps_quickNav', _disp];

_btn = _disp displayCtrl 1600;
_text = _disp displayCtrl 1100;

_text ctrlSetStructuredText parseText format["<t align='center'>%1</t>",["STR_QUICKNAV_HEADER"] call misc_fnc_localize];

_options = [
	[["STR_QUICKNAV_OPTION_STATION"] call misc_fnc_localize,{
		[
			[
			player,
			nearestObjects [player,["Land_fs_feed_F"],5000]
			] call misc_fnc_nearestPos
		] spawn gps_fnc_navToNearest;
	}],
	[["STR_QUICKNAV_OPTION_TOWN"] call misc_fnc_localize,{
		[
			locationPosition ([getPosATL player,4000,["NameCity","NameVillage","NameCityCapital","NameLocal"]] call misc_fnc_nearestLocation)
		] spawn gps_fnc_navToNearest;
	}]
];

_disp setVariable ["options",_options];
_disp setVariable ["selOpt",0];

_btn ctrlSetText ((_options select 0) select 0);

{	//hide the elements
	_pos = ctrlPosition _x;
	_x setVariable ["originalPos",_pos];
	_x ctrlSetPosition [_pos select 0,_pos select 1,0,_pos select 3];
	_x ctrlCommit 0;
}foreach [_btn,_text];

