Sub Main(Player as Long)

If StrCmp(GetPlayerName(Player), "Grimm") | StrCmp(GetPlayerUser(Player), "soulreaper2") Then
	If GetPlayerDirection(Player) = Up Then
		PlayerWarp(Player, 1986, 10, 1)
	Else
		PlayerWarp(Player, 1986, 10, 3)
	End If
Else
	PlayerWarp(Player, 1986, 10, 3)
End If

End Sub