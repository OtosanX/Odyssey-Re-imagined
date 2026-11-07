Sub Main(Player as Long)

If strcmp(GetPlayerUser(Player), "Garrot") | StrCmp(GetPlayerUser(Player), "Calvin") Then
	If GetPlayerDirection(Player) = Left Then
		PlayerWarp(Player, 1182, 4, 5)
	Else
		PlayerWarp(Player, 1182, 6, 5)
	End If
Else
	PlayerWarp(Player, 1182, 6, 5)
End If

End Sub