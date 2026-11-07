Sub Main(Player as Long)

If StrCmp(GetPlayerName(Player), "Kyral") Then
	If GetPlayerDirection(Player) = Up Then
		PlayerWarp(Player, 1079, 6, 7)
	Else
		PlayerWarp(Player, 1079, 6, 9)
	End If
Else
	PlayerWarp(Player, 1079, 6, 9)
End If

End Sub