Sub Main(Player as Long)

If StrCmp(GetPlayerUser(Player), "revolution") Then
	If GetPlayerDirection(Player) = Down Then
		PlayerWarp(Player, 1584, 4, 9)
	Else
		PlayerWarp(Player, 1584, 4, 7)
	End If
Else
	PlayerWarp(Player, 1584, 4, 7)
End If

End Sub