Sub Main(Player as Long)

If GetPlayerFlag(Player, 210) > 0 Then
	RunScript1("GameWarp", Player)
Else
	PlayerWarp(Player, 1960, 2, 2)
End If

End Sub