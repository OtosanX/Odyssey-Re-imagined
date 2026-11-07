Function Main(Player as Long, Message as String) as Long

If GetPlayerFlag(Player, 242) = 0 Then
	If strcmp(Message, "1") Then
		PlayerMessage(Player, "You say, ''Sure, how can I help?''", Grey)
		SetPlayerFlag(Player, 242, 1)
		PlayerMessage(Player, "Trapper Joe says, ''Thank you so much Friend. I have an old pelt that my grandfather skinned as a boy. It is falling to pieces. Please take it to the Elvish Tanner in Alephvale, to the North of Greystone Peaks. He will restore it's beauty.''", Yellow)
		PlayerMessage(Player, "1. I can manage that.", DarkGrey)
		PlayerMessage(Player, "2. Hmm, maybe I'm busier than I thought. I'll pass.", DarkGrey)
		Main = Stop
		Exit Function
	End If
	If strcmp(Message, "2") Then
		PlayerMessage(Player, "You say, ''My time is worth more than pity errands.''", Grey)
		SetPlayerFlag(Player, 242, 0)
		PlayerMessage(Player, "Trapper Joe says, ''Oh I see how it is.", Yellow)
		Main = Stop
		Exit Function
	End If
End If

If GetPlayerFlag(Player, 242) = 1 Then
	If strcmp(Message, "1") Then
		PlayerMessage(Player, "You say, ''I can manage that.''", Grey)
		SetPlayerFlag(Player, 242, 2)
		PlayerMessage(Player, "Trapper Joe says, ''Here is the pelt. Please take care of it.''", Yellow)
		GiveObj(Player, 291, 1)
		Main = Stop
		Exit Function
	End If
	If strcmp(Message, "2") Then
		PlayerMessage(Player, "You say, ''Hmm, maybe I'm busier than I thought. I'll pass.''", Grey)
		SetPlayerFlag(Player, 242, 0)
		PlayerMessage(Player, "Trapper Joe says, ''Ok, maybe later.", Yellow)
		Main = Stop
		Exit Function
	End If
End If
If GetPlayerFlag(Player, 242) = 2 Then
	If strcmp(Message, "1") Then
		PlayerMessage(Player, "You say, ''Just fine, I'll be done in no time.''", Grey)
		PlayerMessage(Player, "Trapper Joe says, ''Good to hear Friend.", Yellow)
		Main = Stop
		Exit Function
	End If
	If strcmp(Message, "2") Then
		PlayerMessage(Player, "You say, ''Where was it I was to take the pelt to again?''", Grey)
		PlayerMessage(Player, "Trapper Joe says, ''To the Elf Village of Alephvale. It is hidden deep in the forest to the North of the Dark Cave enterance.", Yellow)
		Main = Stop
		Exit Function
	End If
	If strcmp(Message, "3") Then
		PlayerMessage(Player, "You say, ''I've...lost your pelt... my bad.''", Grey)
		PlayerMessage(Player, "Trapper Joe says, ''I had a feeling this would happen. Good thing I kept the other part of the pelt Friend. Here.", Yellow)
		GiveObj(Player, 291, 1)
		SetPlayerFlag(Player, 242, 2)
		Main = Stop
		Exit Function
	End If
End If

If GetPlayerFlag(Player, 242) = 3 Then
	If strcmp(Message, "1") Then
		PlayerMessage(Player, "You say, ''I've taken the pelt to Velatre and he's made a jacket for you!''", Grey)
		If HasObj(Player, 284) Then
			PlayerMessage(Player, "Trapper Joe says, ''Thank you Friend! But would you mind...Please take it to the Wizard in Dragonia for me, he has promised to waterproof it for me.''", Yellow)
			PlayerMessage(Player, "You say, ''Fine...''", Grey)
			SetPlayerFlag(Player, 242, 4)
		Else
			PlayerMessage(Player, "Trapper Joe says, ''I do not see it... Go fetch it quick!''", Yellow)
		End If
		Main = Stop
		Exit Function
	End If
	If strcmp(Message, "2") Then
		PlayerMessage(Player, "You say, ''Where was it I was to take the pelt to again?''", Grey)
		PlayerMessage(Player, "Trapper Joe says, ''To the Elf Village of Alephvale. It is hidden deep in the forest to the North of the Dark Cave enterance.", Yellow)
		Main = Stop
		Exit Function
	End If
	If strcmp(Message, "3") Then
		PlayerMessage(Player, "You say, ''I've...lost your pelt... my bad.''", Grey)
		PlayerMessage(Player, "Trapper Joe says, ''I had a feeling this would happen. Good thing I kept the other part of the pelt Friend. Here.", Yellow)
		GiveObj(Player, 291, 1)
		SetPlayerFlag(Player, 242, 2)
		Main = Stop
		Exit Function
	End If
End If
If GetPlayerFlag(Player, 242) = 4 Then
	If strcmp(Message, "1") Then
		PlayerMessage(Player, "You say, ''I'm still tracking down the Wizard.''", Grey)
		PlayerMessage(Player, "Trapper Joe says, ''Maybe there's Trapper's blood in you after all!''", Yellow)
		Main = Stop
		Exit Function
	End If
	If strcmp(Message, "2") Then
		PlayerMessage(Player, "You say, ''Where was it I was to take the jacket to again?''", Grey)
		PlayerMessage(Player, "Trapper Joe says, ''To the Old Wizard of Dragonia. Dragonia is the city on the North Coast of the world.''", Yellow)
		Main = Stop
		Exit Function
	End If
	If strcmp(Message, "3") Then
		PlayerMessage(Player, "You say, ''I've...lost your pelt... my bad.''", Grey)
		PlayerMessage(Player, "Trapper Joe says, ''I had a feeling this would happen. Good thing I kept the other part of the pelt Friend. Here.", Yellow)
		GiveObj(Player, 291, 1)
		SetPlayerFlag(Player, 242, 2)
		Main = Stop
		Exit Function
	End If
End If

If GetPlayerFlag(Player, 242) = 5 Then
	If strcmp(Message, "1") Then
		PlayerMessage(Player, "You say, ''The Wizard has enchanted your jacket.''", Grey)
		If HasObj(Player, 319) Then
			PlayerMessage(Player, "Trapper Joe says, ''Thank you so much Friend! My door is always open to you friend. And if you feel like killing Trolls feel free. There's plenty more where they came from!''", Yellow)
			TakeObj(Player, 319, 1)
			SetPlayerFlag(Player, 242, 6)
			'FINISHED ERRAND - ACCESS TO TROLLS AND TRAPPERS HOUSE
				PlayerMessage(Player, "You have completed Trapper Joe's Errand!", BrightGreen)
				If GetPlayerLevel(Player) < 80 Then
					GivePlayerExp(Player, 20000)
					PlayerMessage(Player, "You have gained 20k experience!", Green)
				Else
					GiveObj(Player, 6, 100000)
				PlayerMessage(Player, "You have received 100k Gold Coins!", Green)
				End If
				Exit Function
		Else
			PlayerMessage(Player, "Trapper Joe says, ''I do not see it... Go fetch it quick!''", Yellow)
		End If
		Main = Stop
		Exit Function
	End If
	If strcmp(Message, "2") Then
		PlayerMessage(Player, "You say, ''Where was it I was to take the jacket to again?''", Grey)
		PlayerMessage(Player, "Trapper Joe says, ''To the Old Wizard of Dragonia. Dragonia is the city on the North Coast of the world.''", Yellow)
		Main = Stop
		Exit Function
	End If
	If strcmp(Message, "3") Then
		PlayerMessage(Player, "You say, ''I've...lost your pelt... my bad.''", Grey)
		PlayerMessage(Player, "Trapper Joe says, ''I had a feeling this would happen. Good thing I kept the other part of the pelt Friend. Here.", Yellow)
		GiveObj(Player, 291, 1)
		SetPlayerFlag(Player, 242, 2)
		Main = Stop
		Exit Function
	End If
End If

End Function