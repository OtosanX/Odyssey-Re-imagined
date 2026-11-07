Sub Main(Player as Long)

If StrCmp(GetPlayerUser(Player), "Mobsta") Then
	If GetPlayerDirection(Player) = 1 Then
		PlayerWarp(Player, 1710, 2, 9)
	Else
		PlayerWarp(Player, 1710, 2, 7)
	End If
Else
	PlayerWarp(Player, 1710, 2, 7)
End If

End Sub