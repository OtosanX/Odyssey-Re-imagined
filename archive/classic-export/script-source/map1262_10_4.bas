SUB Main(Player AS LONG)
	If StrCmp(GetPlayerUser(Player), "acidman") Then OpenDoor(1262, 10, 5)
	If StrCmp(GetPlayerUser(Player), "maxell") Then OpenDoor(1262, 10, 5)
	If StrCmp(GetPlayerUser(Player), "t3st3r") Then OpenDoor(1262, 10, 5)
	If StrCmp(GetPlayerUser(Player), "t3st3r2") Then OpenDoor(1262, 10, 5)
 END SUB