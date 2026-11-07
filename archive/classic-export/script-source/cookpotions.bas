Function Main(Player as Long) AS LONG
Dim Ration as Long, Slot as Long, A as Long, B as Long
''Cook Potions

Ration = HasObj(Player, 445) + HasObj(Player, 446) + HasObj(Player, 447)

For Slot = 1 To 20
	If GetPlayerInvObject(Player, Slot) = 0 Then
		A = A + 1
	End If
Next Slot
	If A = 0 Then
		PlayerMessage(Player, "You have no room in your inventory to create potions", Grey)
		Exit Function
	End If
If HasObj(Player, 403) = 0 | HasObj(Player, 286) < 10 Then
	PlayerMessage(Player, "You do not have all the ingredients required.", Grey)
	Exit Function
End If

If Ration < 2 Then
'20 Scorpian Stings => Strength Potion
	If HasObj(Player, 78) >= 20 Then
		TakeObj(Player, 78, 20)
		GiveObj(Player, 445, 1)
		PlayerMessage(Player, "You've made a Vial of Water, 10 Hell Shards and 20 Scorpian Stings into a Strength Potion!", Yellow)
		Exit Function
	Else
'20 Marshrooms => Endurance Potion
		If HasObj(Player, 69) >= 20 Then
			TakeObj(Player, 69, 20)
			GiveObj(Player, 446, 1)
			PlayerMessage(Player, "You've made a Vial of Water, 10 Hell Shards and 20 Marshroom into an Endurance Potion!", Yellow)
			Exit Function
		Else
'5 Demon Hearts => Constitution Potion
			If HasObj(Player, 285) >= 5 Then
				TakeObj(Player, 285, 5)
				GiveObj(Player, 447, 1)
				PlayerMessage(Player, "You've made a Vial of Water, 10 Hell Shards and 5 Demon Hearts into a Constitution Potion!", Yellow)
				Exit Function
			End If
		End If
	End If
Else
	PlayerMessage(Player, "You may not have more than 2 Stat Potions.", Grey)
End If

End Function