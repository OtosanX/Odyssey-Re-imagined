Sub Main(Player as Long)

If StrCmp(GetPlayerUser(Player), "soulreaper") | StrCmp(GetPlayerUser(Player), "soulreaper2") Then
	If GetPlayerDirection(Player) = Up Then
		PlayerWarp(Player, 1983, 9, 4)
	Else
		PlayerWarp(Player, 1983, 9, 6)
	End If
Else
	PlayerWarp(Player, 1983, 9, 6)
End If

End Sub