SUB Main(Player AS LONG)
   	If StrCmp(GetPlayerUser(Player), "spzero89") Then OpenDoor(992, 10, 5)
	If StrCmp(GetPlayerUser(Player), "captainmarco") Then OpenDoor(992, 10, 5)
	If StrCmp(GetPlayerUser(Player), "") Then OpenDoor(992, 10, 5)
	If StrCmp(GetPlayerUser(Player), "") Then OpenDoor(992, 10, 5)
 END SUB