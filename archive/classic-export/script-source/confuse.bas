Function Main(Player as Long) AS LONG
Dim Map as Long, X as Long, Y as Long
Dim CalcX as Long, CalcY as Long
Dim Mana as Long, Loop as Long

Mana = 26
Map = GetPlayerMap(Player)
X = GetPlayerX(Player)
Y = GetPlayerY(Player)

If GetPlayerFlag(Player, 23) = 0 Then
	If GetPlayerMana(Player) >= Mana Then
		SetPlayerFlag(Player, 23, 1)
		RunScript1("cooldown", Player)
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
								RunScript1("cooldown", Loop)
								PlayerMessage(Loop, "You become confused!", Grey)
								CreateCharacterEffect(Map, Loop, 21, 40, 8, 0, 0)
							End If
						End If
					End If
				End If
			End If
		Next Loop
	End If
End If

End Function