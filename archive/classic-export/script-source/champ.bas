Sub Main(Player as Long)

If GetPlayerMap(Player) = 1352 Then
	BanPlayer(Player, 5, "")
	Exit Sub
End If

If GetPlayerFlag(Player, 101) > 0 Then
	PlayerMessage(Player, "You have been banned from Solo the Champ.", Yellow)
	Exit Sub
End If
If GetFlag(89) < 11 Then
	PlayerMessage(Player, "Solo the Champ is closed.", Yellow)
	Exit Sub
End If
If GetPlayerFlag(Player, 109) > 0 Then
	PlayerMessage(Player, "You cannot join Solo the Champ yet.", Yellow)
	Exit Sub
End If

If GetMapIsFriendly(GetPlayerMap(Player)) = False Then
	PlayerMessage(Player, "You must be on a friendly map to warp to Solo the Champ.", Yellow)
	Exit Sub
End If

If GetTileAtt(GetPlayerMap(Player), GetPlayerX(Player), GetPlayerY(Player)) = 5 | GetTileAtt2(GetPlayerMap(Player), GetPlayerX(Player), GetPlayerY(Player)) = 5 Then
	PlayerMessage(Player, "You may not warp to Solo the Champ from vaults.", Yellow)
	Exit Sub
End If

RunScript1("GameWarpSet", Player)
	If GetMapPlayerCount(1828) <= GetMapPlayerCount(1829) Then
		PlayerWarp(Player, 1828, 1, 1)
	Else
		PlayerWarp(Player, 1829, 1, 1)
	End If	
SetPlayerFlag(Player, 109, 1)
Timer(Player, 5, "PushTimer")

End Sub