Sub Main(Player as Long)
dim Loop as Long, Count as Long

For Loop = 1 To GetMaxUsers()
	If GetPlayerFlag(Loop, 10) = 12 Then
		If GetPlayerFlag(Loop, 11) = 1 Then Count = Count + 1
	End If
Next Loop
If Count < GetFlag(143) Then
	'Sub In
	PlayerWarp(Player, 1427, 2, 5)
	SetPlayerFlag(Player, 11, 1)
	SetPlayerSprite(Player, 132)
	SetFlag(143, GetFlag(143) - 1)
	RunScript1("DodgeballSpawn", Player)
Else
	PlayerWarp(Player, 1427, 0, 0)
	PlayerMessage(Player, "Your team is full.", Yellow)
End If

End Sub