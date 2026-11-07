Function Main(Player as Long) AS LONG
dim Loop as Long, Message as String

If GetPlayerFlag(Player, 201) > 0 Then
	PlayerMessage(Player, "=Party Member List=", Yellow)
	For Loop = 1 To GetMaxUsers()
		If GetPlayerFlag(Loop, 201) = GetPlayerFlag(Player, 201) Then
			If GetPlayerFlag(Loop, 202) = 1 Then
				Message = strcat(GetPlayerName(Loop), strcat(" - ", strcat(str(GetPlayerLevel(Loop))," - Leader")))
			Else
				Message = strcat(GetPlayerName(Loop), strcat(" - ", str(GetPlayerLevel(Loop))))
			End If
			PlayerMessage(Player, Message, Grey)
		End If
	Next Loop
Else
	PlayerMessage(Player, "You are not in a party.", Grey)
End If

End Function