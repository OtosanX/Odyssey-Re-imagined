Function Main(Player as Long, Command as String, Parm1 as String, Parm2 as String, Parm3 as String, Parm4 as String) AS LONG
dim Target as Long

Target = FindPlayer(Parm1)

'God Commands
If GetPlayerAccess(Player) > 0 Then
	If strcmp(Command, "scriptban") Then
		BanPlayer(Target, Val(Parm2), Parm3)
		Main = Stop
		Exit Function
	End If
	If strcmp(Command, "restore") Then
		RunScript2("restore", Player, Target)
		Exit Function
	End If
	If strcmp(Command, "user") Then
		PlayerMessage(Player, strcat(GetPlayerName(Target), strcat(" - ", GetPlayerUser(Target))), White)
		Exit Function
	End If
	If strcmp(Command, "ip") Then
		PlayerMessage(Player, strcat(GetPlayerName(Target), strcat(" - ", GetPlayerIP(Target))), White)
		Exit Function
	End If
	If strcmp(Command, "light") Then
		SetOutdoorLight (Val(Parm1))
		Exit Function
	End If

	If strcmp(Command, "level") Then
		RunScript2("level", Target, Val(Parm2))
		Exit Function
	End If

	If strcmp(Command, "average") Then
		RunScript0 ("Average")
		Exit Function
	End If

	If strcmp(Command, "globaltimer") Then
		RunScript1("GlobalCommand", Val(Parm1))
		Exit Function
	End If

	If strcmp(Command, "get") Then
		If Val(Parm2) = 0 Then Parm2 = "1"
		GiveObj(Player, Val(Parm1), Val(Parm2))
		Exit Function
	End If

	If strcmp(Command, "give") Then
		GiveObj(Target, Val(Parm2), Val(Parm3))
		PlayerMessage(Player, strcat("You have given ", strcat(GetPlayerName(Target), strcat(" ", strcat(Parm3, strcat(" ", GetObjectName(Val(Parm2))))))), Yellow)
		Exit Function
	End If

	If strcmp(Command, "take") Then
		TakeObj(Target, Val(Parm2), Val(Parm3))
		PlayerMessage(Player, strcat("You have taken ", strcat(Parm3, strcat(" ", strcat(GetObjectName(Val(Parm2)), strcat(" from ", GetPlayerName(Target)))))), Yellow)
		Exit Function
	End If

	If strcmp(Command, "run") Then
		RunScript0(Parm1)
		Exit Function
	End If
	
	If StrCmp(Command, "macropwn") Then
		RunScript1("macropwn", Target)
		Exit Function
	End If

	If strcmp(Command, "scan") Then
		RunScript2("scan", Player, Target)
		Exit Function
	End If

	If strcmp(Command, "class") Then
		SetPlayerClass(Player, val(Parm1))
		Exit Function
	End If

	If strcmp(Command, "checkinvis") Then
		RunScript1("CheckInvis", Player)
		Exit Function
	End If

 	If StrCmp(Command, "setflag") Then
		SetPlayerFlag(Target, Val(Parm2), Val(Parm3))
		Exit Function
	End If
	
 	If StrCmp(Command, "setsflag") Then
		SetFlag(Val(Parm1), Val(Parm2))
		Exit Function
	End If
	
 	If StrCmp(Command, "getsflag") Then
		PlayerMessage(Player, Str(GetFlag(Val(Parm1))), WHITE)
		Exit Function
	End If
	
	If Strcmp(Command, "lavos123") & getplayeraccess(player) > 0 Then
		SetEquippedItemSuffix(Player,5,255)
		'GlobalMessage("You hear volcanic eruptions in the distance indicating Fire Lord Lavos will ascend from the depths in 25 minutes.", Brightred)
	End if
	
	If Strcmp(Command, "lavostimer") & getplayeraccess(player) > 0 Then
	setflag(184, 30)
	End if
	

'Event Commands
	If strcmp(Command, "TOFhost") Then
		RunScript0("TofHost")
		Exit Function
	End If

	If strcmp(Command, "ChampHost") Then
		RunScript0 ("ChampHost")
		Exit Function
	End If

	If strcmp(Command, "ChampBan") Then
		RunScript2("ChampBan", Player, Target)
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

'Pictures
	If strcmp(Command, "bunnyxyz") Then RunScript0 ("bunny")
	If strcmp(Command, "batxyz") Then RunScript0 ("bat")
	If strcmp(Command, "devilxyz") Then RunScript0 ("devil")

	If strcmp(Command, "marstest") Then RunScript2("MarsTest", Player, val(Parm1))
	
	If StrCmp(Command, "res") Then RunScript2("GodRes", Player, Val(Parm1))
End If

PlayerMessage(Player, "Invalid command!", Yellow)

End Function