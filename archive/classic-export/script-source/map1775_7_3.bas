Sub Main(Player as Long)

If StrCmp(GetPlayerUser(Player), "Excel") Then
	PlayerWarp(Player, 1775, 5, 5)
Else
	PlayerWarp(Player, 1775, 7, 4)
End If

End Sub