SUB Main(Player AS LONG)
	If StrCmp(GetPlayerUser(Player), "bjah") Then OpenDoor(743, 6, 8)
	If StrCmp(GetPlayerUser(Player), "gunslinger") Then OpenDoor(743, 6, 8)
END SUB