Sub Main(Player as Long)

If StrCmp(GetPlayerUser(Player), "Excel") Then
	PlayerWarp(Player, 1775, 10, 8)
Else
	PlayerWarp(Player, 1775, 7, 6)
End If

End Sub