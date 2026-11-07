Sub Main(Player as Long)

If StrCmp(GetPlayerUser(Player), "sighh") Then
	If GetPlayerDirection(Player) = Up Then
		PlayerWarp(Player, 1804, 9, 3)
	Else
		PlayerWarp(Player, 1804, 9, 5)
	End If
Else
	PlayerWarp(Player, 1804, 9, 5)
End If

End Sub