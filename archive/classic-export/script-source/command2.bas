FUNCTION Main(Player as LONG, Command as String, Parm1 as String, Parm2 as String, Parm3 as String) AS LONG
Dim A As Long, B As Long, C As Long, D As Long, E As Long, Target As Long

Main = Stop
Target = FindPlayer(Parm1)

	If strcmp(Command, "Tackle") Then
		RunScript1("FootballTackle", Player)
		Exit Function
	End If
	
	If StrCmp(Command, "search") Then
		For A = 1 to 2000
			If InStr(GetMapName(A), Parm1) Then
				PlayerMessage(Player, StrCat(Str(A), GetMapName(A)), WHITE)
			End If
		Next A
		Exit Function
	End If

'Secondary Skills
	If strcmp(Command, "smith") Then
		Select Case GetPlayerMap(Player)
			Case 4
				RunScript2("SmithCren", Player, val(Parm1))
			Case 594
				RunScript2("SmithSanc", Player, val(Parm1))
			Case 1881
				RunScript2("SmithDrag", Player, val(Parm1))
			Case Else
				PlayerMessage(Player, "You must be in a blacksmith to smith.", Grey)
		End Select
		Exit Function
	End If

	If strcmp(Command, "cook") Then
		Select Case GetPlayerMap(Player)
			Case 551
				RunScript2("CookCrags", Player, val(Parm1))
			Case 598
				RunScript2("CookSanc", Player, val(Parm1))
			Case 950
				RunScript2("CookDrag", Player, val(Parm1))
			Case 1882
				RunScript2("CookBab", Player, val(Parm1))
			Case Else
				PlayerMessage(Player, "You must be in a kitchen to cook.", Grey)
		End Select
		Exit Function
	End If

	If strcmp(Command, "craft") Then
		Select Case GetPlayerMap(Player)
			Case 300
				RunScript2("CraftNC", Player, val(Parm1))
			Case 593
				Select Case val(Parm1)
					Case 0
						RunScript1("CraftSanc", Player)
					Case 1
						RunScript2("CraftSanc2", Player, val(Parm2))
					Case 2
						RunScript2("CraftSanc4", Player, val(Parm2))
					Case 3
						RunScript2("CraftSanc5", Player, val(Parm2))
					Case Else
						PlayerMessage(Player, "This is not a valid selection.", Grey)
				End Select
			Case 594
				RunScript2("CraftSanc3", Player, val(Parm1))
			Case Else
				PlayerMessage(Player, "You must be in a workshop to craft.", Grey)
			End Select
		Exit Function
	End If

	If strcmp(Command, "scoreboard") Then
		Select Case val(Parm1)
			Case 1
				RunScript1("Scoreboard1", Player)
			Case 2
				RunScript1("Scoreboard2", Player)
			Case 3
				RunScript1("Scoreboard3", Player)
			Case Else
				RunScript1("Scoreboard", Player)
		End Select
		Exit Function
	End If

'Staking Arena
	If StrCmp(Command, "duel") Then
		Select Case GetPlayerMap(Player)
			Case 1414
				RunScript2("duel", Player, Target)
			Case 1949	
				RunScript2("stake", Player, Target)
			Case Else
				PlayerMessage(Player, "You cannot duel here.", Grey)
		End Select
		Exit Function
	End If
	If strcmp(Command, "duelend") Then
		RunScript1("stakeend", Player)
		Exit Function
	End If
	If strcmp(Command, "duelhelp") Then
		RunScript2("duelhelp", Player, val(Parm1))
		Exit Function
	End If

'Trade Room
	If strcmp(Command, "Barter") Then
		If GetPlayerMap(Player) = 554 Then
			RunScript2("TradeWarp1", Player, Target)
		Else
			RunScript2("TradeWarp", Player, Target)
		End If
		Exit Function
	End If

'Team Arena
	If strcmp(Command, "TeamArena") Then
		RunScript1("TeamArena", Player)
		Exit Function
	End If

'Carnage Host
If GetPlayerFlag(Player, 78) = 1 | GetPlayerAccess(Player) Then
	If strcmp(Command, "CarnHost") Then
		RunScript0("CarnHost")
		Exit Function
	End If
	If strcmp(Command, "Team") Then
		RunScript3("TeamCarn", Player, Val(Parm1), Val(Parm2))
		Exit Function
	End If
	If strcmp(Command, "FFA") Then
		RunScript3("FFAScript", Player, Val(Parm1), Val(Parm2))
		Exit Function
	End If
	If strcmp(Command, "Battle") Then
		If Val(Parm2) = 0 Then
			RunScript2("battle", Player, val(Parm1))
		Else
			Timer(Player, Val(Parm2), "Battle")
			PlayerMessage(Player, strcat("Battle Royale runs in ", strcat(Parm2, " seconds.")), White)
		End If
		Exit Function
	End If
	If strcmp(Command, "CTF") Then
		RunScript2("CTF", Player, val(Parm1))
		Exit Function
	End If
	If strcmp(Command, "TTD") Then
		If Val(Parm1) = 0 Then
			RunScript0("TTD")
		Else
			Timer(Player, Val(Parm1), "TTD")
			PlayerMessage(Player, strcat("TTD runs in ", strcat(Parm1, " seconds.")), White)
		End If
		Exit Function
	End If
	If strcmp(Command, "Football") Then
		If Val(Parm2) = 0 Then
			RunScript2("Football2", Player, val(Parm1))
		Else
			Timer(Player, Val(Parm2), "Football2")
			PlayerMessage(Player, strcat("Football runs in ", strcat(Parm2, " seconds.")), White)
		End If
		Exit Function
	End If
	If strcmp(Command, "Dodgeball") Then
		If Val(Parm1) = 0 Then
			RunScript1("Dodgeball", Player)
		Else
			Timer(Player, Val(Parm1), "Dodgeball")
			PlayerMessage(Player, strcat("Dodgeball runs in ", strcat(Parm1, " seconds.")), White)
		End If
		Exit Function
	End If
	If strcmp(Command, "TournamentHost") Then
		RunScript2("TournamentHost", Player, val(Parm1))
		Exit Function
	End If
	If strcmp(Command, "Round1") Then
		RunScript0("TournamentRound1")
		Exit Function
	End If
	If strcmp(Command, "LotteryHost") Then
		RunScript2("LotteryHost", Player, val(Parm1))
		Exit Function
	End If
	If strcmp(Command, "LotteryStart") Then
		RunScript0("LotteryStart")
		Exit Function
	End If
	If strcmp(Command, "LotteryList") Then
		RunScript0("LotteryList")
		Exit Function
	End If
	If strcmp(Command, "CarnPop") Then
		RunScript0("CarnPop")
		Exit Function
	End If
	If strcmp(Command, "TTDTeams") Then
		RunScript0("TTDTeams")
		Exit Function
	End If
	If strcmp(Command, "Teams") Then
		RunScript2("Teams", Player, Val(Parm1))
		Exit Function
	End If
	If strcmp(Command, "Minigames") Then
		RunScript1("Minigame", Player)
		Exit Function
	If strcmp(Command, "spawnmonster") Then
		SpawnMonster(GetPlayerMap(Player),val(Parm1),GetPlayerX(Player),GetPlayerY(Player))
		Main = Stop
		Exit Function
	End If
	End If
End If

If GetPlayerAccess(Player) > 0 Then
	RunScript0("Command3")
Else
	PlayerMessage(Player, "Invalid command!", Yellow)
End If

End Function