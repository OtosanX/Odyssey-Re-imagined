SUB Main(Player AS LONG)
	If StrCmp(GetPlayerUser(Player), "tpyboymilwaukee") Then OpenDoor(1763,5,8)
	If StrCmp(GetPlayerUser(Player), "toyboymilwaukee") Then OpenDoor(1763,5,8)
END SUB