Sub Main(Player as Long, Buff as Long)

If GetPlayerFlag(Player, 121) = 0 Then
	SetPlayerFlag(Player, 121, Buff)
	CalculateStats(Player)
	CreateCharacterEffect(GetPlayerMap(Player), Player, 54, 40, 8, 0, 0)
	Timer(Player, 30, "Debuff1")
End If

End Sub