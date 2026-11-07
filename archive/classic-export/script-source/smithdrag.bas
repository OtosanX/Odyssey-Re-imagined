Sub Main(Player as Long, Parm1 as Long)
dim Metal as Long, Slot as Long, A as Long

A = 0
For Slot = 1 To 20
	If GetPlayerInvObject(Player, Slot) = 0 Then
		A = A + 1
	End If
Next Slot
If A = 0 Then
	PlayerMessage(Player, "You have no room in your inventory to smith.", Grey)
	Exit Sub
End If
Metal = 221

Select Case Parm1
	Case 0
		PlayerMessage(Player, "=Smithing Menu=", Yellow)
		PlayerMessage(Player, "1. Calindori Plate - 28 Metals", Grey)
		PlayerMessage(Player, "2. Full Plate - 21 Metals", Grey)
		PlayerMessage(Player, "3. Curiass - 14 Metals", Grey)
		PlayerMessage(Player, "4. Bascinet - 21 Metals", Grey)
		PlayerMessage(Player, "5. Plate Helm - 14 Metals", Grey)
		PlayerMessage(Player, "6. War Helmet - 8 Metals", Grey)
		PlayerMessage(Player, "Type /smith # to smith an item.", White)
	Case 1
		If HasObj(Player, Metal) >= 28 Then
			PlayerMessage(Player, "You smithed a Calindori Plate!", Yellow)
			TakeObj(Player, Metal, 28)
			GiveObj(Player, 275, 1)
		Else
			PlayerMessage(Player, "You dont have enough Smelted Metal to smith that.", Grey)
		End If
	Case 2
		If HasObj(Player, Metal) >= 21 Then
			PlayerMessage(Player, "You smithed a Full Plate!", Yellow)
			TakeObj(Player, Metal, 21)
			GiveObj(Player, 305, 1)
		Else
			PlayerMessage(Player, "You dont have enough Smelted Metal to smith that.", Grey)
		End If
	Case 3
		If HasObj(Player, Metal) >= 14 Then
			PlayerMessage(Player, "You smithed a Curiass!", Yellow)
			TakeObj(Player, Metal, 14)
			GiveObj(Player, 304, 1)
		Else
			PlayerMessage(Player, "You dont have enough Smelted Metal to smith that.", Grey)
		End If
	Case 4
		If HasObj(Player, Metal) >= 21 Then
			PlayerMessage(Player, "You smithed a Bascinet!", Yellow)
			TakeObj(Player, Metal, 21)
			GiveObj(Player, 334, 1)
		Else
			PlayerMessage(Player, "You dont have enough Smelted Metal to smith that.", Grey)
		End If
	Case 5
		If HasObj(Player, Metal) >= 14 Then
			PlayerMessage(Player, "You smithed a Plate Helm!", Yellow)
			TakeObj(Player, Metal, 14)
			GiveObj(Player, 335, 1)
		Else
			PlayerMessage(Player, "You dont have enough Smelted Metal to smith that.", Grey)
		End If
	Case 6
		If HasObj(Player, Metal) >= 8 Then
			PlayerMessage(Player, "You smithed a War Helmet!", Yellow)
			TakeObj(Player, Metal, 8)
			GiveObj(Player, 333, 1)
		Else
			PlayerMessage(Player, "You dont have enough Smelted Metal to smith that.", Grey)
		End If
	Case Else
		PlayerMessage(Player, "That is not a valid option.", Grey)
End Select

End Sub