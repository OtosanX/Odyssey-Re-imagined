Function Main(Player as Long) AS LONG

'Pure Ore => 
	If HasObj(Player, 218) Then
			TakeObj(Player, 218, 1)
			GiveObj(Player, 221, 1)
			PlayerMessage(Player, "You've smelted a Pure Ore into some Smelted Ore!", Yellow)
			Exit Function
	Else
'Flawed Ore => 
		If HasObj(Player, 217) >= 100 Then
				TakeObj(Player, 217, 100)
				GiveObj(Player, 221, 1)
				PlayerMessage(Player, "You've smelted 100 Flawed Ore into some Smelted Ore!", Yellow)
				Exit Function
		Else
'Coarse Ore => 
			If HasObj(Player, 216) >= 200 Then
				TakeObj(Player, 216, 200)
				GiveObj(Player, 221, 1)
				PlayerMessage(Player, "You've smelted 200 Coarse Ore into some Smelted Ore!", Yellow)
				Exit Function
			Else
				PlayerMessage(Player, "You do not have the ore required to smelt", White)
			End If
		End If
	End If

End Function