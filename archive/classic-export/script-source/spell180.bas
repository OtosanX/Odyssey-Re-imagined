Sub Main(Player as Long)

If HasObj(Player, 408) = 0 Then
	PlayerMessage(Player, "You require Nightfall Dust to cast.", Grey)
	Exit Sub
End If
If GetPlayerFlag(Player, 23) > 0 Then
	PlayerMessage(Player, "You must wait to cast again.", Grey)
	Exit Sub
End If

TakeObj(Player, 408, 1)
PlayerMessage(Player, "You plant a bomb!", White)
'CreateTileEffect(GetPlayerMap(Player), GetPlayerX(Player), GetPlayerY(Player), 67, 40, 8, 0, 0)
SetPlayerFlag(Player, 23, 1)
SetPlayerFlag(Player, 24, GetPlayerMap(Player))
SetPlayerFlag(Player, 21, GetPlayerX(Player))
SetPlayerFlag(Player, 22, GetPlayerY(Player))
Timer(Player, 2, "Bomb2")

End Sub