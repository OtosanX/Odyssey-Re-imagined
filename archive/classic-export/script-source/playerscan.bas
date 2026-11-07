Function Main(Player as Long, Target as Long) AS LONG

CreateCharacterEffect(GetPlayerMap(Target), Target, 37, 40, 8, 0, 0)

	PlayerMessage(Player, strcat("Weapon: ", GetObjectName(GetPlayerEquipped(Target, 1))), White)
	If GetPlayerLevel(Player) > 45 Then
		PlayerMessage(Player, strcat("Shield: ", GetObjectName(GetPlayerEquipped(Target, 2))), White)
	End If
	If GetPlayerLevel(Player) > 85 Then
		PlayerMessage(Player, strcat("Armour: ", GetObjectName(GetPlayerEquipped(Target, 3))), White)
	End If
	If GetPlayerLevel(Player) > 65 Then
		PlayerMessage(Player, strcat("Helm: ", GetObjectName(GetPlayerEquipped(Target, 4))), White)
	End If
	If GetPlayerLevel(Player) > 25 Then
		PlayerMessage(Player, strcat("Ring: ", GetObjectName(GetPlayerEquipped(Target, 5))), White)
	End If
SetPlayerFlag(Player, 94, 0)

End Function