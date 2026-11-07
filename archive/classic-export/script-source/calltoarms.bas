Function Main(Player as Long) AS LONG
dim Loop as Long

For Loop = 1 To GetMaxUsers()
	If GetPlayerGuild(Loop) <> 0 THen
		If GetPlayerGuild(Loop) = GetPlayerGuild(Player) Then
			PlayerMessage(Loop, strcat(GetPlayerName(Player), strcat(" has called you to ", GetMapName(GetPlayerMap(Player)))), White)
		End If
	End If
Next Loop

End Function