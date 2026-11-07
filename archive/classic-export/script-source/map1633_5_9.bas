SUB Main(Player AS LONG)
	If StrCmp(GetPlayerUser(Player), "zorlax") Then OpenDoor(1633, 5, 8)
	If StrCmp(GetPlayerUser(Player), "dengalepony") Then OpenDoor(1633, 5, 8)
END SUB