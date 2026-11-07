Sub Main(Player as Long)

If GetPlayerFlag(Player, 242) > 5 | GetPlayerAccess(Player) Then
	PlayerWarp(Player, 633, 5, 10)
Else
	PlayerWarp(Player, 586, 3, 5)
	PlayerMessage(Player, "The door is locked.", White)
End If

End Sub