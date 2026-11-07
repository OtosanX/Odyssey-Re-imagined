SUB Main(Player AS LONG)
   	If StrCmp(GetPlayerUser(Player), "zayos") Then OpenDoor(730, 8, 3)
	If StrCmp(GetPlayerUser(Player), "isaac") Then OpenDoor(730, 8, 3)
 END SUB