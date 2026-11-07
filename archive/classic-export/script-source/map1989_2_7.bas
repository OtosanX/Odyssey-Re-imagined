SUB Main(Player AS LONG)
	If StrCmp(GetPlayerUser(Player), "soulreaper") | StrCmp(GetPlayerUser(Player), "soulreaper2") Then PlayerWarp(Player, 1989, 2, 5)
END SUB