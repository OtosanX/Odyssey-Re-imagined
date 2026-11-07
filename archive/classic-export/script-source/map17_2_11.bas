Sub Main(Player as Long)

If GetPlayerGuild(Player) > 0 Then
	If GetPlayerHP(Player) <> GetPlayerMaxHP(Player) Then
		PlayerWarp(Player, 17, 2, 10)
	End If
End If

End Sub