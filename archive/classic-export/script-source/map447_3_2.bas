Sub Main(Player as Long)
dim Cost as Long
Cost = 3000
PlayerWarp(Player, 447, 3, 3)

If GetPlayerFlag(Player, 109) = 0 Then
	If HasObj(Player, 6) >= Cost Then
		TakeObj(Player, 6, Cost)
		SetPlayerEnergy(Player, GetPlayerMaxEnergy(Player))
		PlayerMessage(Player, "You take a drink and are restored to full Energy!", White)
		SetPlayerFlag(Player, 109, 1)
		Timer(Player, 3, "PushTimer")
		SetFlag(111, GetFlag(111) + Cost) 'Gold Collected
	Else
		PlayerMessage(Player, strcat("Dragonian Miner says, ''That'll cost you ", strcat(str(Cost), " Gold.''")), Grey)
	End If
End If

End Sub