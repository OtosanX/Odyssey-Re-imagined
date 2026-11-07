Sub Main(Player as Long)
dim Map as Long, X as Long, Y as Long, Mana as Long

Mana = 20
Map = GetPlayerMap(Player)
X = GetPlayerX(Player)
Y = GetPlayerY(Player)
If RunScript1("CheckMap", Player) = 1 Then
	PlayerMessage(Player, "You cannot cast that here.", Grey)
	Exit Sub
End If
If GetPlayerFlag(Player, 23) <> 0 Then
	PlayerMessage(Player, "You must wait to cast again.", Grey)
	Exit Sub
End If
If HasObj(Player, 407) = 0 Then
	PlayerMessage(Player, "You require Blinding Powder.", Grey)
	Exit Sub
End If
If GetPlayerMana(Player) < Mana Then
	PlayerMessage(Player, "You must regenerate before casting.", Grey)
	Exit Sub
End If

SetPlayerMana(Player, GetPlayerMana(Player) - Mana)
TakeObj(Player, 407, 1)
SetPlayerFlag(Player, 23, 1)
RunScript1("SpellCooldown", Player)
	CreateTileEffect(Map,X,Y,10,100,8,0,0)
	PlayerWarp(Player, 2000, 5, 5)
	PlayerWarp(Player, Map, X, Y)
	PlayCustomWav(Player, 13)
	CreatePlayerFloatText(Player, "Min Ex!", BrightGreen)

End Sub