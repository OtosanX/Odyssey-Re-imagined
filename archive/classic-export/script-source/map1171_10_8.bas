SUB Main(Player AS LONG)
	If StrCmp(GetPlayerUser(Player), "dcm") Then OpenDoor(1171, 10, 7)
'	If StrCmp(GetPlayerName(Player), "Progs") Then OpenDoor(1171, 10, 7)
	If StrCmp(GetPlayerName(Player), "Mader") Then OpenDoor(1171, 10, 7)
END SUB