Sub Main(Player as Long, Parm1 as Long)
dim Slot as Long, A as Long

If RunScript1("Ration", Player) = 1 & Parm1 > 0 Then
	PlayerMessage(player, "You can not carry more than three ration items.", Grey)
	Exit Sub
End If
A = 0
For Slot = 1 To 20
	If GetPlayerInvObject(Player, Slot) = 0 Then
		A = A + 1
	End If
Next Slot
If A = 0 Then
	PlayerMessage(Player, "You have no room in your inventory to cook.", Grey)
	Exit Sub
End If

Select Case Parm1
	Case 0
		PlayerMessage(Player, "=Cooking Menu=", Yellow)
		PlayerMessage(Player, "1. Fish Stew - 3 Big Fish, Carrot, Marshroom", Grey)
		PlayerMessage(Player, "2. Fish Cakes - 3 Medium Fish, Bread Crumbs", Grey)
		PlayerMessage(Player, "3. Sushi - 3 Small Fish", Grey)
		PlayerMessage(Player, "Type /cook # to cook an item.", White)
	Case 1
		If HasObj(Player, 148) >= 3 & HasObj(Player, 103) >= 1 & HasObj(Player, 69) >= 1 Then
			PlayerMessage(Player, "You cooked up some Fish Stew!", Yellow)
			TakeObj(Player, 148, 3)
			TakeObj(Player, 103, 1)
			TakeObj(Player, 69, 1)
			GiveObj(Player, 330, 1)
		Else
			PlayerMessage(Player, "You require 3 Big Fish, 1 Carrot and 1 Marshroom to cook that.", Grey)
		End If
	Case 2
		If HasObj(Player, 152) >= 3 & HasObj(Player, 156) >= 1 Then
			PlayerMessage(Player, "You cooked up some Fish Cakes!", Yellow)
			TakeObj(Player, 152, 3)
			TakeObj(Player, 156, 1)
			GiveObj(Player, 329, 1)
		Else
			PlayerMessage(Player, "You require 3 Medium Fish and 1 box of Bread Crumbs to cook that.", Grey)
		End If
	Case 3
		If HasObj(Player, 153) >= 3 Then
			PlayerMessage(Player, "You cooked up some Sushi!", Yellow)
			TakeObj(Player, 153, 3)
			GiveObj(Player, 48, 1)
		Else
			PlayerMessage(Player, "You require 3 Small Fish to cook that.", Grey)
		End If
	Case Else
		PlayerMessage(Player, "That is not a valid option.", Grey)
End Select

End Sub