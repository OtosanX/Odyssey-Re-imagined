Sub Main()
dim Loop as Long, Flag as Long
dim Count as Long, First as Long, Second as Long

SetFlag(170, 2)

If GetFlag(173) = 0 & GetFlag(174) = 0 Then RunScript0("TournamentRound3")

If GetFlag(173) = 0 Then
	For Loop = 1 To GetMaxUsers()
		If GetPlayerFlag(Loop, 10) = 14 Then
			If GetFlag(174) = Loop Then
				MapMessage(1883, strcat(GetPlayerName(Loop), " wins by default!"), Yellow)
				PlayerWarp(Loop, 1883, 4, 6)
				Timer(Loop, 1, "TournamentRound3")
				Exit Sub
			End If
		End If
	Next Loop
End If

If GetFlag(174) = 0 Then
	For Loop = 1 To GetMaxUsers()
		If GetPlayerFlag(Loop, 10) = 14 Then
			If GetFlag(173) = Loop Then
				MapMessage(1883, strcat(GetPlayerName(Loop), " wins by default!"), Yellow)
				PlayerWarp(Loop, 1883, 4, 6)
				Timer(Loop, 1, "TournamentRound3")
				Exit Sub
			End If
		End If
	Next Loop
End If

For Loop = 1 To GetMaxUsers()
	If GetPlayerMap(Loop) = 1883 Then
		If GetFlag(173) = Loop Then
			SetPlayerFlag(Loop, 5, GetPlayerGuild(Loop))
			SetPlayerGuild(Loop, 0)
			SetPlayerFlag(Loop, 11, 1)
			PlayerWarp(Loop, 1883, 2, 1)
			First = Loop
		End If
		If GetFlag(174) = Loop Then
			SetPlayerFlag(Loop, 5, GetPlayerGuild(Loop))
			SetPlayerGuild(Loop, 0)
			SetPlayerFlag(Loop, 11, 1)
			PlayerWarp(Loop, 1883, 9, 4)
			Second = Loop
		End If
	End If
Next Loop

If First > 0 & Second > 0 Then MapMessage(1883, strcat("Round 2 - ", strcat(GetPlayerName(First), strcat(" vs ", GetPlayerName(Second)))), BrightGreen)

End Sub