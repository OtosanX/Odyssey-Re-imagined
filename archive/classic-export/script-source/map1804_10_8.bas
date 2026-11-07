Sub Main(Player as Long)

If StrCmp(GetPlayerUser(Player), "sighh") Then
	If GetPlayerDirection(Player) = Down Then
		PlayerWarp(Player, 1804, 10, 9)
	Else
		PlayerWarp(Player, 1804, 10, 7)
	End If
Else
	PlayerWarp(Player, 1804, 10, 7)
End If

End Sub