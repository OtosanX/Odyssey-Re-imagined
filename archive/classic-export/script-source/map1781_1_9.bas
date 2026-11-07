Sub Main(Player as Long)

If StrCmp(GetPlayerUser(Player), "jew") Then
	If GetPlayerDirection(Player) = 1 Then
		PlayerWarp(Player, 1781, 1, 10)
	Else
		PlayerWarp(Player, 1781, 1, 8)
	End If
Else
	PlayerWarp(Player, 1781, 1, 8)
End If

End Sub