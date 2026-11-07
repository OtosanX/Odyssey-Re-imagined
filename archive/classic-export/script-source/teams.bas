Sub Main(Player as Long, Game as Long)
dim Loop as Long, Message1 as String, Message2 as String

Message1 = "Red Team: "
Message2 = "Blue Team: "
For Loop = 1 To GetMaxUsers()
	If IsPlaying(Loop) Then
		If GetPlayerFlag(Loop, 10) = Game Then
			If GetPlayerFlag(Loop, 11) = 1 Then Message1 = strcat(Message1, strcat(GetPlayerName(Loop), ", "))
			If GetPlayerFlag(Loop, 11) = 2 Then Message2 = strcat(Message2, strcat(GetPlayerName(Loop), ", "))
		End If
	End If
Next Loop

GlobalMessage("==Minigame Teams==", Yellow)
GlobalMessage(Message1, Red)
GlobalMessage(Message2, Blue)

End Sub