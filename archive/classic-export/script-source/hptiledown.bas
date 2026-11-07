Sub Main(Player as Long)

If GetPlayerHP(Player) < GetPlayerMaxHP(Player) Then
	PlayerWarp(Player, GetPlayerMap(Player), GetPlayerX(Player), GetPlayerY(Player) + 1)
End If

End Sub