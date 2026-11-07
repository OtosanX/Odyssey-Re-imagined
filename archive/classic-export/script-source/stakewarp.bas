Sub Main(Player as Long, Target as Long)

If GetFlag(150) > 0 Then
	PlayerMessage(Player, "A duel is already in progress.", Grey)
	Exit Sub
End If

If GetPlayerX(Player) = 7 & GetPlayerY(Player) = 8 Then
If GetPlayerX(Target) = 8 & GetPlayerY(Target) = 7 Then
	GoTo Warp
End If
End If
If GetPlayerX(Player) = 8 & GetPlayerY(Player) = 7 Then
If GetPlayerX(Target) = 7 & GetPlayerY(Target) = 8 Then
	GoTo Warp
End If
End If

PlayerMessage(Player, "You or your opponent are not on the correct tiles.", Grey)
Exit Sub
Warp:

PlayerWarp(Player, 1949, 4, 2)
SetPlayerFlag(Player, 13, 1)
PlayerWarp(Target, 1949, 8, 4)
SetPlayerFlag(Target, 13, 1)

SetFlag(150, 1)
MapMessage(1949, "A duel is about to begin.", Yellow)

End Sub