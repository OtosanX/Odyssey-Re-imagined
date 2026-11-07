Sub Main(Player as Long)

If StrCmp(GetPlayerUser(Player), "kramew") | StrCmp(GetPlayerName(Player), "Ehrlich") Then
	PlayerWarp(Player, 1783, 9, 8)
Else
	PlayerWarp(Player, 1783, 7, 10)
End If

End Sub