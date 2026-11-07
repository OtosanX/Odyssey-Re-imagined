Function Main(Player as Long) AS LONG
dim Strength as Long
''Strength Potion
Strength = 5

If GetPlayerFlag(Player, 125) > 0 Then
		TakeObj(Player, 445, 1)
	If GetPlayerFlag(Player, 122) = 0 Then
		CreatePlayerFloatText(Player, str(Strength), BrightMagenta)
		SetPlayerFlag(Player, 122, Strength)
		CalculateStats(Player)
		Timer(Player, 60, "Debuff")
	Else
		PlayerMessage(Player, "Its too danger to take more than one dose.", Grey)
	End If
Else
	PlayerMessage(Player, "You dont want to drink that, it could be anything...", Grey)
End If

End Function