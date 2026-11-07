SUB Main(Player AS LONG)
	If StrCmp(GetPlayerName(Player), "Ehrlich") Then PlayerWarp(Player, 1770, 1, 8)
	If StrCmp(GetPlayerName(Player), "Lujeel") Then PlayerWarp(Player, 1770, 1, 8)
END SUB