Sub Main(Player as Long)
dim Mana as Long
'Thief Stealth
Mana = 15
If RunScript1("CheckMap", Player) = 1 Then
	PlayerMessage(Player, "You cannot cast that here.", Grey)
	Exit Sub
End If
If GetPlayerMap(Player) = 305 Then
	PlayerMessage(Player, "You cannot do that here.", Grey)
	Exit Sub
End If
If GetPlayerFlag(Player, 25) <> 0 Then
	PlayerMessage(Player, "You are already hidden.", Grey)
	Exit Sub
End If
If GetPlayerFlag(Player, 27) <> 0 Then
	PlayerMessage(Player, "You must wait to use this ability.", Grey)
	Exit Sub
End If
If GetPlayerHP(Player) <> GetPlayerMaxHP(Player) Then
	PlayerMessage(Player, "You need full Health to use this ability.", Grey)
	Exit Sub
End If
If GetPlayerMana(Player) < Mana Then
	PlayerMessage(Player, "You must regenerate to use this ability.", Grey)
	Exit Sub
End If

SetPlayerFlag(Player, 25, 1)
SetPlayerFlag(Player, 27, 1)
SetPlayerMana(Player, GetPlayerMana(Player) - Mana)
	SetPlayerFlag(Player, 19, GetPlayerSprite(Player))
	SetPlayerFlag(Player, 20, GetPlayerStatus(Player))
	SetPlayerFlag(Player, 21, GetPlayerX(Player))
	SetPlayerFlag(Player, 22, GetPlayerY(Player))
	SetPlayerStatus(Player, 9)
	SetPlayerSprite(Player, 255)
CreateTileEffect(GetPlayerMap(Player), GetPlayerX(Player), GetPlayerY(Player), 57, 40, 8, 0, 0)
If GetPlayerFlag(Player, 29) = 0 Then
	Timer(Player, 4, "TurnVisible")
Else
	Timer(Player, 8, "TurnVisible")
End If
Timer(player, 1, "Invis2")

End Sub