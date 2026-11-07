Sub Main(Player as Long, Target as Long)

If GetFlag(151) > 0 Then
	PlayerMessage(Player, "A duel is already in progress.", Grey)
	Exit Sub
End If
If GetPlayerGuild(Player) > 0 Then
	If GetPlayerGuild(Player) = GetPlayerGuild(Target) Then
		PlayerMessage(Player, "You cannot duel your own guild.", Grey)
		Exit Sub
	End If
End If

If GetPlayerX(Player) = 4 & GetPlayerY(Player) = 1 Then
If GetPlayerX(Target) = 7 & GetPlayerY(Target) = 1 Then
	GoTo Warp
End If
End If
If GetPlayerX(Player) = 7 & GetPlayerY(Player) = 1 Then
If GetPlayerX(Target) = 4 & GetPlayerY(Target) = 1 Then
	GoTo Warp
End If
End If

PlayerMessage(Player, "You or your opponent are not on the correct tiles.", Grey)
Exit Sub
Warp:

PlayerWarp(Player, 1414, 4, 4)
SetPlayerFlag(Player, 14, 1)
PlayerWarp(Target, 1414, 7, 7)
SetPlayerFlag(Target, 14, 1)

SetFlag(151, 1)
MapMessage(1414, strcat(GetPlayerName(Player), strcat(" vs ", GetPlayerName(Target))), Yellow)

End Sub