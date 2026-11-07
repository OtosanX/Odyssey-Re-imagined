Sub Main(Player as Long)

If GetPlayerFlag(Player, 25) = 1 Then
	SetPlayerFlag(Player, 25, 0)
	SetPlayerFlag(Player, 27, 1)
	SetPlayerFlag(Player, 29, 0)
	RunScript1("InvisCooldown", Player)
	If GetPlayerFlag(Player, 19) > 215 Then RunScript1("Sprite", Player) Else SetPlayerSprite(Player, GetPlayerFlag(Player, 19))
	If GetPlayerStatus(Player) = 1 Then Exit Sub
	SetPlayerStatus(Player, GetPlayerFlag(Player, 20))
	If GetPlayerStatus(Player) = 9 Then
		If GetPlayerFlag(Player, 10) = 0 Then
			SetPlayerStatus(Player, 0)
			SetPlayerFlag(Player, 20, 0)
		End If
	End If
End If

End Sub