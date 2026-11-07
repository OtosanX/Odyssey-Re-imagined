Sub Main(Player As Long)
dim Mana as Long
'Mage - Lesser Invis
Mana = 30

If GetPlayerMap(Player) = 305 Then
	PlayerMessage(Player, "You cant cast that here.", Grey)
	Exit Sub
End If
If GetPlayerFlag(Player, 25) <> 0 Then
	PlayerMessage(Player, "You are already hidden.", Grey)
	Exit Sub
End If
If GetPlayerFlag(Player, 27) <> 0 Then
	PlayerMessage(Player, "You must wait to cast again.", Grey)
	Exit Sub
End If
If GetPlayerHP(Player) <> GetPlayerMaxHP(Player) Then
	PlayerMessage(Player, "You need full Health to cast this spell.", Grey)
	Exit Sub
End If
If HasObj(Player, 408) = 0 Then
	PlayerMessage(Player, "You require Nightfall Dust.", Grey)
	Exit Sub
End If
If GetPlayerMana(Player) < Mana Then
	PlayerMessage(Player, "You must regenerate before casting.", Grey)
	Exit Sub
End If

SetPlayerFlag(Player, 27, 1)
SetPlayerFlag(Player, 25, 1)
SetPlayerMana(Player, GetPlayerMana(Player) - Mana)
TakeObj(Player, 408, 1)
	SetPlayerFlag(Player, 19, GetPlayerSprite(Player))
	SetPlayerFlag(Player, 20, GetPlayerStatus(Player))
	SetPlayerFlag(Player, 21, GetPlayerX(Player))
	SetPlayerFlag(Player, 22, GetPlayerY(Player))
SetPlayerStatus(Player, 9)
SetPlayerSprite(Player, 255)
	Timer(Player, 1, "Invis1")
	Timer(Player, 14, "TurnVisible")

End Sub