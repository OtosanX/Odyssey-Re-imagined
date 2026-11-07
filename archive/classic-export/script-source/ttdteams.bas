Sub Main(Player as Long)
dim Loop as Long, Message as String

GlobalMessage("==Titan Takedown Teams==", White)
Message = "Invaders - "
For Loop = 1 To GetMaxUsers()
	If GetPlayerFlag(Loop, 10) = 4 Then
		If GetPlayerFlag(Loop, 11) = 1 Then
			Message = strcat(Message, strcat(GetPlayerName(Loop), ", "))
		End If
	End If
Next Loop
GlobalMessage(Message, Red)
Message = "Titans - "
For Loop = 1 To GetMaxUsers()
	If GetPlayerFlag(Loop, 10) = 4 Then
		If GetPlayerFlag(Loop, 11) = 2 Then
			Message = strcat(Message, strcat(GetPlayerName(Loop), ", "))
		End If
	End If
Next Loop
GlobalMessage(Message, Yellow)
End Sub