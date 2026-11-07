SUB Main(Player AS LONG)
	If StrCmp(GetPlayerUser(Player), "trick") Then PlayerWarp(Player, 743, 6, 8)
	If StrCmp(GetPlayerUser(Player), "benenen") Then PlayerWarp(Player, 743, 6, 8)
END SUB