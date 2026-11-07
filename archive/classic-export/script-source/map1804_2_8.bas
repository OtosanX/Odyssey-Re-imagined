Sub Main(Player as Long)

If strcmp(GetPlayerUser(Player), "Rexxy") Then
	If GetPlayerDirection(Player) = Down Then
		PlayerWarp(Player, 1804, 2, 9)
	Else
		PlayerWarp(Player, 1804, 2, 7)
	End If
Else
	PlayerWarp(Player, 1804, 2, 7)
End If

End Sub