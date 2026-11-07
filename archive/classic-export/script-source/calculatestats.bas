Function Main(Player as Long) AS LONG

'Cleric Self Buff Endurance
If GetPlayerFlag(Player, 120) > 0 Then
	SetPlayerEndurance(Player, GetPlayerEndurance(Player) + GetPlayerFlag(Player, 120))
End If

'Cleric Self Buff Agility
If GetPlayerFlag(Player, 121) > 0 Then
	SetPlayerIntelligence(Player, GetPlayerAgility(Player) + GetPlayerFlag(Player, 121))
End If

'Cleric Self Buff Intelligence
If GetPlayerFlag(Player, 122) > 0 Then
	SetPlayerAgility(Player, GetPlayerIntelligence(Player) + GetPlayerFlag(Player, 122))
End If

'Knight Self Strength Buff - Adrenaline
If GetPlayerFlag(Player, 123) > 0 Then
	SetPlayerStrength(Player, GetPlayerStrength(Player) + GetPlayerFlag(Player, 123))
End If

'Artifact - Babylonian Torch - Endurance
If GetPlayerFlag(Player, 124) > 0 Then
	SetPlayerEndurance(Player, GetPlayerEndurance(Player) + GetPlayerFlag(Player, 124))
End If

'Artifact - Dragonian Candle - Agility
If GetPlayerFlag(Player, 126) > 0 Then
	SetPlayerIntelligence(Player, GetPlayerAgility(Player) + GetPlayerFlag(Player, 126))
End If

'Titan Take Down
If GetPlayerFlag(Player, 10) = 4 & GetPlayerFlag(Player, 11) = 2 Then
	SetPlayerStrength(Player, GetPlayerStrength(Player) + 20)
	SetPlayerConcentration(Player, GetPlayerConcentration(Player) + 20)
	SetPlayerEndurance(Player, GetPlayerEndurance(Player) + 21)
	SetPlayerConstitution(Player, GetPlayerConstitution(Player) + 60)
End If

End Function