Sub Main(Player as Long)
dim Loop as Long, Count as Long

For Loop = 1 To GetMaxUsers()
	If GetPlayerFlag(Loop, 10) = 12 Then
		If GetPlayerFlag(Loop, 11) = 2 Then Count = Count + 1
	End If
Next Loop
If Count < GetFlag(144) Then
	'Sub In
	PlayerWarp(Player, 1427, 9, 6)
	SetPlayerFlag(Player, 11, 2)
	SetPlayerSprite(Player, 133)
	SetFlag(144, GetFlag(144) - 1)
	RunScript1("DodgeballSpawn", Player)
Else
	PlayerWarp(Player, 1427, 11, 11)
	PlayerMessage(Player, "Your team is full.", Yellow)
End If

End Sub