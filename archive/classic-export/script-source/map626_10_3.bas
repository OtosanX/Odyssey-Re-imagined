Sub Main(Player as Long)

' | strcmp(GetPlayerUser(Player), "grassmonkey") 
If strcmp(GetPlayerUser(Player), "s2000roja") Then
	If GetPlayerDirection(Player) = Up Then
		PlayerWarp(Player, 626, 10, 2)
	Else
		PlayerWarp(Player, 626, 10, 4)
	End If
Else
	PlayerWarp(Player, 626, 10, 4)
End If

End Sub