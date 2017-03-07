/*
    File: fn_keyHandler.sqf
    Author: blackfisch

    Description:
    Main key handler for event 'keyDown'
*/
_ctrl = _this select 0;
_code = _this select 1;
_shift = _this select 2;
_ctrlKey = _this select 3;
_alt = _this select 4;
_handled = false;

switch (_code) do {
    //L Key
    case 38: {
        private _veh = vehicle player;
        if (_ctrlKey && {!_shift} && {!isNull objectParent player} && {(driver _veh) isEqualTo player}) then {
            call bf_fnc_lights;
            _handled = true;
        };
        if (_shift && {!_ctrlKey} && {!isNull objectParent player} && {(driver _veh) isEqualTo player}) then {
            if (_veh getVariable ["lights",false] && {!isNull (_veh getVariable ["lightObj",objNull])}) then {
                _veh setVariable ["lights",false,true];
            } else {
                _veh setVariable ["lights",true,true];
                [_veh] remoteExec ["bf_fnc_lightsOn",0];
            };
            _handled = true;
        };
    };

    //F Key
    case 33: {
        private _veh = vehicle player;
        if (!isNull objectParent player && {(driver _veh) isEqualTo player}) then {
            if (_veh getVariable ["siren",false]) then {
                _veh setVariable ["siren",false,true];
            } else {
                _veh setVariable ["siren",true,true];
                [_veh] remoteExec ["bf_fnc_siren",0];
            };
            _handled = true;
        };
    };
};

_handled;
