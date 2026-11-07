Sub Main(Player as Long, Parm1 as Long)
dim Metal as Long

Metal = 221

Select Case Parm1
	Case 0
		PlayerMessage(Player, "=Repair Menu=", Yellow)
		PlayerMessage(Player, "1. Hero's Guard - 30 Metals", Grey)
		PlayerMessage(Player, "2. Soulbinders - 10 Metals", Grey)
		PlayerMessage(Player, "Type /smith # to repair an item.", White)
	Case 1
		If HasObj(Player, Metal) >= 30 Then
			PlayerMessage(Player, "You repair a Hero's Guard!", Yellow)
			TakeObj(Player, Metal, 30)
			TakeObj(Player, 248, 1)
			GiveObj(Player, 248, 1)
		Else
			PlayerMessage(Player, "You dont have enough Smelted Metal to repair that.", Grey)
		End If
	Case 2
		If HasObj(Player, Metal) >= 10 Then
			PlayerMessage(Player, "You repair some Soulbinders!", Yellow)
			TakeObj(Player, Metal, 10)
			TakeObj(Player, 117, 1)
			GiveObj(Player, 117, 1)
		Else
			PlayerMessage(Player, "You dont have enough Smelted Metal to repair that.", Grey)
		End If
	Case Else
		PlayerMessage(Player, "That is not a valid option.", Grey)
End Select

End Sub