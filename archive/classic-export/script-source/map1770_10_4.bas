SUB Main(Player AS LONG)
	If StrCmp(GetPlayerName(Player), "Ehrlich") Then PlayerWarp(Player, 1770, 10, 6)
	If StrCmp(GetPlayerUser(Player), "kramew") Then PlayerWarp(Player, 1770, 10, 6)
	If StrCmp(GetPlayerName(Player), "Lord Tobers") Then PlayerWarp(Player, 1770, 10, 6)
END SUB