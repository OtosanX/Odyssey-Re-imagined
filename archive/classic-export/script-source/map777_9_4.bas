Sub Main(Player as Long)

If strcmp(GetPlayerUser(Player), "darkbuddy102938") Then
	If GetPlayerDirection(Player) = Up Then
		PlayerWarp(Player, 777, 9, 3)
	Else
		PlayerWarp(Player, 777, 9, 5)
	End If
Else
	PlayerWarp(Player, 777, 9, 5)
End If

End Sub