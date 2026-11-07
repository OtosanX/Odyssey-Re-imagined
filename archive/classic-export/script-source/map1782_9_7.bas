Sub Main(Player as Long)

If StrCmp(GetPlayerUser(Player), "sirspanksalot") Then
	If GetPlayerDirection(Player) = 1 Then
		PlayerWarp(Player, 1782, 9, 8)
	Else
		PlayerWarp(Player, 1782, 9, 6)
	End If
Else
	PlayerWarp(Player, 1782, 9, 6)
End If

End Sub