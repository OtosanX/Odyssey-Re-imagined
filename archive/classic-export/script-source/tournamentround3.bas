Sub Main()
dim Loop as Long, Flag as Long
dim Count as Long, First as Long, Second as Long

SetFlag(170, 3)

If GetFlag(175) = 0 & GetFlag(176) = 0 Then RunScript0("TournamentRound4")

If GetFlag(175) = 0 Then
	For Loop = 1 To GetMaxUsers()
		If GetPlayerFlag(Loop, 10) = 14 Then
			If GetFlag(176) = Loop Then
				MapMessage(1883, strcat(GetPlayerName(Loop), " wins by default!"), Yellow)
				PlayerWarp(Loop, 1883, 6, 6)
				Timer(Loop, 2, "TournamentRound4")
				Exit Sub
			End If
		End If
	Next Loop
End If

If GetFlag(176) = 0 Then
	For Loop = 1 To GetMaxUsers()
		If GetPlayerFlag(Loop, 10) = 14 Then
			If GetFlag(175) = Loop Then
				MapMessage(1883, strcat(GetPlayerName(Loop), " wins by default!"), Yellow)
				PlayerWarp(Loop, 1883, 6, 6)
				Timer(Loop, 2, "TournamentRound4")
				Exit Sub
			End If
		End If
	Next Loop
End If

For Loop = 1 To GetMaxUsers()
	If GetPlayerMap(Loop) = 1883 Then
		If GetFlag(175) = Loop Then
			SetPlayerFlag(Loop, 5, GetPlayerGuild(Loop))
			SetPlayerGuild(Loop, 0)
			SetPlayerFlag(Loop, 11, 1)
			PlayerWarp(Loop, 1883, 2, 1)
			First = Loop
		End If
		If GetFlag(176) = Loop Then
			SetPlayerFlag(Loop, 5, GetPlayerGuild(Loop))
			SetPlayerGuild(Loop, 0)
			SetPlayerFlag(Loop, 11, 1)
			PlayerWarp(Loop, 1883, 9, 4)
			Second = Loop
		End If
	End If
Next Loop

If First > 0 & Second > 0 Then MapMessage(1883, strcat("Round 3 - ", strcat(GetPlayerName(First), strcat(" vs ", GetPlayerName(Second)))), BrightGreen)

End Sub