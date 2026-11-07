Sub Main(Player as Long)

If StrCmp(GetPlayerUser(Player), "Mobsta") Then
	PlayerWarp(Player, 1707, 5, 2)
Else
	PlayerWarp(Player, 1707, 3, 5)
End If

End Sub