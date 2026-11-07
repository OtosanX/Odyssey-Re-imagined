Sub Main(Player as Long)

If GetPlayerAccess(Player) | GetPlayerFlag(Player, 78) = 1 Then
	PlayerWarp(Player, 70, 0, 0)
End If

End Sub