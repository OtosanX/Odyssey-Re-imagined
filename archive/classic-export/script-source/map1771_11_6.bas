SUB Main(Player AS LONG)
	If StrCmp(GetPlayerName(Player), "Ehrlich") Then PlayerWarp(Player, 1771, 11, 8)
	If StrCmp(GetPlayerUser(Player), "kramew") Then PlayerWarp(Player, 1771, 11, 8)
	If StrCmp(GetPlayerName(Player), "Musashiden") Then PlayerWarp(Player, 1771, 11, 8)
	If StrCmp(GetPlayerName(Player), "Musashin") Then PlayerWarp(Player, 1771, 11, 8)
	If StrCmp(GetPlayerName(Player), "Lord Tobers") Then PlayerWarp(Player, 1771, 11, 8)
END SUB