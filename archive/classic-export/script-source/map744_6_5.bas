SUB Main(Player AS LONG)
	If StrCmp(GetPlayerUser(Player), "trick") Then PlayerWarp(Player, 744, 6, 7)
	If StrCmp(GetPlayerUser(Player), "benenen") Then PlayerWarp(Player, 744, 6, 7)
END SUB