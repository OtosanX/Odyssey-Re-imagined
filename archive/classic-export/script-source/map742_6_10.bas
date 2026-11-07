SUB Main(Player AS LONG)
	If StrCmp(GetPlayerUser(Player), "bjah") Then OpenDoor(742, 6, 9)
	If StrCmp(GetPlayerUser(Player), "gunslinger") Then OpenDoor(742, 6, 9)
END SUB