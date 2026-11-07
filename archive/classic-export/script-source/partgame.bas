Function Main(Player as Long) as Long
dim Loop as Long, Count as Long, A as Long

'Artifacts
	If HasObj(Player, 393) Then RunScript1("ArtifactSpawn", Player)
	If HasObj(Player, 389) Then RunScript1("ArtifactSpawn", Player)

'Lottery
	If GetPlayerFlag(Player, 220) > 0 Then
		SetFlag(120, GetFlag(120) - 1)
		SetFlag(121, GetFlag(121) - 3000)
		For Loop = 1 To GetMaxUsers()
			If GetPlayerFlag(Loop, 220) > GetPlayerFlag(Player, 220) Then
				SetPlayerFlag(Loop, 220, GetPlayerFlag(Loop, 220) - 1)
			End If
		Next Loop
		SetPlayerFlag(Player, 220, 0)
	End If
	
'Party
If GetPlayerFlag(Player, 201) > 0 Then
	For Loop = 1 To GetMaxUsers()
		If GetPlayerFlag(Loop, 201) = GetPlayerFlag(Player, 201) Then
			PlayerMessage(Loop, strcat(GetPlayerName(Player), " has left your party."), White)
		End If
	Next Loop
	If GetPlayerFlag(Player, 202) = 1 Then
		SetPlayerFlag(Player, 202, 0)
			For Loop = 1 To GetMaxUsers()
				If GetPlayerFlag(Loop, 201) = GetPlayerFlag(Player, 201) Then
					SetPlayerFlag(Loop, 202, 1)
					Goto Finish
				End If
			Next Loop
	End If
End If
Finish:

'Solo the Champ
If GetFlag(90) = Player Then SetFlag(90, 0)
If GetFlag(95) = Player Then SetFlag(95, 0)
'Jims game
If GetFlag(96) = Player Then SetFlag(96, 0)
If GetFlag(97) = Player Then SetFlag(97, 0)

'Titan Takedown
If GetPlayerFlag(Player, 10) = 4 Then
	SetPlayerFlag(Player, 10, 0)
	SetPlayerFlag(Player, 11, 0)
	SetPlayerFlag(Player, 12, 0)
End If
   
'Carn
	If GetPlayerFlag(Player, 10) = 1 Then
		SetPlayerFlag(Player, 10, 0)
			For Loop = 1 To GetMaxUsers()
				If IsPlaying(Loop) Then
					If GetPlayerFlag(Loop, 10) = 1 Then
						Count = Count + 1
						A = Loop
					End If
				End If
			Next Loop
		If Count = 1 Then
			GlobalMessage(strcat(GetPlayerName(A), " has won Carnage!"), BrightGreen)
			PlayerWarp(A, 8, 9, 7)
			SetPlayerFlag(A, 10, 0)
		End If
	End If

'CTF
	If GetPlayerFlag(Player, 10) = 6 Then
		SetPlayerFlag(Player, 10, 0)
		If HasObj(Player, 508) Then
			GlobalMessage("The Red Flag has been returned!", BrightRed)
			TakeObj(Player, 508, HasObj(Player, 508))
			SpawnObject(70, 508, 1, 1, 6)
			SetFlag(181, 0)
		End If
		If HasObj(Player, 509) Then
			GlobalMessage("The Blue Flag has been returned!", BrightBlue)
			TakeObj(Player, 509, HasObj(Player, 509))
			SpawnObject(78, 509, 1, 10, 6)
			SetFlag(182, 0)
		End If
	End If

'Stake Arena
	If GetPlayerFlag(Player, 13) > 0 Then
		SetPlayerFlag(Player, 13, 0)
		For Loop = 1 To GetMaxUsers()
			If GetPlayerFlag(Loop, 13) > 0 Then
				Count = Count + 1
				A = Loop
			End If
		Next Loop
		If Count = 0 Then
			SetFlag(150, 0)
			MapMessage(1949, "A new duel can now begin.", Yellow)
		Else
			SetPlayerFlag(A, 13, 4)
			PlayerWarp(A, 1949, 4, 2)
			MapMessage(1949, strcat(GetPlayerName(A), "wins by default!"), Yellow)
		End If
	End If

'Duel Arena
	If GetPlayerFlag(Player, 14) > 0 Then
		SetPlayerFlag(Player, 14, 0)
		For Loop = 1 To GetMaxUsers()
			If GetPlayerFlag(Loop, 14) > 0 Then Count = Count + 1
		Next Loop
		If Count = 0 Then
			SetFlag(151, 0)
			MapMessage(1414, "A new duel can now begin.", Yellow)
		End If
	End If

'Trade Room
	If GetPlayerFlag(Player, 17) > 0 Then
		SetPlayerFlag(Player, 17, 0)
		For Loop = 1 To GetMaxUsers()
			If GetPlayerFlag(Loop, 17) > 0 Then Count = Count + 1
		Next Loop
		If Count = 0 Then
			SetFlag(152, 0)
			MapMessage(554, "A new trade can now begin.", Yellow)
		End If
	End If

'Team Arena
	If GetPlayerFlag(Player, 10) = 13 Then
		If GetFlag(153) = 1 Then
			MapMessage(1443, strcat(GetPlayerName(Player), " forfeits by logging."), Yellow)
			SetPlayerGuild(Player, GetPlayerFlag(Player, 5))
			RunScript0("TeamArenaWin")
		End If
	End If

'Tournament Arena
	If GetPlayerFlag(Player, 10) = 14 Then
		For Loop = 171 To 178
			If GetFlag(Loop) = Player Then SetFlag(Loop, 0)
		Next Loop
		If GetPlayerFlag(Player, 11) = 1 Then RunScript1("TournamentForfeit", Player)
	End If

RunScript1("ResetFlags", Player)

Main = Continue
End Function