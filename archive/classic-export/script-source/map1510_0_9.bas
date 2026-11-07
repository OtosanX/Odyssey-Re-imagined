Sub Main(Player as Long)

If strcmp(GetPlayerUser(Player), "Xantem") Then
	PlayerWarp(Player, 1510, 1, 5)
Else
	PlayerWarp(Player, 1510, 1, 9)
End If

End Sub