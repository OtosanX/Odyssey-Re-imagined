Sub Main(Player as Long)

If StrCmp(GetPlayerUser(Player), "alkalinetr90") | strcmp(GetPlayerUser(Player), "brandon") Then
	If GetPlayerDirection(Player) = Up Then
		PlayerWarp(Player, 542, 3, 2)
	Else
		PlayerWarp(Player, 542, 3, 4)
	End If
Else
	PlayerWarp(Player, 542, 3, 4)
End If

End Sub