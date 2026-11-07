Function Main(Player as Long) AS LONG

If GetPlayerLevel(Player) >= 30 Then
	If GetPlayerFlag(Player, 92) = 2 Then
		PlayerMessage(Player, "Ness Atoui says, ''OI, thought you could get away with that one didn't you!", Grey)
		SetPlayerFlag(Player, 92, 0)
		TakeObj(Player, 280, 1)
	End If
End If

End Function