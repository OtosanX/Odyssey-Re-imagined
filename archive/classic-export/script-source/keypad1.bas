Sub Main(Player as Long)
dim Loop as Long

If GetPlayerFlag(Player, 110) = 0 Then
	SetPlayerFlag(Player, 21, GetPlayerX(Player))
	SetPlayerFlag(Player, 22, GetPlayerY(Player))
		SetPlayerFlag(Player, 110, 1)
		For Loop = 111 To 114
			SetPlayerFlag(Player, Loop, 0)
		Next Loop
	PlayerMessage(Player, "The tile sinks revealing four touch plates.", White)
End If

End Sub