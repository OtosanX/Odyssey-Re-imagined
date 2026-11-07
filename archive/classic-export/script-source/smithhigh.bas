Function Main(Player as Long, Parm1 as Long) AS LONG
dim Metal as Long, Slot as Long, A as Long

A = 0
For Slot = 1 To 20
	If GetPlayerInvObject(Player, Slot) = 0 Then
		A = A + 1
	End If
Next Slot
If A = 0 Then
	PlayerMessage(Player, "You have no room in your inventory to smith.", Grey)
	Exit Function
End If

Metal = 448

If GetPlayerMap(Player) = 174 Then
	Select Case Parm1
		Case 0
			PlayerMessage(Player, "=Smithing Menu=", Yellow)
			PlayerMessage(Player, "1. Soulbinders - 10 Metals", Grey)
			PlayerMessage(Player, "2. Crown of Zeugg - 15 Metals", Grey)
			PlayerMessage(Player, "3. Ztiwhborflail - 25 Metals", Grey)
			PlayerMessage(Player, "4. Hero's Guard - 30 Metals", Grey)
			PlayerMessage(Player, "5. Repair Hero's Guard - 3 Metals", Grey)
			PlayerMessage(Player, " - This will repair the first Hero's Guard to appear in your inventory, and will not repair any if equipped.", Grey)
'			PlayerMessage(Player, "smith # to smith an item", Grey)
		Case 1
			If HasObj(Player, Metal) >= 10 Then
				PlayerMessage(Player, "You smithed some Soulbinders!", Yellow)
				TakeObj(Player, Metal, 10)
				GiveObj(Player, 117, 1)
			Else
				PlayerMessage(Player, "You dont have enough Devilkin Metal to smith that.", Grey)
			End If
		Case 2
			If HasObj(Player, Metal) >= 15 Then
				PlayerMessage(Player, "You smithed a Crown of Zeugg!", Yellow)
				TakeObj(Player, Metal, 15)
				GiveObj(Player, 197, 1)
			Else
				PlayerMessage(Player, "You dont have enough Devilkin Metal to smith that.", Grey)
			End If
		Case 3
			If HasObj(Player, Metal) >= 25 Then
				PlayerMessage(Player, "You smithed a Ztiwhborflail!", Yellow)
				TakeObj(Player, Metal, 25)
				GiveObj(Player, 250, 1)
			Else
				PlayerMessage(Player, "You dont have enough Devilkin Metal to smith that.", Grey)

			End If
		Case 4
			If HasObj(Player, Metal) >= 30 Then
				PlayerMessage(Player, "You smithed a Hero's Guard!", Yellow)
				TakeObj(Player, Metal, 30)
				GiveObj(Player, 248, 1)
			Else
				PlayerMessage(Player, "You dont have enough Devilkin Metal to smith that.", Grey)
			End If
		Case 5
			If HasObj(Player, 248) Then
				If HasObj(Player, Metal) >= 3 Then
					PlayerMessage(Player, "You have repaired a Hero's Guard!", Yellow)
					TakeObj(Player, Metal, 3)
					RunScript1("repairheros", Player)
				Else
					PlayerMessage(Player, "You dont have enough Devilkin Metal to repair that.", Grey)
				End If
			Else
				PlayerMessage(Player, "You dont have a Hero's Guard to repair.", Grey)
			End If
	End Select
Else
	PlayerMessage(Player, "You must be in a blacksmiths to smith.", Grey)
End If

End Function