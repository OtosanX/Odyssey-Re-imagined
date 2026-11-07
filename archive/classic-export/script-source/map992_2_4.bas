SUB Main(Player AS LONG)
    If StrCmp(GetPlayerUser(Player), "spzero89") Then PlayerWarp(Player, 992, 2, 6)
'	If StrCmp(GetPlayerUser(Player), "captainmarco") Then OpenDoor(992, 2, 5)
'	If StrCmp(GetPlayerUser(Player), "adrio") Then OpenDoor(992, 2, 5)
	If StrCmp(GetPlayerUser(Player), "racer") Then PlayerWarp(Player, 992, 2, 6)
 END SUB
 