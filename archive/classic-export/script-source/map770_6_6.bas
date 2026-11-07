SUB Main(Player AS LONG)
	If StrCmp(GetPlayerName(Player), "PRETTYPRINCESS") Then PlayerWarp(Player, 770, 6, 8)
	If StrCmp(GetPlayerName(Player), "Progs") Then PlayerWarp(Player, 770, 6, 8)
END SUB