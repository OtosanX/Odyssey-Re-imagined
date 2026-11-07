Function Main(Player as Long) as Long
dim Map as Long, X as Long, Y as Long

Map = GetPlayerMap(Player)
X = GetPlayerX(Player)
Y = GetPlayerY(Player)

If GetPlayerFlag(Player, 6) = 0 Then
	PlayerMessage(Player, "You don't know how to use this.", White)
	Exit Function
End If

If GetPlayerFlag(Player, 8) = 0 Then
	If Map = 596 & X = 2 & Y = 3 Then
		If GetPlayerFlag(Player, 7) = 0 Then
			PlayerMessage(Player, "You have not activated any Statues.", White)
			Exit Function
		End If
		SetPlayerFlag(Player, 8, 1)
		PlayerMessage(Player, "You place the Idol into the Statue.", White)
		CreateCharacterEffect(Map, Player, 2, 30, 8, 1, 0)
		Timer(Player, 1, "SancWarp1")
		Timer(Player, 4, "SancWarp")
	End If
	If Map = 1699 & X = 6 & Y = 6 Then
		SetPlayerFlag(Player, 7, 1)
		SetPlayerFlag(Player, 8, 1)
		PlayerMessage(Player, "You place the Idol into the Statue.", White)
		CreateCharacterEffect(Map, Player, 2, 30, 8, 1, 0)
		Timer(Player, 1, "SancWarp1")
		Timer(Player, 4, "SancWarp")
	End If
	If Map = 623 & X = 10 & Y = 3 Then
		SetPlayerFlag(Player, 7, 2)
		SetPlayerFlag(Player, 8, 1)
		PlayerMessage(Player, "You place the Idol into the Statue.", White)
		CreateCharacterEffect(Map, Player, 2, 30, 8, 1, 0)
		Timer(Player, 1, "SancWarp1")
		Timer(Player, 4, "SancWarp")
	End If
	If Map = 510 & X = 3 & Y = 5 Then
		SetPlayerFlag(Player, 7, 3)
		SetPlayerFlag(Player, 8, 1)
		PlayerMessage(Player, "You place the Idol into the Statue.", White)
		CreateCharacterEffect(Map, Player, 2, 30, 8, 1, 0)
		Timer(Player, 1, "SancWarp1")
		Timer(Player, 4, "SancWarp")
	End If
	If Map = 168 & X = 4 & Y = 9 Then
		SetPlayerFlag(Player, 7, 4)
		SetPlayerFlag(Player, 8, 1)
		PlayerMessage(Player, "You place the Idol into the Statue.", White)
		CreateCharacterEffect(Map, Player, 2, 30, 8, 1, 0)
		Timer(Player, 1, "SancWarp1")
		Timer(Player, 4, "SancWarp")
	End If
	If Map = 222 & X = 7 & Y = 7 Then
		SetPlayerFlag(Player, 7, 5)
		SetPlayerFlag(Player, 8, 1)
		PlayerMessage(Player, "You place the Idol into the Statue.", White)
		CreateCharacterEffect(Map, Player, 2, 30, 8, 1, 0)
		Timer(Player, 1, "SancWarp1")
		Timer(Player, 4, "SancWarp")
	End If
End If

End Function