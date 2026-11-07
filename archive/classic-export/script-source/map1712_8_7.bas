Sub Main(Player as Long)

If StrCmp(GetPlayerUser(Player), "dragoons") Then
	If GetPlayerDirection(Player) = 3 Then
		PlayerWarp(Player, 1712, 9, 7)
	Else
		PlayerWarp(Player, 1712, 7, 7)
	End If
Else
	PlayerWarp(Player, 1712, 7, 7)
End If

End Sub