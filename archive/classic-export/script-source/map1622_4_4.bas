Function Main(Player as Long) AS LONG
dim Ration as Long, Slot as Long, A as Long
Ration = HasObj(Player, 445) + HasObj(Player, 446) + HasObj(Player, 447) + HasObj(Player, 449)

For Slot = 1 To 20
	If GetPlayerInvObject(Player, Slot) = 0 Then
		A = A + 1
	End If
Next Slot
	If A = 0 Then
		PlayerMessage(Player, "You have no room in your inventory to create potions.", Grey)
		Exit Function
	End If

If Ration < 3 Then
'20 Scorpian Stings => Strength Potion
	If HasObj(Player, 403) & HasObj(Player, 286) >= 10 & HasObj(Player, 78) >= 20 Then
		TakeObj(Player, 78, 20)
		TakeObj(Player, 403, 1)
		TakeObj(Player, 286, 10)
		GiveObj(Player, 445, 1)
		PlayerMessage(Player, "You've made a Vial of Water, 10 Hell Shards and 20 Scorpian Stings into a Strength Potion!", Yellow)
		Exit Function
	Else
		PlayerMessage(Player, "You do not have all the ingredients required.", Grey)
	End If
Else
	PlayerMessage(Player, "You may not carry more than 3 Stat Potions.", Grey)
End If

End Function