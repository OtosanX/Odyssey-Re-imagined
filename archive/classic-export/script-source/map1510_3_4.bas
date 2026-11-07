Sub Main(Player as Long)

If strcmp(GetPlayerUser(Player), "Xantem") Then
	PlayerWarp(Player, 1510, 11, 6)
Else
	PlayerWarp(Player, 1510, 3, 5)
End If

End Sub