Sub Main(Player as Long)

If strcmp(GetPlayerUser(Player), "frankbob") Then
	PlayerWarp(Player, 1886, 7, 6)
Else
	PlayerWarp(Player, 1886, 7, 10)
End If

End Sub