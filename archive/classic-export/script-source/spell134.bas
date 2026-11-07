Sub Main(Player as Long)
Dim Map as Long, X as Long, Y as Long
Dim CalcX as Long, CalcY as Long
Dim Mana as Long, Health as Long, Loop as Long
'Mage Spell - Leech HP

Mana = 40
Map = GetPlayerMap(Player)
X = GetPlayerX(Player)
Y = GetPlayerY(Player)

'Att = GetTileAtt(Map, X, Y)
'Att2 = GetTileAtt2(Map, X, Y)
'| Att = 5 | Att = 6 | Att = 8 | Att = 11 | Att = 13 | Att2 = 5 | Att2 = 6 | Att2 = 11 | Att2 = 13

If Map = 1423 | Map = 1424 | Map = 1425 | Map = 1826 | Map = 1949 | Map = 1828 | Map = 1829 | Map = 982 Then
	PlayerMessage(Player, "You cannot cast that here.", Grey)
	Exit sub
End If



If GetPlayerGuild(Player) = 0 Then
	PlayerMessage(Player, "You must be Guilded to cast this spell.", Grey)
	Exit Sub
End If
If GetPlayerFlag(Player, 23) > 0 Then
	PlayerMessage(Player, "You must wait to cast again.", Grey)
	Exit Sub
End If
If GetPlayerMana(Player) < Mana Then
	PlayerMessage(Player, "You must regenerate before casting.", Grey)
	Exit Sub
End If
	SetPlayerFlag(Player, 23, 1)
	RunScript1("SpellCooldown", Player)
	SetPlayerMana(Player, GetPlayerMana(Player) - Mana)
	CreatePlayerFloatText(Player, "Au Fero!", BrightGreen)
For Loop = 1 To GetMaxUsers()
	If IsPlaying(Loop) Then
		If GetPlayerMap(Loop) = Map Then
			If GetPlayerGuild(Loop) = GetPlayerGuild(Player) Then
				CalcX = Abs(GetPlayerX(Loop) - X)
				CalcY = Abs(GetPlayerY(Loop) - Y)
				If CalcX < 4 & CalcY < 4 Then
					Health = Divide(GetPlayerHP(Loop), 10)
					SetPlayerHP(Loop, GetPlayerHP(Loop) - Health)
					SetPlayerHP(Player, GetPlayerHP(Player) + Health)
					If GetPlayerHP(Player) > GetPlayerMaxHP(Player) Then SetPlayerHP(Player, GetPlayerMaxHP(Player))
					CreateCharacterEffect(GetPlayerMap(Loop), Loop, 51, 40, 8, 0, 0)
				End If
			End If
		End If
	End If
Next Loop

End Sub