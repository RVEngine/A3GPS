_hudDisplay = uiNamespace getVariable ["gps_quickNav",displayNull];

if !(isNull _hudDisplay) exitWith {
	("gps_quickNav" call BIS_fnc_rscLayer) cutText ["","PLAIN"];
	true

};
("gps_quickNav" call BIS_fnc_rscLayer) cutRsc ["gps_quickNav","PLAIN", 1 , false]; //show
_hudDisplay = uiNamespace getVariable ["gps_quickNav",displayNull];
{
	_x ctrlSetPosition (_x getVariable "originalPos");
	_x ctrlCommit 0.2;
}foreach allControls _hudDisplay;

true