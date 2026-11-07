Sub Main(Player as Long)

If StrCmp(GetPlayerUser(Player), "dragoons") Then
	If GetPlayerDirection(Player) = 0 Then
		PlayerWarp(Player, 1712, 6, 2)
	Else
		PlayerWarp(Player, 1712, 6, 4)
	End If
Else
	PlayerWarp(Player, 1712, 6, 4)
End If

End Sub