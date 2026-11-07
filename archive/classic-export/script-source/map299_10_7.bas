Sub Main(Player as Long)

If strcmp(GetPlayerUser(Player), "Maxwellwin") | strcmp(GetPlayerUser(Player), "Shawnee") Then
	PlayerWarp(Player, 299, 10, 9)
Else
	PlayerWarp(Player, 299, 10, 6)
End If
'If strcmp(GetPlayerUser(Player), "Humbhak") Then PlayerWarp(Player, 299, 10, 9)

End Sub