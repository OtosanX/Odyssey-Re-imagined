Function Main(Player as Long) AS LONG
dim Strength as Long
''Stout Potion
Strength = 20

If GetPlayerFlag(Player, 125) > 0 Then
	If GetPlayerHP(Player) = GetPlayerMaxHP(Player) Then
			TakeObj(Player, 447, 1)
		If GetPlayerFlag(Player, 124) = 0 Then
			CreatePlayerFloatText(Player, str(Divide(Strength, 2)), Brown)
			SetPlayerFlag(Player, 124, Strength)
			CalculateStats(Player)
			Timer(Player, 60, "Debuff")
		End If
	Else
		PlayerMessage(Player, "You must be full health to use this potion.", Grey)
	End If
Else
	PlayerMessage(Player, "You dont want to drink that, it could be anything...", Grey)
End If

End Function