SUB Main(Player AS LONG)
	If StrCmp(GetPlayerName(Player), "Dom") Then OpenDoor(1726, 5, 6)
END SUB