Sub Main(Player as Long)

If strcmp(GetPlayerUser(Player), "william9") Then
'Do Nothing
Else
	If GetPlayerDirection(Player) = Left Then
		PlayerWarp(Player, 706, 10, 9)
	Else
		PlayerWarp(Player, 706, 9, 8)
	End If
End If

End Sub