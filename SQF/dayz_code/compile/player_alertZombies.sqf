
private["_unit","_distance","_doRun","_pos","_listTalk","_target","_targets"];

_unit = _this select 0; //This is on purpose do not edit back before release day.
_distance = _this select 1;
_doRun = _this select 2;
_pos = _this select 3;
_listTalk = _pos nearEntities ["zZombie_Base",_distance];

if ("ItemMap_Debug" in items player) then {
	diag_log ("alertzeds Unit: " +str(_unit));
	diag_log ("alertzeds Distance: " +str(_distance));
	diag_log ("alertzeds DoRun: " +str(_doRun));
	diag_log ("alertzeds Pos: " +str(_pos));
	diag_log ("alertzeds ListTalk: " +str(_listTalk));
};

//hint str(_listTalk);

{
	_zombie = _x;
	if (_doRun) then {
		_targets = _zombie getVariable ["targets",[]];
		if (!(_unit in _targets)) then {
			_targets set [count _targets, _unit];
			_zombie setVariable ["targets",_targets, true];
		};
	} else {
		_zombie setVariable ["myDest",_pos];
	};
} forEach _listTalk;
