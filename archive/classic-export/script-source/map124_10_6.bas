Function Main(player as long) as long
dim a as long

For A = 1 To GetMaxUsers()
	If GetPlayerGuild(A) = 0 Then
		If GetPlayerFlag(A, 10) = 1 Then
			SetPlayerFlag(A, 10, 0)
			PlayerWarp(A, 677, 5, 5)
			BootPlayer(A, "Left Guild in CTF")
		End If
	End If
Next A

'Spectator
If GetPlayerGuild(Player) <> 30 & GetPlayerGuild(Player) <> 31 Then
	Exit Function
End If

'RedTeam
If getplayerguild(player) = 30 then
	exit function
end if

'BlueTeam
If getplayerguild(player) = 31 then
If hasobj(player,508) then		'Has Red Flag

For A = 0 to getmaxusers
	If HasObj(A, 509) Then		'Blue Flag Gone
		PlayerMessage(Player, "You must recover your flag first!", 15)
		exit function
	end if
Next A

'Blue Score
setflag(63,getflag(63)+1)
globalmessage(strcat(getplayername(player), " has scored for the Blue Team!"),white)
globalmessage(strcat("<Score> Red Team: ", strcat(str(getflag(62)),strcat(" Blue Team: ",strcat(str(getflag(63)), " <Score>")))),yellow)
takeobj(player,508,1)
setplayerstatus(player,0)
setPlayerSprite(Player, 133)
ResetMap(124)
ResetMap(149)
ResetMap(150)
for a = 0 to getmaxusers
	If GetPlayerMap(A) = 124 | GetPlayerMap(A) = 149 | GetPlayerMap(A) = 150 Then
		takeobj(a,509,1)
		SetPlayerStatus(a, 0)
		SetPlayerHP(a, GetPlayerMaxHP(a))
		SetPlayerEnergy(a, GetPlayerMaxEnergy(a))
		SetPlayerMana(a, GetPlayerMaxMana(a))
			if getplayerguild(a) = 31 then
				playerwarp(a,124,8,6)
				setPlayerSprite(a, 133)
			End If
			if getplayerguild(a) = 30 then
				playerwarp(a,150,3,6)
				setPlayerSprite(a, 132)
			End If
	End If
next a

'Blue Team Wins
if getflag(63) = 5 then
 globalmessage("The Blue Team has won Capture the Flag!",brightGreen)
 setflag(62,0)
 setflag(63,0)
      
      for a = 0 to getmaxusers
		if getplayermap(a) = 124 | getplayermap(a) = 149 | getplayermap(a) = 150 then
			if getplayeraccess(a) = 0 then
				If GetPlayerGuild(A) = 31 Then GiveObj(A, 504, 1)
				SetPlayerStatus(A,0)
				SetPlayerSprite(A,0)
				SetPlayerGuild(A, GetPlayerFlag(A, 5))
				Playerwarp(A, 677,5,5)	
			end if
		end if 
      next a
      Exit Function
end if

'Spawn Flags
SpawnObject(150, 508, 1, 1, 6)
SpawnObject(124, 509, 1, 10, 6)
exit function

else
	PlayerWarp(Player, 124, 9, 6)
	exit function
end if
end if

End Function