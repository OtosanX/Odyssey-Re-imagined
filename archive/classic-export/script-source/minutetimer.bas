Sub Main()
	Dim Hour as Long, Minute as Long, Loop as Long 

	SetFlag(94, GetFlag(94) + 1)								'Minute Timer
	If GetFlag(94) % 60 = 0 Then SetFlag(98, GetFlag(98) + 1)	'Hour Timer

	'1 Minute
	RunScript0("LightTimer")
	RunScript0("JailTimer")
	RunScript0("Artifacts")
	'Lavos
	RunScript0("LavosTimer")
	'Fort
	Runscript0("FortTimer")
	'AB Boss
	Runscript0("ABtimer")


	'Fort 1a (test)
	'dim d as long
	'for d = 1 to getmaxusers()
	'if getplayerflag(d,184) > 10 then
	'setplayerflag(d,184,0)

	'else
	'if getplayerflag(d,184) > 0 then
	'setplayerflag(d, 184, getplayerflag(d,184)+1)
	'end if
	'end if

	'next d

	'Fort 1b
	if getflag(185) > 180 then
		setflag(185,0)
		setflag(186,0)
	else
		if getflag(185) > 0 then
			setflag(185, getflag(185)+1)
		end if
	end if


	'fortvault
	If getflag(187) > 0 Then
		Setflag(187, getflag(187) - 1)
	end if

	'vault
	If GetFlag(188) > 0 Then 'Fort Reward Timer
		If GetMapPlayerCount(2119) = 0 then
			setflag(188, 0)
			setflag(187, 100)
		End if
	end if

	If GetFlag(85) > 0 Then RunScript0("TofTimer")
	If GetFlag(89) > 0 Then RunScript0("ChampTimer")
	If GetFlag(99) > 0 Then RunScript0("FootballTimer")
	If GetFlag(82) = 1 Then GlobalMessage("Carnage will begin shortly, type /carn for a instant warp to the waiting room!  You do not lose items or experience in a carnage battle.", BrightBlue)
	If GetFlag(145) > 0 Then
		If GetFlag(146) = 0 Then
			RunScript0("SancGame2End")
		Else
			SetFlag(146, GetFlag(146) - 1)
			If GetFlag(146) = 0 Then MapMessage(620, "One Minute Left!", Yellow)
		End If
	End If

	'5 Minutes
	If GetFlag(94) % 5 = 0 Then
		If GetFlag(80) > 0 Then GlobalMessage("Tournament Arena is currently open. Type /tourny to join.", Yellow)
		If GetFlag(85) > 0 Then GlobalMessage("ToF is currently open. Type /tof to join.", Yellow)
		If GetFlag(89) > 10 Then GlobalMessage("Solo the Champ is currently open. Type /champ to join.", Yellow)
		If GetFlag(122) > 0 Then GlobalMessage(strcat("The Odyssey Lottery is now open! Type /lottery with ", strcat(str(GetFlag(124)), " Gold to play!")), BrightGreen)
	End If

	'60 Minutes
	If GetFlag(94) % 60 = 10 Then
		For Loop = 1 To GetMaxUsers()
			RunScript1("ArtifactSpawn", Loop)
		Next Loop
	End If
	'If GetFlag(94) % 60 = 25 Then RunScript0("Average")
	'If GetFlag(94) % 60 = 40 Then RunScript0("Guilds")
	'If GetFlag(94) % 60 = 55 Then RunScript0("Average")

	'7 Hours
	If GetFlag(98) % 7 = 0 & GetFlag(94) % 60 = 0 Then
		If GetFlag(89) = 0 Then RunScript0("ChampHost")  
	End If
	
	RunScript0("BlockerCheck")
	'RunScript1("DuckAttack", 79)
End Sub