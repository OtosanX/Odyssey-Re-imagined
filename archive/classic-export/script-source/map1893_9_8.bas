Sub Main(Player as Long)

If strcmp(GetPlayerUser(Player), "awsq") | strcmp(GetPlayerUser(Player), "romeo") Then
'Nothing
Else
	PlayerWarp(Player, 1893, 9, 9)
End If

End Sub