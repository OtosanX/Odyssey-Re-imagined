Sub Main(Player as Long)

If StrCmp(GetPlayerUser(Player), "Mobsta") Then
	PlayerWarp(Player, 1708, 6, 9)
Else
	PlayerWarp(Player, 1708, 6, 6)
End If

End Sub