Sub Main(Player as Long)

If strcmp(GetPlayerUser(Player), "NaughtyMonki") | strcmp(GetPlayerUser(Player), "Endeavor") Then
	PlayerWarp(Player, 1867, 8, 8)
Else
	PlayerWarp(Player, 1867, 5, 8)
End If

End Sub