Sub Main(Player as Long)
dim Map as Long, X as Long, Y as Long
dim Loop as Long, Mana as Long, Buff as Long
dim CalcX as Long, CalcY as Long
'Cleric Endurance Buff

Map = GetPlayerMap(Player)
X = GetPlayerX(Player)
Y = GetPlayerY(Player)
Mana = Divide(GetPlayerMaxMana(Player), 3) * 2
Buff = 7

If GetTileAtt(Map, X, Y) = 6 | GetTileAtt2(Map, X, Y) = 6 Then
	PlayerMessage(Player, "You may not cast that here.", Grey)
	Exit Sub
End If
If HasObj(Player, 413) = 0 Then
	PlayerMessage(Player, "You require Holy Water to cast.", Grey)
	Exit Sub
End If
If GetPlayerFlag(Player, 28) > 0 Then
	PlayerMessage(Player, "You must wait to cast again.", Grey)
	Exit Sub
End If
If GetPlayerMana(Player) < Mana Then
	PlayerMessage(Player, "You must regenerate to cast again.", Grey)
	Exit Sub
End If

'If HasObj(Player, 413) Then
'	Buff = 14
'	TakeObj(Player, 413, 1)
'End If

CreatePlayerFloatText(Player, "Tu Tela!", BrightGreen)
SetPlayerMana(Player, GetPlayerMana(Player) - Mana)
TakeObj(Player, 413, 1)
SetPlayerFlag(Player, 28, 1)
RunScript1("BuffCooldown", Player)

For Loop = 1 to GetMaxUsers()
	If IsPlaying(Loop) Then
		If Map = GetPlayerMap(Loop) Then
			If GetPlayerClass(Loop) = 4 Then
				CalcX = Abs(GetPlayerX(Loop) - X)
				CalcY = Abs(GetPlayerY(Loop) - Y)
				If CalcX < 4 & CalcY < 4 Then
					If GetPlayerFlag(Player, 16) = 0 Then
						RunScript2("Buff3", Loop, Buff)
					Else
						If GetPlayerGuild(Player) > 0 Then
							If GetPlayerGuild(Player) = GetPlayerGuild(Loop) Then
								RunScript2("Buff3", Loop, Buff)
							End If
						Else
							SetPlayerFlag(Player, 16, 0)
							PlayerMessage(Player, "Your spells have been set to affect everyone.", White)
							RunScript2("Buff3", Loop, Buff)
						End If
					End If
				End If
			End If
		End If
	End If
Next Loop

End Sub