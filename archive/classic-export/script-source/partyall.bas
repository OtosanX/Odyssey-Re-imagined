Function Main(Player as Long) AS LONG
dim Loop as Long, Party as Long, Message as String, Count as Long, Count2 as Long

GlobalMessage("==Party List==", Yellow)
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
		GlobalMessage(Message, Party)
		Count2 = Count2 + 1
	End If
Next Party

End Function