Sub Main(Player as Long)

If strcmp(GetPlayerUser(Player), "sirspanksalot") Then
	PlayerWarp(Player, 632, 9, 6)
Else
	PlayerWarp(Player, 632, 9, 10)
End If

End Sub