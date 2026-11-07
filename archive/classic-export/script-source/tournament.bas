Sub Main(Player as Long)

If GetFlag(80) = 0 Then
	PlayerMessage(Player, "Tournament Arena is closed.", Yellow)
	Exit Sub
End If

If GetMapIsFriendly(GetPlayerMap(Player)) = False Then
	PlayerMessage(Player, "You must be on a friendly map to warp to the Tournament Arena.", Yellow)
	Exit Sub
End If

If GetTileAtt(GetPlayerMap(Player), GetPlayerX(Player), GetPlayerY(Player)) = 5 | GetTileAtt2(GetPlayerMap(Player), GetPlayerX(Player), GetPlayerY(Player)) = 5 Then
	PlayerMessage(Player, "You may not warp to the Tournament Arena from vaults.", Yellow)
	Exit Sub
End If

SetPlayerFlag(Player, 210, GetPlayerMap(Player))
SetPlayerFlag(Player, 211, GetPlayerX(Player))
SetPlayerFlag(Player, 212, GetPlayerY(Player))
PlayerWarp(Player, 1883, 5, 11)

End Sub