SUB Main(Player AS LONG)
	If StrCmp(GetPlayerUser(Player), "bjah") Then OpenDoor(744, 10, 8)
	If StrCmp(GetPlayerUser(Player), "gunslinger") Then OpenDoor(744, 10, 8)
END SUB