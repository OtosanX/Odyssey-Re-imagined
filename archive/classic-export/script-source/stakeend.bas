Sub Main(Player as Long)
dim Loop as Long, Count as Long

Count = 0
For Loop = 1 To GetMaxUsers()
	If GetPlayerFlag(Loop, 13) > 0 Then Count = Count + 1
Next Loop

If GetPlayerFlag(Player, 13) = 1 | GetPlayerFlag(Player, 13) = 2 Then
	PlayerWarp(Player, 1799, 5, 10)
	SetPlayerFlag(Player, 13, 0)
	If Count = 1 Then
		SetFlag(150, 0)
		MapMessage(1799, "A new duel can now begin.", Yellow)
	End If
	Exit Sub
End If

If GetPlayerFlag(Player, 13) = 3 Then
	If Count = 1 Then
		PlayerWarp(Player, 1799, 5, 1)
		Exit Sub
	End If
End If

PlayerMessage(Player, "You cannot do that now.", Grey)

End Sub