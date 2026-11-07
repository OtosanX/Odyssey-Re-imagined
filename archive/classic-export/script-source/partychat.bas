Function Main(Player as Long, Command as String, Parm1 as String, Parm2 as String) AS LONG
dim Loop as Long

If GetPlayerFlag(Player, 201) > 0 Then
	For Loop = 1 To GetMaxUsers()
		If GetPlayerFlag(Loop, 201) = GetPlayerFlag(Player, 201) Then
			PlayerMessage(Loop, strcat(GetPlayerName(Player), strcat(" -> Party: ", Parm2)), Green)
		End If
	Next Loop
Else
	PlayerMessage(Player, "You are not in a party.", Grey)
End If

End Function