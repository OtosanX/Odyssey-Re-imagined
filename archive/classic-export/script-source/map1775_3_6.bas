Sub Main(Player as Long)

If StrCmp(GetPlayerUser(Player), "Excel") Then
	PlayerWarp(Player, 1775, 1, 8)
Else
	PlayerWarp(Player, 1775, 4, 6)
End If

End Sub