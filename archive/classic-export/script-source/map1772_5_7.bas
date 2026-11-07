SUB Main(Player AS LONG)
	If StrCmp(GetPlayerUser(Player), "mbs") Then OpenDoor(1772, 5, 6)
END SUB