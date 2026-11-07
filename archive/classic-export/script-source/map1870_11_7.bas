Sub Main(Player as Long)

If strcmp(GetPlayerUser(Player), "tyu") | strcmp(GetPlayerUser(Player), "ville") Then
	PlayerWarp(Player, 1871, 6, 9)
Else
	PlayerWarp(Player, 1870, 11, 8)
End If

End Sub