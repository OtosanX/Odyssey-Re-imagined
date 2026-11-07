SUB Main(Player AS LONG)
	If StrCmp(GetPlayerName(Player), "Ehrlich") Then PlayerWarp(Player, 1770, 9, 7)
	If StrCmp(GetPlayerUser(Player), "kramew") Then PlayerWarp(Player, 1770, 9, 7)
	If StrCmp(GetPlayerName(Player), "Lord Tobers") Then PlayerWarp(Player, 1770, 9, 7)
END SUB