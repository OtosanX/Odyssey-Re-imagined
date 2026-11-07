SUB Main(Player AS LONG)
	If StrCmp(GetPlayerUser(Player), "Isaac") Then OpenDoor(730, 5, 9)
	If StrCmp(GetPlayerUser(Player), "Huesos") Then OpenDoor(730, 5, 9)
	If StrCmp(GetPlayerUser(Player), "Lakai") Then OpenDoor(730, 5, 9)
END SUB