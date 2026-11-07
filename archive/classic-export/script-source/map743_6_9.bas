SUB Main(Player AS LONG)
	If StrCmp(GetPlayerUser(Player), "trick") Then PlayerWarp(Player, 743, 6, 11)
	If StrCmp(GetPlayerUser(Player), "benenen") Then PlayerWarp(Player, 743, 6, 11)
END SUB