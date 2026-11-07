Sub Main(Player as Long)
dim ObjNum as Long, Level as Long
ObjNum = GetPlayerFlag(Player, 48)

If GetPlayerFlag(Player, 240) = 0 Then
	PlayerMessage(Player, "Manny Farmer says, ''Hey Kid, look lively. I need a new bucket for milking my cows. Head up to the Crafter in Northcoast and get me a new one would ye?''", Yellow)
	PlayerMessage(Player, "1. Ehh, ok...sir!", DarkGrey)
	PlayerMessage(Player, "2. Manners don't cost a thing.", DarkGrey)
	Exit Sub
End If
If GetPlayerFlag(Player, 240) > 0 & GetPlayerFlag(Player, 240) < 5 Then
	PlayerMessage(Player, "Manny Farmer says, ''Have you got that bucket for us yet Kid?''", Yellow)
	PlayerMessage(Player, "1. I'm on it.", DarkGrey)
	PlayerMessage(Player, "2. Where was I meant to get the bucket from again?", DarkGrey)
	Exit Sub
End If
If GetPlayerFlag(Player, 240) = 5 Then
	If HasObj(Player, 466) Then
		PlayerMessage(Player, "Manny Farmer says, ''You got my bucket! Good lad! Would you mind milking my cows though? They're in desperate need of it.''", Yellow)
		Exit Sub
	Else
		PlayerMessage(Player, "Manny Farmer says, ''Hey Kid, look lively. I need a new bucket for milking my cows. Head up to the Crafter in Northcoast and get me a new one would ye?''", Yellow)
		PlayerMessage(Player, "1. Ehh, ok...sir!", DarkGrey)
		PlayerMessage(Player, "2. Manners don't cost a thing.", DarkGrey)
		Exit Sub
	End If
End If
If GetPlayerFlag(Player, 240) = 6 Then
	PlayerMessage(Player, "Manny Farmer says, ''Thank you my lad. If ever you're in need of a good meal you just see the wife alright?", Yellow)
	TakeObj(Player, 464, 1)
	SetPlayerFlag(Player, 240, 7)
	'COMPLETED ERRAND OMG
	PlayerMessage(Player, "You have completed Manny Farmer's Errand!", BrightGreen)
	If GetPlayerLevel(Player) < 80 Then
		GivePlayerExp(Player, 20000)
		PlayerMessage(Player, "You have gained 20k experience!", Green)
	Else
		GiveObj(Player, 6, 100000)
		PlayerMessage(Player, "You have received 100k Gold Coins!", Green)
	End If
	Exit Sub
End If

If ObjNum = 0 Then	'No Current Task
	If GetPlayerLevel(Player) < 40 Then Level = 3
	If GetPlayerLevel(Player) > 39 & GetPlayerLevel(Player) < 60 Then Level = 5
	If GetPlayerLevel(Player) > 59 Then Level = 6
		Select Case Random(Level)
			Case 0
				SetPlayerFlag(Player, 48, 48)	'Sushi
			Case 1
				SetPlayerFlag(Player, 48, 113)	'Fruit
			Case 2
				SetPlayerFlag(Player, 48, 69)	'Marshroom
			Case 3
				SetPlayerFlag(Player, 48, 103)	'Carrot
			Case 4
				SetPlayerFlag(Player, 48, 198)	'Cookie
			Case 5
				SetPlayerFlag(Player, 48, 41)	'Candy Apple
		End Select
	PlayerMessage(Player, strcat("Manny Farmer says, ''Looking to make yourself useful kid? Go bring me a ", strcat(GetObjectName(GetPlayerFlag(Player, 48)), ".''")), White)
Else
	If HasObj(Player, ObjNum) Then	'Task Complete
		TakeObj(Player, ObjNum, 1)
		SetPlayerFlag(Player, 48, 0)
		SetPlayerFlag(Player, 244, GetPlayerFlag(Player, 244) + 1)
		PlayerMessage(Player, "You successfully complete the errand!", BrightGreen)
		PlayerMessage(Player, "Manny Farmer says, ''Cheers for that kid.''", White)
		If GetPlayerLevel(Player) < 80 Then
			Select Case ObjNum
				Case 48
					GivePlayerExp(Player, 10000)
					PlayerMessage(Player, "You received 10k Experience!", Green)
				Case 113
					GivePlayerExp(Player, 20000)
					PlayerMessage(Player, "You received 20k Experience!", Green)
				Case 69
					GivePlayerExp(Player, 30000)
					PlayerMessage(Player, "You received 30k Experience!", Green)
				Case 103
					GivePlayerExp(Player, 40000)
					PlayerMessage(Player, "You received 40k Experience!", Green)
				Case 198
					GivePlayerExp(Player, 50000)
					PlayerMessage(Player, "You received 50k Experience!", Green)
				Case 41
					GivePlayerExp(Player, 50000)
					GivePlayerExp(Player, 10000)
					PlayerMessage(Player, "You received 60k Experience!", Green)
			End Select
		Else
			Select Case ObjNum
				Case 198
					GiveObj(Player, 6, 50000)
					PlayerMessage(Player, "You received 50k Gold!", Green)
				Case 41
					GiveObj(Player, 6, 60000)
					PlayerMessage(Player, "You received 60k Gold!", Green)
			End Select
		End If
	Else 'Task Incomplete
		PlayerMessage(Player, strcat("Manny Farmer says, ''You found that ", strcat(GetObjectName(GetPlayerFlag(Player, 48)), " yet kid?''")), White)
	End If
End If

End Sub