Sub Main(Player as Long)

If GetPlayerHP(Player) < GetPlayerMaxHP(Player) Then
	PlayerWarp(Player, GetPlayerMap(Player), GetPlayerX(Player) + 1, GetPlayerY(Player))
End If

End Sub