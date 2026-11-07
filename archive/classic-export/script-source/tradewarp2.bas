Sub Main(Player as Long, Target as Long)

If GetFlag(152) > 0 Then
	PlayerMessage(Player, "There is already a trade in progress.", Grey)
	Exit Sub
End If

If GetPlayerX(Player) = 3 & GetPlayerY(Player) = 7 Then
If GetPlayerX(Target) = 8 & GetPlayerY(Target) = 7 Then
	GoTo Warp
End If
End If
If GetPlayerX(Player) = 8 & GetPlayerY(Player) = 7 Then
If GetPlayerX(Target) = 3 & GetPlayerY(Target) = 7 Then
	GoTo Warp
End If
End If

PlayerMessage(Player, "You or your partner are not on the correct tiles.", Grey)
Exit Sub
Warp:

PlayerWarp(Player, 554, 2, 3)
SetPlayerFlag(Player, 17, 1)
PlayerWarp(Target, 554, 9, 3)
SetPlayerFlag(Target, 17, 1)

SetFlag(152, 1)

End Sub