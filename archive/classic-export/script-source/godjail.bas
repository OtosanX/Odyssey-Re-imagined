Sub Main(Player as Long, Jailee as Long, Time as Long)
	If IsPlaying(Jailee) & GetPlayerMap(Jailee) < 1999 Then
		If Player <> Jailee Then
			If Time > 0 & Time < 61 Then
				SetPlayerFlag(Jailee, 40, Time)
				RunScript1("GameWarpSet", Player)
				PlayerWarp(Jailee, 301, 2, 1)
				GlobalMessage(StrCat(StrCat(StrCat(StrCat(StrCat(GetPlayerName(Jailee), " has been jailed by "), GetPlayerName(Player)), " for "), Str(Time)), " minutes."), WHITE)
			Else
				PlayerMessage(Player, "Enter a valid time [1-60]", WHITE)
			End If
		Else
			PlayerMessage(Player, "You may not jail yourself.", WHITE)
		End If
	Else
		PlayerMessage(Player, "Player not found", WHITE)
	End If
End Sub