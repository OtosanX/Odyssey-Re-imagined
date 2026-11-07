Function Main(Player as Long, Target as Long) AS LONG
dim Loop as Long

	PlayerMessage(Player, GetPlayerName(Target), Yellow)
For Loop = 1 To 20
	PlayerMessage(Player, GetObjectName(GetPlayerInvObject(Target, Loop)), White)
Next Loop

	PlayerMessage(Player, "Equipped", Yellow)
For Loop = 1 To 5
	PlayerMessage(Player, GetObjectName(GetPlayerEquipped(Target, Loop)), White)
Next Loop
PlayerMessage(Player, strcat("HP: ", str(GetPlayerHP(Target))), Green)
PlayerMessage(Player, strcat("Energy: ", str(GetPlayerMaxEnergy(Target))), Green)
End Function