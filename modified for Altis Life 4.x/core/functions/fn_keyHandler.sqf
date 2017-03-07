//replace case 38 with this one

	case 38: {
        private _veh = vehicle player;
        if (_ctrlKey && {!_shift} && {!isNull objectParent player} && {(driver _veh) isEqualTo player} && {playerSide isEqualTo west}) then {
            call bf_fnc_lights;
            _handled = true;
        };
        if (_shift && {!_ctrlKey} && {!isNull objectParent player} && {(driver _veh) isEqualTo player} && {playerSide isEqualTo west}) then {
            if (!isNull (_veh getVariable ["lightObj",objNull])) then {
                if (_veh getVariable ["lights",false]) then {
                    _veh setVariable ["lights",false,true];
                } else {
                    _veh setVariable ["lights",true,true];
                    [_veh] remoteExec ["bf_fnc_lightsOn",0];
                };
            } else {
                if ((typeOf _veh) in ["C_Offroad_01_F","B_MRAP_01_F","C_SUV_01_F","C_Hatchback_01_sport_F","B_Heli_Light_01_F","B_Heli_Transport_01_F"]) then {
                    if (!isNil {_veh getVariable "lights"}) then {
                        if (playerSide isEqualTo west) then {
                            [_veh] call life_fnc_sirenLights;
                        } else {
                            [_veh] call life_fnc_medicSirenLights;
                        };
                        _handled = true;
                    };
                };
            };
            _handled = true;
        };
    };