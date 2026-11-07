Sub Main(Player as Long)

If StrCmp(GetPlayerUser(Player), "frankbob") Then
	If GetPlayerDirection(Player) = 0 Then
		PlayerWarp(Player, 1780, 2, 1)
	Else
		PlayerWarp(Player, 1780, 2, 3)
	End If
Else
	PlayerWarp(Player, 1780, 2, 3)
End If

End Sub