Sub Main(Player as Long)

If StrCmp(GetPlayerUser(Player), "dorigurl1021") | StrCmp(GetPlayerUser(Player), "py2000") Then
	If GetPlayerDirection(Player) = Left Then
		PlayerWarp(Player, 1082, 4, 7)
	Else
		PlayerWarp(Player, 1082, 6, 7)
	End If
Else
	PlayerWarp(Player, 1082, 6, 7)
End If

End Sub