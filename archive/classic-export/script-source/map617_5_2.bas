Sub Main(Player as Long)

PlayerWarp(Player, 620, 5, 5)

SetPlayerFlag(Player, 10, 16)
SetPlayerFlag(Player, 11, 0)
SetPlayerFlag(Player, 12, 0)
SetPlayerSprite(Player, 34)
GiveObj(Player, 383, 1)

If GetFlag(145) = 0 Then
	If GetMapPlayerCount(620) >= 2 Then
		RunScript0("SancGame2")
		MapMessage(620, "Snowball Tag has started!", Yellow)
	Else
		PlayerMessage(Player, "You have joined Snowball Tag! The game will begin when enough players have joined.", White)
	End If
Else
	PlayerMessage(Player, "You have joined Snowball Tag!", White)
End If

End Sub