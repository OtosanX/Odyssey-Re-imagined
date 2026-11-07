SUB Main(Player AS LONG)
	If StrCmp(GetPlayerUser(Player), "bjah") Then OpenDoor(742, 1, 4)
	If StrCmp(GetPlayerUser(Player), "gunslinger") Then OpenDoor(742, 1, 4)
END SUB