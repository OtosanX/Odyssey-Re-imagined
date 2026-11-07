Sub Main(Player as Long, Parm1 as Long)
dim Slot as Long, A as Long, Lumber as Long

A = 0
For Slot = 1 To 20
	If GetPlayerInvObject(Player, Slot) = 0 Then
		A = A + 1
	End If
Next Slot
If A = 0 Then
	PlayerMessage(Player, "You have no room in your inventory to craft.", Grey)
	Exit Sub
End If

Lumber = 215
If GetPlayerMap(Player) = 300 Then
	Select Case Parm1
		Case 0
			PlayerMessage(Player, "=Crafting List=", Yellow)
			PlayerMessage(Player, "1. Longbow - 100 Lumber", Grey)
			PlayerMessage(Player, "2. Crossbow - 250 Lumber", Grey)
			PlayerMessage(Player, "3. Arrows x30 - 10 Lumber", Grey)
			PlayerMessage(Player, "4. Bolts x20 - 10 Lumber", Grey)
			PlayerMessage(Player, "5. Gryphn's Claw - 5000 Lumber", Grey)
			If GetPlayerFlag(Player, 240) > 0 & GetPlayerFlag(Player, 240) < 7 Then PlayerMessage(Player, "6. Bucket - 100 Lumber, 2 Metal Bands", Yellow)
			PlayerMessage(Player, "Type /craft # to craft an item.", White)
		Case 1
			If HasObj(Player, Lumber) >= 100 Then
				PlayerMessage(Player, "You craft a Longbow!", Yellow)
				TakeObj(Player, Lumber, 100)
				GiveObj(Player, 30, 1)
			Else
				PlayerMessage(Player, "You dont have enough Lumber to craft that.", Grey)
			End If
		Case 2
			If HasObj(Player, Lumber) >= 250 Then
				PlayerMessage(Player, "You craft a Crossbow!", Yellow)
				TakeObj(Player, Lumber, 250)
				GiveObj(Player, 31, 1)
			Else
				PlayerMessage(Player, "You dont have enough Lumber to craft that.", Grey)
			End If
		Case 3
			If HasObj(Player, Lumber) >= 10 Then
				PlayerMessage(Player, "You craft some Arrows!", Yellow)
				TakeObj(Player, Lumber, 10)
				GiveObj(Player, 71, 30)
			Else
				PlayerMessage(Player, "You dont have enough Lumber to craft that.", Grey)
			End If
		Case 4
			If HasObj(Player, Lumber) >= 10 Then
				PlayerMessage(Player, "You craft some Bolts!", Yellow)
				TakeObj(Player, Lumber, 10)
				GiveObj(Player, 233, 20)
			Else
				PlayerMessage(Player, "You dont have enough Lumber to craft that.", Grey)
			End If
		Case 5
			If HasObj(Player, Lumber) >= 5000 Then
				PlayerMessage(Player, "You craft a Gryphn's Claw!!", Yellow)
				TakeObj(Player, Lumber, 5000)
				GiveObj(Player, 232, 1)
			Else
				PlayerMessage(Player, "You dont have enough Lumber to craft that.", Grey)
			End If
		Case 6
			If GetPlayerFlag(Player, 240) > 0 & GetPlayerFlag(Player, 240) < 7 Then
				If HasObj(Player, Lumber) >= 100 & HasObj(Player, 461) >= 2 Then
					PlayerMessage(Player, "You craft a Bucket!!", Yellow)
					TakeObj(Player, Lumber, 100)
					TakeObj(Player, 461, 2)
					GiveObj(Player, 466, 1)
					PlayerMessage(Player, "Madargan Gar says, ''Here it is, a brand new bucket for Manny. Go take it to him straight away.", Yellow)
					SetPlayerFlag(Player, 240, 5)
				Else
					PlayerMessage(Player, "You dont have enough Lumber to craft that.", Grey)
				End If
			Else
				PlayerMessage(Player, "That is not a valid option.", Grey)
			End If
		Case Else
			PlayerMessage(Player, "That is not a valid option.", Grey)
	End Select
Else
	PlayerMessage(Player, "You must be in a workshop to craft.", Grey)
End If

End Sub