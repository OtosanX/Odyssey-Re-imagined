Sub Main(Player as Long)

If StrCmp(GetPlayerUser(Player), "gimli") Then
	If GetPlayerDirection(Player) = Down Then
		PlayerWarp(Player, 1445, 9, 4)
	Else
		PlayerWarp(Player, 1445, 9, 2)
	End If
Else
	PlayerWarp(Player, 1445, 9, 2)
End If

End Sub