Sub Main(Player as Long)

If GetFlag(141) = 0 Then
	SetFlag(141, 10)
	SetPlayerFlag(Player, 225, 0)
	PlayerMessage(Player, "You hear a click from below.", Yellow)
	Timer(Player, 1, "Floor")
End If

End Sub