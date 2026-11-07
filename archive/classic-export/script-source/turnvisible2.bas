Sub Main(Player as Long)

If GetPlayerFlag(Player, 25) = 1 Then
	SetPlayerStatus(Player, GetPlayerFlag(Player, 20))
	If GetPlayerFlag(Player, 23) = 1 Then RunScript1("cooldown", Player)
	SetPlayerFlag(Player, 25, 0) 
	SetPlayerSprite(Player, 0)
	If GetPlayerFlag(Player, 19) > 215 Then RunScript1("Sprite", Player) Else SetPlayerSprite(Player, GetPlayerFlag(Player, 19))
		If GetPlayerStatus(Player) = 1 Then Exit Sub
		SetPlayerStatus(Player, GetPlayerFlag(Player, 20))
		If GetPlayerStatus(Player) = 9 Then SetPlayerStatus(Player, 0)
End If

End Sub