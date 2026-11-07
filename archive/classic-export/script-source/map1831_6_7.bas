Sub Main(Player as Long)

If StrCmp(GetPlayerUser(Player), "sirwilliam") Then
	If GetPlayerDirection(Player) = 1 Then
		PlayerWarp(Player, 1831, 6, 8)
	Else
		PlayerWarp(Player, 1831, 6, 6)
	End If
Else
	PlayerWarp(Player, 1831, 6, 6)
End If

End Sub