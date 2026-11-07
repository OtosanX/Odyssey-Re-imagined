Sub Main(Player as Long)
Dim Map as Long, X as Long, Y as Long
Dim CalcX as Long, CalcY as Long
Dim Mana as Long, Loop as Long
'Mage Spell - Clandestine

Mana = 35
Map = GetPlayerMap(Player)
X = GetPlayerX(Player)
Y = GetPlayerY(Player)

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
	CreatePlayerFloatText(Player, "Noctem!", BrightGreen)
For Loop = 1 To GetMaxUsers()
	If IsPlaying(Loop) Then
		If Map = GetPlayerMap(Loop) Then
			If GetPlayerClass(Loop) = 3 Then
				CalcX = Abs(GetPlayerX(Loop) - X)
				CalcY = Abs(GetPlayerY(Loop) - Y)
				If CalcX < 4 & CalcY < 4 Then
					SetPlayerFlag(Loop, 29, 1)
					PlayerMessage(Loop, strcat(GetPlayerName(Player), " has improved your stealth."), White)
					CreateCharacterEffect(Map, Loop, 21, 40, 8, 0, 0)
				End If
			End If
		End If
	End If
Next Loop

End Sub