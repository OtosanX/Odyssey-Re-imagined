Sub Main(Player as Long)
dim Loop as Long, Guilds as Long, Message as String
dim Count as Long, Colour as Long

GlobalMessage("==Guild List==", Yellow)
For Guilds = 1 To 29
	If GetGuildMemberCount(Guilds) > 0 Then
		Count = 0
		Message = strcat(GetGuildName(Guilds), " - ")
		For Loop = 1 To GetMaxUsers()
			If IsPlaying(Loop) Then
				If GetPlayerGuild(Loop) = Guilds Then
					Count = Count + 1
					Message = strcat(Message, strcat(GetPlayerName(Loop), ", "))
				End If
			End If
		Next Loop
		If Count > 0 Then
			If Colour = 4 Then Colour = 6 Else Colour = 4
			GlobalMessage(Message, Colour)
		End If
	End If
Next Guilds

End Sub