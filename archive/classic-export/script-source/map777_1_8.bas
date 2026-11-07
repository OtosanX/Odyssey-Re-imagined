Sub Main(Player as Long)

If strcmp(GetPlayerUser(Player), "darkbuddy102938") Then
	If GetPlayerDirection(Player) = Down Then
		PlayerWarp(Player, 777, 1, 9)
	Else
		PlayerWarp(Player, 777, 1, 7)
	End If
Else
	PlayerWarp(Player, 777, 1, 7)
End If

End Sub