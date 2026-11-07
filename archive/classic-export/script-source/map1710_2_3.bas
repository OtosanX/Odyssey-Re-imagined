Sub Main(Player as Long)

If StrCmp(GetPlayerUser(Player), "Mobsta") Then
	If GetPlayerDirection(Player) = 0 Then
		PlayerWarp(Player, 1710, 2, 2)
	Else
		PlayerWarp(Player, 1710, 2, 4)
	End If
Else
	PlayerWarp(Player, 1710, 2, 4)
End If

End Sub