Sub Main(Player as Long)

'Coarse Ore => 
	If HasObj(Player, 216) >= 10 Then
			TakeObj(Player, 216, 10)
			GiveObj(Player, 221, 1)
			PlayerMessage(Player, "You've smelted 10 Coarse Ore into some Smelted Metal!", Yellow)
			Exit Sub
	Else
'Flawed Ore => 
		If HasObj(Player, 217) >= 5 Then
				TakeObj(Player, 217, 5)
				GiveObj(Player, 221, 1)
				PlayerMessage(Player, "You've smelted 5 Flawed Ore into some Smelted Metal!", Yellow)
				Exit Sub
		Else
'Pure Ore => 
			If HasObj(Player, 218) Then
				TakeObj(Player, 218, 1)
				GiveObj(Player, 221, 1)
				PlayerMessage(Player, "You've smelted a Pure Ore into some Smelted Metal!", Yellow)
				Exit Sub
			Else
				PlayerMessage(Player, "You require 1 Pure Ore, 5 Flawed Ores or 10 Coarse Ore to smelt into Metal.", White)
			End If
		End If
	End If
	
End Sub