Sub Main(Player as Long)

If GetPlayerGuild(Player) > 0 Then
	If GetPlayerHP(Player) <> GetPlayerMaxHP(Player) Then
		PlayerWarp(Player, 17, 1, 1)
	End If
End If

End Sub