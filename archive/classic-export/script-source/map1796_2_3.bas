Sub Main(Player as Long)

If StrCmp(GetPlayerUser(Player), "bird07") Then
	If GetPlayerDirection(Player) = Down Then
		PlayerWarp(Player, 1796, 2, 4)
	Else
		PlayerWarp(Player, 1796, 2, 2)
	End If
Else
	PlayerWarp(Player, 1796, 2, 2)
End If

End Sub