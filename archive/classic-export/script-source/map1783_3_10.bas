Sub Main(Player as Long)

If StrCmp(GetPlayerUser(Player), "kramew") | StrCmp(GetPlayerName(Player), "Ehrlich") Then
	PlayerWarp(Player, 1783, 2, 8)
Else
	PlayerWarp(Player, 1783, 4, 10)
End If

End Sub