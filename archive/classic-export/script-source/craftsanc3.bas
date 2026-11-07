Sub Main(Player as Long, Parm1 as Long)
dim Slot as Long, A as Long
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

If GetPlayerMap(Player) = 594 Then
	Select Case Parm1
		Case 0
			PlayerMessage(Player, "=Crafting List=", Yellow)
			PlayerMessage(Player, "1. Odin's Shard - 2 Clear Emeralds, 1 Perfect Diamond", Grey)
			PlayerMessage(Player, "2. Jewel of Fenrir - 2 Shining Rubys, 1 Perfect Diamond", Grey)
			PlayerMessage(Player, "3. Gem of Valhalla - 2 Bright Sapphires, 1 Perfect Diamond", Grey)
			PlayerMessage(Player, "4. Freya's Charm - 2 Cut Amethysts, 1 Perfect Diamond", Grey)
			PlayerMessage(Player, "Type /craft # to craft an item.", White)
		Case 1
			If HasObj(Player, 441) >= 2 & HasObj(Player, 434) >= 1 Then
				PlayerMessage(Player, "You craft an Odin's Shard!", Yellow)
				TakeObj(Player, 441, 2)
				TakeObj(Player, 434, 1)
				GiveObj(Player, 59, 1)
			Else
				PlayerMessage(Player, "You require 2 Clear Emeralds and 1 Perfect Diamond to craft that.", Grey)
			End If
		Case 2
			If HasObj(Player, 435) >= 2 & HasObj(Player, 434) >= 1 Then
				PlayerMessage(Player, "You craft a Jewel of Fenrir!", Yellow)
				TakeObj(Player, 435, 2)
				TakeObj(Player, 434, 1)
				GiveObj(Player, 56, 1)
			Else
				PlayerMessage(Player, "You require 2 Shining Rubys and 1 Perfect Diamond to craft that.", Grey)
			End If
		Case 3
			If HasObj(Player, 438) >= 2 & HasObj(Player, 434) >= 1 Then
				PlayerMessage(Player, "You craft a Gem of Valhalla!", Yellow)
				TakeObj(Player, 438, 2)
				TakeObj(Player, 434, 1)
				GiveObj(Player, 53, 1)
			Else
				PlayerMessage(Player, "You require 2 Bright Sapphires and 1 Perfect Diamond to craft that.", Grey)
			End If
		Case 4
			If HasObj(Player, 458) >= 2 & HasObj(Player, 434) >= 1 Then
				PlayerMessage(Player, "You craft a Freya's Charm!", Yellow)
				TakeObj(Player, 458, 2)
				TakeObj(Player, 434, 1)
				GiveObj(Player, 120, 1)
			Else
				PlayerMessage(Player, "You require 2 Cut Amethysts and 1 Perfect Diamond to craft that.", Grey)
			End If
		Case Else
			PlayerMessage(Player, "That is not a valid option.", Grey)
	End Select
Else
	PlayerMessage(Player, "You must be in a workshop to craft.", Grey)
End If

End Sub