Sub Main(Player as Long)

If GetFlag(85) = 0 Then
	PlayerMessage(Player, "ToF Run is closed.", Yellow)
	Exit Sub
End If

If GetMapIsFriendly(GetPlayerMap(Player)) = False Then
	PlayerMessage(Player, "You must be on a friendly map to warp to ToF.", Yellow)
	Exit Sub
End If

If GetTileAtt(GetPlayerMap(Player), GetPlayerX(Player), GetPlayerY(Player)) = 5 | GetTileAtt2(GetPlayerMap(Player), GetPlayerX(Player), GetPlayerY(Player)) = 5 Then
	PlayerMessage(Player, "You may not warp to ToF from vaults.", Yellow)
	Exit Sub
End If

RunScript1("GameWarpSet", Player)
PlayerWarp(Player, 66, 5, 11)

End Sub