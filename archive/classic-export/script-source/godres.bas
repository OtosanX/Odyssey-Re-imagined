Sub Main(Player as Long, Target as Long)
	If GetPlayerIsDead(Target) = True Then
		SetPlayerIsDead(Target, False)
		GlobalMessage(StrCat(StrCat(GetPlayerName(Target), " has been resurrected by "), GetPlayerName(Player)), BrightGreen)
		CreatePlayerEffect(GetPlayerMap(Player), Player, Target, 31, 40, 8, 0)
	End If
End Sub