Sub Main(Player as Long)

PlayerWarp(Player, 597, 6, 1)
If GetPlayerFlag(Player, 109) = 0 Then
	CreateMapFloatText(597, GetMonsterX(597, 0), GetMonsterY(597, 0), "Please refrain from entering our sleeping quarters.", Yellow)
	SetPlayerFlag(Player, 109, 1)
	Timer(Player, 3, "PushTimer")
End If

End Sub