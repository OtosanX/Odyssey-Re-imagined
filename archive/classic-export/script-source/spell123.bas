Function Main(Player as Long) AS LONG
Dim Map as Long, X as Long, Y as Long
Dim CalcX as Long, CalcY as Long
Dim Mana as Long, Loop as Long

Mana = 35
Map = GetPlayerMap(Player)
X = GetPlayerX(Player)
Y = GetPlayerY(Player)

If GetPlayerFlag(Player, 28) > 0 Then
	PlayerMessage(Player, "You must wait to cast again.", Grey)
	Exit Function
End If
If GetPlayerMana(Player) < Mana Then
	PlayerMessage(Player, "You must regenerate before casting.", Grey)
	Exit Function
End If
	SetPlayerFlag(Player, 28, 1)
	RunScript1("BuffCooldown", Player)
	SetPlayerMana(Player, GetPlayerMana(Player) - Mana)
	CreatePlayerFloatText(Player, "Con Fun Dere!", BrightGreen)
For Loop = 1 To GetMaxUsers()
	If IsPlaying(Loop) Then
		If Map = GetPlayerMap(Loop) Then
			If Loop <> Player Then
				CalcX = Abs(GetPlayerX(Loop) - X)
				CalcY = Abs(GetPlayerY(Loop) - Y)
				If CalcX < 4 & CalcY < 4 Then
					If GetPlayerFlag(Loop, 23) = 0 Then
						SetPlayerFlag(Loop, 23, 1)
						SetPlayerFlag(Loop, 27, 1)
						SetPlayerFlag(Loop, 28, 1)
						RunScript1("SpellCooldown", Loop)
						RunScript1("InvisCooldown", Loop)
						RunScript1("BuffCooldown", Loop)
						PlayerMessage(Loop, "You have been silenced!", Grey)
						CreateCharacterEffect(Map, Loop, 21, 40, 8, 0, 0)
					End If
				End If
			End If
		End If
	End If
Next Loop

End Function