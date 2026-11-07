Sub Main(Player as Long)

If GetPlayerMap(Player) = 595 Then
	If GetPlayerFlag(Player, 109) = 0 Then
		If Random(2) = 0 Then CreateMapFloatText(595, 7, 5, "Bessy! Noooo!!", BrightBlue) Else CreateMapFloatText(595, 7, 5, "Why Daisy!! WHY!", BrightBlue)
		SetPlayerFlag(Player, 109, 1)
		Timer(Player, 3, "PushTimer")
	End If
End If

End Sub