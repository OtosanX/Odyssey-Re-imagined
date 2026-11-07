SUB Main(Player AS LONG)
    If StrCmp(GetPlayerUser(Player), "acidman") Then OpenDoor(1265, 9, 4)
	If StrCmp(GetPlayerUser(Player), "maxell") Then OpenDoor(1265, 9, 4)
	If StrCmp(GetPlayerUser(Player), "t3st3r") Then OpenDoor(1265, 9, 4)
	If StrCmp(GetPlayerUser(Player), "t3st3r2") Then OpenDoor(1265, 9, 4)
 END SUB