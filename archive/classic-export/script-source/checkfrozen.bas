Function Main(Player as Long) AS LONG

If GetPlayerFlag(Player, 3) = 0 Then
	If GetPlayerFlag(Player, 4) = 0 Then
		SetPlayerFlag(Player, 3, 1)
		SetPlayerFlag(Player, 4, 1)
		Timer(Player, 10, "ResetFreeze")
			SetPlayerFlag(Player, 21, GetPlayerX(Player))
			SetPlayerFlag(Player, 22, GetPlayerY(Player))
			SetPlayerFlag(Player, 24, GetPlayerMap(Player))
		PlayerMessage(Player, "Please wait while you are unfrozen.", Grey)
		Timer(Player, 1, "unfreeze")
		'MapMessage(GetPlayerMap(Player), str(GetPlayerFlag(Player, 21)), White)
	Else
		PlayerMessage(Player, "You must wait to request another unfreeze.", Grey)
	End If
Else
	PlayerMessage(Player, "You must wait to request another unfreeze.", Grey)
End If

End Function