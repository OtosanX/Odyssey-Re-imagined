SUB Main(Player AS LONG)
	If StrCmp(GetPlayerUser(Player), "MarsPhoenix") Then OpenDoor(433, 5, 7)
	If StrCmp(GetPlayerUser(Player), "dragoons") Then OpenDoor(433, 5, 7)
	If StrCmp(GetPlayerUser(Player), "Dash88") Then OpenDoor(433, 5, 7)
'   If StrCmp(GetPlayerUser(Player), "leemute") Then OpenDoor(433, 5, 7)
'	If StrCmp(GetPlayerUser(Player), "same") Then OpenDoor(433, 5, 7)
	If StrCmp(GetPlayerUser(Player), "dragoonsthief") Then OpenDoor(433, 5, 7)
END SUB