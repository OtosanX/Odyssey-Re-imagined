Function Main(Player as Long) AS LONG
dim Strength as Long
''Sharp Potion
Strength = 7

If GetPlayerFlag(Player, 125) > 0 Then
		TakeObj(Player, 449, 1)
	If GetPlayerFlag(Player, 126) = 0 Then
		CreatePlayerFloatText(Player, str(Strength), BrightBlue)
		SetPlayerFlag(Player, 126, Strength)
		CalculateStats(Player)
		Timer(Player, 15, "Debuff")
	End If
Else
	PlayerMessage(Player, "You dont want to drink that, it could be anything...", Grey)
End If

End Function