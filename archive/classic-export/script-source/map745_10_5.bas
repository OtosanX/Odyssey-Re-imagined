SUB Main(Player AS LONG)
	If StrCmp(GetPlayerUser(Player), "bjah") Then OpenDoor(745, 10, 5)
	If StrCmp(GetPlayerUser(Player), "gunslinger") Then OpenDoor(745, 10, 5)
END SUB