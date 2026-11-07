Sub Main(Player as Long)

If StrCmp(GetPlayerUser(Player), "Mobsta") Then
	PlayerWarp(Player, 1708, 5, 9)
Else
	PlayerWarp(Player, 1708, 5, 6)
End If

End Sub