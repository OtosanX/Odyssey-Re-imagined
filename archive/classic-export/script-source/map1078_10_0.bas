Sub Main(Player as Long)

If strcmp(GetPlayerUser(Player), "SoulReaper") Then
	PlayerWarp(Player, 1078, 6, 9)
Else
	PlayerWarp(Player, 1078, 10, 3)
End If

End Sub