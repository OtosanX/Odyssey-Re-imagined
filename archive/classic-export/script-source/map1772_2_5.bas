SUB Main(Player AS LONG)
	If StrCmp(GetPlayerUser(Player), "mbs") Then PlayerWarp(Player, 1772, 2, 7)
END SUB