Sub Main(Player as Long)

If StrCmp(GetPlayerUser(Player), "dorigurl1021") | StrCmp(GetPlayerUser(Player), "py2000") Then
	If GetPlayerDirection(Player) = Up Then
		PlayerWarp(Player, 1087, 5, 8)
	Else
		PlayerWarp(Player, 1087, 5, 10)
	End If
Else
	PlayerWarp(Player, 1087, 5, 10)
End If

End Sub