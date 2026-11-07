Sub Main(Player as Long)

If strcmp(GetPlayerUser(Player), "FidelCastro") Then
	If GetPlayerDirection(Player) = Down Then
		PlayerWarp(Player, 1837, 2, 7)
	Else
		PlayerWarp(Player, 1837, 2, 5)
	End If
Else
	PlayerWarp(Player, 1837, 2, 5)
End If

End Sub