Sub Main(Player as Long)

If GetPlayerFlag(Player, 109) = 0 Then
	CreateTileEffect(593, 6, 7, 45, 40, 8, 1, 0)
	SetPlayerFlag(Player, 109, 1)
	Timer(Player, 3, "PushTimer")
End If

End Sub