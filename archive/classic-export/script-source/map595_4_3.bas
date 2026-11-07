Sub Main(Player as Long)

If GetPlayerFlag(Player, 109) = 0 Then
	CreateMapFloatText(595, 7, 4, "OI! Get off my crops ye damn kid!", BrightRed)
	SetPlayerFlag(Player, 109, 1)
	Timer(Player, 3, "PushTimer")
End If

End Sub