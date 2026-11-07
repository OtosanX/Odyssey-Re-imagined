SUB Main(Player AS LONG)
	If StrCmp(GetPlayerUser(Player), "Talon") Then PlayerWarp(Player, 1272, 10, 5)
	If StrCmp(GetPlayerUser(Player), "Sharkhan") Then PlayerWarp(Player, 1272, 10, 5)
	If StrCmp(GetPlayerUser(Player), "Kit") Then PlayerWarp(Player, 1272, 10, 5)
	If StrCmp(GetPlayerUser(Player), "Bluebayou") Then PlayerWarp(Player, 1272, 10, 5)
END SUB