Sub Main(Player as Long)

If StrCmp(GetPlayerUser(Player), "gimli") Then
	If GetPlayerDirection(Player) = Down Then
		PlayerWarp(Player, 1445, 2, 4)
	Else
		PlayerWarp(Player, 1445, 2, 2)
	End If
Else
	PlayerWarp(Player, 1445, 2, 2)
End If

End Sub