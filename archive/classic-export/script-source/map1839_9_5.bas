Sub Main(Player as Long)

If strcmp(GetPlayerUser(Player), "Rexxy") Then
	PlayerWarp(Player, 1839, 9, 7)
Else
	PlayerWarp(Player, 1839, 9, 4)
End If

End Sub