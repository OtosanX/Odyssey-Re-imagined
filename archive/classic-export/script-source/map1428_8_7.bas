Sub Main(Player as Long)
dim Loop as Long, Count as Long

For Loop = 1 To GetMaxUsers()
	If GetPlayerMap(Loop) = 1428 Then
		If GetPlayerX(Loop) > 8 Then Count = Count + 1
	End If
Next Loop
If Count = 0 Then
	PlayerWarp(Player, 1428, 9, 4)
Else
	PlayerMessage(Player, "There is already someone in there.", Grey)
	PlayerWarp(Player, 1428, 7, 7)
End If

End Sub