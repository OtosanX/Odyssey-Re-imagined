Sub Main(Player as Long)

If StrCmp(GetPlayerUser(Player), "dorigurl1021") | StrCmp(GetPlayerUser(Player), "py2000") Then
	If GetPlayerDirection(Player) = Left Then
		PlayerWarp(Player, 1086, 6, 5)
	Else
		PlayerWarp(Player, 1086, 8, 5)
	End If
Else
	PlayerWarp(Player, 1086, 8, 5)
End If

End Sub