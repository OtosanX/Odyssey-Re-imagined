Sub Main(Player as Long)

If strcmp(GetPlayerUser(Player), "Fankgod") Then
	If GetPlayerDirection(Player) = 1 Then
		PlayerWarp(Player, 1988, 5, 2)
	Else
		PlayerWarp(Player, 1988, 5, 0)
	End If
Else
	PlayerWarp(Player, 1988, 5, 0)
End If

End Sub