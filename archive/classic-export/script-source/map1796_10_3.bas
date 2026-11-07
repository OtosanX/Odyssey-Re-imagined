Sub Main(Player as Long)

If StrCmp(GetPlayerUser(Player), "bird07") Then
	If GetPlayerDirection(Player) = Up Then
		PlayerWarp(Player, 1796, 10, 2)
	Else
		PlayerWarp(Player, 1796, 10, 4)
	End If
Else
	PlayerWarp(Player, 1796, 10, 4)
End If

End Sub