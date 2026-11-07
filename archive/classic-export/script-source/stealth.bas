Function Main(Player as Long) AS LONG

If GetPlayerAccess(Player) Then
	SetPlayerSprite(Player, 243)
	SetPlayerStatus(Player, 9)
End If

End Function