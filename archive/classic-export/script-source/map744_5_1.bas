SUB Main(Player AS LONG)
	If StrCmp(GetPlayerUser(Player), "trick") Then PlayerWarp(Player, 744, 5, 3)
	If StrCmp(GetPlayerUser(Player), "benenen") Then PlayerWarp(Player, 744, 5, 3)
END SUB