Function Main(Player as Long) AS Long
dim Loop as Long, WinNum as Long

WinNum = Random(GetFlag(120)) + 1

For Loop = 1 To GetMaxUsers()
	If IsPlaying(Loop) Then
		If GetPlayerFlag(Loop, 220) = WinNum Then
			GlobalMessage(strcat("And the winning number is...", strcat(str(WinNum), "!")), Yellow)
			GlobalMessage(strcat(GetPlayerName(Loop), strcat(" wins the Jackpot of ", strcat(str(GetFlag(121)), "!!"))), BrightGreen)
			GiveObj(Loop, 6, GetFlag(121) + GetFlag(123))
			SetFlag(120, 0)
			SetFlag(121, 0)
			SetFlag(122, 0)
			Goto ResetFlags
		End If
	End If
Next Loop

ResetFlags:
For Loop = 1 To GetMaxUsers()
	SetPlayerFlag(Loop, 220, 0)
	TakeObj(Loop, 481, 1)
Next Loop
End Function