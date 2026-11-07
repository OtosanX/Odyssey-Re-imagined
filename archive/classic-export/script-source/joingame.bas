Function Main(Player As Long) As Long
	Dim A as Long
	'Reset Flags
	RunScript1("ResetFlags", Player)

	If StrCmp(GetMapName(GetPlayerMap(Player)), "") Then PlayerWarp(Player, 1, 5, 5)

	'Player God MOTD
	If GetPlayerFlag(Player, 78) > 0 Then
		PlayerMessage(Player, "You are a helper god.  Available commands are warpto <player>, boot <player> <reason>, ban <player> <reason>, squelch <player> <time>, and jail <player> <time>.", WHITE)
	End If

	'New Player
	If GetPlayerLevel(Player) < 10 Then
		PlayerWarp(Player, 677, 2, 2)
		CalculateStats(Player)
		SetPlayerHP(Player, GetPlayerMaxHP(Player))
		SetPlayerStatus(Player, 2)
		PlayerMessage(Player, "Welcome to Odyssey!  To move about, use the arrow keys.  To run, hold shift while moving.  Head downward to embark on your adventure!", BRIGHTGREEN)
	End If
	If GetPlayerLevel(Player) < 25 Then
		PlayerMessage(Player, "Make sure to check the website at www.odysseyclassic.com for extra help.", Yellow)
	End If

	TakeObj(Player, 510, HasObj(Player, 510)) 'Old Incognito
	TakeObj(Player, 497, HasObj(Player, 497)) 'CTF Name Change
	TakeObj(Player, 362, HasObj(Player, 362)) 'Dodgeball
	TakeObj(Player, 383, HasObj(Player, 383)) 'Snowtossers
	TakeObj(Player, 508, HasObj(Player, 508)) 'Red Flag
	TakeObj(Player, 509, HasObj(Player, 509)) 'Blue Flag

	'------- Bug Fix? -------
	If StrCmp(GetPlayerName(Player), "") Then SetPlayerName(Player, "Bugged")

	RunScript1("Sprite", Player)
	RunScript1("Orders", Player)
	'RunScript1("ResetPots", Player)

	'Artifacts
		If HasObj(Player, 393) Then RunScript1("ArtifactSpawn", Player)
		If HasObj(Player, 389) Then RunScript1("ArtifactSpawn", Player)

	'If GetPlayerLevel(Player) > 80 & GetPlayerAccess(Player) = 0 Then PlayerWarp(Player, 666, 5, 5)
	If GetPlayerFlag(Player, 31) > 0 Then RunScript1("Poison1", Player)

	If GetPlayerFlag(Player, 40) > 0 Then PlayerMessage(Player, strcat("You have ", strcat(str(GetPlayerFlag(Player, 40)), " minutes left to serve.")), White)

	Main = Continue
End Function