Sub Main(Player as Long)

If StrCmp(GetPlayerUser(Player), "dorigurl1021") | StrCmp(GetPlayerUser(Player), "py2000") Then
	If GetPlayerDirection(Player) = Right Then
		PlayerWarp(Player, 1085, 3, 5)
	Else
		PlayerWarp(Player, 1085, 1, 5)
	End If
Else
	PlayerWarp(Player, 1085, 1, 5)
End If

End Sub