Sub Main(Player as Long)

If strcmp(GetPlayerUser(Player), "Jew")  | StrCmp(GetPlayerUser(Player), "sighh") Then
	If GetPlayerDirection(Player) = Down Then
		PlayerWarp(Player, 1804, 1, 9)
	Else
		PlayerWarp(Player, 1804, 1, 7)
	End If
Else
	PlayerWarp(Player, 1804, 1, 7)
End If

End Sub