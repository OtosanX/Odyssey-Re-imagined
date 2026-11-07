Sub Main(Player as Long)

If strcmp(GetPlayerUser(Player), "william9") Then
'Do Nothing
Else
	If GetPlayerDirection(Player) = Right Then
		PlayerWarp(Player, 706, 1, 9)
	Else
		PlayerWarp(Player, 706, 2, 8)
	End If
End If

End Sub