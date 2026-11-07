Sub Main(Player as Long)

If strcmp(GetPlayerUser(Player), "Rexxy") Then
	If GetPlayerDirection(Player) = Down Then
		PlayerWarp(Player, 1837, 9, 7)
	Else
		PlayerWarp(Player, 1837, 9, 5)
	End If
Else
	PlayerWarp(Player, 1837, 9, 5)
End If

End Sub