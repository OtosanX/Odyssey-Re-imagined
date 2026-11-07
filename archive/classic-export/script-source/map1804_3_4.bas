Sub Main(Player as Long)

If strcmp(GetPlayerUser(Player), "Jew") | StrCmp(GetPlayerUser(Player), "sighh") Then
	If GetPlayerDirection(Player) = Up Then
		PlayerWarp(Player, 1804, 3, 3)
	Else
		PlayerWarp(Player, 1804, 3, 5)
	End If
Else
	PlayerWarp(Player, 1804, 3, 5)
End If

End Sub