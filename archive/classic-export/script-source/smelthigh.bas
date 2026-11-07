Function Main(Player as Long) AS LONG

'Pure Ore => Pure Metal
	If HasObj(Player, 218) >= 5 Then
		TakeObj(Player, 218, 5)
		GiveObj(Player, 448, 1)
		PlayerMessage(Player, "You've smelted 5 Pure Ore into some Devilkin Metal!", Yellow)
		Exit Function
	Else
		If HasObj(Player, 221) >= 5 Then
			TakeObj(Player, 221, 5)
			GiveObj(Player, 448, 1)
			PlayerMessage(Player, "You've smelted 5 Smelted Metals into some Devilkin Metal!", Yellow)
			Exit Function
		Else
			PlayerMessage(Player, "You require 5 Pure Ore to smelt into Devilkin Metal", Grey)
		End If
	End If

End Function