Sub Main(Player as Long)

If GetPlayerFlag(Player, 210) <> GetPlayerMap(Player) Then
	If GetPlayerFlag(Player, 210) > 0 & GetPlayerFlag(Player, 210) < 2000 Then
		If GetPlayerFlag(Player, 210) = 554 Then 'Trading Rooms
			SetPlayerFlag(Player, 210, 1960)
			SetPlayerFlag(Player, 211, 5)
			SetPlayerFlag(Player, 212, 5)
		End If
		PlayerWarp(Player, GetPlayerFlag(Player, 210), GetPlayerFlag(Player, 211), GetPlayerFlag(Player, 212))
	Else
		PlayerWarp(Player, 8, 9, 7)
	End If
Else
	PlayerWarp(Player, 8, 9, 7)
End If

End Sub