Sub Main(Player as Long)

If strcmp(GetPlayerUser(Player), "Xantem") Then
	PlayerWarp(Player, 1511, 2, 7)
Else
	PlayerWarp(Player, 1511, 9, 11)
End If

End Sub