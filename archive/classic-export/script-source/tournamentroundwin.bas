Sub Main(Killer as Long, Killed as Long)
	dim Flag as Long

	For Flag = 171 To 178
		If GetFlag(Flag) = Killed Then SetFlag(Flag, 0)
	Next Flag
	MapMessage(1883, strcat(GetPlayerName(Killer), strcat(" beats down ", strcat(GetPlayerName(Killed), StrCat(" to win the Round!  HP Remaining: ", Str(GetPlayerHP(Killer)))))), Yellow)
	PlayerWarp(Killed, 1883, Random(2) + 10, Random(2) + 6)
	RunScript1("Restore", Killer)
	RunScript1("Restore", Killed)
	SetPlayerFlag(Killer, 11, 0)
	SetPlayerFlag(Killed, 11, 0)
	SetPlayerGuild(Killer, GetPlayerFlag(Killer, 5))
	SetPlayerGuild(Killed, GetPlayerFlag(Killed, 5))
End Sub