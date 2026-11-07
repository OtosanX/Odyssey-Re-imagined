SUB Main(Player AS LONG)
	If StrCmp(GetPlayerName(Player), "Ehrlich") Then PlayerWarp(Player, 1771, 6, 7)
	If StrCmp(GetPlayerName(Player), "Lujeel") Then PlayerWarp(Player, 1771, 6, 7)
END SUB