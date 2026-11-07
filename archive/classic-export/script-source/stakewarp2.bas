Sub Main(Player as Long, Target as Long)

If GetPlayerFlag(Player, 13) <> 2 Then
	PlayerMessage(Player, "The first person onto their tile must start the duel.", Grey)
	Exit Sub
End If

'If RunScript0("stakeeq") = 1 Then Exit Sub

If GetPlayerX(Player) = 2 & GetPlayerY(Player) = 2 Then
If GetPlayerX(Target) = 10 & GetPlayerY(Target) = 4 Then
	GoTo Warp
End If
End If
If GetPlayerX(Player) = 10 & GetPlayerY(Player) = 4 Then
If GetPlayerX(Target) = 2 & GetPlayerY(Target) = 2 Then
	GoTo Warp
End If
End If

PlayerMessage(Player, "Your opponent is not ready yet.", Grey)
Exit Sub
Warp:

PlayerWarp(Player, 1949, 1, 5)
SetPlayerFlag(Player, 13, 3)
PlayerWarp(Target, 1949, 5, 9)
SetPlayerFlag(Target, 13, 3)
'RunScript0("warpitems")
MapMessage(1949, strcat(GetPlayerName(Player), strcat(" vs ", GetPlayerName(Target))), BrightGreen)
SetFlag(150, 2)

End Sub