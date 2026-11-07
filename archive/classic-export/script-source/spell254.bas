Function Main(Player as Long) AS LONG
dim Pots as Long

Pots = HasObj(Player, 41) + HasObj(Player, 99) + HasObj(Player, 39) + HasObj(Player, 155)
If Pots = 0 Then
	PlayerMessage(Player, "You do not have any Health Potions.", Grey)
	Exit Function
End If

If HasObj(Player, 155) Then
	TakeObj(Player, 155, 1)
	SetPlayerHP(Player, GetPlayerHP(Player) + 25)
		If GetPlayerHP(Player) > GetPlayerMaxHP(Player) Then SetPlayerHP(Player, GetPlayerMaxHP(Player))
	CreatePlayerFloatText(Player, "25", BrightGreen)
Else
	If HasObj(Player, 41) Then
		TakeObj(Player, 41, 1)
		SetPlayerHP(Player, GetPlayerHP(Player) + 20)
			If GetPlayerHP(Player) > GetPlayerMaxHP(Player) Then SetPlayerHP(Player, GetPlayerMaxHP(Player))
		CreatePlayerFloatText(Player, "20", BrightGreen)
	Else
		If HasObj(Player, 99) Then
			TakeObj(Player, 99, 1)
			SetPlayerHP(Player, GetPlayerHP(Player) + 11)
				If GetPlayerHP(Player) > GetPlayerMaxHP(Player) Then SetPlayerHP(Player, GetPlayerMaxHP(Player))
			CreatePlayerFloatText(Player, "11", BrightGreen)
		Else
			If HasObj(Player, 39) Then
				TakeObj(Player, 39, 1)
				SetPlayerHP(Player, GetPlayerHP(Player) + 5)
					If GetPlayerHP(Player) > GetPlayerMaxHP(Player) Then SetPlayerHP(Player, GetPlayerMaxHP(Player))
				CreatePlayerFloatText(Player, "5", BrightGreen)
			End If
		End If
	End If
End If

End Function