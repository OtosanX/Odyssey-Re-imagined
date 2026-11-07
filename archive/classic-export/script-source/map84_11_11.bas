Sub Main(Player as Long)

If GetPlayerAccess(Player) | GetPlayerFlag(Player, 78) = 1 Then
	PlayerWarp(Player, 78, 11, 0)
End If

End Sub