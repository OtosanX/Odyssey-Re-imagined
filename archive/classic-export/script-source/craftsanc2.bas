Sub Main(Player as Long)
dim Slot as Long, Cost as Long

Cost = 3000

If HasObj(Player, 6) < Cost Then
	PlayerMessage(Player, strcat("You require ", strcat(str(Cost), " Gold to transmute a Tower Ring.")), Grey)
	Exit Sub
End If

For Slot = 1 To 20
	If GetPlayerInvObject(Player, Slot) = 59 Then
		TakeObj(Player, 59, 1)
		Select Case Random(3)
			Case 0
				GiveObj(Player, 56, 1)
				TakeObj(Player, 6, Cost)
				PlayerMessage(Player, "You receive a Jewel of Fenrir!", White)
			Case 1
				GiveObj(Player, 53, 1)
				TakeObj(Player, 6, Cost)
				PlayerMessage(Player, "You receive a Gem of Valhalla!", White)
			Case 2
				GiveObj(Player, 120, 1)
				TakeObj(Player, 6, Cost)
				PlayerMessage(Player, "You receive a Freya's Charm!", White)
		End Select
		Exit Sub
	End If
	If GetPlayerInvObject(Player, Slot) = 56 Then
		TakeObj(Player, 56, 1)
		Select Case Random(3)
			Case 0
				GiveObj(Player, 59, 1)
				TakeObj(Player, 6, Cost)
				PlayerMessage(Player, "You receive an Odin's Shard!", White)
			Case 1
				GiveObj(Player, 53, 1)
				TakeObj(Player, 6, Cost)
				PlayerMessage(Player, "You receive a Gem of Valhalla!", White)
			Case 2
				GiveObj(Player, 120, 1)
				TakeObj(Player, 6, Cost)
				PlayerMessage(Player, "You receive a Freya's Charm!", White)
		End Select
		Exit Sub
	End If
	If GetPlayerInvObject(Player, Slot) = 53 Then
		TakeObj(Player, 53, 1)
		Select Case Random(3)
			Case 0
				GiveObj(Player, 59, 1)
				TakeObj(Player, 6, Cost)
				PlayerMessage(Player, "You receive an Odin's Shard!", White)
			Case 1
				GiveObj(Player, 56, 1)
				TakeObj(Player, 6, Cost)
				PlayerMessage(Player, "You receive a Jewel of Fenrir!", White)
			Case 2
				GiveObj(Player, 120, 1)
				TakeObj(Player, 6, Cost)
				PlayerMessage(Player, "You receive a Freya's Charm!", White)
		End Select
		Exit Sub
	End If
	If GetPlayerInvObject(Player, Slot) = 120 Then
		TakeObj(Player, 120, 1)
		Select Case Random(3)
			Case 0
				GiveObj(Player, 59, 1)
				TakeObj(Player, 6, Cost)
				PlayerMessage(Player, "You receive an Odin's Shard!", White)
			Case 1
				GiveObj(Player, 56, 1)
				TakeObj(Player, 6, Cost)
				PlayerMessage(Player, "You receive a Jewel of Fenrir!", White)
			Case 2
				GiveObj(Player, 53, 1)
				TakeObj(Player, 6, Cost)
				PlayerMessage(Player, "You receive a Gem of Valhalla!", White)
		End Select
		Exit Sub
	End If
Next Slot

End Sub