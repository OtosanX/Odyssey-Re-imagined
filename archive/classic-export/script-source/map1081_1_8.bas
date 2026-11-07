Sub Main(Player as Long)

If StrCmp(GetPlayerUser(Player), "dorigurl1021") | StrCmp(GetPlayerUser(Player), "py2000") Then
	If GetPlayerDirection(Player) = Down Then
		PlayerWarp(Player, 1081, 1, 9)
	Else
		PlayerWarp(Player, 1081, 1, 7)
	End If
Else
	PlayerWarp(Player, 1081, 1, 7)
End If

End Sub