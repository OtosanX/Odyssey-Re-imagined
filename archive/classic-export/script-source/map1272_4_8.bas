SUB Main(Player AS LONG)
	If StrCmp(GetPlayerUser(Player), "Talon") Then OpenDoor(1272, 4, 7)
	If StrCmp(GetPlayerUser(Player), "Sharkhan") Then OpenDoor(1272, 4, 7)
	If StrCmp(GetPlayerUser(Player), "Kit") Then OpenDoor(1272, 4, 7)
	If StrCmp(GetPlayerUser(Player), "Bluebayou") Then OpenDoor(1272, 4, 7)
END SUB