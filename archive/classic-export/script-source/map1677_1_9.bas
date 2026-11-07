Sub Main(Player as Long)

If StrCmp(GetPlayerUser(Player), "Excel") | StrCmp(GetPlayerUser(Player), "Revolutionary77") Then
	If GetPlayerDirection(Player) = Down Then
		PlayerWarp(Player, 1677, 1, 10)
	Else
		PlayerWarp(Player, 1677, 1, 8)
	End If
Else
	PlayerWarp(Player, 1677, 1, 10)
End If

End Sub