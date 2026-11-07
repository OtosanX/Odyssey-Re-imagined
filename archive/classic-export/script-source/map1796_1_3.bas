Sub Main(Player as Long)

If StrCmp(GetPlayerUser(Player), "bird07") Then
	If GetPlayerDirection(Player) = Down Then
		PlayerWarp(Player, 1796, 1, 4)
	Else
		PlayerWarp(Player, 1796, 1, 2)
	End If
Else
	PlayerWarp(Player, 1796, 1, 2)
End If

End Sub