Sub Main(Player as Long)

If StrCmp(GetPlayerUser(Player), "smokex") Then
	If GetPlayerDirection(Player) = 0 Then
		PlayerWarp(Player, 348, 8, 2)
	Else
		PlayerWarp(Player, 348, 8, 4)
	End If
Else
	PlayerWarp(Player, 348, 8, 4)
End If

End Sub