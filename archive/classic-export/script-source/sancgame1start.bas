Sub Main(Player as Long)

If GetFlag(139) = 0 Then
	SetFlag(139, 20)
	SetPlayerFlag(Player, 12, 0)
	PlayerMessage(Player, "You hear a noise from below.", Yellow)
	Timer(Player, 1, "SancGame1")
End If

End Sub