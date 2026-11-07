Sub Main(Player as Long)

If GetPlayerFlag(Player, 242) < 6 Then
	PlayerWarp(Player, 585, 7, 6)
	If GetPlayerFlag(Player, 109) = 0 Then
		CreateMapFloatText(585, 9, 4, "Oi, Cmere", BrightGreen)
		SetPlayerFlag(Player, 109, 1)
		Timer(Player, 3, "PushTimer")
	End If
End If

End Sub