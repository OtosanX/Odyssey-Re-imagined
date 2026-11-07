Function Main(Player as Long) AS LONG

If GetPlayerHP(Player) <> GetPlayerMaxHP(Player) Then
	PlayerWarp(Player, 648, 8, 8)
End If

End Function