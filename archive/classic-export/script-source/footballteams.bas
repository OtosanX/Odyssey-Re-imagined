Sub Main(Player as Long)
dim Loop as Long

GlobalMessage("==Football Teams==", White)
For Loop = 1 To GetMaxUsers()
	If GetPlayerFlag(Loop, 10) = 11 Then
		If GetPlayerFlag(Loop, 11) = 1 Then
			GlobalMessage(strcat(GetPlayerName(Loop), " - Red Team"), Red)
		End If
	End If
Next Loop
For Loop = 1 To GetMaxUsers()
	If GetPlayerFlag(Loop, 10) = 11 Then
		If GetPlayerFlag(Loop, 11) = 2 Then
			GlobalMessage(strcat(GetPlayerName(Loop), " - Blue Team"), Blue)
		End If
	End If
Next Loop

End Sub