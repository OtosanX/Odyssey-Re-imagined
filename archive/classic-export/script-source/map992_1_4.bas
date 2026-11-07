SUB Main(Player AS LONG)
   	If StrCmp(GetPlayerUser(Player), "spzero89") Then OpenDoor(992, 1, 5)
	If StrCmp(GetPlayerUser(Player), "captainmarco") Then OpenDoor(992, 1, 5)
	If StrCmp(GetPlayerUser(Player), "") Then OpenDoor(1992, 8, 2)
	If StrCmp(GetPlayerUser(Player), "") Then OpenDoor(992, 8, 2)
 END SUB