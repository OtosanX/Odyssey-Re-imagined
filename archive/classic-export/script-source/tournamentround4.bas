Sub Main()
dim Loop as Long, Flag as Long
dim Count as Long, First as Long, Second as Long

SetFlag(170, 4)

If GetFlag(177) = 0 & GetFlag(178) = 0 Then RunScript0("TournamentRound5")

If GetFlag(177) = 0 Then
	For Loop = 1 To GetMaxUsers()
		If GetPlayerFlag(Loop, 10) = 14 Then
			If GetFlag(178) = Loop Then
				MapMessage(1883, strcat(GetPlayerName(Loop), " wins by default!"), Yellow)
				PlayerWarp(Loop, 1883, 8, 6)
				Timer(Loop, 2, "TournamentRound5")
				Exit Sub
			End If
		End If
	Next Loop
End If

If GetFlag(178) = 0 Then
	For Loop = 1 To GetMaxUsers()
		If GetPlayerFlag(Loop, 10) = 14 Then
			If GetFlag(177) = Loop Then
				MapMessage(1883, strcat(GetPlayerName(Loop), " wins by default!"), Yellow)
				PlayerWarp(Loop, 1883, 8, 6)
				Timer(Loop, 2, "TournamentRound5")
				Exit Sub
			End If
		End If
	Next Loop
End If

For Loop = 1 To GetMaxUsers()
	If GetPlayerMap(Loop) = 1883 Then
		If GetFlag(177) = Loop Then
			SetPlayerFlag(Loop, 5, GetPlayerGuild(Loop))
			SetPlayerGuild(Loop, 0)
			SetPlayerFlag(Loop, 11, 1)
			PlayerWarp(Loop, 1883, 2, 1)
			First = Loop
		End If
		If GetFlag(178) = Loop Then
			SetPlayerFlag(Loop, 5, GetPlayerGuild(Loop))
			SetPlayerGuild(Loop, 0)
			SetPlayerFlag(Loop, 11, 1)
			PlayerWarp(Loop, 1883, 9, 4)
			Second = Loop
		End If
	End If
Next Loop

If First > 0 & Second > 0 Then MapMessage(1883, strcat("Round 4 - ", strcat(GetPlayerName(First), strcat(" vs ", GetPlayerName(Second)))), BrightGreen)

End Sub