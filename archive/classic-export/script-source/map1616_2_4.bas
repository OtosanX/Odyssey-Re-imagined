Sub Main(Player as Long)

If StrCmp(GetPlayerUser(Player), "armac") Then
	If GetPlayerDirection(Player) = Up Then
		PlayerWarp(Player, 1616, 2, 3)
	Else
		PlayerWarp(Player, 1616, 2, 5)
	End If
Else
	PlayerWarp(Player, 1616, 2, 5)
End If

End Sub