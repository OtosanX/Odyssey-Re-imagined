Sub Main(Player as Long)

If GetPlayerFlag(Player, 6) = 0 Then
	If GetPlayerFlag(Player, 109) = 0 Then
		CreateMapFloatText(587, GetMonsterX(587, 0), GetMonsterY(587, 0), "You are not ready...", White)
		SetPlayerFlag(Player, 109, 1)
		Timer(Player, 6, "PushTimer")
	End If
	PlayerWarp(Player, 587, 6, 8)
End If

End Sub