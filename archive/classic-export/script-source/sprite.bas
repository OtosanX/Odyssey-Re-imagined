Function Main(Player as Long) AS LONG

If GetPlayerAccess(Player) = 0 Then
'Status
	If GetPlayerStatus(Player) > 2 Then SetPlayerStatus(Player, 0)
'Sprite
	If GetPlayerGuild(Player) > 0 Then
		SetPlayerSprite(Player, GetGuildSprite(GetPlayerGuild(Player)))
	Else
		SetPlayerSprite(Player, 0)
	End If
End If

'SetPlayerSprite(Player, GetPlayerFlag(Player, 132))
'If GetPlayerStatus(Player) <> 1 Then SetPlayerStatus(Player, GetPlayerFlag(Player, 133))

RunScript1("sprite2", Player)

End Function