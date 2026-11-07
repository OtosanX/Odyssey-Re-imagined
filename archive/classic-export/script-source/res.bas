Sub Main(Player as Long, Target as Long)
dim Map as Long
Map = GetPlayerMap(Player)
	If Map = 66 | Map = 67 | Map = 85 | Map = 87 | Map = 88 | Map = 91 | Map = 93 | Map = 98 | Map = 148 | Map = 167 | Map = 231 | Map = 232 Then
		PlayerMessage(Player, "You may not resurrect here.", Grey)
		Exit Sub
	End If
	
	If GetPlayerGuild(Player) = GetPlayerGuild(Target) & GetPlayerGuild(Player) > 0 Then
		'Players can resurrect their own guild
	Else
		If GetPlayerFlag(Target, 15) = 1 Then
			PlayerMessage(Player, "You may not resurrect those killed by man.", White)
			Exit Sub
		End If
		If GetPlayerFlag(Target, 15) = 2 Then
			PlayerMessage(Player, "This soul has exploded.", White)
			Exit Sub
		End If
	End If

If GetPlayerIsDead(Target) = True Then
	If HasObj(Player, 411) Then
		SetPlayerFlag(Player, 90, 0)
		TakeObj(Player, 411, 1)
		SetPlayerIsDead(Target, False)
		If GetPlayerMap(Target) = 1962 Then
			GlobalMessage(StrCat(StrCat(StrCat(GetPlayerName(Target), " has been resurrected by "), GetPlayerName(Player)), " in the arena, what a newb."), BrightGreen)
		Else
			GlobalMessage(StrCat(StrCat(GetPlayerName(Target), " has been resurrected by "), GetPlayerName(Player)), BrightGreen)
		End If
		CreatePlayerEffect(GetPlayerMap(Player), Player, Target, 31, 40, 8, 0)
	Else
		SetPlayerFlag(Player, 90, 0)
		PlayerMessage(Player, "You require a Living Essence to cast this.", Grey)
	End If
End If

End Sub