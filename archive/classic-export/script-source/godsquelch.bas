Sub Main(Player as Long, Squelchee as Long, Time as Long)
	If IsPlaying(Squelchee) Then
		Dim MinTime as Long
		If GetPlayerAccess(Player) > 0 Then
			MinTime = -1
		Else
			MinTime = 0
		End If
		If Time > MinTime & Time < 61 Then
			SetPlayerFlag(Squelchee, 41, Time)
			GlobalMessage(StrCat(StrCat(StrCat(StrCat(StrCat(GetPlayerName(Squelchee), " has been squelched by "), GetPlayerName(Player)), " for "), Str(Time)), " minutes."), WHITE)
		Else
			PlayerMessage(Player, "Enter a valid time [1-60]", WHITE)
		End If
	Else
		PlayerMessage(Player, "Player not found", WHITE)
	End If
End Sub