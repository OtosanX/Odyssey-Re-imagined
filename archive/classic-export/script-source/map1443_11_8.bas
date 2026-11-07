Sub Main(Player as Long)

If GetFlag(153) = 0 Then
	SetPlayerFlag(Player, 5, GetPlayerGuild(Player))
	PlayerWarp(Player, 1443, 11, 6)
	SetPlayerFlag(Player, 10, 13)
	SetPlayerFlag(Player, 11, 2)
	SetPlayerFlag(Player, 12, 0)
	SetPlayerSprite(Player, 133)
	SetPlayerGuild(Player, 101)
	PlayerMessage(Player, "You have joined the Blue Team", White)
Else
	PlayerMessage(Player, "A fight is already in progress.", White)
	PlayerWarp(Player, 1443, 11, 9)
End If

End Sub