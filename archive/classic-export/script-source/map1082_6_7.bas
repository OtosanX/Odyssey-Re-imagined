SUB Main(Player AS LONG)
	If StrCmp(GetPlayerUser(Player), "dorigurl1021") Then OpenDoor(1082, 5, 7)
	If StrCmp(GetPlayerUser(Player), "py2000") Then OpenDoor(1082, 5, 7)
'	If StrCmp(GetPlayerUser(Player), "veritas") Then OpenDoor(1082, 5, 7)
END SUB