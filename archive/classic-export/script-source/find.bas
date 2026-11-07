Sub Main(Player as Long)
Dim Loop as Long

If GetPlayerGuild(Player) = 0 Then
	PlayerMessage(Player, "You must be guilded to use this.", Grey)
	Exit Sub
End If

PlayerMessage(Player, "==Find Guild Members==", Yellow)
For Loop = 1 To GetMaxUsers()
	If IsPlaying(Loop) Then
		If Player <> Loop Then
			If GetPlayerGuild(Player) = GetPlayerGuild(Loop) Then
				PlayerMessage(Player, strcat(GetPlayerName(Loop), strcat(" - ", GetMapName(GetPlayerMap(Loop)))), White)
			End If
		End If
	End If
Next Loop

End Sub