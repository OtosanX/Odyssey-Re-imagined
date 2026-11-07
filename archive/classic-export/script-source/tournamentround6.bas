Sub Main()
dim Loop as Long, First as Long, Second as Long

SetFlag(170, 6)

If (GetFlag(175) = 0 & GetFlag(176) = 0) & (GetFlag(177) = 0 & GetFlag(178) = 0) Then RunScript0("TournamentRound7")

If GetFlag(175) = 0 & GetFlag(176) = 0 Then
	For Loop = 1 To GetMaxUsers()
		If GetPlayerFlag(Loop, 10) = 14 Then
			If GetFlag(177) = Loop | GetFlag(178) = Loop Then
				MapMessage(1883, strcat(GetPlayerName(Loop), " wins by default!"), Yellow)
				PlayerWarp(Loop, 1883, 6, 6)
				Timer(Loop, 2, "TournamentRound7")
				Exit Sub
			End If
		End If
	Next Loop
End If
If GetFlag(177) = 0 & GetFlag(178) = 0 Then
	For Loop = 1 To GetMaxUsers()
		If GetPlayerFlag(Loop, 10) = 14 Then
			If GetFlag(175) = Loop | GetFlag(176) = Loop Then
				MapMessage(1883, strcat(GetPlayerName(Loop), " wins by default!"), Yellow)
				PlayerWarp(Loop, 1883, 6, 6)
				Timer(Loop, 2, "TournamentRound7")
				Exit Sub
			End If
		End If
	Next Loop
End If

For Loop = 1 To GetMaxUsers()
	If GetPlayerFlag(Loop, 10) = 14 Then
		If GetFlag(175) = Loop | GetFlag(176) = Loop Then
			SetPlayerFlag(Loop, 5, GetPlayerGuild(Loop))
			SetPlayerGuild(Loop, 0)
			SetPlayerFlag(Loop, 11, 1)
			PlayerWarp(Loop, 1883, 2, 1)
			First = Loop
		End If
		If GetFlag(177) = Loop | GetFlag(178) = Loop Then
			SetPlayerFlag(Loop, 5, GetPlayerGuild(Loop))
			SetPlayerGuild(Loop, 0)
			SetPlayerFlag(Loop, 11, 1)
			PlayerWarp(Loop, 1883, 9, 4)
			Second = Loop
		End If
	End If
Next Loop

If First > 0 & Second > 0 Then MapMessage(1883, strcat("Round 6 - ", strcat(GetPlayerName(First), strcat(" vs ", GetPlayerName(Second)))), BrightGreen)

End Sub