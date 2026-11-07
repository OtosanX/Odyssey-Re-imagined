Sub Main(Player as Long)
dim Map as Long, X as Long, Y as Long
dim CalcX as Long, CalcY as Long
dim Mana as Long, Loop as Long
'Cleric Redemption

Map = GetPlayerMap(Player)
X = GetPlayerX(Player)
Y = GetPlayerY(Player)
Mana = 50

If HasObj(Player, 411) = 0 Then
	PlayerMessage(Player, "You require a Living Essence to cast this spell.", Grey)
	Exit Sub
End If
If GetPlayerHP(Player) > Divide(GetPlayerMaxHP(Player), 5) Then
	PlayerMessage(Player, "You must be below 20% health to cast this spell.", White)
	Exit Sub
End If
If GetPlayerMana(Player) < Mana Then
	PlayerMessage(Player, "You must regenerate before casting.", Grey)
	Exit Sub
End If

SetPlayerFlag(Player, 207, 1)
PlayerMessage(Player, "You draw from the power of the essence.", White)
CreateCharacterEffect(Map, Player, 20, 40, 8, 0, 0)

End Sub