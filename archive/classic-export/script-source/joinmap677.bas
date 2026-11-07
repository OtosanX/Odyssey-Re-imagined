Function Main(Player as Long) AS LONG

'CTF
If GetPlayerGuild(Player) > 0 Then
	SetPlayerGuild(Player, 0)
End If

End Function