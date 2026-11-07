Function Main(Player as Long) AS LONG
dim Pot as Long, Loop as Long, Number as Long, Cost as Long

Pot = GetFlag(121)
Cost = GetFlag(124)
Number = 1

If GetFlag(122) = 1 Then
	If GetPlayerFlag(Player, 220) > 0 Then
		PlayerMessage(Player, strcat("Your ticket number is ", str(GetPlayerFlag(Player, 220))), White)
		Exit Function
	End If

	If HasObj(Player, 6) >= Cost Then
	
		For Loop = 1 To GetMaxUsers()
			If IsPlaying(Loop) Then
				If Loop = Player Then
				Else
					If GetPlayerFlag(Loop, 220) > 0 Then
						If StrCmp(GetPlayerIP(Player), GetPlayerIP(Loop)) Then
							PlayerMessage(Player, "You have already entered the lottery on another account", WHITE)
							Exit Function
						End If
					End If
				End If
			End If
		Next Loop
		
		TakeObj(Player, 6, Cost)
LoopStart:
		For Loop = 1 To GetMaxUsers()
			If IsPlaying(Loop) Then
				If GetPlayerFlag(Loop, 220) = Number Then
					Number = Number + 1
					Goto LoopStart
				End If
			End If
		Next Loop

		SetFlag(120, GetFlag(120) + 1)
		SetFlag(121, Pot + Cost)
		SetPlayerFlag(Player, 220, Number)
		PlayerMessage(Player, strcat("Your ticket number is ", str(Number)), White)
		If HasObj(Player, 481) = 0 Then GiveObj(Player, 481, 1)
	Else
		PlayerMessage(Player, strcat("You require ", strcat(str(Cost), " Gold to play the Lottery.")), Grey)
	End If
Else
	PlayerMessage(Player, "Lottery is not open.", Grey)
End If

End Function