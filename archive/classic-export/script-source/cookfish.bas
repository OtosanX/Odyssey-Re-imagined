Function Main(Player as Long) AS LONG
Dim Ration as Long, Slot as Long, A as Long
''Cook Fish

Ration = HasObj(Player, 39) + HasObj(Player, 41) + HasObj(Player, 99) + HasObj(Player, 155) + HasObj(Player, 138)

If GetPlayerHP(Player) = GetPlayerMaxHP(Player) & GetPlayerMana(Player) = GetPlayerMaxMana(Player) Then

For Slot = 1 To 20
	If GetPlayerInvObject(Player, Slot) = 0 Then
		A = A + 1
	End If
Next Slot
	If A = 0 Then
		PlayerMessage(Player, "You have no room in your inventory to cook fish", Grey)
		Exit Function
	End If
	
If Ration < 3 Then
'Big Fish => Apple
	If HasObj(Player, 148) >= 10 Then
		TakeObj(Player, 148, 10)
		GiveObj(Player, 41, 1)
		PlayerMessage(Player, "You've cooked 10 Big Fish into a Candy Apple!", Yellow)
		Exit Function
	Else
'Medium Fish => Ancient Tome
		If HasObj(Player, 152) >= 10 Then
			TakeObj(Player, 152, 10)
			GiveObj(Player, 99, 1)
			PlayerMessage(Player, "You've cooked 10 Medium Fish into an Ancient Tome!", Yellow)
			Exit Function
		Else
'Small Fish => HP Pot
			If HasObj(Player, 153) >= 10 Then
				TakeObj(Player, 153, 10)
				GiveObj(Player, 39, 1)
				PlayerMessage(Player, "You've cooked 10 Small Fish into a Health Potion!", Yellow)
				Exit Function
			Else
				PlayerMessage(Player, "You need 10 fish to cook a meal", Grey)
			End If
		End If
	End If
Else
	PlayerMessage(Player, "You may not have more than 3 ration items", Grey)
End If

Else
	PlayerMessage(Player, "You must be fully restored to cook fish", Grey)
End If

End Function