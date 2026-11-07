Sub Main(Player as Long)

If StrCmp(GetPlayerUser(Player), "sighh") Then
	If GetPlayerDirection(Player) = Up Then
		PlayerWarp(Player, 1804, 8, 3)
	Else
		PlayerWarp(Player, 1804, 8, 5)
	End If
Else
	PlayerWarp(Player, 1804, 8, 5)
End If

End Sub