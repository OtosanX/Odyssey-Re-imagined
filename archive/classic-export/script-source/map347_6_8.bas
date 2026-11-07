Sub Main(Player as Long)

If StrCmp(GetPlayerUser(Player), "blackstar") | StrCmp(GetPlayerUser(Player), "supernova") Then
	If GetPlayerDirection(Player) = 1 Then
		PlayerWarp(Player, 347, 6, 9)
	Else
		PlayerWarp(Player, 347, 6, 7)
	End If
Else
	PlayerWarp(Player, 347, 6, 7)
End If

End Sub