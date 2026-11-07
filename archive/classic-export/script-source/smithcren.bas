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
		PlayerMessage(Player, "1. Claymore - 35 Metals", Grey)
		PlayerMessage(Player, "2. Battle Axe - 28 Metals", Grey)
		PlayerMessage(Player, "3. Morning Star - 24 Metals", Grey)
		PlayerMessage(Player, "4. Rapier - 17 Metals", Grey)
		PlayerMessage(Player, "5. War Mace - 14 Metals", Grey)
		PlayerMessage(Player, "6. Scimitar - 8 Metals", Grey)
		PlayerMessage(Player, "Type /smith # to smith an item.", White)
	Case 1
		If HasObj(Player, Metal) >= 35 Then
			PlayerMessage(Player, "You smithed a Claymore!", Yellow)
			TakeObj(Player, Metal, 35)
			GiveObj(Player, 28, 1)
		Else
			PlayerMessage(Player, "You dont have enough Smelted Metal to smith that.", Grey)
		End If
	Case 2
		If HasObj(Player, Metal) >= 28 Then
			PlayerMessage(Player, "You smithed a Battle Axe!", Yellow)
			TakeObj(Player, Metal, 28)
			GiveObj(Player, 2, 1)
		Else
			PlayerMessage(Player, "You dont have enough Smelted Metal to smith that.", Grey)
		End If
	Case 3
		If HasObj(Player, Metal) >= 24 Then
			PlayerMessage(Player, "You smithed a Morning Star!", Yellow)
			TakeObj(Player, Metal, 24)
			GiveObj(Player, 8, 1)
		Else
			PlayerMessage(Player, "You dont have enough Smelted Metal to smith that.", Grey)
		End If
	Case 4
		If HasObj(Player, Metal) >= 17 Then
			PlayerMessage(Player, "You smithed a Rapier!", Yellow)
			TakeObj(Player, Metal, 17)
			GiveObj(Player, 22, 1)
		Else
			PlayerMessage(Player, "You dont have enough Smelted Metal to smith that.", Grey)
		End If
	Case 5
		If HasObj(Player, Metal) >= 14 Then
			PlayerMessage(Player, "You smithed a War Mace!", Yellow)
			TakeObj(Player, Metal, 14)
			GiveObj(Player, 3, 1)
		Else
			PlayerMessage(Player, "You dont have enough Smelted Metal to smith that.", Grey)
		End If
	Case 6
		If HasObj(Player, Metal) >= 8 Then
			PlayerMessage(Player, "You smithed a Scimitar!", Yellow)
			TakeObj(Player, Metal, 8)
			GiveObj(Player, 17, 1)
		Else
			PlayerMessage(Player, "You dont have enough Smelted Metal to smith that.", Grey)
		End If
	Case Else
		PlayerMessage(Player, "That is not a valid option.", Grey)
End Select

End Sub