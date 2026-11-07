Sub Main(Player as Long)

If strcmp(GetPlayerUser(Player), "Xantem") Then
	PlayerWarp(Player, 1511, 10, 1)
Else
	PlayerWarp(Player, 1511, 5, 10)
End If

End Sub