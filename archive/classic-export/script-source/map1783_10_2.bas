Sub Main(Player as Long)

If StrCmp(GetPlayerUser(Player), "kramew") | StrCmp(GetPlayerName(Player), "Ehrlich") Then
	If GetPlayerDirection(Player) = 1 Then
		PlayerWarp(Player, 1783, 10, 3)
	Else
		PlayerWarp(Player, 1783, 10, 1)
	End If
Else
	PlayerWarp(Player, 1783, 10, 1)
End If

End Sub