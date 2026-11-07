Sub Main(Player as Long)

If GetFlag(140) = 5 Then
	SetPlayerFlag(Player, 12, GetPlayerFlag(Player, 12) + 1)
	CreatePlayerFloatText(Player, str(GetPlayerFlag(Player, 12)), BrightGreen)
	SetFlag(140, 0)
End If

End Sub