Sub Main(Player as Long)

If strcmp(GetPlayerUser(Player), "archmage") Then
	PlayerWarp(Player, 1857, 7, 0)
Else
	PlayerWarp(Player, 1857, 6, 1)
End If

End Sub