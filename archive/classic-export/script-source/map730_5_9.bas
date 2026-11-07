SUB Main(Player AS LONG)
   	If StrCmp(GetPlayerUser(Player), "zayos") Then OpenDoor(730, 5, 8)
	If StrCmp(GetPlayerUser(Player), "isaac") Then OpenDoor(730, 5, 8)
 END SUB