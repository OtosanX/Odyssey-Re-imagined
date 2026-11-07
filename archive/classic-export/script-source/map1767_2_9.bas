SUB Main(Player AS LONG)
	If StrCmp(GetPlayerUser(Player), "tyler_is_here") Then OpenDoor(1767, 2, 8)
	If StrCmp(GetPlayerUser(Player), "darkbuddy102938") Then OpenDoor(1767, 2, 8)
END SUB