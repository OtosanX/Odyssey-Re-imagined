Function Main(Player as Long) AS LONG
dim Loop as Long

GlobalMessage("==Lottery Enterants==", Yellow)
For Loop = 1 To GetMaxUsers()
	If GetPlayerFlag(Loop, 220) > 0 Then
		GlobalMessage(strcat(GetPlayerName(Loop), strcat(" - ", str(GetPlayerFlag(Loop, 220)))), Grey)
	End If
Next Loop

GlobalMessage(strcat("The Odyssey Lottery Pot is ", strcat(str(GetFlag(121)), " Gold!")), White)

End Function