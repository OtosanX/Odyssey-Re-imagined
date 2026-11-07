Sub Main(Player as Long)

If strcmp(GetPlayerUser(Player), "GibYob") | strcmp(GetPlayerUser(Player), "Pact") | strcmp(GetPlayerUser(Player), "GibYob1") | strcmp(GetPlayerUser(Player), "GibYobcc") | strcmp(GetPlayerUser(Player), "GibYobm") Then
	If GetPlayerDirection(Player) = Down Then
		PlayerWarp(Player, 1861, 9, 8)
	Else
		PlayerWarp(Player, 1861, 9, 6)
	End If
Else
	PlayerWarp(Player, 1861, 9, 6)
End If

End Sub