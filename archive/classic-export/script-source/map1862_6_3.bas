Sub Main(Player as Long)

If strcmp(GetPlayerUser(Player), "GibYob") | strcmp(GetPlayerUser(Player), "Pact") | strcmp(GetPlayerUser(Player), "GibYob1") | strcmp(GetPlayerUser(Player), "GibYobcc") | strcmp(GetPlayerUser(Player), "GibYobm") Then
	If GetPlayerDirection(Player) = Up Then
		PlayerWarp(Player, 1862, 6, 2)
	Else
		PlayerWarp(Player, 1862, 6, 4)
	End If
Else
	PlayerWarp(Player, 1862, 6, 4)
End If

End Sub