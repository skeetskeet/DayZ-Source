private["_unit","_hitPoints","_selection","_killer"];

_unit = _this select 0;
_killer = _this select 1;
/*
_hitPoints = _unit call vehicle_getHitpoints;
{
	_selection = getText (configFile >> "CfgVehicles" >> (typeof _unit) >> "HitPoints" >> _x >> "name");
	_unit setVariable ["hit_"+_selection, 1, true];
} forEach _hitPoints;
*/
//["PVDZ_veh_Save",[_unit, "damage"]] call callRpcProcedure;
if (isServer) then {
	[_unit, "killed"] call server_updateObject;
} else {
	PVDZ_veh_Save = [_unit, "killed"];
	publicVariableServer "PVDZ_veh_Save";
};

_unit removeAllEventHandlers "HandleDamage";
_unit removeAllEventHandlers "Killed";
_unit removeAllEventHandlers "GetIn";
_unit removeAllEventHandlers "GetOut";