Sub Main(Player as Long)
dim Loop as Long, Count as Long

SetPlayerFlag(Player, 17, 0)
PlayerWarp(Player, 554, 6, 10)
For Loop = 1 To GetMaxUsers()
	If GetPlayerFlag(Loop, 17) > 0 Then Count = Count + 1
Next Loop
If Count = 0 Then
	SetFlag(152, 0)
	MapMessage(554, "A new trade can now begin.", Yellow)
End If

End Sub