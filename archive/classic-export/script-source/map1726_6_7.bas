SUB Main(Player AS LONG)
	If StrCmp(GetPlayerName(Player), "Dom") Then OpenDoor(1726, 6, 6)
END SUB