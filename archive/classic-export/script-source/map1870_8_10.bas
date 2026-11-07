Sub Main(Player as Long)

If strcmp(GetPlayerUser(Player), "tyu") | strcmp(GetPlayerUser(Player), "ville") Then
	PlayerWarp(Player, 1870, 9, 1)
Else
	PlayerWarp(Player, 1870, 9, 10)
End If

End Sub