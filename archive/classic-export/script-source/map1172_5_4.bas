SUB Main(Player AS LONG)
	If StrCmp(GetPlayerUser(Player), "dcm") Then PlayerWarp(Player, 1172, 5, 2)
'	If StrCmp(GetPlayerName(Player), "Progs") Then PlayerWarp(Player, 1172, 5, 2)
	If StrCmp(GetPlayerName(Player), "Mader") Then PlayerWarp(Player, 1172, 5, 2)
END SUB