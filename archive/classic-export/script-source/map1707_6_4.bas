Sub Main(Player as Long)

If StrCmp(GetPlayerUser(Player), "Mobsta") Then
	PlayerWarp(Player, 1707, 6, 2)
Else
	PlayerWarp(Player, 1707, 8, 5)
End If

End Sub