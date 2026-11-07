Sub Main(Player as Long)

If GetPlayerFlag(Player, 240) > 6 | GetPlayerAccess(Player) Then
	PlayerWarp(Player, 598, 3, 9)
Else
	PlayerWarp(Player, 595, 8, 8)
	PlayerMessage(Player, "The door is locked.", White)
End If

End Sub