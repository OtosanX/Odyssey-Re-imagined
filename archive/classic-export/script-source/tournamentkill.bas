Sub Main(Killer as Long, Killed as Long)

If GetFlag(171) = Killer Then
	If GetFlag(172) = Killed Then
		PlayerWarp(Killer, 1883, 2, 6)
		RunScript2("TournamentRoundWin", Killer, Killed)
		Timer(Killer, 2, "TournamentRound2")
	End If
	If GetFlag(173) = Killed | GetFlag(174) = Killed Then
		PlayerWarp(Killer, 1883, 4, 6)
		RunScript2("TournamentRoundWin", Killer, Killed)
		Timer(Killer, 2, "TournamentRound6")
	End If
	If GetFlag(175) = Killed | GetFlag(176) = Killed | GetFlag(177) = Killed | GetFlag(178) = Killed Then
		RunScript2("TournamentWin", Killer, Killed)
	End If
End If

If GetFlag(172) = Killer Then
	If GetFlag(171) = Killed Then
		PlayerWarp(Killer, 1883, 2, 6)
		RunScript2("TournamentRoundWin", Killer, Killed)
		Timer(Killer, 2, "TournamentRound2")
	End If
	If GetFlag(173) = Killed | GetFlag(174) = Killed Then
		PlayerWarp(Killer, 1883, 4, 6)
		RunScript2("TournamentRoundWin", Killer, Killed)
		Timer(Killer, 2, "TournamentRound6")
	End If
	If GetFlag(175) = Killed | GetFlag(176) = Killed | GetFlag(177) = Killed | GetFlag(178) = Killed Then
		RunScript2("TournamentWin", Killer, Killed)
	End If
End If

If GetFlag(173) = Killer Then
	If GetFlag(174) = Killed Then
		PlayerWarp(Killer, 1883, 4, 6)
		RunScript2("TournamentRoundWin", Killer, Killed)
		Timer(Killer, 2, "TournamentRound3")
	End If
	If GetFlag(171) = Killed | GetFlag(172) = Killed Then
		PlayerWarp(Killer, 1883, 4, 6)
		RunScript2("TournamentRoundWin", Killer, Killed)
		Timer(Killer, 2, "TournamentRound6")
	End If
	If GetFlag(175) = Killed | GetFlag(176) = Killed | GetFlag(177) = Killed | GetFlag(178) = Killed Then
		RunScript2("TournamentWin", Killer, Killed)
	End If
End If

If GetFlag(174) = Killer Then
	If GetFlag(173) = Killed Then
		PlayerWarp(Killer, 1883, 4, 6)
		RunScript2("TournamentRoundWin", Killer, Killed)
		Timer(Killer, 2, "TournamentRound3")
	End If
	If GetFlag(171) = Killed | GetFlag(172) = Killed Then
		PlayerWarp(Killer, 1883, 4, 6)
		RunScript2("TournamentRoundWin", Killer, Killed)
		Timer(Killer, 2, "TournamentRound6")
	End If
	If GetFlag(175) = Killed | GetFlag(176) = Killed | GetFlag(177) = Killed | GetFlag(178) = Killed Then
		RunScript2("TournamentWin", Killer, Killed)
	End If
End If

If GetFlag(175) = Killer Then
	If GetFlag(176) = Killed Then
		PlayerWarp(Killer, 1883, 6, 6)
		RunScript2("TournamentRoundWin", Killer, Killed)
		Timer(Killer, 2, "TournamentRound4")
	End If
	If GetFlag(177) = Killed | GetFlag(178) = Killed Then
		PlayerWarp(Killer, 1883, 6, 6)
		RunScript2("TournamentRoundWin", Killer, Killed)
		Timer(Killer, 2, "TournamentRound7")
	End If
	If GetFlag(171) = Killed | GetFlag(172) = Killed | GetFlag(173) = Killed | GetFlag(174) = Killed Then
		RunScript2("TournamentWin", Killer, Killed)
	End If
End If

If GetFlag(176) = Killer Then
	If GetFlag(175) = Killed Then
		PlayerWarp(Killer, 1883, 6, 6)
		RunScript2("TournamentRoundWin", Killer, Killed)
		Timer(Killer, 2, "TournamentRound4")
	End If
	If GetFlag(177) = Killed | GetFlag(178) = Killed Then
		PlayerWarp(Killer, 1883, 6, 6)
		RunScript2("TournamentRoundWin", Killer, Killed)
		Timer(Killer, 2, "TournamentRound7")
	End If
	If GetFlag(171) = Killed | GetFlag(172) = Killed | GetFlag(173) = Killed | GetFlag(174) = Killed Then
		RunScript2("TournamentWin", Killer, Killed)
	End If
End If

If GetFlag(177) = Killer Then
	If GetFlag(178) = Killed Then
		PlayerWarp(Killer, 1883, 8, 6)
		RunScript2("TournamentRoundWin", Killer, Killed)
		Timer(Killer, 2, "TournamentRound5")
	End If
	If GetFlag(175) = Killed | GetFlag(176) = Killed Then
		PlayerWarp(Killer, 1883, 6, 6)
		RunScript2("TournamentRoundWin", Killer, Killed)
		Timer(Killer, 2, "TournamentRound7")
	End If
	If GetFlag(171) = Killed | GetFlag(172) = Killed | GetFlag(173) = Killed | GetFlag(174) = Killed Then
		RunScript2("TournamentWin", Killer, Killed)
	End If
End If

If GetFlag(178) = Killer Then
	If GetFlag(177) = Killed Then
		PlayerWarp(Killer, 1883, 8, 6)
		RunScript2("TournamentRoundWin", Killer, Killed)
		Timer(Killer, 2, "TournamentRound5")
	End If
	If GetFlag(175) = Killed | GetFlag(176) = Killed Then
		PlayerWarp(Killer, 1883, 6, 6)
		RunScript2("TournamentRoundWin", Killer, Killed)
		Timer(Killer, 2, "TournamentRound7")
	End If
	If GetFlag(171) = Killed | GetFlag(172) = Killed | GetFlag(173) = Killed | GetFlag(174) = Killed Then
		RunScript2("TournamentWin", Killer, Killed)
	End If
End If

SetPlayerFlag(Killed, 10, 0)
SetPlayerFlag(Killed, 11, 0)

End Sub