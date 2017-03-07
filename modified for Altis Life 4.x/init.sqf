//add at the end:
emergLight_vehicles = [];
{
        emergLight_vehicles pushBack (configName _x);
} forEach ("true" configClasses (missionConfigFile >> "emergLightVehicles"));
