Sub Main(Player as Long)

If strcmp(GetPlayerUser(Player), "Fankgod") Then
	If GetPlayerDirection(Player) = 0 Then
		PlayerWarp(Player, 1987, 4, 2)
	Else
		PlayerWarp(Player, 1987, 4, 4)
	End If
Else
	PlayerWarp(Player, 1987, 4, 4)
End If

End Sub