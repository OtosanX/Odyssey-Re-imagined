Sub Main(Player as Long)

If StrCmp(GetPlayerUser(Player), "sirspanksalot") Then
	If GetPlayerDirection(Player) = 2 Then
		PlayerWarp(Player, 1782, 3, 7)
	Else
		PlayerWarp(Player, 1782, 5, 7)
	End If
Else
	PlayerWarp(Player, 1782, 5, 7)
End If

End Sub