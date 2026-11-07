SUB Main(Player AS LONG)
	If StrCmp(GetPlayerUser(Player), "spzero89") Then OpenDoor(993, 2, 6)
	If StrCmp(GetPlayerUser(Player), "captainmarco") Then OpenDoor(993, 2, 6)
	If StrCmp(GetPlayerUser(Player), "racer") Then OpenDoor(1263, 2, 6)
'	If StrCmp(GetPlayerUser(Player), "tr2") Then OpenDoor(1263, 2, 6)
 END SUB