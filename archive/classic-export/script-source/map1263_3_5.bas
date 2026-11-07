SUB Main(Player AS LONG)
	If StrCmp(GetPlayerUser(Player), "acidman") Then OpenDoor(1263, 3, 6)
	If StrCmp(GetPlayerUser(Player), "maxell") Then OpenDoor(1263, 3, 6)
	If StrCmp(GetPlayerUser(Player), "t3st3r") Then OpenDoor(1263, 3, 6)
	If StrCmp(GetPlayerUser(Player), "t3st3r2") Then OpenDoor(1263, 3, 6)
 END SUB