FUNCTION Main(Player as LONG, Command as String, Parm1 as String, Parm2 as String, Parm3 as String) AS LONG
Dim A As Long, B As Long, C As Long, D As Long, E As Long, Target As Long

Main = Stop
Target = FindPlayer(Parm1)

'General
	If strcmp(Command, "sprite") Then
		RunScript2("SetSprite", Player, Val(Parm1))
		Exit Function
	End If
	
	If strcmp(Command, "status") Then
		RunScript2("SetStatus", Player, Val(Parm1))
		Exit Function
	End If

	If strcmp(Command, "quests") Then
		RunScript1("QuestLog", Player)
		Exit Function
	End If

'	If strcmp(Command, "unfreeze") | strcmp(Command, "u") Then
'		RunScript1("CheckFrozen", Player)
'		Exit Function
'	End If

	If strcmp(Command, "Artifacts") Then
		RunScript1("Artifact", Player)
		Exit Function
	End If

	If strcmp(Command, "rules") Then
		RunScript1("Rules", Player)
		Exit Function
	End If

'Market
	If strcmp(Command, "Lottery") Then
		RunScript1("Lottery", Player)
		Exit Function
	End If

'Store
	If strcmp(Command, "Incognito") Then
		RunScript1("Incognito", Player)
		Exit Function
	End If

	If strcmp(Command, "FloatText") & GetPlayerFlag(Player, 72) = 1 Then
	If GetPlayerFlag(Player, 109) > 0 Then Exit Function
		SetPlayerFlag(Player, 109, 1)
		Timer(Player, 1, "PushTimer")
		If strlen(Parm1) <= 25 Then
			CreatePlayerFloatText(Player, Parm1, Val(Parm2))
		Else
			PlayerMessage(Player, "Message is too long.", Grey)
		End If
		Exit Function
	End If

	If strcmp(Command, "Push") Then
		RunScript1("Push", Player)
		Exit Function
	End If

	If strcmp(Command, "Guard") Then
		If IsPlaying(Target) Then RunScript2("Guard", Player, Target)
		Exit Function
	End If
	
	'if strcmp(command, "attack") then
	'if getplayerguild(player) = getflag(186) & getflag(185) > 0 then 
	'	If IsPlaying(Target) Then RunScript2("attack", Player, Target)
		
	'else
	'playermessage(player, "Your guild does not have special access to the Darkcone Fort.", white)
	'Exit Function
	'end if
	'end if
	
	
	
	'If strcmp(Command, "Attack") & if getplayerguild(player) = getflag(186) & getflag(185) > 0 then 
	'Fort
		'If strcmp(Command, "fort") Then
		'If IsPlaying(Target) Then RunScript2("attack", Player, Target)
		'Exit Function
	'End If

	If strcmp(Command, "PkRemove") Then
		If GetPlayerFlag(Player, 77) = 1 Then SetPlayerStatus(Player, GetPlayerFlag(Player, 133))
		Exit Function
	End If
'Party
	If strcmp(Command, "party") Then
		If strcmp(Parm1, "") Then
			RunScript0("party")
			Exit Function
		End If
		If strcmp(Parm1, "new") Then
			RunScript1("partynew", Player)
			Exit Function
		End If
		If strcmp(Parm1, "invite") Then
			RunScript2("partyinvite", Player, FindPlayer(Parm2))
			Exit Function
		End If
		If strcmp(Parm1, "join") Then
			RunScript1("partyjoin", Player)
			Exit Function
		End If
		If strcmp(Parm1, "leave") Then
			RunScript1("partyleave", Player)
			Exit Function
		End If
		If strcmp(Parm1, "leader") Then
			RunScript2("partyleader", Player, FindPlayer(Parm2))
			Exit Function
		End If
		If strcmp(Parm1, "boot") Then
			RunScript2("partyboot", Player, FindPlayer(Parm2))
			Exit Function
		End If
		If strcmp(Parm1, "roll") Then
			RunScript1("partyroll", Player)
			Exit Function
		End If
		If strcmp(Parm1, "who") Then
			RunScript1("partywho", Player)
			Exit Function
		End If
		If strcmp(Parm1, "chat") Then
			RunScript0("partychat")
			Exit Function
		End If
		If StrCmp(Parm1, "help") Then
			RunScript1("partyhelp", Player)
			Exit Function
		End If
		
		PlayerMessage(Player, "That is an invalid Party command.", Yellow)
		Exit Function
	End If

'Player God Commands
	If GetPlayerFlag(Player, 78) > 0 | GetPlayerAccess(Player) > 0 | GetPlayerFlag(Player, 74) = 1 Then
		If strcmp(Command, "Boot") Then
			A = FindPlayer(Parm1)
			If IsPlaying(A) Then
				If strcmp(Parm2, "") Then
					PlayerMessage(Player, "You must enter a good, descriptive reason", WHITE)
				Else
					BootPlayer(A, StrCat(StrCat(GetPlayerName(Player), " has booted you - "), Parm2))
				End If
			Else
				PlayerMessage(Player, "Player not found", WHITE)
			End If
			Exit Function
		End If
		If strcmp(Command, "Ban") Then
			A = FindPlayer(Parm1)
			If IsPlaying(A) Then
				If strcmp(Parm2, "") Then
					PlayerMessage(Player, "You must enter a good, descriptive reason", WHITE)
				Else
					If GetPlayerAccess(Player) = 0 Then
						BanPlayer(A, 1, StrCat(StrCat(GetPlayerName(Player), " has banned you - "), Parm2))
					Else
						PlayerMessage(Player, "That player is a god.", Grey)
					End If
				End If
			Else
				PlayerMessage(Player, "Player not found", WHITE)
			End If
			Exit Function
		End If
		If strcmp(Command, "Jail") Then
			RunScript3("GODJAIL", Player, Target, Val(Parm2))
			Exit Function
		End If
		If strcmp(Command, "Squelch") Then
			RunScript3("GODSQUELCH", Player, Target, Val(Parm2))
			Exit Function
		End If
	End If

'Minigames
If GetPlayerFlag(Player, 40) = 0 Then 'Jail
	If strcmp(Command, "Carn") Then
		If GetPlayerFlag(Player, 10) > 0 Then
			PlayerMessage(Player, "You are already in a Minigame.", Grey)
		Else
			Runscript1("Carn", Player)
		End If
		Exit Function
	End If
	
	If strcmp(Command, "Tof") Then
		If GetPlayerFlag(Player, 10) > 0 Then
			PlayerMessage(Player, "You are already in a Minigame.", Grey)
		Else
			RunScript1("TOF", Player)
		End If
		Exit Function
	End If

	If strcmp(Command, "Champ") Then
		If GetFlag(90) <> Player & GetFlag(95) <> Player Then
			If GetPlayerFlag(Player, 10) > 0 Then
				PlayerMessage(Player, "You are already in a Minigame.", Grey)
			Else
				RunScript1("Champ", Player)
			End If
			Exit Function
		Else
			PlayerMessage(Player, "You are already in Solo the Champ.", Grey)
			Exit Function
		End If
	End If
	
	If strcmp(Command, "Tourny") Then
		If GetPlayerFlag(Player, 10) > 0 Then
			PlayerMessage(Player, "You are already in a Minigame.", Grey)
		Else
			RunScript1("Tournament", Player)
		End If
		Exit Function
	End If
	
	If strcmp(Command, "saveme") Then
		PlayerWarp(Player, 2100, 1, 11) 'catch exploiter
			'MapMessage(2100, "saveme", brightgreen) ' to see who exploits
		Exit Function
	End If
	
	If strcmp(Command, "fille") Then
		PlayerWarp(Player, 2100, 1, 11) 'catch exploiter
		'SetPlayerEnergy(Player, GetPlayerMaxEnergy(Player))
		'MapMessage(2100, "fille", Brightgreen) 'to see who exploits

		Exit Function
	End If
Else
	PlayerMessage(Player, "You cant escape that easily...", Grey)
	Exit Function
End If

RunScript0("Command2")

End Function