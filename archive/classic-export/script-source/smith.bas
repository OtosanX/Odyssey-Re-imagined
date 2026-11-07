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

If GetPlayerMap(Player) = 4 Then
	Select Case Parm1
		Case 0
			PlayerMessage(Player, "=Smithing Menu=", Yellow)
			PlayerMessage(Player, "1. Assassin Dagger - 20 Metals", Grey)
			PlayerMessage(Player, "2. Protection Ring - 25 Metals", Grey)
			PlayerMessage(Player, "3. Dragon Tooth - 50 Metals", Grey)
			PlayerMessage(Player, "4. Sun Blade - 70 Metals", Grey)
			PlayerMessage(Player, "5. Excalibur - 100 Metals", Grey)
			PlayerMessage(Player, "Type /smith # to smith an item.", White)
		Case 1
			If HasObj(Player, Metal) >= 20 Then
				PlayerMessage(Player, "You smithed an Assassin Dagger!", Yellow)
				TakeObj(Player, Metal, 20)
				GiveObj(Player, 95, 1)
			Else
				PlayerMessage(Player, "You dont have enough Smelted Metal to smith that.", Grey)
			End If
		Case 2
			If HasObj(Player, Metal) >= 25 Then
				PlayerMessage(Player, "You smithed a Protection Ring!", Yellow)
				TakeObj(Player, Metal, 25)
				GiveObj(Player, 214, 1)
			Else
				PlayerMessage(Player, "You dont have enough Smelted Metal to smith that.", Grey)
			End If
		Case 3
			If HasObj(Player, Metal) >= 50 Then
				PlayerMessage(Player, "You smithed a Dragon Tooth!", Yellow)
				TakeObj(Player, Metal, 50)
				GiveObj(Player, 121, 1)
			Else
				PlayerMessage(Player, "You dont have enough Smelted Metal to smith that.", Grey)

			End If
		Case 4
			If HasObj(Player, Metal) >= 70 Then
				PlayerMessage(Player, "You smithed a Sun Blade!", Yellow)
				TakeObj(Player, Metal, 70)
				GiveObj(Player, 159, 1)
			Else
				PlayerMessage(Player, "You dont have enough Smelted Metal to smith that.", Grey)
			End If
		Case 5
			If HasObj(Player, Metal) >= 100 Then
				PlayerMessage(Player, "You smithed a Excalibur!", Yellow)
				TakeObj(Player, Metal, 100)
				GiveObj(Player, 135, 1)
			Else
				PlayerMessage(Player, "You dont have enough Smelted Metal to smith that.", Grey)
			End If
		Case Else
			PlayerMessage(Player, "That is not a valid option.", Grey)
	End Select
Else
	PlayerMessage(Player, "You must be in a blacksmiths to smith.", Grey)
End If

End Sub