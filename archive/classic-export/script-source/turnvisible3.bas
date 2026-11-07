Sub Main(Player as Long)

If GetPlayerFlag(Player, 25) = 1 Then
	SetPlayerFlag(Player, 25, 0)
	If GetPlayerFlag(Player, 27) > 0 Then RunScript1("InvisCooldown", Player)
	If GetPlayerFlag(Player, 19) > 215 Then RunScript1("Sprite", Player) Else SetPlayerSprite(Player, GetPlayerFlag(Player, 19))
		If GetPlayerStatus(Player) = 1 Then Exit Sub
		SetPlayerStatus(Player, GetPlayerFlag(Player, 20))
		If GetPlayerStatus(Player) = 9 Then SetPlayerStatus(Player, 0)
End If

End Sub