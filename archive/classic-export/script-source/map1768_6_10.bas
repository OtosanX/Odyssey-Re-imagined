SUB Main(Player AS LONG)
	If StrCmp(GetPlayerName(Player), "TaloN") Then PlayerWarp(Player, 1768, 6, 8)
	If StrCmp(GetPlayerName(Player), "Horror") Then PlayerWarp(Player, 1768, 6, 8)
END SUB