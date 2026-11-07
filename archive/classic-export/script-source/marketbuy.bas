Sub Main(Player as Long, Item as Long, Ammount as Long)
dim Cost as Long, Flag as Long

Select Case Item
	Case 1 'Lumber
		Item = 215
		Flag = 130
			Cost = 150 - Divide(GetFlag(Flag), 400)
			If Cost < 75 Then Cost = 75
			Cost = Cost * Ammount
	Case 2 'Coarse Ore
		Item = 216
		Flag = 131
			Cost = 150 - Divide(GetFlag(Flag), 400)
			If Cost < 75 Then Cost = 75
			Cost = Cost * Ammount
	Case 3 'Flawed Ore
		Item = 217
		Flag = 132
			Cost = 300 - Divide(GetFlag(Flag), 160)
			If Cost < 150 Then Cost = 150
			Cost = Cost * Ammount
	Case 4 'Pure Ore
		Item = 218
		Flag = 133
			Cost = 1500 - Divide(GetFlag(Flag), 20)
			If Cost < 750 Then Cost = 750
			Cost = Cost * Ammount
	Case 5 'Small Fish
		Item = 153
		Flag = 134
			Cost = 150 - Divide(GetFlag(Flag), 400)
			If Cost < 75 Then Cost = 75
			Cost = Cost * Ammount
	Case 6 'Medium Fish
		Item = 152
		Flag = 135
			Cost = 300 - Divide(GetFlag(Flag), 160)
			If Cost < 150 Then Cost = 150
			Cost = Cost * Ammount
	Case 7 'Big Fish
		Item = 148
		Flag = 136
			Cost = 1500 - Divide(GetFlag(Flag), 20)
			If Cost < 750 Then Cost = 750
			Cost = Cost * Ammount
	Case Else
		PlayerMessage(Player, "You must select which resource you would like to buy.", Grey)
		Exit Sub
End Select

If Ammount = 0 Then
	PlayerMessage(Player, strcat("You must select how much ", strcat(GetObjectName(Item), " you wish to buy.")), Grey)
	Exit Sub
End If
If Ammount > GetFlag(Flag) + 1 Then
	PlayerMessage(Player, strcat("There is not that much ", strcat(GetObjectName(Item), " for sale.")), Grey)
	Exit Sub
End If
If Ammount > 100 Then
	PlayerMessage(Player, "You may only buy in lots upto 100 items.", Grey)
	Exit Sub
End If

If Cost > HasObj(Player, 6) + 1 Then
	PlayerMessage(Player, strcat("You cannot afford that much ", GetObjectName(Item)), Grey)
	Exit Sub
End If

TakeObj(Player, 6, Cost)
GiveObj(Player, Item, Ammount)
SetFlag(Flag, GetFlag(Flag) - Ammount)
PlayerMessage(Player, strcat("You have bought ", strcat(str(Ammount), strcat(" ", GetObjectName(Item)))), White)
RunScript0("refreshmarket")

End Sub