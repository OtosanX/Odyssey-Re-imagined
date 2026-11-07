Sub Main(Player as Long)

If StrCmp(GetPlayerUser(Player), "dorigurl1021") | StrCmp(GetPlayerUser(Player), "py2000") Then
	If GetPlayerDirection(Player) = Right Then
		PlayerWarp(Player, 1083, 8, 7)
	Else
		PlayerWarp(Player, 1083, 6, 7)
	End If
Else
	PlayerWarp(Player, 1083, 6, 7)
End If

End Sub