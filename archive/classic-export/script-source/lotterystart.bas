Function Main(Player as Long) AS Long
dim Loop as Long, WinNum as Long, Rake as Long

If GetFlag(122) > 0 Then
	WinNum = Random(GetFlag(120)) + 1
	Rake = Divide(GetFlag(121), 10)
	SetFlag(121, GetFlag(121) - Rake)
	SetFlag(123, GetFlag(123) + Rake)

	For Loop = 1 To GetMaxUsers()
		If GetPlayerFlag(Loop, 220) <> WinNum Then SetPlayerFlag(Loop, 220, 0)
		TakeObj(Loop, 481, HasObj(Loop, 481))
	Next Loop

	GlobalMessage(strcat("The Odyssey Lottery Commission takes a rake of ", strcat(str(Rake), " Gold and adds it to the Jackpot Fund.")), White)
	For Loop = 1 To GetMaxUsers()
		If IsPlaying(Loop) Then
			If GetPlayerFlag(Loop, 220) = WinNum Then
				GlobalMessage(strcat("And the winning number is...", strcat(str(WinNum), "!")), Yellow)
				GlobalMessage(strcat(GetPlayerName(Loop), strcat(" wins the pot of ", strcat(str(GetFlag(121)), "!!"))), BrightGreen)
				GiveObj(Loop, 6, GetFlag(121))
				SetPlayerFlag(Loop, 220, 0)
				SetFlag(120, 0)
				SetFlag(121, 0)
				SetFlag(122, 0)
				RunScript1("JACKPOT", Player)
				Goto EndLoop
			End If
		End If
	Next Loop
EndLoop:
Else
	PlayerMessage(Player, "The Lottery is not open.", Grey)
End If

End Function