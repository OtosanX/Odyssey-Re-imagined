Sub Main(Player as Long)

If StrCmp(GetPlayerUser(Player), "travisabrown") | StrCmp(GetPlayerUser(Player), "jug") Then
	If GetPlayerDirection(Player) = 0 Then
		PlayerWarp(Player, 533, 6, 1)
	Else
		PlayerWarp(Player, 533, 6, 3)
	End If
Else
	PlayerWarp(Player, 533, 6, 3)
End If

End Sub