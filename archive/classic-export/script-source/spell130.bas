Function Main(Player as Long) AS LONG
dim Map as Long, X as Long, Y as Long, CalcX as Long, CalcY as Long
dim Mana as Long, Loop as Long, Att as Long, Att2 as Long
'Mage Guild Warp

Mana = 45
Map = GetPlayerMap(Player)
X = GetPlayerX(Player)
Y = GetPlayerY(Player)
Att = GetTileAtt(Map, X, Y)
Att2 = GetTileAtt2(Map, X, Y)

If Map = 1423 | Map = 1424 | Map = 1425 | Map = 1826 | Map = 1949 | Map = 1828 | Map = 1829 | Map = 982 | Att = 5 | Att = 6 | Att = 8 | Att = 11 | Att = 13 | Att2 = 5 | Att2 = 6 | Att2 = 11 | Att2 = 13 Then
	PlayerMessage(Player, "You cannot cast that here.", Grey)
	Exit Function
End If

If GetPlayerGuild(Player) > 0 Then
	If GetPlayerFlag(Player, 23) = 0 Then
		If GetPlayerMana(Player) >= Mana Then
			SetPlayerMana(Player, GetPlayerMana(Player) - Mana)
			SetPlayerFlag(Player, 23, 1)
			RunScript1("SpellCooldown", Player)
			CreatePlayerFloatText(Player, "Gek Ommen!", BrightGreen)
			CreateCharacterEffect(Map, Player, 12, 40, 8, 0, 0)
			For Loop = 1 To GetMaxUsers()
				If Loop <> Player Then
					If GetPlayerGuild(Loop) = GetPlayerGuild(Player) Then
						If GetPlayerMap(Loop) = Map Then
							CalcX = Abs(X - GetPlayerX(Loop))
							CalcY = Abs(Y - GetPlayerY(Loop))
							
							If CalcX < 3 & CalcY < 3 Then
								CreateTileEffect(GetPlayerMap(Loop), GetPlayerX(Loop), GetPlayerY(Loop), 12, 40, 8, 0, 0)
								PlayerWarp(Loop, Map, X, Y)
								PlayerMessage(Loop, strcat("You have been warped to ", GetPlayerName(Player)), White)
							End If
						End If
					End If
				End If
			Next Loop
		Else
			PlayerMessage(Player, "You must regenerate before casting.", Grey)
		End If
	Else
		PlayerMessage(Player, "You must wait to cast again.", Grey)
	End If
Else
	PlayerMessage(Player, "You must be in a guild to cast this spell.", Grey)
End If

End Function