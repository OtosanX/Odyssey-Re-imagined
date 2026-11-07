Sub Main(Player as Long)

If GetPlayerFlag(Player, 23) > 0 Then
	PlayerMessage(Player, "You have already planted a bomb.", Grey)
	Exit Sub
End If

TakeObj(Player, 410, 1)
PlayerMessage(Player, "You plant the bomb!", White)
CreateTileEffect(GetPlayerMap(Player), GetPlayerX(Player), GetPlayerY(Player), 67, 40, 8, 0, 0)
SetPlayerFlag(Player, 23, 1)
SetPlayerFlag(Player, 24, GetPlayerMap(Player))
SetPlayerFlag(Player, 21, GetPlayerX(Player))
SetPlayerFlag(Player, 22, GetPlayerY(Player))
Timer(Player, 2, "Bomb")

End Sub