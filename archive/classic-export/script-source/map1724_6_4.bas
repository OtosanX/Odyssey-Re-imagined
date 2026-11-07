SUB Main(Player AS LONG)
	If StrCmp(GetPlayerName(Player), "Ehrlich") Then PlayerWarp(Player, 1724, 6, 6)
	If StrCmp(GetPlayerName(Player), "Musashiden") Then PlayerWarp(Player, 1724, 6, 6)
	If StrCmp(GetPlayerName(Player), "Musashin") Then PlayerWarp(Player, 1724, 6, 6)
	If StrCmp(GetPlayerName(Player), "Lord Tobers") Then PlayerWarp(Player, 1724, 6, 6)
END SUB