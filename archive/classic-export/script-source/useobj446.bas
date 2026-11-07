Function Main(Player as Long) AS LONG
dim Strength as Long
''Vigorous Potion
Strength = 7

If GetPlayerFlag(Player, 125) > 0 Then
		TakeObj(Player, 446, 1)
	If GetPlayerFlag(Player, 123) = 0 Then
		CreatePlayerFloatText(Player, str(Strength), BrightCyan)
		SetPlayerFlag(Player, 123, Strength)
		CalculateStats(Player)
		Timer(Player, 50, "Debuff")
	End If
Else
	PlayerMessage(Player, "You dont want to drink that, it could be anything...", Grey)
End If

End Function