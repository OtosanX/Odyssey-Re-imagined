Sub Main(Player as Long)

If StrCmp(GetPlayerUser(Player), "travisabrown") | StrCmp(GetPlayerUser(Player), "jug") Then
	If GetPlayerDirection(Player) = 1 Then
		PlayerWarp(Player, 533, 9, 6)
	Else
		PlayerWarp(Player, 533, 9, 4)
	End If
Else
	PlayerWarp(Player, 533, 5, 9)
End If

End Sub