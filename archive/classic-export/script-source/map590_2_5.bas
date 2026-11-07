Sub Main(Player as Long)

If GetPlayerFlag(Player, 241) > 0 | GetPlayerAccess(Player) Then
	PlayerWarp(Player, 597, 5, 10)
Else
	PlayerWarp(Player, 590, 2, 6)
	PlayerMessage(Player, "The door is locked.", White)
End If

End Sub