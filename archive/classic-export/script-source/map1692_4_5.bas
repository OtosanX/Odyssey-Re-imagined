Sub Main(Player as Long)
dim Gate as Long
Gate = 0

If strcmp(GetPlayerUser(Player), "brandon") Then Gate = 1
If strcmp(GetPlayerUser(Player), "wish") Then Gate = 1
If strcmp(GetPlayerUser(Player), "jeromeb") Then Gate = 1
If strcmp(GetPlayerUser(Player), "awsq") Then Gate = 1
'If strcmp(GetPlayerUser(Player), "captainmarco") Then Gate = 1

If Gate = 1 Then
	PlayerWarp(Player, 1692, 5, 5)
Else
	PlayerWarp(Player, 1692, 3, 5)
End If

End Sub