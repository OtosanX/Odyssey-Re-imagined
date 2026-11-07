Function Main(Player as Long) AS LONG

PlayerWarp(Player, 6, 3, 3)

If GetPlayerStatus(Player) = 9 | GetPlayerStatus(Player) = 1 Then
	SetPlayerStatus(Player, 0)
End If

End Function