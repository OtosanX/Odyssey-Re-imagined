Sub Main(Player as Long)
dim Map as Long, X as Long, Y as Long
dim Loop as Long, Mana as Long, Health as Long
dim CalcX as Long, CalcY as Long

Map = GetPlayerMap(Player)
X = GetPlayerX(Player)
Y = GetPlayerY(Player)
Mana = Divide(GetPlayerMaxMana(Player), 3) * 2
Health = GetPlayerDamage(Player) - Divide((GetPlayerStrength(Player) + 2), 5)

If GetTileAtt(Map, X, Y) = 6 | GetTileAtt2(Map, X, Y) = 6 Then
	PlayerMessage(Player, "You may not cast that here.", Grey)
	Exit Sub
End If
If GetPlayerMana(Player) < Mana Then
	PlayerMessage(Player, "You must regenerate to cast again.", Grey)
	Exit Sub
End If

CreatePlayerFloatText(Player, "Ave Maria!", BrightGreen)
SetPlayerMana(Player, GetPlayerMana(Player) - Mana)

For Loop = 1 to GetMaxUsers()
	If IsPlaying(Loop) Then
		If GetPlayerClass(Loop) <> 4 Then
			If Map = GetPlayerMap(Loop) Then
				If Player <> Loop Then
					CalcX = Abs(GetPlayerX(Loop) - X)
					CalcY = Abs(GetPlayerY(Loop) - Y)
					If CalcX < 4 & CalcY < 4 Then
						If GetPlayerFlag(Player, 16) = 0 Then
							RunScript2("heal1", Loop, Health)
						Else
							If GetPlayerGuild(Player) > 0 Then
								If GetPlayerGuild(Player) = GetPlayerGuild(Loop) Then
									RunScript2("heal1", Loop, Health)
								End If
							Else
								SetPlayerFlag(Player, 16, 0)
								PlayerMessage(Player, "Your spells have been set to affect everyone.", White)
								RunScript2("heal1", Loop, Health)
							End If
						End If
					End If
				End If
			End If
		End If
	End If
Next Loop

End Sub