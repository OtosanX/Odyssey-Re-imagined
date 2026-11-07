Sub Main(Player as Long)

If StrCmp(GetPlayerUser(Player), "dragoons") Then
	If GetPlayerDirection(Player) = 0 Then
		PlayerWarp(Player, 1711, 9, 3)
	Else
		PlayerWarp(Player, 1711, 9, 5)
	End If
Else
	PlayerWarp(Player, 1711, 9, 5)
End If

End Sub