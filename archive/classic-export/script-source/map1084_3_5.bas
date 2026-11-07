Sub Main(Player as Long)

If StrCmp(GetPlayerUser(Player), "dorigurl1021") | StrCmp(GetPlayerUser(Player), "py2000") Then
	If GetPlayerDirection(Player) = Left Then
		PlayerWarp(Player, 1084, 2, 5)
	Else
		PlayerWarp(Player, 1084, 4, 5)
	End If
Else
	PlayerWarp(Player, 1084, 4, 5)
End If

End Sub