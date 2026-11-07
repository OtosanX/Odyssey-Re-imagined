Sub Main(Player as Long)

If GetFlag(140) = 8 Then
	SetPlayerFlag(Player, 225, GetPlayerFlag(Player, 225) + 1)
	CreatePlayerFloatText(Player, str(GetPlayerFlag(Player, 225)), BrightGreen)
	SetFlag(140, 0)
End If

End Sub