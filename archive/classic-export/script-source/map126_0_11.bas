Sub Main(Player as Long)

If GetPlayerGuild(Player) > 0 Then
	If GetPlayerHP(Player) <> GetPlayerMaxHP(Player) Then
		PlayerWarp(Player, 126, 0, 10)
	End If
End If

End Sub