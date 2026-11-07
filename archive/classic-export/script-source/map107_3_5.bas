Sub Main(Player as Long)

If GetPlayerGuild(Player) <> 0 Then
	If GetPlayerHP(Player) <> GetPlayerMaxHP(Player) Then PlayerWarp(Player, 107, 3, 6)
End If

End Sub