Sub Main(Player as Long)
dim Loop as Long, Party as Long, Message as String
dim Count as Long, Count2 as Long, Colour as Long

PlayerMessage(Player, "==Party List==", White)
Count2 = 1
For Party = 1 To 30
	Message = strcat(str(Count2), ". ")
	Count = 0
	For Loop = 1 To GetMaxUsers()
		If IsPlaying(Loop) Then
			If GetPlayerFlag(Loop, 201) = Party Then
				Count = Count + 1
				If GetPlayerFlag(Loop, 202) = 1 Then
					Message = strcat(Message, strcat(GetPlayerName(Loop), " (Leader), "))
				Else
					Message = strcat(Message, strcat(GetPlayerName(Loop), ", "))
				End If				
			End If
		End If
	Next Loop
	If Count > 0 Then
		If Colour = 4 Then Colour = 6 Else Colour = 4
		PlayerMessage(Player, Message, Party)
		Count2 = Count2 + 1
	End If
Next Party

End Sub