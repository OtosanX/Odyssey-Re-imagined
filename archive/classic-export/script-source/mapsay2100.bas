FUNCTION Main(Player AS LONG, Message AS String) AS LONG
	Dim ChangeCost AS LONG
	Dim A AS LONG
	ChangeCost = 1000
	If StrCmp(Message, "knight") Then
		For A = 1 to 5
			If GetPlayerEquipped(Player, A) > 0 Then
				PlayerMessage(Player, "You must unequip all your items first!", WHITE)
				Main = Stop
				Exit Function
			End If
		Next A
		If HasObj(Player, 6) >= ChangeCost Then
			TakeObj(Player, 6, ChangeCost)
			SetPlayerClass(Player, 1)
			SetPlayerFlag(Player, 250, 1)
			PlayerMessage(Player, "You are now a venerate Knight!", WHITE)
		Else
			PlayerMessage(Player, "You do not have enough ancient relics!", WHITE)
		End If
		Main = Stop
		Exit Function
	End If
	
	If StrCmp(Message, "cleric") Then
		For A = 1 to 5
			If GetPlayerEquipped(Player, A) > 0 Then
				PlayerMessage(Player, "You must unequip all your items first!", WHITE)
				Main = Stop
				Exit Function
			End If
		Next A
		If HasObj(Player, 6) >= ChangeCost Then
			TakeObj(Player, 6, ChangeCost)
			SetPlayerClass(Player, 4)
			SetPlayerFlag(Player, 250, 4)
			PlayerMessage(Player, "You are now a venerate Cleric!", WHITE)
		Else
			PlayerMessage(Player, "You do not have enough ancient relics!", WHITE)
		End If
		Main = Stop
		Exit Function
	End If
	
	If StrCmp(Message, "mage") Then
		For A = 1 to 5
			If GetPlayerEquipped(Player, A) > 0 Then
				PlayerMessage(Player, "You must unequip all your items first!", WHITE)
				Main = Stop
				Exit Function
			End If
		Next A
		If HasObj(Player, 6) >= ChangeCost Then
			TakeObj(Player, 6, ChangeCost)
			SetPlayerClass(Player, 2)
			SetPlayerFlag(Player, 250, 2)
			PlayerMessage(Player, "You are now a venerate Mage!", WHITE)
		Else
			PlayerMessage(Player, "You do not have enough ancient relics!", WHITE)
		End If
		Main = Stop
		Exit Function
	End If
	
	If StrCmp(Message, "rogue") Then
		For A = 1 to 5
			If GetPlayerEquipped(Player, A) > 0 Then
				PlayerMessage(Player, "You must unequip all your items first!", WHITE)
				Main = Stop
				Exit Function
			End If
		Next A
		If HasObj(Player, 6) >= ChangeCost Then
			TakeObj(Player, 6, ChangeCost)
			SetPlayerClass(Player, 3)
			SetPlayerFlag(Player, 250, 3)
			PlayerMessage(Player, "You are now a venerate Rogue!", WHITE)
		Else
			PlayerMessage(Player, "You do not have enough ancient relics!", WHITE)
		End If
		Main = Stop
		Exit Function
	End If
	
   Main = Continue
END FUNCTION