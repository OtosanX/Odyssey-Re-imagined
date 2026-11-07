Sub Main(Player as Long)

If GetPlayerGuild(Player) <> 0 Then
	If GetPlayerHP(Player) <> GetPlayerMaxHP(Player) Then PlayerWarp(Player, 54, 9, 5)
End If

End Sub