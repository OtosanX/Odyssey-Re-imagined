Sub Main(Player as Long)

If StrCmp(GetPlayerUser(Player), "blackstar") | StrCmp(GetPlayerUser(Player), "supernova") Then
	If GetPlayerDirection(Player) = 0 Then
		PlayerWarp(Player, 346, 3, 1)
	Else
		PlayerWarp(Player, 346, 3, 3)
	End If
Else
	PlayerWarp(Player, 346, 3, 3)
End If

End Sub