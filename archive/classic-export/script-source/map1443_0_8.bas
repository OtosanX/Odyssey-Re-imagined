Sub Main(Player as Long)

If GetFlag(153) = 0 Then
	SetPlayerFlag(Player, 5, GetPlayerGuild(Player))
	PlayerWarp(Player, 1443, 0, 6)
	SetPlayerFlag(Player, 10, 13)
	SetPlayerFlag(Player, 11, 1)
	SetPlayerFlag(Player, 12, 0)
	SetPlayerSprite(Player, 132)
	SetPlayerGuild(Player, 100)
	PlayerMessage(Player, "You have joined the Red Team", White)
Else
	PlayerMessage(Player, "A fight is already in progress.", White)
	PlayerWarp(Player, 1443, 0, 9)
End If

End Sub