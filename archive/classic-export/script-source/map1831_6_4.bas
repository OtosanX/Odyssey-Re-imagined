Sub Main(Player as Long)

If StrCmp(GetPlayerUser(Player), "sirwilliam") Then
	If GetPlayerDirection(Player) = 0 Then
		PlayerWarp(Player, 1831, 6, 3)
	Else
		PlayerWarp(Player, 1831, 6, 5)
	End If
Else
	PlayerWarp(Player, 1831, 6, 5)
End If

End Sub