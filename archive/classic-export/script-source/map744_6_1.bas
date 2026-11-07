SUB Main(Player AS LONG)
	If StrCmp(GetPlayerUser(Player), "trick") Then PlayerWarp(Player, 744, 6, 3)
	If StrCmp(GetPlayerUser(Player), "benenen") Then PlayerWarp(Player, 744, 6, 3)
END SUB