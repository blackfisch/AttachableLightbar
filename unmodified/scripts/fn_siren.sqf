/*
    File: fn_lightsOn.sqf
    Author: blackfisch

    Description:
    Main functions for sirens
*/
if !(params [["_vehicle", objNull, [objNull]]]) exitWith {}; //why no parameter cyka?
if (isNull _vehicle) exitWith {};
if !(_vehicle getVariable ["siren",false]) exitWith {};
private _soundLength = 4.87; //length of siren in seconds

for "_i" from 0 to 1 step 0 do {
    if !(_vehicle getVariable ["siren",false]) exitWith {};
	if ((count crew _vehicle) isEqualTo 0) then {_vehicle setVariable ["siren",false,true]};
	if(!alive _vehicle) exitWith {};
	if(isNull _vehicle) exitWith {};
	_vehicle say3D "siren";//Class/name specified in description.ext
	uisleep _soundLength;//Exactly matches the length of the audio file.
	if !(_vehicle getVariable ["siren",false]) exitWith {};
};
