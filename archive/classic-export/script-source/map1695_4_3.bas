Sub Main(Player as Long)

If strcmp(GetPlayerUser(Player), "Zef") | strcmp(GetPlayerUser(Player), "NicolajBaltzer") | strcmp(GetPlayerUser(Player), "JackRabbit2") Then
	If GetPlayerDirection(Player) = Left Then
		PlayerWarp(Player, 1695, 3, 3)
	Else
		PlayerWarp(Player, 1695, 5, 3)
	End If
Else
	PlayerWarp(Player, 1695, 5, 3)
End If

End Sub