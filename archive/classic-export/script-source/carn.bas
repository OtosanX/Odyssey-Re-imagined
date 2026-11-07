Sub Main(Player as Long)

If GetFlag(82) = 0 Then
	PlayerMessage(Player, "Carnage warp has ended.", Yellow)
	Exit Sub
End If
If GetPlayerAccess(Player) = 0 Then
If GetPlayerMap(Player) = 666 | GetPlayerMap(Player) = 301 | GetPlayerMap(Player) = 68 | GetPlayerFlag(Player, 10) = 1 Then
	PlayerMessage(Player, "You cannot warp to Carnage from jail, hell or waiting room.", Yellow)
	Exit Sub
End If
If GetPlayerGuild(Player) > 0 Then
	If GetMapIsFriendly(GetPlayerMap(Player)) = False Then
		PlayerMessage(Player, "You must be on a friendly map to warp to Carnage.", Yellow)
		Exit Sub
	End If
Else
	If GetMapIsPK(GetPlayerMap(Player)) = True Then
		PlayerMessage(Player, "You must be on a friendly map to warp to Carnage.", Yellow)
		Exit Sub
	End If
End If
If GetTileAtt(GetPlayerMap(Player), GetPlayerX(Player), GetPlayerY(Player)) = 5 | GetTileAtt2(GetPlayerMap(Player), GetPlayerX(Player), GetPlayerY(Player)) = 5 Then
	PlayerMessage(Player, "You may not warp to Carnage from vaults.", Yellow)
	Exit Sub
End If
End If

SetPlayerFlag(Player, 210, GetPlayerMap(Player))
SetPlayerFlag(Player, 211, GetPlayerX(Player))
SetPlayerFlag(Player, 212, GetPlayerY(Player))
PlayerWarp(Player, 68, 5, 5)
PlayerMessage(Player, "You have been warped to Carnage!", Yellow)

End Sub