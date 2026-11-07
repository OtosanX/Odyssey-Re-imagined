Sub Main(Player as Long)

If StrCmp(GetPlayerUser(Player), "jew") Then
	If GetPlayerDirection(Player) = 0 Then
		PlayerWarp(Player, 1781, 9, 3)
	Else
		PlayerWarp(Player, 1781, 9, 5)
	End If
Else
	PlayerWarp(Player, 1781, 9, 5)
End If

End Sub