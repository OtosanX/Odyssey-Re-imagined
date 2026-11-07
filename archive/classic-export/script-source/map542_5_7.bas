Sub Main(Player as Long)

If StrCmp(GetPlayerUser(Player), "alkalinetr90") Then
	If GetPlayerDirection(Player) = Up Then
		PlayerWarp(Player, 542, 5, 6)
	Else
		PlayerWarp(Player, 542, 5, 8)
	End If
Else
	PlayerWarp(Player, 542, 5, 6)
End If

End Sub