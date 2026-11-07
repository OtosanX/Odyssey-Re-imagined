Sub Main(Player as Long)
dim Loop as Long, Count as Long

Count = 0
For Loop = 1 To GetMaxUsers()
	If GetPlayerFlag(Loop, 13) = 2 Then Count = Count + 1
Next Loop
If Count > 0 Then Exit Sub

If GetPlayerFlag(Player, 13) = 1 Then SetPlayerFlag(Player, 13, 2)

End Sub