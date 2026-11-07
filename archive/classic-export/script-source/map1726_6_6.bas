SUB Main(Player AS LONG)
	If StrCmp(GetPlayerName(Player), "Dom") Then OpenDoor(1726, 6, 5)
	If StrCmp(GetPlayerName(Player), "carrot") Then OpenDoor(1726, 5, 5)
END SUB