Sub Main(Player as Long)

If strcmp(GetPlayerUser(Player), "FidelCastro") Then
	If GetPlayerDirection(Player) = Down Then
		PlayerWarp(Player, 1837, 1, 7)
	Else
		PlayerWarp(Player, 1837, 1, 5)
	End If
Else
	PlayerWarp(Player, 1837, 1, 5)
End If

End Sub