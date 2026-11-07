Sub Main(Player as Long)
dim ObjNum as Long, ObjVal as Long, Level as Long
ObjNum = GetPlayerFlag(Player, 46)
ObjVal = GetPlayerFlag(Player, 47)

If GetPlayerFlag(Player, 242) = 0 Then 'Not Started
	PlayerMessage(Player, "Trapper Joe says, ''Hello Friend. Have you time to help in an errand?''", Yellow)
	PlayerMessage(Player, "1. Sure, how can I help?", DarkGrey)
	PlayerMessage(Player, "2. My time is worth more than pity errands.", DarkGrey)
	Exit Sub
End If
If GetPlayerFlag(Player, 242) = 1 Then
	PlayerMessage(Player, "Trapper Joe says, ''Thank you so much Friend. I have an old pelt that my grandfather skinned as a boy. It is falling to pieces. Please take it to the Elvish Tanner in Alephvale, to the North of Greystone Peaks. He will restore it's beauty.''", Yellow)
	PlayerMessage(Player, "1. I can manage that.", DarkGrey)
	PlayerMessage(Player, "2. Hmm, maybe I'm busier than I thought. I'll pass.", DarkGrey)
	Exit Sub
End If
If GetPlayerFlag(Player, 242) = 2 Then
	PlayerMessage(Player, "Trapper Joe says, ''How goes the errand Friend?''", Yellow)
	PlayerMessage(Player, "1. Fine, I'll be done in no time.", DarkGrey)
	PlayerMessage(Player, "2. Where was it I was to take the pelt to again?", DarkGrey)
	PlayerMessage(Player, "3. I've...lost your pelt... my bad.", DarkGrey)
	Exit Sub
End If
If GetPlayerFlag(Player, 242) = 3 Then
	PlayerMessage(Player, "Trapper Joe says, ''How goes the errand Friend?''", Yellow)
	PlayerMessage(Player, "1. I've taken the pelt to Velatre and he's made a jacket for you!", DarkGrey)
	PlayerMessage(Player, "2. Where was it I was to take the pelt to again?", DarkGrey)
	PlayerMessage(Player, "3. I've...lost your pelt... my bad.", DarkGrey)
	Exit Sub
End If
If GetPlayerFlag(Player, 242) = 4 Then
	PlayerMessage(Player, "Trapper Joe says, ''How goes the errand Friend?''", Yellow)
	PlayerMessage(Player, "1. I'm still tracking down the Wizard.", DarkGrey)
	PlayerMessage(Player, "2. Where was it I was to take the jacket to again?", DarkGrey)
	PlayerMessage(Player, "3. I've...lost your pelt... my bad.", DarkGrey)
	Exit Sub
End If
If GetPlayerFlag(Player, 242) = 5 Then
	PlayerMessage(Player, "Trapper Joe says, ''How goes the errand Friend?''", Yellow)
	PlayerMessage(Player, "1. The Wizard has enchanted your jacket.", DarkGrey)
	PlayerMessage(Player, "2. Where was it I was to take the jacket to again?", DarkGrey)
	PlayerMessage(Player, "3. I've...lost your pelt... my bad.", DarkGrey)
	Exit Sub
End If

If ObjNum = 0 Then	'No Current Task
	If GetPlayerLevel(Player) < 40 Then Level = 4
	If GetPlayerLevel(Player) > 39 & GetPlayerLevel(Player) < 60 Then Level = 6
	If GetPlayerLevel(Player) > 59 Then Level = 8
		Select Case Random(Level)
			Case 0
				SetPlayerFlag(Player, 46, 76)
				SetPlayerFlag(Player, 47, Random(21) + 10)
			Case 1
				SetPlayerFlag(Player, 46, 127)
				SetPlayerFlag(Player, 47, Random(21) + 10)
			Case 2
				SetPlayerFlag(Player, 46, 78)
				SetPlayerFlag(Player, 47, Random(21) + 10)
			Case 3
				SetPlayerFlag(Player, 46, 307)
				SetPlayerFlag(Player, 47, Random(11) + 10)
			Case 4
				SetPlayerFlag(Player, 46, 151)
				SetPlayerFlag(Player, 47, Random(21) + 10)
			Case 5
				SetPlayerFlag(Player, 46, 354)
				SetPlayerFlag(Player, 47, 1)
			Case 6
				SetPlayerFlag(Player, 46, 167)
				SetPlayerFlag(Player, 47, Random(5) + 1)
			Case 7
				SetPlayerFlag(Player, 46, 355)
				SetPlayerFlag(Player, 47, 1)
		End Select
	PlayerMessage(Player, strcat("Trapper Joe says, ''Could I bother you for a favour friend? Would you find me ", strcat(str(GetPlayerFlag(Player, 47)), strcat(" ", strcat(GetObjectName(GetPlayerFlag(Player, 46)), "s?''")))), White)
Else
	If HasObj(Player, ObjNum) >= ObjVal Then	'Task Complete
		TakeObj(Player, ObjNum, ObjVal)
		SetPlayerFlag(Player, 46, 0)
		SetPlayerFlag(Player, 47, 0)
		SetPlayerFlag(Player, 244, GetPlayerFlag(Player, 244) + 1)
		PlayerMessage(Player, "You successfully complete the task!", BrightGreen)
		PlayerMessage(Player, "Trapper Joe says, ''Thank you so much friend.''", White)
		If GetPlayerLevel(Player) < 80 Then
			Select Case ObjNum
				Case 76
					GivePlayerExp(Player, 10000)
					PlayerMessage(Player, "You receive 10k Experience!", Green)
				Case 127
					GivePlayerExp(Player, 15000)
					PlayerMessage(Player, "You receive 15k Experience!", Green)
				Case 78
					GivePlayerExp(Player, 20000)
					PlayerMessage(Player, "You receive 20k Experience!", Green)
				Case 307
					GivePlayerExp(Player, 25000)
					PlayerMessage(Player, "You receive 25k Experience!", Green)
				Case 151
					GivePlayerExp(Player, 35000)
					PlayerMessage(Player, "You receive 35k Experience!", Green)
				Case 354
					GivePlayerExp(Player, 50000)
					PlayerMessage(Player, "You receive 50k Experience!", Green)
				Case 167
					GivePlayerExp(Player, 70000)
					PlayerMessage(Player, "You receive 70k Experience!", Green)
				Case 355
					GivePlayerExp(Player, 100000)
					PlayerMessage(Player, "You receive 100k Experience!", Green)
			End Select
		Else
			Select Case ObjNum
				Case 354
					GiveObj(Player, 6, 50000)
					PlayerMessage(Player, "You receive 50k Gold!", Green)
				Case 167
					GiveObj(Player, 6, 50000)
					PlayerMessage(Player, "You receive 50k Gold!", Green)
				Case 355
					GiveObj(Player, 6, 60000)
					PlayerMessage(Player, "You receive 60k Gold!", Green)
			End Select
		End If
	Else 'Task Incomplete
		SetPlayerFlag(Player, 47, ObjVal - HasObj(Player, ObjNum))
		TakeObj(Player, ObjNum, HasObj(Player, ObjNum))
		PlayerMessage(Player, strcat("Trapper Joe says, ''Thank you friend, but I still require ", strcat(str(GetPlayerFlag(Player, 47)), strcat(" ", strcat(GetObjectName(ObjNum), "s.''")))), White)
	End If
End If

End Sub