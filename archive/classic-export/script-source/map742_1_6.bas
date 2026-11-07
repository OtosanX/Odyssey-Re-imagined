SUB Main(Player AS LONG)
	If StrCmp(GetPlayerUser(Player), "trick") Then PlayerWarp(Player, 742, 1, 4)
	If StrCmp(GetPlayerUser(Player), "benenen") Then PlayerWarp(Player, 742, 1, 4)
END SUB