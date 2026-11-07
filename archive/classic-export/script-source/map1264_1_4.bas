SUB Main(Player AS LONG)
	If StrCmp(GetPlayerUser(Player), "acidman") Then OpenDoor(1264, 1, 3)
	If StrCmp(GetPlayerUser(Player), "maxell") Then OpenDoor(1264, 1, 3)
	If StrCmp(GetPlayerUser(Player), "t3st3r") Then OpenDoor(1264, 1, 3)
	If StrCmp(GetPlayerUser(Player), "t3st3r2") Then OpenDoor(1264, 1, 3)
 END SUB