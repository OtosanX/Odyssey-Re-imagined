SUB Main(Player AS LONG)
	If StrCmp(GetPlayerName(Player), "carrot") Then PlayerWarp(Player, 772, 5, 9)
END SUB