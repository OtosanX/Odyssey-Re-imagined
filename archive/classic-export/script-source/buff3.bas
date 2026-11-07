Sub Main(Player as Long, Buff as Long)

If GetPlayerFlag(Player, 120) = 0 Then
	SetPlayerFlag(Player, 120, Buff)
	CalculateStats(Player)
	CreateCharacterEffect(GetPlayerMap(Player), Player, 54, 40, 8, 0, 0)
	Timer(Player, 30, "Debuff3")
End If

End Sub