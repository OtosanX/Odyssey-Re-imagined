Sub Main(Player as Long)

If StrCmp(GetPlayerUser(Player), "devilmaycry3") Then
	If GetPlayerDirection(Player) = Left Then
		PlayerWarp(Player, 1675, 3, 1)
	Else
		PlayerWarp(Player, 1675, 5, 1)
	End If
Else
	PlayerWarp(Player, 1675, 5, 1)
End If

End Sub