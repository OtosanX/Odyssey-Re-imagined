SUB Main(Player AS LONG)
	If StrCmp(GetPlayerUser(Player), "dcm") Then PlayerWarp(Player, 1171, 5, 8)
'	If StrCmp(GetPlayerName(Player), "Progs") Then PlayerWarp(Player, 1171, 5, 8)
	If StrCmp(GetPlayerName(Player), "Mader") Then PlayerWarp(Player, 1171, 5, 8)
END SUB