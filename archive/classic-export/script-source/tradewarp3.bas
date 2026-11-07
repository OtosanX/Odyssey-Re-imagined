Sub Main(Player as Long, Target as Long)

If GetPlayerX(Player) = 4 & GetPlayerY(Player) = 1 Then
If GetPlayerX(Target) = 7 & GetPlayerY(Target) = 1 Then
	PlayerWarp(Player, 554, 9, 3)
	SetPlayerFlag(Player, 17, 3)
	PlayerWarp(Target, 554, 2, 3)
	SetPlayerFlag(Target, 17, 3)
	SetFlag(152, 2)
	Exit Sub
End If
End If
If GetPlayerX(Player) = 7 & GetPlayerY(Player) = 1 Then
If GetPlayerX(Target) = 4 & GetPlayerY(Target) = 1 Then
	PlayerWarp(Player, 554, 2, 3)
	SetPlayerFlag(Player, 17, 3)
	PlayerWarp(Target, 554, 9, 3)
	SetPlayerFlag(Target, 17, 3)
	SetFlag(152, 2)
	Exit Sub
End If
End If

PlayerMessage(Player, "You or your partner are not on the correct tiles.", Grey)

End Sub