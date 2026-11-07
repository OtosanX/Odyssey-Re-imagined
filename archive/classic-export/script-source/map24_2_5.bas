Sub Main(Player as Long)

If GetPlayerHP(Player) = GetPlayerMaxHP(Player) Then
	PlayerWarp(Player, 301, 10, 10)
Else
	PlayerMessage(Player,"You cannot enter the jail without full HP!", White)
End If

End Sub