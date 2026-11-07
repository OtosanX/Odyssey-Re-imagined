Sub Main(Player as Long)

If StrCmp(GetPlayerUser(Player), "brandon") Then
	If GetPlayerDirection(Player) = Up Then
		PlayerWarp(Player, 1692, 2, 3)
	Else
		PlayerWarp(Player, 1692, 2, 5)
	End If
Else
	PlayerWarp(Player, 1692, 2, 5)
End If

End Sub