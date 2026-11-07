Sub Main(Killer as Long, Killed as Long)

SetPlayerFlag(Killer, 12, GetPlayerFlag(Killer, 12) + 1)

Select Case GetPlayerFlag(Killed, 11)
	Case 1
		MapMessage(1443, strcat(GetPlayerName(Killer), strcat(" knocks out ", GetPlayerName(Killed))), Blue)
	Case 2
		MapMessage(1443, strcat(GetPlayerName(Killer), strcat(" knocks out ", GetPlayerName(Killed))), Red)
End Select
PlayerMessage(Killed, strcat("You got ", strcat(str(GetPlayerFlag(Killed, 12)), " kills.")), White)
SetPlayerFlag(Killed, 10, 0)
SetPlayerFlag(Killed, 11, 0)
SetPlayerFlag(Killed, 12, 0)
SetPlayerGuild(Killed, GetPlayerFlag(Killed, 5))
RunScript1("Sprite", Killed)
RunScript1("Restore", Killed)
PlayerWarp(Killed, 1443, 6, 10)

RunScript0("TeamArenaWin")

End Sub