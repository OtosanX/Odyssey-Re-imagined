FUNCTION Main(Player AS LONG, Message AS String) AS LONG
	Dim ChangeCost AS LONG
	Dim A AS LONG
	ChangeCost = 50000
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
			PlayerMessage(Player, "You are now a Knight!", WHITE)
		Else
			PlayerMessage(Player, "You do not have enough gold!", WHITE)
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
			PlayerMessage(Player, "You are now a Cleric!", WHITE)
		Else
			PlayerMessage(Player, "You do not have enough gold!", WHITE)
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
			PlayerMessage(Player, "You are now a Mage!", WHITE)
		Else
			PlayerMessage(Player, "You do not have enough gold!", WHITE)
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
			PlayerMessage(Player, "You are now a Rogue!", WHITE)
		Else
			PlayerMessage(Player, "You do not have enough gold!", WHITE)
		End If
		Main = Stop
		Exit Function
	End If
	
   Main = Continue
END FUNCTION