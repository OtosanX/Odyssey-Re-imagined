Sub Main(Player as Long)

If strcmp(GetPlayerUser(Player), "william9") Then
'Do Nothing
Else
	If GetPlayerDirection(Player) = Right Then
		PlayerWarp(Player, 706, 6, 9)
	Else
		PlayerWarp(Player, 706, 7, 8)
	End If
End If

End Sub