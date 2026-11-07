Function Main(Killer as Long, Killed as Long) AS LONG
dim Loop as Long

'Flag 86 = Red Score
'Flag 87 = Blue Score
'Flag 88 = Kill Limit

SetPlayerFlag(Killer, 12, GetPlayerFlag(Killer, 12) + 1)	'Player Scores

If GetPlayerFlag(Killer, 11) = 1 Then	'Red Team Scores
	SetFlag(86, GetFlag(86) + 1)
	PlayerWarp(Killed, 1422, 11, 1)
	SetPlayerSprite(Killed, 7)
	SetPlayerGuild(Killed, 101)
	MapMessage(1420, strcat(GetPlayerName(Killer), strcat(" beats down ", GetPlayerName(Killed))), BrightRed)
	MapMessage(1421, strcat(GetPlayerName(Killer), strcat(" beats down ", GetPlayerName(Killed))), BrightRed)
	MapMessage(1422, strcat(GetPlayerName(Killer), strcat(" beats down ", GetPlayerName(Killed))), BrightRed)
End If
If GetPlayerFlag(Killer, 11) = 2 Then	'Blue Team Scores
	SetFlag(87, GetFlag(87) + 1)
	PlayerWarp(Killed, 1421, 0, 1)
	SetPlayerSprite(Killed, 1)
	SetPlayerGuild(Killed, 100)
	MapMessage(1420, strcat(GetPlayerName(Killer), strcat(" beats down ", GetPlayerName(Killed))), BrightBlue)
	MapMessage(1421, strcat(GetPlayerName(Killer), strcat(" beats down ", GetPlayerName(Killed))), BrightBlue)
	MapMessage(1422, strcat(GetPlayerName(Killer), strcat(" beats down ", GetPlayerName(Killed))), BrightBlue)
End If

RunScript1("Restore", Killed)
	
'Red Team Wins
If GetFlag(86) >= GetFlag(88) Then
	GlobalMessage(strcat("Red Team wins Battle Royale with ", strcat(str(GetFlag(86)), " kills!")), BrightGreen)
	For Loop = 1 To GetMaxUsers()
		If GetPlayerFlag(Loop, 10) = 3 Then
			PlayerMessage(Loop, strcat("Your score was ", strcat(str(GetPlayerFlag(Loop, 12)), " kills")), Yellow)
			If GetPlayerFlag(Loop, 11) = 1 Then GiveObj(Loop, 484, 1)
			SetPlayerGuild(Loop, GetPlayerFlag(Loop, 5))
			SetPlayerFlag(Loop, 10, 0)
			SetPlayerFlag(Loop, 11, 0)
			SetPlayerFlag(Loop, 12, 0)
			RunScript1("GameWarp", Loop)
			RunScript1("Restore", Loop)
			RunScript1("Sprite", Loop)
			SetFlag(86, 0)
			SetFlag(87, 0)
		End If
	Next Loop
End If
'Blue Team Wins
If GetFlag(87) >= GetFlag(88) Then
	GlobalMessage(strcat("Blue Team wins Battle Royale with ", strcat(str(GetFlag(87)), " kills!")), BrightGreen)
	For Loop = 1 To GetMaxUsers()
		If GetPlayerFlag(Loop, 10) = 3 Then
			PlayerMessage(Loop, strcat("Your score was ", strcat(str(GetPlayerFlag(Loop, 12)), " kills")), Yellow)
			If GetPlayerFlag(Loop, 11) = 2 Then GiveObj(Loop, 484, 1)
			SetPlayerGuild(Loop, GetPlayerFlag(Loop, 5))
			SetPlayerFlag(Loop, 10, 0)
			SetPlayerFlag(Loop, 11, 0)
			SetPlayerFlag(Loop, 12, 0)
			RunScript1("GameWarp", Loop)
			RunScript1("Restore", Loop)
			RunScript1("Sprite", Loop)
			SetFlag(86, 0)
			SetFlag(87, 0)
		End If
	Next Loop
End If

End Function