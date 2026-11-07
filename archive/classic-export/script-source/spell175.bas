Sub Main(Player as Long)
dim Mana as Long, Map as Long
'Thief Vanish
Mana = 3
Map = GetPlayerMap(Player)

If RunScript1("CheckMap", Player) = 1 Then
	PlayerMessage(Player, "You cannot cast that here.", Grey)
	Exit Sub
End If
If GetPlayerFlag(Player, 23) <> 0 Then
	PlayerMessage(Player, "You must wait to use this ability.", Grey)
	Exit Sub
End If
If HasObj(Player, 407) = 0 Then
	PlayerMessage(Player, "You require Blinding Powder.", Grey)
	Exit Sub
End If
If GetPlayerMana(Player) < Mana Then
	PlayerMessage(Player, "You must regenerate to use this ability.", Grey)
	Exit Sub
End If

TakeObj(Player, 407, 1)
SetPlayerMana(Player, GetPlayerMana(Player) - Mana)
SetPlayerFlag(Player, 23, 1)
	SetPlayerFlag(Player, 21, GetPlayerX(Player))
	SetPlayerFlag(Player, 22, GetPlayerY(Player))
	SetPlayerFlag(Player, 24, GetPlayerMap(Player))
PlayerWarp(Player, 2000, 5, 5)
PlayerWarp(Player, GetPlayerFlag(Player, 24), GetPlayerFlag(Player, 21), GetPlayerFlag(Player, 22))
CreateTileEffect(GetPlayerFlag(Player, 24), GetPlayerFlag(Player, 21), GetPlayerFlag(Player, 22), 31, 1, 8, 1, 0)
RunScript1("SpellCooldown", Player)

End Sub