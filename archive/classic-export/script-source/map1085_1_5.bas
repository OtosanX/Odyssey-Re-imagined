Sub Main(Player as Long)
	If StrCmp(GetPlayerUser(Player), "py2000") Then PlayerWarp(Player, 1085, 3, 5)
End Sub