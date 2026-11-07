Function Main(Killer AS LONG, Killed as LONG) as LONG
dim Map as Long, X as Long, Y as Long

Map = GetPlayerMap(Killed)
X = GetPlayerX(Killed)
Y = GetPlayerY(Killed)

	'Poison
	If GetPlayerFlag(Killed, 31) > 0 Then
		SetPlayerFlag(Killed, 31, 0)
		SetPlayerFlag(Killed, 33, 0)
	End If

	'God Death
	If GetPlayerAccess(Killed) > 0 Then
		Main = Stop
		Exit Function
	End If
	
	'Cleric Spell - Redemption
	If GetPlayerFlag(Killed, 207) > 0 Then RunScript1("redemption2", Killed)

	'Minigames
	Select Case GetPlayerFlag(Killed, 10)
		Case 1 'Carn
			RunScript2("carnkill", Killer, Killed)
			Main = Stop
			Exit Function
		Case 2 'Team Carn
			RunScript2("teamkill", Killer, Killed)
			Main = Stop
			Exit Function
		Case 3 'Battle
			RunScript2("battlekill", Killer, Killed)
			Main = Stop
			Exit Function
		Case 4 'TTD
			RunScript2("ttdkill", Killer, Killed)
			Main = Stop
			Exit Function
		Case 6 'Big CTF
			RunScript2("ctfkill", Killer, Killed)
			Main = Stop
			Exit Function
		Case 11 'Football
			RunScript2("footballkill", Killer, Killed)
			Main = Stop
			Exit Function
		Case 12 'Dodgeball
			RunScript2("dodgeballkill", Killer, Killed)
			Main = Stop
			Exit Function
		Case 13 'Team Arena
			RunScript2("teamarenakill", Killer, Killed)
			Main = Stop
			Exit Function
		Case 14 'Tournament Kill
			RunScript2("tournamentkill", Killer, Killed)
			Main = Stop
			Exit Function
		Case 16 'Snowball Tag
			RunScript2("snowballkill", Killer, Killed)
			Main = Stop
			Exit Function
	End Select

	'Hell
	If GetPlayerMap(Killed) = 666 Then
		Main = Stop
		Exit Function
	End If

	'Stake Arena
	If GetPlayerFlag(Killer, 13) = 3 Then
		RunScript2("stakekill", Killer, Killed)
		Main = Stop
		Exit Function
	End If

	'Duel Arena
	If GetPlayerFlag(Killer, 14) > 0 Then
		RunScript2("duelkill", Killer, Killed)
		Main = Stop
		Exit Function
	End If
	
	If GetPlayerMap(Killer) = 1988 | GetPlayerMap(Killer) = 1987 Then
		PlayerWarp(Killed, 1988, 6, 3)
		RunScript1("Restore", Killed)
		Main = Stop
		Exit Function
	End If

	If HasObj(Killed, 393) Then
		If GetPlayerGuild(Killer) > 0 Then
			If RunScript1("Invent", Killer) = 1 Then
				RunScript1("ArtifactSpawn", Killed)
			Else
				If HasObj(Killer, 389) | HasObj(Killer, 393) Then
					RunScript1("ArtifactSpawn", Killed)
				Else
					TakeObj(Killed, 393, HasObj(Killed, 393))
					GiveObj(Killer, 393, 1)
					GlobalMessage(strcat(GetPlayerName(Killer), " takes the Babylon Torch!"), Yellow)
				End If
			End If
		Else
			RunScript1("ArtifactSpawn", Killed)
		End If
	End If
	If HasObj(Killed, 389) Then
		If GetPlayerGuild(Killer) > 0 Then
			If RunScript1("Invent", Killer) = 1 Then
				RunScript1("ArtifactSpawn", Killed)
			Else
				If HasObj(Killer, 389) | HasObj(Killer, 393) Then
					RunScript1("ArtifactSpawn", Killed)
				Else
					TakeObj(Killed, 389, HasObj(Killed, 389))
					GiveObj(Killer, 389, 1)
					GlobalMessage(strcat(GetPlayerName(Killer), " takes the Dragonia Candle!"), Yellow)
				End If
			End If
		Else
			RunScript1("ArtifactSpawn", Killed)
		End If
	End If

	'Prevent being warped to town when killed in the arena
	Select Case GetPlayerMap(Killed)
		Case 1887 'Gallins House
			SetPlayerFlag(Killed, 30, 2)
		Case 1962 'House of PK
			SetPlayerFlag(Killed, 30, 1)
		Case Else
			SpawnObject(Map, 443, 1, X, Y)	'First Aid Kits
	End Select
	
	SetPlayerFlag(Killed, 15, 1)

	Main = Continue
End Function

