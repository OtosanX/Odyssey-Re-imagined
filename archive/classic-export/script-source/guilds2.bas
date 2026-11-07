Function Main(Player as Long) AS LONG
dim Loop as Long, Guilds as Long, Message as String, Count as Long

PlayerMessage(Player, "==Guilds List==", Yellow)
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
			If Guilds = 16 Then PlayerMessage(Player, Message, BrightBlue) Else PlayerMessage(Player, Message, Guilds)
		End If
	End If
Next Guilds

End Function