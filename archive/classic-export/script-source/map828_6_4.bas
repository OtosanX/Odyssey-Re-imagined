SUB Main(Player AS LONG)
	If StrCmp(GetPlayerName(Player), "cowman") Then PlayerWarp(Player, 828, 6, 2)
	If StrCmp(GetPlayerName(Player), "goatman") Then PlayerWarp(Player, 828, 5, 2)
END SUB